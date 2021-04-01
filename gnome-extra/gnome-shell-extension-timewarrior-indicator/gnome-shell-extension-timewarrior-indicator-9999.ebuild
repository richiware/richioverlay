# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2-utils

inherit git-r3
EGIT_REPO_URI="https://github.com/tassos/timewarrior-indicator"

DESCRIPTION="A very simple indicator for the gnome-shell that displays the current activity tracked from timewarrior."
HOMEPAGE="https://github.com/tassos/timewarrior-indicator"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	app-eselect/eselect-gnome-shell-extensions
	>=gnome-base/gnome-shell-3.28
	app-misc/timew
"
DEPEND=""
BDEPEND=""

extension_uuid="timewarrior-indicator@natsakis.com"

src_install() {
	einstalldocs
	rm -f README.md LICENSE || die
	insinto /usr/share/glib-2.0/schemas
	doins schemas/*.xml
	rm -rf schemas
	insinto /usr/share/gnome-shell/extensions/${extension_uuid}
	doins -r *
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
