return {
  'jedrzejboczar/nvim-dap-cortex-debug',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function()
    -- Setup dap-cortex-debug
    require('dap-cortex-debug').setup {
      debug = false, -- log debug messages
      extension_path = nil, -- path to cortex-debug extension, supports vim.fn.glob
      lib_extension = nil, -- shared libraries extension, tries auto-detecting, e.g. 'so' on unix
      node_path = '/usr/bin/node', -- path to node.js executable
      dapui_rtt = true, -- register nvim-dap-ui RTT element
      dap_vscode_filetypes = { 'c', 'cpp' }, -- make :DapLoadLaunchJSON register cortex-debug for C/C++
      rtt = {
        buftype = 'Terminal', -- 'Terminal' or 'BufTerminal' for terminal buffer vs normal buffer
      },
    }

    -- Configure DAP for Cortex Debug
    local dap_cortex_debug = require 'dap-cortex-debug'
    require('dap').configurations.c = {
      dap_cortex_debug.openocd_config {
        name = 'Example debugging with OpenOCD',
        cwd = '${workspaceFolder}',
        executable = '/home/eren/Projects/stm_bare_metal/stm32f722_project.elf',
        configFiles = { '/home/eren/Projects/stm_bare_metal/openocd.cfg' },
        gdbTarget = 'localhost:3333',
        openocd_args = {
          '-c',
          'gdb_port 3333', -- Set GDB port to 3333
          '-c',
          'tcl_port 4444', -- Set TCL port to 4444
          '-c',
          'telnet_port 5555', -- Set Telnet port to 5555
        },
        rttConfig = dap_cortex_debug.rtt_config(0),
        showDevDebugOutput = false,
        setupCommands = {
          --{ text = 'target remote localhost:3333', description = 'Connect to OpenOCD' },
          { text = 'load', description = 'Load program' },
          { text = 'start', description = 'Start program' },
        },
      },
    }
  end,
}
