import 'package:get_it/get_it.dart';
import 'call_and_messages_service_.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}
