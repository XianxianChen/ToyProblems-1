//: Playground - noun: a place where people can play

import UIKit
//Q1. Two Sum
//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//Example:
//Given nums = [2, 7, 11, 15], target = 9,
//Because nums[0] + nums[1] = 2 + 7 = 9,
//return [0, 1].
func twoSum(arr: [Int], target: Int) -> [Int] {
    for i in 0..<arr.count {
        for j in 0..<arr.count where j != i {
            if arr[i] + arr[j] == target {
            return [i, j]
            }
        }
    }
    return [0, 0]
}
twoSum(arr: [2, 7, 11, 15], target: 9)

func twoSumUsingDict(arr: [Int], target: Int) -> [Int] {
    var dict = [Int: Int]()
    var finalArr = [Int]()
    for (index, num) in arr.enumerated() {
        if dict[num] != nil && num + num == target {
            return [index, dict[num]!]
        }
        dict[num] = index
    }
    for i in 0..<arr.count {
        let remainder = target - arr[i]
        if dict[remainder] != nil {
            finalArr = [i, dict[remainder]!]
        }
    }
    return finalArr
}
twoSumUsingDict(arr: [-1,-2,-3,-4,-5], target: -8)

func twoSumOnePass(arr: [Int], target: Int) -> [Int] {
    var dict = [Int: Int]()
    var finalArr = [Int]()
    for (index, num) in arr.enumerated() {
        let remainder = target - arr[index]
        if dict[remainder] != nil {
            finalArr = [index, dict[remainder]!]
        } else {
            dict[num] = index
        }
    }
    return finalArr
}
//Q2. License Key Formatting
//Example 1:
//Input: S = "5F3Z-2e-9-w", K = 4
//Output: "5F3Z-2E9W"
//
//Example 2:
//Input: S = "2-5g-3-J", K = 2
//Output: "2-5G-3J"

func licenseKeyFormatting(_ S: String, _ K: Int) -> String {
   var arr = [String]()
    for char in S where char != "-" {
        arr.append(String(char).uppercased())
    }
    guard arr.count > K else {
        return arr.joined()
    }
    print(arr)
   let mod = arr.count % K
    var count = 0
    if mod == 0 {
        let numOfDash = (arr.count / K) - 1
        for i in 1...numOfDash {
           arr.insert("-", at: ((i * K) + count))
            count += 1
        }
    } else {
        let numOfDash = arr.count / K
        for i in 0..<numOfDash {
            arr.insert("-", at: mod + (i * K) + count)
            count += 1
        }
    }
    let finalString = arr.joined()
    return finalString
}
licenseKeyFormatting("2-5g-3-J", 2)
licenseKeyFormatting("5F3Z-2e-9-w", 4)


//Q3. Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only and its length will not exceed 10000.
//Example 1:
//Input: "abab"
//Output: True
//Explanation: It's the substring "ab" twice.
func repeatedSubstringPattern(_ s: String) -> Bool {
   
    return true
}



//Q4 Three Sum
//Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
//Note: The solution set must not contain duplicate triplets.
//For example, given array S = [-1, 0, 1, 2, -1, -4],
//A solution set is:
//[
//[-1, 0, 1],
//[-1, -1, 2]
//]

func threeSumBruteForce(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3 else {
        return []
    }
    var final = [[Int]]()
    for i in 0..<nums.count - 2 {
        for j in (i + 1)..<nums.count - 1 {
            for k in (j + 1)..<nums.count {
                if nums[i] + nums[j] + nums[k] == 0 {
                    let arr = [nums[i], nums[j], nums[k]].sorted()
                    var contain = false
                    for item in final {
                        if item == arr {
                            contain = true
                        }
                    }
                    if contain == false {
                        final.append(arr)
                    }
                }
            }
        }
    }
 
    return final
}
threeSumBruteForce([-1, 0, 1, 2, -1, -4])


func judgeCircle(_ moves: String) -> Bool {
    var dict = [Character: Int]()
    for char in moves {
        if dict[char] == nil {
            dict[char] = 1
        } else {
            dict[char]! += 1
        }

    }
    return dict["D"] == dict["U"] && dict["L"] == dict["R"]
}

func judgeCircleFasterSolution(_ moves: String) -> Bool {
    var rl = 0
    var ud = 0
    for char in moves.unicodeScalars {
        switch char{
        case "R":
            rl += 1
        case "L":
            rl -= 1
        case "U":
            ud += 1
        case "D":
            ud -= 1
        default:
            break
        }
    }
    return rl == 0 && ud == 0
}
judgeCircleFasterSolution("")

// Reverse Integer
//Given a 32-bit signed integer, reverse digits of an integer.
//Example 1:
//Input: 123
//Output: 321

//Example 2:
//Input: -123
//Output: -321

//Example 3:
//Input: 120
//Output: 21
//Note:
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
func reverse(_ x: Int) -> Int {
    var y = x
    let str = String(x)
    var count = str.count
    var reversedNum = 0
    if x < 0 {
        count = str.count - 1
    }
    for _ in 0..<count {
        let num = y % 10
        y = y / 10
        reversedNum +=  num * Int(pow(10, Double(count - 1)))
        count -= 1
    }
    if reversedNum > Int32.max || reversedNum < Int32.min {
        return 0
    }
    return reversedNum
}
func reverseInShortForm(_ x: Int) -> Int {
    var reversed = 0
    var y = x
    while y != 0 {
        reversed = reversed * 10 + y % 10
        y = y / 10
        if reversed > Int32.max || reversed < Int32.min {
            return 0
        }
    }
    return reversed
}
reverse(123)
reverse(-123)
reverse(-120)
reverse(1534236469)
reverseInShortForm(123)
reverseInShortForm(-123)
reverseInShortForm(1534236469)

// Maximum Subarray
//Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
//Example:
//Input: [-2,1,-3,4,-1,2,1,-5,4],
//Output: 6
//Explanation: [4,-1,2,1] has the largest sum = 6.
//Follow up:
//If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

func maxSubArray(_ nums: [Int]) -> Int {
    var largestSumSoFar = nums[0]
    var startIndex = 0
    var endIndex = 0
    var allNegative = true
    for num in nums {
        if num > 0 {
            allNegative = false
        }
        largestSumSoFar = max(num, largestSumSoFar)
    }
    if allNegative {
        return largestSumSoFar
    }
    largestSumSoFar = nums[0]
    for (i, num) in nums.enumerated() where num > 0 {
       // startIndex = i
        largestSumSoFar = max(num, largestSumSoFar)
        var curSum = num
        for j in i + 1..<nums.count {
           curSum += nums[j]
            if curSum > largestSumSoFar {
                startIndex = i
                endIndex = j
                largestSumSoFar = curSum
            }
            
        }
    }
    return largestSumSoFar
}

func maxSubArrayDp(_ nums: [Int]) -> Int {
    let n = nums.count
    var dp = Array(repeating: 0, count: n) // save max num in the dp array.
       dp[0] = nums[0]   // if array with 0 element(empty array) max sum = 0
    var maxSum = dp[0]
    for i in 1..<n {
        dp[i] = nums[i] + (dp[i - 1] > 0 ? dp[i - 1] : 0 )
        maxSum = max(maxSum, dp[i])
    }
    return maxSum
}

maxSubArray([-2,1,-3,-1,2,1,-5,4])
maxSubArray([-2, -1])
maxSubArrayDp([-2,1,-3,-1,2,1,-5,4])
maxSubArrayDp([-2,1,-3,4,-1,-1,3,1,-5,4])

// length of last word
//Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.
//If the last word does not exist, return 0.
//Note: A word is defined as a character sequence consists of non-space characters only.
//
//Example:
//Input: "Hello World"
//Output: 5

func lengthOfLastWord(_ s: String) -> Int {
    if s.isEmpty {
        return 0
    }
   var arr = s.components(separatedBy: " ")
    while !arr.isEmpty && arr[arr.count - 1] == "" {
        arr.removeLast()
        print(arr.count)
    }
    return arr.count == 0 ? 0 :  arr[arr.count - 1].count
}
let a = "a "
a.components(separatedBy: " ") // ["a", ""]
"".components(separatedBy: " ")
"a b   ".components(separatedBy: " ")


lengthOfLastWord("Hello World")
lengthOfLastWord("a ")
lengthOfLastWord("    ")

// plus one
//Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
//The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
//
//You may assume the integer does not contain any leading zero, except the number 0 itself.
//
//Example 1:
//Input: [1,2,3]
//Output: [1,2,4]
//Explanation: The array represents the integer 123.
//Example 2:
//Input: [4,3,2,1]
//Output: [4,3,2,2]
//Explanation: The array represents the integer 4321.

func plusOne(_ digits: [Int]) -> [Int] {
    if digits.isEmpty {
        return [1]
    } // base case
    var result = digits
    if digits[digits.count - 1] != 9 {
       result[digits.count - 1] += 1
        return result
    } // base case
    // if last element == 9
    result.removeLast()
   return plusOne(result) + [0]
}
plusOne([4,3,2,1])
plusOne([9, 9])
plusOne([7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6])

// Valid Parentheses
//Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//An input string is valid if:
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
// Note that an empty string is also considered valid.

func isValid(_ s: String) -> Bool {
    if s.isEmpty {
        return true
    }
    var arr = [Character]()
    var dict: [Character: Character] = [")" : "(", "}" : "{", "]": "["]
    let sAsArr = Array(s)
    arr.append(sAsArr[0])
    for index in 0..<sAsArr.count - 1 {
        
        if dict[sAsArr[index + 1]] == arr.last && !arr.isEmpty {
            arr.removeLast()
        } else {
            arr.append(sAsArr[index + 1])
        }
    }
    return arr.isEmpty
}
isValid("{}]()")

//Climb Stairs
//You are climbing a stair case. It takes n steps to reach to the top.
//
//Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
//
//Note: Given n will be a positive integer.
//Example 1:
//Input: 2
//Output: 2
//Explanation: There are two ways to climb to the top.
//1. 1 step + 1 step
//2. 2 steps
//Example 2:
//Input: 3
//Output: 3
//Explanation: There are three ways to climb to the top.
//1. 1 step + 1 step + 1 step
//2. 1 step + 2 steps
//3. 2 steps + 1 step

func climbStairs(_ n: Int) -> Int {
    var dict = [Int: Int]()
    dict[1] = 1
    dict[2] = 2
    if n == 1 {
        return 1
    } // make sure index in range
    if n == 2 {
        return 2
    } //make sure index in range
    for i in 3...n {
    dict[i] = dict[i - 2]! + dict[i - 1]!
    }
    return dict[n]!
}
climbStairs(3)
climbStairs(5)
climbStairs(44)

// Palindrome Number
//Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
//Example 1:
//Input: 121
//Output: true
//Example 2:
//Input: -121
//Output: false
//Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
//Example 3:
//Input: 10
//Output: false
//Explanation: Reads 01 from right to left. Therefore it is not a palindrome.

func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {
        return false
    }
    //reverse the int
    var s = x
    var reversed = 0
    while s != 0 {
        reversed = reversed * 10 + s % 10
        s = s / 10
    }
    return reversed == x
}
func isPalindrome2(_ x: Int) -> Bool {
    var arr = Array(String(x))
    for i in 0..<arr.count {
        if arr[i] != arr[arr.count - 1 - i] {
            return false
        }
    }
    return true
}
func isPalindrome3(_ x: Int) -> Bool {
    let s = String(x)
     let r = String(s.reversed())
   // print(r)
    return s == r
}

isPalindrome(121)
isPalindrome3(123432)



