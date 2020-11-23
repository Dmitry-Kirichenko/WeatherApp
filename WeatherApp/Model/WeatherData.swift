//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Дмитрий Кириченко on 23.11.2020.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
}
