//
//  ViewModel.swift
//  LoadMoreSample
//
//  Created by Yusuke Hasegawa on 2020/12/05.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var items: [String] = []
    
    private let max: Int = 100
    private let countPerPage: Int = 20
    
    init() {
        
        items = (0..<countPerPage).map({ "Item : \($0+1)" })
        debugPrint(items)
    }
    
}

extension ViewModel {
    
    var canLoadMore: Bool {
        return items.count < max
    }
    
    func loadMore() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.appendItems()
        }
        
    }
    
}

private extension ViewModel {
    
    func appendItems() {
        let array: [String] = (items.count..<items.count+countPerPage).map({ "Item : \($0+1)" })
        items.append(contentsOf: array)
    }
    
}
