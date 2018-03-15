$(document).ready(function() {
  $('.sub-content-select-box').change(function(e) {
    e.preventDefault();
    var value = $(this).val();
    console.log(value)
  })
})
