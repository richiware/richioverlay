# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{10..14})

inherit distutils-r1

DESCRIPTION="python3-keybinder uses python3-Xlib to bind global keyboard shortcuts."
HOMEPAGE="https://github.com/LiuLang/python3-keybinder"
SRC_URI="https://files.pythonhosted.org/packages/b0/4a/3ca423232703f3b18f914bdb66b33ae7ea0ecd286150de4eb224dbe3c721/python3-keybinder-1.1.2.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="dev-python/python-xlib[${PYTHON_USEDEP}]"
DEPEND=">=dev-python/setuptools-30.3.0[${PYTHON_USEDEP}]"
