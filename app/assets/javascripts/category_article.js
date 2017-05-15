$(function(){
  function buildHTML(data){
    var thumbnail = $('<a href=""><img class="article__image" src="' + data.thumbnail.url + '">');
    console.log(data.thumbnail);
    var title = $('<div class="article__texts">').append('<a href="/notes/' + data.id + '"><p class="article__texts__title">' + data.title);
    var text = $(title).append('<div class="article__texts__detail">' + data.text).append('<p class="article__texts__user-name">' + data.username).append('<p class="article__texts__date">' + data.created_at);
    var article = $('<div class="article">').append(thumbnail).append(text);
    $('.body__right').append(article);
  }
  $('.body__left__categories__category').on('click', function(){
    num = $(this).children('input').val();
    $.ajax({
      type: 'GET',
      url: '/category_search/' + num,
      data:'',
      dataType: 'json'
    })
    .done(function(data) {
      $('.body__right').empty();
      $(data).each(function(index, ele){
        buildHTML(ele);
      })
    })
    .fail(function() {
    })
  });
});