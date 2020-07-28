import Foundation
import Alamofire
import UIKit

enum StateController {
    case MainController
}

class MainViewModel: ViewModel, BaseAlert {
    
    var view: MainViewProtocol!
    var stateController: StateController!
    var selectedVideo: Int!
    
    var videos: [ItemVideoList]!
    var canGetMoreVideos = false
    
    init(view: MainViewProtocol, stateController: StateController, videos: [ItemVideoList], selectedVideo: Int) {
        self.view = view
        self.stateController = stateController
        self.videos = videos
        self.selectedVideo = selectedVideo
    }
}
