#!/bin/sh

cpupower frequency-set -g powersave
echo "power" | tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference
echo power > /sys/module/pcie_aspm/parameters/policy

