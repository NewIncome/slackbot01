require 'http'
require 'json'

# rc = HTTP.post("https://slack.com/api/api.test") # test01
# rc = HTTP.post("https://slack.com/api/auth.test", params: { # test02
#   token: ENV['SLACK_API_TOKEN_01']
# })
rc = HTTP.post("https://slack.com/api/oauth.access", params: {
  client_id: ENV['SLACK_API_CID_01'],
  client_secret: ENV['SLACK_API_CSCRT_01']
})
# should receive a json response with the access_token and scope
puts rc
puts "--- #{rc.class} < #{rc.class.superclass} < #{rc.class.superclass.superclass} ---"
p rc.public_methods - rc.class.superclass.superclass.public_methods
# puts rc.body
# puts rc.status
# puts rc.headers
# puts rc.request
# puts rc.cookies
puts "------------------------------"
puts JSON.parse(rc.body)
puts "------------------------------"
# JSON.pretty_generate() does:
# aligns/spaces better the json info, without it the whole json
# is outputed in a single line
puts JSON.pretty_generate(JSON.parse(rc.body))
