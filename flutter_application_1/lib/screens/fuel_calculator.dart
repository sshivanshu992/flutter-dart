import 'package:flutter/material.dart';

class FuelCalculater extends StatefulWidget {
  const FuelCalculater({Key? key}) : super(key: key);

  @override
  State<FuelCalculater> createState() => _FuelCalculaterState();
}

class _FuelCalculaterState extends State<FuelCalculater> {
  final _curriencies = ['Rupees', 'Dollars', 'Euros', 'Pounds'];
  String _currency = 'Rupees';
  String result = '';

  var distanceController = TextEditingController();
  var unitController = TextEditingController();
  var priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.car_rental),
        title: const Text('Fuel Calculater'),
      ),
      body: Container(
        color: Colors.white70,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextField(
                controller: distanceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Distance',
                  hintText: 'e.g. 246',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextField(
                controller: unitController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'No of Kms Per Liter',
                  hintText: 'e.g. 16',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Fuel Cost P.L',
                        hintText: 'e.g. 16',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DropdownButton(
                    value: _currency,
                    items: _curriencies.map((String currency) {
                      return DropdownMenuItem<String>(
                          child: Text(currency), value: currency);
                    }).toList(),
                    onChanged: (String? value) {
                      _onDropDownMenuItemChanged(value);
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _calculate();
                      },
                      child: const Text('Calculate'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _reset();
                      },
                      child: const Text('Reset'),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                result,
                style:
                    const TextStyle(fontSize: 24.0, color: Colors.purpleAccent),
              ),
            )
          ],
        ),
      ),
    );
  }

  _onDropDownMenuItemChanged(String? value) {
    setState(() {
      _currency = value!;
    });
  }

  _calculate() {
    double distance = double.parse(distanceController.text);
    double unitValue = double.parse(unitController.text);
    double price = double.parse(priceController.text);
    double tCost = (distance / unitValue) * price;

    setState(() {
      result =
          'Total Cost of the Trip : \n${tCost.toStringAsFixed(2)} in $_currency';
    });
  }

  _reset() {
    distanceController.text = '';
    unitController.text = '';
    priceController.text = '';

    setState(() {
      result = '';
      _currency = 'Rupees';
    });
  }
}
