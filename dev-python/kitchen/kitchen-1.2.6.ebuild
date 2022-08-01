# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

SRC_URI="https://github.com/fedora-infra/${PN}/archive/${PV}.tar.gz"
KEYWORDS="~amd64 ~x86"

DESCRIPTION="Useful snippets of python code"
HOMEPAGE="https://github.com/fedora-infra/kitchen"
LICENSE="LGPL-2.1"
SLOT="0"

#S="${WORKDIR}/${PN}-v${PV}"

src_prepare() {
	distutils-r1_src_prepare
}
