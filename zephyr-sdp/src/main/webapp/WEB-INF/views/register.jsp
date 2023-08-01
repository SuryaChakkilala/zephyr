<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>

<html>
	<head>
		<title>Register</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
		<!-- Font Awesome -->
		<link
		  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
		  rel="stylesheet"
		/>
		<!-- Google Fonts -->
		<link
		  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
		  rel="stylesheet"
		/>
		<!-- MDB -->
		<link
		  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css"
		  rel="stylesheet"
		/>
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
		<!-- Section: Design Block -->
		<section class="text-center">
		  <!-- Background image -->
		  <div class="p-5 bg-image" style="
		        background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg');
		        height: 300px;
		        "></div>
		  <!-- Background image -->
		
		  <div class="card mx-4 mx-md-5 shadow-5-strong" style="
		        margin-top: -100px;
		        background: hsla(0, 0%, 100%, 0.8);
		        backdrop-filter: blur(30px);
		        ">
		    <div class="card-body py-5 px-md-5">
		
		      <div class="row d-flex justify-content-center">
		        <div class="col-lg-8">
		          <h2 class="fw-bold mb-5">Sign up now</h2>
		          <form:form method="POST" modelAttribute="user">
		            <!-- 2 column grid layout with text inputs for the first and last names -->
		            <div class="row">
		              <div class="col-md-6 mb-4">
		                <div class="form-outline">
		                  <form:input path="firstName" type="text" id="form3Example1" class="form-control" />
		                  <label class="form-label" for="form3Example1">First name</label>
		                </div>
		              </div>
		              <div class="col-md-6 mb-4">
		                <div class="form-outline">
		                  <form:input path="lastName" type="text" id="form3Example2" class="form-control" />
		                  <label class="form-label" for="form3Example2">Last name</label>
		                </div>
		              </div>
		            </div>
		
		            <!-- Email input -->
		            <div class="form-outline mb-4">
		              <form:input path="email" type="email" id="form3Example3" class="form-control" />
		              <label class="form-label" for="form3Example3">Email address</label>
		            </div>
		            
		            <!-- <div class="form-check d-flex justify-content-center mb-4">
		              <input class="form-check-input me-2" type="checkbox" value="" id="form2Example33" checked />
		              <label class="form-check-label" for="form2Example33">
		                Subscribe to our newsletter
		              </label>
		            </div> -->
		            
		            <!-- Gender input -->
		            Gender: 
		            <div class="mx-5 form-check form-check-inline">
					  <form:radiobutton path="gender" value="Male" class="form-check-input" name="inlineRadioOptions" id="inlineRadio1" />
					  <label class="form-check-label" for="inlineRadio1">Male</label>
					</div>
					<div class="mx-5 form-check form-check-inline">
					  <form:radiobutton path="gender" value="Female" class="form-check-input" name="inlineRadioOptions" id="inlineRadio2" />
					  <label class="form-check-label" for="inlineRadio1">Female</label>
					</div>
					<br /><br />
					
					<!-- Username input -->
		            <div class="form-outline mb-4">
		              <form:input path="username" type="text" id="form3Example3" class="form-control" />
		              <label class="form-label" for="form3Example3">Username</label>
		            </div>
					
					<!-- Password input -->
		            <div class="form-outline mb-4">
		              <form:input path="password" type="password" id="form3Example4" class="form-control" />
		              <label class="form-label" for="form3Example4">Password</label>
		            </div>
		            
		            <!-- Matching Password input -->
		            <div class="form-outline mb-4">
		              <form:input path="matchingPassword" type="password" id="form3Example4" class="form-control" />
		              <label class="form-label" for="form3Example4">Confirm Password</label>
		            </div>
		
		            <!-- Submit button -->
		            <button type="submit" class="btn btn-primary btn-block mb-4">
		              Sign up
		            </button>
		            <p class="mb-5 pb-lg-2" style="color: #393f81;">Already have an account? <a href="/login"
		                      style="color: #393f81;">Login</a></p>
		          </form:form>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>
		<!-- Section: Design Block -->
	</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<!-- MDB -->
	<script
	  type="text/javascript"
	  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"
	></script>
</html>