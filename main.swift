import Foundation

var dist = Distance() 
print("Enter distance to check or type quit to stop program")

while(true){
  let str = readLine()
  if str == "quit"{
    break
  }
  let len = Double(str!)
  if len == nil{
    print("Wrong input! Try again")
  }
  dist.Calculate(len: len!)
  dist.printAnsw()
  print("Enter new distance (in km)")
}


