import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{
@override
Map<String ,Map<String ,String>>get keys=>{
  'en_Us':{
    'email_hint':'Email',
    'password_hint':'Password',
    'login':'Login',

    'internet_exception':"we're unable to show results.\n Please Check Internet Connectivity",
    'general_exception':"we're unbale to proceed your request.\n Please try agian!"

  },
  'ur_PK':{
    'email_hint':'ای میل درج کریں',
    'internet_exception':"ہم نتائج دکھانے سے قاصر ہیں۔\n براہ کرم انٹرنیٹ کنیکٹیویٹی چیک کریں۔"
  },
};
}