-- Snippet configuration
local snip = require('snippets')
local vim = vim

snip.snippets = {
    _global = {
        todo = "TODO(Subeet): --> ";
        uname  = function() return vim.loop.os_uname.sysname end;
        date = os.date;
    };
    cpp = {
        -- TreeNode
        TreeNode = [[
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x) , left(NULL), right(NULL) {}
};]];
        -- test
        test = [[
    int test;
    cin >> test;

    while(test--){
        $0
    }]];
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


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            spacing = 10,
            prefix = ' '
        },
        signs = false,
        update_in_insert = false,
        underline = true,
    }
)
