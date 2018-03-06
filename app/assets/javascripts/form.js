$(document).on('turbolinks:load', function() {
  $('#email, #password, #name, #re-password, #email_session, #password_session').focusin(function(e) {
    $(this).css('border', 'solid 2px #FFCC33');
  })
  .focusout(function(e) {
    $(this).css('border', '');
  });
});
