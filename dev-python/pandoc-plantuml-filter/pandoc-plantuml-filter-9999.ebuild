# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1 git-r3

DESCRIPTION="Pandoc filter which converts PlantUML code blocks to PlantUML images."
HOMEPAGE="https://github.com/timofurrer/pandoc-plantuml-filter"
EGIT_REPO_URI="https://github.com/timofurrer/pandoc-plantuml-filter.git"
#EGIT_REPO_URI="https://github.com/dragosboca/pandoc-plantuml-filter.git"
#EGIT_BRANCH="develop"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	app-text/pandoc
	dev-python/pandocfilters
	"
