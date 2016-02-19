json.array!(@swidgets) do |swidget|
  json.extract! swidget, :id, :name, :widget_id
  json.url swidget_url(swidget, format: :json)
end
