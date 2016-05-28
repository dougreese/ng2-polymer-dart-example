import 'dart:html';
import 'dart:async';

import 'package:angular2/core.dart';

import 'edit_dialog.dart';
import 'user.dart';

import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/paper_material.dart';

class GroupUsers {
	String name;
  Map<String, User> userMap;

  // header + shadow + (num items * (height of one item + border))
  // hard coded values for demo purposes
  int get groupHeight => 64 + 5 + this.userMap.length * (100 + 1);

  List<User> get users => userMap.values;

	GroupUsers(String this.name, List<User> users) {
    // store by user ID for faster lookup
    userMap = new Map<String, User>();
    for (User u in users) {
      userMap[u.id] = u;
    }
  }

  bool hasUser(String id) {
    return userMap.containsKey(id);
  }

  bool updateUser(User u) {
    if (!userMap.containsKey(u.id)) {
      return false;
    }

    userMap[u.id] = u;
    return true;
  }

  String toString() => "$name: ${users}";
}

@Component(
	selector: 'page1',
	templateUrl: 'page1_component.html',
  directives: const [EditDialog]
)
class Page1Component {

	List<GroupUsers> groups;
  int contentHeight = 100;
  Element mainTable;
  int mainWidth = 0;
  NgZone _zone;

  @ViewChild('userId') ElementRef userIdDisplay;

	Page1Component(this._zone) {
		groups = new List<GroupUsers>();

    // simple demo data
		groups.add(new GroupUsers("Group 1", [
      new User("Tim"),
      new User("Jim")
    ]));
		groups.add(new GroupUsers("Group 2", [
      new User("Bob"),
      new User("John"),
      new User("Dave"),
      new User("Someone with a really long name")
    ]));
		groups.add(new GroupUsers("Group 3", [
      new User("Sally"),
      new User("Jane"),
      new User("Martha")
    ]));

		print("Data items: ${groups}");
    initResizeListener();
	}

  void onResize(e) {
    // set the main width and update view
    mainWidth = mainTable.clientWidth;
//    print("mainWidth is now $mainWidth");
    _zone.run(() {
//      print("refreshing");
    });
  }

  void onUpdated(User u) {
    print("User updated: $u");
    updateUser(u);
  }

  void updateUser(User u) {
    for (GroupUsers g in groups) {
      if (g.hasUser(u.id)) {
        g.updateUser(u);
      }
    }
  }

  void initResizeListener() {
    // grab resize events from main window
    Timer.run(() {
      mainTable = querySelector("#maintable");
      mainWidth = mainTable.clientWidth;
      window.addEventListener('resize', onResize);
    });
  }
}