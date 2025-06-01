import requests
import time
import os


TELEGRAM_BOT_TOKEN = "7672614312:AAEsIppgrAl175ZkaEv6wFZCOvt-ay_UxHM"
TELEGRAM_CHAT_ID = "1432273505"


URL_TO_MONITOR = "http://35.171.203.70:9000/"

def send_alert(message):
    url = f"https://api.telegram.org/bot{TELEGRAM_BOT_TOKEN}/sendMessage"
    payload = {
        "chat_id": TELEGRAM_CHAT_ID,
        "text": message
    }
    requests.post(url, data=payload)

def check_website():
    try:
        response = requests.get(URL_TO_MONITOR, timeout=5)
        if response.status_code != 200:
            send_alert(f"⚠️ {URL_TO_MONITOR} does not answer. Status: {response.status_code}")
    except Exception as e:
        send_alert(f"❌ {URL_TO_MONITOR} down. Error: {str(e)}")

while True:
    check_website()
    time.sleep(60)  
