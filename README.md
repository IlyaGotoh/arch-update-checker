# arch-update-checker
Bash script for checking updates (including from AUR) that uses Notify-send.
Works only on Archlinux. **libnotify**, **wget** and **pacman-contrib** packages are required.
```
Usage: arch-update-checker [FLAG]
 -f            (force) don't test Internet connection
 -s [VALUE]    (strings) maximum strings in notification (30 by default)
 -n            don't show notifications (terminal only)
 -h            show help
 -v            show program version
```


Скрипт для проверки обновлений (в репозиториях и AUR) и вывода с помощью notify-send для Archlinux.
Для работы нужны пакеты **libnotify**, **wget** и **pacman-contrib**.
```
Использование: arch-update-checker [ФЛАГ]
 -f            (force) не проверять интернет-соединение
 -s [ЧИСЛО]    (strings) максимальное количество строк уведомления (по умолчанию - 30)
 -n            не показывать уведомления (вывод в терминал)
 -h            показать справку
 -v            показать номер версии программы
```
