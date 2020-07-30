## Как обзавестись доменом
1) Воспользуемся сервисом, который продает домены, в том числе бесплатно: https://www.freenom.com/ru/index.html?lang=ru
На сайте не очень очевидная регистрация. Вам поможет вот это видео: https://youtu.be/KKM41GF1LVE?t=46
2) Когда регистрация домена закончена, необходимо отдать домен в управление Cloud DNS. Для этого нужно прописать NS записи Google.
* ns-cloud-a1.googledomains.com.
* ns-cloud-a2.googledomains.com.
* ns-cloud-a3.googledomains.com.
* ns-cloud-a4.googledomains.com. 
3) Хоть и DNS серверы обновляются до 24 часов, в реальности, пока проект будет готовится, все заработает в течении получаса.  
Полный процесс регистрации домена, создание зоны Cloud DNS и как быстро все отрабатывает, представленно тут: https://www.youtube.com/watch?v=OKvOvHuOnrw
