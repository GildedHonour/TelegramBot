use v6;
use Test;

use lib 'lib';
use Telegram;

my $user1 = Telegram::Bot::User.new(
  id => 1,
  first-name => 1,
  last-name => 1,
  user-name => 1
);


ok($user1.id == 1, 'okkkkk');