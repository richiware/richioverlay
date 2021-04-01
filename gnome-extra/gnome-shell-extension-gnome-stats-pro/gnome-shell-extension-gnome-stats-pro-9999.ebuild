# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2-utils

if [[ ${PV} =~ 9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tpenguin/gnome-stats-pro"
else
	SRC_URI="https://github.com/tpenguin/gnome-stats-pro/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Brings easy visualization of system resources."
HOMEPAGE="https://github.com/tpenguin/gnome-stats-pro"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	app-eselect/eselect-gnome-shell-extensions
	>=gnome-base/gnome-shell-3.28
	gnome-base/libgtop
"
DEPEND=""
BDEPEND=""

extension_uuid="gnome-stats-pro@thrallingpenguin.com"

src_install() {
	einstalldocs
	rm -f README.md LICENSE.md || die
	insinto /usr/share/gnome-shell/extensions/${extension_uuid}
	doins -r *
}

pkg_postinst() {
	ebegin "Updating list of installed extensions"
	eselect gnome-shell-extensions update
	eend $?
}
