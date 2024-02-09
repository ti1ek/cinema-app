//
//  CardViewModel.swift
//  CinemaApp
//
//  Created by ti1ek on 09.02.2024.
//

import SwiftUI

class DetailedCardViewModel: ObservableObject {
    var post: Card
    var onClose: (() -> Void)?

    init(model: Card) {
        self.post = model
    }

    func close() {
        onClose?()
    }
}
