import UIKit

class Coordinator {
    
    static let shared = Coordinator()
    
    private var compositionRoot: CompositionRoot {
        return CompositionRoot.sharedInstance
    }
    
    private var baseNavigationController: UINavigationController? {
        return lastPresentedViewController?.navigationController
    }
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    private var lastPresentedViewController: UIViewController?
    
    private init() {}
    
    func showRootViewController() {
        showRootTabBarController()
    }
    
    func showRootTabBarController() {
        let navController = UINavigationController(rootViewController: compositionRoot.rootTabBarController)
        navController.navigationBar.isHidden = true
        appDelegate.window?.rootViewController = navController
    }
        
    func goToUserProfileViewController(selectedUserID: String) {
        if let currentID = CurrentUser.shared.userModel?.id, selectedUserID == currentID {
            DispatchQueue.main.async {
                let index = (self.compositionRoot.rootTabBarController.viewControllers?.count ?? 1)-1
                self.compositionRoot.rootTabBarController.selectedIndex = index
            }
        } else {
            push(compositionRoot.resolveProfileViewController(stateController: .MainController, selectedUserID: selectedUserID ), animated: true)
        }
    }
    
    func goToMainViewController(stateController: StateController, videos: [ItemVideoList], selectedVideo: Int) {
        push(compositionRoot.resolveMainViewController(stateController: stateController, videos: videos, selectedVideo: selectedVideo), animated: false)
    }

    func push(_ vc: UIViewController, animated: Bool) {
        if let baseNavigationController = baseNavigationController {
            baseNavigationController.pushViewController(vc, animated: animated)
            lastPresentedViewController = vc
        } else {
            if let navigationController = appDelegate.window?.rootViewController as? UINavigationController {
                navigationController.pushViewController(vc, animated: animated)
            }
        }
    }
}
