import SwiftUI

struct DetailView: View {
    @EnvironmentObject var data: DataService
    var id: Int
    var name: String

    var body: some View {
        VStack {
            Text("\(id)")
            ProgressView()
        }
            .navigationTitle(name)
            .navigationBarItems(trailing: Refresh(loading: data.loading, action: {
                data.refreshCryptocurrency(id: id)
            }))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: 1, name: "Bitcoin")
    }
}
