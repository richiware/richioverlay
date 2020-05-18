# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license
EAPI=6
PYTHON_COMPAT=( python{3_5,3_6,3_7} )

inherit distutils-r1 git-r3

DESCRIPTION="Models used by the face_recognition package."
HOMEPAGE="https://github.com/ageitgey/face_recognition_models"
EGIT_REPO_URI="https://github.com/ageitgey/face_recognition_models.git"

LICENSE="CC0-1.0"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
