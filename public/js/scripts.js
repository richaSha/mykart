
$(document).ready(function(){
  $('.main-content').css('height', $(window).height()-$('.navigation').height());
  var slideIndex = 0;
  showSlides();
  function plusSlides(n) {
    showSlides(slideIndex += n);
  }
  function showSlides() {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      for (i = 0; i < slides.length; i++) {
         slides[i].style.display = "none";
      }
      slideIndex++;
      if (slideIndex > slides.length) {slideIndex = 1}
      slides[slideIndex-1].style.display = "block";
      setTimeout(showSlides, 5000); // Change image every 2 seconds
  }

  $("button.create, button.login").click(function(e){
    var passwordInput = $("input#password").val();
    var rePasswordInput = $("input#re-password").val();
    var usernameInput = $("input#username").val();
    var loginPasswordInput = $("input#login-password").val();


    if (passwordInput !== rePasswordInput) {
      e.preventDefault();
      $(".password-error").removeClass("hide");
    } else if ((loginPasswordInput === "") || (usernameInput === "" )) {
      e.preventDefault();
      $(".login-error").removeClass("hide")
    }

  });

});
