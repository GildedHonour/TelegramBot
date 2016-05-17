unit class Telegram::Bot::ReplyKeyboardHide; 
use Telegram::Bot::Core;
also does Telegram::Bot::Core::JsonParseable;

use JSON::Tiny;
use Telegram::Bot::Core;

has $.hide-keyboard;
has $.selective;

method parse-from-json($json) {
  self.new(
    hide-keyboard => $json{"hide_keyboard"},
    selective => $json{"selective"}
  )
}
