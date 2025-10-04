{ config, lib, ... }:

{
  # Definições de cores centralizadas para reutilização
  # Estas cores podem ser importadas por outros módulos
  
  _module.args.colors = {
    accent    = "#4E9AF1";
    accentAlt = "#6DB3F9";
    bg        = "#0D1117";
    bgAlt     = "#161B22";
    fg        = "#D1D5DA";
    warn      = "#FF6B6B";
    shadow    = "#000000";
    alpha67   = "AA";
  };
}
