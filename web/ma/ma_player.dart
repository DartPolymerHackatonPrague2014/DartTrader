import 'game.dart';
import 'package:polymer/polymer.dart';


@CustomTag('ma-player')
class MaPlayer extends PolymerElement {
  
  @published Player player;
  
  MaPlayer.created() : super.created() {
  }

  /**
  void onOpenPlace(Event e, var detail, Node sender) {
    fire("open-section", detail:{"sectionId":sectionId} );
  }
  **/
    
}