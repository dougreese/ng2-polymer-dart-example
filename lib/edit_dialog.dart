import 'package:angular2/core.dart';
import 'dart:html';

import 'user.dart';
import 'edit_form.dart';

import 'package:polymer_elements/paper_dialog.dart';
import 'package:polymer_elements/paper_button.dart';

@Component(
  selector: 'edit-dialog',
  templateUrl: 'edit_dialog.html',
  directives: const [EditForm]
)
class EditDialog {

  @Input()
  User user;

  // used to create a unique id for the dialog element
  int dialogId;

  @Output() final EventEmitter<User> updated = new EventEmitter<User>();

  @ViewChild('editForm') EditForm editForm;

  EditDialog() {
    dialogId = this.hashCode;
  }

  void edit() {
    PaperDialog dialog = querySelector("#edit-dialog-$dialogId");
    print("editing $user - ${this.hashCode}");
    editForm.user = user;
    dialog.open();

    // doesn't seem to work
    editForm.setFocus();
  }

  void onUpdated(e) {
    print("Edit dialog updated: $e");
    updated.emit(e);

    PaperDialog dialog = querySelector("#edit-dialog-$dialogId");
    dialog.close();
  }
}
