//
//  ContentView.swift
//  SwiftUI-SearchInList
//
//  Created by Arpit Dixit on 01/08/21.
//

import SwiftUI

struct ContentView: View {
    @State private var searchTerm = ""
    let names = ["Arpit", "Abhishek", "Akshay", "Satyam", "Narayan", "Amit"]
    var body: some View {
        VStack {
            SearchBar(text: $searchTerm)
            List(names.filter {
                searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchTerm)
            }, id: \.self) { name in
                Text(name)
                    .font(.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
