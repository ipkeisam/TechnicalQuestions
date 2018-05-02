// Find word in a matrix

var arr : [[Character]] = [ ["a", "b", "c", "d"], ["d", "e", "f", "g"], ["h", "i", "j", "k"], ["l", "m", "n", "o"]]

var path = 1

func search(_ arr : [[Character]], _ word: String, _ row : Int, _ col : Int, _ index: Int, _ rows : Int, _ cols : Int, _ solution : inout [[Int]]) -> Bool {
    if (solution[row][col] != 0 || Array(word)[index] != arr[row][col]){
        return false
    }
    
    if (index == word.count - 1 ) {
        solution[row][col] = path
        path = path + 1
        return true
    }
    
    solution[row][col] = path
    path = path + 1
    
    if (row + 1 < rows && search(arr, word, row + 1, col, index + 1, rows, cols, &solution))
        || (row - 1 < rows && search(arr, word, row - 1, col, index + 1, rows, cols, &solution))
        || (col + 1 < rows && search(arr, word, row, col + 1, index + 1, rows, cols, &solution))
            || (col - 1 < rows && search(arr, word, row, col - 1, index + 1, rows, cols, &solution)) {
                return true
    }
    
    solution[row][col] = 0
    path = path - 1
    return false
}


func searchWord(_ arr : [[Character]], _ word : String) -> Bool {
    let rows = arr.count
    let cols = arr[0].count
    var solution = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    
    for i in 0..<rows {
        for j in 0..<cols {
            if (search(arr, word, i, j, 0, rows, cols, &solution)){
                return true
            }
        }
    }
    return false
}


searchWord(arr, "abefj")
