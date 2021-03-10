
import Foundation
import UIKit

struct CurrentWeatherViewModel {
    let temperature:                String
    let humidity:                   String
    let precipitationProbability:   String
    let summary:                    String
    let icon:                       UIImage
    
    init(model: CurrentWeather) {
        let roundedTemperature = Int(model.temperature)
        self.temperature = "\(roundedTemperature)º"
        
        let humidityPercentage = Int(model.humidity * 100)
        self.humidity = "\(humidityPercentage)%"
        
        let precipitationProbabilityPercentage = Int(model.humidity * 100)
        self.precipitationProbability = "\(precipitationProbabilityPercentage)%"
        self.summary = model.summary
        self.icon = model.iconImage
        
    }
}
