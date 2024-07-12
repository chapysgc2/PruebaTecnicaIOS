//
//  LineChartSwiftUIView.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import SwiftUI

struct LineChartSwiftUIView: View {
    @ObservedObject var viewModel: LineChartViewModel

    var body: some View {
        VStack {
            if !viewModel.segments.isEmpty {
                LineChartView(segments: viewModel.segments)
                    .frame(height: 300)
            } else {
                Text("Cargando datos...")
                    .padding()
            }
        }
        .onAppear {
            viewModel.fetchLineChartData()
        }
    }
}

struct LineChartSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = LineChartInteractor()
        let viewModel = LineChartViewModel(interactor: interactor)
        return LineChartSwiftUIView(viewModel: viewModel)
    }
}
