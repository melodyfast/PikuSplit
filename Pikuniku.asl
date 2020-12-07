state("Pikuniku")
{
    byte load : "UnityPlayer.dll", 0x01466538, 0x38;
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