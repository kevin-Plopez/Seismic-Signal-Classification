clc; clear;

matFile = "/MATLAB Drive/signals.mat";
outFile = "Dataset_01_D1.ndjson";   % salida: 1 json por línea

S = load(matFile);
T = S.T;

fid = fopen(outFile,"w");
assert(fid>0, "No se pudo crear el archivo de salida.");

n = height(T);
for i = 1:n
    row = table2struct(T(i,:));    
    line = jsonencode(row);        
    fwrite(fid, line, "char");
    fwrite(fid, newline, "char");
end

fclose(fid);
fprintf("✅ NDJSON creado: %s (%d filas)\n", outFile, n);
dir(outFile)
