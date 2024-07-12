//
//  BarChartSwiftUIView.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 10/07/24.
//

import SwiftUI

struct BarChartSwiftUIView: View {
    @ObservedObject var viewModel: BarChartViewModel // Cambiar @StateObject a @ObservedObject

    var body: some View {
        VStack {
            if !viewModel.segments.isEmpty {
                BarChartView(segments: viewModel.segments)
                    .frame(height: 300)
            } else {
                Text("Cargando datos...")
                    .padding()
            }
        }
        .onAppear {
            viewModel.fetchBarChartData()
        }
    }
}

struct BarChartSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = BarChartInteractor()
        let viewModel = BarChartViewModel(interactor: interactor)
        return BarChartSwiftUIView(viewModel: viewModel)
    }
}
