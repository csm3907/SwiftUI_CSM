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

struct MultiSelection: View {
    var items = AppleProduct.sampleList
    
    @State private var selected: Set<AppleProduct> = []
    
    var body: some View {
        VStack {
            Text("\(selected.count) item(s) selected")
                .font(.title)
            
            List(items, id: \.self) { item in
                Button {
                    if selected.contains(item) {
                        selected.remove(item)
                    } else {
                        selected.insert(item)
                    }
                } label: {
                    if selected.contains(item) {
                        HStack {
                            Text(item.name)
                            Spacer()
                            Image(systemName: "checkmark")
                        }
                    } else {
                        Text(item.name)
                    }
                }
            }
            
        }
        .toolbar {
            #if os(iOS)
            EditButton()
            #endif
        }
    }
}

struct MultiSelection_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MultiSelection()
        }
    }
}
