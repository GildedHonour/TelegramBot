unit class Telegram::Bot::Update; 
use Telegram::Bot::Core;
also does Telegram::Bot::Core::JsonParseable;

use Telegram::Bot::Core;
use Telegram::Bot::Message;

has $.update_id;
# has Telegram::Bot::Message::Message $.message;
has $.message;

method parse-from-json($json) {
    self.new(
        update_id => $json<update_id>,
        message   => Telegram::Bot::Message.parse-from-json($json<message>),
    )
}
