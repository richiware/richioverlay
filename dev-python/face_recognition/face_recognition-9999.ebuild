EAPI=6
PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1 git-r3

DESCRIPTION="Recognize faces from Python or from the command line."
HOMEPAGE="https://github.com/ageitgey/face_recognition"
EGIT_REPO_URI="https://github.com/ageitgey/face_recognition.git"

LICENSE="CC0-1.0"
SLOT="0"

DEPEND="
        >=dev-python/click-6.0[${PYTHON_USEDEP}]
        >=dev-python/face_recognition_models-0.3.0[${PYTHON_USEDEP}]
        dev-python/numpy[${PYTHON_USEDEP}]
        dev-python/pillow[${PYTHON_USEDEP}]
        >=sci-libs/dlib-19.7[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
