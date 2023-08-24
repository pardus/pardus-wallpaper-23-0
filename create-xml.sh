#/bin/bash
set -e

folder=images

echo '<?xml version="1.0" encoding="UTF-8"?>' > pardus-backgrounds.xml
echo '<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">' >> pardus-backgrounds.xml
echo '<wallpapers>' >> pardus-backgrounds.xml
for file in $folder/* ; do \
    filename=`basename "$file"` ;\
    echo '  <wallpaper deleted="false">' >> pardus-backgrounds.xml ;\
    echo '    <name>'$filename'</name>' >> pardus-backgrounds.xml ;\
    echo '    <filename>/usr/share/backgrounds/'$filename'</filename>' >> pardus-backgrounds.xml ;\
    if [[ "$filename" == *"-light"* ]]; then
        filenamedark="${filename/-light/-dark}"
        if [[ -f "$folder/$filenamedark" ]]; then
            echo '    <filename-dark>/usr/share/backgrounds/'$filenamedark'</filename-dark>' >> pardus-backgrounds.xml ;\
        else
            echo '    <filename-dark>/usr/share/backgrounds/'$filename'</filename-dark>' >> pardus-backgrounds.xml ;\
        fi
    else
        echo '    <filename-dark>/usr/share/backgrounds/'$filename'</filename-dark>' >> pardus-backgrounds.xml ;\
    fi
    echo '    <options>zoom</options>' >> pardus-backgrounds.xml ;\
    echo '    <shade_type>solid</shade_type>' >> pardus-backgrounds.xml ;\
    echo '    <pcolor>#21aed8</pcolor>' >> pardus-backgrounds.xml ;\
    echo '    <scolor>#000000</scolor>' >> pardus-backgrounds.xml ;\
    echo '  </wallpaper>' >> pardus-backgrounds.xml ;\
done
echo '</wallpapers>' >> pardus-backgrounds.xml
