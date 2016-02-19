json.array!(@widgets) do |widget|
  json.extract! widget, :id, :restaurant_id, :half, :position, :widget_klass
  json.url widget_url(widget, format: :json)
end
