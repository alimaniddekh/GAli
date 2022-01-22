<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="Dashboard.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">MANID <sup>2</sup></div>
            </a>
        
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
        
            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="Dashboard.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>
        
            <!-- Divider -->
            <hr class="sidebar-divider">
        
            <!-- Nav Item - Machine -->
            <li class="nav-item">
                <a class="nav-link" href="Machine.jsp">
                    <i class="fas fa-desktop"></i>
                    <span>Gestion Machine</span></a>
            </li>
        
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Salle -->
            <li class="nav-item">
                <a class="nav-link" href="Salle.jsp">
                    <i class="fas fa-door-open"></i>
                    <span>Gestion Salle</span></a>
            </li>
        
            <!-- Divider -->
            <hr class="sidebar-divider">
			
            <!-- Nav Item - Users -->
            <li id="gu" class="nav-item">
                <a class="nav-link" href="Users.jsp">
                    <i class="fa fa-user"></i>
                    <span>Gestion D'utilisateur</span></a>
            </li>
        
            <!-- Divider -->
        
            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        
        </ul>
        <%int hid =(int) session.getAttribute("id");
			if(hid==0){
			%>
			<script>
        		document.getElementById("gu").style.display="none";
			</script>
			<%}%>
        