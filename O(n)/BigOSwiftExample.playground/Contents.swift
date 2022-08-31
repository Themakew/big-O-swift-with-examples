import UIKit

/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

 */

func solution(A: [Int], K: Int) -> [Int] {
    // Edge case
    guard !A.isEmpty else {
        return []
    }

    // Edge case
    guard A.count != 1 || K > 0 else {
        return A
    }

    var resultList = A

    for _ in 1...K { // O(n) - for loop
        if let lastItem = resultList.last {
            resultList.removeLast() // O(1)
            resultList.insert(lastItem, at: 0) // O(i) - where 'i' is the index, in this case, i = 0. Then, O(1) always.
        }
    }

    return resultList
}

solution(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
solution(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
solution(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2

solution(A: [3, 8, 9, 7, 6], K: 3) // [9, 7, 6, 3, 8]

// TIME COMPLEXITY = O(n)
// SPACE COMPLEXITY = O(n)
