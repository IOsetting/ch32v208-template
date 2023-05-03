# CH32V208 Template



## VSCode Configuration Templates

tasks.json
```
{
    // See https://go.microsoft.com/fwlink/?LinkId=733558
    // for the documentation about the tasks.json format
    "version": "2.0.0",
    "tasks": [
        {
            "label": "clean & build",
            "type": "shell",
            "command": "make clean; make -j4",
            "problemMatcher": []
        },
        {
            "label": "build",
            "type": "shell",
            "command": "make -j4"
        },
        {
            "label": "build & download",
            "type": "shell",
            "command": "make -j4; make flash"
        }
    ]
}
```

launch.json (for Cortex Debug)
```
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Cortex Debug",
            "cwd": "${workspaceFolder}",
            "executable": "${workspaceFolder}/Build/app.elf",
            "request": "launch",
            "type": "cortex-debug",
            "servertype": "openocd",
            "serverpath": "/opt/openocd/wch-openocd-v1.70/bin/openocd",
            "configFiles": [
                "${workspaceFolder}/Misc/wch-riscv.cfg.v1.70"
            ],
            "runToEntryPoint": "main",
            "runToMain": true,          // false: run to reset handler
            "preLaunchTask": "build",   // task from tasks.json
            // "preLaunchCommands": ["Build all"], if not using preLaunchTask
            "showDevDebugOutput": "none", // log level: parsed, raw, both(include parsed and raw)
            "device": "CH32V208",
            "svdFile": "${workspaceFolder}/Misc/ch32v208xx.svd",
            "toolchainPrefix": "/opt/gcc-riscv/riscv-wch-embedded-gcc-v1.70/bin/riscv-none-embed"
        }
    ]
}
```