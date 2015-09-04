json.array!(@editable_pages) do |editable_page|
  json.extract! editable_page, :id
  json.url editable_page_url(editable_page, format: :json)
end
