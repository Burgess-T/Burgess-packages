# luci-app-alist

A file list program that supports multiple storage.

装上fuse开发包。

ubuntu/debian:
sudo apt install libfuse-dev

CentOS:
sudo yum install fuse-devel

## How to build

- Enter in your openwrt dir

- Openwrt official SnapShots

  *1. update golang 19.x (Fix build for `openwrt-21.02/22.03` branches)*
  ```shell
  rm -rf feeds/packages/lang/golang
  svn export https://github.com/sbwml/packages_lang_golang/branches/19.x feeds/packages/lang/golang
  ```

  *2. get luci-app-alist source & building*
  ```shell
  git clone https://github.com/sbwml/luci-app-alist package/alist
  make menuconfig # choose LUCI -> Applications -> luci-app-alist
  make V=s
  ```

