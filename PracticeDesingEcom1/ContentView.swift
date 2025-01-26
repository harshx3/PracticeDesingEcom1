//
//  ContentView.swift
//  PracticeDesingEcom1
//
//  Created by Harsh Makwana on 1/25/25.
//

import SwiftUI

struct ContentView: View {
    @State var cartCount: Int = 0
    var body: some View {
        VStack {
            
            NavbarView(cartCount: $cartCount)
            ContentView(cartCount: $cartCount)
            Button(action:{
                cartCount = 0
            },
                   label:{
                Text("Reset Cart")
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal, 100)
                    .background(Color.blue)
                    .cornerRadius(10)
            })
            Spacer()
        }
    }
    
    
    
    
    
    //navbar view
        struct NavbarView: View {
            @Binding var cartCount: Int
            var body: some View {
//                navbar
                         HStack {
                             Image(systemName: "inset.filled.tophalf.bottomhalf.rectangle")
                             Spacer()
                             Image(systemName: "cart")
                                 .padding(.horizontal, 20)
                                 .overlay(
                                    ZStack {
                                        Circle()
                                            .fill(.primary)
                                            .frame(width:20, height: 20)
                                        Text("\(cartCount)")
                                            .font(.caption)
                                            .foregroundStyle(.white)
                                    }
                                        .offset(x:13,y:-13)
                                 )
                                
                                 
                                 
                             Image(systemName: "person")
                         }
                         .foregroundStyle(.blue)
                         .padding(.horizontal, 30)
                         .font(.largeTitle)
            }
        }
    
    
    struct ContentView: View {
        @Binding var cartCount: Int
        var body: some View {
            ScrollView {
                VStack {
                    ForEach(0..<10) { index in
                        VStack {
                            Rectangle()
                                .fill(.blue)
                                .frame(width: 350, height: 200)
                                .cornerRadius(20)
                                .padding()
                            HStack {
                                Spacer()
                                Text("Product Name")
                                Spacer()
                                Text("Product Price")
                                Spacer()
                            }
                            .font(.title2)
                            .fontWeight(.bold)
                            
                          
                            Button(action: {
                                cartCount = cartCount + 1
                            }) {
                                Text("Add to Cart")
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background(.blue)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
            .padding(.top, 20)
        }
    }
    
    
    
}

#Preview {
    ContentView()
}
