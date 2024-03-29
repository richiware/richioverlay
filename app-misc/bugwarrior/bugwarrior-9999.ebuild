# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

if [[ ${PV} =~ 9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ralphbean/bugwarrior.git"
else
	SRC_URI="${HOMEPAGE}archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~*"
fi

HOMEPAGE="https://github.com/ralphbean/bugwarrior/"

DESCRIPTION="Sync github, bitbucket, and trac issues with taskwarrior"

LICENSE="GPL-3"
SLOT="0"
IUSE="keyring jira bugzilla gmail"

REQUIRED_USE=""

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/taskw-0.8[${PYTHON_USEDEP}]
	dev-python/python-email-validator[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.7.2[${PYTHON_USEDEP}]
	>=dev-python/dogpile-cache-0.5.3[${PYTHON_USEDEP}]
	>=dev-python/lockfile-0.9.1[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	|| (
		<dev-python/future-0.16.0
		>dev-python/future-0.16.0
	)
	keyring? (
		dev-python/keyring[${PYTHON_USEDEP}]
		dev-python/dbus-python[${PYTHON_USEDEP}]
	)
	jira? ( >=dev-python/jira-0.22 )
	bugzilla? ( dev-python/python-bugzilla )
	gmail? (
		dev-python/google-api-python-client
		<dev-python/oauth2client-4.0.0
	)
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"

src_prepare() {
	eapply "${FILESDIR}"/overcome-pt0s-tw-error.patch
	eapply_user
}

python_install() {
    rm -r "${BUILD_DIR}"/lib/tests || die
    distutils-r1_python_install
}
