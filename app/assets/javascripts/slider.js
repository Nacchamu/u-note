$(function(){
  var page = 0;
  var lastPage = Number($(".slide__image").length-1);
  $(".slide__image").css("display", "none");
  $(".slide__image").eq(page).css("display", "block");
  function changePage(){
    $(".slide__image").fadeOut(1000);
    $(".slide__image").eq(page).fadeIn(1000);
  };
  var Timer;
  function startTimer(){
    Timer = setInterval(function(){
      if(page === lastPage){
        page = 0;
        changePage();
      }else{
        page ++;
        changePage();
      };
    },5000);
  }
  function stopTimer(){
  clearInterval(Timer);
  }
  startTimer();
});