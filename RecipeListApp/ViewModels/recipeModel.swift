//
//  recipeModel.swift
//  RecipeListApp
//
//  Created by James Goldston on 7/14/21.
//

import Foundation

class recipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    
    
    init() {
        //create an instance of dataService and get the data
        let service = dataService()
        self.recipes = service.getLocalData()
        
        
        
        
    }
    
    static func Portion(ingredient: ingredients, recipeServings:Int, targetServingSize:Int ) -> String {
        
        var portion:String = ""
        var numerator = ingredient.num ?? 1
        var denomenator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            denomenator = denomenator * recipeServings
            numerator *= targetServingSize
            
            let divisor = Rational.greatestCommonDivisor(numerator, denomenator)
            
            numerator /= divisor
            denomenator /= divisor
            
            if numerator >= denomenator {
                
                wholePortions = numerator / denomenator
                
                numerator = numerator % denomenator
                
                portion += String(wholePortions)
                
            }
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denomenator)"
            }
            if let unit = ingredient.unit {
                
                portion += ingredient.num == nil && ingredient.denom == nil ? "": " "
                
                return portion + unit
                
            }
        }
        
        
        
        
        return portion
    }
    
}
