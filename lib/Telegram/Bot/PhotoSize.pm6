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
  $json.map: {
    self.new(
      file-id => $_<file_id>,
      width => $_<width>,
      height => $_<height>,
      file-size => $_<file_size>,
    )
  }
}
