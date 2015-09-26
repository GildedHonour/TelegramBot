class Telegram::Bot {
  my has $.token;
  
  method get_updates($offset, $limit, $timeout)
  method set_webhook($url, $certificate)
  method get_me()
  method send_message($chat_id, $text, $parse_mode, $disable_web_page_preview, $reply_to_message_id, $reply_markup)
  method forward_message($chat_id, $from_chat_id, $message_id)
  
  method send_photo($chat_id, $photo, $caption, $reply_to_message_id, $reply_markup)
  method send_audio($chat_id, $audio, $duration, $performer, $title, $reply_to_message_id, $reply_markup)
  method send_document($chat_id, $document, $reply_to_message_id, $reply_markup)
  method send_sticker($chat_id, $sticker, $reply_to_message_id, $reply_markup)
  method send_video($chat_id, $video, $duration, $caption, $reply_to_message_id, $reply_markup)

  method send_voice($chat_id, $voice, $duration, $reply_to_message_id, $reply_markup)
  method send_location($chat_id, $latitude, $longitude, $reply_to_message_id, $reply_markup)
  method send_chat_action($chat_id, $action)
  method get_user_profile_photos($user_id, $offset, $limit)
  method get_file($file_id)
}