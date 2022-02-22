# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils git-r3 autotools

WANT_LIBTOOL=latest
EGIT_REPO_URI="https://github.com/pioneerspacesim/pioneer.git"
KEYWORDS="~amd64 ~x86"

DESCRIPTION="Pioneer is a space adventure game set in our galaxy at the turn of the 31st century"
HOMEPAGE="http://www.pioneerspacesim.net/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

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
DOCS="AUTHORS.txt Modelviewer.txt Quickstart.txt README.txt"

src_prepare() {
	_elibtoolize
	eaclocal
	eautoconf
	eautoheader
	eautomake
}

src_configure() {
	econf PIONEER_DATA_DIR=/usr/share/games/pioneer/data
}
