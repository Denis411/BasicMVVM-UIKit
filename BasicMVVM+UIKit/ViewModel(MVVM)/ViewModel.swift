//
//  ViewModel.swift
//  BasicMVVM+UIKit
//
//  Created by FIX PRICE on 10/16/24.
//

import Foundation

final class CountViewModel: ObservableObject {
    @Published private(set) var count: Int = 0
    
    func increaseCount() {
        count += 1
    }
    
    func decreaseCount() {
        count -= 1
    }
}
