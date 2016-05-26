$(document).ready(function(){
    $('a[data-toggle="tooltip"]').tooltip({
        animated: 'fade',
        placement: 'bottom',
        html: true
    });
    $('#joint-select').multiselect({
        nonSelectedText: 'Немає',
        buttonWidth: '100%',
        dropRight: true
    });
});
