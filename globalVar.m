classdef globalVar<handle%SingleInstance
    %GLOBALVAR Summary of this class goes here
    %   Detailed explanation goes here
    properties
         global_vehi_density = [50, 100, 150, 200, 250, 300];
         global_zor_zof_range = [600, 680, 760, 840, 920, 1000];
         global_buid_distance = [10, 20, 30, 40, 50, 60];
         global_accept_delay_time = 0.01;%unit seconds        
    end
    
    properties
        global_protocols
        global_protocols_keys
    end
    
    methods
        function obj = globalVar()
             obj.global_protocols = containers.Map;
             obj.global_protocols_keys = [];
        end
        
        function obj = set.global_protocols(obj, val)
           obj.global_protocols = val;
        end
        
        function obj = set.global_protocols_keys(obj, val)
            obj.global_protocols_keys = val;
        end
        
        function obj = set.global_vehi_density(obj, val)
            obj.global_vehi_density = val;
        end
        
        function obj = set.global_zor_zof_range(obj, val)
           obj.global_zor_zof_range = val;
        end
        
        function obj = set.global_buid_distance(obj, val)
           obj.global_buid_distance = val;
        end
        
        function obj = set.global_accept_delay_time(obj, val)
           obj.global_accept_delay_time = val;
        end        
        
        function val = get.global_protocols(obj)
            val = obj.global_protocols;
        end
        
        function val = get.global_protocols_keys(obj)
           val = obj.global_protocols_keys; 
        end
        
        function val = get.global_vehi_density(obj)
            val = obj.global_vehi_density;
        end
        
        function val = get.global_zor_zof_range(obj)
           val = obj.global_zor_zof_range; 
        end
        
        function val = get.global_buid_distance(obj)
           val = obj.global_buid_distance; 
        end
        
        function val = get.global_accept_delay_time(obj)
           val = obj.global_accept_delay_time; 
        end
    end
    
end

