enum KBottomNavigationBarType {
  feed,
  myCommunity,
  explore,
  notification,
  settings
}

class KBottomNavigationBarGeneric {
  final int currentIndex;
  final KBottomNavigationBarType type;

  KBottomNavigationBarGeneric({
    this.currentIndex=0,
    this.type = KBottomNavigationBarType.feed,
  });

  KBottomNavigationBarGeneric update({int? currentIndex, KBottomNavigationBarType? type}){
    return KBottomNavigationBarGeneric(
      currentIndex: currentIndex ?? this.currentIndex,
      type: type ?? this.type,
    );
  } 
}