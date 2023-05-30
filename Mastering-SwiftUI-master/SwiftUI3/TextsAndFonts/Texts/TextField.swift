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


enum FieldType: Hashable {
    case email
    case password
}

struct TextField_Tutorials: View {
    @State private var email: String = ""
    @State private var password: String = ""    
    @State private var showJoinAlert = false
    @State private var showInputAlert = false
    
    
    //@FocusState private var emailFocused: Bool
    //@FocusState private var passwordFocused: Bool
    
    @FocusState private var focusedField: FieldType?
    
    
    var body: some View {
        Form {
            Section {
                TextField("Email", text: $email, prompt: Text("Input Email"))
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .focused($focusedField, equals: .email)
                    .submitLabel(.next)
                    .onSubmit {
                        focusedField = .password
                    }
                
                SecureField("Password", text: $password, prompt: Text("Input Password"))
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .focused($focusedField, equals: .password)
                    .submitLabel(.done)
                    .onSubmit {
                        if email.isEmpty {
                            showInputAlert = true
                        } else {
                            showJoinAlert = true
                            focusedField = nil
                        }
                    }
                    
            }
            
            Section {
                Button {
                    if email.isEmpty {
                        showInputAlert = true
                    } else {
                        showJoinAlert = true
                        focusedField = nil
                    }
                } label: {
                    Text("회원가입")
                }
                .frame(maxWidth: .infinity)
                .alert("회원가입", isPresented: $showJoinAlert) {
                    Button {
                        email = ""
                        password = ""
                    } label: {
                        Text("확인")
                    }
                } message: {
                    Text("계정: \(email)\n비밀번호: \(password)")
                }
                .alert("경고", isPresented: $showInputAlert) {
                    Button {
                        focusedField = .email
                        
                    } label: {
                        Text("확인")
                    }
                } message: {
                    Text("이메일을 입력해 주세요")
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                focusedField = .email
            }
        }
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        TextField_Tutorials()
    }
}
