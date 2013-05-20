$(document).ready(function() {
  $('#create_deck').on('submit', function(e){
     e.preventDefault();
    $.ajax({
      type: 'post',
      url: $('#create_deck').attr('action'),
      data: $('#create_deck').serialize(),
      dataType: 'json'
    }).done(function(data){
      $(".create_deck_cards").attr("class", 'active');
      $('#deck_creation').attr("class", 'create_deck_cards');
      var formElements = document.forms['create_card'].elements;
      formElements["deck_id"].value=data.deck_id;
    }) 
  })
});
