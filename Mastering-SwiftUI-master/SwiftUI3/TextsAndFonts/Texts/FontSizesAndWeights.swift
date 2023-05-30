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

struct FontSizesAndWeights: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("50pt Font")
                .font(.system(size: 50))
            
            
            Text("Black")
                .font(.system(size: 50, weight: .black, design: .default))
            
            
            Text("Heavy")
                .font(.system(size: 50, weight: .heavy, design: .default))
            
            Text("Bold")
                .font(.system(size: 50, weight: .bold, design: .default))
            
            Text("Semibold")
                .font(.system(size: 50, weight: .semibold, design: .default))
            
            Text("Medium")
                .font(.system(size: 50, weight: .medium, design: .default))
            
            Text("Regular")
                .font(.system(size: 50, weight: .regular, design: .default))
            
            Text("Light")
                .font(.system(size: 50, weight: .light, design: .default))
            
            Text("Thin")
                .font(.system(size: 50, weight: .thin, design: .default))
            
            Text("Ultra Light")
                .font(.system(size: 50))
                .fontWeight(.ultraLight)
            
        }
    }
}

struct FontSizesAndWeights_Previews: PreviewProvider {
    static var previews: some View {
        FontSizesAndWeights()
    }
}
