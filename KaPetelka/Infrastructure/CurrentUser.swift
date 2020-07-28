import Foundation
import UIKit

class CurrentUser: BaseAlert
{
    var userModel: ResultUserProfileModel?
    
    private init() {}
    
    static let shared: CurrentUser = {
        let instance = CurrentUser()
        instance.updateCurrentUserModel()
        return instance
    }()
    
    private func getUserProfile(userId: String, completion: ((Bool)->Void)? = nil) {
        LoadingSpinner.shared.startActivity()
    }
    
    func updateCurrentUserModel(completion: ((Bool)->Void)? = nil)
    {
        if let userID = UserAuth.userID
        {
            getUserProfile(userId: userID) { isOk in
            }
        }
        else
        {
            print("Can't refresh current user info")
            completion?(false)
        }
    }
}
