$(function(){
    $(".toggle-comments").click(function(){
        $("#comment").slideToggle("slow");
    });

    $(".social-icon img").hover(function() {
        $(this).parent().next("span").animate({opacity: "show", top: "210"}, "slow");}, function(){
            $(this).parent().next("span").animate({opacity: "hide", top: "220"}, "fast");
        });
});
