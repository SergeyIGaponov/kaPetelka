import UIKit

protocol SearchViewProtocol: BaseAlert {
    func reloadTableView()    
}

class SearchViewController: BaseViewController<SearchViewModel>,SearchViewProtocol {
    func reloadTableView() {
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    override func viewWillAppear(_ animated: Bool) {
//        interestingTableView.reloadData()
    }
        
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateUI()
    }
    
    func updateUI() {
        if #available(iOS 13.0, *) {
            if traitCollection.userInterfaceStyle == .light {
                view.backgroundColor = ColorCompatibility.lightBGColor
            } else if traitCollection.userInterfaceStyle == .dark {
                view.backgroundColor = ColorCompatibility.darkBGColor
            }
        }
    }
}
