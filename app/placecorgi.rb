require 'sinatra'

get '/' do
  "<p>Welcome to placecorgi!</p>"
end

get '/:size' do
  begin
    wh, format = params[:size].downcase.split('.')
    format = FORMATS[format] || 'png'

    width, height = wh.split('x').map { |wat| wat.to_i }

    height = width unless height

    content_type "image/png"
    img.to_blob

  rescue Exception => e
    "<p>Something broke.</p>"
  end

end
