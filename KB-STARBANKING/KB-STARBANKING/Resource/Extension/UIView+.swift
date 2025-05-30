//
//  UIView+.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/10/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
