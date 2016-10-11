function [hu, hd] = get_rmse_annotation_handles(handles)

hu = {handles.rmse_1u;
      handles.rmse_2u;
      handles.rmse_3u,
      handles.rmse_4u;
      handles.rmse_5u;
      handles.rmse_6u};

hd = {handles.rmse_1d;
      handles.rmse_2d;
      handles.rmse_3d,
      handles.rmse_4d;
      handles.rmse_5d;
      handles.rmse_6d};

for i = 1:6
    hu{i}.String = '';
    hd{i}.String = '';
end

end
