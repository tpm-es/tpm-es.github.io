$
    Delta P
    &= ( rho V^2 ) / 2 dot integral_L c(l) dif l \
    &= ( rho V^2 ) / 2 dot (C_"duct" + sum_"elem" C_"elem") \
    &= P_v dot (L f_D / D + sum_"elem" C_"elem") \
    &= L (f_D V_p) / D + P_v sum_"elem" C_"elem" \
    &= L (dif P) / (dif L) + P_v sum_"elem" C_"elem"
$

#let flowVelocity(volume_flow, crosssection_area) = {
    return volume_flow / crosssection_area;
}

#let dynamicPressure(flow_velocity, fluid_density) = {
    return 0.5 * flow_velocity * flow_velocity * fluid_density;
}

#let reynoldsNumber(flow_velocity, characteristic_diameter, kinematic_viscocity) = {
    return flow_velocity * characteristic_diameter / kinematic_viscocity;
}

#let relativeRoughness(absolute_roughness, characteristic_diameter) = {
    return absolute_roughness / characteristic_diameter;
}

#let frictionFactor(reynolds_number, relative_roughness) = {
    let theta_1 = calc.pow(-2.457 * calc.log(calc.pow(7.0 / reynolds_number, 0.9) + 0.27 * relative_roughness), 16);
    let theta_2 = calc.pow(37530 / reynolds_number, 16);
    return 8.0 * calc.pow(calc.pow(8.0 / reynolds_number, 12) + calc.pow(theta_1 + theta_2, -1.5), 1 / 12);
}

#let pressureGradient(dynamic_pressure, friction_factor, characteristic_diameter) = {
    return dynamic_pressure * friction_factor / characteristic_diameter;
}

#let pressureDrop(effective_length, pressure_gradient) = {
    return effective_length * pressure_gradient;
}

#let lossCoefficient(effective_length, friction_factor, characteristic_diameter) = {
    return effective_length * friction_factor / characteristic_diameter;
}

#let effectiveLength(loss_coefficient, friction_factor, characteristic_diameter) = {
    return loss_coefficient * characteristic_diameter / friction_factor;
}


#(reynoldsNumber(120 / 3600 / (0.25*0.1*0.1*calc.pi), 0.1, 0.000015))