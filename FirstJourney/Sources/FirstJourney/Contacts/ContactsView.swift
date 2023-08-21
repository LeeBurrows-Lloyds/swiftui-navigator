import SwiftUI

struct ContactsView: View {

    @ObservedObject private var state: ContactsScreenViewState
    private let viewModel: ContactsViewModel

    init(state: ContactsScreenViewState, viewModel: ContactsViewModel) {
        self.state = state
        self.viewModel = viewModel
    }

    let contacts = [
         "John",
         "Alice",
         "Bob",
         "Foo",
         "Bar"
     ]

    var body: some View {
        switch state.screenState {

        case .full:
            List(contacts, id: \.self) { contact in
                 Text(contact)
             }
        case .detail:
            VStack {
                
            }
        }
    }
}
