classdef CabTracker < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                  matlab.ui.Figure
        PasswordEditField         matlab.ui.control.EditField
        PasswordEditFieldLabel    matlab.ui.control.Label
        UsernameEditField         matlab.ui.control.EditField
        UsernameEditFieldLabel    matlab.ui.control.Label
        LoginasSwitch             matlab.ui.control.Switch
        LoginasSwitchLabel        matlab.ui.control.Label
        LoginButton               matlab.ui.control.Button
        WelcometoCabTrackerLabel  matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: LoginButton
        function LoginButtonPushed(app, event)
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create WelcometoCabTrackerLabel
            app.WelcometoCabTrackerLabel = uilabel(app.UIFigure);
            app.WelcometoCabTrackerLabel.Position = [247 374 144 46];
            app.WelcometoCabTrackerLabel.Text = 'Welcome to <CabTracker>';

            % Create LoginButton
            app.LoginButton = uibutton(app.UIFigure, 'push');
            app.LoginButton.ButtonPushedFcn = createCallbackFcn(app, @LoginButtonPushed, true);
            app.LoginButton.Position = [271 128 100 23];
            app.LoginButton.Text = 'Login';

            % Create LoginasSwitchLabel
            app.LoginasSwitchLabel = uilabel(app.UIFigure);
            app.LoginasSwitchLabel.HorizontalAlignment = 'center';
            app.LoginasSwitchLabel.Position = [296 319 50 22];
            app.LoginasSwitchLabel.Text = 'Login as';

            % Create LoginasSwitch
            app.LoginasSwitch = uiswitch(app.UIFigure, 'slider');
            app.LoginasSwitch.Items = {'MathWorker', 'Cab Driver'};
            app.LoginasSwitch.Position = [302 286 45 20];
            app.LoginasSwitch.Value = 'MathWorker';

            % Create UsernameEditFieldLabel
            app.UsernameEditFieldLabel = uilabel(app.UIFigure);
            app.UsernameEditFieldLabel.HorizontalAlignment = 'right';
            app.UsernameEditFieldLabel.Position = [214 221 60 22];
            app.UsernameEditFieldLabel.Text = 'Username';

            % Create UsernameEditField
            app.UsernameEditField = uieditfield(app.UIFigure, 'text');
            app.UsernameEditField.Position = [289 221 134 21];

            % Create PasswordEditFieldLabel
            app.PasswordEditFieldLabel = uilabel(app.UIFigure);
            app.PasswordEditFieldLabel.HorizontalAlignment = 'right';
            app.PasswordEditFieldLabel.Position = [215 179 58 22];
            app.PasswordEditFieldLabel.Text = 'Password';

            % Create PasswordEditField
            app.PasswordEditField = uieditfield(app.UIFigure, 'text');
            app.PasswordEditField.Position = [288 179 134 21];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = CabTracker

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

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