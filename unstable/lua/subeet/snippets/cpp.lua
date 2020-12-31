local M = {}

M.TreeNode = [[
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x) , left(NULL), right(NULL) {}
};]]

-- test
M.test = [[
    int test;
    cin >> test;

    while(test--){
        $0
    }]]

-- leetcode template
M.leetcode = [[
#include <bits/stdc++.h>
using namespace std;

$0

int main(){
    return 0;
}]]


-- Name of the snippet
M.interviewbit = [[
class Solution{
public:
    $1 $2($3);
};

$1 Solution::$2($3){
    $0
}]]


-- debug template
M.warsaw = [[
#define sim template < class c
#define ris return * this
#define dor > debug & operator <<
#define eni(x) sim > typename \
  enable_if<sizeof dud<c>(0) x 1, debug&>::type operator<<(c i) {
sim > struct rge { c b, e; };
sim > rge<c> range(c i, c j) { return rge<c>{i, j}; }
sim > auto dud(c* x) -> decltype(cerr << *x, 0);
sim > char dud(...);
struct debug {
#ifdef LOCAL
~debug() { cerr << endl; }
eni(!=) cerr << boolalpha << i; ris; }
eni(==) ris << range(begin(i), end(i)); }
sim, class b dor(pair < b, c > d) {
  ris << "(" << d.first << ", " << d.second << ")";
}
sim dor(rge<c> d) {
  *this << "[";
  for (auto it = d.b; it != d.e; ++it)
    *this << ", " + 2 * (it == d.b) << *it;
  ris << "]";
}
#else
sim dor(const c&) { ris; }
#endif
};
#define imie(...) " [" << #__VA_ARGS__ ": " << (__VA_ARGS__) << "] " ]]

-- for main template
M.karo = [[
#include <bits/stdc++.h>
#define int long long
using namespace std;

signed main(){
    ios_base::sync_with_stdio(false);

    $0

    return 0;
}]]

return M
