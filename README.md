Предполагается, что рельсы установлены. Версия Rails 6.1.4.1 БД: postgresql

Быстрый запуск:

git clone https://github.com/vbadashyov/newsletter
cd newsletter
bundle install
rake db:create - создание БД(изменить конфигурацию логина-пароля)
rake db:migrate - применение миграций БД
rake db:seed - создание дефолтных записей в БД
rails s - запуск сервера

Запуск задач для автоматической рассылки новостей:
whenever --update-crontab --set environment='development' (необходимо предустановить приложение для рассылки - использовался postfix)
