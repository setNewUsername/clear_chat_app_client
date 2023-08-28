import 'package:flutter/material.dart';
import 'views/application_view/application.dart';
import 'controllers/application_controllers/application_controller.dart';

void main() {
  runApp(Application(controller: ApplicationController()));
}
