function [ scenario_name,  scenario_param, protocol_name] = analysisPath( pathstr )
%ANALYSISPATH Summary of this function goes here
%   Detailed explanation goes here
sub_path_name = strsplit(pathstr, '/');
scenario_name = char(sub_path_name(2));
scenario_param = str2num(char(sub_path_name(3)));
file = sub_path_name(4);
file_component = strsplit(char(file),'.');
protocol_name = char(file_component(1));
end

