

import UIKit

class CustomButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
        let lineView = UIView(frame: CGRect(x: 0, y: self.frame.size.height, width: self.frame.size.width, height: 2))
        lineView.backgroundColor = UIColor.black
        self.addSubview(lineView)
    }

}
