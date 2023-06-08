//
//  Mastering SwiftUI
//  Copyright (c) KxCoding <help@kxcoding.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import SwiftUI
import CoreData

struct MemberList: View {
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\MemberEntity.name, order: .forward)])
    var members: FetchedResults<MemberEntity>
    
    @State private var showComposer = false
    @State private var editTarget: MemberEntity?
    
    @State private var selectedSortType = SortType.types[0].id
    @State private var keyword = ""
    
    @Environment(\.managedObjectContext) var context
    
    func delete(at rows: IndexSet) {
        rows.forEach { index in
            context.delete(members[index])
        }
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
        
    var body: some View {
        List {
            ForEach(members) { member in
                Button {
                    editTarget = member
                } label: {
                    HStack {
                        Text(member.name!)
                            .foregroundColor(.primary)
                        Spacer()
                        Text("\(member.age)")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .onDelete(perform: delete(at:))
        }
        .searchable(text: $keyword)
        .onChange(of: keyword, perform: { newValue in
            members.nsPredicate = newValue.isEmpty ? nil : NSPredicate(format: "name CONTAINS[c] %@", newValue)
        })
        .onChange(of: selectedSortType, perform: { newValue in
            let t = SortType.types.first { t in t.id == newValue } ?? SortType.types[0]
            
            members.sortDescriptors = t.descriptors
        })
        .sheet(item: $editTarget, content: { target in
            MemberCompose(editTarget: target)
        })
        .sheet(isPresented: $showComposer, content: {
            MemberCompose(editTarget: nil)                
        })
        .toolbar {
            ToolbarItem(placement: placement) {
                Button {
                    showComposer = true
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
            
            ToolbarItem(placement: placement) {
                #if os(iOS)
                Menu {
                    Picker("", selection: $selectedSortType) {
                        ForEach(SortType.types) { type in
                            Text(type.title)
                        }
                    }
                } label: {
                    Label("Sort", systemImage: "arrow.up.arrow.down")
                }
                #else
                Picker("Sort", selection: $selectedSortType) {
                    ForEach(SortType.types) { type in
                        Text(type.title)
                    }
                }
                #endif
            }
        }
    }
    
    var placement: ToolbarItemPlacement {
        #if os(macOS)
        .automatic
        #else
        .navigationBarTrailing
        #endif
    }
}

struct MemberList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MemberList()                
                .navigationTitle("Members")
                .environment(\.managedObjectContext, CoreDataManager.shared.mainContext)
        }
    }
}
