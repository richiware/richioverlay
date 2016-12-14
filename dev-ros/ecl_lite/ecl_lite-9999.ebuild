# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/stonier/ecl_lite"
KEYWORDS="~amd64 ~arm"
PYTHON_COMPAT=
ROS_SUBDIR=

inherit ros-catkin

DESCRIPTION="The ecl-lite stack includes packages with few dependencies on either system or c++ functionality. This makes it ideal for very embedded builds where many of the usual mechanisms are unavailable"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="dev-ros/ecl_tools"
DEPEND="${RDEPEND}"
