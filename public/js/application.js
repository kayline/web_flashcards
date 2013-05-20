$(document).ready(function() {
  $(".home").find("h1").text("Having Trouble with Memorization?!").fadeIn(6000).fadeOut(2000, function() {
    $(this).text("We're here to help with that!").fadeIn(1500).fadeOut(1000, function () {
      $(this).text("Welcome to FlashyFlash!").fadeIn(1500, function () {
        $(".home").find("p").slideUp(500).text("Please Login or Sign Up to get started").slideDown(1500);

      });
    });
  });
});
