import UIKit
import SDWebImage

protocol ProfileViewProtocol {
}

class ProfileViewController: BaseViewController<ProfileViewModel>,ProfileViewProtocol {
    
    @IBOutlet weak var mailIconImageView: UIImageView!
       
    @IBOutlet weak var titleViewLabel: UILabel!
    @IBOutlet weak var userGreetingsTitleLabel: UILabel!
    @IBOutlet weak var userMailLabel: UILabel!
       
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var changeMailButton: UIButton!
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        config()
    }
    
    func config() {
//        titleViewLabel.text = ""
//        userGreetingsTitleLabel.text = ""
//        userMailLabel.text = ""
        
//        changePasswordButton.setTitle("", for: .normal)
//        changeMailButton.setTitle("", for: .normal)
//        resetPasswordButton.setTitle("", for: .normal)
    }
    
    
    @IBAction func changePasswordButtonAction(_ sender: Any) {
    }

    @IBAction func changeMailButtonAction(_ sender: Any) {
    }

    @IBAction func resetPasswordButtonAction(_ sender: Any) {
    }
}
