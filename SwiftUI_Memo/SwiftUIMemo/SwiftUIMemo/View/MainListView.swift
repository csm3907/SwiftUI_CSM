//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by USER on 2023/05/22.
//

import SwiftUI

struct MainListView: View {
    
    //@EnvironmentObject var store: MemoStore // 이전에 environmentObject로 등록한 instance 를 가져오는 것이다. (Type이 같으면)
    
    @EnvironmentObject var manager: CoreDataManager
    
    @EnvironmentObject var navigationState: NavigationState
    
    @State private var showComposer: Bool = false
    
    @State private var keyword = ""
    
    @State private var sortByDateDesc = true
    
    // Fetch를 하는 신규 문법
    // @FetchRequest 의 경우 View 안에서만 사용을 하여야 한다. 자동으로 Fetch 하여서 FetchResults 안에 저장을 한다.
    @FetchRequest(sortDescriptors: [SortDescriptor(\MemoEntity.insertDate, order: .reverse)])
    var memoList: FetchedResults<MemoEntity>
    
    var body: some View {
        NavigationView { // OS, Device에 따라 다르다 -> ipad 에서는 Split View 처럼 처리 되기도 한다.
            List {
//                ForEach(store.list) { memo in
//                    NavigationLink {
//                        DetailView(memo: memo)
//                    } label: {
//                        MemoCell(memo: memo)
//                    }
//                }
//                .onDelete(perform: store.delete) // For Each 안에 만들어 주어야 한다.
                
                ForEach(memoList) { memo in
                    NavigationLink {
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo)
                    }
                }
                .onDelete { indexSet in
                    delete(set: indexSet)
                }
                
                /*
                List(store.list) { memo in
                    NavigationLink { // Navigation 으로 Push 방식 이동을 할때 만들어 준다. List 내부에 있을 경우 > 화살표를 default로 생성
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo) // Command + Shift + A 로 embed in SubView를 통해서 바로 분리가 가능하다.
                    }
                }
                 */
            }
            #if os(iOS)
            .listStyle(.plain)
            #else
            .frame(minWidth: 320)
            #endif
            .navigationTitle("내 메모") // Modifier 로 View를 조작한다.
            .toolbar {
                HStack {
                    Button {
                        showComposer = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                    Button {
                        sortByDateDesc.toggle()
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                    }

                }
            }
            #if os(macOS)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button { // Side bar toggle 버튼을 신규로 만든다.
                        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
                    } label: {
                        Label("Toggole sidebar", image: "sidebar.left")
                    }
                }
            }
            #endif
            .sheet(isPresented: $showComposer) { // Modal 방식으로 present 하는 방법이다.
                ComposeView()
            }
            #if os(macOS)
            // side bar 안에 searchBar를 추가한다는 의미.
            .searchable(text: $keyword, placement: .sidebar, prompt: "메모를 검색합니다.") // search Bar 지정, Binding 만 해준다.
            #else
            .searchable(text: $keyword, prompt: "메모를 검색합니다.") // search Bar 지정, Binding 만 해준다.
            #endif
            
            .onChange(of: keyword) { newValue in
                if keyword.isEmpty {
                    memoList.nsPredicate = nil // 전체 메모 표시된다.
                } else {
                    // NSPredicate 의 경우 검색을 하는 문법으로 확인 된다.
                    memoList.nsPredicate = NSPredicate(format: "content CONTAINS[c] %@", newValue)
                }
            }
            .onChange(of: sortByDateDesc) { desc in
                if desc {
                    memoList.sortDescriptors = [
                        SortDescriptor(\.insertDate, order: .reverse)
                    ]
                } else {
                    memoList.sortDescriptors = [
                        SortDescriptor(\.insertDate, order: .forward)
                    ]
                }
            }
        }
        //.navigationViewStyle(.stack) // 이것이 있어서 iPhone과 iPad 가 동일하게 style이 push, pop 으로 설정이 되는 것이다.
        #if os(iOS)
        .id(navigationState.listId) // View 에 id를 추가 id가 바뀌면 View를 다시 그린다.
        #endif
        
        VStack {
            
            Text("내 메모를 탭한 다음 메모를 선택하거나\n새 메모를 추가할 수 잇어요")
                .multilineTextAlignment(.center)
            
            Button {
                showComposer = true
            } label: {
                Image(systemName: "plus")
            }
            .padding()
            .buttonStyle(.borderedProminent)

            
        }
        
    }
    
    func delete(set: IndexSet) {
        for index in set {
            manager.delete(memo: memoList[index])
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            //.environmentObject(MemoStore())
            .environmentObject(CoreDataManager.shared)
            .environment(\.managedObjectContext, CoreDataManager.shared.mainContext) // preview 에서도 추가를 해 주어야 정상적으로 CoreData 를 preview 에서도 test가 가능하다
            .environmentObject(NavigationState())
    }
}


