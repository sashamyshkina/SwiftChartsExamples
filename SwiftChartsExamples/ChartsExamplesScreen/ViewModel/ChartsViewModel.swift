//
//  ChartsViewModel.swift
//  SwiftChartsExamples
//
//  Created by Sasha Myshkina on 08.05.2023.
//

import SwiftUI
import Combine
import Charts

class ChartsViewModel: ObservableObject {

    // MARK: - Properties

    @Published var chosenMarkType: MarkType = .bar

    @Published var chosenAxisType: AxisType = .vertical
    
    @Published var chosenShapeStyle: ShapeColor = .green
    
    @Published var shapeCornerRadius: Double = 0
    
    @Published var showsAvarageLine: Bool = false
    
    private var cancellables = Set<AnyCancellable>()

    var data: [Profit]  = [
        Profit(department: "Product", profit: 15000),
        Profit(department: "Marketing", profit: 8000),
        Profit(department: "Finance", profit: 10000),
        Profit(department: "Support", profit: 14000),
        Profit(department: "Design", profit: 5000),
        Profit(department: "Others", profit: 400)
    ]

    let title: String = "Swift Charts examples"

    var avarage: Double {
        let sum = data.map { $0.profit }.reduce(0, +)
        return sum / Double(data.count)
    }
}

struct Profit: Identifiable {
     let department: String
     let profit: Double
     var id: String { department }
}
