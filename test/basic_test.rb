require 'rubygems'
require 'bundler/setup'

require 'test/unit'
require 'rack/test'

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
    puts last_response.methods.sort
    
    assert last_response.ok?
    
  end
end