import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:keeper/models/note.dart';
import 'package:keeper/config/database.dart';
import 'package:keeper/presenters/note_presenter.dart';

class NoteProvider {
  Database _db;

  static final List<IObservable> observers = [];

  void addObserver(IObservable observer) {
    observers.add(observer);
  }

  void notifyObservers() {
    observers.forEach((observer) => observer.notifyDataSetChanged());
  }

  Future openConnection() async {
    if (_db == null) {
      Directory path = await getApplicationDocumentsDirectory();
      String dbPath = join(path.path, dataBaseName);

      _db = await openDatabase(dbPath, version: 1, onCreate: this._create);
    }
  }

  Future _create(Database db, int version) async {
    print(Note.createTable);
    db.execute(Note.createTable);
  }

  Future create() async {
    Directory path = await getApplicationDocumentsDirectory();
    String dbPath = join(path.path, dataBaseName);

    _db = await openDatabase(dbPath, version: 1, onCreate: this._create);
  }

  Future<Note> insert(Note note) async {
    await openConnection();
    note.createdAt = DateTime.now();
    note.updatedAt = DateTime.now();
    note.id = await _db.insert(Note.tableName, note.toMap());
    notifyObservers();
    return note;
  }

  Future<Note> update(Note note) async {
    await openConnection();
    note.updatedAt = DateTime.now();
    await _db.update(Note.tableName, note.toUpdateMap(),
        where: "id = ?", whereArgs: [note.id]);
    notifyObservers();
    return note;
  }

  Future<Note> destroy(Note note) async {
    await openConnection();
    _db.delete(Note.tableName, where: "id = ?", whereArgs: [note.id]);
    notifyObservers();
    return note;
  }

  Future<List> fetchAll(int limit) async {
    if (_db == null) {
      Directory path = await getApplicationDocumentsDirectory();
      String dbPath = join(path.path, dataBaseName);

      _db = await openDatabase(dbPath, version: 1, onCreate: this._create);
    }

    List results = await _db.query(Note.tableName,
        columns: Note.columns,
        limit: limit,
        offset: limit - 50,
        orderBy: "id DESC");

    List<Note> _notes = <Note>[];

    results.forEach((result) {
      Note todo = Note.fromMap(result);
      _notes.add(todo);
    });

    return _notes;
  }

  Future<Note> find(int id) async {
    if (_db == null) {
      Directory path = await getApplicationDocumentsDirectory();
      String dbPath = join(path.path, dataBaseName);

      _db = await openDatabase(dbPath, version: 1, onCreate: this._create);
    }

    List results = await _db.query(Note.tableName,
        columns: Note.columns, where: "title = ?", whereArgs: [id], limit: 1);

    Note note = Note.fromMap(results[0]);

    return note;
  }

  Future<Note> findBy({int id, String title, String content}) async {
    if (_db == null) {
      Directory path = await getApplicationDocumentsDirectory();
      String dbPath = join(path.path, dataBaseName);

      _db = await openDatabase(dbPath, version: 1, onCreate: this._create);
    }

    var _whereArgs = [];
    String _whereString = '';

    if (id != null) {
      _whereArgs.add(id);
      _whereString = 'id = ?';
    }

    if (title != null) {
      _whereArgs.add(title);
      _whereString = 'title = ?';
    }

    if (content != null) {
      _whereArgs.add(content);
      _whereString = 'content = ?';
    }

    List results = await _db.query(Note.tableName,
        columns: Note.columns,
        where: _whereString,
        whereArgs: _whereArgs,
        limit: 1);

    Note note = Note.fromMap(results[0]);

    return note;
  }

  Future close() async {
    _db.close();
  }
}
