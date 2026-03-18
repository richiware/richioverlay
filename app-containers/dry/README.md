_ ebuild dry-0.12.2.ebuild unpack
su
cd /var/tmp/portage/app-containers/dry-0.12.2/work/dry-0.12.2
go mod vendor
cd ..
tar --create --auto-compress --file dry-0.12.2-vendor.tar.xz dry-0.12.2/vendor
mv dry-0.12.2-vendor.tar.xz /usr/local/portage/app-containers/dry/files
git add files/dry-0.12.2-vendor.tar.xz
