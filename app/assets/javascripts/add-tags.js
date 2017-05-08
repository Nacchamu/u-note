$(function(){
  $('.tag-form__left__button').on('click', function(){
    var input = $('.tag-form__left__text').val();
    var text = $('<li class="list">').append(input);
    var list = $(text).append('<input class="remove-button", type="button", value="削除">');
    $('.lists').append(list);
    $('.tag-form__left__text').val('');
  });

  $('.lists').on('click', '.remove-button', function(){
    $(this).parent().remove();
  });
});