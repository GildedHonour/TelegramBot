unit module Telegram::Bot::Location;

use JSON::Tiny;
use Telegram::Bot::Core;

class Location does Telegram::Bot::Core::JsonParseable {
  has $.longitude;
  has $.latitude;

  method parse-from-json($json) {
    self.new(
      longitude => $json{"longitude"},
      latitude => $json{"latitude"}
    )
  }
}
