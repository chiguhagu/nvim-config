# Neovim setup & configuration management Makefile
NVIM_DIR := ~/.config/nvim
NVIM_BIN := /usr/bin/nvim
ARCH := $(shell uname -m)

.PHONY: all install setup reload check update plugins clean fmt commit

# 🚀 Install Neovim and required tools
install:
	sudo apt update
	sudo apt install -y git curl unzip ripgrep fd-find
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-$(ARCH).appimage
	chmod u+x nvim-linux-$(ARCH).appimage
	./nvim-linux-$(ARCH).appimage --appimage-extract
	if [ -d "/squashfs-root" ]; then sudo rm -rf /squashrf-root; fi
	sudo mv squashfs-root /
	sudo ln -sf /squashfs-root/AppRun /usr/bin/nvim
	rm nvim-linux-$(ARCH).appimage
	echo "Neovim installed successfully!"


# 🚀 Uninstall Neovim (AppImage) and cleanup
uninstall:
	sudo rm -rf /squashfs-root
	sudo rm -f /usr/bin/nvim
	echo "NeoVim AppImage uninstalled successfully!"

# 🚀 Clone Neovim configuration repository (initial setup)
setup:
	if [ ! -d "$(NVIM_DIR)" ]; then \
	  git clone https://github.com/yourname/nvim-config.git $(NVIM_DIR); \
	  echo "Neovim configuration cloned!"; \
	fi

# 🚀 Reload Neovim configuration
reload:
	nvim --headless "+source $(NVIM_DIR)/init.lua" +qa

# 🔍 Check for configuration issues
check:
	nvim --headless "+checkhealth" +qa

# ⬆️ Sync and update plugins
update:
	nvim --headless "+Lazy! sync" +qa
	nvim --headless "+Lazy! update" +qa
	nvim --headless "+TSUpdate" +qa

# 📦 Manage plugins
plugins:
	nvim --headless "+Lazy! sync" +qa
	nvim --headless "+Lazy! clean" +qa

# 🗑️ Remove cache files
clean:
	rm -rf ~/.local/share/nvim
	rm -rf ~/.cache/nvim
	rm -rf ~/.local/state/nvim

# 🎨 Format Lua files
fmt:
	stylua $(NVIM_DIR)

# 💾 Commit Neovim configuration changes to Git
commit:
	git -C $(NVIM_DIR) add .
	git -C $(NVIM_DIR) commit -m "Update nvim config"
	git -C $(NVIM_DIR) push

# 🚀 Complete Neovim setup (install + clone configuration + update plugins)
all: install setup update

