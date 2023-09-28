complete --command ni --exclusive --description "Install packages"
complete --command ni --condition "__fish_no_arguments" --condition "__fish_not_contain_opt -s h help" --long help --short h --description "Print help"

complete --command ni --exclusive --condition __fish_use_subcommand --arguments add --description "Add packages"
complete --command ni --exclusive --condition "__fish_seen_subcommand_from add" --condition "__fish_not_contain_opt -s g global -s D dev -s O optional" --long global --short g --description "Add as a global package"
complete --command ni --exclusive --condition "__fish_seen_subcommand_from add" --condition "__fish_not_contain_opt -s D dev -s g global" --long dev --short D --description "Add to devDependencies"
complete --command ni --exclusive --condition "__fish_seen_subcommand_from add" --condition "__fish_not_contain_opt -s O optional -s g global" --long optional --short O --description "Add to optionalDependencies"

complete --command ni --exclusive --condition __fish_use_subcommand --arguments remove --description "Remove packages"
complete --command ni --exclusive --condition "__fish_seen_subcommand_from remove" --condition "__fish_not_contain_opt -s g global" --long global --short g --description "Remove as a global package"

complete --command ni --exclusive --condition __fish_use_subcommand --arguments run --description "Run script"
complete --command ni --exclusive --condition "__fish_seen_subcommand_from run; and not __fish_seen_subcommand_from (_ni_get_package_script_names $PWD)" --arguments "(_ni_get_package_script_names $PWD)"
