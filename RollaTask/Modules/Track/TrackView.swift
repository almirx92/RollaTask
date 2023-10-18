//
//  TrackView.swift
//  RollaTask
//


import SwiftUI

struct TrackView: View {
    @ObservedObject var gpsTracker = GPSTrackerManager()
    @State var isTracking = false
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading) {
                                Text("Current speed:")
                                    .font(.system(.title))
                                Text("\(gpsTracker.currentSpeed.toString(decimal: 2)) m/s")
                                    .font(.system(.title))
                                    .foregroundColor(.purple)
                            }
                        }
                        Spacer()
                    }
                    VSpacer(16)
                    HStack {
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading) {
                                Text("Traveled distance:")
                                    .font(.system(.title))
                                Text("\(gpsTracker.traveledDistance.toString(decimal: 2)) meters")
                                    .font(.system(.title))
                                    .foregroundColor(.purple)
                            }
                        }
                        Spacer()
                    }
                }
                .padding()
                Spacer()
                VStack{
                    LottieView(animationName: "gps-tracker", loopMode: .loop)
                        .frame(width: 100, height: 100)
                        .scaleEffect(0.4)
                }
                Spacer()
                VStack{
                    PrimaryButton(buttonLabel: isTracking ? "Stop Tracking" : "Start Tracking", color: .purple){
                        isTracking ? gpsTracker.startTracking() : gpsTracker.stopTracking()
                        isTracking.toggle()
                    }
                }.padding()
                
            }.navigationTitle("GPS Tracker")
        }
    }
}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView()
    }
}
