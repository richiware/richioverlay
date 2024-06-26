# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license
EAPI=8
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="A shell function for colcon-core to change the current working directory."
HOMEPAGE="https://colcon.readthedocs.io"
SRC_URI="https://github.com/colcon/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

IUSE=""
DEPEND=">=dev-python/colcon-core-0.4.1[${PYTHON_USEDEP}]
        dev-python/colcon-package-information[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
