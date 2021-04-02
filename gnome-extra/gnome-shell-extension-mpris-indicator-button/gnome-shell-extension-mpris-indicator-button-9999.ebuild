# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2-utils

if [[ ${PV} =~ 9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/JasonLG1979/gnome-shell-extension-mpris-indicator-button.git"
else
	SRC_URI="https://github.com/JasonLG1979/gnome-shell-extension-mpris-indicator-button/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

DESCRIPTION="A full featured MPRIS indicator button extension for GNOME Shell."
HOMEPAGE="https://github.com/JasonLG1979/gnome-shell-extension-mpris-indicator-button"

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

extension_uuid="mprisindicatorbutton@JasonLG1979.github.io"

src_install() {
	einstalldocs
	rm -f README.md LICENSE || die
	insinto /usr/share/gnome-shell/extensions
	doins -r ${extension_uuid}
}

pkg_postinst() {
	ebegin "Updating list of installed extensions"
	eselect gnome-shell-extensions update
	eend $?
}
