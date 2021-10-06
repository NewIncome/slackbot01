require 'slack-ruby-client'
require 'oauth2'


Slack.configure do |config|
  config.token = ENV['SLACK_BOT_USER_OAUTH_TOKEN_01']
  raise 'Missing ENV[SLACK_BOT_USER_OAUTH_TOKEN_01]!' unless config.token
end
client = Slack::Web::Client.new
resp = client.auth_test

client.chat_postMessage(channel: '#for-bot', text: 'Hello World', as_user: true)

# client = OAuth2::Client.new(
#   ENV['SLACK_API_CID_01'],
#   ENV['SLACK_API_CSCRT_01'],
#   site: 'https://slack.com/api/oauth.v2.access'
# )

puts "Test"
puts "Client:"
# puts JSON.parse(resp)
puts resp
# puts resp.keys
puts resp.state
puts resp.class.name
o1 = Hash.new(resp)
puts o1
