import UIKit
import SDWebImage

protocol FavoritesViewProtocol: BaseAlert {
    func updateCollection()
}

class FavoritesViewController: BaseViewController<FavoritesViewModel>,FavoritesViewProtocol {
    
    @IBOutlet fileprivate weak var favoritesCollectionView: UICollectionView!
    let favoritesCollectionCellInditifer = "FavoritesCollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func updateCollection() {
        favoritesCollectionView.reloadData()
    }
}
