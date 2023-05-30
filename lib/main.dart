import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<int> diagnosesList = [1, 2, 3, 4, 5]; // Replace with your actual list of values
  String dxDisplay = 'Some Display Text';
  int maxLines = 2;
  String associatedHint = "associate";
  FocusNode _textFieldFocusNode = FocusNode();

  TextInputType keyboardType = TextInputType.text;
  String noteEntry = "noteEntry";
  String ANID = "1"; // Update initial value to match one of the values in diagnosesList

  TextEditingController _textEntryController = TextEditingController();

  void _incrementCounter(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert Dialog'),
          content: Container(
            width: 600,
            height: 200,
            child: Column(
              children: [
                DropdownButton<String>(
                  isExpanded: true,
                  onTap: (){
                    FocusScope.of(context).requestFocus(_textFieldFocusNode);
                  },
                  hint: Text(associatedHint),
                  disabledHint: Text(associatedHint),
                  items: diagnosesList.map((int value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(dxDisplay),
                    );
                  }).toList(),
                  value: ANID,
                  onChanged: (newANID) {
                    setState(() {
                      ANID = newANID.toString();
                    });
                    FocusScope.of(context).requestFocus(_textFieldFocusNode);
                  },

                ),
                Focus(
                  onFocusChange: (focused) {
                    setState(() {
                      FocusScope.of(context).requestFocus(_textFieldFocusNode);
                    });
                  },

                  child: TextField(
                    focusNode: _textFieldFocusNode,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    maxLines: maxLines,
                    textCapitalization: TextCapitalization.sentences,
                    controller: _textEntryController,
                    decoration: InputDecoration(hintText: "Entry"),
                    onChanged: (value) {
                      noteEntry = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hi! this is dummy project',
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
