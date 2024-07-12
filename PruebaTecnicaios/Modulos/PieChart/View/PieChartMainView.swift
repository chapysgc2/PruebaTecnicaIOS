//
//  PieChartMainView.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import SwiftUI

struct PieChartMainView: View {
    @ObservedObject var viewModel: PieChartViewModel // Usa @ObservedObject en lugar de @StateObject

    init(viewModel: PieChartViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            PieChartView(segments: viewModel.segments)
                .frame(height: 300)
        }
    }
}

struct PieChartMainView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PieChartViewModel(interactor: PieChartInteractor())
        return PieChartMainView(viewModel: viewModel)
    }
}
