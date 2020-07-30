import UIKit
import SDWebImage

protocol ItemDetailsViewProtocol {
}

class ItemDetailsViewController: BaseViewController<ItemDetailsViewModel>,ItemDetailsViewProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        config()
    }
    
    func config() {
    }
}
