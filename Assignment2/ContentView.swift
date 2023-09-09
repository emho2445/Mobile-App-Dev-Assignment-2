//
//  ContentView.swift
//  Assignment2
//
//  Created by Emma  Hopson on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var switched: Bool = false
    @State var switchedtwo: Bool = false
    
    var body: some View {
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
                
                HStack{
                        
                        VStack{
                            //I tried to get the text above the toggle so that it fit but I wasn't able to figure
                            Toggle("Flip the Switch:", isOn: $switched)
                                .foregroundColor(Color.white)
                                .toggleStyle(SwitchToggleStyle(tint: .pink))
                            if switched{
                                Text("Button Switched")
                                    .foregroundColor(Color.indigo)
                            }
                        }
                  
                        VStack{
                            Toggle("Flip the Switch:", isOn: $switchedtwo)
                                .foregroundColor(Color.white)
                                .toggleStyle(SwitchToggleStyle(tint: .pink))
                            if switchedtwo{
                                Image("Boo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                            }
                        }
                }
            }
                
                    
        }
        //.background(switched ? Color.orange : Color.purple)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
