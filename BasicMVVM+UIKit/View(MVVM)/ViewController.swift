//
//  ViewController.swift
//  BasicMVVM+UIKit
//
//  Created by FIX PRICE on 10/16/24.
//


import SwiftUI
import Combine
import UIKit

final class ViewController: UIViewController {
    @ObservedObject private var viewModel = CountViewModel()
    private var internalView: InternalView { view as! InternalView }
    private var disposedBag = Set<AnyCancellable>()
    
    override func loadView() {
        view = InternalView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        internalView.setDecreaseAction(viewModel.decreaseCount)
        internalView.setIncreaseAction(viewModel.increaseCount)
        bind()
    }
    
    private func bind() {
        viewModel
            .$count
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newValue in
                self?.internalView.setCount(String(newValue))
        }
        .store(in: &disposedBag)
    }
}

