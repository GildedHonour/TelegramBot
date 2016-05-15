unit module Telegram::Bot::ReplyKeyboardMarkup;

use JSON::Tiny;
use Telegram::Bot::Core;

class ReplyKeyboardMarkup does Telegram::Bot::Core::JsonParseable {
  has $.keyboard;
  has $.resize-keyboard;
  has $.one-time-keyboard;
  has $.selective;

  method parse-from-json($json) {
    self.new(
      keyboard => $json{"keyboard"}, # todo array of array of Str
      resize-keyboard => $json{"resize_keyboard"},
      one-time-keyboard => $json{"one_time_keyboard"},
      selective => $json{"selective"}
    )
  }
}
