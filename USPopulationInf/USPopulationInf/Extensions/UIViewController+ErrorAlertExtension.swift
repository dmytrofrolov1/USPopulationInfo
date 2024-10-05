//
//  UIViewController+ErrorAlertExtension.swift
//  USPopulationInf
//
//  Created by Dmytro on 05.10.2024.
//

import UIKit

extension UIViewController {
    func showGeneralError() {
        let alertController = UIAlertController(title:"Error",
                                                message: "Something whent wrong, reload page or try again later", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
