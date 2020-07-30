import UIKit

class CompositionRoot {

    static var sharedInstance: CompositionRoot = CompositionRoot()

    var rootTabBarController: UITabBarController!

    required init() {
        configureRootTabBarController()
    }

    @available(iOS 12.0, *)
    func updateUI(style: UIUserInterfaceStyle)
    {
        if style == .light
        {
            rootTabBarController.viewControllers?.first?.tabBarItem.image = UIImage(named: "选中_主页icon")?.invertedColors()
            rootTabBarController.tabBar.backgroundColor = ColorCompatibility.lightBGColor
//            rootTabBarController.tabBar.backgroundImage = UIImage(named: "tabBarBackground")?.invertedColors()
        }
        else if style == .dark
        {
            rootTabBarController.viewControllers?.first?.tabBarItem.image = UIImage(named: "选中_主页icon")
            rootTabBarController.tabBar.backgroundColor = ColorCompatibility.darkBGColor
            rootTabBarController.tabBar.backgroundImage = UIImage(named: "tabBarBackground")
        }
        else
        {
            rootTabBarController.viewControllers?.first?.tabBarItem.image = UIImage(named: "选中_主页icon")
            rootTabBarController.tabBar.backgroundColor = ColorCompatibility.darkBGColor
            rootTabBarController.tabBar.backgroundImage = UIImage(named: "tabBarBackground")
        }
    }
    
    private func configureRootTabBarController()
    {
        rootTabBarController = UITabBarController()
        rootTabBarController.tabBar.tintColor = ColorCompatibility.label
        rootTabBarController.tabBar.backgroundImage = UIImage(named: "tabBarBackground")
        rootTabBarController.tabBar.clipsToBounds = true
        
        var viewControllersList: [UIViewController] = [UIViewController]()
        let mainViewController = resolveMainViewController(stateController: .MainController, videos: [ItemVideoList](), selectedVideo: 0)
        mainViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home-2"), tag: 1)
        mainViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        viewControllersList.append(mainViewController)

        let searchViewController = resolveSearchViewController()
        searchViewController.tabBarItem = UITabBarItem(title: "tabBarItem_Interesting".localize, image: UIImage(named: "选中_关注icon"), tag: 2)
        searchViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        viewControllersList.append(searchViewController)

        let userID = UserDefaults.standard.object(forKey: KeyConstant.userID) as? String
//        let id = CurrentUser.shared.userModel?.id ?? userID
        let profileViewController = resolveProfileViewController(stateController: .ProfileController, selectedUserID:"")
        profileViewController.tabBarItem = UITabBarItem(title: "tabBarItem_Profile".localize, image: UIImage(named: "选中_我的icon"), tag: 5)
        profileViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        viewControllersList.append(profileViewController)

        let viewControllers = viewControllersList.map { (viewController) -> UIViewController in
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.navigationBar.isHidden = true
            return navigationController
        }

        rootTabBarController.setViewControllers(viewControllers, animated: true)
    }

    // MARK: ViewControllers
    func resolveMainViewController(stateController: StateController, videos: [ItemVideoList], selectedVideo: Int) -> MainViewController {
        let vc = MainViewController.instantiateFromStoryboard("Main")
        vc.viewModel = resolveMainViewModel(view: vc, stateController: stateController, videos: videos, selectedVideo: selectedVideo)
        return vc
    }
    
    func resolveSearchViewController() -> SearchViewController {
        let vc = SearchViewController.instantiateFromStoryboard("Search")
        vc.viewModel = resolveSearchViewModel(view: vc)
        return vc
    }
    
    func resolveProfileViewController(stateController: ProfileStateController, selectedUserID: String) -> ProfileViewController {
        let vc = ProfileViewController.instantiateFromStoryboard("Profile")
        vc.viewModel = resolveProfileViewModel(view: vc, stateController: stateController, selectedUserID: selectedUserID)
        vc.viewModel.getProfile()
        return vc
    }
    
    
//    func resolveMainViewController(stateController: StateController, videos: [ItemVideoList], selectedVideo: Int) -> MainViewController {
//        let vc = MainViewController.instantiateFromStoryboard("Main")
//        vc.viewModel = resolveMainViewModel(view: vc, stateController: stateController, videos: videos, selectedVideo: selectedVideo)
//        return vc
//    }
    
// MARK: ViewModels

    func resolveMainViewModel(view: MainViewProtocol, stateController: StateController, videos: [ItemVideoList], selectedVideo: Int) -> MainViewModel {
        return MainViewModel(view: view, stateController: stateController, videos: videos, selectedVideo: selectedVideo)
    }
    
    func resolveSearchViewModel(view: SearchViewProtocol) -> SearchViewModel {
        return SearchViewModel(view: view)
    }    
    
    func resolveProfileViewModel(view: ProfileViewProtocol, stateController: ProfileStateController, selectedUserID: String) -> ProfileViewModel {
        return ProfileViewModel(view: view, stateController: stateController, selectedUserID: selectedUserID)
    }
}
