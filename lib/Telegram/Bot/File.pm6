unit class Telegram::Bot::File; 
use Telegram::Bot::Core;
also does Telegram::Bot::Core::JsonParseable;

use JSON::Tiny;
use Telegram::Bot::Core;

has $.file-id;
has $.file-size;
has $.file-path;

method parse-from-json(%json) {
  self.new(
    file-id => %json{"file_id"},
    file-path => %json{"file_path"},
    file-size => %json{"file_size"},
  )
}

method get-base-url($tkn, $fpath) {
  "https://api.telegram.org/file/bot{$tkn}{$fpath}"
}