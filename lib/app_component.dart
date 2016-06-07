// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:logging/logging.dart';

import 'home_component.dart';
import 'page1_component.dart';
import 'page2_component.dart';
import 'page3_component.dart';
import 'help_component.dart';
import 'about_component.dart';
import 'side_nav.dart';

import 'package:polymer_elements/paper_drawer_panel.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_icon_button.dart';

@Component(
	selector: 'my-app',
	templateUrl: 'app_component.html',
  directives: const [ROUTER_DIRECTIVES, SideNavComponent]
)
@RouteConfig(const [
  const Route(path: '/', name: 'Home', component: Page1Component),
  const Route(path: '/page1', name: 'Page1', component: HomeComponent),
  const Route(path: '/page2', name: 'Page2', component: Page2Component),
  const Route(path: '/page3', name: 'Page3', component: Page3Component),
  const Route(path: '/help', name: 'Help', component: HelpComponent),
  const Route(path: '/about', name: 'About', component: AboutComponent),
])
class AppComponent {
  AppComponent() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      print('${rec.time} ${rec.loggerName}: ${rec.message} (${rec.level.name})');
    });

    final Logger log = new Logger("AppComponent");
    log.finest("Loading ng2-polymer app");
  }
}
