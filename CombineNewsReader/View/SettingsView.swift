import SwiftUI

fileprivate struct SettingsBarItems: View {
    let add: () -> Void
    var body: some View {
        HStack(spacing: 20) {
            Button(action: add) {
                Image(systemName: "plus")
            }
            EditButton()
        }
    }
}

/// A settings view showing a list of filter keywrods.
struct SettingsView: View {
    
    @State var presentingAddKeywordSheet = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Filter keywords")) {
                    ForEach([FilterKeyword]()) { keyword in
                        HStack(alignment: .top) {
                            Image(systemName: "star")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .scaleEffect(0.67)
                                .background(Color.yellow)
                                .cornerRadius(5)
                            Text(keyword.value)
                        }
                    }
                    // List editing actions
                }
            }
            .sheet(isPresented: $presentingAddKeywordSheet) {
                AddKeywordView(completed: { newKeyword in
                    
                })
                .frame(minHeight: 0, maxHeight: 400, alignment: .center)
            }
            .navigationBarTitle(Text("Settings"))
            .navigationBarItems(trailing: SettingsBarItems(add: addKeyword))
        }
    }
    
    private func addKeyword() {
        
    }
    
    private func moveKeyword(from source: IndexSet, to destination: Int) {
        
    }
    
    private func deleteKeyword(at index: IndexSet) {
        
    }
}

#if DEBUG
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
#endif

