$(document).on('turbolinks:load', function() {
  $('#email, #password, #name, #re-password, #email_session, #password_session, #avatar, #background_image, #catch_phrase, #sex, #tel, #post_number, #address, #present_place, #private_link, #pv, #sns, #follower, #job_type_tags_1, #job_type_tags_2, #job_type_tags_3, #job_type_tags_4, #job_type_else, #language, #job_history, #travel_history, #skill_tags_1, #skill_tags_2, #skill_tags_3, #skill_tags_4, #skill_tags_else, #achivement, #income, #travel_date, #travel_content, #self_introduction, #birth_date_y, #birth_date_m, #birth_date_d, #address1, #address, #address3, #address4, #preparation').focusin(function(e) {
    $(this).css('border', 'solid 2px #FFCC33');
  })
  .focusout(function(e) {
    $(this).css('border', '');
  });
});
