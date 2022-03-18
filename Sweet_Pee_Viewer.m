classdef Sweet_Pee_Viewer < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        IOPanel                         matlab.ui.container.Panel
        CompiledPath                    matlab.ui.control.EditField
        OptionsPath                     matlab.ui.control.EditField
        LoggingConsoleLabel             matlab.ui.control.Label
        BrowseCompiled                  matlab.ui.control.Button
        BrowseOptions                   matlab.ui.control.Button
        LoadCompiled                    matlab.ui.control.Button
        LoadOptions                     matlab.ui.control.Button
        HiRasLabel                      matlab.ui.control.Label
        v082Label                       matlab.ui.control.Label
        LogTextArea                     matlab.ui.control.TextArea
        Suite2PPath                     matlab.ui.control.EditField
        BrowseSuite2P                   matlab.ui.control.Button
        ImportImaging                   matlab.ui.control.Button
        FIssaPath                       matlab.ui.control.EditField
        BrowseFissa                     matlab.ui.control.Button
        TabGroup                        matlab.ui.container.TabGroup
        ROIsTab                         matlab.ui.container.Tab
        CalciumTracePlottingPanel       matlab.ui.container.Panel
        FissaLabel                      matlab.ui.control.Label
        PlotTrace_F_fissa               matlab.ui.control.CheckBox
        PlotTrace_Fneu_fissa            matlab.ui.control.CheckBox
        PlotTrace_cF_fissa              matlab.ui.control.CheckBox
        PlotTrace_AdcF_fissa            matlab.ui.control.CheckBox
        PlotTrace_sep_fissa             matlab.ui.control.CheckBox
        PlotTrace_nPil_fissa            matlab.ui.control.CheckBox
        PlotTrace_dFdT_fissa            matlab.ui.control.CheckBox
        PlotTrace_Decon_fissa           matlab.ui.control.CheckBox
        Suite2PLabel                    matlab.ui.control.Label
        PlotTrace_F_suite2p             matlab.ui.control.CheckBox
        PlotTrace_Fneu_suite2p          matlab.ui.control.CheckBox
        PlotTrace_cF_suite2p            matlab.ui.control.CheckBox
        PlotTrace_AdcF_suite2p          matlab.ui.control.CheckBox
        PlotTrace_dFdT_suite2p          matlab.ui.control.CheckBox
        PlotTrace_Decon                 matlab.ui.control.CheckBox
        PlotTrace_dFdT_fissa_2          matlab.ui.control.CheckBox
        Panel                           matlab.ui.container.Panel
        UseYLimitsCheckBox              matlab.ui.control.CheckBox
        UseXLimitsCheckBox              matlab.ui.control.CheckBox
        XLimitUpper                     matlab.ui.control.NumericEditField
        XLimitLower                     matlab.ui.control.NumericEditField
        YLimitLower                     matlab.ui.control.NumericEditField
        YLimitUpper                     matlab.ui.control.NumericEditField
        OverlayDropDown                 matlab.ui.control.DropDown
        Scaling                         matlab.ui.control.DropDown
        CDMapDropDown                   matlab.ui.control.DropDown
        NeuronalROIs                    matlab.ui.control.UIAxes
        RemovedROIs                     matlab.ui.control.UIAxes
        CellSelected                    matlab.ui.control.UIAxes
        TracePlot                       matlab.ui.control.UIAxes
        Deconvolution                   matlab.ui.container.Tab
        MCMCTempPanel                   matlab.ui.container.Panel
        AROrderEditFieldLabel           matlab.ui.control.Label
        AROrderEditField                matlab.ui.control.NumericEditField
        gEditFieldLabel                 matlab.ui.control.Label
        gEditField                      matlab.ui.control.NumericEditField
        BurnInEditFieldLabel            matlab.ui.control.Label
        BurnInEditField                 matlab.ui.control.NumericEditField
        RiseEditFieldLabel              matlab.ui.control.Label
        RiseEditField                   matlab.ui.control.NumericEditField
        DecayEditFieldLabel             matlab.ui.control.Label
        DecayEditField                  matlab.ui.control.NumericEditField
        DtEditFieldLabel                matlab.ui.control.Label
        DtEditField                     matlab.ui.control.NumericEditField
        gEditField_2                    matlab.ui.control.NumericEditField
        RunButton                       matlab.ui.control.Button
        DisplayedCellEditFieldLabel     matlab.ui.control.Label
        DisplayedCellEditField          matlab.ui.control.NumericEditField
        RunAllButton                    matlab.ui.control.Button
        UpdateTauButton                 matlab.ui.control.Button
        RunAllParallelButton            matlab.ui.control.Button
        MCMC_X                          matlab.ui.control.CheckBox
        MCMC_Y                          matlab.ui.control.CheckBox
        MCMC_X_Min                      matlab.ui.control.NumericEditField
        MCMC_X_Max                      matlab.ui.control.NumericEditField
        MCMC_Y_Min                      matlab.ui.control.NumericEditField
        MCMC_Y_Max                      matlab.ui.control.NumericEditField
        UPDATEPLOTSButton               matlab.ui.control.Button
        MCMC_Axes_1                     matlab.ui.control.UIAxes
        MCMC_Axes_3                     matlab.ui.control.UIAxes
        Preprocessing                   matlab.ui.container.Tab
        ProcessingParametersPanel       matlab.ui.container.Panel
        BinSizeEditFieldLabel           matlab.ui.control.Label
        BinSizeEditField                matlab.ui.control.NumericEditField
        PerformBinningButton            matlab.ui.control.Button
        HighActivityThresholdEditFieldLabel  matlab.ui.control.Label
        HighActivityThresholdEditField  matlab.ui.control.NumericEditField
        thresholdHA                     matlab.ui.control.Button
        RemoveNilNeuronsButton          matlab.ui.control.Button
        thresholdLA                     matlab.ui.control.Button
        ExportButton                    matlab.ui.control.Button
        PlotOptionsDropDownLabel        matlab.ui.control.Label
        PlotOptionsDropDown             matlab.ui.control.DropDown
        SOMETHINPanel                   matlab.ui.container.Panel
        TextArea_2                      matlab.ui.control.TextArea
        BinDurationEditFieldLabel       matlab.ui.control.Label
        BinDurationEditField            matlab.ui.control.NumericEditField
        ActivityMEANEditFieldLabel      matlab.ui.control.Label
        meanHAField                     matlab.ui.control.NumericEditField
        STDEVEditFieldLabel             matlab.ui.control.Label
        stdevHAField                    matlab.ui.control.NumericEditField
        STDEVEditFieldLabel_2           matlab.ui.control.Label
        stdevLAField                    matlab.ui.control.NumericEditField
        ActivityMEANEditField_2Label    matlab.ui.control.Label
        meanLAField                     matlab.ui.control.NumericEditField
        thresholdHyper                  matlab.ui.control.Button
        InitializeButton                matlab.ui.control.Button
        ImportUDFButton                 matlab.ui.control.Button
        ProcessUDFButton                matlab.ui.control.Button
        LowActivityThresholdEditFieldLabel  matlab.ui.control.Label
        LowActivityThresholdEditField   matlab.ui.control.NumericEditField
        HyperactiveThresholdEditFieldLabel  matlab.ui.control.Label
        HyperactiveThresholdEditField   matlab.ui.control.NumericEditField
        EmptySpacePanel                 matlab.ui.container.Panel
        TextArea                        matlab.ui.control.TextArea
        UIAxes2                         matlab.ui.control.UIAxes
        VideoMask                       matlab.ui.container.Tab
        Tab_3                           matlab.ui.container.Tab
        ROISelectionPanel               matlab.ui.container.Panel
        ROILabel                        matlab.ui.control.Label
        SelectedCell                    matlab.ui.control.Spinner
        SaveButton                      matlab.ui.control.Button
        AUTOSAVEONCLOSECheckBox         matlab.ui.control.CheckBox
        FilenameEditFieldLabel          matlab.ui.control.Label
        FilenameEditField               matlab.ui.control.EditField
        NeuronsEditFieldLabel           matlab.ui.control.Label
        NeuronsEditField                matlab.ui.control.NumericEditField
        DroppedEditFieldLabel           matlab.ui.control.Label
        DroppedEditField                matlab.ui.control.NumericEditField
        TabGroup2                       matlab.ui.container.TabGroup
        SelectedROIDetails              matlab.ui.container.Tab
        CellProbabilityEditFieldLabel   matlab.ui.control.Label
        SNREditFieldLabel               matlab.ui.control.Label
        SNREditField                    matlab.ui.control.NumericEditField
        CellProbabilityEditField        matlab.ui.control.NumericEditField
        RadiusEditField                 matlab.ui.control.NumericEditField
        RadiusEditFieldLabel            matlab.ui.control.Label
        SolidityEditField               matlab.ui.control.NumericEditField
        SolidityLabel                   matlab.ui.control.Label
        FootprintEditField              matlab.ui.control.NumericEditField
        FootprintEditFieldLabel         matlab.ui.control.Label
        CompactnessEditField            matlab.ui.control.NumericEditField
        CompactnessEditFieldLabel       matlab.ui.control.Label
        SomaPixelsEditFieldLabel        matlab.ui.control.Label
        SkewEditField                   matlab.ui.control.NumericEditField
        TotalPixelsEditFieldLabel       matlab.ui.control.Label
        AspectEditField                 matlab.ui.control.NumericEditField
        AspectEditField_2Label          matlab.ui.control.Label
        TotalPixelsEditField            matlab.ui.control.NumericEditField
        SkewEditField_2Label            matlab.ui.control.Label
        SomaPixelsEditField             matlab.ui.control.NumericEditField
        Switch                          matlab.ui.control.Switch
        NormSoma_EditLabel              matlab.ui.control.Label
        NormTotal_EditLabel             matlab.ui.control.Label
        NormTotal_EditField             matlab.ui.control.NumericEditField
        NormSoma_EditField              matlab.ui.control.NumericEditField
        SNRS2P_EditLabel                matlab.ui.control.Label
        SNRS2P_EditField                matlab.ui.control.NumericEditField
        NoiseStd_EditLabel              matlab.ui.control.Label
        NoiseStd_EditField              matlab.ui.control.NumericEditField
        UIAxes                          matlab.ui.control.UIAxes
        Neuropil_Close                  matlab.ui.control.UIAxes
        Threshold                       matlab.ui.container.Tab
        ThresholdValueEditFieldLabel    matlab.ui.control.Label
        ThresholdValueEditField         matlab.ui.control.NumericEditField
        ThresholdButton                 matlab.ui.control.Button
        ResetButton                     matlab.ui.control.Button
        AllButton                       matlab.ui.control.Button
        NoneButton                      matlab.ui.control.Button
        OperatorButtonGroup             matlab.ui.container.ButtonGroup
        LessThanButton                  matlab.ui.control.RadioButton
        GreaterThanButton               matlab.ui.control.RadioButton
        ThresholdTypeDropDown           matlab.ui.control.DropDown
        StatDistribution                matlab.ui.control.UIAxes
        RestaurantattheendoftheuniverseLabel  matlab.ui.control.Label
        RestaurantattheendoftheuniverseLabel_2  matlab.ui.control.Label
        RestaurantattheendoftheuniverseLabel_3  matlab.ui.control.Label
        RestaurantattheendoftheuniverseLabel_4  matlab.ui.control.Label
    end

    
    properties (Access = private)
       
    end
    
    properties (Access = public)
          log;
          log_line=1;
          file_loc_compiled;
          file_loc_options;
          file_loc_suite2p;
          file_path_suite2p
          file_loc_fissa;
          ImData=struct();
          plotTraceStyles=struct();
          limitTracePlot_X=0;
          limitTracePlot_Y=0;
          suite2p_filename;  % Filename for saving
          autosave;
          PreProcData;
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
          
            % Ensure we are in the appropriate directory & Add Paths
            procDir = fileparts(which('Sweet_Pee_Viewer'));
            if exist([procDir '\hiddenFun'],'dir')
                addpath([procDir '\hiddenFun']);
            else
                f_DA_update_log(app, 'ROBO RAFA: You need to move to Sweet Pee Viewer directory and reopen GUI!!!');
            end
            
            % startup the app
            f_DA_startup(app);
            %initialize some parameters below
            f_DA_plotTraceStyles_constructor(app);
        end

        % Button pushed function: BrowseCompiled
        function BrowseCompiledButtonPushed(app, event)
            f_DA_browse_compiled(app);
        end

        % Button pushed function: BrowseOptions
        function BrowseOptionsButtonPushed(app, event)
            f_DA_browse_options(app);
        end

        % Button pushed function: BrowseFissa
        function BrowseFissaButtonPushed(app, event)
           f_DA_browse_fissa(app);
        end

        % Button pushed function: BrowseSuite2P
        function BrowseSuite2PButtonPushed(app, event)
            f_DA_browse_suite2p(app);
        end

        % Button pushed function: LoadCompiled
        function LoadCompiledButtonPushed(app, event)
            f_DA_load_compiled(app);
            f_DA_plotTraceStyles_constructor(app);
            f_DA_initialize_ROIs(app);
            f_DA_update_trace_plots(app);
            f_DA_update_ROIs(app);
            f_DA_collect_stat_distributions(app);
            f_DA_plotStatDistribution(app);
            f_DA_update_log(app,'READY TO PLAY 0w0')
        end

        % Button pushed function: LoadOptions
        function LoadOptionsButtonPushed(app, event)
            f_DA_load_options(app);
        end

        % Button pushed function: ImportImaging
        function ImportImagingButtonPushed(app, event)
            f_DA_import_parse_imaging(app);
            f_DA_plotTraceStyles_constructor(app);
            f_DA_initialize_ROIs(app);
            f_DA_update_trace_plots(app);
            f_DA_update_ROIs(app);
            f_DA_collect_stat_distributions(app);
            f_DA_plotStatDistribution(app);
            app.FilenameEditField.Value = app.suite2p_filename;
            f_DA_update_log(app,'READY TO PLAY 0w0')
        end

        % Value changed function: UseXLimitsCheckBox
        function UseXLimitsCheckBoxValueChanged(app, event)
            value = app.UseXLimitsCheckBox.Value;
            app.limitTracePlot_X=value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: PlotTrace_F_suite2p
        function PlotTrace_F_suite2pValueChanged(app, event)
            value = app.PlotTrace_F_suite2p.Value;
            app.plotTraceStyles.PlotF_suite2p  = value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: PlotTrace_Fneu_suite2p
        function PlotTrace_Fneu_suite2pValueChanged(app, event)
            value = app.PlotTrace_Fneu_suite2p.Value;
            app.plotTraceStyles.PlotFNeu_suite2p=value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: PlotTrace_cF_suite2p
        function PlotTrace_cF_suite2pValueChanged(app, event)
            value = app.PlotTrace_cF_suite2p.Value;
            app.plotTraceStyles.PlotcF_suite2p=value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: PlotTrace_AdcF_suite2p
        function PlotTrace_AdcF_suite2pValueChanged(app, event)
            value = app.PlotTrace_AdcF_suite2p.Value;
            app.plotTraceStyles.PlotAdcF_suite2p=value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: PlotTrace_dFdT_suite2p
        function PlotTrace_dFdT_suite2pValueChanged(app, event)
            value = app.PlotTrace_dFdT_suite2p.Value;
            app.plotTraceStyles.PlotdFdT_suite2p=value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: PlotTrace_Decon
        function PlotTrace_DeconValueChanged(app, event)
            value = app.PlotTrace_Decon.Value;
            app.plotTraceStyles.PlotdFoF_suite2p=value;
            f_DA_update_trace_plots(app);
            %suite2p only
        end

        % Value changed function: UseYLimitsCheckBox
        function UseYLimitsCheckBoxValueChanged(app, event)
            value = app.UseYLimitsCheckBox.Value;
            app.limitTracePlot_Y = value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: SelectedCell
        function SelectedCellValueChanged(app, event)
            value = app.SelectedCell.Value;
            f_DA_update_trace_plots(app);
            f_DA_update_ROIs(app);
            f_DA_overlay(app);
            Msg = ['ROI ' num2str(value) ' Now Displayed'];
            f_DA_update_log(app,Msg);
        end

        % Value changed function: PlotTrace_F_fissa
        function PlotTrace_F_fissaValueChanged(app, event)
            value = app.PlotTrace_F_fissa.Value;
            app.plotTraceStyles.PlotF_fissa=value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: PlotTrace_Fneu_fissa
        function PlotTrace_Fneu_fissaValueChanged(app, event)
            value = app.PlotTrace_Fneu_fissa.Value;
            app.plotTraceStyles.PlotFNeu_fissa=value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: PlotTrace_cF_fissa
        function PlotTrace_cF_fissaValueChanged(app, event)
            value = app.PlotTrace_cF_fissa.Value;
            app.plotTraceStyles.PlotcF_fissa=value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: PlotTrace_AdcF_fissa
        function PlotTrace_AdcF_fissaValueChanged(app, event)
            value = app.PlotTrace_AdcF_fissa.Value;
            app.plotTraceStyles.PlotAdcF_fissa=value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: PlotTrace_sep_fissa
        function PlotTrace_sep_fissaValueChanged(app, event)
            value = app.PlotTrace_sep_fissa.Value;
            app.plotTraceStyles.PlotSep_fissa=value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: PlotTrace_nPil_fissa
        function PlotTrace_nPil_fissaValueChanged(app, event)
            value = app.PlotTrace_nPil_fissa.Value;
            app.plotTraceStyles.PlotnPil_fissa=value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: PlotTrace_dFdT_fissa
        function PlotTrace_dFdT_fissaValueChanged(app, event)
            value = app.PlotTrace_dFdT_fissa.Value;
            app.plotTraceStyles.PlotdFdT_fissa=value;
            f_DA_update_trace_plots(app);
        end

        % Callback function
        function PlotTrace_dFoF_fissaValueChanged(app, event)
            value = app.PlotTrace_dFoF_fissa.Value;
            app.plotTraceStyles.dFoF_fissa=value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: XLimitLower
        function XLimitLowerValueChanged(app, event)
            value = app.XLimitLower.Value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: YLimitLower
        function YLimitLowerValueChanged(app, event)
            value = app.YLimitLower.Value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: XLimitUpper
        function XLimitUpperValueChanged(app, event)
            value = app.XLimitUpper.Value;
            f_DA_update_trace_plots(app);
  
        end

        % Value changed function: YLimitUpper
        function YLimitUpperValueChanged(app, event)
            value = app.YLimitUpper.Value;
            f_DA_update_trace_plots(app);
        end

        % Value changed function: Switch
        function SwitchValueChanged(app, event)
            value = app.Switch.Value;
            f_DA_update_index(app,value);
            f_DA_initialize_ROIs(app);
            f_DA_update_log(app,'Neuronal Index Updated');
            f_DA_update_ROIs(app);
        end

        % Close request function: UIFigure
        function UIFigureCloseRequest(app, event)
            if app.autosave
                f_DA_saveFun(app);
            end
            f_DA_update_log(app,'Goodbye');
            delete(app)
            
        end

        % Callback function
        function RunButtonValueChanged(app, event)
            value = app.RunButton.Value;
            f_DA_deconvolve(app,value);
        end

        % Value changed function: MCMC_X
        function MCMC_XValueChanged(app, event)
            value = app.MCMC_X.Value;
            try
                f_DA_update_MCMC_plot(app);
            catch
                f_DA_update_log(app,'No Deconvolution Found');   
            end
        end

        % Value changed function: MCMC_Y
        function MCMC_YValueChanged(app, event)
            value = app.MCMC_Y.Value;
            try
                f_DA_update_MCMC_plot(app);
            catch
                f_DA_update_log(app,'No Deconvolution Found');   
            end
        end

        % Button pushed function: RunButton
        function RunButtonPushed(app, event)
            f_DA_deconvolve(app);
        end

        % Button pushed function: RunAllButton
        function RunAllButtonPushed(app, event)
            f_DA_update_log(app,'Deconvolving All');
            total = size(app.ImData.imParams.suite2p.F,1);
            for i = 1:total
                msg = ['Deconvolving ' num2str(i) ' of ' num2str(total) 'ROIs'];
                f_DA_update_log(app,msg);
                app.SelectedCell.Value=i;
                f_DA_deconvolve(app);
            end
            %f_DA_deconvolveP(app)
            f_DA_update_log(app,'Finished All')
           
        end

        % Value changed function: PlotTrace_dFdT_fissa_2
        function PlotTrace_dFdT_fissa_2ValueChanged(app, event)
            value = app.PlotTrace_dFdT_fissa_2.Value;
            app.plotTraceStyles.Decon_suite2p=value;
            f_DA_update_trace_plots(app)
        end

        % Button pushed function: SaveButton
        function SaveButtonPushed(app, event)
            f_DA_update_log(app,'Saving Files');
            f_DA_saveFun(app);
            f_DA_update_log(app,'Save Completed');
        end

        % Value changed function: AUTOSAVEONCLOSECheckBox
        function AUTOSAVEONCLOSECheckBoxValueChanged(app, event)
            value = app.AUTOSAVEONCLOSECheckBox.Value;
            app.autosave = value;
            f_DA_update_log(app,'Autosave Change Handled')
        end

        % Value changed function: OverlayDropDown
        function OverlayDropDownValueChanged(app, event)
            value = app.OverlayDropDown.Value;
            f_DA_overlay(app);
            f_DA_update_log(app,'Changed Overlay')
        end

        % Value changed function: Scaling
        function ScalingValueChanged(app, event)
            value = app.Scaling.Value;
            f_DA_overlay(app);
            f_DA_update_log(app, 'Changed Scaling')
        end

        % Value changed function: CDMapDropDown
        function CDMapDropDownValueChanged(app, event)
            value = app.CDMapDropDown.Value;
            f_DA_overlay(app)
            f_DA_update_log(app, 'Changed Colormap')
        end

        % Button pushed function: UpdateTauButton
        function UpdateTauButtonPushed(app, event)
            tau_r = app.RiseEditField.Value;
            tau_d = app.DecayEditField.Value;
            fr = app.ImData.fr;
            dT = 1/(fr);
            app.DtEditField.Value = dT;
            [g,~] = tau_c2d(tau_r,tau_d,dT);
            app.gEditField_2.Value = g(1);
            app.gEditField.Value = g(2);
        end

        % Value changed function: PlotTrace_Decon_fissa
        function PlotTrace_Decon_fissaValueChanged(app, event)
            value = app.PlotTrace_Decon_fissa.Value;
            f_DA_update_trace_plots(app)
        end

        % Button pushed function: ThresholdButton
        function ThresholdButtonPushed(app, event)
            f_DA_update_log(app, 'Thresholding');
            f_DA_threshold_ROIs(app);
            f_DA_update_log(app, 'Finished');
        end

        % Button pushed function: ResetButton
        function ResetButtonPushed(app, event)
            neuronalIndex = app.ImData.imParams.suite2p.IC(:,1).*transpose(1:size(app.ImData.imParams.suite2p.F,1));
            neuronalIndex(neuronalIndex==0)=[];
            app.ImData.NeuronIndex = neuronalIndex;
            removedIndex = setdiff(neuronalIndex,(1:size(app.ImData.imParams.suite2p.F,1)));
            app.ImData.RemovedIndex = removedIndex;
            f_DA_update_ROIs(app);
            f_DA_initialize_ROIs(app);
            f_DA_overlay(app);
        end

        % Button pushed function: AllButton
        function AllButtonPushed(app, event)
            app.ImData.NeuronIndex = 1:size(app.ImData.imParams.suite2p.F,1);
            app.ImData.RemovedIndex = [];
            f_DA_update_ROIs(app);
            f_DA_initialize_ROIs(app);
            f_DA_overlay(app);
        end

        % Button pushed function: NoneButton
        function NoneButtonPushed(app, event)
            app.ImData.NeuronIndex = [];
            app.ImData.RemovedIndex = 1:size(app.ImData.imParams.suite2p.F,1);
            f_DA_update_ROIs(app);
            f_DA_initialize_ROIs(app);
            f_DA_overlay(app);
        end

        % Value changed function: ThresholdTypeDropDown
        function ThresholdTypeDropDownValueChanged(app, event)
            value = app.ThresholdTypeDropDown.Value;
            f_DA_plotStatDistribution(app);
        end

        % Value changed function: PlotOptionsDropDown
        function PlotOptionsDropDownValueChanged(app, event)
            f_DA_update_processing_plots(app);
        end

        % Button pushed function: PerformBinningButton
        function PerformBinningButtonPushed(app, event)
            f_DA_binData(app);
            f_DA_initialize_newPP(app)
        end

        % Button pushed function: thresholdHA
        function thresholdHAPushed(app, event)
            f_DA_thresholdHA(app);
            f_DA_initialize_newPP(app)
        end

        % Button pushed function: thresholdLA
        function thresholdLAPushed(app, event)
            f_DA_thresholdLA(app);
            f_DA_initialize_newPP(app)
        end

        % Button pushed function: RemoveNilNeuronsButton
        function RemoveNilNeuronsButtonPushed(app, event)
            f_DA_removeNil(app);
            f_DA_initialize_newPP(app)
        end

        % Button pushed function: InitializeButton
        function InitializeButtonPushed(app, event)
            f_DA_update_log(app,'Beging Initialization');
            f_DA_initialize_PP(app);
            f_DA_update_log(app,'Finished Initializing');
            f_DA_update_processing_plots(app);
        end

        % Button pushed function: ImportUDFButton
        function ImportUDFButtonPushed(app, event)
            f_DA_import_UDF(app);
        end

        % Button pushed function: ProcessUDFButton
        function ProcessUDFButtonPushed(app, event)
            f_DA_process_UDF(app);
        end

        % Button pushed function: ExportButton
        function ExportButtonPushed(app, event)
            f_DA_export_CRFData(app);
        end

        % Value changed function: BinSizeEditField
        function BinSizeEditFieldValueChanged(app, event)
          f_DA_update_bin_times(app);
        end

        % Button pushed function: UPDATEPLOTSButton
        function UPDATEPLOTSButtonPushed(app, event)
            f_DA_update_MCMC_plot(app);
        end

        % Value changed function: HyperactiveThresholdEditField
        function HyperactiveThresholdEditFieldValueChanged(app, event)
            f_DA_removeHyperactive(app);
            f_DA_initialize_newPP(app);
        end

        % Value changed function: FilenameEditField
        function FilenameEditFieldValueChanged(app, event)
            app.suite2p_filename = app.FilenameEditField.Value; 
        end

        % Button pushed function: RunAllParallelButton
        function RunAllParallelButtonPushed(app, event)
            f_DA_update_log(app,'Deconvolving All');
            %total = size(app.ImData.imParams.suite2p.F,1)
            %for i = 1:total
              %  msg = ['Deconvolving ' num2str(i) ' of ' num2str(total) 'ROIs'];
              %  f_DA_update_log(app,msg);
              %  app.SelectedCell.Value=i;
               % f_DA_deconvolve(app);
               % end
            f_DA_deconvolveP(app)
            f_DA_update_log(app,'Finished All')
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [1 30 1920 1020];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);

            % Create IOPanel
            app.IOPanel = uipanel(app.UIFigure);
            app.IOPanel.Position = [1 821 1920 200];

            % Create CompiledPath
            app.CompiledPath = uieditfield(app.IOPanel, 'text');
            app.CompiledPath.FontName = 'Arial';
            app.CompiledPath.Position = [441 157 461 22];
            app.CompiledPath.Value = 'Load Pre-Compiled File (.mat)';

            % Create OptionsPath
            app.OptionsPath = uieditfield(app.IOPanel, 'text');
            app.OptionsPath.FontName = 'Arial';
            app.OptionsPath.Visible = 'off';
            app.OptionsPath.Position = [441 117 461 22];
            app.OptionsPath.Value = 'Load Options File (.mat)';

            % Create LoggingConsoleLabel
            app.LoggingConsoleLabel = uilabel(app.IOPanel);
            app.LoggingConsoleLabel.HorizontalAlignment = 'center';
            app.LoggingConsoleLabel.FontName = 'Arial';
            app.LoggingConsoleLabel.FontSize = 16;
            app.LoggingConsoleLabel.FontWeight = 'bold';
            app.LoggingConsoleLabel.Position = [241 78 1340 41];
            app.LoggingConsoleLabel.Text = 'Logging Console';

            % Create BrowseCompiled
            app.BrowseCompiled = uibutton(app.IOPanel, 'push');
            app.BrowseCompiled.ButtonPushedFcn = createCallbackFcn(app, @BrowseCompiledButtonPushed, true);
            app.BrowseCompiled.Position = [241 157 81 22];
            app.BrowseCompiled.Text = 'Browse';

            % Create BrowseOptions
            app.BrowseOptions = uibutton(app.IOPanel, 'push');
            app.BrowseOptions.ButtonPushedFcn = createCallbackFcn(app, @BrowseOptionsButtonPushed, true);
            app.BrowseOptions.Visible = 'off';
            app.BrowseOptions.Position = [241 117 81 22];
            app.BrowseOptions.Text = 'Browse';

            % Create LoadCompiled
            app.LoadCompiled = uibutton(app.IOPanel, 'push');
            app.LoadCompiled.ButtonPushedFcn = createCallbackFcn(app, @LoadCompiledButtonPushed, true);
            app.LoadCompiled.Position = [341 157 81 22];
            app.LoadCompiled.Text = 'Load';

            % Create LoadOptions
            app.LoadOptions = uibutton(app.IOPanel, 'push');
            app.LoadOptions.ButtonPushedFcn = createCallbackFcn(app, @LoadOptionsButtonPushed, true);
            app.LoadOptions.Visible = 'off';
            app.LoadOptions.Position = [341 117 81 22];
            app.LoadOptions.Text = 'Load';

            % Create HiRasLabel
            app.HiRasLabel = uilabel(app.IOPanel);
            app.HiRasLabel.HorizontalAlignment = 'center';
            app.HiRasLabel.FontName = 'Arial';
            app.HiRasLabel.FontSize = 36;
            app.HiRasLabel.FontWeight = 'bold';
            app.HiRasLabel.Position = [64 94 118 45];
            app.HiRasLabel.Text = 'Hi Ras';

            % Create v082Label
            app.v082Label = uilabel(app.IOPanel);
            app.v082Label.FontName = 'Arial';
            app.v082Label.FontSize = 24;
            app.v082Label.FontWeight = 'bold';
            app.v082Label.Position = [81 69 66 30];
            app.v082Label.Text = 'v0.82';

            % Create LogTextArea
            app.LogTextArea = uitextarea(app.IOPanel);
            app.LogTextArea.Editable = 'off';
            app.LogTextArea.FontName = 'Arial';
            app.LogTextArea.FontSize = 14;
            app.LogTextArea.Position = [242 17 1339 62];

            % Create Suite2PPath
            app.Suite2PPath = uieditfield(app.IOPanel, 'text');
            app.Suite2PPath.FontName = 'Arial';
            app.Suite2PPath.Position = [1120 157 461 22];
            app.Suite2PPath.Value = 'Suite2P File Path (.mat)';

            % Create BrowseSuite2P
            app.BrowseSuite2P = uibutton(app.IOPanel, 'push');
            app.BrowseSuite2P.ButtonPushedFcn = createCallbackFcn(app, @BrowseSuite2PButtonPushed, true);
            app.BrowseSuite2P.Position = [920 157 81 22];
            app.BrowseSuite2P.Text = 'Browse';

            % Create ImportImaging
            app.ImportImaging = uibutton(app.IOPanel, 'push');
            app.ImportImaging.ButtonPushedFcn = createCallbackFcn(app, @ImportImagingButtonPushed, true);
            app.ImportImaging.Position = [1020 117 81 62];
            app.ImportImaging.Text = {'Import '; 'Imaging '; 'Files'};

            % Create FIssaPath
            app.FIssaPath = uieditfield(app.IOPanel, 'text');
            app.FIssaPath.FontName = 'Arial';
            app.FIssaPath.Position = [1120 118 461 22];
            app.FIssaPath.Value = 'Fissa File Path (.mat)';

            % Create BrowseFissa
            app.BrowseFissa = uibutton(app.IOPanel, 'push');
            app.BrowseFissa.ButtonPushedFcn = createCallbackFcn(app, @BrowseFissaButtonPushed, true);
            app.BrowseFissa.Position = [920 118 81 22];
            app.BrowseFissa.Text = 'Browse';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.AutoResizeChildren = 'off';
            app.TabGroup.Position = [15 35 1400 772];

            % Create ROIsTab
            app.ROIsTab = uitab(app.TabGroup);
            app.ROIsTab.AutoResizeChildren = 'off';
            app.ROIsTab.Title = 'ROIs';

            % Create CalciumTracePlottingPanel
            app.CalciumTracePlottingPanel = uipanel(app.ROIsTab);
            app.CalciumTracePlottingPanel.AutoResizeChildren = 'off';
            app.CalciumTracePlottingPanel.Title = 'Calcium Trace Plotting';
            app.CalciumTracePlottingPanel.FontName = 'Arial';
            app.CalciumTracePlottingPanel.FontWeight = 'bold';
            app.CalciumTracePlottingPanel.FontSize = 18;
            app.CalciumTracePlottingPanel.Position = [15 15 310 307];

            % Create FissaLabel
            app.FissaLabel = uilabel(app.CalciumTracePlottingPanel);
            app.FissaLabel.FontName = 'Arial';
            app.FissaLabel.FontSize = 16;
            app.FissaLabel.FontWeight = 'bold';
            app.FissaLabel.Position = [15 255 46 23];
            app.FissaLabel.Text = 'Fissa';

            % Create PlotTrace_F_fissa
            app.PlotTrace_F_fissa = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_F_fissa.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_F_fissaValueChanged, true);
            app.PlotTrace_F_fissa.Text = 'Plot F';
            app.PlotTrace_F_fissa.FontName = 'Arial';
            app.PlotTrace_F_fissa.FontSize = 14;
            app.PlotTrace_F_fissa.Position = [15 230 59 23];

            % Create PlotTrace_Fneu_fissa
            app.PlotTrace_Fneu_fissa = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_Fneu_fissa.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_Fneu_fissaValueChanged, true);
            app.PlotTrace_Fneu_fissa.Text = 'Plot Fneu';
            app.PlotTrace_Fneu_fissa.FontName = 'Arial';
            app.PlotTrace_Fneu_fissa.FontSize = 14;
            app.PlotTrace_Fneu_fissa.Position = [15 210 82 23];

            % Create PlotTrace_cF_fissa
            app.PlotTrace_cF_fissa = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_cF_fissa.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_cF_fissaValueChanged, true);
            app.PlotTrace_cF_fissa.Text = 'Plot cF';
            app.PlotTrace_cF_fissa.FontName = 'Arial';
            app.PlotTrace_cF_fissa.FontSize = 14;
            app.PlotTrace_cF_fissa.Position = [15 190 65 23];

            % Create PlotTrace_AdcF_fissa
            app.PlotTrace_AdcF_fissa = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_AdcF_fissa.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_AdcF_fissaValueChanged, true);
            app.PlotTrace_AdcF_fissa.Text = 'Plot AdcF';
            app.PlotTrace_AdcF_fissa.FontName = 'Arial';
            app.PlotTrace_AdcF_fissa.FontSize = 14;
            app.PlotTrace_AdcF_fissa.Position = [15 170 83 23];

            % Create PlotTrace_sep_fissa
            app.PlotTrace_sep_fissa = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_sep_fissa.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_sep_fissaValueChanged, true);
            app.PlotTrace_sep_fissa.Text = 'Plot Unmatched';
            app.PlotTrace_sep_fissa.FontName = 'Arial';
            app.PlotTrace_sep_fissa.FontSize = 14;
            app.PlotTrace_sep_fissa.Position = [15 150 122 23];

            % Create PlotTrace_nPil_fissa
            app.PlotTrace_nPil_fissa = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_nPil_fissa.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_nPil_fissaValueChanged, true);
            app.PlotTrace_nPil_fissa.Text = 'Plot nPil';
            app.PlotTrace_nPil_fissa.FontName = 'Arial';
            app.PlotTrace_nPil_fissa.FontSize = 14;
            app.PlotTrace_nPil_fissa.Position = [15 130 73 23];

            % Create PlotTrace_dFdT_fissa
            app.PlotTrace_dFdT_fissa = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_dFdT_fissa.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_dFdT_fissaValueChanged, true);
            app.PlotTrace_dFdT_fissa.Text = 'Plot dF/dT';
            app.PlotTrace_dFdT_fissa.FontName = 'Arial';
            app.PlotTrace_dFdT_fissa.FontSize = 14;
            app.PlotTrace_dFdT_fissa.Position = [15 110 87 23];

            % Create PlotTrace_Decon_fissa
            app.PlotTrace_Decon_fissa = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_Decon_fissa.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_Decon_fissaValueChanged, true);
            app.PlotTrace_Decon_fissa.Text = 'Plot Decon.';
            app.PlotTrace_Decon_fissa.FontName = 'Arial';
            app.PlotTrace_Decon_fissa.FontSize = 14;
            app.PlotTrace_Decon_fissa.Position = [15 90 116 23];

            % Create Suite2PLabel
            app.Suite2PLabel = uilabel(app.CalciumTracePlottingPanel);
            app.Suite2PLabel.FontName = 'Arial';
            app.Suite2PLabel.FontSize = 16;
            app.Suite2PLabel.FontWeight = 'bold';
            app.Suite2PLabel.Position = [160 255 64 23];
            app.Suite2PLabel.Text = 'Suite2P';

            % Create PlotTrace_F_suite2p
            app.PlotTrace_F_suite2p = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_F_suite2p.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_F_suite2pValueChanged, true);
            app.PlotTrace_F_suite2p.Text = 'Plot F';
            app.PlotTrace_F_suite2p.FontName = 'Arial';
            app.PlotTrace_F_suite2p.FontSize = 14;
            app.PlotTrace_F_suite2p.Position = [160 230 59 23];
            app.PlotTrace_F_suite2p.Value = true;

            % Create PlotTrace_Fneu_suite2p
            app.PlotTrace_Fneu_suite2p = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_Fneu_suite2p.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_Fneu_suite2pValueChanged, true);
            app.PlotTrace_Fneu_suite2p.Text = 'Plot Fneu';
            app.PlotTrace_Fneu_suite2p.FontName = 'Arial';
            app.PlotTrace_Fneu_suite2p.FontSize = 14;
            app.PlotTrace_Fneu_suite2p.Position = [160 210 82 23];

            % Create PlotTrace_cF_suite2p
            app.PlotTrace_cF_suite2p = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_cF_suite2p.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_cF_suite2pValueChanged, true);
            app.PlotTrace_cF_suite2p.Text = 'Plot cF';
            app.PlotTrace_cF_suite2p.FontName = 'Arial';
            app.PlotTrace_cF_suite2p.FontSize = 14;
            app.PlotTrace_cF_suite2p.Position = [160 190 65 23];

            % Create PlotTrace_AdcF_suite2p
            app.PlotTrace_AdcF_suite2p = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_AdcF_suite2p.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_AdcF_suite2pValueChanged, true);
            app.PlotTrace_AdcF_suite2p.Text = 'Plot AdcF';
            app.PlotTrace_AdcF_suite2p.FontSize = 14;
            app.PlotTrace_AdcF_suite2p.Position = [160 170 83 23];

            % Create PlotTrace_dFdT_suite2p
            app.PlotTrace_dFdT_suite2p = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_dFdT_suite2p.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_dFdT_suite2pValueChanged, true);
            app.PlotTrace_dFdT_suite2p.Text = 'Plot dF/dT';
            app.PlotTrace_dFdT_suite2p.FontSize = 14;
            app.PlotTrace_dFdT_suite2p.Position = [160 150 87 23];

            % Create PlotTrace_Decon
            app.PlotTrace_Decon = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_Decon.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_DeconValueChanged, true);
            app.PlotTrace_Decon.Visible = 'off';
            app.PlotTrace_Decon.Text = 'Plot (F-Fo)/Fo';
            app.PlotTrace_Decon.FontSize = 14;
            app.PlotTrace_Decon.Position = [160 130 109 23];

            % Create PlotTrace_dFdT_fissa_2
            app.PlotTrace_dFdT_fissa_2 = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_dFdT_fissa_2.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_dFdT_fissa_2ValueChanged, true);
            app.PlotTrace_dFdT_fissa_2.Text = 'Plot Decon.';
            app.PlotTrace_dFdT_fissa_2.FontName = 'Arial';
            app.PlotTrace_dFdT_fissa_2.FontSize = 14;
            app.PlotTrace_dFdT_fissa_2.Position = [160 130 116 23];

            % Create Panel
            app.Panel = uipanel(app.CalciumTracePlottingPanel);
            app.Panel.AutoResizeChildren = 'off';
            app.Panel.Position = [115 5 190 60];

            % Create UseYLimitsCheckBox
            app.UseYLimitsCheckBox = uicheckbox(app.Panel);
            app.UseYLimitsCheckBox.ValueChangedFcn = createCallbackFcn(app, @UseYLimitsCheckBoxValueChanged, true);
            app.UseYLimitsCheckBox.Text = 'Use YLimits';
            app.UseYLimitsCheckBox.FontName = 'Arial';
            app.UseYLimitsCheckBox.FontSize = 14;
            app.UseYLimitsCheckBox.Position = [5 7 97 23];

            % Create UseXLimitsCheckBox
            app.UseXLimitsCheckBox = uicheckbox(app.Panel);
            app.UseXLimitsCheckBox.ValueChangedFcn = createCallbackFcn(app, @UseXLimitsCheckBoxValueChanged, true);
            app.UseXLimitsCheckBox.Text = 'Use XLimits';
            app.UseXLimitsCheckBox.FontName = 'Arial';
            app.UseXLimitsCheckBox.FontSize = 14;
            app.UseXLimitsCheckBox.Position = [5 32 97 23];

            % Create XLimitUpper
            app.XLimitUpper = uieditfield(app.Panel, 'numeric');
            app.XLimitUpper.Limits = [1 Inf];
            app.XLimitUpper.ValueChangedFcn = createCallbackFcn(app, @XLimitUpperValueChanged, true);
            app.XLimitUpper.HorizontalAlignment = 'center';
            app.XLimitUpper.FontName = 'Arial';
            app.XLimitUpper.FontSize = 14;
            app.XLimitUpper.Position = [145 32 40 22];
            app.XLimitUpper.Value = 1;

            % Create XLimitLower
            app.XLimitLower = uieditfield(app.Panel, 'numeric');
            app.XLimitLower.Limits = [0 Inf];
            app.XLimitLower.ValueChangedFcn = createCallbackFcn(app, @XLimitLowerValueChanged, true);
            app.XLimitLower.HorizontalAlignment = 'center';
            app.XLimitLower.FontName = 'Arial';
            app.XLimitLower.FontSize = 14;
            app.XLimitLower.Position = [100 32 40 22];

            % Create YLimitLower
            app.YLimitLower = uieditfield(app.Panel, 'numeric');
            app.YLimitLower.ValueChangedFcn = createCallbackFcn(app, @YLimitLowerValueChanged, true);
            app.YLimitLower.HorizontalAlignment = 'center';
            app.YLimitLower.FontName = 'Arial';
            app.YLimitLower.FontSize = 14;
            app.YLimitLower.Position = [100 7 40 22];

            % Create YLimitUpper
            app.YLimitUpper = uieditfield(app.Panel, 'numeric');
            app.YLimitUpper.ValueChangedFcn = createCallbackFcn(app, @YLimitUpperValueChanged, true);
            app.YLimitUpper.HorizontalAlignment = 'center';
            app.YLimitUpper.FontName = 'Arial';
            app.YLimitUpper.FontSize = 14;
            app.YLimitUpper.Position = [145 7 40 22];
            app.YLimitUpper.Value = 1;

            % Create OverlayDropDown
            app.OverlayDropDown = uidropdown(app.ROIsTab);
            app.OverlayDropDown.Items = {'No Overlay', 'Max Projection', 'Correlation Map', 'Mean Image', 'Enhanced Mean', 'Reference Image', 'VCorrelation'};
            app.OverlayDropDown.ValueChangedFcn = createCallbackFcn(app, @OverlayDropDownValueChanged, true);
            app.OverlayDropDown.FontName = 'Arial';
            app.OverlayDropDown.Position = [1276 703 100 22];
            app.OverlayDropDown.Value = 'No Overlay';

            % Create Scaling
            app.Scaling = uidropdown(app.ROIsTab);
            app.Scaling.Items = {'direct', 'scaled'};
            app.Scaling.ValueChangedFcn = createCallbackFcn(app, @ScalingValueChanged, true);
            app.Scaling.Position = [1276 659 100 22];
            app.Scaling.Value = 'direct';

            % Create CDMapDropDown
            app.CDMapDropDown = uidropdown(app.ROIsTab);
            app.CDMapDropDown.Items = {'turbo', 'jet', 'parula', 'gray', ''};
            app.CDMapDropDown.ValueChangedFcn = createCallbackFcn(app, @CDMapDropDownValueChanged, true);
            app.CDMapDropDown.Position = [1276 617 100 22];
            app.CDMapDropDown.Value = 'turbo';

            % Create NeuronalROIs
            app.NeuronalROIs = uiaxes(app.ROIsTab);
            title(app.NeuronalROIs, 'Neuronal ROIs')
            app.NeuronalROIs.DataAspectRatio = [1 1 1];
            app.NeuronalROIs.PlotBoxAspectRatio = [1 1 1];
            app.NeuronalROIs.FontName = 'Arial';
            app.NeuronalROIs.XTick = [];
            app.NeuronalROIs.YTick = [];
            app.NeuronalROIs.FontSize = 16;
            app.NeuronalROIs.Box = 'on';
            app.NeuronalROIs.Position = [10 335 400 390];

            % Create RemovedROIs
            app.RemovedROIs = uiaxes(app.ROIsTab);
            title(app.RemovedROIs, 'Removed ROIs')
            app.RemovedROIs.DataAspectRatio = [1 1 1];
            app.RemovedROIs.PlotBoxAspectRatio = [1 1 1];
            app.RemovedROIs.FontName = 'Arial';
            app.RemovedROIs.XTick = [];
            app.RemovedROIs.YTick = [];
            app.RemovedROIs.FontSize = 16;
            app.RemovedROIs.Box = 'on';
            app.RemovedROIs.Position = [430 335 400 390];

            % Create CellSelected
            app.CellSelected = uiaxes(app.ROIsTab);
            title(app.CellSelected, 'Selected ROI')
            app.CellSelected.DataAspectRatio = [1 1 1];
            app.CellSelected.PlotBoxAspectRatio = [1 1 1];
            app.CellSelected.FontName = 'Arial';
            app.CellSelected.XTick = [];
            app.CellSelected.YTick = [];
            app.CellSelected.FontSize = 16;
            app.CellSelected.Box = 'on';
            app.CellSelected.Position = [850 335 400 395];

            % Create TracePlot
            app.TracePlot = uiaxes(app.ROIsTab);
            xlabel(app.TracePlot, 'Time (s)')
            app.TracePlot.FontName = 'Arial';
            app.TracePlot.FontWeight = 'bold';
            app.TracePlot.FontSize = 16;
            app.TracePlot.Position = [340 14 1046 307];

            % Create Deconvolution
            app.Deconvolution = uitab(app.TabGroup);
            app.Deconvolution.AutoResizeChildren = 'off';
            app.Deconvolution.Title = 'Deconvolution';

            % Create MCMCTempPanel
            app.MCMCTempPanel = uipanel(app.Deconvolution);
            app.MCMCTempPanel.AutoResizeChildren = 'off';
            app.MCMCTempPanel.Title = 'MCMC Temp Panel';
            app.MCMCTempPanel.FontName = 'Arial';
            app.MCMCTempPanel.FontWeight = 'bold';
            app.MCMCTempPanel.FontSize = 16;
            app.MCMCTempPanel.Position = [15 335 404 394];

            % Create AROrderEditFieldLabel
            app.AROrderEditFieldLabel = uilabel(app.MCMCTempPanel);
            app.AROrderEditFieldLabel.HorizontalAlignment = 'right';
            app.AROrderEditFieldLabel.Position = [8 336 57 22];
            app.AROrderEditFieldLabel.Text = 'AR Order';

            % Create AROrderEditField
            app.AROrderEditField = uieditfield(app.MCMCTempPanel, 'numeric');
            app.AROrderEditField.Limits = [1 2];
            app.AROrderEditField.Editable = 'off';
            app.AROrderEditField.Position = [80 336 100 22];
            app.AROrderEditField.Value = 2;

            % Create gEditFieldLabel
            app.gEditFieldLabel = uilabel(app.MCMCTempPanel);
            app.gEditFieldLabel.HorizontalAlignment = 'right';
            app.gEditFieldLabel.Position = [40 303 25 22];
            app.gEditFieldLabel.Text = 'g';

            % Create gEditField
            app.gEditField = uieditfield(app.MCMCTempPanel, 'numeric');
            app.gEditField.Editable = 'off';
            app.gEditField.Position = [136 303 44 22];
            app.gEditField.Value = Inf;

            % Create BurnInEditFieldLabel
            app.BurnInEditFieldLabel = uilabel(app.MCMCTempPanel);
            app.BurnInEditFieldLabel.HorizontalAlignment = 'right';
            app.BurnInEditFieldLabel.Position = [20 270 45 22];
            app.BurnInEditFieldLabel.Text = 'Burn-In';

            % Create BurnInEditField
            app.BurnInEditField = uieditfield(app.MCMCTempPanel, 'numeric');
            app.BurnInEditField.Position = [80 270 100 22];
            app.BurnInEditField.Value = 200;

            % Create RiseEditFieldLabel
            app.RiseEditFieldLabel = uilabel(app.MCMCTempPanel);
            app.RiseEditFieldLabel.HorizontalAlignment = 'right';
            app.RiseEditFieldLabel.Position = [35 229 30 22];
            app.RiseEditFieldLabel.Text = 'Rise';

            % Create RiseEditField
            app.RiseEditField = uieditfield(app.MCMCTempPanel, 'numeric');
            app.RiseEditField.Limits = [0 Inf];
            app.RiseEditField.Position = [80 229 100 22];
            app.RiseEditField.Value = 0.15;

            % Create DecayEditFieldLabel
            app.DecayEditFieldLabel = uilabel(app.MCMCTempPanel);
            app.DecayEditFieldLabel.HorizontalAlignment = 'right';
            app.DecayEditFieldLabel.Position = [25 193 40 22];
            app.DecayEditFieldLabel.Text = 'Decay';

            % Create DecayEditField
            app.DecayEditField = uieditfield(app.MCMCTempPanel, 'numeric');
            app.DecayEditField.Limits = [0 Inf];
            app.DecayEditField.Position = [80 193 100 22];
            app.DecayEditField.Value = 1.25;

            % Create DtEditFieldLabel
            app.DtEditFieldLabel = uilabel(app.MCMCTempPanel);
            app.DtEditFieldLabel.HorizontalAlignment = 'right';
            app.DtEditFieldLabel.Position = [40 154 25 22];
            app.DtEditFieldLabel.Text = 'Dt';

            % Create DtEditField
            app.DtEditField = uieditfield(app.MCMCTempPanel, 'numeric');
            app.DtEditField.Limits = [0 Inf];
            app.DtEditField.Editable = 'off';
            app.DtEditField.Position = [80 154 100 22];
            app.DtEditField.Value = Inf;

            % Create gEditField_2
            app.gEditField_2 = uieditfield(app.MCMCTempPanel, 'numeric');
            app.gEditField_2.Editable = 'off';
            app.gEditField_2.Position = [88 303 44 22];
            app.gEditField_2.Value = -Inf;

            % Create RunButton
            app.RunButton = uibutton(app.MCMCTempPanel, 'push');
            app.RunButton.ButtonPushedFcn = createCallbackFcn(app, @RunButtonPushed, true);
            app.RunButton.FontName = 'Arial';
            app.RunButton.FontSize = 16;
            app.RunButton.Position = [125 79 100 26];
            app.RunButton.Text = 'Run';

            % Create DisplayedCellEditFieldLabel
            app.DisplayedCellEditFieldLabel = uilabel(app.MCMCTempPanel);
            app.DisplayedCellEditFieldLabel.HorizontalAlignment = 'right';
            app.DisplayedCellEditFieldLabel.Position = [-7 115 82 22];
            app.DisplayedCellEditFieldLabel.Text = 'Displayed Cell';

            % Create DisplayedCellEditField
            app.DisplayedCellEditField = uieditfield(app.MCMCTempPanel, 'numeric');
            app.DisplayedCellEditField.Limits = [0 Inf];
            app.DisplayedCellEditField.Editable = 'off';
            app.DisplayedCellEditField.Position = [90 115 90 22];

            % Create RunAllButton
            app.RunAllButton = uibutton(app.MCMCTempPanel, 'push');
            app.RunAllButton.ButtonPushedFcn = createCallbackFcn(app, @RunAllButtonPushed, true);
            app.RunAllButton.FontName = 'Arial';
            app.RunAllButton.FontSize = 16;
            app.RunAllButton.Position = [13 33 100 26];
            app.RunAllButton.Text = 'Run All';

            % Create UpdateTauButton
            app.UpdateTauButton = uibutton(app.MCMCTempPanel, 'push');
            app.UpdateTauButton.ButtonPushedFcn = createCallbackFcn(app, @UpdateTauButtonPushed, true);
            app.UpdateTauButton.FontName = 'Arial';
            app.UpdateTauButton.FontSize = 16;
            app.UpdateTauButton.Position = [10 79 100 26];
            app.UpdateTauButton.Text = 'Update Tau';

            % Create RunAllParallelButton
            app.RunAllParallelButton = uibutton(app.MCMCTempPanel, 'push');
            app.RunAllParallelButton.ButtonPushedFcn = createCallbackFcn(app, @RunAllParallelButtonPushed, true);
            app.RunAllParallelButton.FontName = 'Arial';
            app.RunAllParallelButton.FontSize = 16;
            app.RunAllParallelButton.Position = [125 33 136 26];
            app.RunAllParallelButton.Text = 'Run All (Parallel)';

            % Create MCMC_X
            app.MCMC_X = uicheckbox(app.Deconvolution);
            app.MCMC_X.ValueChangedFcn = createCallbackFcn(app, @MCMC_XValueChanged, true);
            app.MCMC_X.Text = 'Use X Limits';
            app.MCMC_X.FontName = 'Arial';
            app.MCMC_X.FontSize = 16;
            app.MCMC_X.Position = [35 279 112 22];

            % Create MCMC_Y
            app.MCMC_Y = uicheckbox(app.Deconvolution);
            app.MCMC_Y.ValueChangedFcn = createCallbackFcn(app, @MCMC_YValueChanged, true);
            app.MCMC_Y.Text = 'Use Y Limits';
            app.MCMC_Y.FontName = 'Arial';
            app.MCMC_Y.FontSize = 16;
            app.MCMC_Y.Position = [35 251 112 22];

            % Create MCMC_X_Min
            app.MCMC_X_Min = uieditfield(app.Deconvolution, 'numeric');
            app.MCMC_X_Min.Limits = [0 Inf];
            app.MCMC_X_Min.Position = [151 279 40 22];

            % Create MCMC_X_Max
            app.MCMC_X_Max = uieditfield(app.Deconvolution, 'numeric');
            app.MCMC_X_Max.Limits = [0 Inf];
            app.MCMC_X_Max.Position = [213 279 40 22];
            app.MCMC_X_Max.Value = 1;

            % Create MCMC_Y_Min
            app.MCMC_Y_Min = uieditfield(app.Deconvolution, 'numeric');
            app.MCMC_Y_Min.Position = [150 251 40 22];

            % Create MCMC_Y_Max
            app.MCMC_Y_Max = uieditfield(app.Deconvolution, 'numeric');
            app.MCMC_Y_Max.Position = [213 251 40 22];
            app.MCMC_Y_Max.Value = 1;

            % Create UPDATEPLOTSButton
            app.UPDATEPLOTSButton = uibutton(app.Deconvolution, 'push');
            app.UPDATEPLOTSButton.ButtonPushedFcn = createCallbackFcn(app, @UPDATEPLOTSButtonPushed, true);
            app.UPDATEPLOTSButton.FontName = 'Arial';
            app.UPDATEPLOTSButton.FontSize = 21;
            app.UPDATEPLOTSButton.Position = [30 52 389 175];
            app.UPDATEPLOTSButton.Text = 'UPDATE PLOTS';

            % Create MCMC_Axes_1
            app.MCMC_Axes_1 = uiaxes(app.Deconvolution);
            xlabel(app.MCMC_Axes_1, 'Time (s)')
            app.MCMC_Axes_1.FontName = 'Arial';
            app.MCMC_Axes_1.FontWeight = 'bold';
            app.MCMC_Axes_1.FontSize = 16;
            app.MCMC_Axes_1.Position = [430 279 956 450];

            % Create MCMC_Axes_3
            app.MCMC_Axes_3 = uiaxes(app.Deconvolution);
            xlabel(app.MCMC_Axes_3, 'Time (s)')
            app.MCMC_Axes_3.FontName = 'Arial';
            app.MCMC_Axes_3.FontWeight = 'bold';
            app.MCMC_Axes_3.FontSize = 16;
            app.MCMC_Axes_3.Position = [430 27 956 225];

            % Create Preprocessing
            app.Preprocessing = uitab(app.TabGroup);
            app.Preprocessing.AutoResizeChildren = 'off';
            app.Preprocessing.Title = 'Preprocessing';

            % Create ProcessingParametersPanel
            app.ProcessingParametersPanel = uipanel(app.Preprocessing);
            app.ProcessingParametersPanel.AutoResizeChildren = 'off';
            app.ProcessingParametersPanel.TitlePosition = 'centertop';
            app.ProcessingParametersPanel.Title = 'Processing Parameters';
            app.ProcessingParametersPanel.FontName = 'Arial';
            app.ProcessingParametersPanel.FontSize = 16;
            app.ProcessingParametersPanel.Position = [15 15 471 719];

            % Create BinSizeEditFieldLabel
            app.BinSizeEditFieldLabel = uilabel(app.ProcessingParametersPanel);
            app.BinSizeEditFieldLabel.HorizontalAlignment = 'right';
            app.BinSizeEditFieldLabel.Position = [8 656 50 22];
            app.BinSizeEditFieldLabel.Text = 'Bin Size';

            % Create BinSizeEditField
            app.BinSizeEditField = uieditfield(app.ProcessingParametersPanel, 'numeric');
            app.BinSizeEditField.Limits = [0 Inf];
            app.BinSizeEditField.RoundFractionalValues = 'on';
            app.BinSizeEditField.ValueDisplayFormat = '%.0f';
            app.BinSizeEditField.ValueChangedFcn = createCallbackFcn(app, @BinSizeEditFieldValueChanged, true);
            app.BinSizeEditField.Position = [73 656 43 22];

            % Create PerformBinningButton
            app.PerformBinningButton = uibutton(app.ProcessingParametersPanel, 'push');
            app.PerformBinningButton.ButtonPushedFcn = createCallbackFcn(app, @PerformBinningButtonPushed, true);
            app.PerformBinningButton.Position = [347 656 102 22];
            app.PerformBinningButton.Text = 'Perform Binning';

            % Create HighActivityThresholdEditFieldLabel
            app.HighActivityThresholdEditFieldLabel = uilabel(app.ProcessingParametersPanel);
            app.HighActivityThresholdEditFieldLabel.HorizontalAlignment = 'right';
            app.HighActivityThresholdEditFieldLabel.Position = [11 590 129 22];
            app.HighActivityThresholdEditFieldLabel.Text = 'High-Activity Threshold';

            % Create HighActivityThresholdEditField
            app.HighActivityThresholdEditField = uieditfield(app.ProcessingParametersPanel, 'numeric');
            app.HighActivityThresholdEditField.Limits = [0 Inf];
            app.HighActivityThresholdEditField.ValueDisplayFormat = '%11.4g Percent';
            app.HighActivityThresholdEditField.Position = [155 590 100 22];

            % Create thresholdHA
            app.thresholdHA = uibutton(app.ProcessingParametersPanel, 'push');
            app.thresholdHA.ButtonPushedFcn = createCallbackFcn(app, @thresholdHAPushed, true);
            app.thresholdHA.Position = [268 590 175 22];
            app.thresholdHA.Text = 'Threshold';

            % Create RemoveNilNeuronsButton
            app.RemoveNilNeuronsButton = uibutton(app.ProcessingParametersPanel, 'push');
            app.RemoveNilNeuronsButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveNilNeuronsButtonPushed, true);
            app.RemoveNilNeuronsButton.Position = [13 556 430 22];
            app.RemoveNilNeuronsButton.Text = 'Remove Nil Neurons';

            % Create thresholdLA
            app.thresholdLA = uibutton(app.ProcessingParametersPanel, 'push');
            app.thresholdLA.ButtonPushedFcn = createCallbackFcn(app, @thresholdLAPushed, true);
            app.thresholdLA.Position = [309 492 134 22];
            app.thresholdLA.Text = 'Threshold';

            % Create ExportButton
            app.ExportButton = uibutton(app.ProcessingParametersPanel, 'push');
            app.ExportButton.ButtonPushedFcn = createCallbackFcn(app, @ExportButtonPushed, true);
            app.ExportButton.Position = [343 426 100 22];
            app.ExportButton.Text = 'Export';

            % Create PlotOptionsDropDownLabel
            app.PlotOptionsDropDownLabel = uilabel(app.ProcessingParametersPanel);
            app.PlotOptionsDropDownLabel.HorizontalAlignment = 'center';
            app.PlotOptionsDropDownLabel.FontName = 'Arial';
            app.PlotOptionsDropDownLabel.FontSize = 16;
            app.PlotOptionsDropDownLabel.Position = [13 340 93 22];
            app.PlotOptionsDropDownLabel.Text = 'Plot Options';

            % Create PlotOptionsDropDown
            app.PlotOptionsDropDown = uidropdown(app.ProcessingParametersPanel);
            app.PlotOptionsDropDown.Items = {'Raster', 'Binned Raster', 'Activity Distribution (Sum)', 'Activity Distribution (Percent)', 'Firing Distribution', '', ''};
            app.PlotOptionsDropDown.ValueChangedFcn = createCallbackFcn(app, @PlotOptionsDropDownValueChanged, true);
            app.PlotOptionsDropDown.FontName = 'Arial';
            app.PlotOptionsDropDown.FontSize = 16;
            app.PlotOptionsDropDown.Position = [110 300 355 100];
            app.PlotOptionsDropDown.Value = 'Raster';

            % Create SOMETHINPanel
            app.SOMETHINPanel = uipanel(app.ProcessingParametersPanel);
            app.SOMETHINPanel.AutoResizeChildren = 'off';
            app.SOMETHINPanel.Title = 'SOMETHIN''';
            app.SOMETHINPanel.Position = [104 37 260 221];

            % Create TextArea_2
            app.TextArea_2 = uitextarea(app.SOMETHINPanel);
            app.TextArea_2.FontName = 'Arial';
            app.TextArea_2.FontSize = 21;
            app.TextArea_2.Position = [16 13 228 181];
            app.TextArea_2.Value = {'In the beginning the Universe was created. This has made a lot of people very angry and been widely regarded as a bad move.'};

            % Create BinDurationEditFieldLabel
            app.BinDurationEditFieldLabel = uilabel(app.ProcessingParametersPanel);
            app.BinDurationEditFieldLabel.HorizontalAlignment = 'right';
            app.BinDurationEditFieldLabel.Position = [130 656 72 22];
            app.BinDurationEditFieldLabel.Text = 'Bin Duration';

            % Create BinDurationEditField
            app.BinDurationEditField = uieditfield(app.ProcessingParametersPanel, 'numeric');
            app.BinDurationEditField.Limits = [0 Inf];
            app.BinDurationEditField.ValueDisplayFormat = '%11.4g ms';
            app.BinDurationEditField.Position = [220 656 110 22];

            % Create ActivityMEANEditFieldLabel
            app.ActivityMEANEditFieldLabel = uilabel(app.ProcessingParametersPanel);
            app.ActivityMEANEditFieldLabel.HorizontalAlignment = 'right';
            app.ActivityMEANEditFieldLabel.Position = [7 623 82 22];
            app.ActivityMEANEditFieldLabel.Text = 'Activity MEAN';

            % Create meanHAField
            app.meanHAField = uieditfield(app.ProcessingParametersPanel, 'numeric');
            app.meanHAField.Limits = [0 Inf];
            app.meanHAField.ValueDisplayFormat = '%11.4g Percent';
            app.meanHAField.Position = [104 623 100 22];

            % Create STDEVEditFieldLabel
            app.STDEVEditFieldLabel = uilabel(app.ProcessingParametersPanel);
            app.STDEVEditFieldLabel.HorizontalAlignment = 'right';
            app.STDEVEditFieldLabel.Position = [213 623 46 22];
            app.STDEVEditFieldLabel.Text = 'STDEV';

            % Create stdevHAField
            app.stdevHAField = uieditfield(app.ProcessingParametersPanel, 'numeric');
            app.stdevHAField.ValueDisplayFormat = '%11.4g Percent';
            app.stdevHAField.Position = [274 623 100 22];

            % Create STDEVEditFieldLabel_2
            app.STDEVEditFieldLabel_2 = uilabel(app.ProcessingParametersPanel);
            app.STDEVEditFieldLabel_2.HorizontalAlignment = 'right';
            app.STDEVEditFieldLabel_2.Position = [213 526 46 22];
            app.STDEVEditFieldLabel_2.Text = 'STDEV';

            % Create stdevLAField
            app.stdevLAField = uieditfield(app.ProcessingParametersPanel, 'numeric');
            app.stdevLAField.ValueDisplayFormat = '%11.4g Percent';
            app.stdevLAField.Position = [274 526 100 22];

            % Create ActivityMEANEditField_2Label
            app.ActivityMEANEditField_2Label = uilabel(app.ProcessingParametersPanel);
            app.ActivityMEANEditField_2Label.HorizontalAlignment = 'right';
            app.ActivityMEANEditField_2Label.Position = [11 526 82 22];
            app.ActivityMEANEditField_2Label.Text = 'Activity MEAN';

            % Create meanLAField
            app.meanLAField = uieditfield(app.ProcessingParametersPanel, 'numeric');
            app.meanLAField.Limits = [0 Inf];
            app.meanLAField.ValueDisplayFormat = '%11.4g Percent';
            app.meanLAField.Position = [108 526 100 22];

            % Create thresholdHyper
            app.thresholdHyper = uibutton(app.ProcessingParametersPanel, 'push');
            app.thresholdHyper.Position = [309 463 134 22];
            app.thresholdHyper.Text = 'Threshold';

            % Create InitializeButton
            app.InitializeButton = uibutton(app.ProcessingParametersPanel, 'push');
            app.InitializeButton.ButtonPushedFcn = createCallbackFcn(app, @InitializeButtonPushed, true);
            app.InitializeButton.Position = [13 426 100 22];
            app.InitializeButton.Text = 'Initialize';

            % Create ImportUDFButton
            app.ImportUDFButton = uibutton(app.ProcessingParametersPanel, 'push');
            app.ImportUDFButton.ButtonPushedFcn = createCallbackFcn(app, @ImportUDFButtonPushed, true);
            app.ImportUDFButton.FontName = 'Arial';
            app.ImportUDFButton.Position = [124 426 100 22];
            app.ImportUDFButton.Text = 'Import UDF';

            % Create ProcessUDFButton
            app.ProcessUDFButton = uibutton(app.ProcessingParametersPanel, 'push');
            app.ProcessUDFButton.ButtonPushedFcn = createCallbackFcn(app, @ProcessUDFButtonPushed, true);
            app.ProcessUDFButton.FontName = 'Arial';
            app.ProcessUDFButton.Position = [230 426 100 22];
            app.ProcessUDFButton.Text = 'Process UDF';

            % Create LowActivityThresholdEditFieldLabel
            app.LowActivityThresholdEditFieldLabel = uilabel(app.ProcessingParametersPanel);
            app.LowActivityThresholdEditFieldLabel.HorizontalAlignment = 'right';
            app.LowActivityThresholdEditFieldLabel.Position = [14 496 126 22];
            app.LowActivityThresholdEditFieldLabel.Text = 'Low Activity Threshold';

            % Create LowActivityThresholdEditField
            app.LowActivityThresholdEditField = uieditfield(app.ProcessingParametersPanel, 'numeric');
            app.LowActivityThresholdEditField.Limits = [0 Inf];
            app.LowActivityThresholdEditField.ValueDisplayFormat = '%11.4g Percent';
            app.LowActivityThresholdEditField.Position = [155 496 104 22];

            % Create HyperactiveThresholdEditFieldLabel
            app.HyperactiveThresholdEditFieldLabel = uilabel(app.ProcessingParametersPanel);
            app.HyperactiveThresholdEditFieldLabel.HorizontalAlignment = 'right';
            app.HyperactiveThresholdEditFieldLabel.Position = [20 466 126 22];
            app.HyperactiveThresholdEditFieldLabel.Text = 'Hyperactive Threshold';

            % Create HyperactiveThresholdEditField
            app.HyperactiveThresholdEditField = uieditfield(app.ProcessingParametersPanel, 'numeric');
            app.HyperactiveThresholdEditField.Limits = [0 Inf];
            app.HyperactiveThresholdEditField.ValueDisplayFormat = '%11.4g Percent';
            app.HyperactiveThresholdEditField.ValueChangedFcn = createCallbackFcn(app, @HyperactiveThresholdEditFieldValueChanged, true);
            app.HyperactiveThresholdEditField.Position = [161 466 100 22];

            % Create EmptySpacePanel
            app.EmptySpacePanel = uipanel(app.Preprocessing);
            app.EmptySpacePanel.AutoResizeChildren = 'off';
            app.EmptySpacePanel.Title = 'Empty Space';
            app.EmptySpacePanel.Position = [500 14 876 221];

            % Create TextArea
            app.TextArea = uitextarea(app.EmptySpacePanel);
            app.TextArea.Editable = 'off';
            app.TextArea.FontName = 'Arial';
            app.TextArea.FontSize = 24;
            app.TextArea.BackgroundColor = [0.9412 0.9412 0.9412];
            app.TextArea.Position = [9 13 855 181];
            app.TextArea.Value = {'For instance, on the planet Earth, man had always assumed that he was more intelligent than dolphins because he had achieved so much — the wheel, New York, wars and so on — whilst all the dolphins had ever done was muck about in the water having a good time. But conversely, the dolphins had always believed that they were far more intelligent than man — for precisely the same reasons.'};

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.Preprocessing);
            title(app.UIAxes2, 'Title')
            xlabel(app.UIAxes2, 'X')
            ylabel(app.UIAxes2, 'Y')
            zlabel(app.UIAxes2, 'Z')
            app.UIAxes2.Position = [499 245 887 489];

            % Create VideoMask
            app.VideoMask = uitab(app.TabGroup);
            app.VideoMask.AutoResizeChildren = 'off';

            % Create Tab_3
            app.Tab_3 = uitab(app.TabGroup);
            app.Tab_3.AutoResizeChildren = 'off';

            % Create ROISelectionPanel
            app.ROISelectionPanel = uipanel(app.UIFigure);
            app.ROISelectionPanel.TitlePosition = 'centertop';
            app.ROISelectionPanel.Title = 'ROI Selection';
            app.ROISelectionPanel.FontName = 'Arial';
            app.ROISelectionPanel.FontWeight = 'bold';
            app.ROISelectionPanel.FontSize = 18;
            app.ROISelectionPanel.Position = [1430 35 375 320];

            % Create ROILabel
            app.ROILabel = uilabel(app.ROISelectionPanel);
            app.ROILabel.HorizontalAlignment = 'right';
            app.ROILabel.FontName = 'Arial';
            app.ROILabel.FontSize = 16;
            app.ROILabel.FontWeight = 'bold';
            app.ROILabel.Position = [15 260 35 23];
            app.ROILabel.Text = 'ROI';

            % Create SelectedCell
            app.SelectedCell = uispinner(app.ROISelectionPanel);
            app.SelectedCell.Limits = [1 Inf];
            app.SelectedCell.ValueChangedFcn = createCallbackFcn(app, @SelectedCellValueChanged, true);
            app.SelectedCell.FontName = 'Arial';
            app.SelectedCell.FontSize = 16;
            app.SelectedCell.FontWeight = 'bold';
            app.SelectedCell.Position = [90 260 270 22];
            app.SelectedCell.Value = 1;

            % Create SaveButton
            app.SaveButton = uibutton(app.ROISelectionPanel, 'push');
            app.SaveButton.ButtonPushedFcn = createCallbackFcn(app, @SaveButtonPushed, true);
            app.SaveButton.Position = [25 15 335 22];
            app.SaveButton.Text = 'Save';

            % Create AUTOSAVEONCLOSECheckBox
            app.AUTOSAVEONCLOSECheckBox = uicheckbox(app.ROISelectionPanel);
            app.AUTOSAVEONCLOSECheckBox.ValueChangedFcn = createCallbackFcn(app, @AUTOSAVEONCLOSECheckBoxValueChanged, true);
            app.AUTOSAVEONCLOSECheckBox.Text = ' AUTOSAVE ON CLOSE';
            app.AUTOSAVEONCLOSECheckBox.FontName = 'Arial';
            app.AUTOSAVEONCLOSECheckBox.FontSize = 24;
            app.AUTOSAVEONCLOSECheckBox.Position = [24 44 337 62];

            % Create FilenameEditFieldLabel
            app.FilenameEditFieldLabel = uilabel(app.ROISelectionPanel);
            app.FilenameEditFieldLabel.HorizontalAlignment = 'right';
            app.FilenameEditFieldLabel.Position = [24 95 55 22];
            app.FilenameEditFieldLabel.Text = 'Filename';

            % Create FilenameEditField
            app.FilenameEditField = uieditfield(app.ROISelectionPanel, 'text');
            app.FilenameEditField.ValueChangedFcn = createCallbackFcn(app, @FilenameEditFieldValueChanged, true);
            app.FilenameEditField.Position = [94 95 253 22];

            % Create NeuronsEditFieldLabel
            app.NeuronsEditFieldLabel = uilabel(app.ROISelectionPanel);
            app.NeuronsEditFieldLabel.HorizontalAlignment = 'right';
            app.NeuronsEditFieldLabel.FontName = 'Arial';
            app.NeuronsEditFieldLabel.FontSize = 16;
            app.NeuronsEditFieldLabel.FontWeight = 'bold';
            app.NeuronsEditFieldLabel.Position = [15 220 70 22];
            app.NeuronsEditFieldLabel.Text = 'Neurons';

            % Create NeuronsEditField
            app.NeuronsEditField = uieditfield(app.ROISelectionPanel, 'numeric');
            app.NeuronsEditField.Limits = [0 Inf];
            app.NeuronsEditField.ValueDisplayFormat = '%.0f';
            app.NeuronsEditField.FontName = 'Arial';
            app.NeuronsEditField.FontSize = 16;
            app.NeuronsEditField.Position = [90 220 270 22];

            % Create DroppedEditFieldLabel
            app.DroppedEditFieldLabel = uilabel(app.ROISelectionPanel);
            app.DroppedEditFieldLabel.HorizontalAlignment = 'right';
            app.DroppedEditFieldLabel.FontName = 'Arial';
            app.DroppedEditFieldLabel.FontSize = 16;
            app.DroppedEditFieldLabel.FontWeight = 'bold';
            app.DroppedEditFieldLabel.Position = [15 180 71 22];
            app.DroppedEditFieldLabel.Text = 'Dropped';

            % Create DroppedEditField
            app.DroppedEditField = uieditfield(app.ROISelectionPanel, 'numeric');
            app.DroppedEditField.Limits = [0 Inf];
            app.DroppedEditField.ValueDisplayFormat = '%.0f';
            app.DroppedEditField.FontName = 'Arial';
            app.DroppedEditField.FontSize = 16;
            app.DroppedEditField.Position = [90 180 270 22];

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.UIFigure);
            app.TabGroup2.Position = [1430 370 375 437];

            % Create SelectedROIDetails
            app.SelectedROIDetails = uitab(app.TabGroup2);
            app.SelectedROIDetails.Title = 'ROI';

            % Create CellProbabilityEditFieldLabel
            app.CellProbabilityEditFieldLabel = uilabel(app.SelectedROIDetails);
            app.CellProbabilityEditFieldLabel.HorizontalAlignment = 'right';
            app.CellProbabilityEditFieldLabel.FontName = 'Arial';
            app.CellProbabilityEditFieldLabel.FontSize = 14;
            app.CellProbabilityEditFieldLabel.Position = [15 65 99 22];
            app.CellProbabilityEditFieldLabel.Text = 'Cell Probability';

            % Create SNREditFieldLabel
            app.SNREditFieldLabel = uilabel(app.SelectedROIDetails);
            app.SNREditFieldLabel.HorizontalAlignment = 'right';
            app.SNREditFieldLabel.FontName = 'Arial';
            app.SNREditFieldLabel.FontSize = 14;
            app.SNREditFieldLabel.Position = [15 215 35 22];
            app.SNREditFieldLabel.Text = 'SNR';

            % Create SNREditField
            app.SNREditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.SNREditField.Limits = [0 Inf];
            app.SNREditField.Editable = 'off';
            app.SNREditField.FontName = 'Arial';
            app.SNREditField.FontSize = 14;
            app.SNREditField.Position = [131 215 70 22];

            % Create CellProbabilityEditField
            app.CellProbabilityEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.CellProbabilityEditField.Editable = 'off';
            app.CellProbabilityEditField.FontName = 'Arial';
            app.CellProbabilityEditField.FontSize = 14;
            app.CellProbabilityEditField.Position = [131 65 70 22];

            % Create RadiusEditField
            app.RadiusEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.RadiusEditField.Limits = [0 Inf];
            app.RadiusEditField.Editable = 'off';
            app.RadiusEditField.FontName = 'Arial';
            app.RadiusEditField.FontSize = 14;
            app.RadiusEditField.Position = [131 185 70 22];

            % Create RadiusEditFieldLabel
            app.RadiusEditFieldLabel = uilabel(app.SelectedROIDetails);
            app.RadiusEditFieldLabel.HorizontalAlignment = 'right';
            app.RadiusEditFieldLabel.FontName = 'Arial';
            app.RadiusEditFieldLabel.FontSize = 14;
            app.RadiusEditFieldLabel.Position = [15 185 49 22];
            app.RadiusEditFieldLabel.Text = 'Radius';

            % Create SolidityEditField
            app.SolidityEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.SolidityEditField.Limits = [0 Inf];
            app.SolidityEditField.Editable = 'off';
            app.SolidityEditField.FontName = 'Arial';
            app.SolidityEditField.FontSize = 14;
            app.SolidityEditField.Position = [131 155 70 22];

            % Create SolidityLabel
            app.SolidityLabel = uilabel(app.SelectedROIDetails);
            app.SolidityLabel.HorizontalAlignment = 'right';
            app.SolidityLabel.FontName = 'Arial';
            app.SolidityLabel.FontSize = 14;
            app.SolidityLabel.Position = [15 155 51 22];
            app.SolidityLabel.Text = 'Solidity';

            % Create FootprintEditField
            app.FootprintEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.FootprintEditField.Limits = [0 Inf];
            app.FootprintEditField.Editable = 'off';
            app.FootprintEditField.FontName = 'Arial';
            app.FootprintEditField.FontSize = 14;
            app.FootprintEditField.Position = [131 125 70 22];

            % Create FootprintEditFieldLabel
            app.FootprintEditFieldLabel = uilabel(app.SelectedROIDetails);
            app.FootprintEditFieldLabel.HorizontalAlignment = 'right';
            app.FootprintEditFieldLabel.FontName = 'Arial';
            app.FootprintEditFieldLabel.FontSize = 14;
            app.FootprintEditFieldLabel.Position = [15 125 61 22];
            app.FootprintEditFieldLabel.Text = 'Footprint';

            % Create CompactnessEditField
            app.CompactnessEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.CompactnessEditField.Limits = [0 Inf];
            app.CompactnessEditField.Editable = 'off';
            app.CompactnessEditField.FontName = 'Arial';
            app.CompactnessEditField.FontSize = 14;
            app.CompactnessEditField.Position = [131 95 70 22];

            % Create CompactnessEditFieldLabel
            app.CompactnessEditFieldLabel = uilabel(app.SelectedROIDetails);
            app.CompactnessEditFieldLabel.HorizontalAlignment = 'right';
            app.CompactnessEditFieldLabel.FontName = 'Arial';
            app.CompactnessEditFieldLabel.FontSize = 14;
            app.CompactnessEditFieldLabel.Position = [15 95 91 22];
            app.CompactnessEditFieldLabel.Text = 'Compactness';

            % Create SomaPixelsEditFieldLabel
            app.SomaPixelsEditFieldLabel = uilabel(app.SelectedROIDetails);
            app.SomaPixelsEditFieldLabel.HorizontalAlignment = 'right';
            app.SomaPixelsEditFieldLabel.FontName = 'Arial';
            app.SomaPixelsEditFieldLabel.FontSize = 14;
            app.SomaPixelsEditFieldLabel.Position = [203 125 83 22];
            app.SomaPixelsEditFieldLabel.Text = 'Soma Pixels';

            % Create SkewEditField
            app.SkewEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.SkewEditField.Editable = 'off';
            app.SkewEditField.FontName = 'Arial';
            app.SkewEditField.FontSize = 14;
            app.SkewEditField.Position = [294 215 70 22];

            % Create TotalPixelsEditFieldLabel
            app.TotalPixelsEditFieldLabel = uilabel(app.SelectedROIDetails);
            app.TotalPixelsEditFieldLabel.HorizontalAlignment = 'right';
            app.TotalPixelsEditFieldLabel.FontName = 'Arial';
            app.TotalPixelsEditFieldLabel.FontSize = 14;
            app.TotalPixelsEditFieldLabel.Position = [203 155 76 22];
            app.TotalPixelsEditFieldLabel.Text = 'Total Pixels';

            % Create AspectEditField
            app.AspectEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.AspectEditField.Editable = 'off';
            app.AspectEditField.FontName = 'Arial';
            app.AspectEditField.FontSize = 14;
            app.AspectEditField.Position = [294 185 70 22];

            % Create AspectEditField_2Label
            app.AspectEditField_2Label = uilabel(app.SelectedROIDetails);
            app.AspectEditField_2Label.HorizontalAlignment = 'right';
            app.AspectEditField_2Label.FontName = 'Arial';
            app.AspectEditField_2Label.FontSize = 14;
            app.AspectEditField_2Label.Position = [203 185 48 22];
            app.AspectEditField_2Label.Text = 'Aspect';

            % Create TotalPixelsEditField
            app.TotalPixelsEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.TotalPixelsEditField.Editable = 'off';
            app.TotalPixelsEditField.FontName = 'Arial';
            app.TotalPixelsEditField.FontSize = 14;
            app.TotalPixelsEditField.Position = [294 155 70 22];

            % Create SkewEditField_2Label
            app.SkewEditField_2Label = uilabel(app.SelectedROIDetails);
            app.SkewEditField_2Label.HorizontalAlignment = 'right';
            app.SkewEditField_2Label.FontName = 'Arial';
            app.SkewEditField_2Label.FontSize = 14;
            app.SkewEditField_2Label.Position = [203 215 40 22];
            app.SkewEditField_2Label.Text = 'Skew';

            % Create SomaPixelsEditField
            app.SomaPixelsEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.SomaPixelsEditField.Editable = 'off';
            app.SomaPixelsEditField.FontName = 'Arial';
            app.SomaPixelsEditField.FontSize = 14;
            app.SomaPixelsEditField.Position = [294 125 70 22];

            % Create Switch
            app.Switch = uiswitch(app.SelectedROIDetails, 'slider');
            app.Switch.Items = {'Drop', 'Neuron'};
            app.Switch.ValueChangedFcn = createCallbackFcn(app, @SwitchValueChanged, true);
            app.Switch.FontName = 'Arial';
            app.Switch.FontSize = 14;
            app.Switch.Position = [260 20 45 20];
            app.Switch.Value = 'Neuron';

            % Create NormSoma_EditLabel
            app.NormSoma_EditLabel = uilabel(app.SelectedROIDetails);
            app.NormSoma_EditLabel.HorizontalAlignment = 'right';
            app.NormSoma_EditLabel.FontName = 'Arial';
            app.NormSoma_EditLabel.FontSize = 14;
            app.NormSoma_EditLabel.Position = [203 65 84 22];
            app.NormSoma_EditLabel.Text = 'Norm. Soma';

            % Create NormTotal_EditLabel
            app.NormTotal_EditLabel = uilabel(app.SelectedROIDetails);
            app.NormTotal_EditLabel.HorizontalAlignment = 'right';
            app.NormTotal_EditLabel.FontName = 'Arial';
            app.NormTotal_EditLabel.FontSize = 14;
            app.NormTotal_EditLabel.Position = [203 95 73 22];
            app.NormTotal_EditLabel.Text = 'Norm Total';

            % Create NormTotal_EditField
            app.NormTotal_EditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.NormTotal_EditField.Editable = 'off';
            app.NormTotal_EditField.FontName = 'Arial';
            app.NormTotal_EditField.FontSize = 14;
            app.NormTotal_EditField.Position = [294 95 70 22];

            % Create NormSoma_EditField
            app.NormSoma_EditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.NormSoma_EditField.Editable = 'off';
            app.NormSoma_EditField.FontName = 'Arial';
            app.NormSoma_EditField.FontSize = 14;
            app.NormSoma_EditField.Position = [294 65 70 22];

            % Create SNRS2P_EditLabel
            app.SNRS2P_EditLabel = uilabel(app.SelectedROIDetails);
            app.SNRS2P_EditLabel.HorizontalAlignment = 'right';
            app.SNRS2P_EditLabel.FontName = 'Arial';
            app.SNRS2P_EditLabel.FontSize = 14;
            app.SNRS2P_EditLabel.Position = [15 35 75 22];
            app.SNRS2P_EditLabel.Text = 'SNR (S2P)';

            % Create SNRS2P_EditField
            app.SNRS2P_EditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.SNRS2P_EditField.Editable = 'off';
            app.SNRS2P_EditField.FontName = 'Arial';
            app.SNRS2P_EditField.FontSize = 14;
            app.SNRS2P_EditField.Position = [131 35 70 22];

            % Create NoiseStd_EditLabel
            app.NoiseStd_EditLabel = uilabel(app.SelectedROIDetails);
            app.NoiseStd_EditLabel.HorizontalAlignment = 'right';
            app.NoiseStd_EditLabel.FontName = 'Arial';
            app.NoiseStd_EditLabel.FontSize = 14;
            app.NoiseStd_EditLabel.Position = [15 5 76 22];
            app.NoiseStd_EditLabel.Text = 'Noise (Std)';

            % Create NoiseStd_EditField
            app.NoiseStd_EditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.NoiseStd_EditField.Editable = 'off';
            app.NoiseStd_EditField.FontName = 'Arial';
            app.NoiseStd_EditField.FontSize = 14;
            app.NoiseStd_EditField.Position = [131 5 70 22];

            % Create UIAxes
            app.UIAxes = uiaxes(app.SelectedROIDetails);
            title(app.UIAxes, 'Close-Up')
            app.UIAxes.FontName = 'Arial';
            app.UIAxes.FontWeight = 'bold';
            app.UIAxes.XTick = [];
            app.UIAxes.YTick = [];
            app.UIAxes.FontSize = 14;
            app.UIAxes.Box = 'on';
            app.UIAxes.Position = [32 250 152 152];

            % Create Neuropil_Close
            app.Neuropil_Close = uiaxes(app.SelectedROIDetails);
            title(app.Neuropil_Close, 'Neuropil')
            app.Neuropil_Close.FontName = 'Arial';
            app.Neuropil_Close.FontWeight = 'bold';
            app.Neuropil_Close.XTick = [];
            app.Neuropil_Close.YTick = [];
            app.Neuropil_Close.FontSize = 14;
            app.Neuropil_Close.Box = 'on';
            app.Neuropil_Close.Position = [207 250 152 152];

            % Create Threshold
            app.Threshold = uitab(app.TabGroup2);
            app.Threshold.Title = 'Thresholding';

            % Create ThresholdValueEditFieldLabel
            app.ThresholdValueEditFieldLabel = uilabel(app.Threshold);
            app.ThresholdValueEditFieldLabel.HorizontalAlignment = 'right';
            app.ThresholdValueEditFieldLabel.FontName = 'Arial';
            app.ThresholdValueEditFieldLabel.FontSize = 16;
            app.ThresholdValueEditFieldLabel.Position = [15 44 121 22];
            app.ThresholdValueEditFieldLabel.Text = 'Threshold Value';

            % Create ThresholdValueEditField
            app.ThresholdValueEditField = uieditfield(app.Threshold, 'numeric');
            app.ThresholdValueEditField.HorizontalAlignment = 'center';
            app.ThresholdValueEditField.FontName = 'Arial';
            app.ThresholdValueEditField.FontSize = 16;
            app.ThresholdValueEditField.Position = [151 44 90 22];

            % Create ThresholdButton
            app.ThresholdButton = uibutton(app.Threshold, 'push');
            app.ThresholdButton.ButtonPushedFcn = createCallbackFcn(app, @ThresholdButtonPushed, true);
            app.ThresholdButton.FontName = 'Arial';
            app.ThresholdButton.FontSize = 16;
            app.ThresholdButton.Position = [250 44 111 24];
            app.ThresholdButton.Text = 'Threshold';

            % Create ResetButton
            app.ResetButton = uibutton(app.Threshold, 'push');
            app.ResetButton.ButtonPushedFcn = createCallbackFcn(app, @ResetButtonPushed, true);
            app.ResetButton.FontName = 'Arial';
            app.ResetButton.FontSize = 16;
            app.ResetButton.Position = [249 11 111 26];
            app.ResetButton.Text = 'Reset';

            % Create AllButton
            app.AllButton = uibutton(app.Threshold, 'push');
            app.AllButton.ButtonPushedFcn = createCallbackFcn(app, @AllButtonPushed, true);
            app.AllButton.FontName = 'Arial';
            app.AllButton.FontSize = 16;
            app.AllButton.Position = [131 11 111 26];
            app.AllButton.Text = 'All';

            % Create NoneButton
            app.NoneButton = uibutton(app.Threshold, 'push');
            app.NoneButton.ButtonPushedFcn = createCallbackFcn(app, @NoneButtonPushed, true);
            app.NoneButton.FontName = 'Arial';
            app.NoneButton.FontSize = 16;
            app.NoneButton.Position = [15 11 111 26];
            app.NoneButton.Text = 'None';

            % Create OperatorButtonGroup
            app.OperatorButtonGroup = uibuttongroup(app.Threshold);
            app.OperatorButtonGroup.Title = 'Operator';
            app.OperatorButtonGroup.FontName = 'Arial';
            app.OperatorButtonGroup.Position = [248 77 112 81];

            % Create LessThanButton
            app.LessThanButton = uiradiobutton(app.OperatorButtonGroup);
            app.LessThanButton.Text = 'Less Than';
            app.LessThanButton.FontName = 'Arial';
            app.LessThanButton.Position = [7 32 78 22];
            app.LessThanButton.Value = true;

            % Create GreaterThanButton
            app.GreaterThanButton = uiradiobutton(app.OperatorButtonGroup);
            app.GreaterThanButton.Text = 'Greater Than';
            app.GreaterThanButton.FontName = 'Arial';
            app.GreaterThanButton.Position = [7 11 93 22];

            % Create ThresholdTypeDropDown
            app.ThresholdTypeDropDown = uidropdown(app.Threshold);
            app.ThresholdTypeDropDown.Items = {'SNR', 'Radius', 'Solidity', 'Footprint', 'Compactness', 'Cell Probability', 'SNR (S2P)', 'Noise (Std)', 'Skew', 'Aspect', 'Total Pixels', 'Soma Pixels', 'Norm Total', 'Norm Soma'};
            app.ThresholdTypeDropDown.ValueChangedFcn = createCallbackFcn(app, @ThresholdTypeDropDownValueChanged, true);
            app.ThresholdTypeDropDown.FontName = 'Arial';
            app.ThresholdTypeDropDown.FontSize = 16;
            app.ThresholdTypeDropDown.Position = [15 77 225 79];
            app.ThresholdTypeDropDown.Value = 'SNR';

            % Create StatDistribution
            app.StatDistribution = uiaxes(app.Threshold);
            app.StatDistribution.FontName = 'Arial';
            app.StatDistribution.FontSize = 12;
            app.StatDistribution.Box = 'on';
            app.StatDistribution.Position = [15 157 345 242];

            % Create RestaurantattheendoftheuniverseLabel
            app.RestaurantattheendoftheuniverseLabel = uilabel(app.UIFigure);
            app.RestaurantattheendoftheuniverseLabel.HorizontalAlignment = 'center';
            app.RestaurantattheendoftheuniverseLabel.Position = [1762 597 204 305];
            app.RestaurantattheendoftheuniverseLabel.Text = {'Restaurant '; 'at '; 'the '; 'end '; 'of '; 'the '; 'universe'};

            % Create RestaurantattheendoftheuniverseLabel_2
            app.RestaurantattheendoftheuniverseLabel_2 = uilabel(app.UIFigure);
            app.RestaurantattheendoftheuniverseLabel_2.HorizontalAlignment = 'center';
            app.RestaurantattheendoftheuniverseLabel_2.Position = [1762 396 204 305];
            app.RestaurantattheendoftheuniverseLabel_2.Text = {'Restaurant '; 'at '; 'the '; 'end '; 'of '; 'the '; 'universe'};

            % Create RestaurantattheendoftheuniverseLabel_3
            app.RestaurantattheendoftheuniverseLabel_3 = uilabel(app.UIFigure);
            app.RestaurantattheendoftheuniverseLabel_3.HorizontalAlignment = 'center';
            app.RestaurantattheendoftheuniverseLabel_3.Position = [1762 139 204 305];
            app.RestaurantattheendoftheuniverseLabel_3.Text = {'Restaurant '; 'at '; 'the '; 'end '; 'of '; 'the '; 'universe'};

            % Create RestaurantattheendoftheuniverseLabel_4
            app.RestaurantattheendoftheuniverseLabel_4 = uilabel(app.UIFigure);
            app.RestaurantattheendoftheuniverseLabel_4.HorizontalAlignment = 'center';
            app.RestaurantattheendoftheuniverseLabel_4.Position = [1762 -67 204 305];
            app.RestaurantattheendoftheuniverseLabel_4.Text = {'Restaurant '; 'at '; 'the '; 'end '; 'of '; 'the '; 'universe'};

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Sweet_Pee_Viewer

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end