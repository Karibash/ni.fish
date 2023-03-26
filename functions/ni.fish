function ni --description "Use the right package manager"
    switch $argv[1]
        case ""
            _ni_install_packages
        case "add"
            _ni_add_packages $argv[2..]
        case \*
            echo "ni: Unknown command or option: \"$argv[1]\"" >&2
            return 1
    end
end

function _ni_find_up --argument-names path
    set files $argv[2..]
    for file in $files
        test -e "$path/$file" && echo $path/$file && return
    end

    test ! -z "$path" || return
    _ni_find_up (string replace --regex -- '/[^/]*$' "" $path) $files
end

function _ni_find_lock_file --argument-names path
    _ni_find_up $path package-lock.json yarn.lock pnpm-lock.yaml bun.lockb
end

function _ni_find_package_json --argument-names path
    _ni_find_up $path package.json
end

function _ni_get_package_manager_name --argument-names path
    set lock_file_path (_ni_find_lock_file $PWD)
    set package_json_path (test -n "$lock_file_path" && _ni_find_package_json $lock_file_path || _ni_find_package_json $PWD)

    if test -n "$package_json_path"
        set package_manager_name (awk -F\" '/"packageManager"/{print $4}' $package_json_path | sed -e 's/@.*//')
        if test -n "$package_manager_name"
            if contains $package_manager_name [npm yarn pnpm bun]
                echo $package_manager_name
                return
            end

            echo "ni: Unknown packageManager: \"$package_manager_name\"" >&2
            return 1
        end
    end

    if test -z "$lock_file_path"
        echo "npm"
        return
    end

    switch (basename $lock_file_path)
        case "package-lock.json"
            echo "npm"
        case "yarn.lock"
            echo "yarn"
        case "pnpm-lock.yaml"
            echo "pnpm"
        case "bun.lockb"
            echo "bun"
    end
end

function _ni_exec --argument-names command
    if test -z (which $command)
        echo "ni: Doesn't installed package manager: \"$command\"" >&2
        return 1
    end

    echo "ni: Exec command: $argv"
    eval $argv
end

function _ni_install_packages
    switch (_ni_get_package_manager_name $PWD)
        case "npm"
            _ni_exec npm install
        case "yarn"
            _ni_exec yarn install
        case "pnpm"
            _ni_exec pnpm install
        case "bun"
            _ni_exec bun install
    end
end

function _ni_add_packages
    switch (_ni_get_package_manager_name $PWD)
        case "npm"
            _ni_exec npm install $argv
        case "yarn"
            _ni_exec yarn add $argv
        case "pnpm"
            _ni_exec pnpm add $argv
        case "bun"
            _ni_exec bun add $argv
    end
end
