//
//  SearchBar.swift
//  SwiftUI-SearchInList
//
//  Created by Arpit Dixit on 01/08/21.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text: String
        
        init(_ text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator($text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchbar = UISearchBar(frame: .zero)
        searchbar.delegate = context.coordinator
        return searchbar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}
