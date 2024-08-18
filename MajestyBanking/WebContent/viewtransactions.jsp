<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Transactions</title>
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
        background-color:rgb(250, 248, 248);
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

</head>
<body>
<c:if test="${empty sessionScope.role or empty sessionScope.adminName or sessionScope.role != 'admin'}">
    <c:redirect url="login.jsp"/>
</c:if>
    <div class="container-fluid pt-3">
        <div class="row">
            <div class="col-2">
            </div>
            <div class="col-8">
                <h1 class="text-center  pb-2 me-0  pt-2 mt-1 ps-4 "
                    style="font-family:'pacifico';color: rgb(153, 18, 18);"><i class="material-symbols-outlined me-2"
                        style="font-size:36px;color:rgb(153, 18, 18);">
                        currency_rupee_circle
                    </i>View Transactions</h1>
            </div>
            
            <div class="col-2  ms-0 ">
                <div class="text-center me-3 mt-2">
                      <button class="btn" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample"
                        aria-controls="offcanvasExample"><i class="bi bi-arrow-right-circle text-dark" style="font-size:21px"></i></button>
                </div>
            </div>
            
        </div>
    </div>
     <section>
        <div class="container"> 
            <div class="row">
                <div class="col-12 col-lg-4 my-3 pt-1 justify-content-center justify-content-lg-end align-items-center d-flex mb-0 mb-lg-3">
       				
                
                </div>
                <div class="col-12 col-lg-4 my-3 pt-1 justify-content-center align-items-center d-flex mt-0 mt-lg-3 ">
                  <form action="ViewTransactions" method="post" id="myform" >
                   <select name="tfilter" class="form-select" aria-label="Default select example" style="border:2px solid;" onchange="callme()">
                        <option  value="1" <c:if test="${filter == 'all'}">selected</c:if>>Show Overall Accounts</option>
                        <option value="credit" <c:if test="${filter == 'credit'}">selected</c:if> > CREDIT Transactions</option>
                        <option value="debit" <c:if test="${filter == 'debit'}">selected</c:if> >DEBIT Transactions</option>
                      </select>
                  </form>
                </div>
                <div class="col-12">
                    <table class="table table-bordered table-striped-columns">
                      <thead>
                        <tr class="text-center">
                            <th scope="col" style="background-color:rgb(3, 36, 20);border:3px solid black;color: whitesmoke;">Date</th>
                            <th scope="col" style="background-color:orangered;border:3px solid black;color:whitesmoke;">Sender Acc.No</th>
                            <th scope="col" style="background-color:rgb(150, 3, 28);border:3px solid black;color: whitesmoke;">Receiver Acc.No</th>
                            <th scope="col" style="background-color:rgb(12, 4, 83);border:3px solid black;color: whitesmoke;">Transaction type</th>
                            <th scope="col" style="background-color:rgb(212, 14, 14);border:3px solid black;color: whitesmoke;">Amount</th>
                        </tr>
                        <c:forEach var="item" items="${transactions}">
                        
                         <tr class="text-center table-hover">
                            <th scope="row" style="border:3px solid;">${item.date}</th>
                            <td style="border:3px solid;font-weight:bold;">${item.senderAccountNo}</td>
                            <td style="border:3px solid;font-weight:bold;">${item.receiverAccountNo}</td>
                            <c:if test="${item.transactionMode == 'DEBIT'}">
      <td style="border:3px solid;font-weight:bold;background-color: rgb(240, 10, 29);">
        <span style="color:rgb(236, 210, 236);">DEBIT</span>
      </td>
    </c:if>
     <c:if test="${item.transactionMode == 'CREDIT'}">
      <td style="border:3px solid;font-weight:bold;background-color: rgb(68, 245, 68);">
        <span style="color:rgb(17, 14, 17);">${item.transactionMode}</span>
      </td>
    </c:if>
                          <%--   <td style="border:3px solid;font-weight:bold;background-color: rgb(68, 245, 68);"><span style="color:rgb(17, 14, 17);">${item.transactionMode}</span></td> --%>
                            <td style="border:3px solid;font-weight:bold;">&#8377; ${item.amount} /-</td>
                        </tr>
                        </c:forEach>
                       
                        
                      </thead>
                      <tbody>
                       
                      </tbody>
                      </table>
                </div>
            </div>
        </div>
     </section>



    <div class="offcanvas offcanvas-end offcanvas-custom" tabindex="-1" id="offcanvasExample"
        aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header">
            <h4 class="offcanvas-title text-dark  text-center" id="offcanvasExampleLabel">Admin Section</h4>
            <hr />
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
       <div class="offcanvas-body">
            <div class="text-center my-4 b-2 ps-1"> 
                <a href="admindashboard.jsp" class="btn d-flex justify-content-center align-items-center butt" style="width:240px;height:50px;border:3px solid blue;">
                    <i class="material-symbols-outlined me-2" style="font-size: 22px;">dashboard</i>DashBoard
                </a>
            </div>
            <div class="text-center my-4 b-2 ps-1 pe-1">
                <a href="addcustomer.jsp" class="btn d-flex justify-content-center align-items-center butt" style="width:240px;height:50px;border:3px solid blue;">
                    <i class="material-symbols-outlined me-2" style="font-size: 24px;">person_add</i>Add Customer
                </a>
            </div>
            <div class="text-center my-4 b-2 ps-1"> 
                <a href="addbankaccount.jsp" class="btn d-flex justify-content-center align-items-center butt" style="width:240px;height:50px;border:3px solid blue;">
                    <i class="material-symbols-outlined me-2" style="font-size: 24px;">account_balance</i>Bank Account
                </a>
            </div>
            <div class="text-center my-4 b-2 ps-1"> 
                <a href="ViewCustomersController" class="btn d-flex justify-content-center align-items-center butt" style="width:240px;height:50px;border:3px solid blue;">
                    <i class="material-symbols-outlined me-2" style="font-size: 24px;">visibility</i>View Customers
                </a>
            </div>
            <div class="text-center my-4 b-2 ps-1"> 
                <a href="ViewTransactions" class="btn d-flex justify-content-center align-items-center activedashboard" style="width:240px;height:50px;border:3px solid blue;">
                    <i class="material-symbols-outlined me-2" style="font-size: 24px;">currency_rupee_circle</i>View Transactions
                </a>
            </div>
            <div class="text-center my-4 b-2 ps-1">
                <a href="LogoutController" class="btn d-flex justify-content-center align-items-center butt" style="width:240px;height:50px;border:3px solid blue;">
                    <i class="material-symbols-outlined me-2" style="font-size: 24px;">logout</i>Logout
                </a>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        
        <script>
         function callme()
         {
        	 const formElement = document.getElementById("myform");
        	 formElement.submit();
         }
        </script>
</body>
</html>