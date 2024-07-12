//
//  PieChartProtocols.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import Foundation

protocol PieChartInteractorInput {
    func fetchPieChartData()
}

protocol PieChartPresenterProtocol: AnyObject {
    func presentSegments(_ segments: [ProspectData])
}

protocol PieChartViewProtocol: AnyObject {
    func displaySegments(_ segments: [PieChartSegment])
}
