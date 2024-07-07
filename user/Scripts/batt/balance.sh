#!/bin/sh

echo "balance_power" | tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference
echo default > /sys/module/pcie_aspm/parameters/policy
