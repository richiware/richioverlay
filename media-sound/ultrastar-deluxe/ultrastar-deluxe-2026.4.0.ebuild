# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=(lua5-{1..4})

inherit autotools desktop flag-o-matic git-r3 lua-single xdg-utils

DESCRIPTION="Free and open source karaoke game"
HOMEPAGE="https://github.com/UltraStar-Deluxe/USDX"

KARAOKE_THEME_URI="https://github.com/barbeque-squared/usdx-mylittlekaraoke-theme"

if [[ ${PV} == *9999 ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/UltraStar-Deluxe/USDX.git"
else
    SRC_URI="https://github.com/UltraStar-Deluxe/USDX/archive/refs/tags/v${PV}.tar.gz"
    KEYWORDS="amd64"
    S="${WORKDIR}/USDX-${PV}"
fi

LICENSE="GPL-2"
SLOT=0
IUSE="debug midi portaudio projectm webcam"
REQUIRED_USE="${LUA_REQUIRED_USE}"

RDEPEND="${LUA_DEPS}
    virtual/opengl
	media-libs/libsdl2[opengl]
	media-libs/sdl2-image[png,jpeg]
	media-libs/freetype
	portaudio? ( =media-libs/portaudio-19* )
	media-video/ffmpeg
	dev-db/sqlite
	dev-lang/lua
	midi? ( media-libs/portmidi )
	projectm? ( <media-libs/libprojectm-3.0.0 )
	webcam? ( >=media-libs/opencv-3.0.0 )"
DEPEND="${RDEPEND}
	>=dev-lang/fpc-3.0.0
"

BDEPEND="
	dev-build/autoconf-archive
	virtual/pkgconfig
"

DOCS=({ChangeLog,COPYRIGHT}.txt README.md)

pkg_setup() {
    lua-single_pkg_setup
}

src_unpack() {
    default
    git-r3_fetch "${KARAOKE_THEME_URI}" || die "git-r3_fetch failed"
    git-r3_checkout "${KARAOKE_THEME_URI}" "${WORKDIR}/karaoke-theme" || die "git-r3_checkout failed"
}

src_prepare() {
    default
    ./autogen.sh || die
    eautoreconf
}

src_configure() {
    econf \
        $(use_with portaudio) \
        $(use_with projectm libprojectM) \
        $(use_with webcam opencv-cxx-api) \
        $(use_enable midi portmidi) \
        $(use_enable debug) ||
        die "econf failed"
}
src_compile() {
    emake LDFLAGS="$(raw-ldflags)" || die "emake failed"
}

src_install() {
    emake DESTDIR="${D}" install || die "emake install failed"

    dodoc COPYRIGHT.txt ChangeLog.txt README.md

    # Copy karaoke theme
    cp -r "${WORKDIR}/karaoke-theme/." "${ED}/usr/share/ultrastardx/" || die "Failed to copy karaoke theme files"
    rm -rf "${ED}/usr/share/ultrastardx/.git"

    # Copy avatars
    cp ${FILESDIR}/ultrastar-avatar-richi.jpg "${ED}/usr/share/ultrastardx/avatars/" || die "Failed to copy avatar image"

    doicon icons/ultrastardx-icon.svg
    make_desktop_entry ${PN} "UltraStar Deluxe"
}
