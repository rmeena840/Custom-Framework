import Foundation
import UIKit

class AlertViewController: UIView {
    
    static let instance = AlertViewController()
    
    @IBOutlet var parentViews: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func alertSignUpButton(_ sender: UIButton) {
        parentViews.removeFromSuperview()
    }
    
    @IBAction func alertCancel(_ sender: UIButton) {
        parentViews.removeFromSuperview()
    }
    
    private func commonInit() {
        alertView.layer.cornerRadius = 10
        parentViews.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentViews.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func showAlert() -> Bool {
        ((UIApplication.shared.keyWindow?.addSubview(parentViews)) != nil)
    }
    
}
