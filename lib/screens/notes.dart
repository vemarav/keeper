import 'package:flutter/material.dart';
import 'package:keeper/themes/styles.dart';
import 'package:keeper/widgets/note_widget.dart';

var notes = [
  {
    "id": 1,
    "title": "Glass (2019)",
    "content": "Security guard David Dunn uses his "
        "supernatural abilities to track Kevin Wendell"
        " Crumb, a disturbed man who has twenty-four "
        "personalities."
  },
  {
    "id": 2,
    "title": "The Heiresses (2018)",
    "content": "Chela and Chiquita are both descended"
        " from wealthy families in Asunción and have "
        "been together for over 30 years. But recentl"
        "y, their financial situation has worsened an"
        "d they begin selling off their inherited pos"
        "sessions. But when their debts lead to Chiqu"
        "ita being imprisoned on fraud charges, Chela"
        " is forced to face a new reality."
  },
  {
    "id": 3,
    "title": "An Acceptable Loss (2018)",
    "content": "Former top U.S. security adviser Elizabeth "
        "\"Libby\" Lamm (Sumpter) is threatened by associat"
        "es from her dark past including Rachel Burke (Curt"
        "is), a steely, commanding politician with an unwav"
        "ering knack for achieving her goals. "
  },
  {
    "id": 1,
    "title": "Glass (2019)",
    "content": "Security guard David Dunn uses his "
        "supernatural abilities to track Kevin Wendell"
        " Crumb, a disturbed man who has twenty-four "
        "personalities."
  },
  {
    "id": 2,
    "title": "The Heiresses (2018)",
    "content": "Chela and Chiquita are both descended"
        " from wealthy families in Asunción and have "
        "been together for over 30 years. But recentl"
        "y, their financial situation has worsened an"
        "d they begin selling off their inherited pos"
        "sessions. But when their debts lead to Chiqu"
        "ita being imprisoned on fraud charges, Chela"
        " is forced to face a new reality."
  },
  {
    "id": 3,
    "title": "An Acceptable Loss (2018)",
    "content": "Former top U.S. security adviser Elizabeth "
        "\"Libby\" Lamm (Sumpter) is threatened by associat"
        "es from her dark past including Rachel Burke (Curt"
        "is), a steely, commanding politician with an unwav"
        "ering knack for achieving her goals. "
  },
  {
    "id": 1,
    "title": "Glass (2019)",
    "content": "Security guard David Dunn uses his "
        "supernatural abilities to track Kevin Wendell"
        " Crumb, a disturbed man who has twenty-four "
        "personalities."
  },
  {
    "id": 2,
    "title": "The Heiresses (2018)",
    "content": "Chela and Chiquita are both descended"
        " from wealthy families in Asunción and have "
        "been together for over 30 years. But recentl"
        "y, their financial situation has worsened an"
        "d they begin selling off their inherited pos"
        "sessions. But when their debts lead to Chiqu"
        "ita being imprisoned on fraud charges, Chela"
        " is forced to face a new reality."
  },
  {
    "id": 3,
    "title": "An Acceptable Loss (2018)",
    "content": "Former top U.S. security adviser Elizabeth "
        "\"Libby\" Lamm (Sumpter) is threatened by associat"
        "es from her dark past including Rachel Burke (Curt"
        "is), a steely, commanding politician with an unwav"
        "ering knack for achieving her goals. "
  }
];


class Notes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NotesState();

}

class NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: Styles.statusBarHeight),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: Styles.keyLineSpacing),
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: Styles.verticalSpacing),
              child: NoteWidget(note: notes[index]),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(
            Styles.keyLineSpacing
          ),
          child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Take a note...',
                style: Theme.of(context).textTheme.button
              ),
            ),
            Container(
              child: Icon(Icons.add),
            )
          ],
        ),
        ),
      ),
    );
  }
}


