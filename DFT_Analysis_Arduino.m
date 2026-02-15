clear a;
a = arduino(); 


% 1. Configuration
dauer = 20;   % Messzeit hier eingeben

% Arrays herstellen
voltage_log = [];
time_log    = [];

disp('Starting measurement...');


startTime = tic;

% 2. While-Schleife

while toc(startTime) < dauer
    % Spannung auslesen
    v = readVoltage(a, 'A0');
    t = toc(startTime);
    
    % Daten im Array einfügen
    voltage_log(end+1) = v;
    time_log(end+1)    = t;

    writeDigitalPin(a, 'D5', 1); % LED einschalten
    
   
end

writeDigitalPin(a, 'D5', 0); % LED ausschalten

% 3. Abtastfrequenz berechnen
% Anzahl von Abtäste zählen
N = length(voltage_log);
actual_duration = time_log(end);
actual_fs = N / actual_duration;

fprintf('Finished.\n');
fprintf('Captured %d samples in %.2f seconds.\n', N, actual_duration);
fprintf('Sampling Frequency: %.2f Hz\n', actual_fs);

%Diagramme
% Zeitbereich
figure('Name', 'Raw Signal');
plot(time_log, voltage_log, '-b');
xlabel('Time (s)');
ylabel('Voltage (V)');
title(['Signal at ' num2str(actual_fs, '%.2f') ' Hz']);
grid on;

% Bildbereich
mean_voltage = mean(voltage_log);
voltage_AC = voltage_log - mean_voltage;

X_k = fft(voltage_AC);
amplitude = abs(X_k) / N;

% Waagrechte Achse Länge
freq_axis = (0:N-1) * (actual_fs / N);

figure('Name', 'Frequency Spectrum');
plot(freq_axis, amplitude, '-b');
title('Amplitude der Frequenzkomponenten');
xlabel('Frequenz / Hz');
ylabel('Amplitude / V');
grid on;
xlim([0 actual_fs]);             