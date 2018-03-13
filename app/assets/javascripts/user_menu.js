$(document).on('turbolinks:load', function() {
  $('.header-utility-02__list').hide();
  $('.user_menu_btn').on('click', function() {
    $('.header-utility-02__list').toggle(100);
  });
});
