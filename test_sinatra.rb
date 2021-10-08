# require 'sinatra'
=begin
   The above require directly calls sinatra default way.
   Sinatra::Base is a blank slate. Most options are disabled
  by default, including the built-in server.
   If you want behavior more similar to when you define your
  app at the top level (also known as Classic style), you
  can subclass Sinatra::Application.
=end
require 'sinatra/base'

class HiSinatra < Sinatra::Base
  get '/' do
    "Hello World (& Sinatra!)"
  end
end
