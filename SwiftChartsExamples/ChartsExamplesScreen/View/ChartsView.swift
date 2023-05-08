//
//  ChartsView.swift
//  SwiftChartsExamples
//
//  Created by Sasha Myshkina on 08.05.2023.
//

import SwiftUI

struct ChartsView: View {
    
    // MARK: - UI

    enum Constant {
        static let bottomPadding = 15.0
        static let horizontalPadding = 20.0
        static let stackSpacing = 10.0
        static let textColorOpacity = 0.7
    }

    // MARK: - Properties

    @StateObject var viewModel = ChartsViewModel()

    // MARK: - Body
    
    var body: some View {
        VStack(spacing: Constant.stackSpacing) {
            title
            ChartContainerView(viewModel: viewModel)
            ControlsView(viewModel: viewModel)
        }
        .padding(.horizontal, Constant.horizontalPadding)
    }

    var title: some View {
        Text(viewModel.title)
            .font(.title3)
            .foregroundColor(.black.opacity(Constant.textColorOpacity))
            .padding(.vertical, Constant.bottomPadding)
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}
