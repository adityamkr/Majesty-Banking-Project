<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
<style>
     .navbar .navbar-nav .nav-item a
     {
        padding:15px;
     }
     .navbar .navbar-nav .nav-item a:hover
     {
        color: brown !important;
     }
     .navbar .navbar-nav .nav-but
     {
        padding:5px;
     }
     .logo
     {
        background-color:orange;
     }
     .nav-link
     {
        color: white ! important;
     }
     
.pacifico-regular {
  font-family: "Pacifico", cursive;
  font-weight: 400;
  font-style: normal;
}

      body 
      {
        margin:0;
        padding:0;
        
      }
      .navbar{
        position:relative;
        z-index:1;
        width: 100%;
      }
      .background-section
      {
       
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        
        min-height: 85vh;
        padding-top: 85px;
        color: white;
      }
      .temp 
      {
        background-image: url('https://muffingroup.com/blog/wp-content/uploads/2023/11/bank-website-design.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
        background-color: rgba(0, 0, 0, 0.5);
      }
    </style>
</head>
<body>
   <%
	if(session.getAttribute("logout")!=null && session.getAttribute("logout").equals("true"))
	{
%>
      
<%
	}
%>


 <section class="temp">
    <nav class="navbar navbar-expand-lg " >
        <div class="container-fluid" >
          <a class="navbar-brand" href="#"><img  src="images/majetybank.png.png" style="height:80px;width: 120px;" class="rounded-circle" alt=""></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0 text-white">
              <li class="nav-item" style="font-size:15px;">
                <a class="nav-link active " aria-current="page" href="#">Home</a>
              </li>
              <li class="nav-item"  style="font-size:15px;">
              
              
                <a class="nav-link active" aria-current="page" href="#">Contact</a>
              </li>
              <li class="nav-item"  style="font-size:15px;">
                <a class="nav-link active" aria-current="page" href="#">About Us</a>
              </li> 
            </ul>
           <c:if test="${empty sessionScope.role}"> 
      		<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-but">
              <a class="btn btn-success me-1 mb-3" href="signup.jsp">SignUp</a>
             </li>
            </ul> 
     		 </c:if> 
     		
     		 < <c:if test="${not empty sessionScope.role}">
      		<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-but">
              <a class="btn btn-danger me-1 mb-3" href="LogoutController">Logout</a>
             </li>
            </ul>
     		</c:if>
     		
           
          </div>
        </div>
      </nav>
      
      <section>
        <div class="container mt-1" style="height:560px;">
         <div class="row mt-2 ">
            <div class="col-md-6 col-12 text-white d-flex flex-column justify-content-lg-center justify-content-start mb-3" style="position: relative;" >
                <img class="img-fluid" style="max-width:15%;height: auto;position:absolute;bottom:325px;left:365px;" src="images/money.png",alt="">
             <h1 style="font-family:'pacifico';" class="lh-base mt-1 pt-5 ms-1">"Empowering Financial Growth Globally" <span style="color: red;">Thriving</span>  with <br> <span style="color:rgb(240, 94, 10)">Majesty Banking ...</span></h1>
             <p style="font: size 25px;" class="ms-2">At Majesty Banking, we are dedicated to providing exceptional financial services to meet your unique needs. With a legacy of trust and innovation, we offer a comprehensive range of banking solutions designed to help you achieve your financial goals.</p>
             <button type="button" style="width:140px;height:40px;background-color: orangered;"   class="btn btn-primary rounded-capsule ms-1">Explore How</button>
            </div>
            <div class="col-md-6 col-12 d-none">
             <div>
              <img src="https://cdn.dribbble.com/users/7162/screenshots/1888419/open-uri20150119-12-2b4861"  style="background-color: transparent;" alt="" class="img-fluid">
             </div>
            </div> 
         </div>
        </div>
      </section>

    </section>


      <section style="background-color: rgb(3, 1, 17);">
        <marquee behavior="scoll" direction="left" scrollamount="15" scrolldelay="10">
            <h4 class="text-light py-1">News | Majesty Banking Celebrate's 60 years of Excellence in Service </h4>
        </marquee>
      </section>
      
      <!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">
							<b style="color: green">Logout Successful</b>
						</h1>
						
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					 <div class="modal-body">
        			    ThankYou for Choosing Majesty Banking .
     						 </div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success"
							data-bs-dismiss="modal">OK</button>
					</div>
				</div>	
			</div>
		</div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
  	document.addEventListener('DOMContentLoaded', function() {
        var logout = '${logout}';
        if (logout) {
            var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'));
            myModal.show();
        }
    });
  	   
  	</script>
</body>
</html>