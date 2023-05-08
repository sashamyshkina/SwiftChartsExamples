//
//  ChartsExamplesScreen.swift
//  SwiftChartsExamples
//
//  Created by Sasha Myshkina on 08.05.2023.
//

import SwiftUI

struct ChartsExamplesScreen: View {

    // MARK: - Properties

    @StateObject var viewModel = ChartsViewModel()
    
    // MARK: - Body
    
    var body: some View {
        ChartsView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsExamplesScreen()
    }
}
