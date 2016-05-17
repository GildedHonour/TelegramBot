unit class Telegram::Bot::Location; 
use Telegram::Bot::Core;
also does Telegram::Bot::Core::JsonParseable;

use JSON::Tiny;
use Telegram::Bot::Core;

has $.longitude;
has $.latitude;

method parse-from-json($json) {
  self.new(
    longitude => $json{"longitude"},
    latitude => $json{"latitude"}
  )
}
