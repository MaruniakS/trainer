$(document).ready(function(){
    var ctx = $("#myChart");
    var data = $('#chart-data').data('data');
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: data
    });
});