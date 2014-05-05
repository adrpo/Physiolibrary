﻿# Physiolibrary  

Physiolibrary ( http://www.physiolibrary.org ) is a free open-source Modelica library designed for modeling human physiology. 
This library contains basic physical laws governing human physiology, usable for cardiovascular circulation,
metabolic processes, nutrient distribution, thermoregulation, gases transport, electrolyte regulation, 
water distribution, hormonal regulation and pharmacological regulation.

## Library description

The origin of this Modelica Physiolibrary was in the first version of our HumMod Golem Edition model implementation,
where it was called HumMod.Library. As the successors of Guyton's Medical Physiology School write, 
the original HumMod model is “The best, most complete, mathematical model of human phys-iology ever created” ( http://hummod.org ).

We are also developing many types of smaller physiological models for use in medical education, 
so it was essential to separate this library from our HumMod Modelica implementation. This separation improves 
the quality of the next HumMod release and provides a useful Modelica library to modelers in this bioscience.
The library contains only carefully-chosen elementary physiological laws, which are the basis of more complex physiological
processes. For example from only two type of blocks (Chemical.ChemicalReaction and Chemical.Substance) it is 
possible to compose the allosteric transitions or the Michaelis-Menten equation.

Library contains also the icons for higher level (HumMod) subsystem implementations:

![screenshot](screenshot.png)

## Installation
Download and unzip. 
* install to Dymola: please call "Physiolibrary\Resources\Install\Dymola\install.bat"  

## Current release

Download [Physiolibrary 2.1.1 (2014-05-02)](../../archive/v2.1.1.zip)

#### Release notes

*  [Version v2.1.1 (2014-05-02)](../../archive/v2.1.1.zip)
 * New compoment: HydraulicComponents.IdealValve for modeling aortic, pulmonary, triscupid and mitral valve
 * New types: pH, VolumeDensityOfCharge
 * New examples: Osmotic.Examples.CelebrospinalFluid, Hydraulic.Examples.Windkessel and Hydraulic.Example.MinimalCirculation
 * Fix: role of hydraulic pressure in Osmotic.Components.Membrane

*  [Version v2.1.0 (2014-02-28)](../../archive/v2.1.0.zip)
 * Upgrade to MSL 3.2.1 (still compatible with MSL 3.2)
 * New: constants HydraulicResistanceConst, HydraulicElastanceConst and HydraulicElastanceToComplianceConst and type HydraulicElastance
 * New: steady state component ElectricChargeConservationLaw
 * New: display units for hydraulic resistance/conductance/compliance/elastance, for gas solubility 
 * Rename:  HydraulicResistanceConst to HydraulicResistanceToConductanceConst
 * Fix: gas solution in liquid with corrected GasSolubility type
 * Fix: bidirectional stream flows
 * Fix: steady state example of dissolved oxygen 
 * Fix: installation batch file for Dymola in Windows
 * Fix: references in overview (user's guide)

*  [Version v2.0.2 (2014-01-26)](../../archive/v2.0.2.zip)
 * Support for steady states calculation by energy/mass conservation laws or enviroment sources
 * Conditional inputs for each domain blocks
 * Package States renamed to SteadyStates, added SteadyStates.Components
 * Removed package Mixed
 * Package FileUtilities moved to Types.FileUtilities

*  [Version v1.2.0 (2014-01-15)](../../archive/v1.2.0.zip)
 * Package structure Physiolibrary.{domain}.[Examples|Components|Sources|Interfaces].{component}
 * New icons
 * Thermal: Relative heat energy to normal body temperature (37degC) 
 * New examples: 
	Guyton-Coleman-Granger cardiovascular model, 
	Coleman thermal energy transfers

*  [Version v1.1.0 (2013-12-30)](../../archive/v1.1.0.zip)
 * Heat connector compatibility between Physiolibrary.Thermal package and Modelica.Thermal.HeatTransfer package (MSL 3.2)
 * Some English language corrections
 * Hydrostatic pressure patch
 * New examples 
 
*  [Version v1.0.1 (2013-12-11)](../../archive/v1.0.1.zip)
 * The library uses the Modelica Standard Libary (MSL) version 3.2.
 * Contains nice physiological icons.
 * Support for physiological units: min,kcal,mmHg,ml,mEq,.. 
 * Base blocks for chemical, hydraulical, osmotic, thermal or mixed domains
 * Support of equilibrated systems
 * Support for expandable inputs/outputs/tests lists 

## License

This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [Modelica License 2](https://modelica.org/licenses/ModelicaLicense2).

## Development and contribution
Release manager: [Marek Matejak](http://www.physiome.cz)
Contributor: [Tomas Kulhanek] (https://github.com/TomasKulhanek)

Do you want to contribute?
It is easy. Make a fork in your GitHub account, do your commit and do the pull request. The project is now open for new contributors.

You may report bugs or issues to [project issues](https://github.com/MarekMatejak/Physiolibrary/issues) or to e-mail: marek\<at\>matfyz\<dot\>cz



