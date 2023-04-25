//import ScadeExtensions
import ScadeKit

#if os(Android)
  import Android
  import AndroidContent
  import AndroidApp
  import AndroidOS
  import Foundation
  import Java
#endif

class MainPageAdapter: SCDLatticePageAdapter {

  #if os(Android)
    private var currentActivity: Activity? { Application.currentActivity }
  #endif

  #if os(Android)
    var delegate: SharedPreferences?
    var delegateEditor: AndroidContent.SharedPreferencesEditor?

  #endif

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    #if os(Android)

      //delegateEditor = getSharedPreferences("", MODE_PRIVATE)
      delegate = Application.currentActivity?.getSharedPreferences(name: "SCADE", mode: 0)
      delegateEditor = delegate?.edit()

    #endif

    print(
      "first time: retrieve from cache: \(self.retrieveStringFromCache(key: "email")) \(self.retrieveBoolFromCache(key: "isLoggedIn"))"
    )
    var currEmailText = ""
    var currNameText = ""

    self.email_tb.onTextChange.append(
      SCDWidgetsTextChangeEventHandler { ev in
        currEmailText = ev!.newValue
      })

    self.name_tb.onTextChange.append(
      SCDWidgetsTextChangeEventHandler { ev in
        currNameText = ev!.newValue
      })

    self.save_btn.onClick { _ in
      print("Email: \(currEmailText) Name: \(currNameText)")
      if currEmailText.isEmpty || currEmailText.isEmpty {
        print("Name or Email is empty")
        return
      }
      self.saveToCache(email: currEmailText, name: currNameText)

    }

    self.fetch_btn.onClick { _ in
      print(
        "retrieve from cache: \(self.retrieveStringFromCache(key: "email")) \(self.retrieveStringFromCache(key: "name"))"
      )

      self.email_fetch.text = "Email: \(self.retrieveStringFromCache(key: "email"))"
      self.name_fetch.text = "Name: \(self.retrieveStringFromCache(key: "name"))"

    }

  }

  func saveToCache(email: String, name: String) {
    #if os(iOS)
      UserDefaults.standard.set(email, forKey: "email")
      UserDefaults.standard.set(name, forKey: "name")
    #endif

    #if os(Android)
      self.putString(value: email, key: "email")
      self.putString(value: name, key: "name")
    #endif

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

    #if os(Android)
      return self.getString(key: key)
    #endif

    return ""
  }

  func retrieveBoolFromCache(key: String) -> Bool {
    #if os(iOS)
      return UserDefaults.standard.bool(forKey: key) ?? false
    #endif

    #if os(Android)
      return self.getBoolean(key: key)
    #endif
    return false
  }

  #if os(Android)
    public func putInt(value: Int32, key: String) {
      let val32: Int32 = value
      delegateEditor!.putInt(key: key, value: val32)
      delegateEditor!.commit()
    }

    public func putBoolean(value: Bool, key: String) {
      delegateEditor!.putBoolean(key: key, value: value)
      delegateEditor!.commit()
    }

    public func putString(value: String, key: String) {
      delegateEditor!.putString(key: key, value: value)
      delegateEditor!.commit()
    }

    public func putFloat(value: Float, key: String) {
      delegateEditor!.putFloat(key: key, value: value)
      delegateEditor!.commit()
    }

    public func getInt(key: String) -> Int32 {
      let intValue: Int32 = (delegate?.getInt(key: key, defValue: 0)) ?? 0
      return intValue
    }

    public func getString(key: String) -> String {
      let strValue: String = delegate?.getString(key: key, defValue: "DEFAULT_VALUE") ?? ""
      return strValue
    }

    public func getBoolean(key: String) -> Bool {
      let boolValue: Bool = delegate?.getBoolean(key: key, defValue: false) ?? false
      return boolValue
    }

    public func getFloat(key: String) -> Float {
      let floatValue: Float = delegate?.getFloat(key: key, defValue: 0.0) ?? 0.0
      return floatValue
    }

    public func containsKey(key: String) -> Bool {
      return delegate!.contains(key: key)
    }
  #endif

}
