import SwiftUI

class SearchBar: NSObject, ObservableObject, UISearchResultsUpdating {
    @Published var text = ""

    let searchController = UISearchController(searchResultsController: nil)

    override init() {
        super.init()

        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
    }

    func updateSearchResults(for searchController: UISearchController) {
        if let searchBarText = searchController.searchBar.text {
            text = searchBarText
        }
    }
}

final class ViewControllerResolver: UIViewControllerRepresentable {
    let onResolve: (UIViewController) -> Void

    init(onResolve: @escaping (UIViewController) -> Void) {
        self.onResolve = onResolve
    }

    func makeUIViewController(context: Context) -> ParentResolverViewController {
        ParentResolverViewController(onResolve: onResolve)
    }

    func updateUIViewController(_ uiViewController: ParentResolverViewController, context: Context) {
    }
}

class ParentResolverViewController: UIViewController {
    let onResolve: (UIViewController) -> Void

    init(onResolve: @escaping (UIViewController) -> Void) {
        self.onResolve = onResolve

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }

    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)

        if let parent = parent {
            onResolve(parent)
        }
    }
}
