state("Pikuniku", "steam")
{
    byte load : "UnityPlayer.dll", 0x01466538, 0x38;
}

state("Pikuniku", "egs")
{
    byte load : "UnityPlayer.dll", 0x017F9F88, 0x38;
}

state("Pikuniku", "gamepass")
{
    byte load : "UnityPlayer.dll", 0x01795688, 0x38;
}

init
{

    long dllSize = 0; // The size of UnityPlayer.dll
    long exeSize = 0; // The size of Pikuniku.exe

    for (int i = 0; i < modules.Length; i++) {
        if (modules[i].ModuleName == "Pikuniku.exe") {
            exeSize = modules[i].ModuleMemorySize;
        } else if (modules[i].ModuleName == "UnityPlayer.dll") {
            dllSize = modules[i].ModuleMemorySize;
        }
    }

    if (exeSize == 667648 && dllSize == 26787840) {
        // EGS 1.1
        version = "egs";
    } else if (exeSize == 667648 && dllSize == 26353664) {
        // Gamepass 1.0.5
        version = "gamepass";
    } else {
        version = "steam";
    }
}

startup
{
    refreshRate = 60;
}

split
{
    if (current.load == 1 && old.load == 0) return true;
}

isLoading
{
    return current.load == 1;
}