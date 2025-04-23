//
//  UIView+.swift
//  week2_assignment
//
//  Created by 이상엽 on 4/23/25.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
