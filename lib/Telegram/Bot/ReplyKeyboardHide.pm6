unit module Telegram::Bot::ReplyKeyboardHide;

use JSON::Tiny;
use Telegram::Bot::Core;

class ReplyKeyboardHide does Telegram::Bot::Core::JsonParseable {
  has $.hide-keyboard;
  has $.selective;

  method parse-from-json($json) {
    self.new(
      hide-keyboard => $json{"hide_keyboard"},
      selective => $json{"selective"}
    )
  }
}
