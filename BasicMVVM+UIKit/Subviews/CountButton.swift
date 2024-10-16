//
//  CountButton.swift
//  BasicMVVM+UIKit
//
//  Created by FIX PRICE on 10/16/24.
//

import UIKit

class CountButton: UIButton {
    private var action: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(performAction), for: .touchUpInside)
        clipsToBounds = false
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 5
        layer.cornerRadius = 5
        layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setAction(_ action: @escaping () -> Void) {
        self.action = action
    }
    
    @objc func performAction() {
        action?()
    }
}
