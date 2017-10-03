
$(document).ready(function(){
  $('.main-content').css('height', $(window).height()-$('.navigation').height());

  var slideIndex = 0;
  showSlides();

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

  function plusSlides(n) {
    showSlides(slideIndex += n);
  }


  $("button.create, input.login").click(function(e){
    var passwordInput = $("input#password").val();
    var rePasswordInput = $("input#re-password").val();
    var userEmailInput = $("input#input-email").val();
    var loginPasswordInput = $("input#input-password").val();


    if (passwordInput !== rePasswordInput) {
      e.preventDefault();
      $(".password-error").removeClass("hide");
    } else if ((loginPasswordInput === "") || (userEmailInput === "" )) {
      e.preventDefault();
      $(".login-error").removeClass("hide")
    }

  });

});

