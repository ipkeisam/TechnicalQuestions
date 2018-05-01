// For a 2D matrix, print all paths from upper left hand corner to lower right hand corner
// Two directions are allowed - D (Down) and R (Right)


var arr = [ [1, 2, 3, 4], [2, 2, 3, 4], [3, 2, 3, 4], [4, 5, 6, 7]]

func longestPath(_ dp : inout [[Int]], _ mat : [[Int]], _ n : Int, _ m: Int, _ x: Int, _ y: Int) -> Int {
    
    if (dp[x][y] < 0) {
        var result = 0
        
        if (x == n - 1 && y == m - 1){
            dp[x][y] = 1
            return dp[x][y]
        }
        
        if (x == n - 1 || y == m - 1){
            result = 1
        }
        
        if (x + 1 < n && mat[x][y] < mat [x+1][y]){
            result = 1 + longestPath(&dp, mat, n, m, x + 1, y)
        }
        
        if (y + 1 < m && mat[x][y] < mat[x][y+1]){
            result = max(result, 1 + longestPath(&dp, mat, n, m, x, y + 1))
        }
        
        dp[x][y] = result
    }
    
    return dp[x][y]
}


func wrapper(_ arr : [[Int]]) -> Int {
    let rows = arr.count
    let cols = arr[0].count
    
    var dp = Array(repeating: Array(repeating: -1, count: cols), count: rows)
    return longestPath(&dp, arr, cols, rows, 0, 0)
}


wrapper(arr)
