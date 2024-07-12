//
//  LineChartRouter.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 10/07/24.
//

import Foundation
import SwiftUI

class LineChartRouter {
    // Método para navegar a la vista de gráfico de líneas (LineChartSwiftUIView):
    func navigateToLineChartSwiftUIView() -> some View {
        let interactor = LineChartInteractor()
        let viewModel = LineChartViewModel(interactor: interactor)
        return LineChartSwiftUIView(viewModel: viewModel)
    }
}

