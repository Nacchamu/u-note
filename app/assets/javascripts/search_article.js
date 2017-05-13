$(function() {
  function buildHTML(data){
    var thumbnail = $('<a href=""><img class="article__image" src="' + data.thumbnail + '">');
    console.log(data.thumbnail);
    var title = $('<div class="article__texts">').append('<a href=""><p class="article__texts__title">' + data.title);
    var text = $(title).append('<div class="article__texts__detail">' + data.text).append('<p class="article__texts__date">' + data.created_at);
    var article = $('<div class="article">').append(thumbnail).append(text);
    $('.body__right').append(article);
  }
  $('.header__search__text').keypress(function(e){
    var input = $('.header__search__text').val();
    if ( e.which == 13 ) {
      $.ajax({
        type:'GET',
        url: '/search',
        data: {
          title: input
        },
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
      return false;
    }
  });
});