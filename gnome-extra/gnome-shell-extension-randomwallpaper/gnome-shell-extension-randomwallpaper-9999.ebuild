# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2-utils

if [[ ${PV} =~ 9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ifl0w/RandomwallpaperGnome3.git"
	EGIT_BRANCH="develop"
else
	SRC_URI="https://github.com/ifl0w/RandomwallpaperGnome3/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/RandomWallpaperGnome3-${PV}"
	KEYWORDS="amd64 x86"
fi

DESCRIPTION="Fetches a random wallpaper from an online source and sets it as desktop background."
HOMEPAGE="https://github.com/ifl0w/RandomwallpaperGnome3"

LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	app-eselect/eselect-gnome-shell-extensions
	>=gnome-base/gnome-shell-3.28
"
DEPEND=""
BDEPEND=""

extension_uuid="randomwallpaper@iflow.space"

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
