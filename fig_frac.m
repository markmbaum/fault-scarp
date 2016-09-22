function [pix_pos] = fig_frac(fig_pos, frac_pos)
%convert a vector of [x, y, width, height] coordinates in fraction coords
%into pixel coords
%args:
    %fig_pos - array of figure position and dimensions in pixels:
                    %[fig_x, fig_y, fig_width, fig_height]
    %frac_pos - array of figure position and dimensions in fractions:
                    %[fig_x, fig_y, fig_width, fig_height]
%returns:
    %pix_pos - array of converted coordinates in pixel coordinates

x = fig_width_frac(fig_pos, frac_pos(1));
y = fig_height_frac(fig_pos, frac_pos(2));
w = fig_width_frac(fig_pos, frac_pos(3));
h = fig_height_frac(fig_pos, frac_pos(4));

pix_pos= [x, y, w, h];

end

