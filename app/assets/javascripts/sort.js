$(document).ready(function() {
  $('#select_box').change(function(e) {
    e.preventDefault();
    var value = $(this).val();
    $.ajax({
      url: '/',
      type: 'GET',
      data: { keyword: value },
      dataType: 'json'
    })
  })
})
