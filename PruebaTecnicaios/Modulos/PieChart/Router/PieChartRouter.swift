//
//  PieChartRouter.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import Foundation
import SwiftUI

class PieChartRouter {
    // Método para navegar a la vista de gráfico de pastel (PieChartMainView):
    func navigateToPieChartMainView() -> some View {
        let interactor = PieChartInteractor()
        let viewModel = PieChartViewModel(interactor: interactor)
        // Aquí asegúrate de pasar viewModel al inicializar PieChartMainView
        return PieChartMainView(viewModel: viewModel)
    }
}

