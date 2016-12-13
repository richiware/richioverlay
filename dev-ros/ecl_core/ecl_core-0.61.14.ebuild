# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/stonier/ecl_core"
SRC_URI="https://github.com/stonier/ecl_core/archive/0.61.14.tar.gz"
KEYWORDS="~amd64 ~arm"
PYTHON_COMPAT=
ROS_SUBDIR=

inherit ros-catkin

DESCRIPTION="A set of tools and interfaces extending the capabilities of c++ to provide a lightweight, consistent interface with a focus for control programming"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="dev-ros/ecl_lite
dev-cpp/eigen
dev-ros/sophus
"
DEPEND="${RDEPEND}"
