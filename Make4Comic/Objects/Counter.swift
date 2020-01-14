//
//  Counter.swift
//  Make4Comic
//
//  Created by 原田茂大 on 2020/01/15.
//  Copyright © 2020 geshi. All rights reserved.
//

import UIKit

class Counter {
    let manager = UndoManager()
    var count = 0

    @objc func increment() {
        count += 1
        manager.registerUndo(withTarget: self, selector: #selector(Counter.decrement), object: nil)
    }

    @objc func decrement() {
        count -= 1
        manager.registerUndo(withTarget: self, selector: #selector(Counter.increment), object: nil)
    }
}
