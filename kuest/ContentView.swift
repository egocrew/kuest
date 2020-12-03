//
//  ContentView.swift
//  kuest
//
//  Created by 양지수 on 2020/12/03.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var view: ViewFlag = viewFlag
    
    @ViewBuilder
    var body: some View {
//        Group {
//            if view.sign {
//                MainView(view:view)
//            }else{
                SignView(view:view)
//            }
//        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
