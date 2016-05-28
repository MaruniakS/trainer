$(document).ready(function() {
    var time = $('#timepicker').timepicker({
        showMeridian: false,
        icons: {
            up: 'glyphicon glyphicon-chevron-up',
            down: 'glyphicon glyphicon-chevron-down'
        }

    });
    $('#timepicker_span').click(function(){
        $('#timepicker').timepicker('showWidget');
    });
});