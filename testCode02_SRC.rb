require 'slack-ruby-client'

Slack.configure do |config|
  # config.token = ENV['SLACK_API_TOKEN_01']
  config.token = ENV['SLACK_API_VERIF_TOKEN_01']
end

client = Slack::Web::Client.new
client.auth_test

puts "Test"
puts "Client:"
puts client
