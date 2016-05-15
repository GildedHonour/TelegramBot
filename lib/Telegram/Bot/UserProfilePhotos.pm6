unit module Telegram::Bot::UserProfilePhotos;

use JSON::Tiny;
use Telegram::Bot::Core;

class UserProfilePhotos does Telegram::Bot::Core::JsonParseable {
  has $.total-count;
  has @.photos;

  method parse-from-json($json) {
    self.new(
      total-count => $json{"total_count"}
      # todo - photos

    )
  }
}
