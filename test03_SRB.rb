require 'slack-ruby-bot'
require './.env'
# # Just like that not working, asks for Slack API Token
# class PongBot < SlackRubyBot::Bot
#   command 'ping' do |client, data, match|
#     client.say(text: 'pong', channel: data.channel)
#   end
# end
# PongBot.run

# block of text with button to send to chat
def make_block_question(member)
  [
    {
      "type": 'section',
      "text": {
        "type": 'mrkdwn',
        "text": "Hi #{member.real_name} :wave:"
      },
    },
    {
      "type": 'section',
      "text": {
        "type": 'mrkdwn',
        "text": 'To check entry time click the button.'
      },
      "accessory": {
        "type": 'button',
        "text": {
          "type": 'plain_text',
          "text": 'Check-in'
        },
        "value": member.id.to_s
      }
    }
  ]
end

Slack.configure do |config|
  config.token = ENV['SLACK_BOT01_USER_OAUTH_TOKEN']
  raise 'Missing ENV[SLACK_BOT01_USER_OAUTH_TOKEN]!' unless config.token
end

client = Slack::Web::Client.new

all_members = client.users_list
all_members.members.each do |member|
  next unless member.is_bot != true

  block_question = make_block_question(member)
  client.chat_postMessage(channel: member.id, text: 'Buenos dias!',
                          as_user: true, blocks: block_question.to_json)
  # block_question = "This is a test"
  # client.chat_postMessage(channel: member.id, text: 'Good Morning!!', as_user: true)
end

# # for bttn-action with Sinatra, use this code:
# post '/' do
#   request_data = request.body.read
#   request_data = URI.decode_www_form_component(request_data, enc = Enconding::UTF_8)
#   request_data = JSON.parse(request_data.sub!('payload=', ''))
#   client.chat_postMessage(channel: member.id, text: 'Marcaste  :)', as_user: true)
#   status 200
#   body ''
# end
