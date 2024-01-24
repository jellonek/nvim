# jells nvim configuration

Compact nvim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).

Note for lsp servers which depend on `npm`. They do not require "global"
installation based on root account (even if it is the default suggested
installation method for each of them). Instead they can be installed using
local installation mode, after which each of them require adding somewhere in
`$PATH` a file with rights to execute and content:

```sh
#!/bin/sh
exec npx "$(basename "$0")" "$@"
```

with the name of a particular language server, e.g. `bash-language-server`,
`docker-langserver`, `pyright`.
