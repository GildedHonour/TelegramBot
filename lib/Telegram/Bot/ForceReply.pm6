use JSON::Tiny;
use Telegram::Bot::Core;

class Telegram::Bot::ForceReply does JsonParseable {
  has $.force-reply;
  has $.selective;

  method parse-from-json($json) {
    self.new(
      force-reply => $json{"force_reply"},
      selective => $json{"selective"}
    )
  }
}
