#!/system/bin/sh

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

# disable core control to switch governor
write /sys/module/msm_thermal/core_control/enabled 0

# online main cores
write /sys/devices/system/cpu/cpu0/online 1
write /sys/devices/system/cpu/cpu4/online 1

# restore after online
restorecon -R /sys/devices/system/cpu

# configure little cores interactive settings
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor interactive
restorecon -R /sys/devices/system/cpu # restore after interactive
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load 1
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif 1
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay 20000
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load 85
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate 20000
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq 787200
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy 1
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads "85 960000:90 1248000:95"
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time 19000
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis 79000
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 384000
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/ignore_hispeed_on_notif 0

# configure big cores interactive settings
write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor interactive
restorecon -R /sys/devices/system/cpu # restore after interactive
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load 1
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif 1
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay 20000
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load 85
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate 19000
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq 1248000
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy 1
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads "85 1536000:90 1824000:95"
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time 19000
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis 79000
write /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq 384000
write /sys/devices/system/cpu/cpu4/cpufreq/interactive/ignore_hispeed_on_notif 0

# configure core_ctl for the big cores
# minimum 0 cpus online, maximum 2 cores
# cores are turned off at 60% load
# and on at 60% load
# cores will turn off after 100ms under 30% load
write /sys/devices/system/cpu/cpu4/core_ctl/min_cpus 0
write /sys/devices/system/cpu/cpu4/core_ctl/max_cpus 2
write /sys/devices/system/cpu/cpu4/core_ctl/busy_up_thres 90
write /sys/devices/system/cpu/cpu4/core_ctl/busy_down_thres 70
write /sys/devices/system/cpu/cpu4/core_ctl/offline_delay_ms 100
write /sys/devices/system/cpu/cpu4/core_ctl/task_thres 4
write /sys/devices/system/cpu/cpu4/core_ctl/is_big_cluster 1
chown system:system /sys/devices/system/cpu/cpu4/core_ctl/min_cpus
chown system:system /sys/devices/system/cpu/cpu4/core_ctl/max_cpus

# configure input boost
# 20ms at 787200
write /sys/module/cpu_boost/parameters/input_boost_enabled 1
write /sys/module/cpu_boost/parameters/input_boost_freq "0:787200"
write /sys/module/cpu_boost/parameters/input_boost_ms 20

# set scheduler parameters
write /proc/sys/kernel/sched_boost 0
write /proc/sys/kernel/sched_migration_fixup 1
write /proc/sys/kernel/sched_upmigrate 95
write /proc/sys/kernel/sched_downmigrate 90
write /proc/sys/kernel/sched_freq_inc_notify 400000
write /proc/sys/kernel/sched_freq_dec_notify 400000
write /proc/sys/kernel/sched_spill_nr_run 3
write /proc/sys/kernel/sched_init_task_load 100

# offline big cores
write /sys/devices/system/cpu/cpu4/online 0
write /sys/devices/system/cpu/cpu5/online 1

# enable core control
write /sys/module/msm_thermal/core_control/enabled 1

# android background processes are set to nice 10
# don't schedule them on big cores
write /proc/sys/kernel/sched_upmigrate_min_nice 9

# set gpu default power level to 5 instead of 4
write /sys/class/kgsl/kgsl-3d0/default_pwrlevel 5

# set gpu default governor to msm-adreno-tz
write /sys/class/devfreq/fdb00000.qcom,kgsl-3d0/governor msm-adreno-tz

# enable all low power modes
write /sys/module/lpm_levels/parameters/sleep_disabled 0

# auo lcd color calibration
if cat /sys/class/graphics/fb0/msm_fb_panel_info |grep -wq panel_name=auo
then
 echo 253 225 256 > /sys/devices/platform/kcal_ctrl.0/kcal
 echo 1 > /sys/devices/platform/kcal_ctrl.0/kcal_enable
fi
