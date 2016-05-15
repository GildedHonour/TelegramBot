unit class Telegram::Bot::User; 
use Telegram::Bot::Core;
also does Telegram::Bot::Core::JsonParseable;

use JSON::Tiny;

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
