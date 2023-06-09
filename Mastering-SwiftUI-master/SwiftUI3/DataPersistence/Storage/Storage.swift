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

struct Storage_Tutorials: View {
    @SceneStorage("number") private var number = 0
    @AppStorage("color") private var color = Color.yellow
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(number, format: .number)
                .font(.system(size: 100))
                .frame(width: 300, height: 300)
                .background(color)
                .clipShape(Circle())
            
            Spacer()
            
            HStack {
                Button {
                    number = Int.random(in: 0 ... 100)
                } label: {
                    Label("Number", systemImage: "repeat")
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    color = [Color.red, .green, .blue, .yellow, .mint, .brown, .cyan, .indigo, .orange].randomElement()!
                } label: {
                    Label("Color", systemImage: "paintbrush")
                        .padding()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct AppStorage_Previews: PreviewProvider {
    static var previews: some View {
        Storage_Tutorials()
    }
}
