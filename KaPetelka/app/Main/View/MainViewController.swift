import UIKit

protocol MainViewProtocol {
    func reloadTableView()
    func closeViewController()
}

class MainViewController: BaseViewController<MainViewModel>,MainViewProtocol {
    func closeViewController() {
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
    }
    
    func reloadTableView() {
    }

}
