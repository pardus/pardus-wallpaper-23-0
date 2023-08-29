#/bin/bash
set -e

folder=images

echo '<?xml version="1.0" encoding="UTF-8"?>' > pardus-wallpaper-23-0.xml
echo '<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">' >> pardus-wallpaper-23-0.xml
echo '<wallpapers>' >> pardus-wallpaper-23-0.xml
for file in $folder/* ; do \
    filename=`basename "$file"` ;\
    echo '  <wallpaper deleted="false">' >> pardus-wallpaper-23-0.xml ;\
    echo '    <name>'$filename'</name>' >> pardus-wallpaper-23-0.xml ;\
    echo '    <filename>/usr/share/backgrounds/'$filename'</filename>' >> pardus-wallpaper-23-0.xml ;\
    if [[ "$filename" == *"-light"* ]]; then
        filenamedark="${filename/-light/-dark}"
        if [[ -f "$folder/$filenamedark" ]]; then
            echo '    <filename-dark>/usr/share/backgrounds/'$filenamedark'</filename-dark>' >> pardus-wallpaper-23-0.xml ;\
        else
            echo '    <filename-dark>/usr/share/backgrounds/'$filename'</filename-dark>' >> pardus-wallpaper-23-0.xml ;\
        fi
    else
        echo '    <filename-dark>/usr/share/backgrounds/'$filename'</filename-dark>' >> pardus-wallpaper-23-0.xml ;\
    fi
    echo '    <options>zoom</options>' >> pardus-wallpaper-23-0.xml ;\
    echo '    <shade_type>solid</shade_type>' >> pardus-wallpaper-23-0.xml ;\
    echo '    <pcolor>#21aed8</pcolor>' >> pardus-wallpaper-23-0.xml ;\
    echo '    <scolor>#000000</scolor>' >> pardus-wallpaper-23-0.xml ;\
    echo '  </wallpaper>' >> pardus-wallpaper-23-0.xml ;\
done
echo '</wallpapers>' >> pardus-wallpaper-23-0.xml
