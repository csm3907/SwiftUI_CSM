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

struct Color_Tutorials: View {
    var body: some View {
        VStack {
            Text("Color")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            Color.blue
            Color.yellow
            Color.cyan
            
            Color(.sRGB, red: 70/255, green: 70/255, blue: 70/255, opacity: 1)
            
            Color(uiColor: UIColor(red: 70/255, green: 70/255, blue: 70/255, alpha: 1))
            
            Color("MyColor") // 
        }
        .background(Color(.systemBackground)) // dark Mode, light Mode의 background 먹이기
        
    
    }
}

struct Color_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Color_Tutorials()
            Color_Tutorials()
                .preferredColorScheme(.dark)
        }
    }
}
