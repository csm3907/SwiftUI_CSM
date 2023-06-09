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

struct CustomizingList: View {
    var body: some View {
        VStack {            
            List {
                Section() {
                    Text("Hello, List!")
                    Text("List Row Insets")
                    Text("List Row Background")
                        .listRowSeparator(.hidden)
                    Text("List Row Separator")
                        .listRowInsets(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 0))
                    Text("List Row Separator Tint")
                        .listRowBackground(Color.yellow)
                        .listRowSeparatorTint(.blue)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 0))
                
                Section() {
                    Text("One")
                    Text("Two")
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 0))
                
                Section() {
                    Text("Custom Header")
                } header: {
                    CustomHeaderView(title: "Third", imageName: "pencil")
                }
                
            }
        }
    }
}

struct CustomizingList_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingList()
    }
}
