<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>

<html>
	<head>
		<title>Dr. Zephyr</title>
		<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
   
	    <link rel="stylesheet" href="/css/main.css">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">
            <img src="/images/zephyr.svg" alt="" width="55" height="45" class="d-inline-block align-text-top">
      
          </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
   
        <i class="bi bi-three-dots-vertical"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          
          <li class="nav-item">
            <a class="nav-link" href="/"><i class="bi bi-house-door" style="color:#EB1D36"></i> Home</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="/drzephyr"><i class="bi bi-clipboard-pulse" style="color:#EB1D36"></i> Dr. Zephyr</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/products"><i class="bi bi-minecart-loaded" style="color:#EB1D36"></i>&nbsp;Our Products</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="/queryform"><i class="bi bi-question-circle" style="color:#EB1D36"></i>&nbsp;Contact Us</a>
          </li>
          
          <sec:authorize access="isAuthenticated()">
          	<li class="nav-item">
	            <a class="nav-link" href="/orders"><i class="bi bi-mailbox2" style="color:#EB1D36"></i>&nbsp;Orders</a>
	          </li>&nbsp;&nbsp;
          </sec:authorize>
          
          <sec:authorize access="hasRole('ROLE_ADMIN')">
          	<li class="nav-item">
	            <a class="nav-link" href="/admin"><i class="bi bi-shield-lock-fill" style="color:#EB1D36"></i>&nbsp;Admin</a>
	          </li>&nbsp;&nbsp;
          </sec:authorize>
          
          <div class="dropdown">
            <button class="btn btn-danger dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="border-radius: 40px;">
              <i class="bi bi-person-square"style="color:black;"></i> Account
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
            <sec:authorize access="isAuthenticated()">
              <li><a class="dropdown-item" href="/profile">My Account</a></li>
              <form:form method="POST" action="/logout">
              <!-- <li><a class="dropdown-item" href="/logout">Logout</a></li> -->
              <li><input class="dropdown-item" type="submit" value="Logout" /></li>
              </form:form>
              </sec:authorize>
              <sec:authorize access="!isAuthenticated()">
              <li><a class="dropdown-item" href="/login">Login</a></li>
              <li><a class="dropdown-item" href="/register">Register</a></li>
              </sec:authorize>
            </ul>
          </div>    
        </ul>
      </div>
    </div>
  </nav>


<br /><br />
  <section id="hero" class="d-flex align-items-center">
    <div class="container">
      <p class="title"></p>
      <section id="services" class="services">
      <div class="container">

        <div class="section-title">
          <h3>Dr. Zephyr Predictions</h3>
        </div>

        <div class="row d-flex justify-content-around">

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-clipboard-data"></i></div>
              <h4><a href="/drzephyr/checkdiabetes">Check Diabetes Risk</a></h4>
              <p>Diabetes is a chronic disease that occurs either when the pancreas does not produce enough insulin or when the body cannot effectively use the insulin it produces. Check your risk of getting diabetes</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-clipboard-heart"></i></div>
              <h4><a href="/drzephyr/checkheartdisease">Check Heart Disease Risk</a></h4>
              <p>Heart Disease are occuring quite frequently in this period of time. Check your risk of getting attacked by a Heart Disease</p>
            </div>
          </div>

        </div><br /><br /><br /><br /><br /><br /><br /><br /><br />

      </div>
    </section><!-- End Services Section -->
    </div>
  </section><!-- End Hero -->

    <footer class="my-5" id="footer">

      <div class="footer-top">
        <div class="container">
          <div class="row">
  
            <div class="col-lg-4 col-md-6 footer-contact">
              <h3>zep<h style = "color:#EB1D36">hyr</h></h3>
              <p>
                K L University <br>
                <strong>Phone:</strong> 8919935809<br>
                <strong>Email:</strong> nalluriprasanth@gmail.com<br>
              </p>
            </div>
  
            <div class="col-lg-2 col-md-6 footer-links">
              <h4>Useful Links</h4>
              <ul>
                <li><i class="bx bx-chevron-right"></i> <a href="/home">Home</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="/profile">Profile</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="/planner">Dr. Zephyr</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="/products">Our Products</a></li>
              </ul>
            </div>
  
          </div>
        </div>
      </div>
  
      <div class="container d-md-flex py-4">
  
        <div class="me-md-auto text-center text-md-start">
          <div class="copyright">
            &copy; Copyright <strong><span>zephyr</span></strong>. All Rights Reserved
          </div>
        </div>
        <div class="social-links text-center text-md-right pt-3 pt-md-0">
          <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
          <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
          <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
          <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
          <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
        </div>
      </div>
    </footer>
		
	</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>