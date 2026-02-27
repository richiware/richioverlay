# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{10..14})

inherit distutils-r1

DESCRIPTION="A library for working with .desktop files"
HOMEPAGE="https://codeberg.org/JakobDev/desktop-entry-lib"
SRC_URI="https://files.pythonhosted.org/packages/c6/83/7602c4ec7c59c9d6929c0f13e6b48e733cf4772dd54b342a360bd07f4b55/desktop_entry_lib-5.0.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"

S="${WORKDIR}/desktop_entry_lib-${PV}"

DEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]"
