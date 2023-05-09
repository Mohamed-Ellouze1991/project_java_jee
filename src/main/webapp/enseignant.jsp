<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">  
<title> Login Page </title>  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
 


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

  <style>Body {  
	  font-family: Calibri, Helvetica, sans-serif;  
	   
  }  
  button {   
         background-color: #4CAF50;   
          width: 40%;  
          color: white;   
          padding: 15px;   
          margin: 10px 0px;   
          border: none;   
          cursor: pointer;   
           }   
      
   input[type=text], input[type=password] ,input[type=number] ,input[type=email] {   
          width: 40%;   
          margin: 8px 0;  
          padding: 12px 20px;   
          display: inline-block;   
          border: 2px solid green;   
          box-sizing: border-box;   
       
      }  
   button:hover {   
          opacity: 0.7;   
      }   
    .cancelbtn {   
          width: auto;   
          padding: 10px 18px;  
          margin: 10px 5px;  
      }   
          
       
   .container {   
          padding: 25px;   
          background-color: lightblue;  
      }   
 
</style> 
<%@include file="navbar.jsp"%>
</head>
<body>


 <h1> Ajout  enseignant </h1>   
	
<div>

	<form action="MajEnseignantController" method="post">
	<div class="form-group">
		<label for="nom">Nom :</label>
		<input type="text" class="form-control" name="nom" value="">
	</div>
	<div class="form-group">
		<label for="prenom">Prénom :</label>
		<input  type="text" class="form-control" type="text" name="prenom" value="">
	</div>
	<div class="form-group">
		<label for="telephone">Téléphone :</label>
		<input type="number" class="form-control" name="telephone" value=""">
	</div>
	<div class="form-group">
	<label for="email">Email :</label>
	<input type="email" class="form-control" name="Email" value="">
</div>
	<input type="submit" class="btn btn-primary" value="Valider"></td>
</form>
</div>
</body>
</html>