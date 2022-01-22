<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Utilisateur</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>

<body id="page-top">

	<%
	int hide = (int) session.getAttribute("id");
	if (hide == 0) {
	%>
	<jsp:forward page="Dashboard.jsp" />
	<%
	}
	%>
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
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4">Gestion des Comptes</h1>
						</div>
						<div>
							<select id="type" class="custom-select">
								<option value="1" selected>ADMIN</option>
								<option value="0" >MODERTEUR</option>
							</select>

						</div><br>
						<div class="">
							<input type="text" class=" form-control form-control-user"
								id="username" placeholder="Full Name">
						</div>
						<br>
						<div class="form-group">
							<input type="email" class="form-control form-control-user"
								id="Email" placeholder="Email Address">
						</div>
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<input type="password" class="form-control form-control-user"
									id="password" placeholder="Password">
							</div>
							<div class="col-sm-6">
								<input type="password" class="form-control form-control-user"
									id="passwordc" placeholder="Repeat Password">
							</div>
						</div>
						<div class="text-center" id="add">
							<button type="button" class="btn btn-primary btn-user"
								onclick="add()">Ajouter</button>
						</div>
						<div class="text-center" id="mod">
							<button type="button" class="btn btn-primary btn-user"
								onclick="modifier()">Modifier</button>
						</div>
						<div class="row">
							<div class="" id="active">
								<button type="button" class="btn btn-primary btn-user"
									onclick="Activer()">Activer</button>
							</div>
							<div class="" id="desactive">
								<button type="button" class="btn btn-primary btn-user"
									onclick="Desactiver()">Desactiver</button>
							</div>
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
												style="width: 61px;">Nom D'ultilisateur</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Office: activate to sort column ascending"
												style="width: 49px;">Email</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Office: activate to sort column ascending"
												style="width: 49px;">Satut</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Office: activate to sort column ascending"
												style="width: 49px;">Action</th>
										</tr>
									</thead>
									<tbody id="user">

									</tbody>
								</table>
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
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
			integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
			integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
			crossorigin="anonymous"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
			integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
			crossorigin="anonymous"></script>

		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
		<%String user = (String) session.getAttribute("user");%>
		let user="<%=user%>";
		function Activer(){
			$.ajax({
	   	  		   url:"UserController",
	   	  		   type:"POST",
	   	  		   data:{
	   	  			   op:"activer",
	   	  			   id:id,
	   	  			   username:user
	   	  		   },
	   	  		success:function(data){
	  	  			let ligne = "";
	  	 	  		for(let i = 0; i < data.length; i++){
	  	 	  	
	  	 	  		ligne+=`<tr class="odd">
	                    <td class="sorting_1">`+data[i].id+`</td>
	                    <td>`+data[i].username+`</td>
	                    <td>`+data[i].mail+`</td>
	                    <td>`+data[i].status+`</td>
	                    <td>
	                        <a href="javascript:;" onclick="recuperer(this)" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip">
	                            Select 
	                          </a>
	                          <a href="javascript:;" onclick="deleteSalle(this);" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip">
	                            Supprimer
	                          </a>
	                    </td>
	                    </tr>`;
	  	 	  		}
	  	 	  		$("#user").html(ligne);
	  		  	  	
	            	}
	  	  		});
		}
		
		function Desactiver(){
			$.ajax({
	   	  		   url:"UserController",
	   	  		   type:"POST",
	   	  		   data:{
	   	  			   op:"desactiver",
	   	  			   id:id,
	   	  			   username:user
	   	  		   },
	   	  		success:function(data){
	  	  			let ligne = "";
	  	 	  		for(let i = 0; i < data.length; i++){
	  	 	  	
	  	 	  		ligne+=`<tr class="odd">
	                    <td class="sorting_1">`+data[i].id+`</td>
	                    <td>`+data[i].username+`</td>
	                    <td>`+data[i].mail+`</td>
	                    <td>`+data[i].status+`</td>
	                    <td>
	                        <a href="javascript:;" onclick="recuperer(this)" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip">
	                            Select 
	                          </a>
	                          <a href="javascript:;" onclick="deleteSalle(this);" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip">
	                            Supprimer
	                          </a>
	                    </td>
	                    </tr>`;
	  	 	  		}
	  	 	  		$("#user").html(ligne);
	  		  	  	
	            	}
	  	  		});
		}
		
		
    $(document).ready(function() {
		$.ajax({
	  		   url:"UserController",
	  		   type:"POST",
	  		   data:{
	  			   op:"load",
	  			   username:user
	  		   },
	  		   success:function(data){
	  			 console.log(data);
	  			let ligne = "";
	  	  		for(let i = 0; i < data.length; i++){
	  	  	
	  	  			ligne+=`<tr class="odd">
                        <td class="sorting_1">`+data[i].id+`</td>
                        <td>`+data[i].username+`</td>
                        <td>`+data[i].mail+`</td>
                        <td>`+data[i].status+`</td>
                        <td>
                            <a href="javascript:;" onclick="recuperer(this)" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip">
                                Select 
                              </a>
                              <a href="javascript:;" onclick="deleteSalle(this);" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip">
                                Supprimer
                              </a>
                        </td>
                        </tr>`;
	  	  		}
	  	  		$("#user").html(ligne);
	          }
	  		});
		$("#add").show();
  		$("#mod").hide();
  		$("#active").hide();
  		$("#desactive").hide();
  		
  		
	});
    
    let id = -1;
    
    
    function add(){
    let type=$("#type").val();
  	let username = $("#username").val();
  	let mail = $("#Email").val();
  	let password =$("#password").val();
  	let passwordc =$("#passwordc").val();
  	
  	if(username!="" && mail!="" && password!="" && passwordc!=""){
  		if(password==passwordc){
  			$.ajax({
  		  		url:"UserController",
  				   type:"POST",
  				   data:{
  					   username:username,
  					   mail:mail,
  					   password:password,
  					   usernamee:user,
  					   type:type
  				   },
  				   success:function(data){
  					 console.log(data);
  		   			let ligne = "";
  		   	  		for(let i = 0; i < data.length; i++){
  		   	  	
  		   	  		ligne+=`<tr class="odd">
                        <td class="sorting_1">`+data[i].id+`</td>
                        <td>`+data[i].username+`</td>
                        <td>`+data[i].mail+`</td>
                        <td>`+data[i].status+`</td>
                        <td>
                            <a href="javascript:;" onclick="recuperer(this)" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip">
                                Select 
                              </a>
                              <a href="javascript:;" onclick="deleteSalle(this);" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip">
                                Supprimer
                              </a>
                        </td>
                        </tr>`;
  		   	  		}
  		   	  		$("#user").html(ligne);
  		  	  	  	
  		   		   
  		           } 
  		   		 
  		   		});
  		}else{
  			alert("Password Faild!!");
  		}
  	}
  	 
    }
    
    function recuperer(x){
  		id = parseInt((x.parentNode.parentNode.cells[0].innerText));
  		
  		let username = x.parentNode.parentNode.cells[1].innerText;
  		let mail = x.parentNode.parentNode.cells[2].innerText; 
  		let status = parseInt((x.parentNode.parentNode.cells[3].innerText));
  		
  		if(status==0){
  			$("#active").show();
  	  		$("#desactive").hide();
  		}else{
  			$("#active").hide();
  	  		$("#desactive").show();
  		}
  		
  		$("#username").val(username);
  		$("#Email").val(mail);
  		$("#mod").show();
  		$("#add").hide();

  	}
	
	function modifier()
	{
		let username = $("#username").val();
	  	let mail = $("#Email").val();
	  	let password =$("#password").val();
	  	let passwordc =$("#passwordc").val();

  		if(username!="" && mail!="" && password!="" && passwordc!="")
  		{
  			if(password==passwordc){
  			$.ajax({
   	  		   url:"UserController",
   	  		   type:"POST",
   	  		   data:{
   	  			   op:"update",
   	  			   id:id,
   	  			   username:username,
				   mail:mail,
				   password:password,
				   usernamee:user
   	  		   },
   	  		success:function(data){
  	  			let ligne = "";
  	 	  		for(let i = 0; i < data.length; i++){
  	 	  	
  	 	  		ligne+=`<tr class="odd">
                    <td class="sorting_1">`+data[i].id+`</td>
                    <td>`+data[i].username+`</td>
                    <td>`+data[i].mail+`</td>
                    <td>`+data[i].status+`</td>
                    <td>
                        <a href="javascript:;" onclick="recuperer(this)" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip">
                            Select 
                          </a>
                          <a href="javascript:;" onclick="deleteSalle(this);" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip">
                            Supprimer
                          </a>
                    </td>
                    </tr>`;
  	 	  		}
  	 	  		$("#user").html(ligne);
  		  	  	
            	}
  	  		});
  		  $("#username").val("")
  		  $("#Email").val("")
  		  $("#password").val("")
  		  $("#passwordc").val("")
  			}
  		}
  		
  		$("#add").show();
  		$("#mod").hide();
	}
	
	
	function deleteSalle(x){
  		let ids = parseInt((x.parentNode.parentNode.cells[0].innerText));

  		$.ajax({
	  		   url:"UserController",
	  		   type:"POST",
	  		   data:{
	  			   op:"delete",
	  			   id:ids,
	  			   username:user
	  		   },
	  		   success:function(data){
	  			 let ligne = "";
	  	 	  		for(let i = 0; i < data.length; i++){
	  	 	  	
	  	 	  		ligne+=`<tr class="odd">
                        <td class="sorting_1">`+data[i].id+`</td>
                        <td>`+data[i].username+`</td>
                        <td>`+data[i].mail+`</td>
                        <td>`+data[i].status+`</td>
                        <td>
                            <a href="javascript:;" onclick="recuperer(this)" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip">
                                Select 
                              </a>
                              <a href="javascript:;" onclick="deleteSalle(this);" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip">
                                Supprimer
                              </a>
                        </td>
                        </tr>`;
	  	 	  		}
	  	 	  		$("#user").html(ligne);
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