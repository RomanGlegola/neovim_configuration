#!/bin/bash

# Class for managing compiler installation
CompilerInstaller() {
    local os=$1

    # Method for installing on Debian/Ubuntu systems
    install_debian() {
        echo "Installing compilers on Debian/Ubuntu system..."
        sudo apt update
        sudo apt install -y build-essential
        echo "Installation completed. GCC and other tools are now installed."
    }

    # Method for installing on Fedora/CentOS systems
    install_fedora() {
        echo "Installing compilers on Fedora/CentOS system..."
        sudo dnf groupinstall -y "Development Tools"
        echo "Installation completed. GCC and other tools are now installed."
    }

    # Method for installing on Arch Linux systems
    install_arch() {
        echo "Installing compilers on Arch Linux system..."
        sudo pacman -S --noconfirm base-devel
        echo "Installation completed. GCC and other tools are now installed."
    }

    # Method for installing on macOS
    install_macos() {
        echo "Installing compilers on macOS..."
        xcode-select --install

        if command -v brew &> /dev/null
        then
            brew install gcc
        else
            echo "Homebrew is not installed. Install Homebrew and try again."
        fi

        echo "Installation completed. GCC and other tools are now installed."
    }

    # Method for installing on Windows (MSYS2)
    install_windows() {
        echo "Installing compilers on Windows..."

        if ! command -v pacman &> /dev/null
        then
            echo "MSYS2 is not installed. Download and install MSYS2 from https://www.msys2.org/ and try again."
            exit 1
        fi

        pacman -Syu --noconfirm
        pacman -S --noconfirm mingw-w64-x86_64-gcc
        echo "Installation completed. GCC and other tools are now installed."
    }

    # Main method that decides which installation method to call based on the operating system
    install() {
        case $os in
            debian|ubuntu)
                install_debian
                ;;
            fedora|centos)
                install_fedora
                ;;
            arch)
                install_arch
                ;;
            macos)
                install_macos
                ;;
            windows)
                install_windows
                ;;
            *)
                echo "Unsupported operating system: $os"
                exit 1
                ;;
        esac
    }
}

# Detecting the operating system
detect_os() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
            debian|ubuntu)
                echo "debian"
                ;;
            fedora|centos)
                echo "fedora"
                ;;
            arch)
                echo "arch"
                ;;
            *)
                echo "Unknown operating system"
                exit 1
                ;;
        esac
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "msys" ]]; then
        echo "windows"
    else
        echo "Unknown operating system"
        exit 1
    fi
}

# Main script execution
main() {
    local os=$(detect_os)
    local installer=$(CompilerInstaller "$os")
    $installer install
}

main
