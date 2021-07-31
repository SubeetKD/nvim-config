local dap = require('dap')
dap.adapters.java = function(callback)
  -- here a function needs to trigger the `vscode.java.startDebugSession` LSP command
  -- The response to the command must be the `port` used below
  callback({
    type = 'server';
    host = '127.0.0.1';
    port = port;
  })
end
