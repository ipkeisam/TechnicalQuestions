// For a 2D matrix, print all paths from upper left hand corner to lower right hand corner
// Two directions are allowed - D (Down) and R (Right)


var arr = [ [0, 0, 0], [0, 0, 0], [0, 0, 0]]

func getPaths(_ arr : [[Int]], _ x : Int, _ y : Int, _ prefix : String)  {
    
    if (x == arr.count - 1 && y == arr[0].count - 1) {
        print(prefix)
        return
    }
    
    if (x + 1 < arr.count && arr[x+1][y] == 0){
        getPaths(arr, x + 1, y, "\(prefix) D ")
    }
    
    if (y+1 < arr[0].count && arr[x][y+1] == 0) {
        getPaths(arr, x, y + 1, "\(prefix) R ")
    }
    
}

getPaths(arr, 0 , 0, "")
