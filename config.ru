require './test_sinatra'

# to run with a class, needs to run with a Rack handler:
# rack handler command: $ rackup -p 4567
run HiSinatra

# # to run it wihtout a class, directly the instructions(rest)
# # and with normal $ ruby my_app.rb
# run Sinatra::Application
