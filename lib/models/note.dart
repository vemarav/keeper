class Note {
  int id;
  String title;
  String content;
  DateTime createdAt;
  DateTime updatedAt;

  Note({this.id, this.title, this.content});

  static String tableName = 'notes';
  static final columns = [
    'id', 'title', 'content', 'created_at', 'updated_at'
  ];
  static final columnId = columns[0];
  static final columnTitle = columns[1];
  static final columnContent = columns[2];
  static final columnCreatedAt = columns[3];
  static final columnUpdatedAt = columns[4];


  static String get createTable => """CREATE TABLE $tableName (
           $columnId INTEGER PRIMARY KEY, 
           $columnTitle TEXT NOT NULL,
           $columnContent TEXT NOT NULL,
           $columnCreatedAt DATETIME,
           $columnUpdatedAt DATETIME
         )""";

  Map<String, dynamic> toMap() {
    Map map = <String, dynamic>{
      columnTitle: title,
      columnContent: content,
      columnCreatedAt: createdAt.toString(),
      columnUpdatedAt: updatedAt.toString()
    };

    if (id != null) {
      map[columnId] = id;
    }

    return map;
  }

  Map<String, dynamic> toUpdateMap() {
    Map map = <String, dynamic>{
      columnTitle: title,
      columnContent: content,
      columnUpdatedAt: updatedAt.toString()
    };

    return map;
  }

  static fromMap(Map map) {
    Note note = new Note();

    note.id = map[columnId];
    note.title = map[columnTitle];
    note.content = map[columnContent];
    note.createdAt = DateTime.parse(map[columnCreatedAt]);
    note.updatedAt = DateTime.parse(map[columnUpdatedAt]);

    return note;
  }

  String toString() {
    return toMap().toString();
  }
}
