//
//  UIViewController+Extension.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation
import UIKit

//MARK: Alert
extension UIViewController{
    
    func showPopAlert(title: String, message: String, okTitle: String = "OK", okHandler: ((UIAlertAction)->Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okTitle, style: .cancel, handler: okHandler))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupRightButton(image: UIImage, color: UIColor, action: Selector) {
        let rightBarButtonItem = UIBarButtonItem.init(image: image, style: .done, target: self, action: action)
        rightBarButtonItem.tintColor = color
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}
