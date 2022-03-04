function f_DA_removeNil(app)

S = app.PreProcData.sumNeurons;
zs = find(S==0);

app.PreProcData.binnedData(zs,:)=[];

end



