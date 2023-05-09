<%@page import="tn.iit.glid2.model.Enseignant"%>
<%@ page import= "javax.servlet.ServletContext" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style>   
table {
	  border-collapse: collapse;
	  width: 100%;
	}

	th, td {
	  text-align: center;
	  padding: 8px;
	}

	th {
	  background-color: #4CAF50;
	  color: white;
	}

	tr:nth-child(even) {
	  background-color: #f2f2f2;
	}
</style>   
<%@include file="navbar.jsp"%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%-- <jsp:useBean id="currentUser"  --%>
<%-- class="tn.iit.glid2.model.Enseignant"  --%>
<%-- scope="session"></jsp:useBean> --%>

<%
String search = request.getParameter("search"); 
//EnseignantDAO enseignantDao = new EnseignantDAO();
 
//List<Enseignant> enseignants=enseignantDao.getAll();  //(List<Enseignant>) request.getAttribute("listEnseignant");

%>
<script>
function resetForm() {
  document.getElementById("search").value = "";
  document.getElementsByTagName("form")[0].submit();
}
</script>
<form action="EnseignantControlleur" method="post">

<!-- barre de recherch -->
<div class="row">
<div class="col-sm-8">
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" id="search-addon"><i class="fa fa-search"></i></span>
    </div>
    <input type="text" class="form-control" placeholder="Recherche" aria-label="Recherche" aria-describedby="search-addon"  id="search" name="search" >
  </div>
</div>
<div class="col-sm-4 text-right">
  <button type="submit" class="btn btn-primary">Rechercher</button>
  <button type="submit" class="btn btn-secondary ml-2" onclick="resetForm()">Réinitialiser</button>
  <button type="button" class="btn btn-primary" onclick="window.location.href = 'enseignant.jsp';">Ajout enseignant</button>

</div>
</div>
<br>


<!-- tableau -->

<table border="1" class="table table-striped">
<tr>
	<th>Nom</th>
	<th>Prénom</th>
	<th>Téléphone</th>
	<th>email</th>
	<th>Action</th></tr>
<core:forEach items="${listEnseignant }" var="enseignant" varStatus="theCount">
 <tr>
    <td>${enseignant.nom }</td>
    <td>${enseignant.prenom }</td>
    <td>${enseignant.telephone }</td>
    <td>${enseignant.email }</td>
   
   
    <td>
    
   
    	<a href="AutorisationServlet?id=${enseignant.id}">
    	<i class="fa fa-plus-circle"></i>
    	</a>
    
      <a href="UpdateServlet?id=${theCount.index}">
       <i class="fas fa-edit"></i>
      </a>
      
   
      
  </td>
  </tr>
</core:forEach>
</table>
</form>

</body>
</html>