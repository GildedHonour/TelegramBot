unit class Telegram::Bot::Message;
use Telegram::Bot::Core;
also does Telegram::Bot::Core::JsonParseable;

use JSON::Tiny;
use Telegram::Bot::Core;
use Telegram::Bot::Chat;
use Telegram::Bot::User;
use Telegram::Bot::Audio;
use Telegram::Bot::Document;
use Telegram::Bot::PhotoSize;
use Telegram::Bot::Sticker;
use Telegram::Bot::Video;
use Telegram::Bot::Voice;
use Telegram::Bot::Contact;
use Telegram::Bot::Location;

has $.message-id;
has $.from;
has $.date;
has $.chat;
has $.forward-from;
has $.forward-date;
has $.reply-to-message;
has $.text;
has $.audio;
has $.document;
has @.photo;
has $.sticker;
has $.video;
has $.voice;
has $.caption;
has $.contact;
has $.location;
has $.new-chat-participant;
has $.left-chat-participant;
has $.new-chat-title;
has @.new-chat-photo;
has $.delete-chat-photo;
has $.group-chat-created;

my %ItemConstructors = (
  from => 'User',
  chat => 'Chat',
  forward_from => 'User',
  audio => 'Audio',
  document => 'Document',
  photo => 'PhotoSize',
  sticker => 'Sticker',
  video => 'Video',
  voice => 'Voice',
  contact => 'Contact',
  location => 'Location',
  new_chat_participant => 'User',
  left_chat_participant => 'User',
  new_chat_photo => 'PhotoSize',
);

method parse-from-json($json) {
  my %param;
  for $json.pairs -> $p {
    my $new-key = $p.key.subst('_','-');
    my $new-val;
    if %ItemConstructors{$p.key}:exists {
      my $constructor = "Telegram::Bot::" ~ %ItemConstructors{$p.key};
      %param{$new-key} := ::($constructor).parse-from-json($p.value)
    } else {
      %param{$new-key} := $p.value;
    }
  }
  self.new(|%param)
}
