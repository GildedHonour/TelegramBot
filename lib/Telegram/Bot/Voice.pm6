use JSON::Tiny;
use Telegram::Bot::Core;

class Telegram::Bot::Voice does Telegram::Bot::Core::JsonParseable{
  has $.file-id;
  has $.duration;
  has $.mime-type;
  has $.file-size;

  method parse-from-json($json) {
    self.new(
      file-id => $json{"file_id"},
      duration => $json{"duration"},
      mime-type => $json{"mime-type"},
      file-size => $json{"file_size"}
    )
  }
}