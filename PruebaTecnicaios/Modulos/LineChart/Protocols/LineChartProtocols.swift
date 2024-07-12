//
//  LineChartProtocols.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 10/07/24.
//

import Foundation

// Protocolo para la vista del gráfico de líneas
protocol LineChartViewProtocol: AnyObject {
    func displayLineChartData(_ segments: [LineChartSegment])
}

// Protocolo para el presenter del gráfico de líneas
protocol LineChartPresenterProtocol {
    func presentLineChartData(_ entries: [LineChartDataEntry])
}

// Protocolo para el interactor del gráfico de líneas
protocol LineChartInteractorProtocol {
    func fetchLineChartData(completion: @escaping (Result<[LineChartDataEntry], Error>) -> Void)
}
