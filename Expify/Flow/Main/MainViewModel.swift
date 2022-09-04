//
//  MainViewModel.swift
//  Expify
//
//  Created by Alex173 on 30.08.2022.
//

import Foundation
import Charts
import CoreData

protocol MainViewModelInteface {
    var updatePieChartBlock: ((PieChartData?) -> Void)? { get set }
    func getPieChartData() -> PieChartData?
}

class MainViewModel: NSObject, MainViewModelInteface{
    
    var updatePieChartBlock: ((PieChartData?) -> Void)?
    
    weak var coordinator: MainCoordinator?
    
    private var categoryResultController: NSFetchedResultsController<Category>?
    
    override init() {
        super.init()
        configureFetchedResultController()
    }
    
    func getPieChartData() -> PieChartData? {
        guard let categories = categoryResultController?.fetchedObjects else { return nil }
        var entries = [PieChartDataEntry]()
        for category in categories {
            guard let categoryTotalExpense = getCategoryTotalExpense(category) else { return nil }
            let pieChartDataEntry = PieChartDataEntry(value: categoryTotalExpense, label: category.name)
            entries.append(pieChartDataEntry)
        }
        let dataSet = PieChartDataSet(entries: entries)
        return PieChartData(dataSet: dataSet)
    }
    
    private func getCategoryTotalExpense(_ category: Category) -> Double? {
        guard let expensesSet = category.expenses else { return nil }
        var totalExpense: Double = 0
        for expenseItem in expensesSet {
            guard let expense = expenseItem as? Expense else { return nil }
            totalExpense += expense.amount
        }
        return totalExpense
    }
    
    private func configureFetchedResultController() {
        categoryResultController = CoreDataManager.instance.configureCategoryResultsController(delegate: self)
    }
    
}

extension MainViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        updatePieChartBlock?(getPieChartData())
    }
}
