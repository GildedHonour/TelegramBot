unit module Telegram::Bot::PhotoSize;

use JSON::Tiny;
use Telegram::Bot::Core;

class PhotoSize does Telegram::Bot::Core::JsonParseable {
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
}
