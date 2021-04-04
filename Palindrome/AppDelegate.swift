
import UIKit
import PalindromeFeature

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow? = .init()
  
  func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    KeyboardManager.shared.enable = true
    
    let vc = PalindromeViewController(viewModel: .live)
    
    window!.rootViewController = vc
    window!.makeKeyAndVisible()
    
    return true
  }
}
