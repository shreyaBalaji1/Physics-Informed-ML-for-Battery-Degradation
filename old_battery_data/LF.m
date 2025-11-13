clear; clc;

% 定义变量来存储文件名
filename = 'B0018'; % 可以修改为其他文件名
data = load([filename, '.mat']); % 加载数据
err=0.015;
% (j) * (1 + err * noise);

% 使用动态字段名访问
cycle = data.(filename).cycle;

% 遍历所有的 cycle
for i = 1:length(cycle)
    if strcmp(cycle(i).type, 'discharge') % 只处理 'discharge  ' 类型的循环
        % 获取当前的 cycle 的数据
        cycle_data = cycle(i).data;
        
        % white noise
         % for j = 1:length(cycle_data.Voltage_measured) % 修正了循环条件
         %    % 生成-1到1之间的均匀分布随机数
         %    noise = 2 * rand - 1;
         %    % 将噪声乘以误差比例
         %    cycle_data.Voltage_measured(j) = cycle_data.Voltage_measured(j) * (1 + err * noise);
         %    cycle_data.Current_measured(j) = cycle_data.Current_measured(j) * (1 + err * noise);
         %    cycle_data.Temperature_measured(j) = cycle_data.Temperature_measured(j) * (1 + err * noise);
         %    cycle_data.Current_load(j) = cycle_data.Current_load(j) * (1 + err * noise);
         %    cycle_data.Voltage_load(j) = cycle_data.Voltage_load(j) * (1 + err * noise);
         % end
         %  cycle_data.Capacity = cycle_data.Capacity * (1 + err * noise);
        
        % normal distribution noise
        for j = 1:length(cycle_data.Voltage_measured) % 修正了循环条件
            cycle_data.Voltage_measured(j) = cycle_data.Voltage_measured(j) * (1 + err * randn);
            cycle_data.Current_measured(j) = cycle_data.Current_measured(j) * (1 + err * randn);
            cycle_data.Temperature_measured(j) = cycle_data.Temperature_measured(j) * (1 + err * randn);
            cycle_data.Current_load(j) = cycle_data.Current_load(j) * (1 + err * randn);
            cycle_data.Voltage_load(j) = cycle_data.Voltage_load(j) * (1 + err * randn);
        end 
        cycle_data.Capacity = cycle_data.Capacity * (1 + err * randn);
              

        
        % 将修改后的数据保存回 cycle 中
        cycle(i).data = cycle_data;
    end
end

% 创建一个新的 1x1 结构体来封装 cycle
B0018_LF.cycle = cycle;  % 封装 cycle 到 resultStruct 中

% 将修改后的数据保存到一个新的 MAT 文件
save('B0018_LF.mat', 'B0018_LF');  % 保存修改后的数据
