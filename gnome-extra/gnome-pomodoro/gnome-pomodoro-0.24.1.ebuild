# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

VALA_MIN_API_VERSION="0.28"
VALA_USE_DEPEND="vapigen"

inherit meson vala gnome2

DESCRIPTION="Time management utility for GNOME based on the pomodoro technique"
HOMEPAGE="http://gnomepomodoro.org"
SRC_URI="https://github.com/gnome-pomodoro/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

COMMON_DEPEND="
dev-libs/dbus-glib
>=dev-libs/glib-2.38:2
>=dev-libs/gobject-introspection-1.36
>=dev-libs/libpeas-1.5.0
>=gnome-base/gnome-desktop-3.14.0:3
>=gnome-base/gsettings-desktop-schemas-3.14.0
>=media-libs/gstreamer-1.0.10
>=media-libs/libcanberra-0.30
>=net-libs/telepathy-glib-0.17.5
>=x11-libs/gtk+-3.14.0:3=[introspection]
"

DEPEND="${COMMON_DEPEND}
app-text/docbook-sgml-utils
app-text/docbook-sgml-dtd:4.1
>=sys-devel/gettext-0.19.6
virtual/pkgconfig
$(vala_depend)
"

RDEPEND="${COMMON_DEPEND}"

src_prepare() {
	vala_src_prepare
	default
}

src_configure() {
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}

pkg_postinst() {
	gnome2_schemas_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
	gnome2_schemas_update
}
