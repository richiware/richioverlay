# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license
EAPI=6
PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

DESCRIPTION="An extension for colcon-core to support mixin repositories."
HOMEPAGE="https://colcon.readthedocs.io"
SRC_URI="https://github.com/colcon/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

IUSE="test"
DEPEND=">=dev-python/colcon-core-0.7.0[${PYTHON_USEDEP}]
        dev-python/pyyaml"
RDEPEND="${DEPEND}"
