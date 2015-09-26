class Telegram::Bot::Message {
  has $.message_id;
  has $.from;
  has $.date;
  has $.chat;
  has $.forward_from;
  has $.forward_date;
  has $.reply_to_message;
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
  has $.new_chat_participant;
  has $.left_chat_participant;
  has $.new_chat_title;
  has $.delete_chat_photo;
  has $.group_chat_created;
}
