# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{10..14})
inherit distutils-r1

DESCRIPTION="Terminal-based YouTube player and downloader"
HOMEPAGE="https://github.com/mps-youtube/yewtube"
KEYWORDS="~amd64 ~x86"

if [[ ${PV} == "9999" ]]; then
    EGIT_REPO_URI="https://github.com/mps-youtube/yewtube.git"
    inherit git-r3
else
    SRC_URI="https://github.com/mps-youtube/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
    KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="+mpris"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pyreadline[${PYTHON_USEDEP}]
	dev-python/pyperclip[${PYTHON_USEDEP}]
	>=dev-python/youtube-search-python-1.6.5[${PYTHON_USEDEP}]
	>=net-misc/yt-dlp-2023.9.24[${PYTHON_USEDEP}]
	dev-python/pylast[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	mpris? (
		>=dev-python/dbus-python-1.2.18[${PYTHON_USEDEP}]
		>=dev-python/pygobject-3.42.0[${PYTHON_USEDEP}]
	)
	|| ( media-video/mplayer media-video/mpv )
"

src_prepare() {
    # bug #939186
    sed -i 's/from pip\._vendor //' mps_youtube/__init__.py || die

    distutils-r1_src_prepare
}
