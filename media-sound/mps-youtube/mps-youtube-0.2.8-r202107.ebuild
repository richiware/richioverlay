# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/mps-youtube/mps-youtube.git"
EGIT_COMMIT=4c6ee0f8f4643fc1308e637b622d0337bf9bce1b

DESCRIPTION="Terminal-based YouTube player and downloader"
HOMEPAGE="https://github.com/mps-youtube/mps-youtube https://pypi.org/project/mps-youtube/"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	dev-python/pafy[${PYTHON_USEDEP}]
	media-video/ffmpeg
	|| ( media-video/mpv media-video/mplayer )
"

PATCHES=(
	"${FILESDIR}/fix-date-and-time-error.patch"
	"${FILESDIR}/use-dict-get.patch"
	"${FILESDIR}/keyerror-data.patch"
)
