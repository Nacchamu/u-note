$(function(){
  function buildHTML(data){
    var thumbnail = $('<a href="/notes/' + data.id + '"><img class="article__image" src="' + data.thumbnail.url + '">');
    var title = $('<div class="article__texts">').append('<a href="/notes/' + data.id + '"  style="text-decoration: none;" ><p class="article__texts__title" style="color: black;">' + data.title );
    var text = $(title).append('<div class="article__texts__detail">' + data.text).append('<a href="/mypages/' + data.userid + '" style="text-decoration: none;"><p class="article__texts__user-name" style="color: black;">' + data.username).append('<p class="article__texts__date">' + data.created_at);
    var article = $('<div class="article">').append(thumbnail).append(title);
    $('.mypage-right').append(article);
  }
  $('.mypage-left__menues__following-article').on('click', function(){
    num = $('.user-id').val();
    $.ajax({
      type: 'GET',
      url: '/users/' + num +'/following',
      data:'',
      dataType: 'json'
    })
    .done(function(data) {
      $('.mypage-right').empty();
      $('.mypage-right').append('<p>' + 'フォロー記事');
      $.ajax({
        type: 'GET',
        url: '/users/' + num +'/following_article',
        data:{
          followed_users: data
        },
        dataType: 'json'
      })
      .done(function(articles) {
        $(articles).each(function(index, article){
          buildHTML(article);
        })
      })
      .fail(function(){
      })
    })
    .fail(function() {
    })
  });
});