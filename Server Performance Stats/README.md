# [Server Performance Stats](https://github.com/VOIDkuugeki/Roadmap-Projects/tree/main/Server%20Performance%20Stats)
## The script collects and prints:

### Total CPU Usage  
Calculated from the idle CPU percentage reported by `top`.

### Memory Usage  
- Total memory  
- Used memory (with percentage)  
- Available memory (with percentage)

### Disk Usage  
- Total disk size  
- Used disk (with percentage)  
- Available disk (with percentage)

### Top 5 Processes by CPU  
Uses `ps --sort=%cpu`.

### Top 5 Processes by Memory  
Uses `ps --sort=%mem`.

## How to run:
1. Clone the repo:
```bash
git clone "https://github.com/VOIDkuugeki/Roadmap-Projects.git"
cd '.\Server Performance Stats\' 
```
2. Make the script executable:
```bash
chmod +x server-stats.sh
```
3. Run the script:
```
./server-stats.sh

