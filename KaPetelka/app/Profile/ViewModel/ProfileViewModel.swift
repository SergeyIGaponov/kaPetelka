import Foundation

enum ProfileStateController {
    case MainController
    case ProfileController
}

class ProfileViewModel: ViewModel, BaseAlert {
    
    var view: ProfileViewProtocol!
    
    var userID = ""
    var userProfile: ResultUserProfileModel?
    
    var stateController: ProfileStateController!

    init(view: ProfileViewProtocol, stateController: ProfileStateController, selectedUserID: String) {
        self.view = view
        self.stateController = stateController
        self.userID = selectedUserID
    }
        
    func getProfile() {
        if userID.isEmpty {return}
        LoadingSpinner.shared.startActivity()
    }
}
