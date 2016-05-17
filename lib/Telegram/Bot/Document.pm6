unit class Telegram::Bot::Document; 
use Telegram::Bot::Core;
also does Telegram::Bot::Core::JsonParseable;

use JSON::Tiny;
use Telegram::Bot::Core;

has $.file-id;
has $.thumb;
has $.file-name;
has $.mime-type;
has $.file-size;

method parse-from-json($json) {
  self.new(
    file-id => $json{"file_id"},
    thumb => $json{"thumb"},
    file-name => $json{"file_name"},
    mime-type => $json{"mime_type"},
    file-size => $json{"file_size"}
  )
}
