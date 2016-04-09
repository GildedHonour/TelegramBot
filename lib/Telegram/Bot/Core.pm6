unit package Telegram::Bot::Core;

role JsonParseable {
  method parse-from-json($json) { ... }
}