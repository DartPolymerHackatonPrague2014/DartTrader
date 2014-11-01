import 'game.dart' as g;
import 'package:polymer/polymer.dart';
import 'package:paper_elements/paper_dialog.dart';
import 'package:paper_elements/paper_slider.dart';

import 'dart:html';
import 'dart:math';


@CustomTag('ma-planet-detail')
class MaPlanetDetail extends PolymerElement {
  
  @published g.Planet planet;
  @published g.Player player;
  
  @observable g.Comodity tradingComodity;
  
  @observable int maxSell = 0;
  @observable int maxBuy = 0;
  
  @observable int buyEstimate = 0;
  @observable int sellEstimate = 0;  
  
  List<g.Comodity> comodities = g.COMODITIES;
  
  MaPlanetDetail.created() : super.created() {
  }

  void onClickWarp(Event e, var detail, Node sender) {
    fire("warp", detail:{"planet":planet} );
  }

  void openDialog(Event e, var detail, Node sender) {
    tradingComodity = comodities[int.parse(sender.dataset["comodity"])];
    
    maxBuy = min((player.money / planet.comodities[tradingComodity].priceSell).floor(), planet.comodities[tradingComodity].amount);
    maxSell = 0;
    
    PaperDialog dialog = $['buySell'];
    ($['buy-slider'] as PaperSlider).value = 0;
    ($['sell-slider'] as PaperSlider).value = 0;
    dialog.toggle();
  }
  
  void estimateBuy(Event e, var detail, Node sender) {
    PaperSlider ps = sender as PaperSlider;
    buyEstimate = -ps.value * planet.comodities[tradingComodity].priceSell;
    ($['sell-slider'] as PaperSlider).value = 0;    
  }
  
  void estimateSell(Event e, var detail, Node sender) {
    PaperSlider ps = sender as PaperSlider;
    sellEstimate = ps.value * planet.comodities[tradingComodity].priceBuy;
    ($['buy-slider'] as PaperSlider).value = 0;    
  }
  
  
}