json.array!(@texts) do |text|
  json.extract! text, :id, :widget_id, :text
  json.url text_url(text, format: :json)
end
