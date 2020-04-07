<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@taglib uri="http://www.springframework.org/tags"  prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<spring:url var="a"        value="/assets/"/>   
<spring:url var="o"        value="/other/"/>   
 
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
        <link href="${a}/index2_files/css" rel="stylesheet">
        <link href="${a}/index2_files/animate.css" rel="stylesheet">
        <link href="${a}/index2_files/bootsnav.css" rel="stylesheet">
        <link href="${a}/index2_files/navstyle.css" rel="stylesheet">



    </head>

    <body  oncontextmenu="return false" style="background-color: ">


        <%@include file="./shared/navbar.jsp"  %>
        <%@include file="./shared/slide2.jsp"  %>
         <br/><br/><br/><br/>
        <%@include file="./shared/aboutidb.jsp"  %>

        <br/><br/><br/><br/>



<!--        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <br/>   -->




















        <%@include file="shared/dispatch.jsp"%>
        <%@include file="./shared/footer.jsp"  %>


























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