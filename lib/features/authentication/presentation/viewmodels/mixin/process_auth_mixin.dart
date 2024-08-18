import 'package:social_feed_task/core/constants/colors_palette.dart';
import 'package:social_feed_task/core/global_components/toast/show_toast.dart';

mixin ProcessAuthMixin{
  void isEmailPasswordGiven(String email, String password){
    if(email.isEmpty || password.isEmpty){
      ShowToast.customToast("Email and Password are required", bgColor: AppColors.red);
      return;
    }
  }

  void wrongEmailPassword(){
    ShowToast.customToast("Wrong Email or Password", bgColor: AppColors.red);
  }
}