json.array!(@menus) do |menu|
  json.extract! menu, :id, :widget_id, :image
  json.url menu_url(menu, format: :json)
end
