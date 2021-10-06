require 'slack-ruby-client'
require 'oauth2'


Slack.configure do |config|
  config.token = ENV['SLACK_BOT_USER_OAUTH_TOKEN_01']
  raise 'Missing ENV[SLACK_BOT_USER_OAUTH_TOKEN_01]!' unless config.token
end
client = Slack::Web::Client.new
resp = client.auth_test

# client = OAuth2::Client.new(
#   ENV['SLACK_API_CID_01'],
#   ENV['SLACK_API_CSCRT_01'],
#   site: 'https://slack.com/api/oauth.v2.access'
# )

puts "Test"
puts "Client:"
# puts JSON.parse(resp)
puts resp
puts resp.keys
# puts client.state
puts resp.class.name
puts resp.body
puts resp.message
puts resp.messages