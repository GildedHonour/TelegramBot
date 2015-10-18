unit package Telegram::Bot::User;

use JSON::Tiny;

class Telegram::Bot::User does JsonParsable {
  has $.id;
  has $.first-name;
  has $.last-name;
  has $.user-name;

  method parse-from-json($json) -> self {
    self.new(
      id => $json{"id"},
      first-name => $json{"first_name"},
      last-name => $json{"last_name"},
      user-name => $json{"username"}
    )
  }
}

role JsonParsable {
  method parse-from-json($json) -> self { ... }
}