$(document).ready(function() {
  $(".home").find("h1").text("Having Trouble with Memorization?!").fadeIn(6000).fadeOut(4000, function() {
    $(this).text("We're here to help with that!").fadeIn(2000).fadeOut(2000, function () {
      $(this).text("Welcome to FlashyFlash!").fadeIn(2000, function () {
        $(".home").find("p").slideUp(1000).text("Please Login or Sign Up to get started").slideDown(1500);

      });
    });
  });
});
