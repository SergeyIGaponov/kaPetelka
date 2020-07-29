import Foundation

enum FavoritesStateController {
    case MainController
    case ProfileController
}

class FavoritesViewModel: ViewModel, BaseAlert {
    
    var view: FavoritesViewProtocol!
    
    var userID = ""
    var userProfile: ResultUserProfileModel?
    
    var stateController: FavoritesStateController!

    init(view: FavoritesViewProtocol, stateController: FavoritesStateController) {
        self.view = view
        self.stateController = stateController
    }
}
