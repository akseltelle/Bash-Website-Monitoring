# Bash-Website-Monitoring
Monitoring of websites using Bash with notifications to Telegram

This script is really simple to use and easy to set up.

All you require is a Telegram Bot Token and Chat ID.
* You can get a token from https://t.me/BotFather.
* You can get your chat ID by sending a message to the bot and going to this URL to view the chat_id: https://api.telegram.org/bot**********************************************/getUpdates

Once you have this, add them to the script, and run it on your Linux computer or server.

This script checks after a file on the website you are checking named telegram.php. This file should report back 200 OK when viewing in a browser.


# Crontab
To automate the script, add the script to Crontab:

Run the following command:

$ crontab -e


Add the following to the bottom of the file (Edit the path to where you have placed the script):
* * * * * bash /home/<user>/telegram.sh >> /home/<user>/crontab-job.log 2>&1

Check if the script is running every minute with the following command:
  
$ tail -f crontab-job.log
