import ScadeKit

extension MainPageAdapter {
  var label1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label1") as! SCDWidgetsLabel
  }

  var label3: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label3") as! SCDWidgetsLabel
  }

  var label4: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label4") as! SCDWidgetsLabel
  }

  var fetch_btn: SCDWidgetsButton {
    return self.page?.getWidgetByName("fetch_btn") as! SCDWidgetsButton
  }

  var save_btn: SCDWidgetsButton {
    return self.page?.getWidgetByName("save_btn") as! SCDWidgetsButton
  }

  var email_tb: SCDWidgetsTextbox {
    return self.page?.getWidgetByName("email_tb") as! SCDWidgetsTextbox
  }

  var name_tb: SCDWidgetsTextbox {
    return self.page?.getWidgetByName("name_tb") as! SCDWidgetsTextbox
  }

  var name_fetch: SCDWidgetsLabel {
    return self.page?.getWidgetByName("name_fetch") as! SCDWidgetsLabel
  }

  var email_fetch: SCDWidgetsLabel {
    return self.page?.getWidgetByName("email_fetch") as! SCDWidgetsLabel
  }
}