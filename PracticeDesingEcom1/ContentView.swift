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
            DisplayContent(cartCount: $cartCount)
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
        
        @State var showProfile: Bool = false
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
                
                
                Button(action: {
                    showProfile.toggle()
                }, label: {
                    Image(systemName: "person")
                })
                
                .sheet(isPresented: $showProfile, content: {
                    ProfileScreen(showProfile: $showProfile)
                        .presentationDetents([.height(400)])
                        .animation(.smooth)
                       
                })
                
            }
            .foregroundStyle(.blue)
            .padding(.horizontal, 30)
            .font(.largeTitle)
        }
    }
    
    struct ProfileScreen: View {
        @Binding var showProfile: Bool
        var body: some View {
            ZStack {
                
                
                VStack(spacing: 40) {
                    
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                        Text("John Doe")
                        
                    }
                    
                    VStack {
                        
                        Text("Account Details")
                        Divider()
                            .frame(width:200)
                            .background(.gray)
                            
                        Text("Manage Subscription")
                        Divider()
                            .frame(width:200)
                            .background(.gray)
                        Text("Orders")
                        Divider()
                            .frame(width:200)
                            .background(.gray)
                        Text("Logout")
                            .fontWeight(.semibold)
                            .foregroundStyle(.red)
                    }
                    .font(.title)
                    
                }
                .fontDesign(.monospaced)
                .cornerRadius(10)
                .shadow(radius: 10)
                
                Button(action:{
                    showProfile = false
                }, label:{
                    Image(systemName: "xmark")
                        .font(.title)
                        .padding(5)
                        .foregroundStyle(.red)
                        .background(Color.blue)
                        .cornerRadius(50)
//                        .offset(x: -180, y:-150)
                    //here offset was causing error that button was not working coz offset was setting button out of clickable area so used position instead
                        .position(x:50, y:50)
                })
            }
        
            
        }
    }
    
    
    struct DisplayContent: View {
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
