$(document).on('turbolinks:load', function() {
  $('.account-box__field.account-box__field__action-edit').hover(function() {
    $('.account-box__field.account-box__field__action-edit').css('opacity', '0.6');
  }, function() {
    $('.account-box__field.account-box__field__action-edit').css('opacity', '1');
  });
});
