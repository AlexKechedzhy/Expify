//
//  MainCoordinator.swift
//  Expify
//
//  Created by Alex173 on 30.08.2022.
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
    init(navigationController: UINavigationController)
}

protocol MainCoordinatorInteface: Coordinator {
    
}

class MainCoordinator: MainViewModelInteface {
    
    private let navigationController: UINavigationController
    
    func start() {
        let viewModel = MainViewModel()
        let mainController = MainViewController(viewModel: viewModel)
        viewModel.coordinator = self
        navigationController.pushViewController(mainController, animated: false)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
    }
    
    
}
