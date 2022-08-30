//
//  ViewController.swift
//  Expify
//
//  Created by Alex173 on 30.08.2022.
//

import UIKit

class MainViewController: UIViewController {

    private var viewModel: MainViewModelInteface
    
    init(viewModel: MainViewModelInteface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

