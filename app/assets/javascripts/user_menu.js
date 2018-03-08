$(document).on('turbolinks:load', function() {
  $('.header-utility-02__list').hide();
  $('.fa.fa-caret-down').on('click', function() {
    $('.header-utility-02__list').toggle(100);
  });
});
