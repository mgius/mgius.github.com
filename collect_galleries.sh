#!/bin/bash

set -ex

site_gallery_dir=_site/images/galleries
site_gallery_index=$site_gallery_dir/index.html
site_galleries=$(ls $site_gallery_dir | grep -v index.html)

mkdir -p galleries
cp $site_gallery_index galleries/
for gallery in $site_galleries; do
   mkdir -p galleries/$gallery
   cp $site_gallery_dir/$gallery/index.html galleries/$gallery/
   cp -R $site_gallery_dir/$gallery/thumbs images/galleries/$gallery/
done
