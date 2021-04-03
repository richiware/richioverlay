# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2-utils

DESCRIPTION="Removes the dropdown arrows which were introduced in Gnome 3.10 from the App Menu."
HOMEPAGE="https://github.com/mpdeimos/gnome-shell-remove-dropdown-arrows"
SRC_URI="https://github.com/mpdeimos/gnome-shell-remove-dropdown-arrows/archive/version/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	app-eselect/eselect-gnome-shell-extensions
	>=gnome-base/gnome-shell-3.28
"
DEPEND=""
BDEPEND=""

S="${WORKDIR}/gnome-shell-remove-dropdown-arrows-version-${PV}"
extension_uuid="remove-dropdown-arrows@mpdeimos.com"

src_compile() {
	ebegin "Pass compilation phase"
	eend $?
}

src_install() {
	einstalldocs
	rm -f README.md LICENSE || die
	sed -i 's/-dev//' metadata.json || die
	insinto /usr/share/gnome-shell/extensions/${extension_uuid}
	doins -r *
}

pkg_postinst() {
	ebegin "Updating list of installed extensions"
	eselect gnome-shell-extensions update
	eend $?
}
