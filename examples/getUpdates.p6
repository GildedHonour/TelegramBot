my $token = "xxx:yyy"; # replace with your token
my $bot = Telegram::Bot.new($token);

# get update
my $updates = $bot.get-updates();
#my $updates = $bot.get-updates({offset => xxxxx, limit => 1}); # with offset and limit

# iterate through updates
for 0 .. ($updates.elems - 1) -> $item
{
    say $updates[$item].update_id;      # update_id attribute
    say $updates[$item].message.date;   # date attribute
    say $updates[$item].message.text;   # text attribute
    say $updates[$item].message.^methods; # get other available methods / attributes
}

