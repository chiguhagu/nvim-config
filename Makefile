# Neovim setup & configuration management Makefile
NVIM_DIR := ~/.config/nvim
NVIM_BIN := /usr/bin/nvim

.PHONY: all install setup reload check update plugins clean fmt commit

# 🚀 Install Neovim and required tools
install:
	sudo apt update
	sudo apt install -y neovim git curl unzip ripgrep fd-find
	echo "Neovim installed successfully!"

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

