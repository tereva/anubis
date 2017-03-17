json.extract! site, :id, :web, :title, :description, :kw, :category_id, :created_at, :updated_at
json.url site_url(site, format: :json)
