json.extract! @video, :name, :created_at, :updated_at, :make_frames
json.asset_url = @video.asset.url