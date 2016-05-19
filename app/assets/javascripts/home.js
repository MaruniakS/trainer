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
    $('#main-content-1').waypoint(function() {
        $('#main-content-1').addClass('animated fadeInLeft');
    }, { offset: '50%' });
    $('#main-content-3').waypoint(function() {
        $('#main-content-3').addClass('animated fadeInLeft');
    }, { offset: '50%' });
    $('#main-content-2').waypoint(function() {
        $('#main-content-2').addClass('animated fadeInRight');
    }, { offset: '50%' });

    $('#content-image-1').waypoint(function() {
        $('#content-image-1').addClass('animated fadeInRight');
    }, { offset: '50%' });
    $('#content-image-2').waypoint(function() {
        $('#content-image-2').addClass('animated fadeInLeft');
    }, { offset: '50%' });
    $('#content-image-3').waypoint(function() {
        $('#content-image-3').addClass('animated fadeInRight');
    }, { offset: '50%' });
});
