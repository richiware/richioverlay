# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit bash-completion-r1
if [[ "$PV" = 9999 ]]; then
	inherit git-2
	EGIT_REPO_URI="https://github.com/elasticdog/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/elasticdog/transcrypt/archive/v${PV}.tar.gz"
	KEYWORDS="~x86 ~amd64"
fi

DESCRIPTION="configure transparent encryption of sensitive files stored in a Git repository"
HOMEPAGE="https://github.com/elasticdog/transcrypt.git"

LICENSE="MIT"
SLOT="0"
IUSE="zsh-completion bash-completion"

RDEPEND="dev-libs/openssl:0"
DEPEND="${RDEPEND}"

src_prepare() {
	eapply "${FILESDIR}"/suppress-openssl-pbkdf2-warnings.patch
	eapply_user
}

src_install() {
	dobin transcrypt
	doman man/transcrypt.1

	if use bash-completion; then
		dobashcomp "contrib/bash/${PN}"
	fi

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins "contrib/zsh/_${PN}"
	fi
}
