<?php

return function ($panel) {
    // Add custom CSS to the panel
    $panel->addCss('/assets/css/atlas-theme.css');
    
    // Optional: Add custom JavaScript if needed
    // $panel->addJs('/assets/js/atlas-theme.js');
    
    // Optional: Modify panel data
    $panel->set('atlas_theme', [
        'version' => '1.0.0',
        'name' => 'Atlas Hosting Theme'
    ]);
};