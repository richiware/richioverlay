# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license
EAPI=6
PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

DESCRIPTION="The bidirectional mapping library for Python."
HOMEPAGE="https://github.com/jab/bidict"
SRC_URI="https://github.com/jab/${PN}/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

IUSE="test"

DEPEND="dev-python/setuptools_scm[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply "${FILESDIR}/bidict-0.18.4-strip-setuptools_scm.patch"
	distutils-r1_src_prepare
}
