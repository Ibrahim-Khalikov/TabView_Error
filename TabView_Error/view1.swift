//
//  view1.swift
//  TabView_Error
//
//  Created by cloud_vfx on 03/10/22.
//

import SwiftUI

struct view1: View {
    
    @State var hideBar: Bool = false
    @State var currentTab : Int = 0
    
    var body: some View {
        
        VStack{
            
            if !hideBar {
                HStack{
                    Image("pin")
                        .padding(.trailing)
                    Text("Moscow , home 5/3")
                    
                    Spacer(minLength: 0)
                    
                    Image("filter")
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 50)
                .background(Color.blue)
            }
            
            TabView(selection: $currentTab){
                view2()
                    .tag(0)
                
                view3()
                    .tag(2)
            }
            
            ZStack{
                HStack{
                    
                    Button {
                        self.currentTab = 0
                        self.hideBar = false
                    } label: {
                        VStack{
                            Image(systemName: "house.fill")
                            
                            Text("Home")
                                .font(.system(size: 10))
                        }
                    }.foregroundColor(self.currentTab == 0 ? .white : .black)
                    
                    
                    Spacer(minLength: 12)
                    
                    
                    Button {
                        self.currentTab = 2
                        hideBar = true
                    } label: {
                        VStack{
                            Image(systemName: "person.fill")
                            
                            Text("Profil")
                                .font(.system(size: 10))
                        }
                    }.foregroundColor(self.currentTab == 2 ? .white : .black)
                    
                }
                .padding(.horizontal,50)
                .padding(.bottom, 16)
                .background(
                    CurvedShape()
                )
                
                NavigationLink(destination: view3()) {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .padding(15)
                        .font(.system(size: 28).bold())
                    
                }.background(Color.yellow)
                    .clipShape(Circle())
                    .offset(y: -30)
                    .shadow(radius: 3)
            }
            
            
        }.edgesIgnoringSafeArea(.bottom)
            .padding(.bottom,-5)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}


struct view1_Previews: PreviewProvider {
    static var previews: some View {
        view1()
    }
}



struct CurvedShape: View{
    var body: some View{
        
        Path { path in

            path.move(to: CGPoint(x:0, y:0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 55))

            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width / 2, y: 55 ), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            path.addLine(to: CGPoint(x: 0, y: 55))

        }.fill(Color.blue)
            .rotationEffect(.init(degrees: 180))
    }
}
