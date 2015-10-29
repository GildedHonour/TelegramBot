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

  method !send-request($method-name, :$request-type = RequestType::Get, :%http-params = {}, :&callback) {
    my $url = self!build-url($method-name);
    my $resp = do if $request-type == RequestType::Get {
      $resp = $!http-client.get($url);
    } else {
      my $req = HTTP::Request.new(POST => $url, Content-Type => "application/x-www-form-urlencoded");
      if %http-params.elems > 0 {
        my $req-params;
        for %http-params.kv -> $k, $v {
          $req-params ~= "$k=$v&";
        }

        $req.add-content(substr($req-params, 0, *-1)); 
      }
      
      $resp = $!http-client.request($req);
    }

    if $resp.is-success {
      my $json_res = from-json($resp.content){"result"};
      if &callback.defined {
        callback($json_res)
      } else {
        $json_res
      }
      
    } else {
      die $resp.status-line;
    }
  }
  
  method !build-url($method-name) { 
    "{$!base-endpoint}/bot{$.token}/{$method-name}" 
  }

  method get-me() {
    self!send-request("getMe", callback => -> $json {
      Telegram::Bot::User.parse-from-json($json)
    });
  }

  method get-updates($offset?, $limit?, $timeout?) {
    self!send-request("getUpdates", callback => -> $json { 
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

  method set-webhook(%params (:$url, :$certificate)) {
    self!send-request("setWebhook", request-type => RequestType::Post, http-params => %params)
  }
  
  method send-message(%params (:$chat-id!, :$text!, :$parse-mode, :$disable-web-page-preview, :$reply-to-message-id, :$reply-markup)) {
    self!send-request("sendMessage", request-type => RequestType::Post, http-params => %params, callback => -> $json {
      # todo
      $json;
    });
  }

  method forward-message(%params ($chat-id!, $from-chat-id!, $message-id!)) {
    self!send-request("forwardMessage", request-type => RequestType::Post, http-params => %params, callback => -> $json {
      # todo
      $json;
    });
  }
  
  method send-photo(%params ($chat-id!, $photo!, $caption, $reply-to-message-id, $reply-markup)) {
    self!send-request("sendPhoto", request-type => RequestType::Post, http-params => %params, callback => -> $json {
      # todo
      $json;
    })
  }

  method send-audio(%params ($chat-id!, $audio!, $duration, $performer, $title, $reply-to-message-id, $reply-markup)) {
    self!send-request("sendAudio", request-type => RequestType::Post, http-params => %params, callback => -> $json {
      # todo
      $json;
    })
  }

  method send-document(%params ($chat-id!, $document!, $reply-to-message-id, $reply-markup)) {
    self!send-request("sendDocument", request-type => RequestType::Post, http-params => %params, callback => -> $json {
      # todo
      $json;
    })
  }

  method send-sticker(%params ($chat-id!, $sticker!, $reply-to-message-id, $reply-markup)) {
    self!send-request("sendSticker", request-type => RequestType::Post, http-params => %params, callback => -> $json {
      # todo
      $json;
    })
  }

  method send-video(%params ($chat-id!, $video!, $duration, $caption, $reply-to-message-id, $reply-markup)) {
    self!send-request("sendVideo", request-type => RequestType::Post, http-params => %params, callback => -> $json {
      # todo
      $json;
    })
  }

  method send-voice(%params ($chat-id!, $voice!, $duration, $reply-to-message-id, $reply-markup)) {
    self!send-request("sendVoice", request-type => RequestType::Post, http-params => %params, callback => -> $json {
      # todo
      $json;
    })
  }

  method send-location(%params ($chat-id!, $latitude!, $longitude!, $reply-to-message-id, $reply-markup)) {
    self!send-request("sendLocation", request-type => RequestType::Post, http-params => %params, callback => -> $json {
      # todo
      $json;
    })
  }

  method send-chat-action($chat-id, $action) {
    self!send-request("sendChatAction", request-type => RequestType::Post, http-params => %("chat_id" => $chat-id, "action" => $action), callback => -> $json {
      # todo
      $json;
    })
  }

  method get-user-profile-photos(%params ($user-id!, $offset, $limit)) {
    self!send-request("getUserProfilePhotos", request-type => RequestType::Post, http-params => %params, callback => -> $json {
      # todo
      $json;
    })
  }

  method get-file($file-id) {
    self!send-request("getFile", request-type => RequestType::Post, http-params => %("file_id" => $file-id), callback => -> $json {
      # todo
      $json;
    })
  }
}