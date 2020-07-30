import Foundation

enum ItemDetailsStateController {
    case MainController
    case ProfileController
}

class ItemDetailsViewModel: ViewModel, BaseAlert {
    
    var view: ItemDetailsViewProtocol!
    
    var stateController: ItemDetailsStateController!

    init(view: ItemDetailsViewProtocol, stateController: ItemDetailsStateController, selectedUserID: String) {
        self.view = view
        self.stateController = stateController
    }
}
