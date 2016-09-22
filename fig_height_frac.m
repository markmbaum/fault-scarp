function [pix] = fig_height_frac(fig_pos, frac)
%Use figure dimensions in pixel units to convert a vertical location
%to pixel units
%args:
    %fig_pos - array of figure position and dimensions in the form:
                    %[fig_x, fig_y, fig_width, fig_height]
    %y - fraction of figure height to convert to pixels
%returns;
    %pix - converted height in pixels
    
    %figure height
    h = fig_pos(4);
    %linear mapping
    pix = 0.925*((h - 1)*frac + 1);

end

