$(function(){
  var href = location.pathname;
  var count_text = $('.show-inner__SNS-box__fav-count__size').text();
  var count = Number(count_text);
  $('.show-inner__SNS-box__fav-count').on('click', function(){
    var val = $('.show-inner__SNS-box__fav-count__button').val();
    if(val === 'お気に入り'){
      $('.show-inner__SNS-box__fav-count__button').remove();
      $('.show-inner__SNS-box__fav-count').append('<input class="show-inner__SNS-box__fav-count__button" type= "submit" value= "お気に入り済み">');
      count += 1
      $('.show-inner__SNS-box__fav-count__size').text('');
      $('.show-inner__SNS-box__fav-count__size').append(count);
      $.ajax({
        type: 'POST',
        url: href + '/favorites',
        data:'',
        dataType: 'json'
      })
    }else{
      var num_text = $('.show-inner__SNS-box__fav-count__already').val();
      var num = Number(num_text);
      $('.show-inner__SNS-box__fav-count__button').remove();
      $('.show-inner__SNS-box__fav-count').append('<input class="show-inner__SNS-box__fav-count__button" type= "submit" value= "お気に入り">');
      count -= 1
      $('.show-inner__SNS-box__fav-count__size').text('');
      $('.show-inner__SNS-box__fav-count__size').append(count);
      $.ajax({
        type: 'DELETE',
        url: href + '/favorites/' + num,
        data:'',
        dataType: 'json'
      })
    }
  });
});