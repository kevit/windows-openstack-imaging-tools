IMAGE=output/windows-server-2012-r2.qcow2
FLOPPY=Autounattend.vfd
VIRTIO_ISO=iso/virtio-win-0.1-81.iso
ISO=iso/win2012r2.iso

python -m SimpleHTTPServer 8081 &

KVM=/usr/libexec/qemu-kvm
if [ ! -f "$KVM" ]; then
    KVM=/usr/bin/kvm
fi

qemu-img create -f qcow2 -o preallocation=metadata $IMAGE 16G

$KVM -m 2048 -smp 2 -cdrom $ISO -drive file=$VIRTIO_ISO,index=3,media=cdrom -fda $FLOPPY $IMAGE -boot d -vga std -k en-us -vnc :1
