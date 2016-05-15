unit module Telegram::Bot::ForceReply;

use JSON::Tiny;
use Telegram::Bot::Core;

class ForceReply does Telegram::Bot::Core::JsonParseable {
  has $.force-reply;
  has $.selective;

  method parse-from-json($json) {
    self.new(
      force-reply => $json{"force_reply"},
      selective => $json{"selective"}
    )
  }
}
