{ pkgs, lib, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "raw";
        source = ''
                                   ---.           ,-----,       --,                                               
                                  /\\\\\           \OOO0\      /OO0\                                              
                                  \/\\\\\           \OOO0\    /OOOO\                                              
                                   \/\\\\\           \OOO0\  /OOOO/                                               
                                    \/\\\\\           \OOO0\/OOOO/                                                
                              -------\/\\\\\---------  \OOOOOOOO/                                                 
                             ///////////////////////\\  \OOOOOO/                                                  
                            /\\\\\\\\\\\\\\\\\\\\\\\\\\  \OOOO0\                                                  
                           ****************************   \00000\                                                 
                                                           \OOO00\                                                 
                                  ,-----                    \O0000\    \                                                     
                                 /OOOOO/                     \00000/  /\\                                                    
                                /OOOOO/                       \000/  /\\\\                                                   
                               /0OOOO/                         \0/  /\\\\/`                                                  
                              /00OOO/                           /  /\\\\//                                                   
                ,-===========/000OO/                              //\\\//                                                    
                \0000OOOOOOOOOOOOO/                              //\\\//                                                     
                 \00000OOOOOOOOOO/                              //\\\/---------                                              
                  `*******/OOOOO/                              /\\\\\\\\\\\\\\\\                                             
                         /OOOOO/                              /\\\\\////////////;                                            
                        /OOOOO/                              /\\\\/************'                                             
                       /0OOOO/  \                           /\\\\//                                                          
                      \00OOO/  *\\                         /\\\\//                                                           
                       \000/  *///\                       /\\\\//                                                            
                        \0/  */////\                     /\\\\//                                                             
                         `    */////\                   *******                                                             
                               */////\                                                                                         
                                */////\  =============================                                                   
                                 */////\  \000OOOOOOOOOOOOOOOOOOOOOO/                                                    
                                 ///////\  \00000OOOOOOOOOO0000OOOO/                                                     
                                /////////\  `********`\OOOO\*******                                                      
                               ////\\//\//\            \OOOO\                                                            
                              ////\\/ \/\//\            \0OOO\                                                           
                             ////\\/   \/\//\            \00OO\                                                          
                             *//\\/     \/\//\            \0000\                                                         
                              ****       ``***`            ****                                             
        '';
        padding = { right = 4; top = 1; };
        height = 30;
      };
      display = {
        size.binaryPrefix = "si";
        color = "magenta";
        separator = " λ ";
        key = {
          color = "green";
          width = 14;
        };
        bar = {
          charElapsed = "─";
          charTotal = "─";
          width = 20;
        };
      };
      modules = [
        {
          type = "title";
          key = "System";
          keyColor = "cyan";
          format = "{1}@{2}";
        }
        {
          key = "OS          ";
          type = "os";
        }
        {
          key = "Kernel      ";
          type = "kernel";
        }
        {
          key = "Host        ";
          type = "host";
        }
        {
          key = "Uptime      ";
          type = "uptime";
        }
        {
          key = "Packages    ";
          type = "packages";
        }
        "break"
        {
          type = "title";
          key = "Interface";
          keyColor = "cyan";
          format = "Terminal Environment";
        }
        {
          key = "WM          ";
          type = "wm";
        }
        {
          key = "Terminal    ";
          type = "terminal";
        }
        {
          key = "Shell       ";
          type = "shell";
        }
        "break"
        {
          type = "title";
          key = "Hardware";
          keyColor = "cyan";
          format = "System Resources";
        }
        {
          key = "CPU         ";
          type = "cpu";
          temp = true;
          freq = true;
        }
        {
          key = "GPU         ";
          type = "gpu";
          temp = true;
        }
        {
          key = "Memory      ";
          type = "memory";
          format = "{used-percentage}% ({used} / {total})";
        }
        {
          key = "Disk        ";
          type = "disk";
          format = "{used-percentage}% ({used} / {total})";
        }
        {
          key = "Battery     ";
          type = "battery";
          format = "{percentage}% ({status})";
        }
        "break"
        {
          type = "colors";
          paddingLeft = 14;
          symbol = "circle";
          block = {
            width = 8;
            height = 2;
          };
        }
      ];
    };
  };
}