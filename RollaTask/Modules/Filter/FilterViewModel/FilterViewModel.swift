//
//  FilterViewModel.swift
//  RollaTask
//
//  Created by AlmirGaric on 17. 9. 2023..
//

import Foundation
import QuartzCore
import Combine

enum Sort {
    case ascending,descending
    
    var title: String {
        
        switch self{
            
        case.ascending : return "Ascending"
        case.descending: return "Descending"
            
        }
    }
}

class SortViewModel : ObservableObject {
    @Published var sortingTime: Double = 0.0
    @Published var isSorting: Bool = false
    @Published var sortType : Sort = .descending
    @Published var firstTenInArray : [Int] = []
    
    func generateAndSortCollection(sortType: Sort) {
        isSorting = true
        firstTenInArray = []
        
        let backgroundQueue = DispatchQueue.global(qos: .background)
        
        let batchSize = 1_000_000 // Adjust batch size as needed
        var sortedCollection: [Int] = []
        
        backgroundQueue.async { [self] in
            let startTime = CACurrentMediaTime()
            
            for _ in 0..<(25_000_000 / batchSize) {
                var batch = (0..<batchSize).map { _ in Int.random(in: 0..<25_000_000)}
                switch sortType {
                case .ascending:
                    batch.sort(by: >)
                case .descending:
                    batch.sort(by: <)
                }
                sortedCollection += batch
            }
            
            let endTime = CACurrentMediaTime()
            
            DispatchQueue.main.async {
                self.isSorting = false
                self.firstTenInArray = Array(sortedCollection.prefix(12))
                self.sortingTime = endTime - startTime
                
            }
        }
    }

    func toggleSortType() {
        if sortType == .ascending {
            sortType = .descending
        } else {
            sortType = .ascending
        }
    }
}
