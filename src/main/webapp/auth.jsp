<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>   
<head>  
<meta name="viewport" content="width=device-width, initial-scale=1">  
<title> Login Page </title>  
<style>   
Body {  
  font-family: Calibri, Helvetica, sans-serif;  
   
}  
button {   
       background-color: #4CAF50;   
        width: 100%;  
        color: white;   
        padding: 15px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
         }   
    
 input[type=text], input[type=password] {   
        width: 100%;   
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
        
     
  
</style>   
</head>    
<body>    
    <center> <h1> Student Login Form </h1> </center>   
    <font size="3" color="red">${errorMessage }</font>
    <form method='post' action='AuthController'>  
        <div class="container">   
            <label>Username : </label>   
            <input type="text" placeholder="Enter Username" name="login" required> <br> 
            <label>Password : </label>   
            <input type="password" placeholder="Enter Password" name="pwd" required>  
            <button type="submit">Login</button>   
            <input type="checkbox" checked="checked"> Remember me   
            <button type="button" class="cancelbtn"> Cancel</button> 
            <button type="button" class="cancelbtn" onclick="window.location.href = 'inscription.jsp';">S'inscrire</button>
              
           
        </div>   
    </form>     
</body>     
</html>  