//
//  ViewController.swift
//  Expify
//
//  Created by Alex173 on 30.08.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let settingsButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "gearshape.fill")?.withRenderingMode(.alwaysTemplate)
        button.setImage(icon, for: .normal)
        button.tintColor = R.color.accent()
        button.imageView?.contentMode = .scaleAspectFit
        button.snp.makeConstraints {
            $0.width.height.equalTo(32)
        }
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.color.accent()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Main Screen"
        return label
    }()

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
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = UIColor.systemBackground
        configureSettingsButton()
        configureTitleLabel()
    }
    
    private func configureSettingsButton() {
        view.addSubview(settingsButton)
        settingsButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(settingsButton.snp.top)
        }
    }


}

