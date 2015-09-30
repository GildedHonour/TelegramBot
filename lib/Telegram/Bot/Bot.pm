use HTTP::UserAgent;
use JSON::Tiny;

class Telegram::Bot {
  has $.token;
  has $http-client = HTTP::UserAgent.new;

  method get-updates($offset, $limit, $timeout)
  method set-webhook($url, $certificate)
  method get-me() {
    $full_url = build-url($token, "getMe");
    try my $response = !send-request("getMe", "some type3243");
    if $response.is-success {
      $user-json = from-json($response.content);
      my $user = User.new(
        id => user-json{'id'},
        first-name => user-json{'first-name'},
        last-name => user-json{'last-name'},
        user-name => user-json{'user-name'}
      );
      return $user;
    } else {
      die $response.status-line;
    }
  }
  method send-message($chat-id, $text, $parse-mode, $disable-web-page-preview, $reply-to-message-id, $reply-markup)
  method forward-message($chat-id, $from-chat-id, $message-id)
  
  method send-photo($chat-id, $photo, $caption, $reply-to-message-id, $reply-markup)
  method send-audio($chat-id, $audio, $duration, $performer, $title, $reply-to-message-id, $reply-markup)
  method send-document($chat-id, $document, $reply-to-message-id, $reply-markup)
  method send-sticker($chat-id, $sticker, $reply-to-message-id, $reply-markup)
  method send-video($chat-id, $video, $duration, $caption, $reply-to-message-id, $reply-markup)

  method send-voice($chat-id, $voice, $duration, $reply-to-message-id, $reply-markup)
  method send-location($chat-id, $latitude, $longitude, $reply-to-message-id, $reply-markup)
  method send-chat-action($chat-id, $action)
  method get-user-profile-photos($user-id, $offset, $limit)
  method get-file($file-id)

  method !send-request($method, $type) {
    return $http-client.get(build-url($token, $method)); # or post  $type
  }

 $ua.get($full_url);
 
  sub !build-url($token, $method-name) { "https://api.telegram.org/bot$token/$method-name" }
}