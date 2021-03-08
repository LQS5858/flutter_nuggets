// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baseStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseStore on _BaseStore, Store {
  final _$countAtom = Atom(name: '_BaseStore.count');

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  final _$netStatusAtom = Atom(name: '_BaseStore.netStatus');

  @override
  String get netStatus {
    _$netStatusAtom.reportRead();
    return super.netStatus;
  }

  @override
  set netStatus(String value) {
    _$netStatusAtom.reportWrite(value, super.netStatus, () {
      super.netStatus = value;
    });
  }

  final _$_BaseStoreActionController = ActionController(name: '_BaseStore');

  @override
  void addCount() {
    final _$actionInfo =
        _$_BaseStoreActionController.startAction(name: '_BaseStore.addCount');
    try {
      return super.addCount();
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count},
netStatus: ${netStatus}
    ''';
  }
}
