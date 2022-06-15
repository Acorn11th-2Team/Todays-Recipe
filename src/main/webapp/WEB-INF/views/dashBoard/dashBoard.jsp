<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="kor" xml:lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<!-- Load the AJAX API -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<!--jQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
    
  //<![CDATA[
    // Load the Visualization API and the corechart package.
    // Visualization API및 corechart패키지를 로드합니다.
    google.charts.load('current', {'packages' : ['corechart']});

    // Set a callback to run when the Google Visualization API is loaded
    //Google Visualization API가 로드될 때 실행할 콜백을 설정합니다.
    google.charts.setOnLoadCallback(drawChart);

    //Callback that creates and populates a data table,
    //instantiates the pie chart, passes in the data and
    // draws it.
    //데이터 테이블을 만들고 채우는 콜백입니다.
    //원형 차트를 인스턴스화하고 데이터를 전달하며 그립니다.
    

      function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'orderday');
        data.addColumn('number', 'sales');
        data.addRows([
        	${daysales}
        ]);

        var options = {
          title: '일별 매출 통계'
        };

        var chart = new google.visualization.BarChart(document.getElementById('barchart'));

        chart.draw(data, options);
      }
</script>
</head>
<body>
	<div style="width: 10%; float: left;">
		<jsp:include page="../table/adminMenu.jsp"></jsp:include>
	</div>
	<div id="barchart" style="width: 900px; height: 500px; margin: 0 auto;"></div>
</body>
</html>