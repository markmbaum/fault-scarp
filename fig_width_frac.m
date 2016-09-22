function [pix] = fig_width_frac(fig_pos, frac)
%Use figure dimensions in pixel units to convert a horitonal location
%to pixel units
%args:
    %fig_pos - array of figure position and dimensions in the form:
                    %[fig_x, fig_y, fig_width, fig_height]
    %x - fraction of figure width to convert to pixels
%returns:
    %pix - converted width in pixels
    
    %figure width
    w = fig_pos(3);
    %linear mapping
    pix = (w - 1)*frac + 1;

end