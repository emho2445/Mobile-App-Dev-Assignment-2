//
//  ContentView.swift
//  Assignment2
//
//  Created by Emma  Hopson on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MainPageView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            SecondPageView()
                .tabItem{
                    Label("Rabbit", systemImage: "hare")
                }
            
        }
        .accentColor(Color.white)
        
    }
}


struct MainPageView: View{
    
    @State var switched: Bool = false
    @State var switchedtwo: Bool = false
    
    
    var body: some View{
        ZStack {
            
            
            LinearGradient(colors: [.pink, .purple], startPoint: .topLeading, endPoint: .bottom)
                
            VStack{
                Spacer()
                    .frame(height: 50.0)
                Rectangle()
                    .frame(height: 5.0)
                
                Image("IMG_1800")
                    .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 200, height: 200, alignment: .top)
                                        .clipShape(Circle())
                
                Text("Emma")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                Rectangle()
                    .frame(height: 5.0)
                
                Text("Try to find the bunny")
//                HStack{
                        VStack{
                            //I tried to get the text above the toggle so that it fit but I wasn't able to figure
                            Toggle("Flip the Switch:", isOn: $switched)
                                .foregroundColor(Color.white)
                                .toggleStyle(SwitchToggleStyle(tint: .pink))
                            if switched{
                                Text("Not Here")
                                    .foregroundColor(Color.yellow)
                            }
                        }
//
//                        VStack{
//                            Toggle("Flip the Switch:", isOn: $switchedtwo)
//                                .foregroundColor(Color.white)
//                                .toggleStyle(SwitchToggleStyle(tint: .pink))
//                            if switchedtwo{
//                                Image("Boo")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .clipShape(Circle())
//                            }
//                        }
//                }
            }
                
                    
        }
        //.background(switched ? Color.orange : Color.purple)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SecondPageView: View{
    @State private var showSheet = false
    
    var body: some View{
        NavigationView{
            ZStack(content: {
                LinearGradient(colors: [.pink, .purple], startPoint: .topLeading, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    NavigationLink("Go To Next Page"){
                        ThirdPageView()
                    }
                    Spacer()
                        .frame(height: 50.0)
                    Button("Need Help?"){
                        showSheet = true
                    }
                    .sheet(isPresented: $showSheet){
                        SheetView()
                    }
                }

            })
            .navigationTitle("Second Page")
        }
        .foregroundColor(.white)
        
        
        
    }
}

struct ThirdPageView: View{
    @State private var showingAlert = false
    @State private var showBunny = false
    
    var body: some View{
            NavigationView{
                ZStack(content: {
                    LinearGradient(colors: [.pink, .purple], startPoint: .topLeading, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        Button("Click For Alert"){
                            showingAlert = true
                            showBunny = false
                        }
                        .foregroundColor(.white)
                        .alert("Click 'Yes' for surprise", isPresented:$showingAlert){
                            Button("No", role: .cancel){}
                            Button("Yes", role: .none) {
                                showBunny = true
                            }
                        }
                        
                        if showBunny == true{
                            Spacer()
                                .frame(height: 50.0)
                            Text("You found him!")
                            Image("Boo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                        }
                        
                        
                        
                        
                    }
                    
                    
                    
                    

                })
                .navigationTitle("Third Page")
            }
            
    }
}

struct SheetView: View{
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        Text("Press 'Go To Next Page' to keep looking ")
            .foregroundColor(.purple)
        
        Spacer()
            .frame(height: 50.0)
        
        Button("Hide Sheet"){
            dismiss()
        }
        .foregroundColor(.pink)
    }
}
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
