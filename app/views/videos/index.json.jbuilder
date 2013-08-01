json.array!(@videos) do |video|
  json.extract! video, :asset, :name
  json.url video_url(video, format: :json)
end
