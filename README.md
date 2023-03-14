# androind-automation-ruby
Projeto de automacao de testes mobile em android utilizando Ruby,Appium e cucumber.
Para que possamos executar o projeto precisamos baixar algumas dependencias:

## DOWNLOADS
    Instalar JDK (JAVA Development Kit): https://www.java.com/pt_BR/download/
    normalmente utilizo a versao do java 8
    Appium Desktop: é a interface da ferramenta Appium que será o foco do nosso workshop. O download está disponível aqui: https://github.com/appium/appium-desktop/releases
    Sera necessario tambem que faca o download do appium inspector para que seja possivel inspecionar os elementos do aplicativo. segue o link: 
    https://github.com/appium/appium-inspector/releases

    Android Studio: é um pacote do Android Studio que possibilita que possamos instanciar dispositivos móveis de várias configurações e modelos de forma emulada e em vários níveis de API. Para isso, é preciso baixar o Android Studio e, durante o setup, marcar a opção de instalar também o AVD: https://developer.android.com/studio/index.html?hl=pt-br

## Criar emulador a partir do Android Studio
    Dentro do android studio na sessao de Device Manager escolha opcao de create device
    Versao de OS: Optar por OS mais recente. a nao ser que exista alguma incopatibilidade para algo em especifico para a necessidade de usar uma versao mais anteriror.
    Apos instalacao do emulador, voce estara apto para inicia-lo.
    Instalar .apk debug no emulador. temos duas opcoes:
    Arrastar a apk ate o emulador
    Abra o teriminal e entre na pasta onde esta apk por exemplo: cd Usr/Downloads em seguida instale atraves do adb com o seguinte comando: adb install challenge-qa.apk

## Configurando variaveis de ambiente JAVA_HOME A ANDROID_HOME

No terminal execute os seguintes comandos: 
nano ~/.zshrc
Dentro do arquivo export as seguintes variaveis de ambiente
export ANDROID_HOME=/seu/path/Library/Android/sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
obs: substitua o /seu/path do ANDROID_HOME e JAVA_HOME para o caminho onde esta instalado em sua maquina.
Aperte Ctrl+X para salvar, em seguida Y e depois aperte a tecla ENTER
por fim execute no terminal: source ~/.zshrc para carregar as variaveis

## Configurando variaveis de ambiente do ruby

No terminal execute os seguintes comandos:
brew install ruby 2.7.5
brew install rbenv
rbenv install 2.7.5
rbenv global 2.7.5
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc

## Configurando variaveis de ambiente da gem

No terminal execute os seguintes comandos:
nano ~/.bash_profile
realizar os export dentro do arquivo
export GEM_HOME=$HOME/.gem/ruby/2.7.5
export PATH=$GEM_HOME/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.5/bin:$PATH"

Ctrl+x depois Y depois ENTER para salvar
depois mandar source ~/.bash_profile para carregar as variaveis

## DOWNLOAD XCODE
* Instalar Xcode (versao 13+  - 
* Instalar Command Line Tools for Xcode - 
* Instalar Appium inspector - (baixar o arquivo **Appium-Inspector-mac-2021.9.2.dmg**)
- Apos realizar o download do Inspector executar o comando
    'xattr -cr Appium-Inspector-mac-2021.9.2.dmg'

* Criar Simulador dentro do XCode(Caso o simulador esteja com o idioma **pt** modificar para **en**)
    * Criar simulador com a versao do iOS 9.3+

* Instalar .app do Simulador
* Instalar e inicializar postgreSQL utilizando os comandos
    'brew install postgress'
    'brew services start postgresql'

## VERIFICANDO SE TODAS AS DEPENDENCIAS ESTAO INSALADAS
caso ainda nao tenha instalado o appium-doctor, excute no terminal na raiz da sua maquina.
npm install -g appium-doctor --android
apos isso execute Appium-doctor
caso esteja tudo configurando retornara algo parecido com isso:


WARN AppiumDoctor [Deprecated] Please use appium-doctor installed with "npm install @appium/doctor --location=global"
info AppiumDoctor Appium Doctor v.1.16.2
info AppiumDoctor ### Diagnostic for necessary dependencies starting ###
info AppiumDoctor  ✔ The Node.js binary was found at: /usr/local/bin/node
info AppiumDoctor  ✔ Node version is 18.15.0
info AppiumDoctor  ✔ Xcode is installed at: /Applications/Xcode.app/Contents/Developer
info AppiumDoctor  ✔ Xcode Command Line Tools are installed in: /Applications/Xcode.app/Contents/Developer
info AppiumDoctor  ✔ DevToolsSecurity is enabled.
info AppiumDoctor  ✔ The Authorization DB is set up properly.
WARN AppiumDoctor  ✖ Carthage was NOT found!
info AppiumDoctor  ✔ HOME is set to: /Users/robertofilho
info AppiumDoctor  ✔ ANDROID_HOME is set to: /Users/robertofilho/Library/Android/sdk
info AppiumDoctor  ✔ JAVA_HOME is set to: /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home
info AppiumDoctor    Checking adb, android, emulator, apkanalyzer
info AppiumDoctor      'adb' is in /Users/robertofilho/Library/Android/sdk/platform-tools/adb
info AppiumDoctor      'android' is in /Users/robertofilho/Library/Android/sdk/tools/android
info AppiumDoctor      'emulator' is in /Users/robertofilho/Library/Android/sdk/emulator/emulator
info AppiumDoctor      'apkanalyzer' is in /Users/robertofilho/Library/Android/sdk/cmdline-tools/latest/bin/apkanalyzer
info AppiumDoctor  ✔ adb, android, emulator, apkanalyzer exist: /Users/robertofilho/Library/Android/sdk
info AppiumDoctor  ✔ 'bin' subfolder exists under '/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home'
info AppiumDoctor ### Diagnostic for necessary dependencies completed, one fix needed. ###


## CONFIGURANDO APPIUM
Abra o appium
Va em edit configuration
Identifique onde esta instalado o seu android/sdk e coloque o diretorio para o ANDROID_HOME
Identifique onde esta instalado o seu jdk e coloque o diretorio para o JAVA_HOME
E clique em save and restart
Feito isso, voce ja pode inicializar o seu appium



## CONFIGURANDO CAPABILITIES APPIUM INSPECTOR
    Acesse o appium e clicar em start Server

    Em Desired capabitilies passar os seguinte parametros e valores e salvar

    platformName(text): iOS

    deviceName(text): iPhone 13

    platformVersion(text): 15.5

    automationName(text): XCUITest

    app(text): /seu/path/Myapp.app
    Obs: Substitua para o caminho onde se encontrar o mycar.app

    E click em instart server

    Feito isso sua maquina esta preparada para iniciar a sessao no appium inspector e com isso podera inspecionar os elementos

## BAIXANDO DEPENDENCIAS DO PROJETO PARA QUE SEJA POSSIVEL EXECUTA-LO

Na raiz do seu projeto execute os seguintes comandos:

1- gem install bundler

2- gem install allure-cucumber

3- bundle install

Feito isso seu projeto esta configurado para execucao. para isso exucute:
rake 'run_sequential_test[ios,@sanity]'