unit class Telegram::Bot::PhotoSize; 
use Telegram::Bot::Core;
also does Telegram::Bot::Core::JsonParseable;

use JSON::Tiny;
use Telegram::Bot::Core;

has $.file-id;
has $.width;
has $.height;
has $.file-size;

method parse-from-json($json) {
  self.new(
    file-id => $json{"file_id"},
    width => $json{"width"},
    height => $json{"height"},
    file-size => $json{"file_size"}
  )
}
