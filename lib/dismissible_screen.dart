import 'package:flutter/material.dart';

class DismissibleScreen extends StatefulWidget {
  const DismissibleScreen({Key? key}) : super(key: key);

  @override
  State<DismissibleScreen> createState() => _DismissibleScreenState();
}

class _DismissibleScreenState extends State<DismissibleScreen> {
  final li = List<String>.generate(20, (index) => 'item num ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dismissible Screen'),
      ),
      body: ListView.builder(
        itemCount: li.length,
        itemBuilder: (ctx, inx) {
          final item = li[inx];
          return Dismissible(
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.delete),
            ),
            secondaryBackground: Container(
              color: Colors.green,
              alignment: Alignment.centerRight,
              child: const Icon(Icons.thumb_up),
            ),
            key: Key(item),
            onDismissed: (DismissDirection dir) {
              setState(() {
                li.removeAt(inx);
              });
              ScaffoldMessenger.of(ctx).showSnackBar(
                SnackBar(
                  content: Text(dir == DismissDirection.startToEnd
                      ? '$item deleted'
                      : '$item liked'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      setState(() {
                        li.insert(inx, item);
                      });
                    },
                  ),
                ),
              );
            },
            confirmDismiss: (DismissDirection dir) async {
              if (dir == DismissDirection.startToEnd) {
                final bool res = await showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return AlertDialog(
                      content: Text('Are you sure you want to delete $item ?'),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.black),
                            )),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              li.removeAt(inx);
                            });
                            Navigator.of(ctx).pop();
                          },
                          child: const Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
                return res;
              } else {
                return true;
              }
            },
            child: ListTile(
                title: Center(
              child: Text(item),
            )),
          );
        },
      ),
    );
  }
}
