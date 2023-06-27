 <%@page import="eddy.vogue.model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <style type="text/css">
 <!--
 @import url("styles/admin-dash.css");
 -->
 </style>
 <nav class="main-menu">
      <ul>
        <li>
          <a href="admin-dashboard.jsp">
            <i class="fa fa-dashboard"></i>
            <span class="nav-text"> Dashboard </span>
          </a>
        </li>

        <li class="has-subnav">
          <a href="admin-product.jsp">
            <i class="fa fa-dropbox"></i>
            <span class="nav-text"> Prodotti </span>
          </a>
        </li>

        <li class="has-subnav">
          <a href="admin-order.jsp">
            <i class="fa fa-shopping-cart"></i>
            <span class="nav-text"> Ordini </span>
          </a>
        </li>

        <li class="has-subnav">
          <a href="admin-user.jsp">
            <i class="fa fa-users fa-2x"></i>
            <span class="nav-text"> Utenti </span>
          </a>
        </li>

        <li class="has-subnav">
          <a href="#">
            <i class="fa fa-power-off fa-2x"></i>
            <span class="nav-text"> Logout </span>
          </a>
        </li>
      </ul>
    </nav>