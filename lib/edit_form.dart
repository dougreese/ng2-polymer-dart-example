import 'package:angular2/core.dart';
import 'package:angular2/angular2.dart';

import 'dart:html' as dom;
import 'dart:async';

import 'user.dart';
import 'paper_menu_selected_directive.dart';

import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_dialog.dart';
import 'package:polymer_elements/paper_dropdown_menu.dart';
import 'package:polymer_elements/paper_menu.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_input.dart';
import 'package:polymer_elements/paper_button.dart';

@Component(
  selector: 'edit-form',
  templateUrl: 'edit_form.html',
  directives: const [PaperMenuSelectedDirective],
  encapsulation: ViewEncapsulation.Native
)
class EditForm {

  @Input()
  User user;

  String get username => user == null ? '' : user.name;

  String newName;
  int selected;

  List<String> options = ['one', 'two', 'three', 'four', 'five'];

  @Output() final EventEmitter<User> updated = new EventEmitter<User>();

  @ViewChild('editForm') NgForm editForm;
  @ViewChild('newUserName') ElementRef newNameInput;
  @ViewChild('otherValue') ElementRef valueDropdown;

  String get selectedValue => selected == null ? '' : options[selected];

  EditForm () {}

  void submit([bool enter = false]) {
    if (editForm.form.valid) {
      print("Name change from ${user.name} to $newName ($selectedValue)");
      user.name = newName;
      user.moreInfo = selectedValue;

      // send update event
      updated.emit(user);
    } else {
      print("form is not valid");
    }
  }

  void setFocus() {
    // allow bindings to propagate before setting focus
    Timer.run(() => newNameInput.nativeElement.focus());
  }
}
