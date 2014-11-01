import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('ma-link')
class MaLink extends PolymerElement {
  
  @published String label;
  @published String icon;  
  @published String sectionId;

  MaLink.created() : super.created() {
  }
  
  void onOpenPlace(Event e, var detail, Node sender) {
    fire("open-section", detail:{"sectionId":sectionId} );
  }
    
}