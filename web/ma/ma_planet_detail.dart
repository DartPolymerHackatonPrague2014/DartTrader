import 'game.dart';
import 'package:polymer/polymer.dart';


@CustomTag('ma-planet-detail')
class MaPlanetDetail extends PolymerElement {
  
  @published Planet planet;
  
  MaPlanetDetail.created() : super.created() {
  }

  /**
  void onOpenPlace(Event e, var detail, Node sender) {
    fire("open-section", detail:{"sectionId":sectionId} );
  }
  **/
    
}