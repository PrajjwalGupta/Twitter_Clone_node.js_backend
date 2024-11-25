//
//  MainView.swift
//  Twitter_Clone_node
//
//  Created by Prajjwal Gupta on 22/11/24.
//

import SwiftUI

struct MainView: View {
    
    let user: User
    
    @State var width = UIScreen.main.bounds.width - 90
    @State var x = -UIScreen.main.bounds.width + 90
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                    VStack {
                        TopBarView(x: $x)
                        Home()
                            
                    }
                    .offset(x: x + width)
                    .opacity(x == 0 ? 0.5 : 1)
                    SideMenu()
                        .shadow(color: Color.black.opacity(x != 0 ? 0 : 0.2), radius: 5.0, x: 5, y: 0)
                        .offset(x: x)
                        .background(Color.black.opacity(x == 1 ? 0.5 : 0))
                        .ignoresSafeArea(.all, edges: .vertical)
                        .onTapGesture {
                            withAnimation {
                                x = -width
                            }
                        }
                }).gesture(DragGesture().onChanged({ (value) in
                    withAnimation {
                        if value.translation.width > 0 {
                            if x < 0 {
                                x = -width + value.translation.width
                            } else {
                                if x != -width {
                                    x = value.translation.width
                                }
                            }
                        }
                    }
                }).onEnded({ (value) in
                    withAnimation {
                        if -x < width / 2 {
                            x = 0
                        } else {
                            x = -width
                        }
                    }
                   }))
            }
        }.navigationBarHidden(true)
            .navigationBarTitle("")
    }
}

//#Preview {
//    MainView()
//}
