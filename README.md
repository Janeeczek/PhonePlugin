# PhonePlugin dla IOS

#INSTALACJA
0. Aby plugin działał konieczne jest dodanie pluginu wspierającego swift PRZED dodaniem tego pluginu oraz przed wpisaniem komendy cordova platform add ios.
1. Dodawanie pluginu wspomagającego:(wpisać będąc w katalogu projektu cordova) cordova plugin add cordova-plugin-add-swift-support --save
2. Następnie wpisać: cordova platform add ios
3. Należy teraz uruchomić Xcode będąc wewnatrz projektu open ./platforms/ios/NAZWAPROJEKTU.xcworkspace/
4. W Xcode przejść do nazwaProjectu.xcodeproj. Wybrać okno targets, następnie Build Settings i w zakładce Swift Compiler - Language zmienić Swift Language Version na Swift 5
5. Instalacja plugman z npm: npm install -g plugman
6. Pobranie repozytorium.
7. Rozpakowanie go.
8. Instalacja pluginu komendą : plugman install --platform ios --project <scieżka do folderu \platoforms\ios w projekcie do którego ma być wgrany plugin> --plugin <ścieżka do folderu z pluginem>
9. Przykład : plugman install --platform ios --project C:\Users\Jan.Mazurek\CordovaProjects\test\platforms\ios --plugin        C:\Users\Jan.Mazurek\plugins\PhonePlugin

# API

## Metody
- [PhonePlugin.onCall](#onCall)


## onCall

Metoda zwraca aktualny stan połączeń GSM telefonu.
```javascript
PhonePlugin.onCall(event, error);
```
### Opis

Metoda po wywołaniu, nasłuchuje zmiań stanów GSM telefonu. W momencie kiedy telefon zmieni stan, zwróci jedno ze zdarzeń: "DISCONNECTED", "DIALING", "INCOMING", "CONNECTED","SET".  
*Metoda nasłuchuje do momentu zakończenia działania aplikacji*

### Wartość zwracana do JS    
  - __DISCONNECTED__: Połączenie zostało zakończone lub telefon nie prowadzi żadnej rozmowy.
  - __DIALING__: Telefon dzwoni do kogoś.
  - __INCOMING__: Ktoś dzwoni do tego telefonu
  - __CONNECTED__: Telefon aktualnie jest w trakcie aktywnej rozmowy.
  - __SET__: Wiadomość inicjalizacyjna. Zostało ustanowione połączenie między pluginem a Cordovą


### Parametery

- __event__: Funkcja CallBack(Listener) która zwraca typ String z wartością stanu GSM. 
- __error__: Funkcja CallBack która zwraca błąd jeśli takowy wystąpił.

### Przykład
```javascript
PhonePlugin.onCall((s)=>{
         switch (s) {
             case "DISCONNECTED":
                 console.log("PhonePlugin :: Call has ended");
                 break;
             case "DIALING":
                 console.log("PhonePlugin :: Phone is dialing");
                 break;
             case "INCOMING":
                 console.log("PhonePlugin :: Someone is calling");
                 break;
             case "CONNECTED":
                 console.log("PhonePlugin :: phone is on call");
                 break;
             case "SET":
                 console.log("PhonePlugin :: listener is set");
                 break;
         }},
         (e)=>{console.log(e);});    
```
