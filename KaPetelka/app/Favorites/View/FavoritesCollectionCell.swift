import UIKit
import SDWebImage

class FavoritesCollectionCell: UICollectionViewCell {
    @IBOutlet weak var itemPreviewImageView: UIImageView!
    @IBOutlet weak var starsLevelImageView: UIImageView!
    
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    func config() {
//        itemTitleLabel.text = ""
//        favoriteButton.setTitle("", for: .normal)
        
        setItemPreviewImageView()
        setStarsLevelImageView()
    }
    
    func setItemPreviewImageView() {
    }
    
    func setStarsLevelImageView() {
    }
}
