json.restaurant do
  json.name @restaurant.name
  json.image @restaurant.image_url
  json.widgets @widgets do |widget|
    json.short_url widget.short_url
    json.long_url widget.long_url
    json.half false
    json.height 500
  end
end
