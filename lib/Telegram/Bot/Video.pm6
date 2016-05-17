unit class Telegram::Bot::Video; 
use Telegram::Bot::Core;
also does Telegram::Bot::Core::JsonParseable;

use JSON::Tiny;
use Telegram::Bot::Core;
has $.file-id;
has $.width;
has $.height;
has $.duration;
has $.thumb;
has $.mime-type;
has $.file-size;

method parse-from-json($json) {
  self.new(
    file-id => $json{"file_id"},
    width => $json{"width"},
    height => $json{"height"},
    duration => $json{"duration"},
    thumb => $json{"thumb"},
    mime-type => $json{"mime_type"},
    file-size => $json{"file_size"}
  )
}
