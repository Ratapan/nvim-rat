# 🦝 Ratapan's nvim config

Gran parte de la config, realmente viene de muchas guías, posts de Medium o devto y videos. La base es Lazyvim y recomiendo usar Lazygit para que sea más amena la experiencia. Creo que en cuanto a videos, el que más me gustó, por lejos, fue ["Effective NeoVim Setup for Full-Stack Web Development in 2024"](https://www.youtube.com/watch?v=V070Zmvx9AM)
Trate de no enredar tanto el código y de dejar anotaciones, también deje muchos de los otros "contribuyentes involuntarios", por eso el repo se llama nvim-rat jeje

## Instalación

### Instalar nvim y dependencias

```bash
brew install nvim lazygit gcc fzf make ripgrep
```

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

```bash
nvm install --lts
```

### Instalar Silicon para generar screenshots

```bash
sudo pacman -S silicon
```

### Instalar mis configs

```bash
git clone https://github.com/Ratapan/nvim-rat ~/.config/nvim
```

### Codeium

tienes que crear una cuenta de [Codeium](https://codeium.com/) y agregarla a tu nvim config con `:` + `Codeium Auth`
