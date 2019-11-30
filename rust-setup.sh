# check if rust if installed
if [[ "$(command -v rustup)" && "$(command -v cargo)" && c"$(command -v rustc)" ]]; then
    echo "rust installed"
else
    echo "rust not installed"
    echo "installing rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Add rust nightly
rustup toolchain add nightly

# Download rust sources
rustup component add rust-src

# install rustfmt
# see: https://github.com/rust-lang/rustfmt
# To run on a cargo project in the current working directory:
# `cargo +nightly fmt`
rustup component add rustfmt
rustup component add rustfmt --toolchain nightly

# Install racer
# see: https://github.com/racer-rust/racer
cargo +nightly install racer

rustup update
