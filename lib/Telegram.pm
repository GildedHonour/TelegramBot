use p6;
use Telegram::Bot::User;

class Telegram::Bot {
  has $.user = TelegramBot::User.new;
}