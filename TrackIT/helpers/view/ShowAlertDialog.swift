//
//	ShowAlertDialog
//	TrackIT
//
//	Created by: Nedim on 27/03/2020
//	Copyright © 2019 bicom. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func simpleAlert(title:String, message:String, style:UIAlertController.Style){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
}
