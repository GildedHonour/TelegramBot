use p6;
use TelegramBot::User;

class TelegramBot {
  has $.user = TelegramBot::User.new;
}