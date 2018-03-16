$(document).on('turbolinks:load', function() {
  function buildHTML(article){
    var html = `<div class="job-thumnail">
                  <a href="/home/job/${article.id}" class="job-thumnail-btn">
                    <img src="${article.thumbnail}" class="job-thumnail__image">
                    <span class="job-thumnail__content">
                      <div class="job-thumnail__content--company">
                        <img src="https://d1te0bovbq6epg.cloudfront.net/common/img/icon-company.svg" class="job-thumnail__content--company-image">
                        <span class="job-thumnail__content--company-name">
                          ${article.company}
                        </span>
                      </div>
                      <h3 class="job-thumnail__content--job-title">
                        ${article.title}
                      </h3>
                      <p class="job-thumnail__content--thum-job-desc">
                        ${article.introduction}
                      </p>
                      <p class="job-thumnail__content--thum-job-utility">
                        募集終了まで
                        <span class="job-thumnail__content--thum-job-utility remaining-days">
                        </span>
                        <span class="job-thumnail__content--thum-job-utility">
                          日 | 335 view
                        </span>
                      </p>
                      <div class="thum-job-taglist">
                        <img src="https://d1te0bovbq6epg.cloudfront.net/common/img/icon-tag-01.svg" class="thum-job-taglist__image">
                        <ul class="thum-job-taglist__ul">
                          <li>
                            <img src="https://d1te0bovbq6epg.cloudfront.net/common/img/icon-tag-02.svg" class="thum-job-taglist__ul--image">
                            <p class="thum-job-taglist__ul--li">
                              動画
                            </p>
                          </li>
                        </ul>
                      </div>
                      <div class="thum-job-return">
                        <div class="inner-01">
                          <img src="https://d1te0bovbq6epg.cloudfront.net/common/img/icon-money.svg" class="inner-01__image">
                          <p class="inner-01__p">
                            ${article.reward}
                          </p>
                        </div>
                        <div class="inner-02">
                          <% if ${article.other_reward}? %>
                            <img src="https://d1te0bovbq6epg.cloudfront.net/common/img/icon-object.svg" class="inner-02__image">
                            <p class="inner-02__p">
                              他リターンあり
                          </p>
                        </div>
                      </div>
                    </span
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
