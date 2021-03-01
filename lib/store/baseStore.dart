import 'package:mobx/mobx.dart';

part 'baseStore.g.dart';

class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {
  @observable
  int count = 0;
  @action
  void addCount() {
    this.count++;
  }
}
