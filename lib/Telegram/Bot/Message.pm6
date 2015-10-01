class Telegram::Bot::Message {
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
  has $.delete-chat-photo;
  has $.group-chat-created;
}
