$(function(){
  $(".mypage-left__menues__delete-button").click(function(e){
    var result = confirm('本当によろしいですか？');
    if(result) {
    } else {
      return false;
    }
  });
});
