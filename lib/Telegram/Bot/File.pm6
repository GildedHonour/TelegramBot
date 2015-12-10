use Telegram::Bot::Core;

class Telegram::Bot::File does Telegram::Bot::Core::JsonParseable {
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
}
