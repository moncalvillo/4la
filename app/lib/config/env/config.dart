import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigParams {
  static final String? serverUrl = dotenv.env['SERVER_URL'];
}
