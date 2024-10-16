//
//  InternalView.swift
//  BasicMVVM+UIKit
//
//  Created by FIX PRICE on 10/16/24.
//

import UIKit

final class InternalView: UIView {
    private let countTitle = UILabel()
    private let buttonHorizontalStack = UIStackView()
    private let plusButton = CountButton()
    private let minusButton = CountButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setButtons()
        setCountTitle()
        setButtonHorizontalStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setting UI Methods
extension InternalView {
    private func setButtons() {
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        plusButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func setCountTitle() {
        countTitle.text = "Not set yet"
        countTitle.font = .systemFont(ofSize: 50)
        
        countTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(countTitle)
        countTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
        countTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
    }
    
    private func setButtonHorizontalStack() {
        buttonHorizontalStack.addArrangedSubview(minusButton)
        buttonHorizontalStack.addArrangedSubview(plusButton)
        buttonHorizontalStack.axis = .horizontal
        buttonHorizontalStack.alignment = .center
        buttonHorizontalStack.distribution = .fillEqually
        buttonHorizontalStack.spacing = 20
        
        self.addSubview(buttonHorizontalStack)
        buttonHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        buttonHorizontalStack.topAnchor.constraint(equalTo: countTitle.bottomAnchor, constant: 50).isActive = true
        buttonHorizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        buttonHorizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
        buttonHorizontalStack.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

// MARK: - Public methods
extension InternalView {
    func setCount(_ updatedCount: String) {
        countTitle.text = updatedCount
    }
    
    func setIncreaseAction(_ action: @escaping () -> Void) {
        plusButton.setAction(action)
    }
    
    func setDecreaseAction(_ action: @escaping () -> Void) {
        minusButton.setAction(action)
    }
}
