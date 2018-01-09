<!-- The two JSP page directives below allow the Core (c:) and Shiro (shiro:) taglibraries in the page. -->
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  ~ Copyright (c) 2013 Les Hazlewood and contributors
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~     http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Step 4: change a web user interface based on who the user is with the help of shiro JSP tag library.
  You can turn off or on entire page sections, features and UI components. Shiro supports many other useful  
  JSP tags that you can use to customise the UI based on various things known about the current Subject.
  --%>
<jsp:include page="include.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>Apache Shiro Tutorial Webapp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Add some nice styling and functionality.  We'll just use Twitter Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap-theme.min.css">
    <style>
        body{padding:0 20px;}
    </style>
</head>
<body>

    <h1>Apache Shiro Tutorial Webapp</h1>

    <p>Hi <shiro:guest>Guest</shiro:guest><shiro:user>
        <%
            //This should never be done in a normal page and should exist in a proper MVC controller of some sort, but for this
            //tutorial, we'll just pull out Stormpath Account data from Shiro's PrincipalCollection to reference in the
            //<c:out/> tag next:
            request.setAttribute("account", org.apache.shiro.SecurityUtils.getSubject().getPrincipals().oneByType(java.util.Map.class));

        %>
        <%-- <shiro:guest>: This tag will only display its internal contents if the current Shiro Subject is an application 'guest'.
        	 <shiro:user>: This tag will only display its internal contents if the current Shiro Subject is an application ‘user’. 
        	 Shiro defines a user as any Subject that is currently logged in to (authenticated with) the application or one that is 
        	 remembered from a previous login (using Shiro’s ‘remember me’ functionality).
        	  ‘Log in’ and ‘Log out’ are hyperlinks to the ‘/login.jsp’ and ‘/logout’ urls handled respectively by the Shiro authc
        	  and logout filter. --%>
        <c:out value="${account.givenName}"/></shiro:user>!
        ( <shiro:user><a href="<c:url value="/logout"/>">Log out</a></shiro:user>
        <shiro:guest><a href="<c:url value="/login.jsp"/>">Log in</a></shiro:guest> )
    </p>

    <p>Welcome to the Apache Shiro Tutorial Webapp.  This page represents the home page of any web application.</p>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</body>
</html>
