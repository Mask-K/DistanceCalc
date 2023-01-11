import Foundation

struct Places: Codable {
    let candidates: [Candidate]
}

struct Candidate: Codable {
    let geometry: Geometry
    let name: String
}

struct Geometry: Codable {
    let location: Location
}

struct Location: Codable {
    let lat, lng: Double
}

func getData() -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "Places", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
}