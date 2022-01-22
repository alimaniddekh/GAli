<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@page import="service.MachineService"%>
<%@page import="service.SalleService"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Dashboard</title>

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

	<%
	String uid = (String) session.getAttribute("user");
	if (uid == null) {
	%>
	<jsp:forward page="login.jsp" />
	<%
	} else {
	//out.println(" <h1>You have successfully created the Session of User : " +uid+"</h1>");
	}
	%>





	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@include file="template/sidebar.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@include file="template/topbar.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

					</div>
					<%
					MachineService ms = new MachineService();
					SalleService ss = new SalleService();
					int tt = ss.CountSalle();
					int t = ms.CountMachine();
					%>
					<div class="row">
						<!-- Page cards -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												Nombre de Machine</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><%=t%></div>
										</div>
										<div class="col-auto">
											<i class="fas fa-desktop fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												Nombre de Salle</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><%=tt%></div>
										</div>
										<div class="col-auto">
											<i class="fas fa-door-open fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- CHART -->
					<%
					Gson gsonObj = new Gson();
					Map<Object, Object> map = null;
					List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
					String dataPoints = null;

					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection connection = DriverManager.getConnection("jdbc:mysql://yy3ul2t1rm7wowg0:f15d5zoj7lk2mq3z@kutnpvrhom7lki7u.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/oci53e6lelq9xrqh", "root", "");
						Statement statement = connection.createStatement();
						String xVal, yVal;

						ResultSet resultSet = statement.executeQuery(
						"select count(*) as 'Nombre', s.code as 'salle' from salle s,machine m where s.id=m.idsalle group by s.code;");

						while (resultSet.next()) {
							xVal = resultSet.getString("salle");
							yVal = resultSet.getString("Nombre");
							map = new HashMap<Object, Object>();
							map.put("label",xVal);
							map.put("y", Integer.parseInt(yVal));
							list.add(map);
							dataPoints = gsonObj.toJson(list);
						}
						connection.close();
					} catch (SQLException e) {
						out.println(
						"<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
						dataPoints = null;
					}
					%>
					<!-- Content Row -->
					<div id="chartContainer" style="height: 370px; width: 100%;"></div>
					<br>
					<hr>
					<script type="text/javascript">
					window.onload = function() { 
						 
						<%if (dataPoints != null) {%>
						var chart = new CanvasJS.Chart("chartContainer", {
							axisY: {
							      title: "Nombre Machine",
							    },
							    axisX: {
							    	title: "Salle",
							    	valueFormatString: 'String',
							      },
							animationEnabled: true,
							theme:"light",
							title: {
								text: "Nombre de Machine Par Salle"
							},
							data: [{
								type: "column", //change type to bar, line, area, pie, etc
								dataPoints:<%out.print(dataPoints);%>
							}]
						});
						chart.render();
					<%}%> 
 
}
</script>

					<!-- Content Row -->
					<div class="text-center">
						<h2>Machine entre deux Date</h2>
					</div>

					<div class="form-group row">
						<div class="col-sm-6 mb-3 mb-sm-0">
							<input required type="date"
								class="form-control form-control-user" name="mdate" id="mdate1">
						</div>
						<div class="col-sm-6 mb-3 mb-sm-0">
							<input required type="date"
								class="form-control form-control-user" name="mdate" id="mdate2">
						</div>
					</div>
					<div class="text-center">
						<button type="button" class="btn btn-primary btn-user"
							onclick="valider()">Valider</button>
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
									</tr>
								</thead>
								<tbody id="machine">

								</tbody>
							</table>
						</div>
					</div>



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

		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
		
		function valider(){
			let dateAchat1 = $("#mdate1").val();
			let dateAchat2 = $("#mdate2").val();
			if(dateAchat1 !="" && dateAchat2 !=""){
				$.ajax({
			   		   url:"MachineController",
			   		   type:"POST",
			   		   data:{
			   			    op:"valider",
			   				dateAchat1:dateAchat1,
			   				dateAchat2:dateAchat2
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
			 			</tr>`;
			   	  		}
			   	  		$("#machine").html(ligne);
			           } 
			   		 
			   		});
			}
		}
			
		</script>
</body>

</html>
