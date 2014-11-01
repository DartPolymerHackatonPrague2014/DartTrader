import 'package:polymer/polymer.dart';
import 'package:core_elements/core_animated_pages.dart';
import 'dart:html';

/**
 * A Polymer click counter element.
 */
@CustomTag('ma-application')
class MaApplication extends PolymerElement {
  
  @observable bool searchVisible = false;
  @published String name = "Super app!";
  @observable String placeToShow;
    
  MaApplication.created() : super.created() {
    showSearch();
  }
  
  togglePanel() {
    this.$["drawerPanel"].togglePanel();
  }
  
  toggleSearch() {
    searchVisible = !searchVisible;
    showSearch();
  }
  
  showSearch() {
    this.$["searchBox"].hidden = !searchVisible;
    if (searchVisible) {
      this.$["searchBox"].focus();
    }    
  }
  
  void openSection(Event e, var detail, Node sender) {
    CoreAnimatedPages container = (this.$["mainContent"] as CoreAnimatedPages);
    container.selected = detail["sectionId"];
    //container.
  }
    
}

