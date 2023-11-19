import UIKit

/*
 
 --- Example 1: Two Sum  ---

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1
 */
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        
//        let n = nums.count
//        
//        for i in 0 ..< n {
//            for j in i+1 ..< n {
//                if nums[i] + nums[j] == target {
//                    return [i, j]
//                }
//            }
//        }
//      return []
//    }
//    
//twoSum([1,3,5,2,9], 3)



/*
 Given an integer x, return true if x is a
 palindrome, and false otherwise.
 
 Example 2: Palindrome Number
 
 Input: x = 121
 Output: true
 Explanation: 121 reads as 121 from left to right and from right to left.
 Example 2:

 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 Example 3:

 Input: x = 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 */

//func isPalindrome(_ x: Int) -> Bool {
//     var number = x
//  var reverseNumber = 0
//  while number > 0 {
//      let reminder = number % 10
//      reverseNumber = reverseNumber * 10 + reminder
//      number = number / 10
//  }
//  return x == reverseNumber
//  }
//isPalindrome(123)


    /*
     Symbol       Value
     I             1
     V             5
     X             10
     L             50
     C             100
     D             500
     M             1000
     
     Example 1:  Roman to Integer

     Input: s = "III"
     Output: 3
     Explanation: III = 3.
     Example 2:

     Input: s = "LVIII"
     Output: 58
     Explanation: L = 50, V= 5, III = 3.
     Example 3:

     Input: s = "MCMXCIV"
     Output: 1994
     Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
     */

//  private let dict: [Character:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
//  
//  func romanToInt(_ s: String) -> Int {
//      var prev = 0, out = 0
//      for i in s {
//          let val = dict[i] ?? 0
//          out += val <= prev ? prev : -prev
//          prev = val
//      }
//      out += prev
//      return out
//  }

