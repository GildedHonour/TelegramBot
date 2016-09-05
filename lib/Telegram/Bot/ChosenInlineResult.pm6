unit class Telegram::Bot::ChosenInlineResult;
use Telegram::Bot::Core;
also does Telegram::Bot::Core::JsonParseable;

use JSON::Tiny;
use Telegram::Bot::Core;

has $.result_id;
has $.from;
has $.location;
has $.inline_message_id;
has $.query;

#todo
method parse-from-json($json) {
  self.new(
#    message-id => $json{"message_id"},
#    group-chat-created => $json{"group_chat_created"}
  )
}
