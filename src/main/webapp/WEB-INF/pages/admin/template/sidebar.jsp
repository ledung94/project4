<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<div class="container-fluid">
    <div class="col-md-3">

      <div id="sidebar">
        <div class="container-fluid tmargin">
          <div class="input-group">
<!--             <input type="text" class="form-control" placeholder="Search..." />
            <span class="input-group-btn">
              <button class="btn btn-default">
                <span class="glyphicon glyphicon-search"></span>
              </button>
            </span> -->
          </div>
        </div>

        <ul class="nav navbar-nav side-bar">       
         
          <li class="side-bar tmargin">
            <a href="<c:url value='/admin/order' />">
              <span class="glyphicon glyphicon-shopping-cart">&nbsp;</span>Quản lý Đơn hàng</a>
          </li>
        
          <li class="side-bar">
            <a href='<c:url value="/admin/product"/>' >
              <span class="glyphicon glyphicon-folder-open">&nbsp;</span>Quản lý Sản phẩm</a>
          </li>
        
          <li class="side-bar">
            <a href='<c:url value="/admin/category"/>'>
              <span class="glyphicon glyphicon-tasks">&nbsp;</span>Quản lý Danh Mục</a>
          </li>
          
          <li class="side-bar">
            <a href='<c:url value="/admin/manufacturer"/>' >
              <span class="glyphicon glyphicon-flag">&nbsp;</span>Quản lý Nhãn hiệu</a>
          </li>

          <li class="side-bar main-menu">
            <a href="<c:url value='/admin/account' />">
              <span class="glyphicon glyphicon-th-list">&nbsp;</span>Quản lý Tài khoản</a>
          </li>
          
          <li class="side-bar main-menu">
            <a href="<c:url value='/admin/contact' />">
              <span class="glyphicon glyphicon-envelope">&nbsp;</span>Quản lý Liên Hệ</a>
          </li>
          
          <li class="side-bar main-menu">
            <a href="<c:url value='/admin/report' />">
              <span class="glyphicon glyphicon-signal">&nbsp;</span>Thống kê</a>
          </li>
          
          <li class="side-bar">
            <a href="<c:url value='/admin/profile' />">
              <span class="glyphicon glyphicon-user">&nbsp;</span>Thông tin cá nhân</a>
          </li>

        </ul>
      </div>
    </div>
    
    <script src="<c:url value='/js/admin.js'/>" ></script>
