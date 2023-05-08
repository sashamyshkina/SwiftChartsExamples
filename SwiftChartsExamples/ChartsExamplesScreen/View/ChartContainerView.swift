//
//  ChartContainerView.swift
//  SwiftChartsExamples
//
//  Created by Sasha Myshkina on 08.05.2023.
//

import Charts
import Combine
import SwiftUI

struct ChartContainerView: View {

    // MARK: - Properties
    
    @ObservedObject var viewModel: ChartsViewModel

    // MARK: - Body
    
    var body: some View {
        ZStack {
            switch viewModel.chosenMarkType {
            case .bar:
                getBarChart()
            case .line:
                getLineChart()
            case .point:
                getPointChart()
            }
        }
    }

    // MARK: - getChart actions
    
    private func getBarChart() -> some View {
        VStack {
            if viewModel.chosenAxisType == .horizontal {
                horizontalBarChart
            } else {
                verticalBarChart
            }
        }
    }

    private func getLineChart() -> some View {
        VStack {
            if viewModel.chosenAxisType == .horizontal {
                horizontalLineChart
            } else {
                verticalLineChart
            }
        }
    }

    private func getPointChart() -> some View {
        VStack {
            if viewModel.chosenAxisType == .horizontal {
                horizontalPointChart
            } else {
                verticalPointChart
            }
        }
    }

    private var verticalBarChart: some View {
        Chart {
            if viewModel.showsAvarageLine {
                RuleMark(y: .value("average", viewModel.avarage))
                    .foregroundStyle(Color.red)
            }
            
            ForEach(viewModel.data) {
                BarMark(
                    x: .value("Department", $0.department),
                    y: .value("Profit", $0.profit)
                )
                .foregroundStyle(by: .value("Department", $0.department))
            }

            .cornerRadius(viewModel.shapeCornerRadius)
            // Apply any offset if needed
           // .offset(y: -10)
        }
        .chartLegend(.hidden)
//        .chartLegend(position: .top, alignment: .center, spacing: 10)
//        .chartXAxis(.hidden)
//        .foregroundStyle(viewModel.chosenShapeStyle.color)
    }

    // MARK: - Charts
    
    private var horizontalBarChart: some View {
        Chart(viewModel.data) {
            BarMark(
                x: .value("Profit", $0.profit),
                y: .value("Department", $0.department)
            )
        }
        .cornerRadius(viewModel.shapeCornerRadius)
        .foregroundStyle(viewModel.chosenShapeStyle.color)
    }

    private var horizontalLineChart: some View {
        Chart(viewModel.data) {
            if viewModel.showsAvarageLine {
                RuleMark(y: .value("avarage", viewModel.avarage))
            }
            LineMark(
                x: .value("Profit", $0.profit),
                y: .value("Department", $0.department)
            )
            .interpolationMethod(.linear)
        }
        .foregroundStyle(viewModel.chosenShapeStyle.color)
    }

    private var verticalLineChart: some View {
        Chart(viewModel.data) {
            LineMark(
                x: .value("Department", $0.department),
                y: .value("Profit", $0.profit)
            )
            .interpolationMethod(.catmullRom)
        }
        // Modify by customizing AxisMarks (lines) and labels
//        .chartXAxis(content: {
//            AxisMarks { value in
//                AxisGridLine(
//                    centered: false,
//                    stroke: StrokeStyle(
//                        dash: [2, 4, 8]))
//                      .foregroundStyle(Color.red)
//                AxisValueLabel(verticalSpacing: 20) {
//                    Text(value.as(String.self) ?? "")
//                        .foregroundColor(.blue)
//                }
//            }
//        })
        .foregroundStyle(viewModel.chosenShapeStyle.color)
    }

    private var horizontalPointChart: some View {
        Chart(viewModel.data) {
            PointMark(
                x: .value("Profit", $0.profit),
                y: .value("Department", $0.department)
            )
            .symbol(.cross)
        }
        .foregroundStyle(viewModel.chosenShapeStyle.color)
    }

    private var verticalPointChart: some View {
        Chart(viewModel.data) {
            PointMark(
                x: .value("Department", $0.department),
                y: .value("Profit", $0.profit)
            )
        }
        .foregroundStyle(viewModel.chosenShapeStyle.color)
    }
}

struct ChartContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ChartContainerView(viewModel: ChartsViewModel())
    }
}
