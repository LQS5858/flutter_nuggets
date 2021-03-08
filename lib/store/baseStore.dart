import 'package:mobx/mobx.dart';

part 'baseStore.g.dart';

class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {
  @observable
  int count = 0;
  @observable
  String netStatus = 'network';
  @action
  void addCount() {
    count++;
  }
}
