%Post Processing
data = readmatrix('Nissan Leaf Motor Characteristics.csv');
Motor_Speed1=data(:,1);
Motor_Torque1=data(:,2);     %Peak_Torque
Motor_ContTorque=data(:,3);  %Continous_Torque

%Operating Points
scatter(out.Motor_Speed.Data,abs(out.Motor_Regen_Torque.Data))
xlabel('Motor Speed (RPM)')
ylabel('Regen Torque (Nm)')
title('Regen Torque vs Motor Speed (No Control Logic)')
hold on
plot(Motor_Speed1,Motor_Torque1)
text(1000,max(Motor_Torque1),'Motor Peak Torque')
plot(Motor_Speed1,Motor_ContTorque)
text(1000,max(Motor_ContTorque),'Motor Continous Torque')

figure
scatter(out.Motor_Speed_with_Cntrl_Logic.Data,abs(out.Motor_Torque_with_Cntrl_Logic.Data))
xlabel('Motor Speed (RPM)')
ylabel('Regen Torque (Nm)')
title('Regen Torque vs Motor Speed (With Control Logic)')
hold on 
plot(Motor_Speed1,Motor_Torque1)
text(1000,max(Motor_Torque1),'Motor Peak Torque')
plot(Motor_Speed1,Motor_ContTorque)
text(1000,max(Motor_ContTorque),'Motor Continous Torque')


%f we change gear ratio, operating points will change drastically.
%Wheel to Well Analysis
figure
bar(categorical({'Wheel','Trans','Motor','MC','Battery'}, ...
    {'Wheel','Trans','Motor','MC','Battery'}), ...
    [abs(out.Wheel_Regen_Energy.Data(end)), ...
     abs(out.Trans_Regen_Energy_.Data(end)), ...
     abs(out.Motor_Regen_Energy.Data(end)), ...
     abs(out.MC_R_Energy.Data(end)), ...
     abs(out.Batt_Regen_Energy.Data(end))])
xlabel('System')
ylabel('Regen Energy Wh')
title('Wheel to Well(Regen)')

