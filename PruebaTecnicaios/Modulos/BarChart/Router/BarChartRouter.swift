//
//  BarChartRouter.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//


import SwiftUI

class BarChartRouter {
    // Método para navegar a la vista de gráfico de barras (BarChartSwiftUIView):
    func navigateToBarChartSwiftUIView() -> some View {
        let interactor = BarChartInteractor()
        let viewModel = BarChartViewModel(interactor: interactor)
        return BarChartSwiftUIView(viewModel: viewModel)
    }
}





