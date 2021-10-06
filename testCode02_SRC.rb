require 'slack-ruby-client'
require 'oauth2'

client = OAuth2::Client.new(
  ENV['SLACK_API_CID_01'],
  ENV['SLACK_API_CSCRT_01'],
  site: 'https://slack.com/api/oauth.v2.access'
)

puts "Test"
puts "Client:"
puts client
puts client.state
# puts client.class.name
