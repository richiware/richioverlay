# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit haskell-cabal git-r3

DESCRIPTION="Filter for pandoc that replaces CodeBlocks with a plantuml class with PlantUML generated UML diagrams."
HOMEPAGE="https://github.com/kbonne/pandoc-plantuml-filter"
EGIT_REPO_URI="https://github.com/kbonne/pandoc-plantuml-filter.git"
#EGIT_REPO_URI="https://github.com/dragosboca/pandoc-plantuml-filter.git"
#EGIT_BRANCH="develop"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="app-text/pandoc"
