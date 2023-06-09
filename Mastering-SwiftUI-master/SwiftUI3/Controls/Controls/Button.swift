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

struct Button_Tutorials: View {
    @State private var value = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Random Number")
                .font(.largeTitle)
            
            Text("\(value)")
                .font(.system(size: 200))
            
            Spacer()
            
            // #1
            
            Button {
                value = Int.random(in: 1...100)
            } label: {
                Image(systemName: "repeat")
                Text("Generate")
            }
            .padding()
            .buttonBorderShape(.roundedRectangle)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            
            
            // Title 을 넣어서 바로 출력하는 button
            Button("Generate Title") {
                value = Int.random(in: 1...100)
            }
            .padding()
            
            

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func generate() {
        value = Int.random(in: 1...100)
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        Button_Tutorials()
    }
}
