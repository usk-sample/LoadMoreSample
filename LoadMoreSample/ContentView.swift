//
//  ContentView.swift
//  LoadMoreSample
//
//  Created by Yusuke Hasegawa on 2020/12/05.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel = .init()
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                ForEach.init(self.viewModel.items, id: \.self) { value in
                    Text(value)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.init(white: 0.9).clipShape(RoundedRectangle(cornerRadius: 8))
                                        .shadow(radius: 4))
                        .padding(4)
                }
                
                if self.viewModel.canLoadMore { //さらに読み込める場合
                    Text("Loading ...")
                        .padding()
                        .onAppear {
                            //表示された時にさらに読み込む処理を行う
                            debugPrint("onAppear")
                            self.viewModel.loadMore()
                        }
                }

            }

        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
