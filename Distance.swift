import Foundation

struct Coords{
  var lat = 48.471207
  var lng = 35.038810
}


class Distance{
  private var places: Places
  private var Apriorit = Coords()
  private var dists: [(String, Double)] = []
  private func toRad(len: inout Double){
    len *= Double.pi / 180
  }
  private func dist(coord: inout Coords) -> Double{
    toRad(len: &coord.lat)
    toRad(len: &coord.lng)
    let dlong = Apriorit.lng - coord.lng
    let dlat = Apriorit.lat - coord.lat
    
    

    var res = pow(sin(dlat/2), 2) + cos(Apriorit.lat) * cos(coord.lat) * pow(sin(dlong/2), 2)
    let R : Double = 6371;
    res = 2 * asin(sqrt(res)) * R
    return res
  }

  
  init(){
    places = try! JSONDecoder().decode(Places.self, from: getData()!)
    toRad(len: &Apriorit.lat)
    toRad(len: &Apriorit.lng)
  }
  func printAnsw(){
    for (name, dis) in dists{
      print("\(name) is \(dis) km away from Apriorit")
    }
  }

  func Calculate(len: Double){
    dists.removeAll()
    for val in places.candidates{
      var coord = Coords() 
      coord.lat = val.geometry.location.lat
      coord.lng = val.geometry.location.lng
      
      let dis = round(dist(coord: &coord) * 1000) / 1000.0
      if(dis <= len){
        dists.append((val.name, dis))
      }
    }   
  }
  
}