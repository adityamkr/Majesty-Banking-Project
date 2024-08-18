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
        background-color:orange;
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
 <c:if test="${empty sessionScope.role or sessionScope.role != 'customer'}">
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
                        visibility
                    </i>View Passbook</h1>
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
      <form action="PassBookController?applyFilters=true"  method="post">
        <div class="container"> 
            <div class="row">
                <div class="col-12 col-lg-6 my-3 pt-1 justify-content-center justify-content-lg-end align-items-center d-flex mb-0 mb-lg-3">
                 
                  
                    <div class=" input-group p-3" style="width:300px;font-size:22px;">
                        <span class="input-group-text"  style="border:2px solid;cursor: pointer;">
                          <i  class="bi bi-pencil-fill"></i>
                        </span>
                      <c:if test="${not empty firstName}">
                       <input  type="text" value="${firstName}"  name="firstName"class="form-control pe-2" id="name" placeholder="Enter Account No" style="border:2px solid;">
                      </c:if>
                      <c:if test="${empty firstName}">
                       <input  type="text"  name="accountNo"class="form-control pe-2" id="name" placeholder="Enter Account No" style="border:2px solid;">
                      </c:if>
                      
                      
                       
                    </div>

                    <button class="btn btn-warning" type="submit" style="position: relative;right:10px;"><i  class="bi bi-search"></i></button>
                </div>
                <div class="col-12 col-lg-3 my-3 pt-1 justify-content-center align-items-center d-flex mt-0 mt-lg-3 ">
                    <!-- <select class="form-select" id="balancefilter" name="balanceFilter" aria-label="Default select example" style="border:2px solid;">
                        <option selected value="-1">Show Overall Accounts</option>
                        <option value="1000"> Show Balance Above 1000</option>
                        <option value="2000">Show Balance Above 2000</option>
                        <option value="3000">Show Balance Above 3000</option>
                      </select> -->
                      <select id="balanceFilter" class="form-select" name="accountNoFilter" aria-label="Default select example" style="border:2px solid;">
    <option value="0" <c:if test="${filter == '-1'}">selected</c:if>>Show Overall Accounts</option>
    <option value="credit" <c:if test="${filter == 'CREDIT'}">selected</c:if>>Show Credit Accounts</option>
    <option value="debit" <c:if test="${filter == 'DEBIT'}">selected</c:if>>Show Debit Accounts</option>
</select>
                </div>
                
                <div class="col-12">
                  <%--   <c:if test="${empty customers}">
                      <img style="max-width:30%;height:auto;position:relative;left: 390px;top:5px;"  alt="" class="img-fluid text-center" src="images/nodatafound.png">
                    </c:if> --%>
                   <%--  <c:if test="${not empty customers}"> --%>
                    <table class="table table-bordered table-striped-columns">
                      <thead>
                        <tr class="text-center">
                            <th scope="col" style="background-color:rgb(3, 36, 20);border:3px solid black;color: whitesmoke;">Sender Acc.No</th>
                            <th scope="col" style="background-color:orangered;border:3px solid black;color:whitesmoke;">Receiver Acc.No</th>
                            <th scope="col" style="background-color:rgb(150, 3, 28);border:3px solid black;color: whitesmoke;">Transaction Mode</th>
                            <th scope="col" style="background-color:rgb(12, 4, 83);border:3px solid black;color: whitesmoke;">Amount</th>
                            <th scope="col" style="background-color:rgb(212, 14, 14);border:3px solid black;color: whitesmoke;">Date</th>
                        </tr>
                        
   
                         <c:if test="${not empty passbook}">
                          <c:forEach var="pbook" items="${passbook}">
                          <tr class="text-center">
                            <th scope="row" style="border:3px solid;">${pbook.senderAccountNo}</th>
                            <td style="border:3px solid;font-weight:bold;">${pbook.receiverAccountNo}</td>
                            <td style="border:3px solid;font-weight:bold;">${pbook.transactionMode}</td>
                            <td style="border:3px solid;font-weight:bold;">${pbook.amount}</td>
                            <td style="border:3px solid;font-weight:bold;">${pbook.date} /-</td>
                        </tr>
                          </c:forEach>
                        </c:if>
                      </thead>
                      <tbody>
                       
                      </tbody>
                      </table>
                     <%--  </c:if> --%>
                </div>
            </div>
        </div>
        </form>
     </section>

    <%
     System.out.println(request.getAttribute("error"));
    %>

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
                <a href="PassBookController" class="btn d-flex justify-content-center align-items-center activedashboard" style="width:240px;height:50px;border:3px solid blue;">
                    <i class="material-symbols-outlined me-2" style="font-size: 24px;">person_add</i>View Passbook
                </a>
            </div>
            <div class="text-center my-4 b-2 ps-1"> 
                <a href="createtransaction.jsp" class="btn d-flex justify-content-center align-items-center butt" style="width:240px;height:50px;border:3px solid blue;">
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
      <!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous">
      </script>
      <script>
    document.addEventListener('DOMContentLoaded', function() {
        var errorMessage = '${error}';
        if (errorMessage) {
            var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'));
            myModal.show();
        }
    });
    </script>
</body>
</html>