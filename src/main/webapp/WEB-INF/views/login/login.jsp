<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@taglib uri="http://www.springframework.org/tags"  prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 



<spring:url var="a"        value="/assets/"/>   

<spring:url var="css"     value="/css/"/>
<spring:url var="js"      value="/js/"/>
<spring:url var="images"  value="/images/"/> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <link rel = "icon" type = "image/png" href ="${a}/index2_files/idb-bisew.png">
        <title>

            IDB UNIVERSITY |  Bangladesh  </title>

        <link rel="stylesheet" href="${a}/index2_files/jquery.dataTables.min.css">
        <link rel="stylesheet" href="${a}/index2_files/bootstrap.min.css">
        <link rel="stylesheet" href="${a}/index2_files/style.css">
        <link rel="stylesheet" href="${a}/index2_files/tabs.css">
        <link rel="stylesheet" href="${a}/index2_files/style3.css">
        <link rel="stylesheet" href="${a}/index2_files/owl.carousel.css">
        <link rel="stylesheet" href="${a}/index2_files/owl.theme.css">
        <link rel="stylesheet" href="${a}/index2_files/font-awesome.min.css">
        <link rel="stylesheet" href="${a}/index2_files/style(1).css">
        <link rel="stylesheet" href="${a}/index2_files/jquery.mCustomScrollbar.css">
        <link rel="stylesheet" href="${a}/index2_files/jquery.bxslider.min.css">
        <link rel="stylesheet" href="${a}/index2_files/jquery.dataTables.min.css">
        <link rel="stylesheet" href="${a}/index2_files/css" >
        <link rel="stylesheet" href="${a}/index2_files/animate.css" >
        <link rel="stylesheet" href="${a}/index2_files/bootsnav.css" >
        <link rel="stylesheet" href="${a}/index2_files/navstyle.css" >



    </head>

    <body  oncontextmenu="return false" style="background-color: white">
 
      
        <c:if test="${userClickLogin == true}">
        <div class="row">
            
            <div class="col-md-3"> 
                
            </div>
            <div class="col-md-6 "> 
            <br/>
            <br/>
            <br/>
                <div class="bg-success"> 
                <!--Login Form Start--> 
                     <br/>

                     <h1 style="padding-left:  30px ; color: black">IDB UNIVERSITY  BANGLADESH</h1>
                
                     <center ><span class="btn btn-primary"> Log In Panel</span>
                     </center> 
                     
                     <c:if test="${message != null}">
                         <br/>
                     <p style="padding-left:  30px; color: red; font-weight: bold; font-size: 20px"> ${message}</p>

                    </c:if>

                     <form:form action="${contextRoot}/home/login" method="post" modelAttribute="user">
                        
                          <h4 style="padding-left:  20px">User's Email Address :</h4>
                         <div style="padding-left:  20px; padding-right: 20px">
                            <form:input   class="form-control"  path="email" type="email" placeholder="User's Email Address " required="true" /> 
                        </div> 
                        
                        <br/>
                        <br/>
                          <h4 style="padding-left:  20px">User's Password :</h4>
                         <div style="padding-left:  20px; padding-right: 20px">
                            <form:input type="password"  class="form-control"  path="password" placeholder="User's Password " required="true" /> 
                        </div>


                        <br/>
                       
                        <center>
                            <button type="submit" class="btn btn-primary">Log In</button>
                        </center>
                     </form:form> <br/>                        
                        <center>
                        <p  style="padding-left:20px"> Don't have an account ? </p>
                        
                        <p ><a href="${contextRoot}/home/register" class="btn btn-primary"> Register</a></P>
                    
                    </center>
                    
                   <br/>
            <br/>
            <br/>  
                </div>
            
            </div>
            <div class="col-md-3"></div>
            
            
            
        </div>    
        
         </c:if>  
        
        
        <!-- This is for Register   -->
             
        
        <c:if test="${userClickRegister == true}">
                            
        
        <div class="row">
            
            <div class="col-md-3"> 
                
            </div>
            <div class="col-md-6 "> 
            <br/>
            <br/>
            <br/>
                <div class="bg-success"> 
                <!--Login Form Start--> 
                     <br/>

                     <h1 style="padding-left:  30px ; color: black">IDB UNIVERSITY  BANGLADESH</h1>
                
                     <center > 
                         <span class="btn btn-primary"> Registration Panel</span>
                     </center> 
                     
                     <c:if test="${error != null}">
                         <br/>
                     <p style="padding-left:  30px; color: red; font-weight: bold; font-size: 20px"> ${error}</p>

                    </c:if>

                     <form:form action="${contextRoot}/home/register" method="post" modelAttribute="user2">
                        
                          <h4 style="padding-left:  20px">Select Your User Type :</h4>
                         <div style="padding-left:  20px; padding-right: 20px">
                            <form:select   class="form-control"  path="user_role" type="role" placeholder="role " required="true" > 
                            
                                <option></option>
                                <option value="admin"> Admin</option>
                                <option value="student">Student</option>
                                <option value="teacher"> Teacher</option>
                                
                            </form:select>
                        </div> 
                        
                       
                      
                          <h4 class="form-group" style="padding-left:  20px">Write Here Your Obtained  ID :</h4>
                         <div style="padding-left:  20px; padding-right: 20px">
                            <form:input class="form-control"  path="role_id" placeholder="User's Obtained  ID  " required="true" /> 
                        </div> 
                        
                        
                          <h4 style="padding-left:  20px">Write A New Email Address :</h4>
                         <div style="padding-left:  20px; padding-right: 20px">
                            <form:input type="email"  class="form-control"  path="email" placeholder="Write A New Email Address" required="true" /> 
                        </div>
                          
                        <h4 style="padding-left:  20px">Write A New Password :</h4>
                         <div style="padding-left:  20px; padding-right: 20px">
                            <form:input type="password"  class="form-control"  path="password" placeholder="Write A New Password" required="true" /> 
                        </div>


                        <br/>
                       
                        <center>
                            <button type="submit" class="btn btn-primary">Sign Up</button>
                        </center>
                     </form:form> <br/>                        
                        <center>
                        <p  style="padding-left:20px"> Already  have you an Account ? </p>
                        
                        <p ><a href="${contextRoot}/home/gotologin" class="btn btn-primary"> Log In</a></P>
                    
                    </center>
                    
                   <br/>
            <br/>
            <br/>  
                </div>
            
            </div>
            <div class="col-md-3"></div>
            
            
            
        </div>    

  </c:if> 
        
        
        
        <c:if test="${userRegisterSuccess == true}">
                    <br/>
                     <p style="padding-left:  30px; color: black; font-weight: bold; font-size: 20px"> ${success}</p>
                         
        </c:if>    






















            
                      
                
 


        <script src="../assets/js/jquery.js"></script>
        <script src="${a}/index2_files/jquery.min.js.download"></script>
        <script src="${a}/index2_files/jquery.mCustomScrollbar.concat.min.js.download"></script>
        <script src="${a}/index2_files/tabs.js.download"></script>
        <script src="${a}/index2_files/jquery.bxslider.min.js.download"></script>
        <!-- Bootstrap JavaScript -->
        <script src="${a}/index2_files/bootstrap.min.js.download" type="text/javascript"></script>
        <!-- carousel.min JavaScript -->
        <script src="${a}/index2_files/owl.carousel.min.js.download" type="text/javascript"></script>
        <script src="${a}/index2_files/jquery.bootstrap.newsbox.min.js.download" type="text/javascript"></script>
        <script src="${a}/index2_files/scroling.js.download"></script>
        <script src="${a}/index2_files/tabs.js.download"></script>
        <script src="${a}/index2_files/bootsnav.js.download"></script>  
        <script src="${a}/index2_files/jquery.dataTables.min.js.download" type="text/javascript"></script>
        <script src="${a}/index2_files/custom.js.download" type="text/javascript"></script>


    </body>
</html>