#!/system/bin/sh

xfrm_log_prop=`getprop persist.service.xfrm.enable`
vold_prop=`getprop vold.decrypt`
vold_propress=`getprop vold.encrypt_progress`

touch /data/logger/xfrm.log
chmod 0644 /data/logger/xfrm.log

case "$xfrm_log_prop" in
        1)
    if [ "$vold_prop" = "trigger_default_encryption" ] || [ "$vold_propress" = "0" ] ; then
        touch /cache/encryption_log/xfrm.log
        chmod 0644 /cache/encryption_log/xfrm.log
        /system/bin/ip -t xfrm monitor > /cache/encryption_log/xfrm.log
    else
        /system/bin/ip -t xfrm monitor > /data/logger/xfrm.log
    fi
        ;;
esac
