import 'package:flutter/material.dart';
import 'package:pidge_on/src/notas/note_list.dart';
import 'package:wakelock/wakelock.dart';

void main() => runApp(NotasPage());

class NotasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    Wakelock.disable();
    return Scaffold(body: NoteList()
        
    );
  }
}
