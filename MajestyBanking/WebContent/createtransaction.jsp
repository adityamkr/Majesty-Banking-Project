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
            background-color: #8b8785;
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
<c:if test="${empty sessionScope.role or sessionScope.role != 'customer'}">
    <c:redirect url="login.jsp"/>
</c:if> 

    <div class="container-fluid pt-3">
        <div class="row">
            <div class="col-2">
            </div>
            <div class="col-8">
                <h1 class="text-center  pb-0 me-0  pt-0 mt-0 ps-4  "
                    style="font-family:'pacifico';color:white;"><i class="material-symbols-outlined me-2"
                        style="font-size:36px;color:whitesmoke;">
                        person_add
                    </i>Create Transactions</h1>
            </div>
            <div class="col-2  ms-0 ">
                <div class="text-center me-1 ms-5 mt-2">
                    <button class="btn" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample"
                        aria-controls="offcanvasExample"><i class="bi bi-arrow-right-circle text-white" style="font-size:21px"></i></button>
                </div>
            </div>
        </div>
    </div>

    <div class="container d-flex justify-content-lg-center mt-3">
        <div class="row d-flex justify-content-center mb-1 mt-1">
            <div class="col-12 col-lg-5  bg-light p-2" style="box-shadow: 17px 17px 15px #463b3d;">
                <div style="max-width:100%;height: auto;" class="mx-auto my-5">
                    <img class="img-fluid"
                        src="https://cdn.create.vista.com/api/media/small/546241654/stock-vector-secure-payment-modern-flat-concept-for-web-banner-design-man-makes-online-payment-confirming-his"
                        alt="">
                </div>
                <div class="text-center my-2">
                    <p style="color:rgb(163, 4, 70);font-weight: bold;">Your Trust Drives Our Passion</p>
                </div>
            </div>
            <div class="col-12 col-lg-5  d-flex flex-column p-2 pt-0"
                style="background-color:#102b45;box-shadow: 17px 17px 15px #463b3d;">
                <div class="text-center pt-3 pb-1">
                    <img style="max-width:22%;height:auto;" class="img-fluid" src="images/majestybanklogo.png" alt="">
                </div>
                <p style="font-size:20px;color:whitesmoke;font-weight:bold;" class="text-center mb-4">Add a New Transcation <i
                        class="bi bi-person-fill-add" style="color: rgb(224, 217, 228);font-size:23px;"></i></p>

                <div class="mx-auto my-2 my-lg-2">
                     <form action="CreateTransaction" method="post">
                <div class="mb-4 input-group" style="width:350px;">
                    <span class="input-group-text bg-warning">
                      <i  class="bi bi-person-fill "></i>
                    </span>
	                    <select class="form-select" name='TransactionType' id="TransactionType" aria-label="Select Transaction">
	                        <option value="credit">Credit Transaction</option>
	                        <option value="debit">Debit Transaction</option>
	                        <option value="transfer">Transfer Amount</option>
	                    </select>
                </div>
                 <div class="mb-4 input-group"  style="width:350px;" id="selfaccountNo">
                    <span class="input-group-text bg-warning">
                      <i  class="bi bi-person-fill "></i>
                    </span>
                    <input  type="text" class="form-control"  id="yourAccountNumber" name='yourAccountNumber' placeholder="Enter Your Account Number"/>
                </div>
                
                <div class="mb-4 input-group d-none"  style="width:350px;" id="receiveraccountNo">
                    <span class="input-group-text bg-warning">
                      <i  class="bi bi-person-fill "></i>
                    </span>
                    <input  type="text" class="form-control"  id="receiveraccount" name='receiveraccountNo' placeholder="Enter Receiver Account Number"/>
                </div>
                
                  <div class="mb-4 input-group" style="width:350px;" id="username">
                    <span class="input-group-text bg-warning">
                      <i  class="bi bi-person-fill "></i>
                    </span>
                    <input  type="number" class="form-control" id="TransactionAmount" name='amount' placeholder="Enter Amount"/>
                </div>
               	     <div class="col-12 text-center pt-3">
               	      <button type="submit"  style="width:142px;height:45px;background-color:rgb(15, 3, 22);"   class="btn btn-primary ms-1 py-2 mb-1 mt-1 px-0">Commit <i class="bi bi-box-arrow-in-right mt-3 pt-2 ms-1 " style="color: red;"></i></button>
               	     </div>
                   
               
                  
            </form>
                </div>
            </div>
        </div>
    </div>

    <div class="offcanvas offcanvas-end offcanvas-custom" tabindex="-1" id="offcanvasExample"
        aria-labelledby="offcanvasExampleLa bel">
        <div class="offcanvas-header">
            <h4 class="offcanvas-title text-dark  text-center" id="offcanvasExampleLabel">Customer Section</h4>
            <hr />
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <!-- <div class="text-center my-4 b-2 ps-1"> 
                <a href="admindashboard.jsp" class="btn d-flex justify-content-center align-items-center butt" style="width:240px;height:50px;border:3px solid blue;">
                    <i class="material-symbols-outlined me-2" style="font-size: 22px;">dashboard</i>DashBoard
                </a>
            </div> -->
            <div class="text-center my-4 b-2 ps-1 pe-1">
                <a href="PassBookController" class="btn d-flex justify-content-center align-items-center butt" style="width:240px;height:50px;border:3px solid blue;">
                    <i class="material-symbols-outlined me-2" style="font-size: 24px;">person_add</i>View Passbook
                </a>
            </div>
            <div class="text-center my-4 b-2 ps-1"> 
                <a href="createtransaction.jsp" class="btn d-flex justify-content-center align-items-center activedashboard" style="width:240px;height:50px;border:3px solid blue;">
                    <i class="material-symbols-outlined me-2" style="font-size: 24px;">currency_rupee_circle</i>New Transaction
                </a>
            </div>
            
           
            <div class="text-center my-4 b-2 ps-1"> 
                <a href="viewtransactions.jsp" class="btn d-flex justify-content-center align-items-center butt" style="width:240px;height:50px;border:3px solid blue;">
                    <i class="material-symbols-outlined me-2" style="font-size: 24px;">currency_rupee_circle</i>Edit Profile
                </a>
            </div>
            <div class="text-center my-4 b-2 ps-1">
                <a href="LogoutController" class="btn d-flex justify-content-center align-items-center butt" style="width:240px;height:50px;border:3px solid blue;">
                    <i class="material-symbols-outlined me-2" style="font-size: 24px;">logout</i>Logout
                </a>
            </div>
        </div>
    </div>
      <!--  ERROR Modal -->
<div class="modal fade" id="errorModel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel"><b style="color:red">ERROR :</b>${error}</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>
  <!-- Success Modal -->
<div class="modal fade" id="successModel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel"><b style="color:green">Success :</b>${message}</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <script>
        document.getElementById('TransactionType').addEventListener('change', function() {
       	 var transactionInputGroup = document.getElementById('accountNo');
       var 	receiveraccountNo = document.getElementById('receiveraccountNo')
       	    var selectedTransaction = document.getElementById('TransactionType').value;
       	    if (selectedTransaction === 'transfer') {
       	    	//transactionInputGroup.classList.remove('d-none');
       	    	receiveraccountNo.classList.remove('d-none');
       	    	
       	    } else {
       	    	//transactionInputGroup.classList.add('d-none');
       	    	receiveraccountNo.classList.add('d-none');
       	    	
       	    }    });
       
        document.addEventListener('DOMContentLoaded', function() {
            var errorMessage = '${error}';
            if (errorMessage) {
                var myModal = new bootstrap.Modal(document.getElementById('errorModel'));
                myModal.show();
            }
        });
        document.addEventListener('DOMContentLoaded', function() {
            var errorMessage = '${message}';
            if (errorMessage) {
                var myModal = new bootstrap.Modal(document.getElementById('successModel'));
                myModal.show();
            }
        });
    </script>
</body>

</html>