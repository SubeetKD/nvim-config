-- Snippet configuration
local snip = require("snippets")
local vim = vim

snip.snippets = {
  _global = {
    todo = "TODO(Subeet): --> ",
    uname = function()
      return vim.loop.os_uname.sysname
    end,
    date = os.date
  },
  cpp = {
    -- segtree
    SegmentTree = [[
class Segtree {
    $1 null_val;
    int size;
    vector<$1> tree;
    vector<$1> lazy;

    $1 combine($1 a, $1 b) { return a + b; }

    $1 scale_value(int cnt, $1 b) { return cnt * b; }

    void push(int node, int start, int end) {
        tree[node] =
            combine(tree[node], scale_value(end - start + 1, lazy[node]));
        if (start != end) {
            // the child will also get affected
            lazy[2 * node] = combine(lazy[node], lazy[2 * node]);
            lazy[2 * node + 1] = combine(lazy[node], lazy[2 * node + 1]);
        }
        lazy[node] = 0;
    }

    void update(int node, int start, int end, int idx, int val) {
        if (start == end) {
            tree[idx] = val;
            return;
        }
        int mid = start + (end - start) / 2;
        if (idx <= mid)
            update(2 * node, start, mid, idx, val);
        else
            update(2 * node + 1, mid + 1, end, idx, val);

        tree[node] = combine(tree[2 * node], tree[2 * node + 1]);
    }

    $1 querry(int node, int start, int end, int l, int r) {
        if (l > r)
            return null_val;
        if (start > r and end < l)
            return null_val;
        if (start >= l and end <= r) {
            return tree[node];
        }
        int mid = start + (end - start) / 2;
        return combine(querry(2 * node, start, mid, l, r),
                       querry(2 * node + 1, mid + 1, end, l, r));
    }

    void updateRange(int node, int start, int end, int l, int r, $1 val) {

        push(node, start, end);

        if (start > r or end < l)
            return;
        if (start >= l and end <= r) {
            push(node, start, end);
            return;
        }
        int mid = start + (end - start) / 2;
        updateRange(2 * node, start, mid, l, r, val);
        updateRange(2 * node + 1, mid + 1, end, l, r, val);
        tree[node] = combine(tree[2 * node], tree[2 * node + 1]);
    }

    $1 querryRange(int node, int start, int end, int l, int r) {
        if (l > r)
            return null_val;
        if (start > r or end < l)
            return null_val;
        push(node, start, end);
        if (start >= l and end <= r) {
            return tree[node];
        }
        int mid = start + (end - start) / 2;
        return combine(querryRange(2 * node, start, mid, l, r),
                       querryRange(2 * node, mid + 1, end, l, r));
    }

  public:
    Segtree(int n) {
        null_val = 0;
        size = 1;
        while (size < n) {
            size *= 2;
        }
        tree.assign(2 * size, 0);
        lazy = tree;
    }

    void update(int idx, $1 val) { update(1, 0, size - 1, idx, val); }

    $1 querry(int l, int r) { return querry(1, 0, size - 1, l, r); }

    $1 querryRange(int l, int r) { return querryRange(1, 0, size - 1, l, r); }

    void updateRange(int l, int r, $1 val) {
        updateRange(1, 0, size - 1, l, r, val);
    }
};]],
    -- TreeNode
    TreeNode = [[
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x) , left(NULL), right(NULL) {}
};]],
    -- test
    test = [[
    int test;
    cin >> test;

    while(test--){
        $0
    }]],
    -- leetcode template
    leetcode = [[
#include <bits/stdc++.h>
using namespace std;

$0

int main(){
    return 0;
}]],
    -- Name of the snippet
    interviewbit = [[
class Solution{
public:
    $1 $2($3);
};

$1 Solution::$2($3){
    $0
}]],
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
}]]
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = {
      spacing = 10,
      prefix = " "
    },
    signs = false,
    update_in_insert = false,
    underline = true
  }
)
