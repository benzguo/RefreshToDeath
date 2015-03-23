// Playground - noun: a place where people can play

import Cocoa

func shuffle(xs: [Int]) -> [Int] {
    var ys = xs
    for i in stride(from: xs.count - 1, to: 0, by:-1) {
        let j = Int(arc4random_uniform(UInt32(i)))
        let ys_i = ys[i]
        ys[i] = ys[j]
        ys[j] = ys_i
    }
    return ys
}


