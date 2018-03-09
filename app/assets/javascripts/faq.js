$(document).on('turbolinks:load', function() {
  $('.bigger_li').on('click', function() {
    $(this).next().slideToggle('fast');
  });

  $('.for_travelers_list > li').on('click', function() {
    var click = $(this).attr('id');
    var th = $('.faq_right_inner').children("#" + click).position().top;
    var header_height = $('#header-01').height();

    // $(window).scrollTop(th - header_height);
    $("html, body").animate({scrollTop: th - header_height}, 300);
  });

  $('.for_company_list > li').on('click', function() {
    var click = $(this).attr('id');
    var th = $('.faq_right_inner').children("#" + click).position().top;
    var header_height = $('#header-01').height();

    // $(window).scrollTop(th - header_height);
    $("html, body").animate({scrollTop: th - header_height}, 300);
  });
});
