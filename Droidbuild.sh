include_if_exists "$BASEDIR/incremental_vars.sh"

droidbuild_module(){
  LOCAL_PATH=$(dirname $BASH_SOURCE)
  if ndef BOOTLOADER_LOCK_SUPPORT; then
     info "Patching init.rc to support hardenned malloc"
     exec "echo 'write /proc/sys/vm/max_map_count 1048576' >> $BASEDIR/system/core/rootdir/init.rc" 
     success "Patched init.rc for hardened malloc support"
     echo "HARDENED_MALLOC=1" >> $BASEDIR/incremental_vars.sh
  else
     success "Hardened malloc support is already present"
  fi
}
