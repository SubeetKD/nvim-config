local cpp = {}

cpp.karo = [[
#include <bits/stdc++.h>
#define int long long

signed main() {
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(nullptr);
    std::cout.tie(nullptr);

    $0

    return 0;
}]]

cpp.test = [[int test;
    std::cin >> test;
    while (test--) {
        $0
    }]]

cpp.leetcode = [[#include <bits/stdc++.h>

$0

int main() {
    return 0;
}]]

return cpp
