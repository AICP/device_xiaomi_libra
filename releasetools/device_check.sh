#!/sbin/sh
#
# Copyright (C) 2016 CyanogenMod Project
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

HW_ID=`cat /sys/bootinfo/hw_version`

if [ $HW_ID == 0x230 ]; then
    # Remove fingerprint
    rm -rf /system/lib/lib_fpc_tac_shared.so
    rm -rf /system/lib/hw/fingerprint.libra.so
    rm -rf /system/lib64/lib_fpc_tac_shared.so
    rm -rf /system/lib64/hw/fingerprint.libra.so
    rm -rf /system/etc/permissions/android.hardware.fingerprint.xml
    rm -rf /system/bin/fingerprintd
else
    # Remove Edge tap settings
    rm -rf /system/app/ExtraSettings
fi
