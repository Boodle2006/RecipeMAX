//
//  recipeDetailView.swift
//  RecipeListApp
//
//  Created by James Goldston on 7/15/21.
//

import SwiftUI

struct recipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                //MARK: recipe image
                Image(recipe.image).resizable().scaledToFill()
                
                //MARK: recipe ingredients
                
                VStack(alignment: .leading) {
                    Text("Ingredients").font(.headline).padding(.bottom, 5.0)
                    
                    ForEach(recipe.ingredients, id: \.self) {
                        r in
                        Text("• " + r).padding(.bottom, 3)
                    }
                }
                
                //MARK: divider
                
                Divider()
                
                //MARK: recipe directions
                VStack(alignment: .leading) {
                    
                    Text("Directions").font(.headline).padding(.top)
                    ForEach(recipe.directions, id: \.self) { item in
                        
                        Text(item).padding(.bottom, 5).fixedSize(horizontal: false, vertical: true)
                        
                    }
                    
                }
            }
        }.navigationBarTitle(recipe.name)
    }
}

struct recipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //create a dummy recipe to pass into the detail view to see a preview
        
        let model = recipeModel()
        recipeDetailView(recipe: model.recipes[0])
    }
}
