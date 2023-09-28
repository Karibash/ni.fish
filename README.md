# ni.fish

Alternative [ni](https://github.com/antfu/ni) written in fish.

## 🔧 Supports

- npm
- yarn
- pnpm
- bun

## 📝 Requirements

- [fish](https://github.com/fish-shell/fish-shell)
  - This plugin is for fish shell.
- [jq](https://github.com/jqlang/jq) (Optional)
  - To complement script names, jq must be installed.

## 🚀 Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```
$ fisher install Karibash/ni.fish
```

## 👏 Usage

### Install

```
$ ni

# npm install
# yarn install
# pnpm install
# bun install
```

### Add package

```
$ ni add <package>

# npm install <package>
# yarn add <package>
# pnpm add <package>
# bun add <package>
```

```
$ ni add -g <package>

# npm install --global <package>
# yarn global add <package>
# pnpm add --global <package>
# bun add --global <package>
```

```
$ ni add -D <package>

# npm install --save-dev <package>
# yarn add --dev <package>
# pnpm add --save-dev <package>
# bun add --development <package>
```

```
$ ni add -O <package>

# npm install --save-optional <package>
# yarn add --optional <package>
# pnpm add --save-optional <package>
# bun add --optional <package>
```

### Remove package

```
$ ni remove <package>

# npm uninstall <package>
# yarn remove <package>
# pnpm remove <package>
# bun remove <package>
```

```
$ ni remove -g <package>

# npm uninstall --global <package>
# yarn global remove <package>
# pnpm remove --global <package>
# bun remove --global <package>
```

### Run script

```
$ ni run <script> --option

# npm run <script> -- --option
# yarn run <script> --option
# pnpm run <script> --option
# bun run <script> --option
```


## 🤝 Contributing

Contributions, issues and feature requests are welcome.

Feel free to check [issues page](https://github.com/Karibash/ni.fish/issues) if you want to contribute.

## 📝 License

Copyright © 2020 [@Karibash](https://twitter.com/karibash).

This project is [```MIT```](https://github.com/Karibash/ni.fish/blob/main/LICENSE) licensed.
