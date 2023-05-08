import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/pages/widgets/modal.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  int currentIndex = 2;

  @observable
  BuildContext? buildContext;

  @action
  void onItemTapped(int index) {
    currentIndex = index;
    switch (currentIndex) {
      case 0:
        print("navegar para tela 1");
        break;
      case 1:
        Modular.to.pushNamed(
          '/course/courses',
        );
        break;
      case 2:
        print("navegar para tela 3");
        showBottomSheetModal(buildContext!);
        break;
      case 3:
        print("navegar para tela 4");
        break;
      case 4:
        print("navegar para tela 5");
        break;
    }
  }
}
