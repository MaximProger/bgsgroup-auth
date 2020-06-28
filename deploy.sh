#!/usr/bin/env sh

# Данные для входа в систему:
# login: info@bgs-group.eu
# password: 123456
# Поля "Имя" и "Профессия" так же являются обязательными, значения этих полевый выводится на странице профиля
# Поле аватар, не понял как реализовать без сервера, т.к. у изображения на клиенте скрывается путь, поэтому по дефолту поставил свое фото :)


# остановить публикацию при ошибках
set -e

# сборка
npm run build

# переход в каталог сборки
cd dist

# если вы публикуете на пользовательский домен
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# если вы публикуете по адресу https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# если вы публикуете по адресу https://<USERNAME>.github.io/<REPO>
# git push -f git@github.com:<USERNAME>/<REPO>.git master:gh-pages

cd -