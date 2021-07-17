//
//  ContentView.swift
//  RecipeListApp
//
//  Created by James Goldston on 7/14/21.
//

import SwiftUI




struct RecipeListView: View {
    
    @ObservedObject var model = recipeModel()
    
    var body: some View {
        
        NavigationView {
            List(model.recipes) { r in
                
                NavigationLink(
                    destination: recipeDetailView(recipe: r),
                    label: {
                        HStack(spacing: 20.0) {
                            Image(r.image).resizable().scaledToFill().frame(width: 50, height: 50, alignment: .center).clipped().cornerRadius(10.0)
                            Text(r.name)
                            
                            
                        }
                    })
                
                
                
            }.navigationTitle("All Recipes")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
