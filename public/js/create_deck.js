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
      $("#create_card").attr("action", "/" + data.user_id + "/" + data.deck_id + "/create_card");
      console.log('end of first ajax callback')
    }) 
  })

  $('#create_card').on('submit', function(e){ 
     e.preventDefault();
    $.ajax({
      type: 'post',
      url: $('#create_card').attr('action'),
      data: $('#create_card').serialize(),
      dataType: 'json'
    }).done(function(data){
      console.log(data);
      var formElements = document.forms['create_card'].elements;
      formElements["question"].value="";
      formElements["answer"].value="";
      $(".play_deck").attr("class", 'active');
      $("#go_to_game").attr("action", "/game/start_round/" + data.deck_id);
       
    })
  })

});
