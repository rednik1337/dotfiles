#!/bin/sh

echo "performance" | tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference
echo performance > /sys/module/pcie_aspm/parameters/policy
cpupower frequency-set -g performance

