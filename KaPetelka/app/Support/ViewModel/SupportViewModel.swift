import Foundation

enum SupportStateController {
    case MainController
    case ProfileController
}

class SupportViewModel: ViewModel, BaseAlert {
    
    var view: SupportViewProtocol!
    
    var userID = ""
    var userProfile: ResultUserProfileModel?
    
    var stateController: SupportStateController!

    init(view: SupportViewProtocol, stateController: SupportStateController) {
        self.view = view
        self.stateController = stateController
    }
}
