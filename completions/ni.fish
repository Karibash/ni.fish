complete --command ni --exclusive --description "Install packages"
complete --command ni --condition "__fish_no_arguments" --long help --short h --description "Print help"

complete --command ni --exclusive --condition __fish_use_subcommand --arguments add --description "Add packages"
complete --command ni --exclusive --condition "__fish_seen_subcommand_from add" --long dev --short D --description "Add to devDependencies"
complete --command ni --exclusive --condition "__fish_seen_subcommand_from add" --long optional --short O --description "Add to optionalDependencies"

complete --command ni --exclusive --condition __fish_use_subcommand --arguments remove --description "Remove packages"

complete --command ni --exclusive --condition __fish_use_subcommand --arguments run --description "Run script"
