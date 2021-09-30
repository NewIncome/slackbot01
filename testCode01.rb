require 'http'
require 'json'

# rc = HTTP.post("https://slack.com/api/api.test")
rc = HTTP.post("https://slack.com/api/auth.test", params: {
  token: ENV['SLACK_API_TOKEN_01']
})
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
