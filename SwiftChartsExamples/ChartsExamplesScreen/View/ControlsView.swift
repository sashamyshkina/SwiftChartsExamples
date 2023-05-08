//
//  ControlsView.swift
//  SwiftChartsExamples
//
//  Created by Sasha Myshkina on 08.05.2023.
//

import Charts
import SwiftUI

struct ControlsView: View {
    
    // MARK: - UI
    
    private enum Constant {
        static let bottomPadding = 40.0
        static let toggleTitle = "Shows avarage line aka RuleMark"
    }
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: ChartsViewModel
    
    // MARK: - Life cycle
    
    init(viewModel: ChartsViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    
    var body: some View {
        container
            .padding(.bottom, Constant.bottomPadding)
    }

    var container: some View {
        VStack {
            Picker(MarkType.description, selection: $viewModel.chosenMarkType) {
                ForEach(MarkType.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.bottom)

            Picker(AxisType.description, selection: $viewModel.chosenAxisType) {
                ForEach(AxisType.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.bottom)
            
            
            Picker(ShapeColor.description, selection: $viewModel.chosenShapeStyle) {
                ForEach(ShapeColor.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.bottom)

            Slider(value: $viewModel.shapeCornerRadius, in: 0...30)
            
            Toggle(Constant.toggleTitle, isOn: $viewModel.showsAvarageLine)
        }
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView(viewModel: ChartsViewModel())
    }
}
