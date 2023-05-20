 <%@page import="eddy.vogue.model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <style type="text/css">
 <!--
 @import url("index.css");
 -->
 </style>

<% UserBean user = (UserBean) session.getAttribute("user");
%>

<div class="header">
        <div class="topleft">
            <a href=""><img class="user" src="icons/instagram.png" ></a>
            <a href=""><img class="user" src="icons/twitter.png" ></a>
        </div>

        <div class="middle">
            <div class="topcentre">
                <a href="home.jsp"><img class="logo" src="img/logo.png"></a>
        </div>

        <div class="navbar">
                <ul class="nav">
                    <li><a href="../ProductView.jsp">NOVITÀ</a></li>
                    <li><a href="../ProductView.jsp">DONNA</a></li>
                    <li><a href="../ProductView.jsp">UOMO</a></li>
                    <li><a href="../ProductView.jsp">BRAND</a></li>
                    <li><a href="../ProductView.jsp">SALDI</a></li>
                </ul>
            </div>
            
            <% if(user!=null) { %>
            <h4>Benvenuto: <%= user.getNome()+" "+user.getCognome() %></h4>
            <% } %>
            
        </div>

        <div class="topright">
            <a href="/EddyVogueWeb/addproduct"><img class="user" src="icons/search.png" ></a>
            <a href="/EddyVogueWeb/Carrello.jsp"><img class="user" src="icons/cart.png" ></a>
            <a href="/EddyVogueWeb/login.jsp"><img class="user" src="icons/user.png" ></a>
        </div>
  </div>

    
