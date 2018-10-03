$(function(){
  var $modal = $('.o-modal');
  var $win_confirm = $('.l-sec09-confirm');
  var $win_finish = $('.l-sec09-finish');
  var $win_error = $('.l-sec09-error');

  var checkRequired = function(){
    var flg = true;
    $('.is-required').each(function(){
      if (!$(this).val()) {
        $(this).parent().addClass('is-error');
        flg = false;
      } else {
        $(this).parent().removeClass('is-error');
      }
    });
    return flg;
  }
  var checkMailFormat = function(){
    var flg = true;
    if(!$('.l-form-email').val().match(/^([a-zA-Z0-9])+([a-zA-Z0-9\.\_\-\+])*@([a-zA-Z0-9\_\-])+([a-zA-Z0-9\.\_\-]+)+$/)) {
      $('.l-form-email').parent().addClass('is-mailerror');
      flg = false;
    } else {
      $('.l-form-email').parent().removeClass('is-mailerror');
    }
    return flg;
  }

  var confirmForm = function(){
    $('.l-form-confirm-lastname').html($('.l-form-lastname').val());
    $('.l-form-confirm-firstname').html($('.l-form-firstname').val());
    $('.l-form-confirm-email').html($('.l-form-email').val());
    $('.l-form-confirm-text').html($('.l-form-text').val().replace( /\r?\n/g, '<br>' ));
  };

  $('.js-confirm').on('click',function(){
    if (checkRequired()) {
      if(checkMailFormat()){
        confirmForm();
        $win_confirm.show();
        $modal.fadeIn('250',function(){
          $modal.addClass('is-active');
        }).css('display','table');
      }
    }
  });
  $('.js-close').on('click',function(){
    $modal.fadeOut('250',function(){
      $modal.removeClass('is-active');
      $win_confirm.hide();
      $win_finish.hide();
      $win_error.hide();
    })
  });
  $('.js-submit').on('click',function(){
    // $('#form1').submit();
    setTimeout(function(){
      $('#form1').submit();
    },1500)
    $win_confirm.fadeOut('250',function(){
      $win_finish.fadeIn('250');
    })
  });

  $(window).on('load',function(){
    var hash = location.hash;
    console.log('onload');
    if(hash==='#form-thanks') {
      $win_error.hide();
      $win_finish.show();
      $modal.fadeIn('250',function(){
        $modal.addClass('is-active');
      }).css('display','table');
    } else if(hash==='#form-error') {
      $win_finish.hide();
      $win_error.show();
      $modal.fadeIn('250',function(){
        $modal.addClass('is-active');
      }).css('display','table');
    }
  });
  window.onhashchange = function(){
    var hash = location.hash;
    console.log('onhashchange');
    if(hash==='#form-thanks') {
      $win_finish.show();
      $modal.fadeIn('250',function(){
        $modal.addClass('is-active');
      }).css('display','table');
    } else if(hash==='#form-error') {
      $win_error.show();
      $modal.fadeIn('250',function(){
        $modal.addClass('is-active');
      }).css('display','table');
    }
  }


// scroller

  var offsetY = -10;
  var time = 500;
  $('a[href*=\\#]:not([href=\\#])').on('click',function() {
    var target = $(this.hash);
    if (!target.length) return ;
    var targetY = target.offset().top+offsetY;
    $('html,body').animate({scrollTop: targetY}, time, 'swing');
    window.history.pushState(null, null, this.hash);
    return false;
  });
});