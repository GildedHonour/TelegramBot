unit package Telegram;

use HTTP::UserAgent;
use HTTP::Request::Common;
use JSON::Tiny;

use Telegram::Bot::User;
use Telegram::Bot::Update;
use Telegram::Bot::Message;
use Telegram::Bot::File;

class Telegram::Bot {
  has $.token;
  has $!http-client = HTTP::UserAgent.new;
  has $!base-endpoint = "https://api.telegram.org";

  enum RequestType <Get Post>;
  enum EntityType <Single Multiple>;

  method new($token) {
    self.bless(*, token => $token);
  }

  #todo refactor
  method !send-request($method-name, :$request-type = RequestType::Get, :%http-params = {}, :$entity-type = EntityType::Multiple, :&callback) {
    my $url = self!build-url($method-name);
    my $resp = do if $request-type == RequestType::Get {
      my $q-str = do if %http-params != 0 {
        my $http-params-str;
        for %http-params.kv -> $k, $v {
          my $k2 = $k.subst("-", "_");
          $http-params-str += "$k2=$v";
        }
        
        $http-params-str
      }
      
      $q-str ?? $!http-client.get($url + $q-str) !! $!http-client.get($url)
    } else {
      my %http-params-formatted;
      for %http-params.kv -> $k, $v {
        my $k2 = $k.subst("-", "_");
        %http-params-formatted{$k2} = $v;
      }

      my $req = POST($url, %http-params-formatted);
      $!http-client.request($req);
    }

    if $resp.is-success {
      # todo refactor
      
      if $entity-type == EntityType::Single {
        my %jres = from-json($resp.content){"result"};
        &callback.defined ?? callback(%jres) !! %jres
      } else {
        my @jres = @(from-json($resp.content){"result"});
        if @jres == 0 {
          return []
        }
        
        &callback.defined ?? callback(@jres) !! @jres
      }

    } else {
      my $jres = from-json($resp.content);
      die "HTTP error {$jres{'error_code'}} {$jres{'description'}}";
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

  method get-updates(%params? (:$offset, :$limit, :$timeout)) {
    self!send-request("getUpdates", http-params => %params, callback => -> @json {
      @json.map({ 
        Telegram::Bot::Update.new(id => $_{"update_id"}); # todo - init message
      });
    });
  }

  method set-webhook(%params (:$url, :$certificate)) {
    self!send-request("setWebhook", request-type => RequestType::Post, http-params => %params)
  }

  method send-message(%params (:$chat-id!, :$text!, :$parse-mode, :$disable-web-page-preview, :$reply-to-message-id, :$reply-markup)) {
    self!send-request("sendMessage", request-type => RequestType::Post, http-params => %params, callback => -> $json {
      $json
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
      Telegram::Bot::UserProfilePhotos.parse-from-json($json)
    })
  }

  method get-file($file-id) {
    self!send-request("getFile", request-type => RequestType::Post, entity-type => EntityType::Single, http-params => %("file_id" => $file-id), callback => -> %json {
      if %json{"file_path"} {
        %json{"file_path"} = Telegram::Bot::File.get-base-url($!token, %json{"file_path"})
      }
      
      Telegram::Bot::File.parse-from-json(%json)
    })
  }
  
  method log($callback) {
    # todo
  }
}
