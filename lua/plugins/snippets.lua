require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip').filetype_extend("go", {"go"})
require('luasnip').filetype_extend("docker", {"docker-compose"})
require('luasnip').filetype_extend("yaml", {"docker_file"})
