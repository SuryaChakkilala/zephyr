<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>

<html>
	<head>
		<title>Products</title>
		<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
   
	    <link rel="stylesheet" href="/css/main.css">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	</head>
	<style>
		.menu{
	    padding: 0;
	    display: grid;
	    grid-template-columns: repeat( auto-fit, minmax(350px,1fr));
	    grid-gap: 20px 40px;
	}
	.heading{
	    background-color: #96323d;
	    color: #ffffff;
	    margin-bottom: 30px;
	    padding: 20px 0 30px 0;
	    grid-column: 1/-1;
	    text-align: center;
	}
	.heading>h1{
	    font-weight: 400;
	    font-size: 30px;
	    letter-spacing: 10px;
	    margin-bottom: 10px;
	}
	.heading>h3{
	    font-weight: 600;
	    font-size: 22px;
	    letter-spacing: 5px;
	}
	.food-items{
	    display: grid;
	    position: relative;
	    grid-template-rows: auto 1fr;
	    border-radius: 15px;
	    box-shadow: 0 0 15px rgba(0,0,0,0.1);
	    margin: 0 20px;
	}
	.food-items img{
	    position: relative;
	    width: 100%;
	    border-radius: 10px 10px 0 0;
	
	}
	
	.details{
	    padding: 20px 10px;
	    display: grid;
	    grid-template-rows: auto 1fr 50px;
	    grid-row-gap: 15px;
	}
	.details-sub{
	    display: grid;
	    grid-template-columns: auto auto;
	}
	.details-sub>h5{
	    font-weight: 600;
	    font-size: 18px;
	}
	.price{
	    text-align: right;
	}
	.details>p{
	    color: #6f6f6f;
	    font-size: 15px;
	    line-height: 28px;
	    font-weight: 400;
	    align-self: stretch;
	}
	.details>button{
	    background-color: #FFC839;
	    border: none;
	    color: #ffffff;
	    font-size: 16px;
	    font-weight: 600;
	    border-radius: 5px;
	    width: 180px;
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
          <form class="d-flex" action="/products/search" method="GET">
            <input class="form-control me-1" type="text" placeholder="Search for Products.." aria-label="Search" name="search" style="border-radius: 10px; width: 300px;">
            <button class="btn btn-outline-light" type="submit" style="background: #96323d;border-radius: 40px;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
              <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg></button>
            </form>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
  
		<div class="menu">
			<div class="heading">
				Products
			</div>
			<c:forEach var="product" items="${ products }" >
				<div class="food-items">
					<div class="details">
						<div class="details-sub">
							<h5>${ product.name }</h5>
							<h5 class="price">Rs. ${ product.price }</h5>
						</div>
						<p class="product_text">${ product.description } </p>
						<a class="btn btn-success" href="/buy/${ product.productId }">Buy Now</a>
					</div>
				</div>
			</c:forEach>
		</div>
		
	</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>