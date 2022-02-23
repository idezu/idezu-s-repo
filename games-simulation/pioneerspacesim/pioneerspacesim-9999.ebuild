# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools desktop git-r3

DESCRIPTION="Pioneer is a space adventure game set in our galaxy at the turn of the 31st century."
HOMEPAGE="https://pioneerspacesim.net/"
EGIT_REPO_URI="https://github.com/pioneerspacesim/pioneer.git"

LICENSE="Apache-2.0 CC-BY-SA-3.0 DejaVu-licence GLEW GPL-3 ImageUsePolicy-NASASpitzerSpaceTelescope SIL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
   net-misc/curl
   dev-libs/libsigc++
   media-libs/libsdl2
   media-libs/sdl2-image
   media-libs/freetype
   media-libs/libvorbis
   media-libs/libpng
   media-libs/assimp
   media-libs/mesa
"
RDEPEND="${DEPEND}"

src_prepare() {
   default
   export PIONEER_DATA_DIR="/usr/share/pioneerspacesim"
   eautoreconf
}

src_install() {
   export PIONEER_DATA_DIR="/usr/share/pioneerspacesim"
   default

   for size in 16 22 24 32 48 64 128 256; do
      newicon -s ${size} application-icon/pngs/pioneer-${size}x${size}.png pioneer.png
   done

   make_desktop_entry "pioneer" "Pioneer" "pioneer" "Game"

} 