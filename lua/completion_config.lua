-- Snippet configuration
local snip = require('snippets')

snip.snippets = {
    _global = {
        todo = "TODO(Subeet): --> ";
        uname  = function() return vim.loop.os_uname.sysname end;
        date = os.date;
    };
    cpp = {
        -- leetcode template
        leetcode = [[
#include <bits/stdc++.h>
using namespace std;

$0

int main(){
    return 0;
}]];
        -- Name of the snippet
        interviewbit = [[
class Solution{
public:
    $1 $2($3);
};

$1 Solution::$2($3){
    $0
}]];

        -- for main template
        karo = [[
#include <bits/stdc++.h>
#define debug() cerr 
#define imie(x) " [" << #x << " : " << (x) << "] " << 
#define int long long
using namespace std;

signed main(){
    ios_base::sync_with_stdio(false);

    $0

    return 0;
}]];

    };
}

