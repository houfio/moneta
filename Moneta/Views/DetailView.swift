import SwiftUI

struct DetailView: View {
    @EnvironmentObject var data: DataService
    var id: Int
    var name: String

    var body: some View {
        VStack {
            if !false {
                ScrollView {
                    Text("\(id)")
                }
            } else {
                ProgressView()
            }
        }
            .navigationTitle(name)
            .navigationBarItems(trailing: Refresh(loading: false) {
                data.fetchCryptocurrency(id: id)
            })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: 1, name: "Bitcoin")
    }
}
