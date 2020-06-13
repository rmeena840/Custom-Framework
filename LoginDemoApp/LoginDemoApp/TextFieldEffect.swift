import UIKit

class TextFieldEffect: UITextField {
    
    var floatingLabel: UILabel = UILabel(frame: CGRect.zero) // Label
    var floatingLabelHeight: CGFloat = 14 // Default height
    @IBInspectable
    var _placeholderrrr: String? // we cannot override 'placeholder'
    @IBInspectable
    var floatingLabelColor: UIColor = UIColor.black {
        didSet {
            self.floatingLabel.textColor = floatingLabelColor
            self.setNeedsDisplay()
        }
    }
    @IBInspectable
    var activeBorderColor: UIColor = UIColor.blue
    @IBInspectable
    var floatingLabelFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            self.floatingLabel.font = self.floatingLabelFont
            self.font = self.floatingLabelFont
            self.setNeedsDisplay()
        }
    }
    
    let bottomLine = CALayer()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _placeholderrrr = _placeholderrrr != nil ? self._placeholderrrr : placeholder
        
        // Use our custom placeholder if none is set
        self.placeholder = self._placeholderrrr
        // make sure the placeholder is shown
        self.floatingLabel = UILabel(frame: CGRect.zero)
        self.addTarget(self, action: #selector(self.addFloatingLabel), for: .editingDidBegin)
        self.addTarget(self, action: #selector(self.removeFloatingLabel), for: .editingDidEnd)
        
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height-10, width: frame.size.width, height: 1)
        bottomLine.bounds = CGRect(x: 0, y: 0, width: frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
    
    // Add a floating label to the view on becoming first responder
    @objc func addFloatingLabel() {
        if self.text == "" {
            self.floatingLabel.textColor = floatingLabelColor
            self.floatingLabel.font = floatingLabelFont
            self.floatingLabel.text = self._placeholderrrr
            self.floatingLabel.layer.backgroundColor = UIColor.white.cgColor
            self.floatingLabel.translatesAutoresizingMaskIntoConstraints = false
            self.floatingLabel.clipsToBounds = true
            self.floatingLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.floatingLabelHeight)
            self.layer.borderColor = self.activeBorderColor.cgColor
            self.addSubview(self.floatingLabel)
          
            self.floatingLabel.bottomAnchor.constraint(equalTo:
            self.topAnchor, constant: -10).isActive = true // Place our label 10pts above the text field
            // Remove the placeholder
            self.placeholder = placeholder != nil ? placeholder : ""
            bottomLine.backgroundColor = UIColor.blue.cgColor
            
        }
        self.setNeedsDisplay()
    }
    
    @objc func removeFloatingLabel() {
        if self.text == "" {
            UIView.animate(withDuration: 0.13) {
               self.subviews.forEach{ $0.removeFromSuperview() }
               self.setNeedsDisplay()
            }
            self.placeholder = placeholder
        }
        self.layer.borderColor = UIColor.black.cgColor
        bottomLine.backgroundColor = UIColor.gray.cgColor
    }
    
}
