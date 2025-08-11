# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{10..14})

inherit distutils-r1

DESCRIPTION="Port of requests-oauthlib for aiohttp"
HOMEPAGE="https://git.sr.ht/~whynothugo/aiohttp-oauthlib"
SRC_URI="https://files.pythonhosted.org/packages/ba/0a/cc204fcc311324358252fd38a884b1acae9f9e3936a54b2ce139946daada/aiohttp-oauthlib-0.1.0.tar.gz"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
SLOT="0"

DEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]"
