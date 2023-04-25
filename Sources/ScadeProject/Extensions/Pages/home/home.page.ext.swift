import ScadeKit

extension HomePageAdapter {
  var loggedin_label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("loggedin_label") as! SCDWidgetsLabel
  }

  var email_label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("email_label") as! SCDWidgetsLabel
  }

  var label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label") as! SCDWidgetsLabel
  }
}