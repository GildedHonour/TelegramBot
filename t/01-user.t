use v6;
use Test;

use lib 'lib';
use Telegram;
plan 3;

my $user1 = Telegram::Bot::User.new(
  id => 1,
  first-name => 1,
  last-name => 1,
  user-name => 1
);


isa-ok($user1, Telegram::Bot::User);
is($user1.id, 1);