<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
body
{
    background-color: #968f8a;
}
.hideinput
{
  display:none;
}
 
</style>
</head>
<body>
<c:if test="${not empty sessionScope.role}">
     <c:redirect url="index.jsp"/>
     </c:if>
 <div class="container d-flex justify-content-lg-center mt-2">
       <div class="row d-flex justify-content-center my-2">
        <div class="col-12 col-lg-5  bg-light p-1" style="box-shadow: 17px 17px 15px #463b3d;">
        <div style="max-width:80%;height: auto;" class="mx-auto my-5"  >
            <img class="img-fluid" src="https://i.pngimg.me/thumb/f/720/0f80b8e8d3ee4c9196fe.jpg" alt="">
        </div>
        <div class="text-center my-2">
            <p style="color:rgb(201, 6, 6);font-weight: bold;">Login to Unlock the Banking Potential</p>
        </div>
        </div>
        <div class="col-12 col-lg-5  d-flex flex-column p-1" style="background-color:rgb(15,3,22);box-shadow: 17px 17px 15px #463b3d;">
         <div class="text-center pt-3">
            <img style="max-width:21%;height:auto;"  class="img-fluid" src="images/majestybanklogo.png" alt="">
         </div>
         <p style="font-size:20px;color:whitesmoke;font-weight:bold;" class="text-center"><i class="bi bi-heart-fill mt-3 pt-2 pe-1 " style="color: red;"></i> Welcome to Majesty Banking <i class="bi bi-heart-fill mt-3 pt-2 ms-1 " style="color:red;" ></i></p>   
         <p style="font-size:20px;color:whitesmoke;font-weight:bold;" class="text-center mx-auto">Login Now !</p>
         <div class="mx-auto my-2 mt-lg-2">
            <form action="LoginController" method="post">
                <div class="mb-4 input-group" style="width:350px;">
                    <span class="input-group-text bg-warning">
                      <i  class="bi bi-person-fill "></i>
                    </span>
	                    <select class="form-select" name='loginRole' id="userRole" aria-label="Select Role">
	                        <option value="adminlogin">Admin Login</option>
	                        <option value="customerlogin">Customer Login</option>
	                    </select>
                </div>
                 <div class="mb-4 input-group" style="width:350px;" id="username">
                    <span class="input-group-text bg-warning">
                      <i  class="bi bi-person-fill "></i>
                    </span>
                    <input  type="text" class="form-control" id="name" name='username' placeholder="Enter Username"/>
                </div>
                <div class="mb-4 input-group d-none" style="width:350px;" id="email">
                    <span class="input-group-text bg-warning">
                      <i  class="bi bi-person-fill "></i>
                    </span>
                    <input  type="email"  class="form-control"  id="emailinput" name='email' placeholder="Enter Email"/>
                </div> 
                   <div class="mb-2 input-group" style="width:350px;">
                    <span class="input-group-text bg-warning">
                      <i class="bi bi-key-fill"></i>
                    </span>
                    <input  type="password"  class="form-control" id="password" name='password' placeholder="Enter Password"/>
                   </div>
                   <div class="d-flex justify-content-end me-1">
                    <span><a style="text-decoration:none;color: rgb(235, 115, 3);" href="">Forget Password ?</a></span>
                   </div>
                   <div class="text-center mx-auto my-2 mt-3">
                    <button type="submit"  style="width:160px;height:45px;background-color:rgb(15, 3, 22);"   class="btn btn-primary ms-1 py-2 mb-1 mt-1">Login <i class="bi bi-box-arrow-in-right mt-3 pt-2 ms-1 " style="color: red;"></i></button>
                   </div>
                   <div class="text-center my-3">
                    <span class="text-light">Dont't have an account ? <a href="signup.jsp">SignUp</a></span>
                   </div>
                  
            </form>
         </div>
        </div>
       </div>
    </div>
    <!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel"><b style="color:red">Login Failed :</b>${error}</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
    document.getElementById('userRole').addEventListener('change', function() {
    	 var emailInputGroup = document.getElementById('email');
    	    var selectedRole = document.getElementById('userRole').value;
    	    if (selectedRole === 'customerlogin') {
    	        emailInputGroup.classList.remove('d-none');
    	    } else {
    	        emailInputGroup.classList.add('d-none');
    	    }    });
    
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