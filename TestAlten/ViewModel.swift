//
//  ViewModel.swift
//  TestAlten
//
//  Created by Jose Fumanal Quintana on 2/7/21.
//

import SwiftUI

class ViewModel {
    
    // Data
    @State var peopleList: [Model] = [
        Model(id: 0, code: 1001, name: "Juan", phoneNumber: "612345678", mail: "juan@gmail.com", visited: true),
        Model(id: 1, code: 1003, name: "Maria", phoneNumber: "601234567", mail: "maria@gmail.com", visited: false),
        Model(id: 2, code: 1002, name: "Jose", phoneNumber: "645612378", mail: "jose@gmail.com", visited: false),
        Model(id: 3, code: 1000, name: "Mireia", phoneNumber: "654890721", mail: "mireia@gmail.com", visited: true),
        Model(id: 4, code: 1005, name: "Natalia", phoneNumber: "613566784", mail: "natalia@gmail.com", visited: false),
        Model(id: 5, code: 1006, name: "Javier", phoneNumber: "621928376", mail: "javier@gmail.com", visited: true),
        Model(id: 6, code: 1007, name: "Franc", phoneNumber: "629034567", mail: "franc@gmail.com", visited: true),
        Model(id: 7, code: 1004, name: "Manuel", phoneNumber: "666123456", mail: "manuel@gmail.com", visited: false),
        Model(id: 8, code: 1010, name: "Marta", phoneNumber: "661234123", mail: "marta@gmail.com", visited: true),
        Model(id: 9, code: 1008, name: "Laura", phoneNumber: "698778954", mail: "laura@gmail.com", visited: true),
        Model(id: 10, code: 1009, name: "Luis", phoneNumber: "691112321", mail: "luis@gmail.com", visited: false),
        Model(id: 11, code: 1012, name: "Sandra", phoneNumber: "654123489", mail: "sandra@gmail.com", visited: false),
        Model(id: 12, code: 1011, name: "Raquel", phoneNumber: "6223344551", mail: "raquel@gmail.com", visited: false)
    ]
    
    // Func that converts String to a clickable phone Number
    func callPhoneNumber(phoneNumber: String) {
        let telephone = "tel://"
        let formattedString = telephone + phoneNumber
        guard let url = URL(string: formattedString) else { return }
        UIApplication.shared.open(url)
    }
    
    // Func that sorts list alphabetically
    func sortByName(peopleList: [Model]) -> [Model] {
        let newPeopleList = peopleList
        return newPeopleList.sorted(by: { $0.name < $1.name })

    }
    
    // Func that sorts list by code number
    func sortByCode(peopleList: [Model]) -> [Model] {
        let newPeopleList = peopleList
        return newPeopleList.sorted(by: { $0.code < $1.code })
    }
    
    // Func that filters list by visited.
    func filterVisited(peopleList: [Model]) -> [Model] {
        let newPeopleList = peopleList
        return newPeopleList.filter { $0.visited == true }
    }
    
    // Func that filters list by NO visited.
    func filterNoVisited(peopleList: [Model]) -> [Model] {
        let newPeopleList = peopleList
        return newPeopleList.filter { $0.visited == false }
    }
}

