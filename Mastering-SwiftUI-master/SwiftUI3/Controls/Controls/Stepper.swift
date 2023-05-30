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

struct Stepper_Tutorials: View {
    @State private var quantity = 1
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            Text("\(quantity)")
                .font(.system(size: 150))
                .disabled(isEditing)
            
            Stepper("Quantity", value: $quantity, in: 0...100, step: 1) { isChanged in
                isEditing = isChanged
            }
            .padding()
            
            Stepper("Quantity2", value: $quantity)
                .padding()
            
            Stepper("Quantity3") {
                quantity = (quantity + 1)
                
                if quantity > 5 {
                    quantity = 1
                }
            } onDecrement: {
                quantity -= 1
                
                if quantity < 1 {
                    quantity = 5
                } 
            }
            .padding()
            
            Stepper("Quantity Test", value: $quantity)
                .padding()
                .labelsHidden()
            
        }
    }
}

struct Stepper_Previews: PreviewProvider {
    static var previews: some View {
        Stepper_Tutorials()
    }
}
