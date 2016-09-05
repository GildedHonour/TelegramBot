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

method parse-from-json($json) {
  self.new(
    message-id => $json<message_id>,
    from => Telegram::Bot::User.parse-from-json($json<from>),
    date => $json<date>,
    chat => Telegram::Bot::Chat.parse-from-json($json<forward_from>),
    forward-from => Telegram::Bot::User.parse-from-json($json<forward_from>),
    forward-date => $json<forward_date>,
    # reply-to-message => Message::parse-from-json$json<reply_to_message>, # todo
    text => $json<text>,
    audio => Telegram::Bot::Audio.parse-from-json($json<audio>),
    document => Telegram::Bot::Document.parse-from-json($json<document>),
    photo => Telegram::Bot::PhotoSize.parse-from-json($json<photo>), #todo - array of
    sticker => Telegram::Bot::Sticker.parse-from-json($json<sticker>),
    video => Telegram::Bot::Video.parse-from-json($json<video>),
    voice => Telegram::Bot::Voice.parse-from-json($json<voice>),
    caption => $json<caption>,
    contact => Telegram::Bot::Contact.parse-from-json($json<contact>),
    location => Telegram::Bot::Location.parse-from-json($json<location>),
    new-chat-participant => Telegram::Bot::User.parse-from-json($json<new_chat_participant>),
    left-chat-participant => Telegram::Bot::User.parse-from-json($json<left_chat_participant>),
    new-chat-title => $json<new_chat_title>,
    new-chat-photo => Telegram::Bot::PhotoSize.parse-from-json($json<new_chat_photo>), # todo - array of PhotoSize
    delete-chat-photo => $json<delete_chat_photo>,
    group-chat-created => $json<group_chat_created>
  )
}
