# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit gnome2-utils

inherit git-r3
#EGIT_REPO_URI="https://github.com/alexduf/gnome-github-notifications.git"
EGIT_REPO_URI="https://github.com/mackdk/gnome-github-manager.git"

DESCRIPTION="Integrate github's notifications within the gnome desktop environment."
HOMEPAGE="https://github.com/alexduf/gnome-github-notifications"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	>=net-libs/libsoup-3
	app-eselect/eselect-gnome-shell-extensions
	>=gnome-base/gnome-shell-43
"
DEPEND=""
BDEPEND=""

extension_uuid="github.manager@mackdk.hotmail.com"

src_compile() {
	yarn --offline build || die
}

src_install() {
	einstalldocs
	rm -f README.md LICENSE || die
	insinto /usr/share/glib-2.0/schemas
	doins src/main/schemas/*.xml
	insinto /usr/share/gnome-shell/extensions/${extension_uuid}
	doins -r build/*
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
