//
//  ContentView.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 10/07/24.
//

import SwiftUI
struct ContentView: View {
    let router = PieChartRouter()
    let routerBar = BarChartRouter()
    let routerLine = LineChartRouter()

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: router.navigateToPieChartMainView()) {
                    Text("Ver Gráfico de Pastel")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                NavigationLink(destination: routerBar.navigateToBarChartSwiftUIView()) {
                    Text("Ver Gráfico de Línea (Dummy 1)")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                NavigationLink(destination: routerLine.navigateToLineChartSwiftUIView()) {
                    Text("Ver Gráfico de Barra (Dummy 2)")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                NavigationLink(destination: router.navigateToPieChartMainView()) {
                    Text("Ver Gráfico de Dispersión (Dummy 3)")
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Menú Principal")
        }
    }
}

