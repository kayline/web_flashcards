$(document).ready(function(){
  $('#card_guess, form').on('submit', function(e){
    e.preventDefault();
    $.ajax({
      type: 'post',
      url: $('#card_guess').attr('action'),
      data: $('#card_guess').serialize(),
      dataType: 'json'
    }).done(function(data){
      console.log(data);
      if (data.redirect) {
            // data.redirect contains the string URL to redirect to
            window.location.href = data.redirect;
        }
      else {
      $('h3').text(data.active_question);
      var formElements = document.forms['card_guess'].elements;
      formElements["remaining_card_ids"].value=data.remaining_card_ids;
      formElements["current_card_id"].value=data.active_id;
      formElements["guess"].value=""
    }
    });
  });

});
