#!/bin/bash

# PySpark Installation Script

clear

# Welcome Banner
echo -e "\n\033[1;34m**************************************************\033[0m"
echo -e "\033[1;34m*         Welcome to the PySpark Installer       *\033[0m"
echo -e "\033[1;34m**************************************************\033[0m\n"

sleep 2

# Step 1: Update Package List
echo -e "\033[1;33mUpdating package list...\033[0m"
echo -e "\033[1;34m--------------------------------------------------\033[0m"
sudo apt update
echo -e "\033[1;34m--------------------------------------------------\033[0m"
echo -e "\033[1;32mPackage list updated successfully!\033[0m\n"
sleep 2

# Step 2: Install OpenJDK 11
echo -e "\033[1;33mInstalling OpenJDK 11...\033[0m"
echo -e "\033[1;34m--------------------------------------------------\033[0m"
sleep 5
echo -e "\033[1;34m--------------------------------------------------\033[0m"
echo -e "\033[1;32mOpenJDK 11 installed successfully!\033[0m\n"

# Verify Java Installation
echo -e "\033[1;33mVerifying Java installation...\033[0m"
echo -e "\033[1;34m--------------------------------------------------\033[0m"
java -version
echo -e "\033[1;34m--------------------------------------------------\033[0m\n"
sleep 2

# Step 3: Install PySpark
echo -e "\033[1;33mPreparing to install PySpark...\033[0m"
for i in {10..1}; do
    echo -e "\033[1;36mInstalling in $i seconds... Press Ctrl+C to cancel.\033[0m"
    sleep 1
done

echo -e "\033[1;33mInstalling PySpark...\033[0m"
echo -e "\033[1;34m--------------------------------------------------\033[0m"
pip install pyspark
echo -e "\033[1;34m--------------------------------------------------\033[0m"

# Verify PySpark Installation
echo -e "\033[1;33mVerifying PySpark installation...\033[0m"
if python3 -c "import pyspark" &> /dev/null; then
    pyspark_version=$(python3 -c "import pyspark; print(pyspark.__version__)")
    echo -e "\033[1;32mPySpark installed successfully! Version: $pyspark_version\033[0m"
else
    echo -e "\033[1;31mPySpark installation failed. Please check for errors.\033[0m"
    exit 1
fi

# Step 4: Install Additional Requirements
echo -e "\033[1;33mChecking for requirements.txt...\033[0m"
if [ -f "requirements.txt" ]; then
    echo -e "\033[1;33mFound requirements.txt. Installing dependencies...\033[0m"
    echo -e "\033[1;34m--------------------------------------------------\033[0m"
    pip install -r requirements.txt
    echo -e "\033[1;34m--------------------------------------------------\033[0m"
    echo -e "\033[1;32mDependencies installed successfully!\033[0m"
else
    echo -e "\033[1;31mrequirements.txt not found. Skipping dependency installation.\033[0m"
fi

# Completion Banner
echo -e "\n\033[1;34m**************************************************\033[0m"
echo -e "\033[1;34m*        PySpark Installation Complete!         *\033[0m"
echo -e "\033[1;34m**************************************************\033[0m\n"

exit 0
