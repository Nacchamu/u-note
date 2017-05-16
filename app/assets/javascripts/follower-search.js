$(function(){
  function buildHTML(data){
    var thumbnail = $('<a href=""><img class="article__image">');
    var title = $('<div class="article__texts">').append('<p class="article__texts__title">' + data.name);
    // var text = $(title).append('<div class="article__texts__detail">' + data.text).append('<p class="article__texts__user-name">' + data.username).append('<p class="article__texts__date">' + data.created_at);
    var article = $('<div class="article">').append(thumbnail).append(title);
    $('.mypage-user-info').append(article);
  }
  $('.mypage-left__menues__followed').on('click', function(){
    num = $('.user-id').val();
    $.ajax({
      type: 'GET',
      url: '/users/' + num +'/followers',
      data:'',
      dataType: 'json'
    })
    .done(function(data) {
      $('.mypage-user-info').empty();
      $('.mypage-user-info').append('<p>' + 'フォロワー');
      $(data).each(function(index, ele){
        buildHTML(ele);
      })
    })
    .fail(function() {
    })
  });
});
