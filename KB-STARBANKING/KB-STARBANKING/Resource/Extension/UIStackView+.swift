//
//  UIStackView.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/20/25.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
