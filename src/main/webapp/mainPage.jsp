<%@ page import="com.example.smartnet.initialization.Storage" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.smartnet.service.StorageService" %>
<%@ page import="com.example.smartnet.initialization.User" %>
<%@ page import="com.example.smartnet.service.UserService" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: mr_morrison
  Date: 2/20/2023
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <style>
        .header {
            position: fixed; /* set the header to a fixed position */
            top: 0; /* position the header at the top of the container */
            background-color: white; /* add a background color */
            width: auto;
        }
    </style>


</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav  sidebar sidebar-dark accordion" id="accordionSidebar"
        style="background-color: rgb(53, 64, 82)">
        <a href="mainPage.jsp"><img src="src/image/Logo.png" alt="Logo" width="209"></a>
        <!-- Sidebar - Brand -->


        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="storageHistory.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Storage History</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Interface
        </div>

        <!-- Nav Item - Pages Collapse Menu -->

        <li class="nav-item">

            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse1"
               aria-expanded="true" aria-controls="collapse1">
                <i class="fas fa-fw fa-cog"></i>
                <%
                    String header2 = null;
                    if (request.getParameter("productType") == null) {
                        header2 = "Product List";
                    } else {
                        if (request.getParameter("productType").equals("null")) {
                            header2 = "Product List";
                        } else {
                            List<Storage> storage = StorageService.getAllStorage("SELECT * FROM Storage WHERE ProductType = '" + request.getParameter("productType") + "' AND Status != 'Out of stock';");
                            header2 = request.getParameter("productType") + " " + storage.size();
                        }
                    }

                %>
                <span>Product Types</span>
            </a>
            <div id="collapse1" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Custom Components:</h6>
                    <%
                        ArrayList<String> products = StorageService.selectDistincts();
                        for (int i = 0; i < products.size(); i++) {

                    %>
                    <a class="collapse-item" href="mainPage.jsp?productType=<%=products.get(i)%>"><%=products.get(i)%>
                    </a>
                    <%
                        }
                    %>
                </div>
            </div>
        </li>


    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand  topbar mb-4 static-top shadow"
                 style="background-color: rgb(53, 64, 82); height: auto">

                <!-- Sidebar Toggle (Topbar) -->
                <form class="form-inline">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                </form>

                <!-- Topbar Search -->
                </form>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <!-- Nav Item - Alerts -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-bell fa-fw h2"></i>
                            <!-- Counter - Alerts -->
                            <span class="badge badge-danger badge-counter">3+</span>
                        </a>
                    </li>
                    <%
                        HttpSession httpSession = request.getSession();
                        String name = (String) httpSession.getAttribute("name");
                        String surname = (String) httpSession.getAttribute("Surname");


                    %>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-light h5"><%=name%> <%=surname%></span>
                            <img class="img-profile rounded-circle" style="height: 50px; width: auto"
                                 src="img/undraw_profile.svg">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Profile
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                Settings
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item"   data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">


                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-2">
                        <h6 class="m-0 font-weight-bold text-primary"><%=header2%>
                        </h6>
                        <%
                            if (request.getParameter("seeAll") == null) {
                        %>
                        <a href="mainPage.jsp?existing=true&seeAll=true&productType=<%=request.getParameter("productType")%>">See
                            All</a>
                        <%
                            }
                            if (request.getParameter("existing") != null) {
                                if (request.getParameter("existing").equals("true")) {
                        %>
                        <a href="mainPage.jsp?productType=<%=request.getParameter("productType")%>">See Existing</a>
                        <%
                                }
                            }
                        %>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered " id="dataTable" width="100%" cellspacing="0">
                                <thead class="" id="model">
                                <%--                                Product type - VendorName - Serial Number -  Part Number - Description - Storage Name - Income Date - Status  - income - outgoing - reserve                                <tr>--%>
                                <th>Numeration</th>
                                <th>Vendor Name</th>
                                <th>Product Type</th>
                                <th>Serial Number</th>
                                <th>Part Number</th>
                                <th>Description</th>
                                <th>Storage Name</th>
                                <th>Income Date</th>
                                <th>Status</th>
                                <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>

                                <%
                                    String script = null;

                                    if (request.getParameter("productType") == null && request.getParameter("seeAll") == null) {
                                        script = "Select *From Storage";
                                    }

                                    if (request.getParameter("productType") != null && request.getParameter("seeAll") == null) {
                                        if (request.getParameter("productType").equals("null")) {
                                            script = "Select * From Storage WHERE Status != 'Out of stock';";
                                        } else {
                                            script = "SELECT * FROM Storage WHERE ProductType = '" + request.getParameter("productType") + "' AND Status != 'Out of stock';";
                                        }
                                    }
                                    if (request.getParameter("productType") != null && request.getParameter("seeAll") != null) {
                                        if (request.getParameter("productType").equals("null")) {
                                            script = "Select * From Storage;";
                                        } else {
                                            script = "SELECT * FROM Storage WHERE ProductType = '" + request.getParameter("productType") + "';";
                                        }
                                    }

                                    List<Storage> storage = StorageService.getAllStorage(script);
                                    for (int i = 0; i < storage.size(); i++) {
                                %>

                                <tr>
                                    <td><%=i + 1%>
                                    </td>
                                    <td><%=storage.get(i).getVendorName()%>
                                    </td>
                                    <td><%=storage.get(i).getProductType()%>
                                    </td>
                                    <td><%=storage.get(i).getSerialNumber()%>
                                    </td>
                                    <td><%=storage.get(i).getPartNumber()%>
                                    </td>
                                    <td><%=storage.get(i).getDescription()%>
                                    </td>
                                    <td><%=storage.get(i).getStorageName()%>
                                    </td>
                                    <td><%=storage.get(i).getIncomeDate()%>
                                    </td>
                                    <td><%=storage.get(i).getStatus()%>
                                    </td>
                                    <td><a id="<%=storage.get(i).getProductId()%>" name="hiddenObject" style="text-decoration:none" href="#" data-toggle="modal" data-target="#exampleModal" >Action</a></td>
                                </tr>
                                <%
                                    }
                                %>
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
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" id="logout" href="#">Logout</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <form action="update.jsp" method="get">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Add Product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="row" >
                <div class="col text-center">
                    <select id="selectAction" style="width: 200px;">
                        <OPTION>Select Item</OPTION>
                        <option>Add New</option>
                        <option>Reserve</option>
                        <option>Export</option>
                    </select>
                </div>
            </div>
            <div class="row" id="selectorRow"  >
                <div class="col text-center">
                    <label id="labelText">Error</label>
                    <input  id="inputText" type="text">
                </div>
            </div>
            <div class="row" id="selectorRow2"  >
                <div class="col text-center">
                    <label id="labelText2">Income Date</label>
                    <input  id="inputText2"  type="date">
                </div>
            </div>
            <div class="row" id="selectorRow3"  >
                <div class="col text-center">
                    <label id="labelText3">Storage Name</label>
                    <input  id="inputText3"  type="text">
                </div>
            </div>

            <div class="hiddenDiv" style="display: none">
                <input id="hiddenInputUid" name="uid" >
            </div>
                <div class="row">
                    <div class="col">
                        <div class="modal-footer">
                            <button type="button" class="btn text-white" data-dismiss="modal" style="background-color: #1c294e">Close</button>
                            <button type="submit" class="btn text-white" style="background-color: #0f6848">Save changes</button>
                        </div>
                    </div>
                </div>
        </div>
    </div>
    </form>
</div>




<script>
    const fruitSelect = document.querySelector('#selectAction');
    const selectorRow = document.querySelector('#selectorRow');
    const selectorRow2 = document.querySelector('#selectorRow2');
    const selectorRow3 = document.querySelector('#selectorRow3');
    const labelText = document.querySelector('#labelText');
    const inputText = document.querySelector('#inputText');
    const inputText2 = document.querySelector('#inputText2');
    const inputText3 = document.querySelector('#inputText3');
    const hiddenInputUid = document.querySelector('#hiddenInputUid');
    const logout = document.querySelector('#logout');

    selectorRow.style.display = "none";
    selectorRow2.style.display = "none";
    selectorRow3.style.display = "none";


    // Get all cookies
    const cookies = document.cookie.split(";");

    // Loop through each cookie and set its expiration date to the past
    for (let i = 0; i < cookies.length; i++) {
        const cookie = cookies[i];
        const eqPos = cookie.indexOf("=");
        const name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
    }


    document.addEventListener('click', function(event) {
        console.log(event.target.id)
        if (event.target.name==="hiddenObject"){
        hiddenInputUid.value = event.target.id;
        }
    });

    logout.addEventListener('click', function(event) {
        localStorage.clear();
        window.open('index.jsp', '_self');


    });
    fruitSelect.addEventListener('change', (event) => {
        const selectedAction = event.target.value;
        if (selectedAction === "Select Item"){
            selectorRow.style.display = "none";
            selectorRow2.style.display = "none";
            selectorRow3.style.display = "none";

        }
        if (selectedAction === "Add New"){
            selectorRow.style.display = "flex";
            selectorRow2.style.display = "flex";
            selectorRow3.style.display = "flex";
            labelText.innerText="Serial Number"
            inputText.type = "text";
            inputText.name = 'addNew';
            inputText2.name = 'addIncomeDate';
            inputText3.name = 'storageName';
        }
        if (selectedAction === "Reserve"){
            selectorRow2.style.display = "none";
            selectorRow.style.display = "flex";
            labelText.innerText="Write Reserve Date"
            inputText.type = "date";
            inputText.name = 'reserve';
        }
        if (selectedAction === "Export"){
            selectorRow2.style.display = "none";
            selectorRow.style.display = "flex";
            labelText.innerText="Write Where Are You Exporting"
            inputText.type = "text";
            inputText.name = 'export';
        }

    });




    window.onscroll = function () {
        myFunction()
    };

    function myFunction() {
        var navbar = document.getElementById("model");
        if (window.pageYOffset >= 190) {
            navbar.classList.add("header");
        } else {
            navbar.classList.remove("header");
        }
    }
</script>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="js/demo/datatables-demo.js"></script>

</body>

</html>
