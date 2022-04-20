FROM ubuntu:latest

# Install dependencies
RUN apt update && apt install -y curl git

# Install Neovim
WORKDIR /tmp
RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz
RUN tar xzf nvim-linux64.tar.gz -C /opt
ENV PATH /opt/nvim-linux64/bin:$PATH

# Deploy the Neovim configuration
COPY . /root/.config/nvim

# Bootstrap tangerine.nvim
WORKDIR /root/.local/share/nvim/site/pack/packer/start
RUN git clone https://github.com/udayvir-singh/tangerine.nvim

# Finish
WORKDIR /root
