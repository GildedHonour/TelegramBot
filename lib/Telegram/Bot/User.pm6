unit package Telegram::Bot::User;

use JSON::Tiny;
use Telegram::Bot::Core;

class Telegram::Bot::User does Telegram::Bot::Core::JsonParseable {
  has $.id;
  has $.first-name;
  has $.last-name;
  has $.user-name;

  method parse-from-json($json) {
    self.new(
      id => $json{"id"},
      first-name => $json{"first_name"},
      last-name => $json{"last_name"},
      user-name => $json{"username"}
    )
  }
}

