#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define pi acos(-1.0)
#define mod 1000000007

class Solution {
public:
  int countBeautifulPairs(vector<int> &nums) {
    int ans = 0;
    for (int i = 0; i < nums.size(); i++) {
      int firstDigit = nums[i] / pow(10, ceil(log10(nums[i])));
      cout << firstDigit << endl;
      for (int j = i + 1; j < nums.size(); j++) {
        int lastDigit = nums[j] % 10;
        if (__gcd(firstDigit, lastDigit) == 1) {
          ans++;
        }
      }
    }
    return ans;
  }
};