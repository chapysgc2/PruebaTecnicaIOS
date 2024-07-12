//
//  LineChartView.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 10/07/24.
//

import SwiftUI

struct LineChartView: View {
    var segments: [LineChartSegment]

    var body: some View {
        VStack {
            Text("Gráfico de Líneas")
                .font(.title)
                .padding()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) { // <-- Cambiado a HStack para alinear horizontalmente
                    ForEach(segments, id: \.label) { segment in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(segment.label)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Spacer()
                                Text("\(Int(segment.value))")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }

                            GeometryReader { geometry in // <-- Usamos GeometryReader
                                ZStack(alignment: .leading) {
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(width: geometry.size.width, height: 30) // <-- Ancho completo
                                        .cornerRadius(8)
                                    Rectangle()
                                        .fill(segment.color)
                                        .frame(width: min(CGFloat(segment.value * 5), geometry.size.width), height: 30)
                                        // <-- Ancho mínimo del contenedor
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
            }
        }
    }
}


