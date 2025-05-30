# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=(python3_{10..13})

inherit distutils-r1

DESCRIPTION="Get YouTube video information using link WITHOUT YouTube Data API v3"
HOMEPAGE="https://github.com/ToxygenX/youtube-search-python/"

SRC_URI="https://github.com/alexmercerind/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/httpx[${PYTHON_USEDEP}]
	net-misc/yt-dlp[${PYTHON_USEDEP}]
"

src_prepare() {
    eapply "${FILESDIR}"/proxy.patch
    eapply_user
}
