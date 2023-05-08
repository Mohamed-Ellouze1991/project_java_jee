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
<style>
input[type="text"], input[type="password"], input[type="email"] {
    width: 50%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 16px;
    margin-bottom: 10px;
}

label {
    display: block;
    margin-bottom: 10px;
  }
/* styles for form submit button */
input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

 
</style> 
<%@include file="navbar.jsp"%>
</head>
<body>
<jsp:useBean id="currentInscription" 
class="tn.iit.glid2.model.Utilisateur"
scope="session"
></jsp:useBean>
	
	
	
<div>

	<form action="InscriptionController" method="post">
	<div class="form-group">
		<label for="nom">Nom :</label>
		<input type="text" class="form-control" name="nom" value="${currentInscription.nom }">
	</div>
	<div class="form-group">
		<label for="prenom">Prénom :</label>
		<input  type="text" class="form-control" type="text" name="prenom" value="${currentInscription.prenom }">
	</div>
	<div class="form-group">
		<label for="email">Login :</label>
		<input type="text" class="form-control" name="login" value="${currentInscription.login }">
	</div>
	<div class="form-group">
	<label for="email">Mot de passe :</label>
	<input type="password" class="form-control" name="pwd" value="${currentInscription.pwd }">
</div>
	<input type="submit" value="Valider"></td>
</form>
</div>
</body>
</html>