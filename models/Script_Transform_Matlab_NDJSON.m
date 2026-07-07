clc; clear;

matFile = "/MATLAB Drive/signals_base_2024_dic_with_spectrograms.mat";
outFile = "Dataset_02_D2.ndjson";   % 1 json por línea

S = load(matFile);
T = S.T;

% --- QUITAR COLUMNA(S) POR NOMBRE ---
colsToRemove = ["SpecImageResize","image_name"];  % <-- cambia esto (puedes poner varias)
colsToRemove = colsToRemove(ismember(colsToRemove, string(T.Properties.VariableNames))); % evita error si no existe
T(:, colsToRemove) = [];

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
