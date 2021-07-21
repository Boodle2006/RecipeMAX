//
//  recipeDetailView.swift
//  RecipeListApp
//
//  Created by James Goldston on 7/15/21.
//

import SwiftUI

struct recipeDetailView: View {
    
    @State var serving = 6
    
    var recipe:Recipe
    
    
    var body: some View {
        
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                //MARK: recipe image
                Image(recipe.image).resizable().scaledToFill()
                
                Text(recipe.name).bold().font(.largeTitle)
                
                //MARK: Picker
                VStack {
                Text("Select your serving size")
                Picker("", selection: $serving, content: {
                    
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                    
                }).pickerStyle(SegmentedPickerStyle())
                .frame(width: 160)
                }
                
                
                //MARK: recipe ingredients
                
                VStack(alignment: .leading) {
                    Text("Ingredients").font(.headline).padding(.bottom, 5.0)
                    
                    ForEach(recipe.ingredients) {
                        r in
                        Text("• " + recipeModel.Portion(ingredient: r, recipeServings: recipe.servings, targetServingSize: serving) + " " + r.name.lowercased()).padding(.bottom, 3)
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
        }
    }
}

struct recipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //create a dummy recipe to pass into the detail view to see a preview
        
        recipeTabView()
    }
}
