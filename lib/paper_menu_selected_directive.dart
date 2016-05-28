import 'package:angular2/core.dart';
import 'package:polymer/polymer.dart';

@Directive(selector: 'paper-menu[selected]')
class PaperMenuSelectedDirective {
  @Output() EventEmitter selectedChange = new EventEmitter();

  @HostListener('iron-select', const ['\$event'])
  void onChange(e) {
//    var eDart = convertToDart(e).currentTarget.selected;
//    print("PaperMenuSelectDirective onChange: $eDart");
    selectedChange.add(convertToDart(e).currentTarget.selected);
  }
}
