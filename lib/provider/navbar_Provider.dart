import "package:flutter_riverpod/flutter_riverpod.dart";


class NavBarNotifier extends StateNotifier<int>{
  NavBarNotifier(): super(0);

  void selectPage(int index){
    state = index;
  }

}

final navbarProvider = StateNotifierProvider<NavBarNotifier,int>((_){
  return NavBarNotifier();
});