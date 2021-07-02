//
//  ContentView.swift
//  TestAlten
//
//  Created by Jose Fumanal Quintana on 2/7/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // State buttons
    @State private var isSelectedNameSort = false
    @State private var isSelectedCodeSort = false
    @State private var isSelectedVisitedSort = 0
    
    // Opacity buttons
    @State private var nameButtonOpacity = 0.3
    @State private var codeButtonOpacity = 0.3
    @State private var visitedButtonOpacity = 0.3
    
    // State background color of Visited / No visited button
    @State private var backgroundColorButtonVisited: Color = .black

    // ViewModel instance
    private var viewModel = ViewModel()
    
    // Final People List
    private var finalPeopleList: [Model] {
        if isSelectedNameSort {
            return viewModel.sortByName(peopleList: viewModel.peopleList)
        } else if isSelectedCodeSort {
            return viewModel.sortByCode(peopleList: viewModel.peopleList)
        } else if isSelectedVisitedSort == 1 {
            return viewModel.filterVisited(peopleList: viewModel.peopleList)
        } else if isSelectedVisitedSort == 2 {
            return viewModel.filterNoVisited(peopleList: viewModel.peopleList)
        }
        
        return viewModel.peopleList
    }
   
    var body: some View {
        NavigationView {
            ZStack {
                List(finalPeopleList) { people in
                    Group{
                        NavigationLink(destination:
                                        Button(action: {
                                            viewModel.callPhoneNumber(phoneNumber: people.phoneNumber)
                                        }) {
                                            Text(people.phoneNumber)
                                        }) {
                            
                            HStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 15, height: 15, alignment: .center)
                                    .foregroundColor(people.visited ? .green : .red)
                                
                                VStack {
                                    Text(String(people.code))
                                    Text(people.name)
                                }
                            }
                            
                            HStack{
                                Text(people.mail)
                                Spacer()
                                Text(people.phoneNumber)
                            }
                        }
                    }.frame(height: 100)
                    
                }.navigationBarTitle("People")
                .navigationBarItems(trailing:
                                        HStack{

                                            // Sorted by Name Button
                                            Button(action: {
                                                switch isSelectedNameSort {
                                                case false:
                                                    isSelectedNameSort = true
                                                    isSelectedCodeSort = false
                                                    isSelectedVisitedSort = 0

                                                    nameButtonOpacity = 1
                                                    codeButtonOpacity = 0.3
                                                    visitedButtonOpacity = 0.3
                                                    backgroundColorButtonVisited = .black
                                                default:
                                                    isSelectedNameSort = false
                                                    nameButtonOpacity = 0.3
                                                }
                                            })
                                            {
                                                RoundedRectangle(cornerRadius: 30)
                                                    .frame(width: 100, height: 35, alignment: .center)
                                                    .opacity(nameButtonOpacity)
                                                    .overlay(Text("Name")
                                                                .font(Font.custom("", size: 20))
                                                                .foregroundColor(.white)
                                                                .padding())
                                                    .foregroundColor(.black)
                                            }
                                            
                                            // Sorted by Code Button
                                            Button(action: {
                                                switch isSelectedCodeSort {
                                                case false:
                                                    isSelectedCodeSort = true
                                                    isSelectedNameSort = false
                                                    isSelectedVisitedSort = 0
                                                    
                                                    codeButtonOpacity = 1
                                                    nameButtonOpacity = 0.3
                                                    visitedButtonOpacity = 0.3
                                                    backgroundColorButtonVisited = .black
                                                
                                                default:
                                                    isSelectedCodeSort = false
                                                    codeButtonOpacity = 0.3
                                                }
                                                
                                            })
                                            {
                                                RoundedRectangle(cornerRadius: 30)
                                                    .frame(width: 100, height: 35, alignment: .center)
                                                    .opacity(codeButtonOpacity)
                                                    .overlay(Text("Code")
                                                                .font(Font.custom("", size: 20))
                                                                .foregroundColor(.white)
                                                                .padding())
                                                    .foregroundColor(.black)
                                            }
                                            
                                            // Sorted by Visited / No visited button
                                            Button(action: {
                                                switch isSelectedVisitedSort {
                                                case 0:
                                                    isSelectedVisitedSort = 1
                                                    isSelectedNameSort = false
                                                    isSelectedCodeSort = false
                                                    
                                                    visitedButtonOpacity = 1
                                                    codeButtonOpacity = 0.3
                                                    nameButtonOpacity = 0.3
                                                    backgroundColorButtonVisited = .green
                                                case 1:
                                                    isSelectedVisitedSort = 2
                                                    visitedButtonOpacity = 1
                                                    backgroundColorButtonVisited = .red
                                                case 2:
                                                    isSelectedVisitedSort = 0
                                                    visitedButtonOpacity = 0.3
                                                    backgroundColorButtonVisited = .black
                                                default:
                                                    break
                                                }
                                               
                                            })
                                            {
                                                RoundedRectangle(cornerRadius: 30)
                                                    .frame(width: 100, height: 35, alignment: .center)
                                                    .opacity(visitedButtonOpacity)
                                                    .overlay(Text("V/NV")
                                                                .font(Font.custom("", size: 20))
                                                                .foregroundColor(.white)
                                                                .padding())
                                                    .foregroundColor(backgroundColorButtonVisited)
                                            }
                                        }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
