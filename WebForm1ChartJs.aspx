<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1ChartJs.aspx.cs" Inherits="QlyMain.WebForm1ChartJs" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Crovex - Admin & Dashboard Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/favicon.ico">

    
</head>

<body>
    <script src="Scripts/chart.js"></script>
        <%--<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>--%>
    <style>
        .chart-container {
            position: relative;
            width: 100%;
            height: 100%;
            max-width: 600px; /* Bạn có thể đặt kích thước tối đa tùy ý */
            min-height: 400px; /* Bạn có thể đặt kích thước tối đa tùy ý */
        }
    </style>
    <div class="chart-container">
            <canvas id="myChart"></canvas>
        </div>


     <script>
         window.onload = function () {
             var labels = <%= Labels %>;
             var appleValues = <%= AppleValues %>;
            var orangeValues = <%= OrangeValues %>;
             var maxYAxisValue = <%= MaxYAxisValue %>;

             var ctx = document.getElementById('myChart').getContext('2d');
             var myChart = new Chart(ctx, {
                 type: 'bar',
                 data: {
                     labels: labels,
                     datasets: [{
                         label: 'Apple',
                         data: appleValues,
                         backgroundColor: 'rgba(255, 99, 132, 0.2)',
                         borderColor: 'rgba(255, 99, 132, 1)',
                         borderWidth: 1
                     }, {
                         label: 'Orange',
                         data: orangeValues,
                         backgroundColor: 'rgba(54, 162, 235, 0.2)',
                         borderColor: 'rgba(54, 162, 235, 1)',
                         borderWidth: 1
                     }]
                 },
                 options: {
                     responsive: true,
                     maintainAspectRatio: false,
                     scales: {
                         y: {
                             beginAtZero: true,
                             //max: maxYAxisValue // Thiết lập giá trị tối đa của trục Y
                         }
                     }
                 }
             });
         };
    </script>
</body>

</html>