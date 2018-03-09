$(document).on('turbolinks:load', function() {
  $('.header-utility-02__list').hide();
  $('.fa.fa-caret-down.user_menu_btn').on('click', function() {
    $('.header-utility-02__list').toggle(100);
  });
});
