import Foundation

class SearchViewModel: ViewModel {
    
    var view: SearchViewProtocol!
    
    var canGetMoreVideos = true
    
    init(view: SearchViewProtocol) {
        self.view = view
    }
}
