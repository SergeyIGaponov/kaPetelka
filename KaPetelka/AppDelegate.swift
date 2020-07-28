import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        useAppTheme()
        configureNotification()
        Coordinator.shared.showRootViewController()
        
        _ = CurrentUser.shared

        return true
    }

    func configureNotification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in }
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func useAppTheme() {
        if #available(iOS 13.0, *) {
            if let themeType = UserDefaults.standard.string(forKey: "AppTheme") {
                UIApplication.shared.windows.forEach { window in
                    window.overrideUserInterfaceStyle = themeType == "dark" ? .dark : .light
                }
            } else {
                UIApplication.shared.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .unspecified
                }
            }
        }
    }

}

