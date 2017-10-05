
$(document).ready(function(){
  $('.main-content').css('height', $(window).height()-$('.navigation').height());
  $('.breadbrumb').css('width', $('.top_panel').width());
  $('#review-form').hide()
  var products = document.getElementsByClassName("each-product-showcase");
  var product1 = document.getElementsByClassName("each-product-showcase1");
  var slideIndex = 0;
  var startIndex = 0;
  var centerIndex = 1;
  var lastIndex = 2;

  showSlides();
  if(products.length > 0){
    showProducts(products);
    showProducts(product1);
  }
  window.plusSlides = function(n) {
    slideIndex += n
    showSlides();
  }
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
    showProducts(products);
  })
  $(".icon-up-down .down").click(function(){
    startIndex -= 1;
    centerIndex -= 1
    lastIndex -= 1;
    showProducts(products);
  })
  $(".icon-up-down .up1").click(function(){
    startIndex += 1;
    centerIndex += 1
    lastIndex += 1;
    showProducts(product1);
  })
  $(".icon-up-down .down1").click(function(){
    startIndex -= 1;
    centerIndex -= 1
    lastIndex -= 1;
    showProducts(product1);
  })

  function showProducts(products) {

    if (startIndex < 0){
      startIndex = products.length-1;
    }else if (lastIndex < 0) {
      lastIndex = products.length-1;
    }else if (centerIndex < 0) {
      centerIndex = products.length-1;
    }
    if (startIndex == products.length){
      startIndex = 0;
    }else if (lastIndex == products.length) {
      lastIndex = 0;
    }else if (centerIndex == products.length) {
      centerIndex = 0;
    }
    for (i = 0; i < products.length; i++) {
        products[i].style.display = "none";
    }
    products[startIndex].style.display = "block";
    products[centerIndex].style.display = "block";
    products[lastIndex].style.display = "block";
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
  $('.carousel').carousel();

  $('.close-tab').click(function(){
    $('#review-form').toggle()
  })

  $("button#chekcout").click(function(e){
    e.preventDefault();
    $("div.shopping-cart").addClass("hide")
    $("div#checkout-confirm").removeClass("hide")
  });
});
