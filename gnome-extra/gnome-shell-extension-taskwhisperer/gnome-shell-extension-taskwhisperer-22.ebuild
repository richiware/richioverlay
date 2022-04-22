# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2-utils

DESCRIPTION="Simple extension for displaying pending tasks created by TaskWarrior in GNOME Shell."
HOMEPAGE="https://github.com/cinatic/taskwhisperer"
SRC_URI="https://github.com/cinatic/taskwhisperer/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	app-eselect/eselect-gnome-shell-extensions
	>=gnome-base/gnome-shell-3.28
	app-misc/task
"
DEPEND=""
BDEPEND=""

S="${WORKDIR}/taskwhisperer-${PV}"
extension_uuid="taskwhisperer-extension@infinicode.de"

src_install() {
	einstalldocs
	rm -f README.md LICENSE || die
	insinto /usr/share/glib-2.0/schemas
	doins ${extension_uuid}/schemas/*.xml
	rm -rf schemas
	insinto /usr/share/gnome-shell/extensions
	doins -r ${extension_uuid}
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
