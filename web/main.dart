// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/platform/browser.dart';
import 'package:angular2/router.dart';

import 'package:polymer/polymer.dart';

import 'package:ng2_polymer/app_component.dart';

main() async {
  await initPolymer();
  bootstrap(AppComponent, [ROUTER_PROVIDERS]);
}
