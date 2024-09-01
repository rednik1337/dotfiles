#!/bin/sh

cpupower frequency-set -g powersave
echo "power" | tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference
echo powersupersave > /sys/module/pcie_aspm/parameters/policy

