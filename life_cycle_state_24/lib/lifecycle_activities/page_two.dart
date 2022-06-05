import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() {
    debugPrint('1. Page 2 - CreateState Invoked');
    return _PageTwoState();
  }
}

class _PageTwoState extends State<PageTwo> {
  @override
  void initState() {
    super.initState();
    debugPrint('1. Page 2 - CreateState Invoked');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('3. Page 2 - didChangeDependencies Invoked');
  }

  @override
  void didUpdateWidget(PageTwo oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('4. Page 2 - DidUpdateWidget Invoked');
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint('5. Page 2 - DeActivate Invoked');
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint('6. Page 2 - Dispose Invoked');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('7: Page 2 Build Method Invoked');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Life Cycle Activities Demo - Page2'),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: const Center(child: Text('Welcome to Page2')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Back'),
      ),
    );
  }
}
