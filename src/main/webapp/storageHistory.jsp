<%@ page import="com.example.smartnet.initialization.Storage" %>
<%@ page import="com.example.smartnet.service.StorageService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.smartnet.initialization.StorageHistory" %><%--
  Created by IntelliJ IDEA.
  User: mr_morrison
  Date: 2/21/2023
  Time: 4:46 PM
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
                    String header2 = "Product History";
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
                        String position = (String) httpSession.getAttribute("position");


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
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Activity Log
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
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
                        <a href="#" data-toggle="modal"
                           data-target="#dataRange">Set Range</a>
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
                                <th>part Number</th>
                                <th>Storage Name</th>
                                <th>Income Date</th>
                                <th>Operation Date</th>
                                <th>Operator Name</th>
                                <th>Operation Type</th>
                                </tr>
                                </thead>
                                <tbody>

                                <%
                                    String script = "";
                                    if (request.getParameter("selectByDate") == null) {
                                        script = "Select * From StorageHistory WHERE operatorName='"+name+" "+surname+"';";
                                    }else {
                                        script = "SELECT * FROM StorageHistory WHERE operationDate >= '"+request.getParameter("firstDate")+"' AND operationDate <= '"+request.getParameter("secondDate")+"' And  operatorName='"+name + " " + surname+"'";
                                    }

                                    List<StorageHistory> storage = StorageService.getStorageHistory(script);
                                    for (int i = 0; i < storage.size(); i++) {
                                %>

                                <tr>
                                    <td><%=i + 1%>
                                    </td>
                                    <td><%=storage.get(i).getVendorName()%>
                                    </td>
                                    <td><%=storage.get(i).getProductType()%>
                                    </td>
                                    <td><%=storage.get(i).getSerialNUmber()%>
                                    </td>
                                    <td><%=storage.get(i).getPartNumber()%>
                                    </td>
                                    <td><%=storage.get(i).getStorageName()%>
                                    </td>
                                    <td><%=storage.get(i).getIncomeDate()%>
                                    </td>
                                    <td><%=storage.get(i).getOperationDate()%>
                                    </td>
                                    <td><%=storage.get(i).getOperatorName()%>
                                    </td>
                                    <td>
                                            <%=storage.get(i).getOperationName()%>
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
<div class="modal fade" id="dataRange" tabindex="-1" role="dialog" aria-labelledby="dataRange"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="container py-4">
                    <div class="row">
                        <div class="col text-center">
                            <label>First From</label>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col text-center">
                            <input id="firsDate" name="firsDate"  type="date">
                        </div>
                    </div>
                    <br>
                    <div class="row ">
                        <div class="col text-center">
                            <label>Start From</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col text-center">
                            <input id="secondDate" name="firsDate"  type="date">
                        </div>
                    </div>
                    <div class="row" style="display: none">
                        <div class="col text-center">
                            <p id="result">Result</p>
                        </div>
                    </div>
                    <div class="row text-center py-4">
                        <div class="col ">
                            <a class="btn btn-primary py-2" href="storageHistory.jsp" type="submit">Clean Sort</a>
                            <button class="btn btn-primary py-2" id="submit" type="submit">Submit</button>

                        </div>


                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
<script>
    const logout = document.querySelector('#logout');
    logout.addEventListener('click', function (event) {
        sessionStorage.clear();
        localStorage.clear();
        window.open('index.jsp', '_self');
    });

    const inputElement1 = document.getElementById('firsDate');
    const inputElement2 = document.getElementById('secondDate');
    const result = document.getElementById('result');
    const submitButton = document.getElementById('submit');


    // inputElement1.addEventListener('input', (event) => {
    //     const inputValue = event.target.value;
    //     let finalResult = inputValue + " <-> ";
    //     result.textContent = finalResult;
    //
    // });
    // inputElement2.addEventListener('input', (event) => {
    //     const inputValue = event.target.value;
    //     let finalResult = result.textContent;
    //     finalResult = finalResult + inputValue;
    //     result.textContent = finalResult;
    // });
    submitButton.addEventListener('click', function () {
        const inputValue = inputElement1.value;
        const inputValue2 = inputElement2.value
        const send = '?firstDate=' + inputValue + '&secondDate=' + inputValue2 + '&selectByDate=true'
        window.open('storageHistory.jsp' + send + '', '_self');
    });

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
