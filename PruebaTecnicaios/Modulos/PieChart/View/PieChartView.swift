//
//  PieChartView.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 10/07/24.
//

import SwiftUI

struct PieChartView: View {
    var segments: [PieChartSegment]

    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    ForEach(0..<segments.count, id: \.self) { index in
                        PieChartSliceView(
                            segment: segments[index],
                            startAngle: self.startAngle(for: index),
                            endAngle: self.endAngle(for: index),
                            radius: min(geometry.size.width, geometry.size.height) / 2
                        )
                        .onAppear {
                            print("Segment \(index) data: \(segments[index])")
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .aspectRatio(1, contentMode: .fit)

                    VStack(alignment: .leading) {
                        ForEach(segments, id: \.id) { segment in
                            HStack {
                                Circle()
                                    .fill(segment.color)
                                    .frame(width: 10, height: 10)

                                Text(segment.label)
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(y: geometry.size.width / 2 + 20) // Adjust vertical offset as needed
                }
            }
        }
    }

    private func startAngle(for index: Int) -> Angle {
        if index == 0 {
            return .degrees(0)
        }
        let previousSegment = segments[0..<index].map { $0.value }.reduce(0, +)
        return .degrees(previousSegment / total * 360)
    }

    private func endAngle(for index: Int) -> Angle {
        let segment = segments[0...index].map { $0.value }.reduce(0, +)
        return .degrees(segment / total * 360)
    }

    private var total: Double {
        segments.map { $0.value }.reduce(0, +)
    }
}

struct PieChartSliceView: View {
    var segment: PieChartSegment
    var startAngle: Angle
    var endAngle: Angle
    var radius: CGFloat // Define radius here

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)

                path.move(to: center)
                path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            }
            .fill(segment.color)
        }
    }
}
