//
//  customClasses.swift
//  Ecommerce App
//
//  Created by Bilal on 27/03/25.
//

import Foundation
import UIKit

class TextFieldView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor(hex: "#A8A8A9").cgColor
        self.layer.borderWidth = 1
    }
}

class PinkButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    private func setupButton() {
        self.backgroundColor = UIColor(hex: "#F83758")
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
}
