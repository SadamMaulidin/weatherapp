
import Foundation
import CoreLocation
import MapKit

struct Coordinate {
    let latitude:   Double
    let longitude:  Double
    
    /*
    init(latitude: Double, longitude: Double) {
        self.latitude  = latitude
        self.longitude = longitude
    }
     */
}

extension Coordinate: CustomStringConvertible {
    
    var description: String {
        return "\(latitude),\(longitude)"
    }
    
    static var currentLocation: Coordinate {
        let vc = ViewController()
        let coordinates = vc.getCoordinates().coordinate
        return Coordinate(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    static var coordinateObject: CLLocation? {
        let vc = ViewController()
        return vc.getCoordinates()
    }
    
}
