class Scraping
  def self.article_urls
    links = []
    introductions = []
    thumbnails = []
    agent = Mechanize.new
    next_url = ""

    loop do
      current_page = agent.get("https://www.sagojo.link/work/recommend" + next_url)
      elements = current_page.search('.thum-job-01 a')
      elements.each do |ele|
        links << ele[:href]
      end
      job_descs = current_page.search('.thum-job-01 a .content .thum-job-desc')
      job_descs.each do |desc|
        introductions << desc.inner_text if current_page.search('.thum-job-01 a .content .thum-job-desc')
      end
      job_thumbs = current_page.search('.thum-job-01 a .image img')
      job_thumbs.each do |thum|
        thumbnails << thum[:src] if current_page.search('.thum-job-01 a .image img')
      end

      next_link = current_page.at('.pagination .next a')
      break unless next_link
      next_url = next_link[:href]
      next_url.slice!("/work/recommend")
    end

    links = links.select.with_index{ |link, i| i % 2 == 0 }
    links.zip(introductions, thumbnails).each do |link, introduction, thumbnail|
      get_article(('https://www.sagojo.link' + link), introduction, thumbnail)
    end
  end

  def self.get_article(link, introduction, thumbnail)
    agent = Mechanize.new
    page = agent.get(link)

    title = page.at('.job-detail-01 .hdg-lv1-01').inner_text if page.at('.job-detail-01 .hdg-lv1-01')
    image_url = page.at('.job-detail-01 .image img')[:src] if page.at('.job-detail-01 .image img')
    work_content = page.search('.tbl-01 tbody tr:nth-child(2) td').inner_text if page.search('.tbl-01 tbody tr:nth-child(2) td')
    reward = page.search('.tbl-01 tbody tr:nth-child(3) td').inner_text if page.search('.tbl-01 tbody tr:nth-child(3) td')

    # その他リターンのカラムがある場合の処理
    if page.search('.tbl-01 tbody tr').length == 10
      other_reward = page.search('.tbl-01 tbody tr:nth-child(4) td').inner_text if page.search('.tbl-01 tbody tr:nth-child(4) td')
    end

    requirements = page.search('.tbl-01 tbody tr:nth-last-child(6) td').inner_text if page.search('.tbl-01 tbody tr:nth-last-child(6) td')
    num_people = page.search('.tbl-01 tbody tr:nth-last-child(5) td').inner_text if page.search('.tbl-01 tbody tr:nth-last-child(5) td')
    travel_period = page.search('.tbl-01 tbody tr:nth-last-child(4) td').inner_text if page.search('.tbl-01 tbody tr:nth-last-child(4) td')
    area = page.search('.tbl-01 tbody tr:nth-last-child(3) td').inner_text if page.search('.tbl-01 tbody tr:nth-last-child(3) td')
    company = page.search('.tbl-01 tbody tr:nth-last-child(2) td').inner_text if page.search('.tbl-01 tbody tr:nth-last-child(2) td')
    other = page.search('.tbl-01 tbody tr:nth-last-child(1) td').inner_text if page.search('.tbl-01 tbody tr:nth-last-child(1) td')
    application_deadline = page.at('.list-application-flow li dl dd').inner_text if page.at('.list-application-flow li dl dd')
    responsible_party_icon = page.at('.side-profile-01 .image img')[:src] if page.at('.side-profile-01 .image img')
    single_word = page.at('.side-profile-01 .side-profile-text').inner_text if page.at('.side-profile-01 .side-profile-text')

    article = Article.where(title: title).first_or_initialize
    article.assign_attributes(
      image_url: image_url,
      introduction: introduction,
      work_content: work_content,
      reward: reward,
      other_reward: other_reward,
      requirements: requirements,
      num_people: num_people,
      travel_period: travel_period,
      area: area,
      company: company,
      other: other,
      application_deadline: application_deadline,
      responsible_party_icon: responsible_party_icon,
      single_word: single_word,
      thumbnail: thumbnail
      )
    article.save
  end

  def self.triplab_articles_urls
    links = []
    agent = Mechanize.new
    next_url = ""

    loop do
      current_page = agent.get('https://www.sagojo.link/sugoi-labo/latest' + next_url)
      elements = current_page.search('.thum-column-02 a')
      elements.each do |ele|
        links << ele[:href]
      end

      next_link = current_page.at('.pagination .next a')
      break unless next_link
      next_url = next_link[:href]
      next_url.slice!('/sugoi-labo/latest')
    end

    links.each do |link|
      get_articles('https://www.sagojo.link' + link)
    end
  end

  def self.get_articles(link)
    agent = Mechanize.new
    page = agent.get(link)

    image_url = page.at('.column-detail-01 .image img')[:src] if page.at('.column-detail-01 .image img')
    job_type_tag = page.at('.column-detail-01 .utility-01 .category').inner_text if page.at('.column-detail-01 .utility-01 .category')
    title = page.at('.column-detail-01 .hdg-lv1-01').inner_text
    writer_image_url = page.at('.side-profile-01 .image.writer img')[:src] if page.at('.side-profile-01 .image.writer img')
    writer_name = page.at('.side-profile-01 .side-profile-title').inner_text.delete!('ライター：') if page.at('.side-profile-01 .side-profile-title')
    text = page.at('.column-detail-01 .utility').inner_text if page.at('.column-detail-01 .utility')
    up_date = text.slice!(0, 10)
    view_number = text

    article = TriplabArticle.where(title: title).first_or_initialize
    article.assign_attributes(
      image_url: image_url,
      job_type_tag: job_type_tag,
      writer_image_url: writer_image_url,
      writer_name: writer_name,
      up_date: up_date,
      view_number: view_number
      )
    article.save
  end
end
