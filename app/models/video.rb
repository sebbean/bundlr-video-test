class Video < ActiveRecord::Base
  mount_uploader :asset, VideoUploader


  def make_frames
    @asset.current_path
  end

  def set_success(format, opts)
    puts "WOOOOOOOO #{format} and #{opts}"
  end

  def decode_frames(&block)
    base = File.basename(asset.current_path, '.*');
    path = File.join(File.dirname(asset.current_path),base)
    # output_path = File.join(path, 'frames')

    puts path

    # binding.pry
    unless File.exist?(path)
      FileUtils.mkdir_p(path)
    end    

    movie = FFMPEG::Movie.new(asset.current_path)
    png_path = "#{path}/%d.png"

   
    movie.transcode(png_path, {}, validate: false) do |p|
      block.call(p)
    end
  end 
end
