unit package Telegram::Bot::User;

class Telegram::Bot::User {
  has $.id;
  has $.first-name;
  has $.last-name;
  has $.user-name;

  method parse-json($json) {
    
  }
}
