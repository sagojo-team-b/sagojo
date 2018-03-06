$(function() {
  // 規約利用のチェックボックスの要素を取得して、バルーンを表示
  $('.account-box__field__action__sign-in, .account-box__field__fb').css({opacity: "0.6", cursor: "defult"}).attr("disabled", "disabled");
  $('.convention-btn').attr('checked', false);
  $('.convention-btn').click(function (e) {
    if ($('.convention-btn').is(':checked')){
      $('.account-box__field__action__sign-in, .account-box__field__fb').css({opacity: "1", cursor:"pointer"}).removeAttr('disabled');
      $('.convention-btn').hideBalloon({
        position:"top",
        contents:"<p>*チェックボックスをチェックしてください</p>",
        css: {
          backgroundColor: 'red',
          opacity: '0.6',
          color: 'white'
        }
      })
    } else {
      $('.account-box__field__action__sign-in, .account-box__field__fb').css({opacity:"0.6", cursor:"defult"}).attr("disabled", "disabled");
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
// nameフォームの要素を取得して、空なら注意バルーン表示
  $('#name').focusout(function(e) {
    if(!$('#name').val().match(/\S/g)){
      $('#name').showBalloon({
        position: "left",
        contents: "<p>*必須項目です</p>",
        css: {
          backgroundColor: "red",
          opacity: "0.6",
          color: "white",
          fontSize: "18px"
        }
      });
    } else {
      $('#name').hideBalloon({
        position: "left",
        contents: "<p>*必須項目です</p>",
        css: {
          backgroundColor: "red",
          opacity: "0.6",
          color: "white",
          fontSize: "18px"
        }
      });
    }
  });
//emailフォームの要素を取得して、空ならバルーン表示
  $('#email').focusout(function(e) {
    if(!$('#email').val().match(/\S/g)){
      $('#email').showBalloon({
        position: "left",
        contents: "<p>*必須項目です<br>*メールアドレスが正しくありません</p>",
        css: {
          backgroundColor: "red",
          opacity: "0.6",
          color: "white",
          fontSize: "18px"
        }
      });
    } else {
      $('#email').hideBalloon({
        position: "left",
        contents: "<p>*必須項目です<br>*メールアドレスが正しくありません</p>",
        css: {
          backgroundColor: "red",
          opacity: "0.6",
          color: "white",
          fontSize: "18px"
        }
      });
    }
  });
//passwordフォームの要素を取得して、空ならバルーン表示
  $('#password').focusout(function(e) {
    if(!$('#password').val().match(/\S/g)){
      $('#password').showBalloon({
        position: "left",
        contents: "<p>*必須項目です<br>*6文字以上にしてください</p>",
        css: {
          backgroundColor: "red",
          opacity: "0.6",
          color: "white",
          fontSize: "18px"
        }
      });
    } else {
      $('#password').hideBalloon({
        position: "left",
        contents: "<p>*必須項目です<br>*6文字以上にしてください</p>",
        css: {
          backgroundColor: "red",
          opacity: "0.6",
          color: "white",
          fontSize: "18px"
        }
      });
    }
  });
});
