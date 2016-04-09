use JSON::Tiny;
use Telegram::Bot::Core;

class Telegram::Bot::ReplyKeyboardHide does JsonParseable {
  has $.hide-keyboard;
  has $.selective;

  method parse-from-json($json) {
    self.new(
      hide-keyboard => $json{"hide_keyboard"},
      selective => $json{"selective"}
    )
  }
}
