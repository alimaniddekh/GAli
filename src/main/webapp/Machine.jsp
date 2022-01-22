<%@page import="beans.Machine"%>
<%@page import="service.MachineService"%>
<%@page import="beans.Salle"%>
<%@page import="service.SalleService"%>
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

<title>Machine</title>

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
					<h1>Gestion Des Machines</h1>
					<br>

					<div class="p-5">

						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<input type="text" class="form-control form-control-user"
									id="ref" placeholder="Reference">
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control form-control-user"
									id="marque" placeholder="Marque">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<input required type="date"
									class="form-control form-control-user" name="mdate" id="mdate">
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control form-control-user"
									id="prix" placeholder="Prix">
							</div>
						</div>

						<div class="form-group text-center my-auto">
							<label>Salle :</label> <select class="form-select" id="salle">

							</select>
						</div>
						<br>

						<div class="text-center" id="add">
							<button type="button" class="btn btn-primary btn-user"
								onclick="add()">Ajouter</button>
						</div>
						<div class="text-center" id="mod">
							<button type="button" class="btn btn-primary btn-user"
								onclick="modifier()">Modifier</button>
						</div>
						<hr>
						

						<div class="row">
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
												style="width: 61px;">Reference</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Office: activate to sort column ascending"
												style="width: 49px;">Marque</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Age: activate to sort column ascending"
												style="width: 31px;">Date D'achat</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Start date: activate to sort column ascending"
												style="width: 68px;">Prix</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Salary: activate to sort column ascending"
												style="width: 67px;">Salle</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1" style="width: 67px;">Action</th>
										</tr>
									</thead>
									<tbody id="machine">

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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>

	 function add(){
		 	let reference = $("#ref").val();
	 	  	let marque = $("#marque").val();
	 	  	let prix = $("#prix").val();
	 	  	let dateAchat = $("#mdate").val();
	 	  	let salle=$("#salle").val();
		  	  $.ajax({
		   		   url:"MachineController",
		   		   type:"POST",
		   		   data:{
		   			   reference:reference,
		   			   marque:marque,
		   			   dateAchat:dateAchat,
		   			   prix:prix,
		   			   salle:salle
		   		   },
		   		   success:function(data){
		   			 console.log(data);
		   			let ligne = "";
		   	  		for(let i = 0; i < data.length; i++){
		   	  		ligne+=`<tr class="odd">
		 				<td class="sorting_1">`+data[i].id+`</td>
		 				<td>`+data[i].reference+`</td>
		 				<td>`+data[i].marque+`</td>
		 				<td>`+data[i].dateAchat+`</td>
		 				<td>`+data[i].prix+`</td>
		 				<td>`+data[i].salle.code+`</td>
		 				<td><a href="javascript:;" onclick="recuperer(this)"
		 					class="text-secondary font-weight-bold text-xs"
		 					data-toggle="tooltip"> Modifier </a> <a href="javascript:;" onclick="deleteSalle(this)"
		 					class="text-secondary font-weight-bold text-xs"
		 					data-toggle="tooltip"> Supprimer </a></td>
		 			</tr>`;
		   	  		}
		   	  		$("#machine").html(ligne);
		           } 
		   		 
		   		});
	 	  	  $("#ref").val("")
	 	  	  $("#marque").val("")
	 	  	  $("#prix").val("")
		  	 
		    }
	 
    $(document).ready(function() {
		$.ajax({
	  		   url:"MachineController",
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
	 				<td>`+data[i].reference+`</td>
	 				<td>`+data[i].marque+`</td>
	 				<td>`+data[i].dateAchat+`</td>
	 				<td>`+data[i].prix+`</td>
	 				<td>`+data[i].salle.code+`</td>
	 				<td><a href="javascript:;" onclick="recuperer(this)"
	 					class="text-secondary font-weight-bold text-xs"
	 					data-toggle="tooltip"> Modifier </a> <a href="javascript:;" onclick="deleteSalle(this)"
	 					class="text-secondary font-weight-bold text-xs"
	 					data-toggle="tooltip"> Supprimer </a></td>
	 			</tr>`;
	  	  		}
	  	  		$("#machine").html(ligne);
	          }
	  		});
		
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
	  	  			ligne+=`<option value=`+data[i].id+` >`+data[i].code+`</option>`;
	  	  		}
	  	  		$("#salle").html(ligne);
	          } 
		});
		$("#mod").hide();
  		$("#add").show();
  		
  		
		
	});
    
    function recuperer(x){
  		id = parseInt((x.parentNode.parentNode.cells[0].innerText));
  		
  		let ref = x.parentNode.parentNode.cells[1].innerText;
  		let marque = x.parentNode.parentNode.cells[2].innerText; 
  		let prix = x.parentNode.parentNode.cells[4].innerText;
  		
  		let sdate = x.parentNode.parentNode.cells[3].innerText;
 	    let now = new Date(sdate);
 	   let today = now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + now.getDate();
        if(now.getDate() < 10)
 	   {
 		    today = now.getFullYear() + '-' + (now.getMonth() + 1) + '-' +'0'+now.getDate();
 	   } 
        if(now.getMonth() < 10)
 	   {
 		    today = now.getFullYear() + '-' +'0'+ (now.getMonth() + 1) + '-' +now.getDate();
 	   } 
 	   if(now.getMonth() < 10 && now.getDate() < 10)
 	   {
 		    today = now.getFullYear() + '-' +'0'+ (now.getMonth() + 1) + '-' +'0'+now.getDate();
 	   }  

        $("#mdate").val(today);
  		$("#ref").val(ref);
  		$("#marque").val(marque);
  		$("#prix").val(prix);
  		$("#mod").show();
  		$("#add").hide();

  	}
    
    function modifier()
	{
    	let reference = $("#ref").val();
 	  	let marque = $("#marque").val();
 	  	let prix = $("#prix").val();
 	  	let dateAchat = $("#mdate").val();
 	  	let salle=$("#salle").val();

  		if(reference!="" && marque!="" && prix!="")
  		{
  			$.ajax({
   	  		   url:"MachineController",
   	  		   type:"POST",
   	  		   data:{
   	  			   id:id,
   	  			   reference:reference,
	   			   marque:marque,
	   			   dateAchat:dateAchat,
	   			   prix:prix,
	   			   salle:salle
   	  		   },
   	  		success:function(data){
  	  			let ligne = "";
  	 	  		for(let i = 0; i < data.length; i++){
  	 	  	
  	 	  		ligne+=`<tr class="odd">
					<td class="sorting_1">`+data[i].id+`</td>
					<td>`+data[i].reference+`</td>
					<td>`+data[i].marque+`</td>
					<td>`+data[i].dateAchat+`</td>
					<td>`+data[i].prix+`</td>
					<td>`+data[i].salle.code+`</td>
					<td><a href="javascript:;" onclick="recuperer(this)"
						class="text-secondary font-weight-bold text-xs"
						data-toggle="tooltip"> Modifier </a> <a href="javascript:;" onclick="deleteSalle(this)"
						class="text-secondary font-weight-bold text-xs"
						data-toggle="tooltip"> Supprimer </a></td>
				</tr>`;
  	 	  		}
  	 	  		$("#machine").html(ligne);
  		  	  	
            	}
  	  		});
  			$("#ref").val("")
	 	  	$("#marque").val("")
	 	  	$("#prix").val("")
  		}
  		
  		$("#add").show();
  		$("#mod").hide();
	}
    
    function deleteSalle(x){
  		let ids = parseInt((x.parentNode.parentNode.cells[0].innerText));
  		$.ajax({
	  		   url:"MachineController",
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
							<td>`+data[i].reference+`</td>
							<td>`+data[i].marque+`</td>
							<td>`+data[i].dateAchat+`</td>
							<td>`+data[i].prix+`</td>
							<td>`+data[i].salle.code+`</td>
							<td><a href="javascript:;" onclick="recuperer(this)"
								class="text-secondary font-weight-bold text-xs"
								data-toggle="tooltip"> Modifier </a> <a href="javascript:;" onclick="deleteSalle(this)"
								class="text-secondary font-weight-bold text-xs"
								data-toggle="tooltip"> Supprimer </a></td>
						</tr>`;
	  	 	  		}
	  	 	  		$("#machine").html(ligne);    
         	}
	  		});
  		$("#add").show();
  		$("#mod").hide();
  	}
    </script>

</body>

</html>