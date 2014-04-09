json.array!(@chapters) do |chapter|
  json.extract! chapter, :id, :cover, :title, :issue
  json.url chapter_url(chapter, format: :json)
end
