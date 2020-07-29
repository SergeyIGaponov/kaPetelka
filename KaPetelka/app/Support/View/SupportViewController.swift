import UIKit
import SDWebImage

protocol SupportViewProtocol: BaseAlert {
    func updateTableView()
}

class SupportViewController: BaseViewController<SupportViewModel>, SupportViewProtocol {
        
    @IBOutlet weak var supportTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func updateTableView() {
        supportTableView.reloadData()
    }
}

