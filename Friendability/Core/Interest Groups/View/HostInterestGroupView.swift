//
//  HostInterestGroupView.swift
//  Friendability
//
//  Created by Kwan Ching Nam on 7/12/2023.
//

import SwiftUI

struct InterestGroup: Identifiable {
    var id = UUID()
    var name: String
    var time: String
    var description: String
}

class InterestGroupViewModel: ObservableObject {
    @Published var interestGroups: [InterestGroup] = []

    func addInterestGroup(name: String, time: String, description: String) {
        let newGroup = InterestGroup(name: name, time: time, description: description)
        interestGroups.append(newGroup)
    }
}

struct HostInterestGroupView: View {
    @StateObject private var viewModel = InterestGroupViewModel()
    @State private var isAddingGroup = false
    @State private var newName = ""
    @State private var newTime = ""
    @State private var newDescription = ""

    var body: some View {
        NavigationView {
            List(viewModel.interestGroups) { group in
                NavigationLink(destination: GroupDetailView(group: group)) {
                    VStack(alignment: .leading) {
                        Text(group.name)
                            .font(.headline)
                        Text(group.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Interest Groups")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Host Group") {
                        isAddingGroup.toggle()
                    }
                }
            }
            .sheet(isPresented: $isAddingGroup) {
                AddInterestGroupView(viewModel: viewModel, isAddingGroup: $isAddingGroup)
            }
        }
    }
}

struct AddInterestGroupView: View {
    @ObservedObject var viewModel: InterestGroupViewModel
    @Binding var isAddingGroup: Bool
    @State private var name = ""
    @State private var time = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Group Details")) {
                    TextField("Name", text: $name)
                    TextField("Time", text: $time)
                    TextField("Description", text: $description)
                }

                Section {
                    Button("Host Group") {
                        viewModel.addInterestGroup(name: name, time: time, description: description)
                        isAddingGroup = false
                    }
                }
            }
            .navigationTitle("Host Group")
            .navigationBarItems(trailing: Button("Cancel") {
                isAddingGroup = false
            })
        }
    }
}

struct GroupDetailView: View {
    let group: InterestGroup

    var body: some View {
        VStack {
            Text(group.name)
                .font(.title)
                .fontWeight(.bold)
            Text("Time: \(group.time)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(group.description)
                .font(.body)
                .padding()
        }
        .navigationTitle(group.name)
    }
}

struct HostInterestGroupView_Previews: PreviewProvider {
    static var previews: some View {
        HostInterestGroupView()
    }
}
