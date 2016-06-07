import 'package:angular2/core.dart';
import 'package:angular2/angular2.dart';

import 'dart:html' as dom;

import 'package:logging/logging.dart' show Logger;

import 'paper_menu_selected_directive.dart';

import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_dropdown_menu.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_menu.dart';
import 'package:polymer_elements/iron_icons.dart';


@Component(
  selector: 'select-in-place',
  templateUrl: 'select_in_place.html',
  directives: const [PaperMenuSelectedDirective],
  encapsulation: ViewEncapsulation.Native
)
class SelectInPlace implements OnInit, AfterViewInit {

  Logger _logger = new Logger('SelectInPlace');

  @Input()
  String selectValInit;

  int initialSelectionIndex() {
    for (int i = 0; i < options.length; i++) {
      if (options[i] == selectValInit) {
        _logger.finer("initial selection: ($i) ${options[i]}");
        return i;
      }
    }

    _logger.finer("no initial selection");
    return -1;
  }

	@Output() final EventEmitter<String> updated = new EventEmitter<String>();

  List<String> options = ['one', 'two', 'three', 'four', 'five'];
  var selected;
//  String get selectedValue => selected == null ? '' : options[int.parse(selected.toString())];
  String get selectedValue {
    if (selected == null) {
      return '';
    }

    if (selected is int) {
      return selected == null ? '' : options[selected];
    }

    int index = int.parse(selected, onError: (source) => -1);
    if (index >= -1) {
      return options[index];
    }

    return '';
  }

  @ViewChild('selectForm') NgForm selectForm;
  @ViewChild('selectValueX') ElementRef valueDropdown;
  @ViewChild('itemMenu') ElementRef itemMenu;

  void ngOnInit() {
  	_logger.fine("$selectValInit: $options");

  }

  void ngAfterViewInit() {
    // set initial selection -- must be string value of the index
    int init = initialSelectionIndex();
    if (init >= 0) {
      PaperMenu menu = itemMenu.nativeElement;
      menu.select(init.toString());
    }
  }

  void save() {
    if (selectForm.valid) {
      _logger.fine("save: $selectedValue ($selected)");
      updated.emit(selectedValue);
    }
  }

  // void ngOnChanges(Map<String, SimpleChange> changes) {
  // 	_logger.fine("ngOnChanges: $changes");
  // }

}