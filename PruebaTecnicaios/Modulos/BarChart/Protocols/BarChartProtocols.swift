//
//  BarChartProtocols.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import Foundation

// Protocolo para la vista del gráfico de barras
protocol BarChartViewProtocol: AnyObject {
    func displayBarChartData(_ segments: [BarChartSegment])
}

// Protocolo para el presenter del gráfico de barras
protocol BarChartPresenterProtocol {
    func presentBarChartData(_ entries: [BarChartDataEntry])
}

// Protocolo para el interactor del gráfico de barras
protocol BarChartInteractorProtocol {
    func fetchBarChartData(completion: @escaping (Result<[BarChartDataEntry], Error>) -> Void)
}

