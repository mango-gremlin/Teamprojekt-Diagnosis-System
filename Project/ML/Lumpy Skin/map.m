function [lat, lon] = map()
    gx = geoaxes;
    latSouth = -38;
    lonSouth = 20;
    latNorth = 75;
    lonNorth = 150;
    geoplot(gx,[latSouth latNorth],[lonSouth lonNorth],'g-*')
    geobasemap(gx,'bluegreen')

    [lat, lon] = ginput(1);
    close
    return
end
