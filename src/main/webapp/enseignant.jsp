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