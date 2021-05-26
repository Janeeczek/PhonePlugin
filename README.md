# PhonePlugin dla IOS

#INSTALACJA
1. instalacja plugman z npm: npm install -g plugman
2. pobranie repozytorium.
3. rozpakowanie go.
4. instalacja pluginu komendą : plugman install --platform ios --project <scieżka do folderu \platoforms\ios w projekcie do którego ma być wgrany plugin> --plugin <ścieżka do folderu z pluginem>
5. 
    Przykład : plugman install --platform ios --project C:\Users\Jan.Mazurek\CordovaProjects\test\platforms\ios --plugin        C:\Users\Jan.Mazurek\plugins\PhonePlugin

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

### Wynik    
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
