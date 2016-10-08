function make_results_tab(tabgroup)

%CONSTRUCT RESULTS TAB
results_tab = uitab('Parent', tabgroup, 'Title', 'Results',...
                    'Tag', 'results_tab');

results_ax = axes('Parent', results_tab,...
                'Units', 'normalized');

end
