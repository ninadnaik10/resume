#!/bin/bash

set -e

echo "Detecting package manager..."

if command -v dnf &> /dev/null; then
    echo "Detected dnf. Installing LaTeX packages for Fedora-based systems..."
    sudo dnf install -y \
        texlive-scheme-basic \
        'tex(parskip.sty)' \
        'tex(xltabular.sty)' \
        'tex(ltablex.sty)' \
        'tex(fontawesome5.sty)' \
        'tex(lettrine.sty)' \
        'tex(minifp.sty)' \
        'tex(wrapfig.sty)'

elif command -v apt &> /dev/null; then
    echo "Detected apt. Installing LaTeX packages for Debian/Ubuntu-based systems..."
    sudo apt update
    sudo apt install -y \
        texlive-base \
        texlive-latex-base \
        texlive-latex-recommended \
        texlive-latex-extra \
        texlive-fonts-extra \
        texlive-science \
        texlive-fonts-recommended

else
    echo "Unsupported package manager. This script supports only apt or dnf."
    exit 1
fi

echo "LaTeX package installation complete."
