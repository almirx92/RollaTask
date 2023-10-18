//
//  MainView.swift
//  RollaTask
//


import SwiftUI

struct MainView: View {
    init(){
        UITabBar.appearance().backgroundColor = UIColor(.purple)
    }
    var body: some View {
        TabView{
            ScanView().tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }
            TrackView().tabItem{
                Image(systemName: "person")
                Text("Person")
            }
            FilterView().tabItem{
                Image(systemName: "tray")
                Text("Filter")
            }
            
        }.tint(.white)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
