//
//  UITableViewCell+Reusable.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
