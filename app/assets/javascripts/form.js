$(function() {
  $('#email, #password, #name, #re-password').focusin(function(e) {
    $(this).css('border', 'solid 2px #FFCC33');
  })
  .focusout(function(e) {
    $(this).css('border', '');
  });
});
