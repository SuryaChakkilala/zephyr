<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>

<html>
	<head>
		<title>Admin</title>
		<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
   
	    <link rel="stylesheet" href="/css/main.css">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
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
  
  	<div class="container justify-content-center">
  		<div class="m-4">
  			<br />
  			<h2 style="margin-left: 13%">Admin Panel</h2>
  			<hr />
  			<section id="hero" class="d-flex align-items-center" style="margin-top: 16%">
			    <div class="container">
			      <p class="title"></p>
			      <section id="services" class="services">
			      <div class="container">
			
			        <div class="row d-flex justify-content-around">
			
			          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
			            <div class="icon-box">
			              <div class="icon"><i class="bi bi-person-circle"></i></div>
			              <h4><a href="/admin/users/">Users</a></h4>
			              <p>View, Manage the exisiting users. One place to view all the user data</p>
			            </div>
			          </div>
			
			          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
			            <div class="icon-box">
			              <div class="icon"><i class="bi bi-boxes"></i></div>
			              <h4><a href="/admin/categories">Categories</a></h4>
			              <p>View, Manage the exisiting categories. One place to view all the category data</p>
			            </div>
			          </div>
			          
			          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
			            <div class="icon-box">
			              <div class="icon"><i class="bi bi-box-seam"></i></div>
			              <h4><a href="/admin/products">Products</a></h4>
			              <p>View, Manage the exisiting products. One place to view all the product data</p>
			            </div>
			          </div>
			          
			          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
			            <div class="icon-box">
			              <div class="icon"><i class="bi bi-mailbox2"></i></div>
			              <h4><a href="/admin/orders">Orders</a></h4>
			              <p>View, Manage the exisiting orders. One place to view all the order data</p>
			            </div>
			          </div>
			          
			          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
			            <div class="icon-box">
			              <div class="icon"><i class="bi bi-question-circle"></i></div>
			              <h4><a href="/admin/queries">Queries</a></h4>
			              <p>View, Manage the exisiting queries. One place to view all the query data</p>
			            </div>
			          </div>
			
			        </div><br /><br /><br /><br /><br /><br /><br /><br /><br />
			
			      </div>
			    </section><!-- End Services Section -->
			    </div>
			  </section><!-- End Hero -->
			  			
  		</div>
  	</div>
		
	</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>