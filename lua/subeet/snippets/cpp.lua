local cpp = {}

cpp.karo =
    [[
#include <bits/stdc++.h>
#define int long long
using namespace std;

signed main() {
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);
    cout.tie(nullptr);

    $0

    return 0;
}]]

cpp.test = [[int test;
    cin >> test;
    while (test--) {
        $0
    }]]

cpp.leetcode = [[#include <bits/stdc++.h>
using namespace std;

$0

int main() {
    return 0;
}]]

return cpp
