unit module Telegram::Bot::Contact;

use JSON::Tiny;
use Telegram::Bot::Core;

class Contact does Telegram::Bot::Core::JsonParseable {
  has $.phone-number;
  has $.first-name;
  has $.last-name;
  has $.user-id;

  method parse-from-json($json) {
    self.new(
      phone-number => $json{"phone_number"},
      first-name => $json{"first_name"},
      last-name => $json{"last_name"},
      user-id => $json{"user_id"}
    )
  }
}
