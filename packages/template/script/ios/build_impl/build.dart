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

import 'dart:io';

import 'package:args/args.dart';

const String releaseBuildType = 'release';

String flavor = 'dev';
String buildType;

/// Script for build application.
/// Need parameter: build type -release or -qa.
/// See also usage.
///
/// Exit codes:
/// 0 - success
/// 1 - error
void main(List<String> arguments) {
  exitCode = 0;
  final parser = ArgParser();

  final args = parser.parse(arguments).arguments;
  if (args.length != 1) {
    exitCode = 1;
    throw Exception('You should pass build type.');
  } else {
    buildType = args[0];

    build();
  }
}

Future<void> build() async {
  resolveFlavor();
  await buildIpa();
}

void resolveFlavor() {
  if (buildType == releaseBuildType) {
    flavor = 'prod';
  }
}

Future<void> buildIpa() async {
  // ignore: avoid_print
  print('Build type $buildType');

  final result = await Process.run('flutter', [
    'build',
    'ios',
    '-t',
    'lib/main-$buildType.dart',
    '--flavor',
    flavor,
    '--no-codesign',
    '--release'
  ]);
  stdout.write(result.stdout);
  stderr.write(result.stderr);
}
