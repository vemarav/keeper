import 'dart:async';
import 'package:keeper/models/note.dart';
import 'package:keeper/providers/note_provider.dart';

abstract class IObservable {
  void notify() {}
}

abstract class NoteView extends IObservable {
  void onLoadComplete(List<Note> notes);
  void onLoadError(var error);
}

class NotePresenter {
  NoteView _view;
  NoteProvider _noteProvider;

  NotePresenter(this._view, this._noteProvider);

  Future fetch(limit) async {
    assert(_view != null);
    _noteProvider
        .fetchAll(50)
        .then(this.onSuccess)
        .catchError(this.onFailure);
  }

  void onSuccess(notes) {
    _view.onLoadComplete(notes);
  }

  void onFailure(error) {
    _view.onLoadError(error);
  }
}
