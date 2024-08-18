<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <style>
    

       

        .pacifico-regular {
            font-family: "Pacifico", cursive;
            font-weight: 400;
            font-style: normal;
        }

        body {
            margin: 0;
            padding: 0;
        }

        
        .sidebarbtn {
            background-color: rgb(199, 9, 9);
            color: red ! important;
        }
        .offcanvas-custom {
            width: 290px ! important;
            background-color: rgb(247, 240, 240);
        }
        .butt:hover {
            background-color:orange;
            color: white;
        }
        .iconcolor {
            color: black;
        }
        .activedashboard{
         background-color:  rgb(101 7 139);
         color:white;'
        }
        .activedashboard:hover 
        {
        background-color:  rgb(101 7 139);
         color:white;
        }
    </style>
</head>
	
<body>
  <%
  System.out.println(session.getAttribute("role"));
  System.out.println(session.getAttribute("adminName"));
  %>
    <c:if test="${empty sessionScope.role or empty sessionScope.adminName or sessionScope.role != 'admin'}">
    <c:redirect url="login.jsp"/>
</c:if>
   
		<div class="container-fluid pt-3">
        <div class="row">
            <div class="col-2">

            </div>
		<div class="col-8 bg-light">
            <h1 class="text-center text-dark pb-2 me-0  pt-2 mb-4 mt-0 ps-4 " style="font-family:'pacifico';"><i class="material-symbols-outlined me-2" style="font-size:36px;">
                dashboard
            </i>Admin Dashboard</h1>
         </div>
		<div class="col-2  ms-0 ">
            <div class="text-center me-3 mt-2" >
                <button class="btn" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample"
                        aria-controls="offcanvasExample"><i class="bi bi-arrow-right-circle text-dark" style="font-size:21px"></i></button>
            </div>
		</div>
		</div>
		</div>

		<section id="dashboard">
			<div class="container mt-4">

				<div class="row d-flex justify-content-between mt-1">

					<div class="col-12 col-md-3 pe-0 ps-0 px-5 mb-0"
						style="background-color: rgb(12, 1, 19); border: 2px; box-shadow: 17px 17px 15px #463b3d;">
						<div class="d-flex align-items-center justify-content-between">
							<div class="">
								<h2 class="text-white ms-5 mt-2" style="font-weight: bold;">4</h2>
								<h5 class="text-light ms-5 mt-3">Total Accounts</h5>
							</div>
							<div class="text-end me-1">
								<img class="img-fluid mt-4 me-3"
									style="max-width: 59%; height: auto;"
									src="images/acccardimg.png" alt="">
							</div>
						</div>
						<div class="pb-0 ps-0 pe-0 mt-3 mb-0">
							<p class="mb-0 text-center mx-auto text-light  pb-2 mb-0"
								style="background-color: rgb(12, 1, 19); border: 2px;">More
								info</p>
						</div>
					</div>

					<!-- 2nd card -->
					<div class="col-12 col-md-3 pe-0 ps-0 px-5 mb-0"
						style="background-color: rgb(12, 1, 19); border: 2px; box-shadow: 17px 17px 15px #463b3d;">
						<div class="d-flex align-items-center justify-content-between">
							<div class="">
								<h2 class="text-white ms-5 mt-2" style="font-weight: bold;">15</h2>
								<h5 class="text-light ms-5 mt-3">Total Transactions</h5>
							</div>
							<div class="text-end me-1">
								<img class="img-fluid mt-4 me-3"
									style="max-width: 59%; height: auto;"
									src="images/transimage.png" alt="">
							</div>
						</div>
						<div class="pb-0 ps-0 pe-0 mt-3 mb-0 pt-3">
							<p class="mb-0 text-center mx-auto text-light  pb-2 mb-0"
								style="background-color: rgb(12, 1, 19); border: 2px;">More
								info</p>
						</div>
					</div>

					<!-- 3rd card -->
					<div class="col-12 col-md-3 pe-0 ps-0 px-5 mb-0"
						style="background-color: rgb(12, 1, 19); border: 2px; box-shadow: 17px 17px 15px #463b3d;">
						<div class="d-flex align-items-center justify-content-between">
							<div class="">
								<h2 class="text-white ms-5 mt-2" style="font-weight: bold;">5</h2>
								<h5 class="text-light ms-5 mt-3">Total Customers</h5>
							</div>
							<div class="text-end me-1">
								<img class="img-fluid mt-4 me-3"
									style="max-width: 59%; height: auto;"
									src="images/customers.png" alt="">
							</div>
						</div>
						<div class="pb-0 ps-0 pe-0 mt-3 mb-0">
							<p class="mb-0 text-center mx-auto text-light  pb-2 mb-0"
								style="background-color: rgb(12, 1, 19); border: 2px;">More
								info</p>
						</div>
					</div>
				</div>



				<div class="row d-flex justify-content-between mt-5">
					<div class="col-12 col-md-3 pe-0 ps-0 px-5 mb-0"
						style="background-color: rgb(12, 1, 19); border: 2px; box-shadow: 17px 17px 15px #463b3d;">
						<div class="d-flex align-items-center justify-content-between">
							<div class="">
								<h2 class="text-white ms-5 mt-2" style="font-weight: bold;">4</h2>
								<h5 class="text-light ms-5 mt-3">Total Accounts</h5>
							</div>
							<div class="text-end me-1">
								<img class="img-fluid mt-4 me-3"
									style="max-width: 59%; height: auto;"
									src="images/acccardimg.png" alt="">
							</div>
						</div>
						<div class="pb-0 ps-0 pe-0 mt-3 mb-0">
							<p class="mb-0 text-center mx-auto text-light  pb-2 mb-0"
								style="background-color: rgb(12, 1, 19); border: 2px;">More
								info</p>
						</div>
					</div>

					<!-- 2nd card -->
					<div class="col-12 col-md-3 pe-0 ps-0 px-5 mb-0"
						style="background-color: rgb(12, 1, 19); border: 2px; box-shadow: 17px 17px 15px #463b3d;">
						<div class="d-flex align-items-center justify-content-between">
							<div class="">
								<h2 class="text-white ms-5 mt-2" style="font-weight: bold;">9</h2>
								<h5 class="text-light ms-5 mt-3">Total Credits</h5>
							</div>
							<div class="text-end me-1">
								<img class="img-fluid mt-4 me-3"
									style="max-width: 59%; height: auto;"
									src="images/transimage.png" alt="">
							</div>
						</div>
						<div class="pb-0 ps-0 pe-0 mt-3 mb-0 pt-3">
							<p class="mb-0 text-center mx-auto text-light  pb-2 mb-0"
								style="background-color: rgb(12, 1, 19); border: 2px;">More
								info</p>
						</div>
					</div>

					<!-- 3rd card -->
					<div class="col-12 col-md-3 pe-0 ps-0 px-5 mb-0"
						style="background-color: rgb(12, 1, 19); border: 2px; box-shadow: 17px 17px 15px #463b3d;">
						<div class="d-flex align-items-center justify-content-between">
							<div class="">
								<h2 class="text-white ms-5 mt-2" style="font-weight: bold;">7</h2>
								<h5 class="text-light ms-5 mt-3">Total Debits</h5>
							</div>
							<div class="text-end me-1">
								<img class="img-fluid mt-4 me-3"
									style="max-width: 59%; height: auto;"
									src="images/customers.png" alt="">
							</div>
						</div>
						<div class="pb-0 ps-0 pe-0 mt-3 mb-0">
							<p class="mb-0 text-center mx-auto text-light  pb-2 mb-0"
								style="background-color: rgb(12, 1, 19); border: 2px;">More
								info</p>
						</div>
					</div>


				</div>
			</div>
		</section>




		<div class="offcanvas offcanvas-end offcanvas-custom" tabindex="-1"
			id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
			<div class="offcanvas-header">
				<h4 class="offcanvas-title text-dark  text-center"
					id="offcanvasExampleLabel">Admin Section</h4>
				<hr />
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
					aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<div class="text-center my-4 b-2 ps-1">
					<a href="admindashboard.jsp"
						class="btn d-flex justify-content-center align-items-center  activedashboard"
						style="width: 240px; height: 50px; border: 3px solid blue;"> <i
						class="material-symbols-outlined me-2" style="font-size: 22px;">dashboard</i>DashBoard
					</a>
				</div>
				<div class="text-center my-4 b-2 ps-1 pe-1">
					<a href="addcustomer.jsp"
						class="btn d-flex justify-content-center align-items-center butt"
						style="width: 240px; height: 50px; border: 3px solid blue;"> <i
						class="material-symbols-outlined me-2" style="font-size: 24px;">person_add</i>Add
						Customer
					</a>
				</div>
				<div class="text-center my-4 b-2 ps-1">
					<a href="addbankaccount.jsp"
						class="btn d-flex justify-content-center align-items-center butt"
						style="width: 240px; height: 50px; border: 3px solid blue;"> <i
						class="material-symbols-outlined me-2" style="font-size: 24px;">account_balance</i>Bank
						Account
					</a>
				</div>
				<div class="text-center my-4 b-2 ps-1">
					<a href="ViewCustomersController"
						class="btn d-flex justify-content-center align-items-center butt"
						style="width: 240px; height: 50px; border: 3px solid blue;"> <i
						class="material-symbols-outlined me-2" style="font-size: 24px;">visibility</i>View
						Customers
					</a>
				</div>
				<div class="text-center my-4 b-2 ps-1">
					<a href="ViewTransactions"
						class="btn d-flex justify-content-center align-items-center butt"
						style="width: 240px; height: 50px; border: 3px solid blue;"> <i
						class="material-symbols-outlined me-2" style="font-size: 24px;">currency_rupee_circle</i>View
						Transactions
					</a>
				</div>
				<div class="text-center my-4 b-2 ps-1">
					<a href="LogoutController"
						class="btn d-flex justify-content-center align-items-center butt"
						style="width: 240px; height: 50px; border: 3px solid blue;"> <i
						class="material-symbols-outlined me-2" style="font-size: 24px;">logout</i>Logout
					</a>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">
							<b style="color: green">Login Successful :</b>Welcome Admin
							${sessionScope.adminName}
						</h1>
						
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					 <div class="modal-body">
        			   Your Admin Privileges Has been <b style="color:green;">Activated</b> <i class="bi bi-hand-thumbs-up-fill"></i>
     						 </div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success"
							data-bs-dismiss="modal">OK</button>
					</div>
				</div>
			</div>
		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
		<script>
        document.addEventListener('DOMContentLoaded', function() {
            var adminRole = '${role}';
            var adminName =  '${adminName}'
            var greetAdmin = '${greetAdmin}'
            if (adminRole && adminName && greetAdmin) {
                var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'));
                myModal.show();
            }
        });
    </script>
</body>

</html>