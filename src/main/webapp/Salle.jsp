<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Salle</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">


	<!-- Page Wrapper -->
	<div id="wrapper">

		<%@include file="template/sidebar.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@include file="template/topbar.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<div class="p-5">

						
							<div class="form-group row">
								<div class="col-sm-6 mb-3 mb-sm-0">
									<input type="text" class="form-control form-control-user"
										id="code" placeholder="Code">
								</div>
								<div class="col-sm-6">
									<input type="text" class="form-control form-control-user"
										id="type" placeholder="Type">
								</div>
							</div>
							<div class="text-center" id="add">
								<button type="button" class="btn btn-primary btn-user" onclick="add();">Ajouter</button>
							</div>
							<div class="text-center" id="mod">
								<button type="button" class="btn btn-primary btn-user" onclick="modifier();">Modifier</button>
							</div>
						<hr>

						<div class="container">
							<div class="col-sm-12">
								<table class="table table-bordered dataTable" id="dataTable"
									width="100%" cellspacing="0" role="grid"
									aria-describedby="dataTable_info" style="width: 100%;">
									<thead>
										<tr role="row">
											<th class="sorting sorting_asc" tabindex="0"
												aria-controls="dataTable" rowspan="1" colspan="1"
												aria-sort="ascending"
												aria-label="Name: activate to sort column descending"
												style="width: 57px;">ID</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Position: activate to sort column ascending"
												style="width: 61px;">Code</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Office: activate to sort column ascending"
												style="width: 49px;">Type</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Office: activate to sort column ascending"
												style="width: 49px;">Action</th>
										</tr>
									</thead>
									<tbody id="salle">
										
									</tbody>
								</table>
							</div>
						</div>

					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->
		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<%@include file="template/Logout.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
    $(document).ready(function() {
  	  
		$.ajax({
	  		   url:"SalleController",
	  		   type:"POST",
	  		   data:{
	  			   op:"load"
	  		   },
	  		   success:function(data){
	  			 console.log(data);
	  			let ligne = "";
	  	  		for(let i = 0; i < data.length; i++){
	  	  	
	  	  			ligne+=`<tr class="odd">
						<td class="sorting_1">`+data[i].id+`</td>
						<td>`+data[i].code+`</td>
						<td>`+data[i].type+`</td>
						<td><a href="javascript:;" onclick="recuperer(this);"
							class="text-secondary font-weight-bold text-xs"
							data-toggle="tooltip"> Modifier </a> <a href="javascript:;" onclick="deleteSalle(this);"
							class="text-secondary font-weight-bold text-xs"
							data-toggle="tooltip"> Supprimer </a></td>
					</tr>`;
	  	  		}
	  	  		$("#salle").html(ligne);
		  	  	
	  		   
	          } 
	  		   
	  		});
	});
    
    let id = -1;
    
    
    function add(){
  	let code = $("#code").val();
  	let type = $("#type").val();
  	  $.ajax({
  		url:"SalleController",
		   type:"POST",
		   data:{
			   code:code,
			   type:type
		   },
		   success:function(data){
			 console.log(data);
   			let ligne = "";
   	  		for(let i = 0; i < data.length; i++){
   	  	
   	  		ligne+=`<tr class="odd">
				<td class="sorting_1">`+data[i].id+`</td>
				<td>`+data[i].code+`</td>
				<td>`+data[i].type+`</td>
				<td><a href="javascript:;" onclick="recuperer(this);"
					class="text-secondary font-weight-bold text-xs"
					data-toggle="tooltip"> Modifier </a> <a href="javascript:;"
					onclick="deleteSalle(this);" class="text-secondary font-weight-bold text-xs"
					data-toggle="tooltip"> Supprimer </a></td>
			</tr>`;
   	  		}
   	  		$("#salle").html(ligne);
  	  	  	
   		   
           } 
   		 
   		});
  	  $("#code").val("")
  	  $("#type").val("")
  	 
    }
    
    function recuperer(x){
  		id = parseInt((x.parentNode.parentNode.cells[0].innerText));
  		
  		let code = x.parentNode.parentNode.cells[1].innerText;
  		let type = x.parentNode.parentNode.cells[2].innerText; 
  		$("#code").val(code);
  		$("#type").val(type);
  		$("#mod").show();
  		$("#add").hide();

  	}
	
	function modifier()
	{
  		let code = $("#code").val();
  		let type = $("#type").val();

  		if(code!=""&& type!="")
  		{
  			$.ajax({
   	  		   url:"SalleController",
   	  		   type:"POST",
   	  		   data:{
   	  			   op:"update",
   	  			   id:id,
   	  			   code:code,
   	  			   type:type
   	  		   },
   	  		success:function(data){
  	  			let ligne = "";
  	 	  		for(let i = 0; i < data.length; i++){
  	 	  	
  	 	  		ligne+=`<tr class="odd">
  					<td class="sorting_1">`+data[i].id+`</td>
  					<td>`+data[i].code+`</td>
  					<td>`+data[i].type+`</td>
  					<td><a href="javascript:;" onclick="recuperer(this);"
  						class="text-secondary font-weight-bold text-xs"
  						data-toggle="tooltip"> Modifier </a> <a href="javascript:;"
  						onclick="deleteSalle(this);" class="text-secondary font-weight-bold text-xs"
  						data-toggle="tooltip"> Supprimer </a></td>
  				</tr>`;
  	 	  		}
  	 	  		$("#salle").html(ligne);
  		  	  	
            	}
  	  		});
  		  $("#code").val("")
  		  $("#type").val("")
  		}
  		
  		$("#add").show();
  		$("#mod").hide();
	}
	
	
	function deleteSalle(x){
  		let ids = parseInt((x.parentNode.parentNode.cells[0].innerText));

  		$.ajax({
	  		   url:"SalleController",
	  		   type:"POST",
	  		   data:{
	  			   op:"delete",
	  			   id:ids
	  		   },
	  		   success:function(data){
	  			 let ligne = "";
	  	 	  		for(let i = 0; i < data.length; i++){
	  	 	  	
	  	 	  		ligne+=`<tr class="odd">
	  					<td class="sorting_1">`+data[i].id+`</td>
	  					<td>`+data[i].code+`</td>
	  					<td>`+data[i].type+`</td>
	  					<td><a href="javascript:;" onclick="recuperer(this);"
	  						class="text-secondary font-weight-bold text-xs"
	  						data-toggle="tooltip"> Modifier </a> <a href="javascript:;"
	  						onclick="deleteSalle(this);" class="text-secondary font-weight-bold text-xs"
	  						data-toggle="tooltip"> Supprimer </a></td>
	  				</tr>`;
	  	 	  		}
	  	 	  		$("#salle").html(ligne);
         	}
	  		   
	  		   
	  		});
  		$("#add").show();
  		$("#mod").hide();
  	}
	
	$("#add").show();
	$("#mod").hide();
    </script>

</body>

</html>