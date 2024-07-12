//
//  LineChartView.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import SwiftUI

struct LineChartView: View {
    var segments: [LineChartSegment]

    var body: some View {
        VStack {
            Text("Gráfico de Líneas")
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
                                .fill(segment.color)
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

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView(segments: [])
    }
}
