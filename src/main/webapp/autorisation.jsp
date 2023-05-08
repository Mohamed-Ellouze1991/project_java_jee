<%@page import="tn.iit.glid2.model.Enseignant"%>
<%@ page import= "javax.servlet.ServletContext" %>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.13/jspdf.plugin.autotable.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
h1 {
    color: red;
    font-size: 24px;
    font-weight: bold;
}

input[type="date"], input[type="number"] {
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
input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #45a049;
}
</style>
</head>
<body> 
<script>

function exportToPdf() {
	
	system.out.println("AAAAAAAAAAAAAAAAAAAA");
    // Créez un objet PDF vide
    var doc = new jsPDF();

    // Ajoutez le contenu de votre tableau au document PDF
    doc.autoTable({
        html: '#my-table'
    });

    // Téléchargez le document PDF généré
    doc.save('tableau.pdf');
    system.out.println("mmmmmmmmmmmmmmm");
}
 </script>
<font size="3" color="red">${message }</font>
 
<%-- class="tn.iit.glid2.model.Autorisation"  --%>
<%-- scope="session"></jsp:useBean> --%>
<form action="AutorisationServlet" method="post">
<table border="1" class="table table-striped" id="my-table">
<tr>
	<th>Date</th>
	<th>Nombre d Heure autorisation</th>
	 
<core:forEach items="${listAutorisation }" var="autorisation" varStatus="theCount">
 <tr>
    <td>${autorisation.date }</td>
    <td>${autorisation.nb_heure }</td>
   
  
  </tr>
</core:forEach>
<tfoot>
<tr>
  <td><strong>Total des heures réaliser :</strong></td>
  <td><strong><core:out value="${sum}" /></strong></td>
</tr>
</tfoot>
<tfoot>
<tr>
  <td><strong>Nombre d Heure restante dans l anne ${anneeActuelle}  :</strong></td>
  <td><strong><core:out value="${NbHeureRealiser}" /></strong></td>
</tr>
</tfoot>
</table>	
<button onclick="exportToPdf()">Export PDF</button>	
<div class="form-group">
<label for="date">Date :</label>
<input type="date" name="date" id="date">
</div>
<div class="form-group">
<label for="nb_heure">Nombre d'Heure :</label>
<input type="number" name="nb_heure" id="nb_heure">
</div>
<div class="form-group">
<input type="hidden" name="id" value="${currentEnseigant.id}">
<input type="submit" value="Valider">
</div>
	
	 
			 
	</form>
</body>
</html>