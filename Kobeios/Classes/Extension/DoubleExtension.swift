//
//  DoubleExtension.swift
//  Alamofire
//
//  Created by Rodrigo Leite on 8/30/18.
//

import Foundation

public extension Double {
    
    public static func formatPoints(num: Double) ->String{
        var thousandNum = num/1000
        var millionNum = num/1000000
        if num >= 10000 && num < 100000 {
            if(floor(thousandNum) == thousandNum){
                return("\(Int(thousandNum))k")
            }
            return("\(thousandNum.roundToPlaces(places: 1))k")
        }
      if num >= 100000 && num < 1000000 {
         return("\(Int(thousandNum))k")
      }
        if num > 1000000{
            if(floor(millionNum) == millionNum){
                return("\(Int(thousandNum))k")
            }
            return ("\(millionNum.roundToPlaces(places: 1))M")
        }
        else{
            if(floor(num) == num){
                return ("\(Int(num))")
            }
            return ("\(num)")
        }
    }
    
    /// Rounds the double to decimal places value
    mutating func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
    
    var formatCurrency: String {
        let formatter = NumberFormatter()        
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        formatter.alwaysShowsDecimalSeparator = false
        return formatter.string(for: self) ?? ""
    }


}
