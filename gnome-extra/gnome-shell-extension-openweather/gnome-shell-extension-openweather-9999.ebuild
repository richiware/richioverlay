# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit autotools git-r3 gnome2-utils

DESCRIPTION="Simple extension for displaying weather conditions and forecasts."
HOMEPAGE="https://gitlab.com/jenslody/gnome-shell-extension-openweather"
EGIT_REPO_URI="https://gitlab.com/jenslody/gnome-shell-extension-openweather"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	app-eselect/eselect-gnome-shell-extensions
	>=gnome-base/gnome-shell-3.28
"

DEPEND=""
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf
}

src_install() {
	default
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
	ebegin "Updating list of installed extensions"
	eselect gnome-shell-extensions update
	eend $?
}

pkg_postrm() {
	gnome2_schemas_update
}
