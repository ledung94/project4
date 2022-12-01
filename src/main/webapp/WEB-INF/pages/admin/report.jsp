<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý nhãn hiệu</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>
	window.onload = function() {
		var data = [];
		var label = [];
		var dataTotalForDataSets = [];
		var dataCostForDataSets = [];

		$.ajax({
			async : false,
			type : "GET",
			data : data,
			contentType : "application/json",
			url : "http://localhost:8080/mobileshop/api/order/report",
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					label.push(data[i][0] + "/" + data[i][1]);
					dataTotalForDataSets.push(data[i][2]/1000000);
					dataCostForDataSets.push(data[i][3]/1000000);
				}
			},
			error : function(e) {
				alert("Error: ", e);
				console.log("Error", e);
			}
		});

		var canvas = document.getElementById('myChart');
		
		
		data = {
			labels : label,
			datasets : [ 
				{
					label : "Tổng doanh thu ( Triệu đồng)",
					backgroundColor : "#ffb1c2",
					borderColor : "#ffb1c2",
					borderWidth : 2,
					hoverBackgroundColor : "#0043ff",
					hoverBorderColor : "#0043ff",
					data : dataTotalForDataSets,
				},
				{
					label : "Tổng chi phí ( Triệu đồng)",
					backgroundColor : "#9cd0f6",
					borderColor : "#9cd0f6",
					borderWidth : 2,
					hoverBackgroundColor : "#0043ff",
					hoverBorderColor : "#0043ff",
					data : dataCostForDataSets,
				}
			]
		};
		var option = {
		  type: 'bar',
		  data: data,
		  options: {
		    responsive: true,
		    plugins: {
		      legend: {
		        position: 'top',
		      },
		      title: {
		        display: true,
		        text: 'Chart.js Bar Chart'
		      }
		    }
		  },
		};

		var myBarChart = Chart.Bar(canvas, {
			data : data,
			options : option
		});
	}
</script>

</head>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<jsp:include page="template/sidebar.jsp"></jsp:include>

	<div class="col-md-9 animated bounce">
		<h3 class="page-header">Thống kê</h3>

		<canvas id="myChart" width="600px" height="400px"></canvas>
		<h4 style="text-align: center; padding-right: 10%">Biểu đồ tổng giá trị đơn hàng hoàn thành theo tháng</h4>

	</div>


	<jsp:include page="template/footer.jsp"></jsp:include>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.3/Chart.min.js"></script>
</body>
</html>