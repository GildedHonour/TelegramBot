use Telegram::Bot::Message;

class Telegram::Bot::Update does Telegram::Bot::Core::JsonParseable {
  has $.id;
  has Telegram::Bot::Message $.message;

  method parse-from-json($json) {
    self.new(
      id => $json{"id"},
      message => Telegram::Bot::Message.parse-from-json() # todo
    )
  }
}