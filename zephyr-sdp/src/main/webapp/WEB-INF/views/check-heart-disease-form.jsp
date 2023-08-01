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
	<style>
		.cl1 {
			padding: 10%;
		}
	</style>
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
	        height: 150px;
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
	          <h2 class="fw-bold mb-5">Enter the below details</h2>
	          <form:form method="POST" modelAttribute="dto">
	            <div class="row">
	            <!-- Email input -->
	            <div class="form-outline mb-4">
	              <form:input path="age" min="1" type="number" id="form3Example3" class="form-control" />
	              <label class="form-label" for="form3Example3">Age</label>
	            </div>
	            
	            <!-- Gender input -->
		        <div class="col-md-6 mb-4">

                  <h6 class="mb-2 pb-1">Gender: </h6>

                  <div class="form-check form-check-inline">
                    <form:radiobutton path="sex" class="form-check-input" name="inlineRadioOptions" id="maleGender"
                      value="male" />
                    <label class="form-check-label" for="maleGender">Male</label>
                  </div>

                  <div class="form-check form-check-inline">
                    <form:radiobutton path="sex" class="form-check-input" name="inlineRadioOptions" id="femaleGender"
                      value="option2" />
                    <label class="form-check-label" for="maleGender">Female</label>
                  </div>

                </div>
              </div>
	            
	            <div class="form-outline mb-4">
	              <form:input path="trestbps" min="0.0" type="number" step="any" id="form3Example3" class="form-control" />
	              <label class="form-label" for="form3Example3">Trestbps</label>
	            </div>
	            
	            <div class="form-outline mb-4">
	              <form:input path="chol" min="0.0" type="number" step="any" id="form3Example3" class="form-control" />
	              <label class="form-label" for="form3Example3">Chol</label>
	            </div>
	            
	            <div class="form-outline mb-4">
	              <form:input path="fbs" type="number" min="0.0" step="any" id="form3Example3" class="form-control" />
	              <label class="form-label" for="form3Example3">Fbs</label>
	            </div>
	            
	            <div class="form-outline mb-4">
	              <form:input path="restecg" type="number" step="any" min="0.0" id="form3Example3" class="form-control" />
	              <label class="form-label" for="form3Example3">Restecg</label>
	            </div>
	            
	            <div class="form-outline mb-4">
	              <form:input path="thalach" type="number" step="any" min="0.0" id="form3Example3" class="form-control" />
	              <label class="form-label" for="form3Example3">Thalach</label>
	            </div>
	            
	            <div class="form-outline mb-4">
	              <form:input path="exang" type="number" step="any" min="0.0" id="form3Example3" class="form-control" />
	              <label class="form-label" for="form3Example3">Exang</label>
	            </div>
	            <!-- Submit button -->
	            <button type="submit" style="background-color: #f54245;" class="btn btn-primary btn-block mb-4">
	              Check
	            </button>
				<c:if test="${ response != null }">
				<b>Result: <u>${ response }</u></b> 
				</c:if>

	          </form:form>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
	<!-- Section: Design Block -->
  	
  	
	</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- MDB -->
	<script
	  type="text/javascript"
	  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"
	></script>
</html>