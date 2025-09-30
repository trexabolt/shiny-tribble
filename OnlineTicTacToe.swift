import Foundation

class Board {
    var cells = Array(repeating: " ", count: 9)
    func draw() {
        print("\(cells[0])|\(cells[1])|\(cells[2])")
        print("-+-+-")
        print("\(cells[3])|\(cells[4])|\(cells[5])")
        print("-+-+-")
        print("\(cells[6])|\(cells[7])|\(cells[8])")
    }
    func makeMove(pos: Int, symbol: String) -> Bool {
        if cells[pos] == " " {
            cells[pos] = symbol
            return true
        }
        return false
    }
    func checkWin(symbol: String) -> Bool {
        let wins = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        for w in wins {
            if w.allSatisfy({ cells[$0] == symbol }) { return true }
        }
        return false
    }
}

var board = Board()
var turn = 0
let symbols = ["X", "O"]
for _ in 0..<9 {
    let pos = turn % 2 == 0 ? turn : 8 - turn
    let sym = symbols[turn % 2]
    if board.makeMove(pos: pos, symbol: sym) {
        board.draw()
        if board.checkWin(symbol: sym) {
            print("\(sym) wins!")
            break
        }
        turn += 1
    }
}
print("Tic-Tac-Toe Ended.")