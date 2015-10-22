use JSON::Tiny;
use Telegram::Bot::Core;

class Telegram::Bot::UserProfilePhotos does Telegram::Bot::Core::JsonParseable {
  has $.total-count;
  has @.photos; #todo - array of array

  method parse-from-json($json) {
    self.new(
      total-count => $json{"total_count"}
      # todo - photos

    )
  }
}
