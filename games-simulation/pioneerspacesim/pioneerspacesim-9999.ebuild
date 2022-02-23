# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

CMAKE_MAKEFILE_GENERATOR ?= emake

inherit git-r3 cmake

EGIT_REPO_URI="https://github.com/pioneerspacesim/pioneer.git"

DESCRIPTION="Pioneer is a space adventure game set in our galaxy at the turn of the 31st century"
HOMEPAGE="http://www.pioneerspacesim.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lto"

RDEPEND="
	dev-libs/libsigc++
	net-misc/curl
	>=media-libs/assimp-3.2
	media-libs/libpng
	media-libs/libsdl2
	media-libs/libvorbis
	media-libs/sdl2-image
	virtual/opengl
	"
DEPEND="${RDEPEND}
	media-libs/freetype
	"
BDEPEND="
	dev-utils/cmake
	dev-vcs/git
	sys-devel/gcc
	"

DOCS="AUTHORS.txt Modelviewer.txt Quickstart.txt README.txt"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	mycmakeargs=(
        use lto -DENABLE_LTO=ON
		-G make
		-DCMAKE_EXPORT_COMPILE_COMMANDS=1
    )
    cmake_src_configure
}

src_compile() {
	cmake_src_compile
}
