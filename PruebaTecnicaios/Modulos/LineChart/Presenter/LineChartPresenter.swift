//
//  LineChartPresenter.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 10/07/24.
//


import Foundation
import SwiftUI

class LineChartPresenter: LineChartPresenterProtocol {
    weak var view: LineChartViewProtocol?

    func presentLineChartData(_ entries: [LineChartDataEntry]) {
        print("Presenter: Presenting line chart data...")
        let lineChartSegments = processData(entries)
        view?.displayLineChartData(lineChartSegments)
    }

    private func processData(_ entries: [LineChartDataEntry]) -> [LineChartSegment] {
        var segments: [LineChartSegment] = []

        for entry in entries {
            let segment = LineChartSegment(
                value: Double(entry.abiertos),
                label: entry.nombrE_PROMOTOR,
                color: .blue,
                values: [Double(entry.abiertos), Double(entry.cerrados), Double(entry.nO_INTERESADOS)]
            )
            segments.append(segment)
        }

        print("Presenter: Processed \(segments.count) segments")
        return segments
    }
}

