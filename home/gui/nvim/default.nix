{
    pkgs,
    config,
    ...
}: 

{
    home.file.".config/nvim/init.lua".source = ./init.lua;
    home.file.".config/nvim/lua/cale/init.lua".source = ./lua/cale/init.lua;
    home.file.".config/nvim/lua/cale/remap.lua".source = ./lua/cale/remap.lua;
    home.file.".config/nvim/lua/cale/set.lua".source = ./lua/cale/set.lua;
}
