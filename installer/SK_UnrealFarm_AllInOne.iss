#define MyAppName "SK UnrealFarm"
#define MyAppVersion "1.0.0"

[Setup]
AppId={{SK-UNREALFARM}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
DefaultDirName={pf}\SK UnrealFarm
OutputDir=Output
OutputBaseFilename=SK_UnrealFarm_Setup
Compression=lzma
SolidCompression=yes

[Files]
; Manager
Source: "package\manager\manager.exe"; DestDir: "{app}"

; Worker
Source: "package\worker\worker.exe"; DestDir: "{app}"

; UI
Source: "package\ui\build\*"; DestDir: "{app}\ui"; Flags: recursesubdirs createallsubdirs

; Config
Source: "package\config.json"; DestDir: "{app}"

; NSSM
Source: "package\nssm.exe"; DestDir: "{app}"

[Dirs]
Name: "{app}\logs"

[Run]
Filename: "{app}\nssm.exe"; Parameters: "install SKUnrealFarmManager {app}\manager.exe"; Flags: runhidden
Filename: "{app}\nssm.exe"; Parameters: "start SKUnrealFarmManager"; Flags: runhidden
