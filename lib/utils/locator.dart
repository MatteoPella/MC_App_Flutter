
import 'package:get_it/get_it.dart';

import '../View_Model/home_view_model.dart';
import '../View_Model/sign_in_view_model.dart';


GetIt locator = GetIt.instance;

void setLocator(){

  locator.registerLazySingleton(() => SignInViewModel());
  locator.registerLazySingleton(() => HomeViewModel());










}