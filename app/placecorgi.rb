require 'sinatra'
require 'oily_png'
require 'stringio'

get '/' do
  "<p>Welcome to placecorgi!</p>"
end

get '/:size' do
  begin
    width_height = params[:size]
    width, height = width_height.split('x').map { |wat| wat.to_i }

    height = width unless height

    image_path = File.expand_path('../../public/images/corgis/ein-textmate.png', __FILE__)
    datastream = ChunkyPNG::Datastream.from_file(image_path)
    image = ChunkyPNG::Canvas.from_datastream(datastream)
    resized_image = image.resize(width, height)
    
    image_data = StringIO.new
    resized_image.write(image_data)
    
    content_type 'image/png'
    response['Content-Disposition'] = 'inline'
    response['Content-Length'] = image_data.length.to_s
    
    image_data.seek(0)
    halt image_data
    
  rescue Exception => e
    $stderr.puts e.message
    $stderr.puts e.backtrace
    
    body do
      "<p>Something went wrong.</p>"
    end
    status = 500
  end
end
