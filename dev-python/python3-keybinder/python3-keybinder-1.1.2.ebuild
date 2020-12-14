# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python3_{5,6,7,8} )

inherit distutils-r1

DESCRIPTION="python3-keybinder uses python3-Xlib to bind global keyboard shortcuts."
HOMEPAGE="https://github.com/LiuLang/python3-keybinder"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="dev-python/python-xlib[${PYTHON_USEDEP}]"
DEPEND=">=dev-python/setuptools-30.3.0[${PYTHON_USEDEP}]"
