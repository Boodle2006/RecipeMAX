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
    
}
