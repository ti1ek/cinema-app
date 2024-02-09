//
//  AppCoordinator.swift
//  CinemaApp
//
//  Created by ti1ek on 09.02.2024.
//

import UIKit
import SwiftUI

class AppCoordinator {
    var rootController: UIViewController!
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        self.rootController = CardsScreen()
        window.rootViewController = rootController
    }
    
    private func CardsScreen() -> UIViewController {
        let viewModel = CardsViewModel()
        let cardsController = UIHostingController(rootView: CardsView(viewModel: viewModel))
        
        viewModel.onAction = { [weak cardsController, weak self] destination in
            guard let self = self, let cardsController = cardsController else { return }
            switch destination {
            case .detailedView(let cardItem):
                cardsController.present(
                    self.cardScreen(for: cardItem),
                    animated: true
                )
            }
        }
        let navigationController = UINavigationController(rootViewController: cardsController)
        return navigationController
    }
    
    
    private func cardScreen(for post: Card) -> UIViewController {
        let viewModel = DetailedCardViewModel(model: post)
        let detailedController = UIHostingController(rootView: DetailedCardView(viewModel: viewModel))
        
        viewModel.onClose = { [weak detailedController] in
            detailedController?.dismiss(animated: true, completion: nil)
        }
        return detailedController
    }
}
