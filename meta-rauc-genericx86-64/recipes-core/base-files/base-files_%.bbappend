FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI += "file://fstab-rauc"

# Add a mount point for a shared data partition
dirs755 += "/data"
dirs755 += "/grubenv"

do_install:append () {
    if [ "${@bb.utils.contains("IMAGE_FSTYPES", "hddimg", "1", "0", d)}" != "1" ]; then
        install -m 0644 ${S}/fstab-rauc ${D}${sysconfdir}/fstab
    fi
}
