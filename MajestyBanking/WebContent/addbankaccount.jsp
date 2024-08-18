<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Bank Account</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
	background-color: rgb(250, 248, 248);
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
	background-color: orange;
	color: white;
}

.iconcolor {
	color: rgb(179, 178, 178);
}

.activedashboard {
	background-color: rgb(101, 7, 139);
	color: white;
	'
}

.activedashboard:hover {
	background-color: rgb(101, 7, 139);
	color: white;
}
</style>
</head>

</head>
<body>
	<c:if
		test="${empty sessionScope.role or empty sessionScope.adminName or sessionScope.role != 'admin'}">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container-fluid pt-3">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<h1 class="text-center  pb-2 me-0  pt-2 mt-1 ps-4 "
					style="font-family: 'pacifico'; color: rgb(153, 18, 18);">
					<i class="material-symbols-outlined me-2"
						style="font-size: 36px; color: rgb(153, 18, 18);">
						account_balance </i>Add Bank Account
				</h1>
			</div>
			<div class="col-2  ms-0 ">
				<div class="text-center me-3 mt-2">
					<button class="btn" data-bs-toggle="offcanvas"
						data-bs-target="#offcanvasExample"
						aria-controls="offcanvasExample">
						<i class="bi bi-arrow-right-circle text-dark"
							style="font-size: 21px"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<form action="AddBankAccountController" method="post">
		<section>
			<div class="container">

				<div class="row">
					<div
						class="col-12 col-lg-12 my-3 pt-1 justify-content-center  align-items-center d-flex mb-0 mb-lg-3">
						<div class=" input-group p-3"
							style="width: 300px; font-size: 22px;">
							<span class="input-group-text bg-warning"
								style="border: 2px solid; cursor: pointer;"> <i
								class="bi bi-pencil-fill"></i>
							</span> <input type="number" class="form-control pe-2" name="customerId"
								id="customerId" placeholder="Search by Customer Id"
								style="border: 2px solid;" value="">
						</div>

						<button type="submit" class="btn btn-warning"
							style="position: relative; right: 10px;">
							<i class="bi bi-search"></i>
						</button>
					</div>
					<%
						boolean shouldShowImage = (request.getAttribute("customer") == null)
								&& (request.getAttribute("data") != null);
					%>
					<div
						class="col-12 >
                     
                      <div class="col-12 <c:if test="${shouldShowImage}">justify-content-center</c:if>"">
						<c:if test="${ empty customer  and  not empty data }">
							<img
								style="max-width: 30%; height: auto; position: relative; left: 390px; top: 5px;"
								alt="" class="img-fluid text-center"
								src="images/nodatafound.png">
						</c:if>
					</div>

					<c:if test="${not empty accno}">
						<c:set var="customer" value="${accno}" />
					</c:if>
					<c:if test="${not empty customer or not empty accno}">

						<table class="table table-bordered table-striped-columns">
							<thead>
								<tr class="text-center">
									<th scope="col"
										style="background-color: rgb(3, 36, 20); border: 3px solid black; color: whitesmoke;">Customer
										Id</th>
									<!-- <th scope="col" style="background-color:orangered;border:3px solid black;color:whitesmoke;">Account No</th> -->
									<th scope="col"
										style="background-color: orangered; border: 3px solid black; color: whitesmoke;">First
										Name</th>
									<th scope="col"
										style="background-color: rgb(12, 4, 83); border: 3px solid black; color: whitesmoke;">Last
										Name</th>
									<th scope="col"
										style="background-color: rgb(212, 14, 14); border: 3px solid black; color: whitesmoke;">Balance</th>
									<th scope="col"
										style="background-color: rgb(212, 14, 14); border: 3px solid black; color: whitesmoke;">Generate Acc.No</th>
								</tr>


								<tr class="text-center table-hover">
									<th scope="row" style="border: 3px solid;" class="justify-content-center align-items-center" >${customer.getCustomerId	()}</th>
									<!-- <td style="border:3px solid;font-weight:bold;">(Not Generated Yet)</td> -->
									<td style="border: 3px solid; font-weight: bold;">${customer.getFirstName()}</td>
									<td style="border: 3px solid; font-weight: bold;">${customer.getLastName()}</td>
									<td style="border: 3px solid; font-weight: bold;">&#8377;
										${customer.getBalance()} /-</td>
									<td style="border: 3px solid; font-weight: bold;">	<form action="GenerateAccountNo" method="post">
			   	<input type="hidden" name="customerId"
					value="${customer.getCustomerId()}"> <input type="hidden"
					name="firstName" value="${customer.getFirstName()}"> <input
					type="hidden" name="lastName" value="${customer.getLastName()}">
				<input type="hidden" name="balance" value="${customer.getBalance()}">
				<button class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#staticBackdrop" type="submit">Generate
					Account</button>
			</form></td>
				</tr>


							</thead>
							<tbody>

							</tbody>
						</table>
					</c:if>
				</div>


			</div>
			</div>
		</section>
	</form>
	<!-- Button trigger modal -->
	<c:if test="${not empty customer}">
		<div class="col-12 d-flex justify-content-center">
		

		</div>
	</c:if>

	<!--SUCCESS Modal -->
	<div class="modal fade" id="staticBackdropSuccess"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">
						<span style="color: green;">Congratulations! <span
							class="material-symbols-outlined"
							style="font-size: 30px; color: rgb(204, 3, 37);">
								celebration </span></span>
					</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					Account <b style="color: green;">Successfully </b>Created !! <br>
					<b>Customer Id : <span style="color: rgb(223, 9, 80);">${accno.getCustomerId()}</span></b></b>
					<br> <b>Generated Account Number : <span
						style="color: rgb(223, 9, 80);">${accno.getAccountNo()}</span></b>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success"
						data-bs-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>




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
					class="btn d-flex justify-content-center align-items-center butt"
					style="width: 240px; height: 50px; border: 3px solid blue;"> <i
					class="material-symbols-outlined me-2" style="font-size: 22px;">dashboard</i>DashBoard
				</a>
			</div>
			<div class="text-center my-4 b-2 ps-1 pe-1">
				<a href="addcustomer.jsp"
					class="btn d-flex justify-content-center align-items-center butt "
					style="width: 240px; height: 50px; border: 3px solid blue;"> <i
					class="material-symbols-outlined me-2" style="font-size: 24px;">person_add</i>Add
					Customer
				</a>
			</div>
			<div class="text-center my-4 b-2 ps-1">
				<a href="addbankaccount.jsp"
					class="btn d-flex justify-content-center align-items-center activedashboard"
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var errorMessage = '${accno}';
			if (errorMessage) {
				var myModal = new bootstrap.Modal(document
						.getElementById('staticBackdropSuccess'));
				myModal.show();
			}
		});
	</script>

</body>
</html>