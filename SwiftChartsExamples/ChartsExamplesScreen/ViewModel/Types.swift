//
//  Types.swift
//  SwiftChartsExamples
//
//  Created by Sasha Myshkina on 08.05.2023.
//

import Charts
import SwiftUI

protocol ChartDescribable {
    static var description: String { get set }
}

enum MarkType: String, CaseIterable, ChartDescribable {
    case bar, point, line

    static var description = "Mark type"
}

enum AxisType: String, CaseIterable, ChartDescribable {
    case horizontal, vertical

    static var description = "Axis type"
}

enum ShapeColor: String, CaseIterable, ChartDescribable {
    case green = "💚", blue = "💙", purple = "💜", orange = "🧡"
    
    var color: Color {
        switch self {
        case .green:
            return .green
        case .blue:
            return .blue
        case .purple:
            return .purple
        case .orange:
            return .orange
        }
    }

    static var description = "Colors"
}
