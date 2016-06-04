import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'dart:html';

import 'package:logging/logging.dart' show Logger;

import 'user.dart';
import 'edit_form.dart';

import 'package:polymer_elements/paper_dialog.dart';
import 'package:polymer_elements/paper_button.dart';

@Component(
  selector: 'edit-dialog',
  templateUrl: 'edit_dialog.html',
  directives: const [EditForm]
)
class EditDialog implements OnInit, OnActivate, OnDeactivate, OnReuse, CanDeactivate, CanReuse {

  Logger _logger = new Logger('EditDialog');

  @Input()
  User user;

  // used to create a unique id for the dialog element
  int dialogId;

  @Output() final EventEmitter<User> updated = new EventEmitter<User>();

  @ViewChild('editForm') EditForm editForm;

  EditDialog() {
    dialogId = this.hashCode;
  }

  void ngOnInit() {
    _logger.finest("Initializing $dialogId...");
  }

  void edit() {
    PaperDialog dialog = querySelector("#edit-dialog-$dialogId");
    _logger.fine("editing $user - ${this.hashCode}");
    editForm.user = user;
    dialog.open();

    // doesn't seem to work
    editForm.setFocus();
  }

  void onUpdated(e) {
    _logger.fine("Edit dialog updated: $e");
    updated.emit(e);

    PaperDialog dialog = querySelector("#edit-dialog-$dialogId");
    dialog.close();
  }

  dynamic routerOnActivate(ComponentInstruction next, ComponentInstruction prev) {
    _logger.fine("Page1 routerOnActivate - prev: ${prev.routeName}, next: ${next.routeName}");
    return true;
  }

  dynamic routerOnDeactivate(ComponentInstruction next, ComponentInstruction prev) {
    _logger.fine("Page1 routerOnDeactivate - prev: ${prev.routeName}, next: ${next.routeName}");
    return true;
  }

  dynamic routerOnReuse(ComponentInstruction next, ComponentInstruction prev) {
    _logger.fine("Page1 routerOnReuse - prev: ${prev.routeName}, next: ${next.routeName}");
    return true;
  }

  dynamic routerCanReuse(ComponentInstruction next, ComponentInstruction prev) {
    _logger.fine("Page1 routerCanReuse - prev: ${prev.routeName}, next: ${next.routeName}");
    return true;
  }

  dynamic routerCanDeactivate(ComponentInstruction next, ComponentInstruction prev) {
    _logger.fine("Page1 routerCanDeactivate - prev: ${prev.routeName}, next: ${next.routeName}");
    return true;
  }
}
