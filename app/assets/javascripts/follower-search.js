$(function(){
  function buildHTML(data){
    var thumbnail = $('<a href="/mypages/' + data.id + '"><img class="article__image" src="'+ data.avatar.url +'">');
    var title = $('<div class="article__texts">').append('<a href="/mypages/' + data.id + '" style="text-decoration: none;"><p class="article__texts__title" style="text-decoration:">' + data.name);
    var text = $(title).append('<div class="article__texts__detail">' + data.profiel);
    var article = $('<div class="article">').append(thumbnail).append(text);
    $('.mypage-right').append(article);
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
      $('.mypage-right').empty();
      $('.mypage-right').append('<p>' + 'フォロワー');
      $(data).each(function(index, ele){
        buildHTML(ele);
      })
    })
    .fail(function() {
    })
  });
});
