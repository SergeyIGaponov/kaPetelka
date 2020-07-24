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
            rootTabBarController.tabBar.backgroundImage = UIImage(named: "tabBarBackground")?.invertedColors()
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
        mainViewController.tabBarItem = UITabBarItem(title: "tabBarItem_Main".localize, image: UIImage(named: "选中_主页icon"), tag: 1)
        mainViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        viewControllersList.append(mainViewController)

        let searchViewController = resolveSearchViewController()
        searchViewController.tabBarItem = UITabBarItem(title: "tabBarItem_Interesting".localize, image: UIImage(named: "选中_关注icon"), tag: 2)
        searchViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        viewControllersList.append(searchViewController)

        let createMovieController = UIViewController()
        viewControllersList.append(createMovieController)
        
        let notificationViewController = resolveNotificationViewController()
        notificationViewController.tabBarItem = UITabBarItem(title: "tabBarItem_Notification".localize, image: UIImage(named: "选中_消息icon"), tag: 4)
        notificationViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        viewControllersList.append(notificationViewController)

        let userID = UserDefaults.standard.object(forKey: KeyConstant.userID) as? String
        let id = CurrentUser.shared.userModel?.id ?? userID
        let profileViewController = CurrentUser.shared.isInUnsignMode ? resolveUnsignedProfileViewController() : resolveProfileViewController(stateController: .ProfileController, selectedUserID: id ?? "")
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
    
    func updateProfileVCInRootTabBar()
    {
        let id = CurrentUser.shared.userModel?.id ?? ""
        let profileViewController = CurrentUser.shared.isInUnsignMode ? resolveUnsignedProfileViewController() : resolveProfileViewController(stateController: .ProfileController, selectedUserID: id)
        profileViewController.tabBarItem = UITabBarItem(title: "tabBarItem_Profile".localize, image: UIImage(named: "选中_我的icon"), tag: 5)
        profileViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let navigationController = UINavigationController(rootViewController: profileViewController)
        navigationController.navigationBar.isHidden = true
        
        var viewControllers = rootTabBarController.viewControllers ?? [UIViewController]()
        viewControllers = viewControllers.dropLast()
        viewControllers.append(navigationController)
        
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
    
    func resolveCreateMovieController() -> CreateMovieViewController {
        let vc = CreateMovieViewController.instantiateFromStoryboard("CreateMovie")
        vc.viewModel = resolveCreateMovieViewModel(view: vc)
        return vc
    }
    
    func resolveEditVideoViewController(videoUrl: URL) -> EditVideoViewController {
        let vc = EditVideoViewController.instantiateFromStoryboard("CreateMovie")
        vc.viewModel = resolveEditVideoViewModel(view: vc, videoUrl: videoUrl)
        return vc
    }
    
    func resolveAddFiltersViewController(videoUrl: URL, videoOrientation: VideoOrientation) -> AddFiltersViewController {
        let vc = AddFiltersViewController.instantiateFromStoryboard("CreateMovie")
        vc.viewModel = resolveAddFiltersViewModel(view: vc, videoUrl: videoUrl, videoOrientation: videoOrientation)
        return vc
    }
    
    func resolvePublishVideoViewController(videoUrl: URL) -> PublishVideoViewController {
        let vc = PublishVideoViewController.instantiateFromStoryboard("CreateMovie")
        vc.viewModel = resolvePublishVideoViewModel(view: vc, videoUrl: videoUrl)
        return vc
    }
    
    func resolvePrivacyTypeVideoViewController() -> PrivacyTypeVideoViewController {
        let vc = PrivacyTypeVideoViewController.instantiateFromStoryboard("CreateMovie")
        vc.viewModel = resolvePrivacyTypeVideoViewModel(view: vc)
        return vc
    }
    
    func resolveAddVideoDescriptionViewController(withType type: VideoDescriptionItem) -> AddToVideoDescriptionViewController {
        let vc = AddToVideoDescriptionViewController.instantiateFromStoryboard("CreateMovie")
        vc.viewModel = resolveAddVideoDescriptionViewModel(view: vc, type: type )
        return vc
    }

    func resolveNotificationViewController() -> NotificationViewController {
        let vc = NotificationViewController.instantiateFromStoryboard("Notification")
        vc.viewModel = resolveNotificationViewModel(view: vc)
        return vc
    }

    func resolveProfileViewController(stateController: ProfileStateController, selectedUserID: String) -> ProfileViewController {
        let vc = ProfileViewController.instantiateFromStoryboard("Profile")
        vc.viewModel = resolveProfileViewModel(view: vc, stateController: stateController, selectedUserID: selectedUserID)
        vc.viewModel.getProfile()
        return vc
    }
    
    func resolveFavoritesViewController() -> FavoritesViewController {
        let vc = FavoritesViewController.instantiateFromStoryboard("Profile")
        vc.viewModel = resolveFavoritesViewModel(view: vc)
        return vc
    }
    
//    func resolveMainViewController(stateController: StateController, videos: [ItemVideoList], selectedVideo: Int) -> MainViewController {
//        let vc = MainViewController.instantiateFromStoryboard("Main")
//        vc.viewModel = resolveMainViewModel(view: vc, stateController: stateController, videos: videos, selectedVideo: selectedVideo)
//        return vc
//    }
    
    func resolveUnsignedProfileViewController() -> UnsignedProfileViewController {
        let vc = UnsignedProfileViewController.instantiateFromStoryboard("UnsignedProfile")
        return vc
    }
    
    func resolveWalletViewController() -> WalletViewController {
        let vc = WalletViewController.instantiateFromStoryboard("Wallet")
        vc.viewModel = resolveWalletViewModel(view: vc)
        return vc
    }
    
    func resolveEarningsViewController() -> EarningsViewController {
        let vc = EarningsViewController.instantiateFromStoryboard("Wallet")
        vc.viewModel = resolveEarningsViewModel(view: vc)
        return vc
    }
    
    func resolveAuthorizationViewController() -> AuthorizationViewController {
        let vc = AuthorizationViewController.instantiateFromStoryboard("Login")
        vc.viewModel = resolveAuthorizationViewModel(view: vc)
        return vc
    }
    
    func resolveSignUpBirthDateViewController() -> SignUpBirthDateViewController{
        let vc = SignUpBirthDateViewController.instantiateFromStoryboard("Login")
        vc.viewModel = resolveSignUpBirthDateViewModel(view: vc)
        return vc
    }
    
    func resolveSignUpViewController() -> SignUpViewController {
        let vc = SignUpViewController.instantiateFromStoryboard("Login")
        vc.viewModel = resolveSignUpViewModel(view: vc)
        return vc
    }

    func resolveProfileSettingsViewController() -> ProfileSettingsViewController {
        let vc = ProfileSettingsViewController.instantiateFromStoryboard("Profile")
        vc.viewModel = resolveProfileSettings(view: vc)
        return vc
    }

    func resolveSearchResultViewController() -> SearchResultViewController {
        let vc = SearchResultViewController.instantiateFromStoryboard("Search")
        vc.viewModel = resolveSearchResults(view: vc)
        return vc
    }

    func resolveHashTagCollectionViewController(idHashtag: String) -> HashTagCollectionViewController {
        let vc = HashTagCollectionViewController.instantiateFromStoryboard("CollectionsControls")
        vc.viewModel = resolveHashTagCollection(view: vc, idHashtag: idHashtag)
        return vc
    }

    func resolveEditUserProfileViewController() -> EditUserProfileViewController {
        let vc = EditUserProfileViewController.instantiateFromStoryboard("Profile")
        vc.viewModel = resolveEditUserProfile(view: vc)
        return vc
    }
    
    func resolveAccountPasswordViewController(modelVerify: ResultVerifyModel) -> AccountPasswordViewController {
        let vc = AccountPasswordViewController.instantiateFromStoryboard("Profile")
        vc.viewModel = resolveAccountPasswordViewModel(view: vc, modelVerify: modelVerify)
        return vc
    }
    
    func resolveAccountEnterOtpViewController(controllerState: OtpControllerState) -> AccountEnterOtpViewController {
        let vc = AccountEnterOtpViewController.instantiateFromStoryboard("Profile")
        vc.viewModel = resolveAccountEnterOtpViewModel(view: vc, controllerState: controllerState)
        return vc
    }
    
    func resolveAppThemeViewController() -> AppThemeViewController {
        let vc = AppThemeViewController.instantiateFromStoryboard("AppTheme")
        return vc
    }
    
    func resolveAccountAnalyticsViewController() -> AccountAnalyticsViewController {
        let vc = AccountAnalyticsViewController.instantiateFromStoryboard("Profile")
        vc.viewModel = resolveAccountAnalyticsViewModel(view: vc)
        return vc
    }
    
    func resolveReportAProblemViewController() -> ReportProblemViewController {
        let vc = ReportProblemViewController.instantiateFromStoryboard("ReportProblem")
        return vc
    }
    
    func resolveMusicViewController() -> MusicViewController {
        let vc = MusicViewController.instantiateFromStoryboard("Music")
        vc.viewModel = resolveMusicViewModel(view: vc)
        return vc
    }
    
    func resolveSubscriptionsViewController(userID: String) -> SubscriptionsViewController
    {
        let vc = SubscriptionsViewController.instantiateFromStoryboard("Subscriptions")
        vc.viewModel = resolveSubscriptionsViewModel(view: vc, userID: userID)
        return vc
    }

    
    // MARK: ViewModels

    func resolveMainViewModel(view: MainViewProtocol, stateController: StateController, videos: [ItemVideoList], selectedVideo: Int) -> MainViewModel {
        return MainViewModel(view: view, stateController: stateController, videos: videos, selectedVideo: selectedVideo)
    }
    
    func resolveSearchViewModel(view: SearchViewProtocol) -> SearchViewModel {
        return SearchViewModel(view: view)
    }
    
    func resolveCreateMovieViewModel(view: CreateMovieViewProtocol) -> CreateMovieViewModel {
        return CreateMovieViewModel(view: view)
    }
    
    func resolveNotificationViewModel(view: NotificationViewProtocol) -> NotificationViewModel {
        return NotificationViewModel(view: view)
    }
    
    func resolveProfileViewModel(view: ProfileViewProtocol, stateController: ProfileStateController, selectedUserID: String) -> ProfileViewModel {
        return ProfileViewModel(view: view, stateController: stateController, selectedUserID: selectedUserID)
    }
    
    func resolveAuthorizationViewModel(view: AuthorizationViewProtocol) -> AuthorizationViewModel {
        return AuthorizationViewModel(view: view)
    }
    
    func resolveSignUpBirthDateViewModel(view: SignUpBirthDateProtocol) -> SignUpBirthDateViewModel {
        return SignUpBirthDateViewModel(view: view)
    }
    
    func resolveSignUpViewModel(view: SignUpViewProtocol) -> SignUpViewModel {
        return SignUpViewModel(view: view)
    }

    func resolveProfileSettings(view: ProfileSettingsViewProtocol) -> ProfileSettingsViewModel {
        return ProfileSettingsViewModel(view: view)
    }

    func resolveSearchResults(view: SearchResultViewProtocol) -> SearchResultViewModel {
        return SearchResultViewModel(view: view)
    }
    
    func resolveHashTagCollection(view: HashTagCollectionViewProtocol, idHashtag: String) -> HashTagCollectionViewModel {
        return HashTagCollectionViewModel(view: view, idHashtag: idHashtag)
    }

    func resolveEditUserProfile(view: EditUserProfileViewProtocol) -> EditUserProfileViewModel {
        return EditUserProfileViewModel(view: view)
    }
    
    func resolveFavoritesViewModel(view: FavoritesViewProtocol) -> FavoritesViewModel {
        return FavoritesViewModel(view: view)
    }
    
    
    func resolveEditVideoViewModel(view: EditVideoViewProtocol, videoUrl: URL) -> EditVideoViewModel {
        return EditVideoViewModel(view: view, videoUrl: videoUrl)
    }
    
    func resolveAddFiltersViewModel(view: AddFiltersViewProtocol, videoUrl: URL, videoOrientation: VideoOrientation) -> AddFiltersViewModel {
        return AddFiltersViewModel(view: view, videoUrl: videoUrl, videoOrientation: videoOrientation)
    }
    
    func resolvePublishVideoViewModel(view: PublishVideoProtocol, videoUrl: URL) -> PublishVideoViewModel {
        return PublishVideoViewModel(view: view, videoUrl: videoUrl)
    }
    
    func resolvePrivacyTypeVideoViewModel(view: PrivacyTypeVideoProtocol) -> PrivacyTypeVideoViewModel {
        return PrivacyTypeVideoViewModel(view: view)        
    }
        
    func resolveMusicViewModel(view: MusicViewProtocol) -> MusicViewModel {
        return MusicViewModel(view: view)
    }
    
    func resolveWalletViewModel(view: WalletViewProtocol) -> WalletViewModel {
        return WalletViewModel(view: view)
    }
    
    func resolveAccountPasswordViewModel(view: AccountPasswordViewProtocol, modelVerify: ResultVerifyModel) -> AccountPasswordViewModel {
        return AccountPasswordViewModel(view: view, modelVerify: modelVerify)
    }
    
    func resolveAccountEnterOtpViewModel(view: AccountEnterOtpViewProtocol, controllerState: OtpControllerState) -> AccountEnterOtpViewModel {
        return AccountEnterOtpViewModel(view: view, controllerState: controllerState)
    }
    
    func resolveEarningsViewModel(view: EarningsViewProtocol) -> EarningsViewModel {
        return EarningsViewModel(view: view)
    }
    
    func resolveAccountAnalyticsViewModel(view: AccountAnalyticsViewProtocol) -> AccountAnalyticsViewModel {
        return AccountAnalyticsViewModel(view: view)
    }

    func resolveAddVideoDescriptionViewModel(view: AddVideoDescriptionProtocol, type: VideoDescriptionItem) -> AddVideoDescriptionViewModel {
        return AddVideoDescriptionViewModel(view: view, type: type)
    }
    
    func resolveSubscriptionsViewModel(view: SubscriptionsViewProtocol, userID: String) -> SubscriptionsViewModel
    {
        return SubscriptionsViewModel(view: view, userID: userID)
    }
}
