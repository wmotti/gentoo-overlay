# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit autotools autotools-utils

MY_PN="gstreamer-vaapi"
DESCRIPTION="GStreamer VA-API plugins"
HOMEPAGE="http://www.splitted-desktop.com/~gbeauchesne/gstreamer-vaapi/"
SRC_URI="http://www.splitted-desktop.com/~gbeauchesne/${MY_PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

DEPEND="dev-libs/glib:2
	virtual/opengl
	x11-libs/libX11	
	>=media-libs/gstreamer-0.10.0
	>=media-libs/gst-plugins-base-0.10.16
	x11-libs/libva
	>=virtual/ffmpeg-0.6"
RDEPEND="${DEPEND}"

DOCS=(AUTHORS README COPYING NEWS)

S="${WORKDIR}/${MY_PN}-${PV}"

src_configure() {
	local myeconfargs=(
		--enable-glx
		--enable-vaapi-glx
		--enable-vaapisink-glx
	)
	autotools-utils_src_configure
}
