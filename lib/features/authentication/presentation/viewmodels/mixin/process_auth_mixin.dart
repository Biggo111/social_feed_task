mixin ProcessAuthMixin{
  bool isEmailPasswordGiven(String email, String password){
    if(email.isEmpty || password.isEmpty){
      return false;
    }
    return true;
  }
}