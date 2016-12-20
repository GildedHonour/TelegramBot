unit class Telegram::Bot::GroupChat; 
use Telegram::Bot::Core;
also does Telegram::Bot::Core::JsonParseable;

has $.id;
has $.title;

method parse-from-json($json) {
  self.new(
    id => $json{"id"},
    title => $json{"title"},
  )
}
