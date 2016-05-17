unit class Telegram::Bot::ForceReply; 
use Telegram::Bot::Core;
also does Telegram::Bot::Core::JsonParseable;

use JSON::Tiny;
use Telegram::Bot::Core;

has $.force-reply;
has $.selective;

method parse-from-json($json) {
  self.new(
    force-reply => $json{"force_reply"},
    selective => $json{"selective"}
  )
}
