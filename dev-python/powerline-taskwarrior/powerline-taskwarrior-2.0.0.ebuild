# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license
EAPI=8
PYTHON_COMPAT=( python3_{10..12} )

DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

DESCRIPTION="A Powerline segment for displaying information from Taskwarrior task manager."
HOMEPAGE="https://github.com/Zebradil/powerline-taskwarrior"
SRC_URI="https://github.com/Zebradil/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

IUSE="test"

DEPEND="app-shells/powerline[${PYTHON_USEDEP}]
        >=app-misc/task-2.4.2
        "
RDEPEND="${DEPEND}"
