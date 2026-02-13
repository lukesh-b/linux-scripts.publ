#!/bin/bash

echo "===== NETWORK INFORMATION ====="
echo ""

echo "Hostname:"
hostname
echo ""

echo "IP Addresses:"
ip -brief address
echo ""

echo "Routing Table:"
ip route
echo ""

echo "Open Ports:"
ss -tuln
echo ""

echo "DNS Servers:"
grep nameserver /etc/resolv.conf
echo ""

echo "Connectivity Test (8.8.8.8):"
ping -c 4 8.8.8.8

echo ""
echo "===== DONE ====="

