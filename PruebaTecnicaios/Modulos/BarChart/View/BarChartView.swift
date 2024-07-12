//
//  BarChartView.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import SwiftUI

struct BarChartView: View {
    var segments: [BarChartSegment]

    var body: some View {
        VStack {
            Text("Gráfico de Barras")
                .font(.title)
                .padding()

            ScrollView {
                VStack(spacing: 20) {
                    ForEach(segments, id: \.label) { segment in
                        VStack {
                            Text("\(segment.label): \(Int(segment.value))")
                                .foregroundColor(.primary)
                                .font(.headline)
                                .padding(.bottom, 5)
                            Rectangle()
                                .fill(segment.color) // Usamos el color del segmento
                                .frame(width: CGFloat(segment.value * 5), height: 30)
                                .cornerRadius(8)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        // No se debe proporcionar datos estáticos aquí
        BarChartView(segments: [])
    }
}
