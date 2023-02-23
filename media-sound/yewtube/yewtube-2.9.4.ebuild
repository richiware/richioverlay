# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1

DESCRIPTION="Terminal-based YouTube player and downloader"
HOMEPAGE="https://github.com/mps-youtube/yewtube"
KEYWORDS="~amd64 ~x86"

SRC_URI="https://github.com/mps-youtube/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE="+mpris"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pyreadline[${PYTHON_USEDEP}]
	dev-python/pyperclip[${PYTHON_USEDEP}]
	>=dev-python/youtube-search-python-1.6.5[${PYTHON_USEDEP}]
	net-misc/yt-dlp[${PYTHON_USEDEP}]
	mpris? (
		>=dev-python/dbus-python-1.2.18[${PYTHON_USEDEP}]
		>=dev-python/pygobject-3.42.0[${PYTHON_USEDEP}]
	)
"
