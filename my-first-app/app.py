import os
import socket
from datetime import datetime
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    user_name = os.getenv("USER_NAME", "Дефолтное Имя")
    container_id = socket.gethostname()
    current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    return f"""
    <html>
        <head>
            <title>DevOps Dashboard</title>
            <style>
                body {{ font-family: sans-serif; background: #0f172a; color: #f8fafc; text-align: center; padding-top: 50px; }}
                .card {{ background: #1e293b; display: inline-block; padding: 30px; border-radius: 12px; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.5); }}
                h1 {{ color: #38bdf8; }}
                .badge {{ background: #0284c7; padding: 6px 12px; border-radius: 6px; font-weight: bold; }}
            </style>
        </head>
        <body>
            <div class="card">
                <h1>🚀 Мой первый микросервис в Docker!</h1>
                <p><strong>Создатель:</strong> <span class="badge"> <code>{user_name}</code></span></p>
                <p><strong>ID Контейнера (Hostname):</strong> <code>{container_id}</code></p>
                <p><strong>Время внутри контейнера:</strong> {current_time}</p>
                <p style="color: #4ade80;">● Статус: Сервис работает изолированно и безопасно</p>
            </div>
        </body>
    </html>
    """

if __name__ == '__main__':
    # Слушаем все сетевые интерфейсы на порту 5000
    app.run(host='0.0.0.0', port=5000)
