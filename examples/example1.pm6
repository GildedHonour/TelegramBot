my $token = "xxx:yyy"; # replace with your token
my $bot = Telegram::Bot.new($token);

# get me
my $res1 = $bot.get-me();
say $res1;

# send message to Forbes bot
