<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>

<html>
	<head>
		<title>Home</title>
		<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
   
	    <link rel="stylesheet" href="buffer.css">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	</head>
	<style>
		#hero {
    width: 100%;
    height: 90vh;
    background: url("../img/hero-bg.jpg") top center;
    background-size: cover;
    margin-bottom: -200px;
  }
  
  #hero .container {
    position: relative;
  }
  
  #hero h1 {
    margin: 0;
    font-size: 48px;
    font-weight: 700;
    line-height: 56px;
    text-transform: uppercase;
    color: #000000;
  }
  
  #hero h2 {
    color: #000000;
    margin: 10px 0 0 0;
    font-size: 12px;
    font-weight: 100;
  }
  
  #hero .btn-get-started {
    font-family: "Raleway", sans-serif;
    text-transform: uppercase;
    font-weight: 500;
    font-size: 14px;
    letter-spacing: 1px;
    display: inline-block;
    padding: 12px 35px;
    margin-top: 30px;
    border-radius: 50px;
    transition: 0.5s;
    color: #fff;
    background: #000000;
  }
  
  #hero .btn-get-started:hover {
    background: #000000;
  }
  
  @media (min-width: 1024px) {
    #hero {
      background-attachment: fixed;
    }
  }
  
  @media (max-width: 992px) {
    #hero {
      margin-bottom: 0;
      height: 100vh;
    }
  
    #hero .container {
      padding-bottom: 63px;
    }
  
    #hero h1 {
      font-size: 20px;
      line-height: 32px;
    }
  
    #hero h4 {
      font-size: 8px;
      line-height: 24px;
      margin-bottom: 15px;
    }
  }
  
  @media (max-height: 600px) {
    #hero {
      height: 110vh;
    }
  }

  .section-title {
    text-align: center;
    padding-bottom: 30px;
  }
  

	/*--------------------------------------------------------------
	# Services
	--------------------------------------------------------------*/
	.services .icon-box {
	  text-align: center;
	  border: 1px solid #d5e1ed;
	  padding: 80px 20px;
	  transition: all ease-in-out 0.3s;
	}
	
	.services .icon-box .icon {
	  margin: 0 auto;
	  width: 64px;
	  height: 64px;
	  background: #EB1D36;
	  border-radius: 5px;
	  transition: all 0.3s ease-out 0s;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  margin-bottom: 20px;
	  transform-style: preserve-3d;
	}
	
	.services .icon-box .icon i {
	  color: #fff;
	  font-size: 28px;
	}
	
	.services .icon-box .icon::before {
	  position: absolute;
	  content: "";
	  left: -8px;
	  top: -8px;
	  height: 100%;
	  width: 100%;
	  background: #737272;
	  border-radius: 5px;
	  transition: all 0.3s ease-out 0s;
	  transform: translateZ(-1px);
	}
	
	.services .icon-box h4 {
	  font-weight: 700;
	  margin-bottom: 15px;
	  font-size: 24px;
	}
	
	.services .icon-box h4 a {
	  color: #000000;
	}
	
	.services .icon-box p {
	  line-height: 24px;
	  font-size: 14px;
	  margin-bottom: 0;
	}
	
	.services .icon-box:hover {
	  background: #1977cc;
	  border-color: #1977cc;
	}
	
	.services .icon-box:hover .icon {
	  background: #fff;
	}
	
	.services .icon-box:hover .icon i {
	  color: #1977cc;
	}
	
	.services .icon-box:hover .icon::before {
	  background: #EB1D36;
	}
	
	.services .icon-box:hover h4 a,
	.services .icon-box:hover p {
	  color: #fff;
	}
	
	/* ----------------------Footer--------------------- */
	#footer {
	  color: #444444;
	  font-size: 14px;
	  background: #f1f7fd;
	}
	
	#footer .footer-top {
	  padding: 60px 0 30px 0;
	  background: #fff;
	  box-shadow: 0px 2px 15px rgba(25, 119, 204, 0.1);
	}
	
	#footer .footer-top .footer-contact {
	  margin-bottom: 30px;
	}
	
	#footer .footer-top .footer-contact h4 {
	  font-size: 22px;
	  margin: 0 0 30px 0;
	  padding: 2px 0 2px 0;
	  line-height: 1;
	  font-weight: 700;
	}
	
	#footer .footer-top .footer-contact p {
	  font-size: 14px;
	  line-height: 24px;
	  margin-bottom: 0;
	  font-family: "Raleway", sans-serif;
	  color: #777777;
	}
	
	#footer .footer-top h4 {
	  font-size: 16px;
	  font-weight: bold;
	  color: #444444;
	  position: relative;
	  padding-bottom: 12px;
	}
	
	#footer .footer-top .footer-links {
	  margin-bottom: 30px;
	}
	
	#footer .footer-top .footer-links ul {
	  list-style: none;
	  padding: 0;
	  margin: 0;
	}
	
	#footer .footer-top .footer-links ul i {
	  padding-right: 2px;
	  color: #1c84e3;
	  font-size: 18px;
	  line-height: 1;
	}
	
	#footer .footer-top .footer-links ul li {
	  padding: 10px 0;
	  display: flex;
	  align-items: center;
	}
	
	#footer .footer-top .footer-links ul li:first-child {
	  padding-top: 0;
	}
	
	#footer .footer-top .footer-links ul a {
	  color: #777777;
	  transition: 0.3s;
	  display: inline-block;
	  line-height: 1;
	}
	
	#footer .footer-top .footer-links ul a:hover {
	  text-decoration: none;
	  color: #1977cc;
	}
	
	#footer .footer-newsletter {
	  font-size: 15px;
	}
	
	#footer .footer-newsletter h4 {
	  font-size: 16px;
	  font-weight: bold;
	  color: #444444;
	  position: relative;
	  padding-bottom: 12px;
	}
	
	#footer .footer-newsletter form {
	  margin-top: 30px;
	  background: #fff;
	  padding: 6px 10px;
	  position: relative;
	  border-radius: 50px;
	  text-align: left;
	  border: 1px solid #bfdcf7;
	}
	
	#footer .footer-newsletter form input[type=email] {
	  border: 0;
	  padding: 4px 8px;
	  width: calc(100% - 100px);
	}
	
	#footer .footer-newsletter form input[type=submit] {
	  position: absolute;
	  top: 0;
	  right: 0;
	  bottom: 0;
	  border: 0;
	  background: none;
	  font-size: 16px;
	  padding: 0 20px;
	  background: #1977cc;
	  color: #fff;
	  transition: 0.3s;
	  border-radius: 50px;
	}
	
	#footer .footer-newsletter form input[type=submit]:hover {
	  background: #1c84e3;
	}
	
	#footer .credits {
	  padding-top: 5px;
	  font-size: 13px;
	  color: #444444;
	}
	
	#footer .social-links a {
	  font-size: 18px;
	  display: inline-block;
	  background: #EB1D36;
	  color: #fff;
	  line-height: 1;
	  padding: 8px 0;
	  margin-right: 4px;
	  border-radius: 50%;
	  text-align: center;
	  width: 36px;
	  height: 36px;
	  transition: 0.3s;
	}
	
	#footer .social-links a:hover {
	  background: #EB1D36;
	  color: #fff;
	  text-decoration: none;
	}
	</style>
	<body>
		<%-- <h1>Home</h1>
		<hr /><br /><br />
		Welcome to Home Page
		<sec:authorize access="isAuthenticated()">
		    <h1>Hello</h1>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<form:form method="POST" action="/logout">
				<button type="submit">Logout</button>
			</form:form>
		</sec:authorize>
		<sec:authorize access="!isAuthenticated()">
			<a href="/login"><button>Login</button></a>
		</sec:authorize> --%>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/home">
            <img src="/images/zephyr.svg" alt="" width="55" height="45" class="d-inline-block align-text-top">
      
          </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
   
        <i class="bi bi-three-dots-vertical"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <!-- -----category----- -->
          <div class="dropdown">
          <li class="nav-item active">
            <a class="nav-link" href="/home"  id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false"> <i class="bi bi-house-door" style="color:#EB1D36"></i> Home</a>

          
          </li>
        </div>

          <li class="nav-item active">
           
            <a class="nav-link" href="/profile" > <i class="bi bi-person" style="color:#EB1D36"></i> Profile</a>    
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/nutriplanner"><i class="bi bi-card-checklist" style="color:#EB1D36"></i> NutriPlanner</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/products"><i class="bi bi-minecart-loaded" style="color:#EB1D36"></i>OurProducts</a>
          </li>
          <div class="dropdown ">
            <button class="btn btn-danger dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="border-radius: 40px;">
              <i class="bi bi-person-square"style="color:black;"></i> Account
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
              <li><a class="dropdown-item" href="/myaccount">My Account</a></li>
              <li><a class="dropdown-item" href="/login">Login</a></li>
              <li><a class="dropdown-item" href="/logout">Logout</a></li>
            </ul>
          </div>    
        </ul>
      </div>
    </div>
  </nav>



  <section id="hero" class="d-flex align-items-center">
    <div class="container">
      <h1>Nutrients Plan Now Simplified For <h style = "color:#EB1D36">Everyone</h></h1>
      <h4>Health Fit is a site which helps in nutritution choice . We offer tools which are useful to health.
        These tools helps select diet which is sutable to your body.</h4>
      <a href="#about" class="btn-get-started scrollto" style="background-color: #EB1D36">Join Now</a>
    </div>
  </section><!-- End Hero -->

  <main id="main">


    <br>
    <br>
    <br>
    <br> <br>
    <br>

    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="section-title">
          <center> <h2> Our Services</h2></center>
          <p>Our Services here to serve you</p>
        </div>

        <div class="row d-flex justify-content-around">
<!--           <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-bar-chart"></i></div>
              <h4><a href="">Health Stastics</a></h4>
              <p>get a detailed information about 
                your health</p>
            </div>
          </div> -->

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-mortarboard"></i></div>
              <h4><a href="">Nutri Planner</a></h4>
              <p>Nutri planner helps to select food that 
                is suitable for your health</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-bag-heart-fill"></i></div>
              <h4><a href="">Healthy Products</a></h4>
              <p>Our health products are mostly useful to 
                your diet plan</p>
            </div>
          </div>

        </div><br /><br /><br />

      </div>
    </section><!-- End Services Section -->



    <footer id="footer">

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
                <li><i class="bx bx-chevron-right"></i> <a href="/planner">NutriPlanner</a></li>
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