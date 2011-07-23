# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

EGIT_REPO_URI="git://gitorious.org/cmumble/cmumble.git"
EGIT_BOOTSTRAP="eautoreconf"

inherit autotools autotools-utils git-2

DESCRIPTION="Curses based mumble client"
HOMEPAGE="https://gitorious.org/cmumble"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/protobuf-c
	>=dev-libs/glib-2.28:2
	net-libs/glib-networking[ssl]
	media-libs/gstreamer
	media-libs/celt
	media-libs/gst-plugins-base
	media-libs/gst-plugins-good
	media-plugins/gst-plugins-celt"

RDEPEND="${DEPEND}"

src_configure()
{
	# Fix access violation by gst-inspect
	GST_REGISTRY_UPDATE=no autotools-utils_src_configure
}