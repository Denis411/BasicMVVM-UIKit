//
//  ViewModel.swift
//  BasicMVVM+UIKit
//
//  Created by FIX PRICE on 10/16/24.
//

import Combine

final class CountViewModel: ObservableObject {
    @Published private(set) var model = Model()
    
    func increaseCount() {
        model.increaseCount()
    }
    
    func decreaseCount() {
        model.decreaseCount()
    }
}
