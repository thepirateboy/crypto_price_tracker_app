import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'networking.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var selectedCurrency = "USD";

  var btcToFiat = "";
  var ethToFiat = "";
  var xprToFiat = "";
  var fiatCurrency = "";

  DropdownButton getDropDownButton() {
    List<DropdownMenuItem<String>> theListItem = [];

    for (String s in currenciesList) {
      theListItem.add(DropdownMenuItem(
        child: Text(s),
        value: s,
      ));
    }

    return DropdownButton(
      value: selectedCurrency,
      items: theListItem,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
        print(value);
      },
    );
  }

  CupertinoPicker getCupertinoPickerButton() {
    List<Text> theListItem = [];

    for (var x in currenciesList) {
      theListItem.add(Text(x));
    }

    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) async {
        // print(theListItem[selectedIndex]);

        fiatCurrency = currenciesList[selectedIndex];

        print("fiatcurrency = $fiatCurrency");

        var url =
            "https://api.nomics.com/v1/currencies/ticker?key=aa5c3ae90e82b87bcde0d9cfc550007aa88f0527&ids=BTC, ETH, XPR&interval=1d,30d&convert=$fiatCurrency&per-page=100&page=1";

        NetworkHelper networkhelper = NetworkHelper(url);

        var coinData = await networkhelper.getData();
        setState(() {
          btcToFiat = coinData[0]['price'];
        });
      },
      children: theListItem,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $btcToFiat USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $btcToFiat USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $btcToFiat USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                var url =
                    "https://api.nomics.com/v1/currencies/ticker?key=aa5c3ae90e82b87bcde0d9cfc550007aa88f0527&ids=BTC &interval=1d,30d&convert=AUD&per-page=100&page=1";

                NetworkHelper networkhelper = NetworkHelper(url);

                var coinData = await networkhelper.getData();

                print(coinData);

                var coinName = coinData[0]['price'];

                print("coin data = $coinName");

                setState(() {
                  btcToFiat = coinName;
                });
              },
              child: Text("aaaa")),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS
                ? getCupertinoPickerButton()
                : getDropDownButton(),
          ),
        ],
      ),
    );
  }
}
