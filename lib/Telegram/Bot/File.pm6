class Telegram::Bot::File does Telegram::Bot::Core::JsonParseable {
  has $.file-id;
  has $.file-size;
  has $.file-path;
  
  method parse-from-json($json) {
    self.new(
      file-id => $json{"id"},
      first-size => $json{"file_size"},
      file-path => $json{"file_path"}
    )
  }
}
