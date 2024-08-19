import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_feed_task/core/global_components/bottom_navigation_bar/bottom_navigation_bar_generic/K_bottom_navigation_bar_generic.dart';


final kBottomNavigationBarControllerProvider = StateNotifierProvider<KBottomNavigationBarController, KBottomNavigationBarGeneric>((ref) {
  return KBottomNavigationBarController(ref: ref);
});

class KBottomNavigationBarController extends StateNotifier<KBottomNavigationBarGeneric> {
  final Ref? ref;
  KBottomNavigationBarController({this.ref}) : super(KBottomNavigationBarGeneric());

  void setIndex(int index) {
    state = state.update(currentIndex: index);
  }
}