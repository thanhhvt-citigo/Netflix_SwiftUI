//
//  ViewModel.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation
import Combine

protocol InputCompatible {
    associatedtype InputCompatibleType: ViewModel
    var inputs: Inputs<InputCompatibleType> { get }
}

protocol OutputCompatible {
    associatedtype OutputCompatibleType
    var outputs: Outputs<OutputCompatibleType> { get }
}

class ViewModel {
    enum LifeCycle {
        case didAppear
        case willAppear
        case didLoad
        case willDisappear
        case didDisappear
        case didLayoutSubviews
    }

    // handle view controller's state in viewmodel
    let lifeCycle = PassthroughSubject<LifeCycle, Never>()

    var cancellables = Set<AnyCancellable>()
}

class Inputs<Base> {
    let vm: Base

    init(_ vm: Base) {
        self.vm = vm
    }
}

class Outputs<Base> {
    let vm: Base

    init(_ vm: Base) {
        self.vm = vm
    }
}

extension ViewModel: OutputCompatible {
    typealias OutputCompatibleType = ViewModel
}

extension OutputCompatible {
    var outputs: Outputs<Self> { return Outputs(self) }
}

extension ViewModel: InputCompatible {
    typealias InputCompatibleType = ViewModel
}

extension InputCompatible where Self: ViewModel {
    var inputs: Inputs<Self> { return Inputs(self) }
}
