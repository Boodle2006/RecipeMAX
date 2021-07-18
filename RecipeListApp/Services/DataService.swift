//
//  DataService.swift
//  RecipeListApp
//
//  Created by James Goldston on 7/14/21.
//

import Foundation

class dataService {
    
        func getLocalData() -> [Recipe] {
        
        //parse the JSON file
        //get a URL for the JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //create a URL object
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            
            //create a data object
            
            let data = try Data(contentsOf: url)
            
            //decode the data with a JSON decoder
            
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //add unique IDs
                for r in recipeData {
                    r.id = UUID()
                    //add unique IDs to ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
            
                //return the recipes
                return recipeData
            }
            catch {
                print(error)
            }
            
            
        }
        catch {
            print(error)
        }
        
        return [Recipe]()
    }
    
}
