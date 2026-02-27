# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{10..14})

inherit distutils-r1

DESCRIPTION="High-level FTP client library (virtual file system and more)"
HOMEPAGE="https://todo.sr.ht/~sschwarzer/ftputil"
SRC_URI="https://files.pythonhosted.org/packages/73/dc/83f3fa78a9c8a8fe119a70d040df67799094821d3cad511ee0987d544a10/ftputil-5.1.0.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"

DEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]"
