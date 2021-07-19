//
//  ContentView.swift
//  RecipeListApp
//
//  Created by James Goldston on 7/14/21.
//

import SwiftUI




struct RecipeListView: View {
    
    @EnvironmentObject var model:recipeModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                
                Text("All Recipes").bold().font(.largeTitle)
                
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(
                                destination: recipeDetailView(recipe: r),
                                label: {
                                    HStack(spacing: 20.0) {
                                        Image(r.image).resizable().scaledToFill().frame(width: 50, height: 50, alignment: .center).clipped().cornerRadius(10.0)
                                        Text(r.name).foregroundColor(.black)
                                        
                                        
                                    }
                                })
                            
                            
                            
                        }.navigationBarHidden(true)
                        
                    }.padding(.leading, 10)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(recipeModel())
    }
}
