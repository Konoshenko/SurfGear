// Copyright (c) 2019-present,  SurfStudio LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter_template/ui/screen/splash_screen/di/splash_screen_component.dart';
import 'package:flutter_template/ui/screen/splash_screen/splash_wm.dart';
import 'package:injector/injector.dart';
import 'package:surf_mwwm/surf_mwwm.dart';

/// Splash screen
class SplashScreen extends MwwmWidget<SplashScreenComponent> {
  SplashScreen({
    Key key,
    WidgetModelBuilder widgetModelBuilder = createSplashScreenWidgetModel,
  }) : super(
          key: key,
          dependenciesBuilder: (context) => SplashScreenComponent(context),
          widgetStateBuilder: () => _SplashScreenState(),
          widgetModelBuilder: widgetModelBuilder,
        );
}

class _SplashScreenState extends WidgetState<SplashScreenWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Injector.of<SplashScreenComponent>(context).component.scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(
              Icons.error_outline,
              size: 150,
              color: Colors.indigo,
            ),
            Text(
              'Add Logo Here', //todo change logo
              style: TextStyle(
                fontSize: 30,
                color: Colors.indigo,
              ),
            )
          ],
        ),
      ),
    );
  }
}
