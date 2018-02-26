$(function() {
  $('.account-box__field__action, .account-box__field__fb').css({opacity: "0.6", cursor: "defult"}).attr("disabled", "disabled");
  $('.convention-btn').attr('checked', false);
  $('.convention-btn').click(function (e) {
    console.log(this)
    if ($('.convention-btn').is(':checked')){
      $('.account-box__field__action, .account-box__field__fb').css({opacity: "1", cursor:"pointer"}).removeAttr('disabled');
    } else {
      $('.account-box__field__action, .account-box__field__fb').css({opacity:"0.6", cursor:"defult"}).attr("disabled", "disabled");
      $('.convention-btn').showBalloon({
        position:"top",
        contents:"<p>＊チェックボックスをチェックしてください</p>",
        css: {
          backgroundColor: 'red',
          opacity: '0.6',
          color: 'white'
        }
      })
    }
  })
});
