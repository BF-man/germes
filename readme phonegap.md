1. Node.js
`$ sudo apt-get install nodejs`

`$ sudo apt-get install nodejs-legacy`

2. Get Java (JRE & JDK)

sudo apt-get install openjdk-7-jre
sudo apt-get install openjdk-7-jdk

3. npm and phonegap

`$ sudo apt-get install npm`

`$ sudo npm install -g phonegap@latest`


Стабильная версия Cordova:

sudo npm install -g cordova@5.1.1


Проверить, что установка прошла хорошо:
```
$ phonegap
 Usage: phonegap [options] [commands]
 Description:
  PhoneGap command-line tool.
  Commands:
     help [command]       output usage information
     create <path>        create a phonegap project
      ...
``` 

4. Установить приложение для отладки на телефон(вместо эмулятора или USB установки):

[iTunes](https://itunes.apple.com/app/id843536693)

[Google Play](https://play.google.com/store/apps/details?id=com.adobe.phonegap.app)

[Windows Phone Store](http://www.windowsphone.com/en-us/store/app/phonegap-developer/5c6a2d1e-4fad-4bf8-aaf7-71380cc84fe3)

5. Создать проект

`$ phonegap create /home/artem-bubnov/RubymineProjects/germes/phonegap/ "com.phonegap.germes" "Germes"`

`$ cd myApp`

6. Запуск phonegap на 3010 порту

`$ phonegap serve -p 3010`  

rails s -b 0.0.0.0 -p 3001 //development

7. Открыть приложение для отладки на телефоне, ввести ip:3010 (подставить ваш ip в локальной сети) 
Так же все доступно через браузер.
  
8. Эмулятор (опционально)
Скачать Adroid-SDK
http://developer.android.com/sdk/index.html
	
sudo tar -zxvf ~/Downloads/android-sdk_r24.0.2-linux.tgz -C /usr/local/

gedit ~/.profile
export PATH=$PATH:/usr/local/android-sdk-linux/
export PATH=$PATH:/usr/local/android-sdk-linux/tools
export PATH=$PATH:/usr/local/android-sdk-linux/platform-tools
export PATH=$PATH:/usr/local/android-sdk-linux/build-tools

export ANDROID_HOME="/usr/local/android-sdk-linux"
export ANDROID_PLATFORM_TOOLS="/usr/local/android-sdk-linux/platform-tools"
export PATH="$PATH:$ANDROID_HOME:$ANDROID_PLATFORM_TOOLS"

перелогиниться для обновления PATH

проверить:
android

Запустится менеджер пакетов, установить 5 версию


Создать андроид устройство:
android avd
Create
Скин установить последний, устройство nexus 5

Запустить приложение на эмуляторе (детализированно) (проет должен быть создан, п.5):
phonegap run android -e --verbose

отладчик, запуск из консоли
ddms

9. Обновление

Текущая версия

phonegap -v

последняя доступная версия в npm

npm info phonegap version

обновить

sudo npm update -g  phonegap

10. Cordova

Если что-то не работает при установке на приложения телефон, эмулятор, используем стабильную версию Cordova:

cordova run android --verbose

или

cordova run android -е --verbose

------

cordova platform add android

11. Git

Безопасно можно исключить папки platforms и plugins

Их можно создать используя команду

cordova platform add <platform>