Telegram Bot [![Build Status](https://travis-ci.org/GildedHonour/TelegramBot.svg)](https://travis-ci.org/GildedHonour/TelegramBot)
================================================
A genuine Perl 6 client for the [Telegram's Bot API](https://core.telegram.org/bots).

## Under development

The work is in progress...


## Example

```perl6
use Telegram;

my $token = "xxx:yyy"; # replace with your token
my $bot = Telegram::Bot.new($token);
my $res = $bot.get-me();
say $res;
```

## Installation

```shell
$ panda install TelegramBot
```

## Tests

```shell
PERL6LIB=lib prove -e perl6 t
```

## Author

[Alex Maslakov](http://www.gildedhonour.com)

## License

Apache 2.0