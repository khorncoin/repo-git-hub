import '../views/screens/auth/forgot_password/create_new_password_screen.dart';
import '../views/screens/auth/forgot_password/input_phone_forgot_password_screen.dart';
import '../views/screens/auth/login_screen/login_screen.dart';
import '../views/screens/auth/register_screen/input_phone_register_screen.dart';
import '../views/screens/auth/register_screen/register_screen.dart';
import '../views/screens/main_screen/main_screen.dart';
import '../views/screens/notification/notification_screen/notification_screen.dart';
import '../views/screens/splash_screen/splash_screen.dart';

final routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  InputPhoneRegisterScreen.routeName: (context) => const InputPhoneRegisterScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  InputPhoneForgotPasswordScreen.routeName: (context) => const InputPhoneForgotPasswordScreen(),
  CreateNewPasswordScreen.routeName: (context) => const CreateNewPasswordScreen(),
  NotificationScreen.routeName: (context) => const NotificationScreen(),
};
