//
//  UIView+Extension.swift
//  WeatherApp
//
//  Created by Mohau Mpoti on 23/05/2021.
//

import UIKit

extension UIView {
    func embed(_ view: UIView, insets: UIEdgeInsets = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left),
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -insets.right),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom)
        ])
    }
    
    func embed(
        _ view: UIView,
        insets: UIEdgeInsets = .zero,
        inContentLayout contentLayout: UILayoutGuide
    ) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentLayout.topAnchor, constant: insets.top),
            view.leftAnchor.constraint(equalTo: contentLayout.leftAnchor, constant: insets.left),
            view.bottomAnchor.constraint(equalTo: contentLayout.bottomAnchor, constant: -insets.bottom),
            view.rightAnchor.constraint(equalTo: contentLayout.rightAnchor, constant: -insets.right)
        ])
    }
}
