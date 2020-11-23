//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Дмитрий Кириченко on 23.11.2020.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=09d6ff2ba2dcf5587c9e934facd9a611&units=metric"
    
    func fetchWeather(cytyName: String) {
        let urlString = "\(weatherURL)&q=\(cytyName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, responce, error) in
                if error != nil {
                    print("Error")
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
    }
}
