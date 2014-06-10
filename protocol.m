classdef protocol < hgsetget
    %PROTOCOL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        name
        delay_time_per_hop
        packet_delivery_success_ratio
        packet_delivery_efficiency
        std_delay_time_per_hop
    end
    
    properties (Access = private)
        vehi_density
        zor_zof_range
        buid_distance
    end
    
    methods (Hidden = true)
       
        function index = get_param_index(obj, param, array)
            index = 0;
            if param
                for i = 1:length(array)
                    if param == array(i)
                        index = i;
                        break;
                    end
                end
            end
        end
    end
    
    methods
        function obj = protocol(name, vehi_density, zor_zof_range, buid_distance)
            obj.name = name;
            obj.vehi_density = vehi_density;
            obj.zor_zof_range = zor_zof_range;
            obj.buid_distance = buid_distance;
        end
        
        function [scenario_index, param_index] = get_scenario_index(obj, scenario_name, param)
            switch scenario_name
                case 'vehicle_density'
                    scenario_index = 1;
                    param_index = obj.get_param_index(param, obj.vehi_density);
                case 'zor_zof_range'
                    scenario_index = 2;
                    param_index = obj.get_param_index(param, obj.zor_zof_range);
                case 'buiding_distance'
                    scenario_index = 3;
                    param_index = obj.get_param_index(param, obj.buid_distance);
                otherwise
                    scenario_index = 0;
                    param_index = 0;
            end
        end        
        
        function obj = set.delay_time_per_hop(obj, val)
            obj.delay_time_per_hop = val;
        end
        
        function obj = set.packet_delivery_success_ratio(obj, val)
            obj.packet_delivery_success_ratio = val;
        end
        
        function obj = set.packet_delivery_efficiency(obj, val)
            obj.packet_delivery_efficiency = val;
        end
        
        function obj = set.std_delay_time_per_hop(obj, val)
            obj.std_delay_time_per_hop = val;
        end
        
        function val = get.delay_time_per_hop(obj)
            val = obj.delay_time_per_hop;
        end
        
        function val = get.packet_delivery_success_ratio(obj)
            val = obj.packet_delivery_success_ratio;
        end
        
        function val = get.packet_delivery_efficiency(obj)
            val = obj.packet_delivery_efficiency;
        end
        
        function val = get.std_delay_time_per_hop(obj)
            val = obj.std_delay_time_per_hop;
        end        

    end
    
end

