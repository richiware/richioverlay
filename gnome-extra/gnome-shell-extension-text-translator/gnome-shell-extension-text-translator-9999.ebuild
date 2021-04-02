# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2-utils

if [[ ${PV} =~ 9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/gufoe/text-translator"
else
	SRC_URI="https://github.com/gufoe/text-translator/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Translation of the text by different translators."
HOMEPAGE="https://github.com/gufoe/text-translator"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	app-eselect/eselect-gnome-shell-extensions
	>=gnome-base/gnome-shell-3.28
	app-i18n/translate-shell
"
DEPEND=""
BDEPEND=""

extension_uuid="text_translator@awamper.gmail.com"

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
