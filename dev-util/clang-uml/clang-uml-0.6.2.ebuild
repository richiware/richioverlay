# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == *9999* ]]; then
    EGIT_REPO_URI="https://github.com/bkryza/${PN}.git"
    scm_eclass=git-r3
else
    KEYWORDS="~amd64"
    SRC_URI="https://github.com/bkryza/${PN}/releases/download/${PV}/${P}.tar.gz"
fi

inherit cmake ${scm_eclass}

DESCRIPTION="C++ UML diagram generator based on Clang"
HOMEPAGE="https://clang-uml.github.io"

LICENSE="Apache-2.0 "
SLOT="0"

DEPEND="llvm-core/clang
        dev-cpp/yaml-cpp
       "
RDEPEND="${DEPEND}"
