import 'package:flutter/material.dart';

import 'page_two.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() {
    debugPrint('1. Page1 - CreateState Invoked');
    return _PageOneState();
  }
}

class _PageOneState extends State<PageOne> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('2. Page 1 - InitState Invoked');
    setState(() {
      _counter = 0;
      debugPrint('3. Page 1 - SetState Within the InitState Invoked');
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('4. Page 1 - didChangeDependencies Invoked');
  }

  @override
  void didUpdateWidget(PageOne oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('5. Page 1 - DidUpdateWidget Invoked');
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint('6. Page 1 - DeActivate Invoked');
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint('7. Page 1 - Dispose Invoked');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('8: Page 1 - Build Invoked');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lifecycle Activity Demo - Page1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have cliked'),
            Text(_counter.toString(), style: const TextStyle(fontSize: 30)),
            const Text('Times'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const PageTwo())));
              }),
              child: const Text('Go To Next Page'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (() {
        setState(() {
          debugPrint('9. Page 1 - setState within the Build Method Invoked');
          _counter++;
        });
      })),
    );
  }
}
