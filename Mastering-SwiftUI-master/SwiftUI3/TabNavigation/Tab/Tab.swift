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

struct Tab_Tutorials: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            SymbolScene(name: "star", color: Color.red, selectedIndex: $selectedIndex)
                .tabItem {
                    Label("star", systemImage: "star")
                }
                .tag(0)
            SymbolScene(name: "heart", color: Color.green, selectedIndex: $selectedIndex)
                .tabItem {
                    Label("heart", systemImage: "heart")
                }
                .tag(1)
            SymbolScene(name: "play", color: Color.blue, selectedIndex: $selectedIndex)
                .tabItem {
                    Label("play", systemImage: "play")
                }
                .tag(2)
        }
        .onChange(of: selectedIndex) { newValue in
            print(newValue)
        }
    }
}

struct Tab_Tutorials_Previews: PreviewProvider {
    static var previews: some View {
        Tab_Tutorials()
    }
}
