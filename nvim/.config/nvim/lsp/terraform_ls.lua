return {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars", "terraform-stack", "terraform-deploy" },
  root_markers = { ".terraform", ".git" },
}
