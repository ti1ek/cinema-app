//
//  CardsViewModel.swift
//  CinemaApp
//
//  Created by ti1ek on 09.02.2024.
//


import SwiftUI

class CardsViewModel: ObservableObject {
    
    enum NavigationDestination {
        case detailedView(Card)
    }
    
    var posts: [Card] = []
    
    var onAction: ((NavigationDestination) -> Void)?
    
    init() {
        self.posts = (1...7).map { Card(postImage: "post\($0)") }
    }
    
    func selectPost(_ post: Card) {
        onAction?(.detailedView(post))
    }
}
