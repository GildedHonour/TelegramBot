unit module Telegram::Bot::Update;

use Telegram::Bot::Core;
use Telegram::Bot::Message;

class Update does Telegram::Bot::Core::JsonParseable {
  has $.id;
  # has Telegram::Bot::Message::Message $.message;
  has $.message;

  method parse-from-json($json) {
    self.new(
      id => $json{"id"},
      message => Telegram::Bot::Message.parse-from-json() # todo
    )
  }
}