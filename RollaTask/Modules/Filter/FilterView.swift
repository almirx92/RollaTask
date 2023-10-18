//
//  FilterView.swift
//  RollaTask
//


import SwiftUI

struct FilterView: View {
    @StateObject var sortVM = SortViewModel()
    @State var isSorting = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    if sortVM.isSorting {
                        ProgressView("Sorting...")
                            .progressViewStyle(CircularProgressViewStyle(tint: .purple))
                    } else {
                        PrimaryButton(buttonLabel: "Sort \(sortVM.sortType.title)", color: .purple) {
                            sortVM.isSorting = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                sortVM.generateAndSortCollection(sortType: sortVM.sortType)
                            }
                            sortVM.toggleSortType()
                        }
                        .padding()
                    }
                }
                .frame(minHeight: 56)
                
                Text("Time Taken: \(sortVM.sortingTime) seconds")
                    .padding()
                
                VStack {
                    List(sortVM.firstTenInArray, id: \.self) { element in
                        Text(String(element))
                    }
                }
            }
            .navigationTitle("Sorting")
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}

