# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{10..13})

inherit distutils-r1 gnome2-utils meson

DESCRIPTION="Integrate AppImages into your app menu with just one click"
HOMEPAGE="https://github.com/mijorus/gearlever"
SRC_URI="https://github.com/mijorus/gearlever/archive/refs/tags/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
    app-arch/7zip
    app-arch/p7zip
	>=dev-python/dbus-python-1.2.18[${PYTHON_USEDEP}]
	>=dev-python/pyxdg-0.28[${PYTHON_USEDEP}]
	"

BDEPENDS="
	dev-python/setuptools[${PYTHON_USEDEP}]
	"

pkg_postinst() {
    gnome2_schemas_update
    xdg_icon_cache_update
}

pkg_postrm() {
    xdg_icon_cache_update
    gnome2_schemas_update
}
