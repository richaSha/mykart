
$(document).ready(function(){
  $('.main-content').css('height', $(window).height()-$('.navigation').height());


  var slideIndex = 0;
  showSlides();

  window.plusSlides = function(n) {
    slideIndex += n
    showSlides();

  function showSlides() {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      if (!slides.length) {
        return
      }
      for (i = 0; i < slides.length; i++) {
         slides[i].style.display = "none";
      }
      slideIndex++;
      if (slideIndex > slides.length) {slideIndex = 1}
      slides[slideIndex-1].style.display = "block";
      setTimeout(showSlides, 5000);
  }
  function plusSlides(n) {
    showSlides(slideIndex += n);
  }

  $(".icon-up-down .up").click(function(){
    startIndex += 1;
    centerIndex += 1
    lastIndex += 1;
    showProducts();
  })
  $(".icon-up-down .down").click(function(){
    startIndex -= 1;
    centerIndex -= 1
    lastIndex -= 1;
    showProducts();
  })

  function showProducts() {

    // var i;
    var products = document.getElementsByClassName("each-product-showcase");
    if (startIndex < 0){
      startIndex = products.length;
    }else if (lastIndex < 0) {
      lastIndex = products.length;
    }else if (centerIndex < 0) {
      centerIndex = products.length;
    }
    if (startIndex > products.length){
      startIndex = 0;
    }else if (lastIndex > products.length) {
      lastIndex = 0;
    }else if (centerIndex > products.length) {
      centerIndex = 0;
    }
    for (i = 0; i < products.length; i++) {
      if (startIndex == i ||  i == lastIndex || i == centerIndex){
        products[i].style.display = "block";
      }
      else{
        products[i].style.display = "none";
      }
    }
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
