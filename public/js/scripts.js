
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
  $('.banner-box>a').mouseout(function(){
    setTimeout(function(){ $(this).find(".s-desc p").css('color', '#19caaf'); }, 3000);
  })
})
