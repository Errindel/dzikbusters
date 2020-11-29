import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
import './dashboard.dart';

class ToDoAfter extends StatefulWidget {
  static const routeName = '/todo';

  ToDoAfter();

  @override
  _ToDoAfterState createState() => _ToDoAfterState();
}

class _ToDoAfterState extends State<ToDoAfter> {
  bool _cleanHands = false;
  bool _cleanShoes = false;
  bool _washClothes = false;
  bool _doNotEnterSwineHouse = false;
  bool _ifByCarCleanTheCar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To do lista'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Text(
                "Lista rzeczy do zrobienia",
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 2, 8),
              child: Text(
                "W trosce o dobrostan zwierząt gospodarskich przygotowaliśmy instrukcję rzeczy które należy wykonać po zgłoszeniu dzika by skutecznie ograniczyć rozprzestrzenianie się wirusa ASF",
                style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CheckboxListTile(
                  value: _cleanHands,
                  onChanged: (bool val) {
                    setState(() {
                      _cleanHands = val;
                    });
                  },
                  title: Text("Zdezynfekuj ręce"),
                ),
                CheckboxListTile(
                  value: _cleanShoes,
                  onChanged: (bool val) {
                    setState(() {
                      _cleanShoes = val;
                    });
                  },
                  title: Text("Zdezynfekuj obuwie"),
                ),
                CheckboxListTile(
                  value: _ifByCarCleanTheCar,
                  onChanged: (bool val) {
                    setState(() {
                      _ifByCarCleanTheCar = val;
                    });
                  },
                  title: Text(
                      "Jeżeli prowadziłeś samochód, zdezynfekuj wycieraczki"),
                ),
                CheckboxListTile(
                  value: _washClothes,
                  onChanged: (bool val) {
                    setState(() {
                      _washClothes = val;
                    });
                  },
                  title: Text("Wypierz ubrania"),
                ),
                CheckboxListTile(
                  value: _doNotEnterSwineHouse,
                  onChanged: (bool val) {
                    setState(() {
                      _doNotEnterSwineHouse = val;
                    });
                  },
                  title: Text(
                      "Przez 72h nie wchódź do obory i unikaj kontaktu ze zwierzętami gospodarskimi"),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    RaisedButton(
                      color: Colors.green.shade200,
                      onPressed: () {
// Perform some action
                        Navigator.of(context).pushNamed(Dashboard.routeName);
                      },
                      child: const Text('ZAPISZ'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
