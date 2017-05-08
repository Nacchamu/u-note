$(function(){
  $(".toggle").click(function(){
    $(".header-bottom").slideToggle();
    return false;
  });
  $(window).resize(function(){
    var win = $(window).width();
    var p = 480;
    if(win > p){
      $(".header-bottom").show();
    }
  });
});