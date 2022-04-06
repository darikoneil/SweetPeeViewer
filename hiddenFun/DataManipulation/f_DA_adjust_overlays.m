function f_DA_adjust_overlays(app)
% Darik ONeil Function to Adjust Overlays that are cropped to contain the
% full image

ops = app.ImData.imParams.suite2p.fops;

[sX,sY] = size(ops.refImg);

%remember zero indexed in python
xrange = ops.xrange;
yrange = ops.yrange;

%Adjust max projection
newMaxProj = zeros(sX,sY);
newMaxProj((yrange(1)+1):yrange(2), (xrange(1)+1):xrange(2)) = ops.max_proj;
ops.max_proj = newMaxProj;

%Adjust V correlation
newVCorr = zeros(sX,sY);
newVCorr((yrange(1)+1):yrange(2), (xrange(1)+1):xrange(2)) = ops.Vcorr;
ops.Vcorr = newVCorr;

app.ImData.imParams.suite2p.fops = ops;
end

