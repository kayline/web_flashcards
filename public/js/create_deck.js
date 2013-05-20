$(document).ready(function() {
  $('#create_deck').on('submit', function(e){
     e.preventDefault();
    $.ajax({
      type: 'post',
      url: $('#create_deck').attr('action'),
      data: $('#create_deck').serialize(),
    }).done(function(){
      $(".create_deck_cards").attr("class", 'active');
      $('#deck_creation').attr("class", 'create_deck_cards');
    }) 
  })
});
