use JSON::Tiny;
use Telegram::Bot::Core;

class Telegram::Bot::Message does Telegram::Bot::Core::JsonParseable {
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
  has $.photo;
  has $.sticker;
  has $.video;
  has $.voice;
  has $.caption;
  has $.contact;
  has $.location;
  has $.new-chat-participant;
  has $.left-chat-participant;
  has $.new-chat-title;
  has $.new-chat-photo; # todo - array of PhotoSize
  has $.delete-chat-photo;
  has $.group-chat-created;

  method parse-from-json($json) {
    self.new(
      message-id => $json{"message_id"},
      from => $json{"from"},
      date => $json{"date"},
      chat => $json{"chat"},
      forward-from => User::parse-from-json($json{"forward_from"}),
      forward-date => $json{"forward_date"},
      # reply-to-message => Message::parse-from-json$json{"reply_to_message"}, # todo
      text => $json{"text"},
      audio => Audio::parse-from-json($json{"audio"}),
      document => Document::parse-from-json($json{"document"}),
      photo => PhotoSize::parse-from-json($json{"photo"}), #todo - array of
      sticker => Sticker::parse-from-json($json{"sticker"}),
      video => Video::parse-from-json($json{"video"}),
      voice => Voice::parse-from-json($json{"voice"}),
      caption => $json{"caption"},
      contact => Contact::parse-from-json($json{"contact"}),
      location => Location::parse-from-json($json{"location"}),
      new-chat-participant => User::parse-from-json($json{"new_chat_participant"}),
      left-chat-participant => User::parse-from-json($json{"left_chat_participant"}),
      new-chat-title => $json{"new_chat_title"},
      new-chat-photo => PhotoSize::parse-from-json($json{"new_chat_photo"}), # todo - array of PhotoSize
      delete-chat-photo => $json{"delete_chat_photo"},
      group-chat-created => $json{"group_chat_created"}
    )
  }
}
