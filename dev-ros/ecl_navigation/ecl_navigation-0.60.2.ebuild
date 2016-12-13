# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/stonier/ecl_navigation"
SRC_URI="https://github.com/stonier/ecl_navigation/archive/0.60.2.tar.gz"
KEYWORDS="~amd64 ~arm"
PYTHON_COMPAT=
ROS_SUBDIR=

inherit ros-catkin

DESCRIPTION="This stack aims to bring the common tools and algorithms needed to develop navigation algorithms, in particular slam. It does not focus on the end-point solution, rather the tools needed to create a variety of end-point solutions"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="dev-ros/ecl_core"
DEPEND="${RDEPEND}"
