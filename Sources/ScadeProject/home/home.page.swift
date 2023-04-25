import ScadeKit
  
class HomePageAdapter: SCDLatticePageAdapter {
  
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    
    self.email_label.text = "Email: \(self.retrieveStringFromCache(key: "email"))"
    self.loggedin_label.text = "isLoggedIn: \(self.retrieveBoolFromCache(key: "isLoggedIn"))"
    
  }
  
  
  func retrieveIntegerFromCache(key: String) -> Int {
  #if os(iOS)
  	return UserDefaults.standard.integer(forKey: key) ?? 0
  	#endif
  	
  	return 0
  }
  
  func retrieveStringFromCache(key: String) -> String {
  	#if os(iOS)
  	return UserDefaults.standard.string(forKey: key) ?? ""
  	#endif
  	return ""
  }
  
  func retrieveBoolFromCache(key: String) -> Bool {
  #if os(iOS)
  	return UserDefaults.standard.bool(forKey: key) ?? false
  	#endif
  	return false
  	
  }



}
