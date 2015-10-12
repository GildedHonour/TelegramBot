use Telegram::Bot::Message;

class Telegram::Bot::Update {
  has $.id;
  has Telegram::Bot::Message $.message;
}