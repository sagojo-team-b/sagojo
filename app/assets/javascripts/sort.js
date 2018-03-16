$(document).on('turbolinks:load', function() {
  function buildHTML(article){
    var html = `<div class="job-thumnail">
                  <a href="/home/job/${article.id}" class="job-thumnail-btn">
                    <img src="${article.thumbnail}" class="job-thumnail__image">
                  </a>
                </div>`
    return html;
  }
  $('#select_box').change(function(e) {
    e.preventDefault();
    var value = $(this).val();
    $.ajax({
      url: location.href,
      type: 'GET',
      data: { keyword: value },
      dataType: 'json'
    })
    .done(function(articles) {
      $('.main-left-content').empty();
      articles.forEach(function(article) {
        var html = buildHTML(article);
        $('.main-left-content').append(html);
      })
    })
    .fail(function() {
      alert('エラーが発生しました。');
    })
  })
})
