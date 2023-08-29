# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Port of requests-oauthlib for aiohttp"
HOMEPAGE="https://git.sr.ht/~whynothugo/aiohttp-oauthlib"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
SLOT="0"

DEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]"
