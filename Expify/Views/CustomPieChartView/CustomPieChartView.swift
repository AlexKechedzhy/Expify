//
//  CustomPieChartView.swift
//  Expify
//
//  Created by Alex173 on 04.09.2022.
//

import UIKit
import Charts

class CustomPieChartView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = R.color.accent()
        return label
    }()
    
    private let chartView: PieChartView = {
        let chartView = PieChartView()
        chartView.isUserInteractionEnabled = true
        return chartView
    }()
    
    init(chartData: PieChartData?, title: String) {
        super.init(frame: .zero)
        chartView.data = chartData
        titleLabel.text = title
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        backgroundColor = .clear
        configureTitleLabel()
        configureChartView()
    }
    
    private func configureTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview()
        }
    }
    
    private func configureChartView() {
        addSubview(chartView)
        chartView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-8)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(320)
        }
    }
    
    public func setData(data: PieChartData?) {
        chartView.data = data
    }
    
}
