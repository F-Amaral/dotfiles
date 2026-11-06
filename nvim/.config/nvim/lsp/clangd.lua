return {
  cmd = {
    "clangd",
     '--background-index',
    '--clang-tidy',
    '--header-insertion=iwyu',
    '--completion-style=detailed',
    '--function-arg-placeholders',
    '--fallback-style=llvm',
    -- Whitelists devkitPro's cross-compiler so clangd is allowed to query its attributes
    "--query-driver=/opt/devkitpro/devkitARM/bin/arm-none-eabi*",
  },
  -- Define the root directory to trigger the language server activation
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }, 
  root_markers = { 'compile_commands.json', 'compile_flags.txt', '.git' },
}
