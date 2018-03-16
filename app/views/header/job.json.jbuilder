json.array! @articles do |article|
  json.id                      article.id
  json.thumbnail               article.thumbnail
  json.company                 article.company
  json.title                   article.title
  json.introduction            article.introduction
  json.application_deadline    article.application_deadline
  json.reward                  article.reward
  json.other_reward            article.other_reward
end
