import SwiftUI

struct SearchBarModifier: ViewModifier {
    let searchBar: SearchBar
    
    func body(content: Content) -> some View {
        content.overlay(ViewControllerResolver { viewController in
            viewController.navigationItem.searchController = self.searchBar.searchController
        }.frame(width: 0, height: 0))
    }
}
