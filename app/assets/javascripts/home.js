$(document).ready(function(){
    $(".dropdown").hover(
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');
        }
    );

    $("#main-content-1, #main-content-2, #main-content-3, #content-image-1,#content-image-2,#content-image-3").css('opacity', 0);
    $("#time-line-1, #time-line-2, #time-line-3, #time-line-4,#time-line-5").css('opacity', 0);
    $('#main-content-1').waypoint(function() {
        $('#main-content-1').addClass('animated fadeInLeft');
    }, { offset: '70%' });
    $('#main-content-3').waypoint(function() {
        $('#main-content-3').addClass('animated fadeInLeft');
    }, { offset: '70%' });
    $('#main-content-2').waypoint(function() {
        $('#main-content-2').addClass('animated fadeInRight');
    }, { offset: '70%' });

    $('#content-image-1').waypoint(function() {
        $('#content-image-1').addClass('animated fadeInRight');
    }, { offset: '70%' });
    $('#content-image-2').waypoint(function() {
        $('#content-image-2').addClass('animated fadeInLeft');
    }, { offset: '70%' });
    $('#content-image-3').waypoint(function() {
        $('#content-image-3').addClass('animated fadeInRight');
    }, { offset: '70%' });

    $('#time-line-1').waypoint(function() {
        $('#time-line-1').addClass('animated fadeInDown');
    }, { offset: '80%' });
    $('#time-line-2').waypoint(function() {
        $('#time-line-2').addClass('animated fadeInDown');
    }, { offset: '80%' });
    $('#time-line-3').waypoint(function() {
        $('#time-line-3').addClass('animated fadeInDown');
    }, { offset: '80%' });
    $('#time-line-4').waypoint(function() {
        $('#time-line-4').addClass('animated fadeInDown');
    }, { offset: '80%' });
    $('#time-line-5').waypoint(function() {
        $('#time-line-5').addClass('animated fadeInDown');
    }, { offset: '80%' });
});
