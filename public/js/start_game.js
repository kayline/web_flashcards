$(document).ready(function(){
  $('#card_guess, form').on('submit', function(e){
    e.preventDefault();
    $.ajax({
      type: 'post',
      url: $('#card_guess').attr('action'),
      data: $('#card_guess').serialize()
    }).done(function(data){
      console.log(data);
    });
  });

});

