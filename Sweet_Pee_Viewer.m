classdef Sweet_Pee_Viewer < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        IOPanel                        matlab.ui.container.Panel
        CompiledPath                   matlab.ui.control.EditField
        OptionsPath                    matlab.ui.control.EditField
        LoggingConsoleLabel            matlab.ui.control.Label
        BrowseCompiled                 matlab.ui.control.Button
        BrowseOptions                  matlab.ui.control.Button
        LoadCompiled                   matlab.ui.control.Button
        LoadOptions                    matlab.ui.control.Button
        HiRasLabel                     matlab.ui.control.Label
        v070Label                      matlab.ui.control.Label
        LogTextArea                    matlab.ui.control.TextArea
        Suite2PPath                    matlab.ui.control.EditField
        BrowseSuite2P                  matlab.ui.control.Button
        ImportImaging                  matlab.ui.control.Button
        FIssaPath                      matlab.ui.control.EditField
        BrowseFissa                    matlab.ui.control.Button
        TabGroup                       matlab.ui.container.TabGroup
        ROIsTab                        matlab.ui.container.Tab
        CalciumTracePlottingPanel      matlab.ui.container.Panel
        FissaLabel                     matlab.ui.control.Label
        PlotTrace_F_fissa              matlab.ui.control.CheckBox
        PlotTrace_Fneu_fissa           matlab.ui.control.CheckBox
        PlotTrace_cF_fissa             matlab.ui.control.CheckBox
        PlotTrace_AdcF_fissa           matlab.ui.control.CheckBox
        PlotTrace_sep_fissa            matlab.ui.control.CheckBox
        PlotTrace_nPil_fissa           matlab.ui.control.CheckBox
        PlotTrace_dFdT_fissa           matlab.ui.control.CheckBox
        PlotTrace_dFoF_fissa           matlab.ui.control.CheckBox
        PlotTrace_dFdT_fissa_4         matlab.ui.control.CheckBox
        PlotTrace_dFdT_fissa_5         matlab.ui.control.CheckBox
        Suite2PLabel                   matlab.ui.control.Label
        PlotTrace_F_suite2p            matlab.ui.control.CheckBox
        PlotTrace_Fneu_suite2p         matlab.ui.control.CheckBox
        PlotTrace_cF_suite2p           matlab.ui.control.CheckBox
        PlotTrace_AdcF_suite2p         matlab.ui.control.CheckBox
        PlotTrace_dFdT_suite2p         matlab.ui.control.CheckBox
        PlotTrace_dFoF_suite2p         matlab.ui.control.CheckBox
        PlotTrace_dFdT_fissa_2         matlab.ui.control.CheckBox
        PlotTrace_dFdT_fissa_3         matlab.ui.control.CheckBox
        Panel                          matlab.ui.container.Panel
        UseYLimitsCheckBox             matlab.ui.control.CheckBox
        UseXLimitsCheckBox             matlab.ui.control.CheckBox
        XLimitUpper                    matlab.ui.control.NumericEditField
        XLimitLower                    matlab.ui.control.NumericEditField
        YLimitLower                    matlab.ui.control.NumericEditField
        YLimitUpper                    matlab.ui.control.NumericEditField
        OverlayDropDown                matlab.ui.control.DropDown
        Scaling                        matlab.ui.control.DropDown
        CDMapDropDown                  matlab.ui.control.DropDown
        NeuronalROIs                   matlab.ui.control.UIAxes
        RemovedROIs                    matlab.ui.control.UIAxes
        CellSelected                   matlab.ui.control.UIAxes
        TracePlot                      matlab.ui.control.UIAxes
        Deconvolution                  matlab.ui.container.Tab
        MCMCTempPanel                  matlab.ui.container.Panel
        AROrderEditFieldLabel          matlab.ui.control.Label
        AROrderEditField               matlab.ui.control.NumericEditField
        gEditFieldLabel                matlab.ui.control.Label
        gEditField                     matlab.ui.control.NumericEditField
        BurnInEditFieldLabel           matlab.ui.control.Label
        BurnInEditField                matlab.ui.control.NumericEditField
        RiseEditFieldLabel             matlab.ui.control.Label
        RiseEditField                  matlab.ui.control.NumericEditField
        DecayEditFieldLabel            matlab.ui.control.Label
        DecayEditField                 matlab.ui.control.NumericEditField
        DtEditFieldLabel               matlab.ui.control.Label
        DtEditField                    matlab.ui.control.NumericEditField
        gEditField_2                   matlab.ui.control.NumericEditField
        RunButton                      matlab.ui.control.Button
        MCMCCellEditFieldLabel         matlab.ui.control.Label
        MCMCCellEditField              matlab.ui.control.NumericEditField
        RunAllButton                   matlab.ui.control.Button
        MCMC_X                         matlab.ui.control.CheckBox
        MCMC_Y                         matlab.ui.control.CheckBox
        MCMC_X_Min                     matlab.ui.control.NumericEditField
        MCMC_X_Max                     matlab.ui.control.NumericEditField
        MCMC_Y_Min                     matlab.ui.control.NumericEditField
        MCMC_Y_Max                     matlab.ui.control.NumericEditField
        MCMC_Axes_1                    matlab.ui.control.UIAxes
        MCMC_Axes_3                    matlab.ui.control.UIAxes
        VideoMask                      matlab.ui.container.Tab
        Tab_3                          matlab.ui.container.Tab
        Tab_2                          matlab.ui.container.Tab
        ROISelectionPanel              matlab.ui.container.Panel
        ROILabel                       matlab.ui.control.Label
        SelectedCell                   matlab.ui.control.Spinner
        SaveButton                     matlab.ui.control.Button
        AutosaveOnCloseCheckBox        matlab.ui.control.CheckBox
        TabGroup2                      matlab.ui.container.TabGroup
        SelectedROIDetails             matlab.ui.container.Tab
        CellProbabilityEditFieldLabel  matlab.ui.control.Label
        SNREditFieldLabel              matlab.ui.control.Label
        SNREditField                   matlab.ui.control.NumericEditField
        CellProbabilityEditField       matlab.ui.control.NumericEditField
        RadiusEditField                matlab.ui.control.NumericEditField
        RadiusEditFieldLabel           matlab.ui.control.Label
        SolidityEditField              matlab.ui.control.NumericEditField
        SolidityLabel                  matlab.ui.control.Label
        FootprintEditField             matlab.ui.control.NumericEditField
        FootprintEditFieldLabel        matlab.ui.control.Label
        CompactnessEditField           matlab.ui.control.NumericEditField
        CompactnessEditFieldLabel      matlab.ui.control.Label
        SomaPixelsEditFieldLabel       matlab.ui.control.Label
        SkewEditField                  matlab.ui.control.NumericEditField
        TotalPixelsEditFieldLabel      matlab.ui.control.Label
        AspectEditField                matlab.ui.control.NumericEditField
        AspectEditField_2Label         matlab.ui.control.Label
        TotalPixelsEditField           matlab.ui.control.NumericEditField
        SkewEditField_2Label           matlab.ui.control.Label
        SomaPixelsEditField            matlab.ui.control.NumericEditField
        Switch                         matlab.ui.control.Switch
        NormSoma_EditLabel             matlab.ui.control.Label
        NormTotal_EditLabel            matlab.ui.control.Label
        NormTotal_EditField            matlab.ui.control.NumericEditField
        NormSoma_EditField             matlab.ui.control.NumericEditField
        SNRS2P_EditLabel               matlab.ui.control.Label
        SNRS2P_EditField               matlab.ui.control.NumericEditField
        NoiseStd_EditLabel             matlab.ui.control.Label
        NoiseStd_EditField             matlab.ui.control.NumericEditField
        UIAxes                         matlab.ui.control.UIAxes
        Neuropil_Close                 matlab.ui.control.UIAxes
        Tab                            matlab.ui.container.Tab
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
                f_DA_update_log(app, 'ROBO RAFA: You need to move to Sweet Pee Viewer directory and reopen GUI!!!')
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

        % Value changed function: PlotTrace_dFoF_suite2p
        function PlotTrace_dFoF_suite2pValueChanged(app, event)
            value = app.PlotTrace_dFoF_suite2p.Value;
            app.plotTraceStyles.PlotdFoF_suite2p=value;
            f_DA_update_trace_plots(app);
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

        % Value changed function: PlotTrace_dFoF_fissa
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
            total = size(app.ImData.imParams.suite2p.F,1)
            for i = 1:total
                msg = ['Deconvolving ' num2str(i) ' of ' num2str(total) 'ROIs'];
                f_DA_update_log(app,msg);
                app.SelectedCell.Value=i;
                f_DA_deconvolve(app);
            end
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

        % Value changed function: AutosaveOnCloseCheckBox
        function AutosaveOnCloseCheckBoxValueChanged(app, event)
            value = app.AutosaveOnCloseCheckBox.Value;
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
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [1 1 1820 1000];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);

            % Create IOPanel
            app.IOPanel = uipanel(app.UIFigure);
            app.IOPanel.Position = [1 801 1820 200];

            % Create CompiledPath
            app.CompiledPath = uieditfield(app.IOPanel, 'text');
            app.CompiledPath.FontName = 'Arial';
            app.CompiledPath.Position = [441 157 461 22];
            app.CompiledPath.Value = 'Load Pre-Compiled File (.mat)';

            % Create OptionsPath
            app.OptionsPath = uieditfield(app.IOPanel, 'text');
            app.OptionsPath.FontName = 'Arial';
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

            % Create v070Label
            app.v070Label = uilabel(app.IOPanel);
            app.v070Label.FontName = 'Arial';
            app.v070Label.FontSize = 24;
            app.v070Label.FontWeight = 'bold';
            app.v070Label.Position = [81 69 66 30];
            app.v070Label.Text = 'v0.70';

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
            app.TabGroup.Position = [15 15 1400 772];

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

            % Create PlotTrace_dFoF_fissa
            app.PlotTrace_dFoF_fissa = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_dFoF_fissa.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_dFoF_fissaValueChanged, true);
            app.PlotTrace_dFoF_fissa.Visible = 'off';
            app.PlotTrace_dFoF_fissa.Text = 'Plot (F-Fo)/Fo';
            app.PlotTrace_dFoF_fissa.FontName = 'Arial';
            app.PlotTrace_dFoF_fissa.FontSize = 14;
            app.PlotTrace_dFoF_fissa.Position = [15 90 109 23];

            % Create PlotTrace_dFdT_fissa_4
            app.PlotTrace_dFdT_fissa_4 = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_dFdT_fissa_4.Text = 'Plot Decon.';
            app.PlotTrace_dFdT_fissa_4.FontName = 'Arial';
            app.PlotTrace_dFdT_fissa_4.FontSize = 14;
            app.PlotTrace_dFdT_fissa_4.Position = [15 70 116 23];

            % Create PlotTrace_dFdT_fissa_5
            app.PlotTrace_dFdT_fissa_5 = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_dFdT_fissa_5.Visible = 'off';
            app.PlotTrace_dFdT_fissa_5.Text = 'Plot Spikes';
            app.PlotTrace_dFdT_fissa_5.FontName = 'Arial';
            app.PlotTrace_dFdT_fissa_5.FontSize = 14;
            app.PlotTrace_dFdT_fissa_5.Position = [15 50 116 23];

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

            % Create PlotTrace_dFoF_suite2p
            app.PlotTrace_dFoF_suite2p = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_dFoF_suite2p.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_dFoF_suite2pValueChanged, true);
            app.PlotTrace_dFoF_suite2p.Visible = 'off';
            app.PlotTrace_dFoF_suite2p.Text = 'Plot (F-Fo)/Fo';
            app.PlotTrace_dFoF_suite2p.FontSize = 14;
            app.PlotTrace_dFoF_suite2p.Position = [160 130 109 23];

            % Create PlotTrace_dFdT_fissa_2
            app.PlotTrace_dFdT_fissa_2 = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_dFdT_fissa_2.ValueChangedFcn = createCallbackFcn(app, @PlotTrace_dFdT_fissa_2ValueChanged, true);
            app.PlotTrace_dFdT_fissa_2.Text = 'Plot Decon.';
            app.PlotTrace_dFdT_fissa_2.FontName = 'Arial';
            app.PlotTrace_dFdT_fissa_2.FontSize = 14;
            app.PlotTrace_dFdT_fissa_2.Position = [160 110 116 23];

            % Create PlotTrace_dFdT_fissa_3
            app.PlotTrace_dFdT_fissa_3 = uicheckbox(app.CalciumTracePlottingPanel);
            app.PlotTrace_dFdT_fissa_3.Visible = 'off';
            app.PlotTrace_dFdT_fissa_3.Text = 'Plot Spikes';
            app.PlotTrace_dFdT_fissa_3.FontName = 'Arial';
            app.PlotTrace_dFdT_fissa_3.FontSize = 14;
            app.PlotTrace_dFdT_fissa_3.Position = [160 90 116 23];

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
            app.AROrderEditField.Position = [80 336 100 22];
            app.AROrderEditField.Value = 2;

            % Create gEditFieldLabel
            app.gEditFieldLabel = uilabel(app.MCMCTempPanel);
            app.gEditFieldLabel.HorizontalAlignment = 'right';
            app.gEditFieldLabel.Position = [40 303 25 22];
            app.gEditFieldLabel.Text = 'g';

            % Create gEditField
            app.gEditField = uieditfield(app.MCMCTempPanel, 'numeric');
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
            app.DtEditField.Position = [80 154 100 22];
            app.DtEditField.Value = Inf;

            % Create gEditField_2
            app.gEditField_2 = uieditfield(app.MCMCTempPanel, 'numeric');
            app.gEditField_2.Position = [88 303 44 22];
            app.gEditField_2.Value = -Inf;

            % Create RunButton
            app.RunButton = uibutton(app.MCMCTempPanel, 'push');
            app.RunButton.ButtonPushedFcn = createCallbackFcn(app, @RunButtonPushed, true);
            app.RunButton.FontName = 'Arial';
            app.RunButton.FontSize = 16;
            app.RunButton.Position = [185 11 100 26];
            app.RunButton.Text = 'Run';

            % Create MCMCCellEditFieldLabel
            app.MCMCCellEditFieldLabel = uilabel(app.MCMCTempPanel);
            app.MCMCCellEditFieldLabel.HorizontalAlignment = 'right';
            app.MCMCCellEditFieldLabel.Position = [8 115 67 22];
            app.MCMCCellEditFieldLabel.Text = 'MCMC Cell';

            % Create MCMCCellEditField
            app.MCMCCellEditField = uieditfield(app.MCMCTempPanel, 'numeric');
            app.MCMCCellEditField.Limits = [0 Inf];
            app.MCMCCellEditField.Position = [90 115 90 22];

            % Create RunAllButton
            app.RunAllButton = uibutton(app.MCMCTempPanel, 'push');
            app.RunAllButton.ButtonPushedFcn = createCallbackFcn(app, @RunAllButtonPushed, true);
            app.RunAllButton.FontName = 'Arial';
            app.RunAllButton.FontSize = 16;
            app.RunAllButton.Position = [293 11 100 26];
            app.RunAllButton.Text = 'Run All';

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

            % Create VideoMask
            app.VideoMask = uitab(app.TabGroup);
            app.VideoMask.AutoResizeChildren = 'off';

            % Create Tab_3
            app.Tab_3 = uitab(app.TabGroup);
            app.Tab_3.AutoResizeChildren = 'off';

            % Create Tab_2
            app.Tab_2 = uitab(app.TabGroup);
            app.Tab_2.AutoResizeChildren = 'off';

            % Create ROISelectionPanel
            app.ROISelectionPanel = uipanel(app.UIFigure);
            app.ROISelectionPanel.TitlePosition = 'centertop';
            app.ROISelectionPanel.Title = 'ROI Selection';
            app.ROISelectionPanel.FontName = 'Arial';
            app.ROISelectionPanel.FontWeight = 'bold';
            app.ROISelectionPanel.FontSize = 18;
            app.ROISelectionPanel.Position = [1430 15 375 320];

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
            app.SelectedCell.Position = [80 260 270 22];
            app.SelectedCell.Value = 1;

            % Create SaveButton
            app.SaveButton = uibutton(app.ROISelectionPanel, 'push');
            app.SaveButton.ButtonPushedFcn = createCallbackFcn(app, @SaveButtonPushed, true);
            app.SaveButton.Position = [133 149 100 22];
            app.SaveButton.Text = 'Save';

            % Create AutosaveOnCloseCheckBox
            app.AutosaveOnCloseCheckBox = uicheckbox(app.ROISelectionPanel);
            app.AutosaveOnCloseCheckBox.ValueChangedFcn = createCallbackFcn(app, @AutosaveOnCloseCheckBoxValueChanged, true);
            app.AutosaveOnCloseCheckBox.Text = 'Autosave On Close';
            app.AutosaveOnCloseCheckBox.Position = [143 185 125 22];

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.UIFigure);
            app.TabGroup2.Position = [1430 350 375 437];

            % Create SelectedROIDetails
            app.SelectedROIDetails = uitab(app.TabGroup2);
            app.SelectedROIDetails.Title = 'ROI';

            % Create CellProbabilityEditFieldLabel
            app.CellProbabilityEditFieldLabel = uilabel(app.SelectedROIDetails);
            app.CellProbabilityEditFieldLabel.HorizontalAlignment = 'right';
            app.CellProbabilityEditFieldLabel.FontName = 'Arial';
            app.CellProbabilityEditFieldLabel.FontSize = 14;
            app.CellProbabilityEditFieldLabel.Position = [8 64 99 22];
            app.CellProbabilityEditFieldLabel.Text = 'Cell Probability';

            % Create SNREditFieldLabel
            app.SNREditFieldLabel = uilabel(app.SelectedROIDetails);
            app.SNREditFieldLabel.HorizontalAlignment = 'right';
            app.SNREditFieldLabel.FontName = 'Arial';
            app.SNREditFieldLabel.FontSize = 14;
            app.SNREditFieldLabel.Position = [8 214 35 22];
            app.SNREditFieldLabel.Text = 'SNR';

            % Create SNREditField
            app.SNREditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.SNREditField.Limits = [0 Inf];
            app.SNREditField.Editable = 'off';
            app.SNREditField.FontName = 'Arial';
            app.SNREditField.FontSize = 14;
            app.SNREditField.Position = [114 214 70 22];

            % Create CellProbabilityEditField
            app.CellProbabilityEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.CellProbabilityEditField.Editable = 'off';
            app.CellProbabilityEditField.FontName = 'Arial';
            app.CellProbabilityEditField.FontSize = 14;
            app.CellProbabilityEditField.Position = [114 64 70 22];

            % Create RadiusEditField
            app.RadiusEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.RadiusEditField.Limits = [0 Inf];
            app.RadiusEditField.Editable = 'off';
            app.RadiusEditField.FontName = 'Arial';
            app.RadiusEditField.FontSize = 14;
            app.RadiusEditField.Position = [114 184 70 22];

            % Create RadiusEditFieldLabel
            app.RadiusEditFieldLabel = uilabel(app.SelectedROIDetails);
            app.RadiusEditFieldLabel.HorizontalAlignment = 'right';
            app.RadiusEditFieldLabel.FontName = 'Arial';
            app.RadiusEditFieldLabel.FontSize = 14;
            app.RadiusEditFieldLabel.Position = [8 184 49 22];
            app.RadiusEditFieldLabel.Text = 'Radius';

            % Create SolidityEditField
            app.SolidityEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.SolidityEditField.Limits = [0 Inf];
            app.SolidityEditField.Editable = 'off';
            app.SolidityEditField.FontName = 'Arial';
            app.SolidityEditField.FontSize = 14;
            app.SolidityEditField.Position = [114 154 70 22];

            % Create SolidityLabel
            app.SolidityLabel = uilabel(app.SelectedROIDetails);
            app.SolidityLabel.HorizontalAlignment = 'right';
            app.SolidityLabel.FontName = 'Arial';
            app.SolidityLabel.FontSize = 14;
            app.SolidityLabel.Position = [8 154 51 22];
            app.SolidityLabel.Text = 'Solidity';

            % Create FootprintEditField
            app.FootprintEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.FootprintEditField.Limits = [0 Inf];
            app.FootprintEditField.Editable = 'off';
            app.FootprintEditField.FontName = 'Arial';
            app.FootprintEditField.FontSize = 14;
            app.FootprintEditField.Position = [114 124 70 22];

            % Create FootprintEditFieldLabel
            app.FootprintEditFieldLabel = uilabel(app.SelectedROIDetails);
            app.FootprintEditFieldLabel.HorizontalAlignment = 'right';
            app.FootprintEditFieldLabel.FontName = 'Arial';
            app.FootprintEditFieldLabel.FontSize = 14;
            app.FootprintEditFieldLabel.Position = [8 124 61 22];
            app.FootprintEditFieldLabel.Text = 'Footprint';

            % Create CompactnessEditField
            app.CompactnessEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.CompactnessEditField.Limits = [0 Inf];
            app.CompactnessEditField.Editable = 'off';
            app.CompactnessEditField.FontName = 'Arial';
            app.CompactnessEditField.FontSize = 14;
            app.CompactnessEditField.Position = [114 94 70 22];

            % Create CompactnessEditFieldLabel
            app.CompactnessEditFieldLabel = uilabel(app.SelectedROIDetails);
            app.CompactnessEditFieldLabel.HorizontalAlignment = 'right';
            app.CompactnessEditFieldLabel.FontName = 'Arial';
            app.CompactnessEditFieldLabel.FontSize = 14;
            app.CompactnessEditFieldLabel.Position = [8 94 91 22];
            app.CompactnessEditFieldLabel.Text = 'Compactness';

            % Create SomaPixelsEditFieldLabel
            app.SomaPixelsEditFieldLabel = uilabel(app.SelectedROIDetails);
            app.SomaPixelsEditFieldLabel.HorizontalAlignment = 'right';
            app.SomaPixelsEditFieldLabel.FontName = 'Arial';
            app.SomaPixelsEditFieldLabel.FontSize = 14;
            app.SomaPixelsEditFieldLabel.Position = [200 118 83 22];
            app.SomaPixelsEditFieldLabel.Text = 'Soma Pixels';

            % Create SkewEditField
            app.SkewEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.SkewEditField.Editable = 'off';
            app.SkewEditField.FontName = 'Arial';
            app.SkewEditField.FontSize = 14;
            app.SkewEditField.Position = [290 209 70 22];

            % Create TotalPixelsEditFieldLabel
            app.TotalPixelsEditFieldLabel = uilabel(app.SelectedROIDetails);
            app.TotalPixelsEditFieldLabel.HorizontalAlignment = 'right';
            app.TotalPixelsEditFieldLabel.FontName = 'Arial';
            app.TotalPixelsEditFieldLabel.FontSize = 14;
            app.TotalPixelsEditFieldLabel.Position = [200 148 76 22];
            app.TotalPixelsEditFieldLabel.Text = 'Total Pixels';

            % Create AspectEditField
            app.AspectEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.AspectEditField.Editable = 'off';
            app.AspectEditField.FontName = 'Arial';
            app.AspectEditField.FontSize = 14;
            app.AspectEditField.Position = [290 179 70 22];

            % Create AspectEditField_2Label
            app.AspectEditField_2Label = uilabel(app.SelectedROIDetails);
            app.AspectEditField_2Label.HorizontalAlignment = 'right';
            app.AspectEditField_2Label.FontName = 'Arial';
            app.AspectEditField_2Label.FontSize = 14;
            app.AspectEditField_2Label.Position = [200 178 48 22];
            app.AspectEditField_2Label.Text = 'Aspect';

            % Create TotalPixelsEditField
            app.TotalPixelsEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.TotalPixelsEditField.Editable = 'off';
            app.TotalPixelsEditField.FontName = 'Arial';
            app.TotalPixelsEditField.FontSize = 14;
            app.TotalPixelsEditField.Position = [290 149 70 22];

            % Create SkewEditField_2Label
            app.SkewEditField_2Label = uilabel(app.SelectedROIDetails);
            app.SkewEditField_2Label.HorizontalAlignment = 'right';
            app.SkewEditField_2Label.FontName = 'Arial';
            app.SkewEditField_2Label.FontSize = 14;
            app.SkewEditField_2Label.Position = [200 208 40 22];
            app.SkewEditField_2Label.Text = 'Skew';

            % Create SomaPixelsEditField
            app.SomaPixelsEditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.SomaPixelsEditField.Editable = 'off';
            app.SomaPixelsEditField.FontName = 'Arial';
            app.SomaPixelsEditField.FontSize = 14;
            app.SomaPixelsEditField.Position = [290 119 70 22];

            % Create Switch
            app.Switch = uiswitch(app.SelectedROIDetails, 'slider');
            app.Switch.Items = {'Drop', 'Neuron'};
            app.Switch.ValueChangedFcn = createCallbackFcn(app, @SwitchValueChanged, true);
            app.Switch.FontName = 'Arial';
            app.Switch.FontSize = 14;
            app.Switch.Position = [260 30 45 20];
            app.Switch.Value = 'Neuron';

            % Create NormSoma_EditLabel
            app.NormSoma_EditLabel = uilabel(app.SelectedROIDetails);
            app.NormSoma_EditLabel.HorizontalAlignment = 'right';
            app.NormSoma_EditLabel.FontName = 'Arial';
            app.NormSoma_EditLabel.FontSize = 14;
            app.NormSoma_EditLabel.Position = [203 64 84 22];
            app.NormSoma_EditLabel.Text = 'Norm. Soma';

            % Create NormTotal_EditLabel
            app.NormTotal_EditLabel = uilabel(app.SelectedROIDetails);
            app.NormTotal_EditLabel.HorizontalAlignment = 'right';
            app.NormTotal_EditLabel.FontName = 'Arial';
            app.NormTotal_EditLabel.FontSize = 14;
            app.NormTotal_EditLabel.Position = [207 94 73 22];
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
            app.SNRS2P_EditLabel.Position = [32 40 75 22];
            app.SNRS2P_EditLabel.Text = 'SNR (S2P)';

            % Create SNRS2P_EditField
            app.SNRS2P_EditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.SNRS2P_EditField.Editable = 'off';
            app.SNRS2P_EditField.FontName = 'Arial';
            app.SNRS2P_EditField.FontSize = 14;
            app.SNRS2P_EditField.Position = [114 40 70 22];

            % Create NoiseStd_EditLabel
            app.NoiseStd_EditLabel = uilabel(app.SelectedROIDetails);
            app.NoiseStd_EditLabel.HorizontalAlignment = 'right';
            app.NoiseStd_EditLabel.FontName = 'Arial';
            app.NoiseStd_EditLabel.FontSize = 14;
            app.NoiseStd_EditLabel.Position = [31 13 76 22];
            app.NoiseStd_EditLabel.Text = 'Noise (Std)';

            % Create NoiseStd_EditField
            app.NoiseStd_EditField = uieditfield(app.SelectedROIDetails, 'numeric');
            app.NoiseStd_EditField.Editable = 'off';
            app.NoiseStd_EditField.FontName = 'Arial';
            app.NoiseStd_EditField.FontSize = 14;
            app.NoiseStd_EditField.Position = [114 13 70 22];

            % Create UIAxes
            app.UIAxes = uiaxes(app.SelectedROIDetails);
            title(app.UIAxes, 'Close-Up')
            app.UIAxes.FontName = 'Arial';
            app.UIAxes.FontWeight = 'bold';
            app.UIAxes.XTick = [];
            app.UIAxes.YTick = [];
            app.UIAxes.FontSize = 14;
            app.UIAxes.Box = 'on';
            app.UIAxes.Position = [15 238 152 152];

            % Create Neuropil_Close
            app.Neuropil_Close = uiaxes(app.SelectedROIDetails);
            title(app.Neuropil_Close, 'Neuropil')
            app.Neuropil_Close.FontName = 'Arial';
            app.Neuropil_Close.FontWeight = 'bold';
            app.Neuropil_Close.XTick = [];
            app.Neuropil_Close.YTick = [];
            app.Neuropil_Close.FontSize = 14;
            app.Neuropil_Close.Box = 'on';
            app.Neuropil_Close.Position = [200 238 152 152];

            % Create Tab
            app.Tab = uitab(app.TabGroup2);

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