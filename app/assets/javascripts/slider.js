$(document).on('turbolinks:load', function(){
  $('#slider').slick({
    centerMode: true,
    centerPadding: '160px',
    accessibility: true,
    autoplay: true,
    autoplaySpeed: 1000,
    speed: 1200,
    dots: true,
  });
});

