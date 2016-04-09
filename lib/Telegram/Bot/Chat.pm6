package Telegram::Bot::Chat;

use JSON::Tiny;
use Telegram::Bot::Core;

class Telegram::Bot::Chat does Telegram::Bot::Core::JsonParseable {
  has $.id;
  has $.type;
  has $.title;
  has $.username;
  has $.first-name;
  has $.last-name;

  method parse-from-json($json) {
    self.new(
      id => $json{"id"},
      type => $json{"type"},
      title => $json{"title"},
      username => $json{"username"},
      first-name => $json{"first_name"},
      last-name => $json{"last_name"}
    )
  }
}
