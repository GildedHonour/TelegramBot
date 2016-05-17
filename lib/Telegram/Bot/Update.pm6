unit class Telegram::Bot::Update; 
use Telegram::Bot::Core;
also does Telegram::Bot::Core::JsonParseable;

use Telegram::Bot::Core;
use Telegram::Bot::Message;

has $.id;
# has Telegram::Bot::Message::Message $.message;
has $.message;

method parse-from-json($json) {
  self.new(
    id => $json{"id"},
    message => Telegram::Bot::Message.parse-from-json() # todo
  )
}
