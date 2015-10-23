use JSON::Tiny;
use Telegram::Bot::Core;

class Telegram::Bot::PhotoSize does JsonParseable {
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
