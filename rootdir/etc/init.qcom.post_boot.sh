#!/system/bin/sh
# Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

################################################################################
# helper functions to allow Android init like script

function write() {
    echo -n $2 > $1
}

function copy() {
    cat $1 > $2
}

function get-set-forall() {
    for f in $1 ; do
        cat $f
        write $f $2
    done
}

################################################################################

# Ensure at most one A57 is online when thermal hotplug is disabled
write /sys/devices/system/cpu/cpu4/online 1
write /sys/devices/system/cpu/cpu5/online 0

# Disable thermal and bcl hotplug
write /sys/module/msm_thermal/core_control/enabled 0
get-set-forall /sys/devices/soc.0/qcom,bcl.*/mode disable
bcl_hotplug_mask=`get-set-forall /sys/devices/soc.0/qcom,bcl.*/hotplug_mask 0`
bcl_hotplug_soc_mask=`get-set-forall /sys/devices/soc.0/qcom,bcl.*/hotplug_soc_mask 0`
get-set-forall /sys/devices/soc.0/qcom,bcl.*/mode enable

# Disable CPU retention
write /sys/module/lpm_levels/system/a53/cpu0/retention/idle_enabled 0
write /sys/module/lpm_levels/system/a53/cpu1/retention/idle_enabled 0
write /sys/module/lpm_levels/system/a53/cpu2/retention/idle_enabled 0
write /sys/module/lpm_levels/system/a53/cpu3/retention/idle_enabled 0
write /sys/module/lpm_levels/system/a57/cpu4/retention/idle_enabled 0
write /sys/module/lpm_levels/system/a57/cpu5/retention/idle_enabled 0

# Disable L2 retention
write /sys/module/lpm_levels/system/a53/a53-l2-retention/idle_enabled 0
write /sys/module/lpm_levels/system/a57/a57-l2-retention/idle_enabled 0

# Configure governor settings for little cluster
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor interactive
restorecon -R /sys/devices/system/cpu # must restore after interactive
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 38400
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 1440000
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads "29 384000:88 600000:90 787200:92 960000:93 1248000:98"
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay "0 600000:19000 787200:20000 960000:24000 1248000:38000"
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load 93
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq 600000
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/ignore_hispeed_on_notif 1
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy 1
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis 0
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time 60000
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate 50000
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack 380000
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif 1
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load 0
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/boost 0
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/align_windows 1
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration 0

# Make sure CPU 4 is online to configure big settings
write /sys/devices/system/cpu/cpu4/online 1
restorecon -R /sys/devices/system/cpu # must restore after online

# Configure governor settings for big cluster
write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor interactive
restorecon -R /sys/devices/system/cpu # must restore after interactive
write /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq 384000
write /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq 1824000
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads 98
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay "20000 960000:60000 1248000:30000"
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load 150
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq 960000
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/ignore_hispeed_on_notif 1
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy 1
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis 0
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time 60000
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate 60000
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack 380000
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif 1
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load 0
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/boost 0
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/align_windows 1
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/boostpulse_duration 0

# Set b.L scheduler parameters
write /proc/sys/kernel/sched_migration_fixup 1
write /proc/sys/kernel/sched_small_task 30
write /proc/sys/kernel/sched_mostly_idle_load 20
write /proc/sys/kernel/sched_mostly_idle_nr_run 3
write /proc/sys/kernel/sched_upmigrate 99
write /proc/sys/kernel/sched_downmigrate 85
write /proc/sys/kernel/sched_freq_inc_notify 400000
write /proc/sys/kernel/sched_freq_dec_notify 400000


# Enable rps static configuration
write /sys/class/net/rmnet_ipa0/queues/rx-0/rps_cpus 8

# Set GPU governors
get-set-forall  /sys/class/devfreq/qcom,cpubw*/governor bw_hwmon
get-set-forall  /sys/class/devfreq/qcom,mincpubw*/governor cpufreq

# Some files in /sys/devices/system/cpu are created after the restorecon of
# /sys/. These files receive the default label "sysfs".
# Restorecon again to give new files the correct label.
restorecon -R /sys/devices/system/cpu

# Set disk read ahead to 256kb
write /sys/block/mmcblk0/queue/read_ahead_kb 256

# Disable sched_boost
write /proc/sys/kernel/sched_boost 0

# Enable thermal and bcl hotplug
write /sys/module/msm_thermal/core_control/enabled 1
get-set-forall /sys/devices/soc.0/qcom,bcl.*/mode disable
get-set-forall /sys/devices/soc.0/qcom,bcl.*/hotplug_mask $bcl_hotplug_mask
get-set-forall /sys/devices/soc.0/qcom,bcl.*/hotplug_soc_mask $bcl_hotplug_soc_mask
get-set-forall /sys/devices/soc.0/qcom,bcl.*/mode enable

# Set core_ctl module parameters
write /sys/devices/system/cpu/cpu4/core_ctl/busy_up_thres 60
write /sys/devices/system/cpu/cpu4/core_ctl/busy_down_thres 30
write /sys/devices/system/cpu/cpu4/core_ctl/offline_delay_ms 100
write /sys/devices/system/cpu/cpu4/core_ctl/is_big_cluster 1
write /sys/devices/system/cpu/cpu4/core_ctl/task_thres 2

# Set GPU default power level to 5 (180MHz) instead of 4 (305MHz)
write /sys/class/kgsl/kgsl-3d0/default_pwrlevel 5

# Set Memory parameters
write /sys/module/lowmemorykiller/parameters/minfree "14746,18432,22118,25805,33038,41988"
write /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk 1
write /sys/module/lowmemorykiller/parameters/vmpressure_file_min 81250
