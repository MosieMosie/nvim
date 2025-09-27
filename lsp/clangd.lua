return {
cmd = { "clangd", "--compile-commands-dir=." },
root_markers = { "compile_commands.json", ".git" },
filetypes = { "c", "cpp", "objc", "objcpp" },
}
