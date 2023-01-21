#!/bin/bash
bot_token="**********************************************" ## You can get a token from https://t.me/BotFather.
chat_id="**********" ## You can get your chat ID by sending a message to the bot and going to this URL to view the chat_id: https://api.telegram.org/bot**********************************************/getUpdates
set -- example.com example.net raw.githubusercontent.com/akseltelle/Bash-Website-Monitoring/main ## All URL's are accepted, as long as the telegram.php file can be found. https:// and /telegram.php is added to the complete URL automatically, so if the complete URL is https://example.com/telegram.php, only add example.com to this list.
date="$(date +%d/%m/%Y\ %H:%M:%S)"
for arg; do
   status="$(wget --timeout=2 --tries=1 -q -O - https://$arg/telegram.php)"
if [[ $status == "200 OK" ]]
then
  echo "$date Success! Status of $arg: $status";
else
  if [[ $status == "" ]]
  then
    curl -s -X POST https://api.telegram.org/bot$bot_token/sendMessage -d text="[$date] Status of $arg: Timeout" -d chat_id=$chat_id
  else
    curl -s -X POST https://api.telegram.org/bot$bot_token/sendMessage -d text="[$date] Status of $arg: $status" -d chat_id=$chat_id
  fi
fi
done