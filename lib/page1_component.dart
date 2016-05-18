import 'package:angular2/core.dart';

import 'package:polymer_elements/iron_flex_layout.dart';
// import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/paper_material.dart';

class GroupUsers {
	String name;
	List<String> users;

	int get groupHeight => 64 + 5 + this.users.length * (100 + 1);

	GroupUsers(String this.name, List<String> this.users);

	// void toString() => this.name;
}

@Component(
	selector: 'page1',
	templateUrl: 'page1_component.html'
)
class Page1Component {

	int headingHeight = 50;
	int contentHeight = 100;
	List<GroupUsers> groups;


	Page1Component() {
		groups = new List<GroupUsers>();

		groups.add(new GroupUsers("Group 1", ["Tim", "Jim"]));
		groups.add(new GroupUsers("Group 2", ["Bob", "John", "Dave", "Someone with a really long name"]));
		groups.add(new GroupUsers("Group 3", ["Sally", "Jane", "Martha"]));

		print("Data items: ${groups}");
	}
}