import 'game.dart' as g;
import 'package:polymer/polymer.dart';


@CustomTag('ma-player')
class MaPlayer extends PolymerElement {
  
  @published g.Player player;
  
  @observable List<g.Comodity> comodities = g.COMODITIES;  
  
  MaPlayer.created() : super.created() {
  }

  /**
  void onOpenPlace(Event e, var detail, Node sender) {
    fire("open-section", detail:{"sectionId":sectionId} );
  }
  **/
    
}