require 'rubygems'
require 'bundler/setup'

require 'test/unit'
require 'rack/test'

require 'stringio'

require 'chunky_png'

require_relative '../app/placecorgi'

class BasicTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end
  
  def test_index
    get '/'
    assert last_response.ok?
    assert_equal '<p>Welcome to placecorgi!</p>', last_response.body 
  end
  
  def test_size_200x300
    get '/200x300'
    
    assert_equal 200, last_response.status
    
    body_stream = StringIO.new(last_response.body)
    response_image_datastream = ChunkyPNG::Datastream.from_io(body_stream)
    response_image = ChunkyPNG::Image.from_datastream(last_response_datastream)
    
    example_image_path = File.expand_path('../images/ein-textmate-200x300.png', __FILE__)
    example_image_datastream = ChunkyPNG::Datastream.from_file(example_image_path)
    example_image = ChunyPNG::Image.from_datastream(File.open(example_image_path))
    
    assert_equal example_image.height, response_image.height
    assert_equal example_image.width, response_image.width
    
  end
end