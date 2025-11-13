% Define variable to store filename
filename = 'B0005'; % Can be changed to other filenames
data = load([filename, '.mat']); % Load data

% Initialize counters
discharge_count = 0;
charge_count = 0;
impedance_count = 0;

% Initialize a variable to track consecutive 'charge' cycles
prev_cycle_type = '';

% Iterate over all cycles and remove consecutive 'charge' cycles
i = 1;
while i <= length(data.(filename).cycle)
    cycle_type = data.(filename).cycle(i).type;

    % Check type and increment corresponding counters
    if strcmp(cycle_type, 'discharge')
        discharge_count = discharge_count + 1;
        prev_cycle_type = 'discharge';
    elseif strcmp(cycle_type, 'charge')
        charge_count = charge_count + 1;
        
        % Check if the previous cycle was also 'charge'
        if strcmp(prev_cycle_type, 'charge')
            % Remove the second consecutive 'charge' cycle
            data.(filename).cycle(i) = [];
            charge_count = charge_count - 1; % Adjust the count after deletion
            continue; % Skip incrementing i to check the next cycle at the same position
        end
        prev_cycle_type = 'charge';
    elseif strcmp(cycle_type, 'impedance')
        impedance_count = impedance_count + 1;
        prev_cycle_type = 'impedance';
    end
    i = i + 1;
end

% Display results
fprintf('Discharge cycles: %d\n', discharge_count);
fprintf('Charge cycles: %d\n', charge_count);
fprintf('Impedance cycles: %d\n', impedance_count);
% Save the modified data structure back to the original file
save([filename, '.mat'], '-struct', 'data');
