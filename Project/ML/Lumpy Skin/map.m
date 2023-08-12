
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




%figure 
%axesm miller

%text(2.8,-1.8,'Miller projection','HorizontalAlignment','right')
%framem('FLineWidth',1)
%load topo60c
%geoshow(topo60c,topo60cR,'DisplayType','texturemap')

%demcmap(topo60c)
%brighten(0.5)

%load coastlines
%[rlat,rlon] = reducem(coastlat,coastlon,0.25);
%geoshow(rlat,rlon,'Color','black','LineWidth',1)
%setm(gca,'Frame', 'on')

%[lat, lon] = inputm(1) 




