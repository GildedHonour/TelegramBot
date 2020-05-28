my $token = "1184270522:AAEqnd9kT0-dlJoZyPbhsJIo7GnfnPm4z08"; # replace with your token
my $bot = Telegram::Bot.new($token);

# get me
my $res1 = $bot.get-me();
say $res1;

# send message to Forbes bot
