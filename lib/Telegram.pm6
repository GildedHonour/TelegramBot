unit package Telegram;

use HTTP::UserAgent;
use JSON::Tiny;
use HTTP::Request;

use Telegram::Bot::User;
use Telegram::Bot::Update;
use Telegram::Bot::Message;

class Telegram::Bot {
  has $.token;
  has $!http-client = HTTP::UserAgent.new;
  has $!base-endpoint = "https://api.telegram.org";

  enum RequestType <Get Post>;

  method new($token) {
    self.bless(*, token => $token);
  }

  method !send-request($method-name, RequestType $request-type, &callback) {
    my $url = self!build-url($method-name);
    my $resp;
    if $request-type == RequestType::Get {
      $resp = $!http-client.get($url);
    } else {
      my $req = HTTP::Request.new(POST => $url, Content-Type => "application/x-www-form-urlencoded");
      # $req.add-content("foo=bar&zub=wazok");
      $resp = $!http-client.request($req); # add post parameters (body)
    }

    if $resp.is-success {
      my $json = from-json($resp.content){"result"};
      callback($json);
    } else {
      die $resp.status-line;
    }
  }
  
  method !build-url($method-name) { 
    "{$!base-endpoint}/bot{$.token}/{$method-name}"
  }

  method get-me() {
    self!send-request("getMe", RequestType::Get, -> $json {
      Telegram::Bot::User.new(
        id => $json{"id"},
        first-name => $json{"first_name"},
        last-name => $json{"last_name"},
        user-name => $json{"username"}
      );
    });
  }

  method get-updates($offset?, $limit?, $timeout?) {
    self!send-request("getUpdates", RequestType::Get, -> $json { 
      if $json == 0 {
        return [];
      } else {
        return [];
        # todo - parse as an array
        # my $maybe-msg = $json{"id"};
        # return Update::Update.new(
        #   id => $json{"id"},
        #   message => Nil #todo
        # );
      } 
    });
  }


  method set-webhook($url?, $certificate?) {

  }
  
  method send-message($chat-id, $text, $parse-mode, $disable-web-page-preview, $reply-to-message-id, $reply-markup) {

  }

  method forward-message($chat-id, $from-chat-id, $message-id) {

  }
  
  method send-photo($chat-id, $photo, $caption, $reply-to-message-id, $reply-markup) {

  }

  method send-audio($chat-id, $audio, $duration, $performer, $title, $reply-to-message-id, $reply-markup) {

  }

  method send-document($chat-id, $document, $reply-to-message-id, $reply-markup) {

  }

  method send-sticker($chat-id, $sticker, $reply-to-message-id, $reply-markup) {

  }

  method send-video($chat-id, $video, $duration, $caption, $reply-to-message-id, $reply-markup) {

  }

  method send-voice($chat-id, $voice, $duration, $reply-to-message-id, $reply-markup) {

  }

  method send-location($chat-id, $latitude, $longitude, $reply-to-message-id, $reply-markup) {

  }

  method send-chat-action($chat-id, $action) {

  }

  method get-user-profile-photos($user-id, $offset, $limit) {

  }

  method get-file($file-id) {

  }
}