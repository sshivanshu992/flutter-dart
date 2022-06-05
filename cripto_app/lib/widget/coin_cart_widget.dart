import 'package:flutter/material.dart';

class CoinCard extends StatefulWidget {
  String name;
  String symbol;
  String imageUrl;
  num price;
  num change;
  num changePercentage;

  CoinCard({
    Key? key,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
  }) : super(key: key);

  @override
  State<CoinCard> createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Colors.pinkAccent.shade400,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.shade200,
                offset: const Offset(4, 4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
              const BoxShadow(
                color: Colors.black54,
                offset: Offset(-4, -4),
              ),
            ]),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.network(widget.imageUrl),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.symbol,
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.price.toDouble().toString(),
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.change.toDouble() < 0
                      ? widget.change.toDouble().toString()
                      : '+ ${widget.change.toDouble().toString()}',
                  style: TextStyle(
                    color: widget.change.toDouble() < 0
                        ? Colors.red
                        : Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.changePercentage.toDouble() < 0
                      ? widget.changePercentage.toDouble().toString() + '%'
                      : '+ ${widget.changePercentage.toDouble().toString()} %',
                  style: TextStyle(
                      color: widget.changePercentage.toDouble() < 0
                          ? Colors.red
                          : Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
