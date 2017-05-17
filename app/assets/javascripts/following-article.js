$(function(){
  function buildHTML(data){
    var thumbnail = $('<a href=""><img class="article__image" src=' + data.article.thumbnail + '>');
    var title = $('<div class="article__texts">').append('<p class="article__texts__title">' + data.article.title);
    // var text = $(title).append('<div class="article__texts__detail">' + data.text).append('<p class="article__texts__user-name">' + data.username).append('<p class="article__texts__date">' + data.created_at);
    var article = $('<div class="article">').append(thumbnail).append(title);;
    $('.mypage-right').append(article);
  }
  $('.mypage-left__menues__following-article').on('click', function(){
    num = $('.user-id').val();
    $.ajax({
      type: 'GET',
      url: '/users/' + num +'/following_article',
      data:'',
      dataType: 'json'
    })
    .done(function(data) {
      $('.mypage-right').empty();
      $('.mypage-right').append('<p>' + 'フォロー記事');
      $(data).each(function(index, ele){
        buildHTML(ele);
      })
    })
    .fail(function() {
    })
  });
});