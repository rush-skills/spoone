json.array!(@reviews) do |review|
  json.extract! review, :id, :widget_id, :user_id, :text, :rating
  json.url review_url(review, format: :json)
end
