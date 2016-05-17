unit class Telegram::Bot::UserProfilePhotos; 
use Telegram::Bot::Core;
also does Telegram::Bot::Core::JsonParseable;

use JSON::Tiny;
use Telegram::Bot::Core;

has $.total-count;
has @.photos;

method parse-from-json($json) {
  self.new(
    total-count => $json{"total_count"}
    # todo - photos

  )
}
