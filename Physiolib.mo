﻿within ;
package Physiolib "Library of Physiological componentsl models (version 1.0.0)"
  package UsersGuide "User's Guide"
    extends Modelica.Icons.Information;

  class Overview "Overview"
    extends Modelica.Icons.Information;

   annotation (Documentation(info="<html>
<p>The Physiolib can describe the following phenomena.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><h4>Chemical Components</h4></td>
<td><h4>Description</h4></td>
</tr>
<tr>
<td valign=\"top\"><p align=\"center\"><img src=\"modelica://Physiolib/Resources/Images/UsersGuide/Solution1.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolib.Components.Solution\">Chemical solution</a></p><p>The solution is the base component of each model, because it defines the conditions of the electro-chemical processes. It integrates the total amount of substance (called amount of solution), heat, charge, entropy, volume and others from each substances to present the base properties such as temperature, pressure, electric potential and others. The usage is very simple - just connect each chemical substance with its chemical solution using their <a href=\"modelica://Physiolib.Interfaces.SolutionPort\">SolutionPort</a>.</p></td>
</tr>
<tr>
<td valign=\"top\"><p align=\"center\"><img src=\"modelica://Physiolib/Resources/Images/UsersGuide/Substance1.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolib.Components.Substance\">Chemical substance</a></p><p>The chemical substance integrates the amount of the chemical substance and from the properties of the connected solution it presents the electro-chemical potential of the substance using the <a href=\"modelica://Physiolib.Interfaces.SubstancePort\">SubstancePort</a>.</p><p>There are two basic <a href=\"modelica://Physiolib.Interfaces.StateOfMatter\">states of matter</a>: <a href=\"modelica://Physiolib.Interfaces.IdealGas\">ideal gas</a> and <a href=\"modelica://Physiolib.Interfaces.Incompressible\">incompressible</a> substance. However, the user can easily (re)define their own state of matter by inserting the correct expressions for the pure substance <a href=\"modelica://Physiolib.Interfaces.StateOfMatter.activityCoefficient\">activity coefficient</a>, <a href=\"modelica://Physiolib.Interfaces.StateOfMatter.molarVolumePure\">molar volume</a>, <a href=\"modelica://Physiolib.Interfaces.StateOfMatter.molarEntropyPure\">molar entropy</a> and <a href=\"modelica://Physiolib.Interfaces.StateOfMatter.molarEnthalpyElectroneutral\">molar enthalpy</a>, based on the current solution state (temperature, pressure, electric potential and ionic strength) and the <a href=\"modelica://Physiolib.Interfaces.StateOfMatter.SubstanceData\">substance data</a>. The object-oriented design allows users to define the substance data record as part of the state of matter package. Users can select substance parameters according to the state of matter, redefining the getter functions of substance properties.</p><p>The examples work with ideal gases in case of all gaseous substance and incompressible state of matter in case of liquid or solid. The definition data are the molar mass of the substance, the number of charges of the substance, the molar heat capacity of the substance at a constant pressure, free formation enthalpy, free formation Gibbs energy and density (if incompressible) &mdash; all at a temperature of 25&deg;C and pressure 1 bar. Since these parameters are usually recorded in chemical tables at this standard conditions. In this manner, more than 35 real chemical <a href=\"modelica://Physiolib.Examples.Substances\">substances</a> in the example package of this chemical library have already been defined. The usage of these predefined substances&rsquo; data is very simple. In the parameter dialog of the chemical substance, the correct record with this data can be selected, as shown in Figure 1.</p><p>This setting is typically the most important setting of each chemical model. All equilibrium coefficients, standard voltages, dissolution coefficients, saturated vapor pressures and so on, are automatically solved using these substance data. As a result, for example, the chemical reaction component only needs to define the stoichiometry coefficients, and the connected substances reach equilibrium at the correct equilibrium coefficient.</p></td>
</tr>
<tr>
<td valign=\"top\"><p align=\"center\"><img src=\"modelica://Physiolib/Resources/Images/UsersGuide/Reaction1.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolib.Components.Reaction\">Chemical reaction</a></p><p>The chemical reaction component is very general. The dissociation constant of the equilibrium is calculated from substance properties at usual in thermodynamics, for example as definition of <a href=\"http://goldbook.iupac.org/S05915.html\">UIPAC</a>. For example if we want to define <a href=\"modelica://Physiolib.Examples.SimpleReaction\">simple reaction A&lt;-&gt;B</a> with dissociation constant [B]/[A]=2 then it must be the difference between Gibbs energies of formation equal to B.DfG - A.DfG = - R * T * ln(2). Without lost of generality it is possible to select some substances as reference and give them the zero Gibbs energy of formation. The next substances created by some chemical process can be expressed from them such as example of <a href=\"modelica://Physiolib.Examples.Hemoglobin.Allosteric_Hemoglobin_MWC\">alosteric hemoglobin</a> calculation. The kinetics of the chemical reaction is different as usual. However the most of processes can be recalculated with sufficient precision, for example the <a href=\"Physiolib.Examples.MichaelisMenten\">Michaelic-Menton</a> can be recalculated with precision of 1.5% of maximal rate. </p></td>
</tr>
<tr>
<td valign=\"top\"><p align=\"center\"><img src=\"modelica://Physiolib/Resources/Images/UsersGuide/Diffusion1.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolib.Components.Diffusion\">Diffusion</a></p><p>Diffusion is a dynamic chemical process, wich is also equilibrating of electro-chemical potential of the substance. Analogically as in chemical reaction the speed of diffucion can be calculated as coefficient C multiplied by electro-chemical gratient. C can be a parammeter or input expressed from distance, substance and solution properties. </p></td>
</tr>
<tr>
<td valign=\"top\"><p align=\"center\"><img src=\"modelica://Physiolib/Resources/Images/UsersGuide/GasSolubility1.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolib.Components.GasSolubility\">Henry&apos;s law, Raoult&apos;s law or Sieverts&apos; law</a></p><p>Surprisingly, all these laws has the same basis = equilibrium of electro-chemical potential. The most of problems in data is caused by wrong selection of standard state as 1 mol/kg or 1 mol/L. Please avoid these assumptions of these totally confused states and use only mole fractions instead of each molality or molarity - the world will be much better (I promise). </p></td>
</tr>
<tr>
<td valign=\"top\"><p align=\"center\"><img src=\"modelica://Physiolib/Resources/Images/UsersGuide/Membrane1.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolib.Components.Membrane\">Semipermeable membrane</a></p><p>The same as before - just equilibrating the electro-chemical potentials. A result is the Donnan&apos;s equilibrium, Nernst potentials of the ions and the membrane electric potential. Transporting water through membrane is reaching the osmotic equilibrium (The real one, not the simplified one defined by osmotic pressure lineary dependent on impermeable substance concentration). </p></td>
</tr>
<tr>
<td valign=\"top\"><p align=\"center\"><img src=\"modelica://Physiolib/Resources/Images/UsersGuide/Speciation1.png\"/></p></td>
<td valign=\"middle\"><p><a href=\"modelica://Physiolib.Components.Speciation\">Chemical speciation</a></p><p>The chemical speciation is for macromolecule composed with independent subunits is specific conformations. For example the hemoglobin is tetramer, which can be in two conformation: relaxed and tensed. In each of this conformation it has different afinities (different dissociation constant) for binding oxygen in each of four independent subunits. This alosteric effect can be modeled using speciation such as in <a href=\"modelica://Physiolib.Examples.Hemoglobin.Allosteric_Hemoglobin2_MWC\">Allosteric_Hemoglobin2_MWC</a>. However the result should be the same as using the detailed reaction model <a href=\"modelica://Physiolib.Examples.Hemoglobin.Allosteric_Hemoglobin_MWC\">Allosteric_Hemoglobin_MWC</a>.</p></td>
</tr>
</table>
</html>"));
  end Overview;

  class Connectors "Connectors"
    extends Modelica.Icons.Information;

   annotation (Documentation(info="<html>
<p>The Physiolib defines the two important <b>elementary connectors</b> for substance and for solution:</p>
<table cellspacing=\"0\" cellpadding=\"1\" border=\"1\"><tr>
<td valign=\"top\"></td>
<td valign=\"top\"><h4>potential</h4><p>variables</p></td>
<td valign=\"top\"><h4>flow</h4><p>variables</p></td>
<td valign=\"top\"><h4>stream</h4><p>variables</p></td>
<td valign=\"top\"><h4>connector definition</h4></td>
<td valign=\"top\"><h4>icons</h4></td>
</tr>
<tr>
<td valign=\"middle\"><h4>substance</h4></td>
<td valign=\"middle\"><p>u .. electro-chemical potential of the chemical substance</p></td>
<td valign=\"middle\"><p>q .. molar flow of the chemical substance</p></td>
<td valign=\"middle\"></td>
<td valign=\"middle\"><p><br><a href=\"Physiolib.Interfaces.SubstancePort\">Physiolib.Interfaces.SubstancePort</a> </p></td>
<td valign=\"middle\"><p><img src=\"modelica://Physiolib/Resources/Images/UsersGuide/ChemicalPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"middle\"><h4>solution</h4></td>
<td valign=\"middle\"><p>p .. pressure of the solution</p><p>T .. temperature of the solution</p><p>v .. electric potential of the solution</p><p><br>n .. amount of all substances in the solution</p><p>m .. mass of the solution</p><p>V .. volume of the solution</p><p>G .. free Gibbs energy of the solution</p><p>Q .. electric charge of the solution</p><p>I .. ionic strength of the solution</p></td>
<td valign=\"middle\"><p>dV .. change of the volume of the solution</p><p>dH .. enthalpy change of the solution</p><p>i .. electric charge change of the solution</p><p><br><i>nj ..  amount of the substance</i></p><p><i>mj .. mass of the substance</i></p><p><i>Vj .. volume of the substance</i></p><p><i>Gj .. free Gibbs energy of the substance</i></p><p><i>Qj .. electric charge of the substance</i></p><p><i>Ij .. ionic strength of the substance</i></p></td>
<td valign=\"middle\"></td>
<td valign=\"middle\"><p><br><a href=\"Physiolib.Interfaces.SolutionPort\">Physiolib.Interfaces.SolutionPort</a></p></td>
<td valign=\"middle\"><p align=\"center\"><img src=\"modelica://Physiolib/Resources/Images/UsersGuide/SolutionPort.png\"/></p></td>
</tr>
</table>
</html>"));
  end Connectors;

  package ReleaseNotes "Release notes"
    extends Modelica.Icons.ReleaseNotes;

  class Version_1_0 "Version 1.0.0 (Oct. 21, 2017)"
    extends Modelica.Icons.ReleaseNotes;

  annotation (Documentation(info="<html>
<ul>
<li>Physiolib is new version of Chemical library https://github.com/MarekMatejak/Chemical and Physiolib https://github.com/MarekMatejak/Physiolib </li>
<li><font style=\"color: #333333; \">Components for solution, substance, chemical reaction, diffusion, gas dissolution, semipermeable membranes, chemical speciation of macromolecules, ..</font></li>
<li><font style=\"color: #333333; \">The library uses the Modelica Standard Libary (MSL) version 3.2.</font></li>
</ul>
</html>"));
  end Version_1_0;

   annotation (Documentation(info="<html>
<p>This section summarizes the changes that have been performed on the Physiolib. </p>
</html>"));

  end ReleaseNotes;

  class Contact "Contact"
    extends Modelica.Icons.Contact;

   annotation (Documentation(info="<html>
<p>Marek Matej&aacute;k</p>
<p>email: marek@matfy.cz</p>
<p>skype: marek.matejak</p>
<p>tel: +420 776 301 395</p>
</html>"));

  end Contact;

  class NewRelease "Publishing new release"
    extends Modelica.Icons.Information;

   annotation (Documentation(info="<html>
<p><br>New release must be numbered by Semantic Versioning 2.0.0, see <a href=\"http://semver.org/\">semver.org</a>. </p>
<p><br>If minor version, then the conversion script must be written and connected with package Physiolib using &quot;annotation(conversion(from(version=..)))&quot;! </p>
<p><br>To clean the code from dummy annotations try to use script <a href=\"https://github.com/dietmarw/trimtrailingwhitespaces\">ttws</a>. </p>
<p>To check english spelling try to use <a href=\"https://github.com/vlajos/misspell_fixer\">missspell_fixer</a>.</p>
<p><br>Update version number to &quot;X.Y.Z&quot;: </p>
<ul>
<li>At package Physiolib annotation: (version=&quot;X.Y.Z&quot;) together with &quot;versionBuild&quot;, &quot;versionDate&quot; and &quot;dateModified&quot; attribute </li>
<li>At file &quot;./Physiolib/libraryinfo.mos&quot; </li>
</ul>
<p><br>Update release notes: </p>
<ul>
<li>At UsersGuide.ReleaseNotes</li>
<li>At file &quot;./README.md&quot;, together with update of &quot;Current release&quot; section.</li>
</ul>
<p><br>Publish release in GitHub: </p>
<ul>
<li>Prepare release in &quot;master&quot; branch</li>
<li>Install, Check, Test, Test, Test.. </li>
<li>Draft a new <a href=\"https://github.com/impact/impact/blob/master/resources/docs/modelica2015/paper/impact.md#impact-on-library-developers\">release from &quot;master&quot;</a> branch with number &quot;vX.Y.Z&quot; and with release notes. </li>
</ul>
</html>"));
  end NewRelease;
  annotation (DocumentationClass=true, Documentation(info="<html>
<p>Package <b>Physiolib </b>is a modelica package for <b>Electro-Chemical processes </b>that is developed from <b>Physiolib</b> modelica implementation, see <a href=\"http://patf-biokyb.lf1.cuni.cz/wiki/hummod/hummod\">http://www.Physiolib.org</a>. It provides connectors and model components fitted for electro-chemical models. </p>
</html>"));
  end UsersGuide;
 extends Modelica.Icons.Package;

  package Chemical
    package Components "Chemical Components"
      model Solution "Chemical solution as homogenous mixture of the substances"
        extends Icons.Solution;

        extends Interfaces.PartialSolution(T(start=temperature_start),p(start=BasePressure));

        parameter Boolean useElectricPort = false "Is electric port pressent?"
        annotation(Evaluate=true, HideResult=true, choices(checkbox=true),Dialog(group="Conditional inputs"));

        parameter Boolean ElectricGround = true
        "Is the solution electric potential equal to zero during simulation (if not useElectricPort)?"
          annotation (HideResult=true, Dialog(enable=not useElectricPort));

        parameter Boolean useMechanicPorts = false "Are mechanic ports pressent?"
        annotation(Evaluate=true, HideResult=true, choices(checkbox=true),Dialog(group="Conditional inputs"));

        parameter Modelica.SIunits.Area SurfaceArea=0.01
        "Area for surfacePort to connect MultiBody components"
          annotation (HideResult=true, Dialog(enable=useMechanicPorts));

        parameter Boolean isPistonPositionAbsolute=false
        "Relavite position has zero at initial state without force"
          annotation (HideResult=true, Dialog(enable=useMechanicPorts));

        parameter Boolean useThermalPort = false "Is thermal port pressent?"
        annotation(Evaluate=true, HideResult=true, choices(checkbox=true),Dialog(group="Conditional inputs"));

        parameter Boolean ConstantTemperature = true
        "Has the solution constant temperature during simulation (if not useThermalPort)?"
           annotation (HideResult=true, Dialog(enable=not useThermalPort));

        parameter Modelica.SIunits.AbsolutePressure BasePressure=100000
        "Ambient pressure if useMechanicPort, start pressure or absolute pressure if ConstantPressure"
          annotation (HideResult=true);

        parameter Modelica.SIunits.Temperature temperature_start=298.15
        "Initial temperature of the solution"
           annotation (Dialog(group="Initialization"));

        Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T=T,Q_flow=heatFromEnvironment) if useThermalPort annotation (
            Placement(transformation(extent={{-70,-90},{-50,-70}}),iconTransformation(
                extent={{-62,-104},{-58,-100}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin electricPin(v=solution.v,i=solution.i) if useElectricPort annotation (Placement(
              transformation(extent={{-70,70},{-50,90}}),    iconTransformation(
                extent={{-62,98},{-58,102}})));
        Modelica.Mechanics.Translational.Interfaces.Flange_a surfaceFlange(f=f,s=top_s) if useMechanicPorts
        "The pressure of solution generate force on prescribed surface."
          annotation (Placement(transformation(extent={{-10,70},{10,90}}),
              iconTransformation(extent={{-2,98},{2,102}})));
        Modelica.Mechanics.Translational.Interfaces.Flange_b bottom(f=-f,s=top_s - ds) if useMechanicPorts
        "Fix of the cilinder on bottom."   annotation (Placement(transformation(
                extent={{-10,-90},{10,-70}}), iconTransformation(extent={{-2,-104},{2,
                  -100}})));

      protected
        parameter Modelica.SIunits.Position positionShift(fixed=false)
        "=0 absolute, otherwise negative";
         Modelica.SIunits.Position top_s,ds;
         Modelica.SIunits.Force f;

      initial equation
        T=temperature_start;
        positionShift= if
                         (isPistonPositionAbsolute) then 0 else volume/SurfaceArea;
        //s=volume/SurfaceArea - positionShift;
      equation

        //hydraulic
        ds = volume/SurfaceArea - positionShift;
        workFromEnvironment = -der(f*ds); //=der( (p-p0) * volume)
        solution.p = BasePressure - f/SurfaceArea;
        if not useMechanicPorts then
          f=0;
          top_s=ds; //equivalent for bottom_s==0
        end if;

        //electric
        if (not useElectricPort) and
                                    ElectricGround then
          //Solution connected to ground has zero voltage. However, electric current from the solution can varies.
            solution.v = 0;
        end if;
        if (not useElectricPort) and
                                   (not ElectricGround) then
          //Electrically isolated solution has not any electric current from/to the solution. However, electric potential can varies.
            solution.i = 0;
        end if;

        //thermal
        if (not useThermalPort) and ConstantTemperature then
          //Ideal thermal exchange between environment and solution to reach constant temperature
          der(T)=0;
        end if;
        if (not useThermalPort) and (not ConstantTemperature) then
          //Thermally isolated without any thermal exchange with environment
          heatFromEnvironment = 0;
        end if;

                                                                                                          annotation (
          Icon(coordinateSystem(
                preserveAspectRatio=false, initialScale=1, extent={{-100,-100},{
                100,100}}),
              graphics={Text(
                extent={{-90,92},{78,84}},
                lineColor={0,0,255},
                textString="%name",
                horizontalAlignment=TextAlignment.Left)}),
          Documentation(revisions="<html>
<p>2017-2018 by Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<h4>amountOfSolution = &sum; amountOfSubstances</h4>
<h4>mass = &sum; massOfSubstances</h4>
<h4>volume = &sum; volumeOfSubstances</h4>
<h4>freeGibbsEnergy = &sum; freeGibbsEnergiesOfSubstances</h4>
<p>To calculate the sum of extensive substance's properties is misused the Modelica \"flow\" prefix even there are not real physical flows. </p>
</html>"));
      end Solution;
      extends Modelica.Icons.Package;

      model Substance "Substance in solution"
        extends Icons.Substance;

        Modelica.SIunits.Concentration c "Molar concentration";

        extends Interfaces.PartialSubstanceInSolution;

        //If it is selected the amount of solution per one kilogram of solvent then the values of amountOfSubstance will be the same as molality
        //If it is selected the amount of solution in one liter of solution then the values of amountOfSubstance will be the same as molarity
        parameter Modelica.SIunits.AmountOfSubstance amountOfSubstance_start=1e-8
        "Initial amount of the substance in compartment"   annotation(HideResult=true);

      protected
        Modelica.SIunits.AmountOfSubstance amountOfSubstance(start=amountOfSubstance_start);
        Real log10n(stateSelect=StateSelect.prefer, start=log10(amountOfSubstance_start))
        "Decadic logarithm of the amount of the substance in solution";
        constant Real InvLog_10=1/log(10);

      initial equation

        amountOfSubstance=amountOfSubstance_start;

      equation

        //The main accumulation equation is "der(amountOfSubstance)=port_a.q"
        // However, the numerical solvers can handle it in form of log10n much better. :-)
        der(log10n)=(InvLog_10)*(port_a.q/amountOfSubstance);
        amountOfSubstance = 10^log10n;

        //Molar Concentration
        c = amountOfSubstance/solution.V;

        //Mole fraction is an analogy of molar concentration or molality.
        x = amountOfSubstance/solution.n;

        //solution flows
        solution.dH = molarEnthalpy*port_a.q + der(molarEnthalpy)*amountOfSubstance;
        solution.i = Modelica.Constants.F * z * port_a.q + Modelica.Constants.F*der(z)*amountOfSubstance;
        solution.dV = molarVolume * port_a.q + der(molarVolume)*amountOfSubstance;

        //extensive properties
        solution.nj=amountOfSubstance;
        solution.mj=amountOfSubstance*molarMass;
        solution.Vj=amountOfSubstance*molarVolume;
        solution.Gj=amountOfSubstance*port_a.u;
        solution.Qj=Modelica.Constants.F*amountOfSubstance*z;
        solution.Ij=(1/2) * ( amountOfSubstance * z^2);
        solution.otherPropertiesOfSubstance=amountOfSubstance * otherPropertiesPerSubstance;

                                                                                                          annotation (
          Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
              graphics={Text(
                extent={{-84,22},{92,64}},
                lineColor={0,0,255},
              textString="%name")}),
          Documentation(revisions="<html>
<p>2017-2018 by Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<h4>n = x &middot; n(solution) = &int; MolarFlow</h4>
<p>where n is amount of the substance and x is mole fraction.</p>
<p>The main class from &ldquo;Physiolib.Chemical&rdquo; package is called &quot;Substance&quot;. It has one chemical connector, where chemical potential and molar flow is presented. An amount of solute &quot;n&quot; is accumulated by molar flow inside an instance of this class. In the default setting the amount of solution &quot;n(solution)&quot; is set to 55.6 as amount of water in one liter, so in this setting the concentration of very diluted solution in pure water at &ldquo;mol/L&rdquo; has the same value as the amount of substance at &ldquo;mol&rdquo;. But in the advanced settings the default amount of solution can be changed by parameter or using solution port to connect with solution. The molar flow at the port can be also negative, which means that the solute leaves the Substance instance.&nbsp;</p>
<p><br>The recalculation between mole fraction, molarity and molality can be written as follows:</p>
<p>x = n/n(solution) = b * m(solvent)/n(solution) = c * V(solution)/n(solution)</p>
<p>where m(solvent) is mass of solvent, V(solution) is volume of solution, b=n/m(solvent) is molality of the substance, c=n/V(solution) is molarity of the substance.</p>
<p>If the amount of solution is selected to the number of total solution moles per one kilogram of solvent then the values of x will be the same as molality.</p>
<p>If the amount of solution is selected to the number of total solution moles in one liter of solution then the values of x will be the same as molarity.</p>
<p><br><br>Definition of electro-chemical potential:</p>
<h4>u = u&deg; + R*T*ln(gamma*x) + z*F*v</h4>
<h4>u&deg; = DfG = DfH - T * DfS</h4>
<p>where</p>
<p>x .. mole fraction of the substance in the solution</p>
<p>T .. temperature in Kelvins</p>
<p>v .. relative eletric potential of the solution</p>
<p>z .. elementary charge of the substance (like -1 for electron, +2 for Ca^2+)</p>
<p>R .. gas constant</p>
<p>F .. Faraday constant</p>
<p>gamma .. activity coefficient</p>
<p>u&deg; .. chemical potential of pure substance</p>
<p>DfG .. free Gibbs energy of formation of the substance</p>
<p>DfH .. free enthalpy of formation of the substance</p>
<p>DfS .. free entropy of formation of the substance </p>
<p><br>Be carefull, DfS is not the same as absolute entropy of the substance S&deg; from III. thermodinamic law! It must be calculated from tabulated value of DfG(298.15 K) and DfH as DfS=(DfH - DfG)/298.15. </p>
</html>"));
      end Substance;

      model Reaction "Chemical Reaction"

        parameter Integer nS=1 "Number of substrates types"
          annotation ( HideResult=true);

        parameter Modelica.SIunits.StoichiometricNumber s[nS]=ones(nS)
        "Stoichiometric reaction coefficient for substrates"
          annotation (HideResult=true);

        parameter Integer nP=1 "Number of products types"
          annotation ( HideResult=true);

        parameter Modelica.SIunits.StoichiometricNumber p[nP]=ones(nP)
        "Stoichiometric reaction coefficients for products"
          annotation (HideResult=true);

        Modelica.SIunits.MolarFlowRate rr(start=0) "Reaction molar flow rate";

        extends Interfaces.ConditionalKinetics;

      Interfaces.SubstancePorts_b substrates[nS] annotation (Placement(
            transformation(extent={{-110,-40},{-90,40}}), iconTransformation(
              extent={{-110,-40},{-90,40}})));
      Interfaces.SubstancePorts_b products[nP] annotation (Placement(
            transformation(extent={{90,-40},{110,40}}), iconTransformation(extent=
               {{90,-40},{110,40}})));

        parameter Real kE(unit="mol/J")=0 "Kinetic turnover coefficient";

      protected
        Modelica.SIunits.ChemicalPotential du;
      equation
        //the main equation
        du = ((p * products.u) - (s * substrates.u));
        rr = kC * du * exp(-kE*abs(du));

        //reaction molar rates
        rr*s = -substrates.q;
        rr*p = products.q;

        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}),   graphics={
              Rectangle(
                extent={{-100,-30},{100,30}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-100,-72},{100,-40}},
                lineColor={0,0,255},
              textString="%name"),
              Polygon(
                points={{-60,6},{-60,4},{54,4},{54,4},{18,14},{18,6},{-60,6}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{54,-8},{54,-6},{-60,-6},{-60,-6},{-24,-16},{-24,-8},{54,-8}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}),
          Documentation(revisions="<html>
<p><i>2017-2018 by </i>Marek Matejak, http://www.physiolib.com </p>
</html>",       info="<html>
<p><b>s<sub>1</sub>&middot;S<sub>1</sub> + .. + s<sub>nS</sub>&middot;S<sub>nS</sub> &lt;-&gt; p<sub>1</sub>&middot;P<sub>1</sub> + .. + p<sub>nP</sub>&middot;P<sub>nP</sub></b> </p>
<p>By redefinition of stoichometry as v<sub>i</sub> = -s<sub>i</sub>, A<sub>i</sub> = S<sub>i</sub> for i=1..nS v<sub>i</sub> = p<sub>i-nS</sub>, A<sub>i</sub> = P<sub>i-nS</sub> for i=nS+1..nS+nP </p>
<p>So the reaction can be written also as 0 = &sum; (v<sub>i</sub> &middot; A<sub>i</sub>) </p>
<h4><span style=\"color:#008000\">Equilibrium equation</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>K = <a href=\"modelica://ModelicaReference.Operators.'product()'\">product</a>(a(S)<a href=\"ModelicaReference.Operators.ElementaryOperators\">.^</a>s) / <a href=\"modelica://ModelicaReference.Operators.'product()'\">product</a>( a(P)<a href=\"ModelicaReference.Operators.ElementaryOperators\">.^</a>s ) = <a href=\"modelica://ModelicaReference.Operators.'product()'\">product</a>(a(A)<a href=\"ModelicaReference.Operators.ElementaryOperators\">.^</a>v)&nbsp;</p></td>
<td><p>dissociation constant</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>r</sub>G = &sum; (v<sub>i</sub> &middot; &Delta;<sub>f</sub>G<sub>i</sub>) = &Delta;<sub>r</sub>H - T&middot;&Delta;<sub>r</sub>S = -R&middot;T&middot;<a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(K) </p></td>
<td><p>molar Gibb&apos;s energy of the reaction</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>r</sub>H = &sum; (v<sub>i</sub> &middot; &Delta;<sub>f</sub>H<sub>i</sub>) </p></td>
<td><p>molar enthalpy of the reaction</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>r</sub>S = &sum; (v<sub>i</sub> &middot; &Delta;<sub>f</sub>S<sub>i</sub>) = <a href=\"modelica://Modelica.Constants\">k</a>&middot;<a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(&Delta;<sub>r</sub>&omega;) </p></td>
<td><p>molar entropy of the reaction</p></td>
</tr>
</table>
<h4><span style=\"color:#008000\">Notations</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>A<sub>i</sub></p></td>
<td><p>i-th substance</p></td>
</tr>
<tr>
<td><p>v<sub>i</sub></p></td>
<td><p>stochiometric coefficients of i-th substance</p></td>
</tr>
<tr>
<td><p>K</p></td>
<td><p>dissociation constant (activity based)</p></td>
</tr>
<tr>
<td><p>a(A<sub>i</sub>)=f<sub>i</sub>*x<sub>i</sub></p></td>
<td><p>activity of the substance A</p></td>
</tr>
<tr>
<td><p>f<sub>i</sub></p></td>
<td><p>activity coefficient of the substance A</p></td>
</tr>
<tr>
<td><p>x<sub>i</sub></p></td>
<td><p>mole fraction of the substance A</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>f</sub>H<sub>i</sub></p></td>
<td><p>molar enthalpy of formation of i-th substance</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>f</sub>G<sub>i</sub></p></td>
<td><p>molar Gibbs energy of formation of i-th substance</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>f</sub>S<sub>i</sub></p></td>
<td><p>molar entropy of formation of i-th substance</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>r</sub>&omega;</p></td>
<td><p>change of number of microstates of particles by reaction</p></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
</table>
</html>"));
      end Reaction;

      model ElectronTransfer
      "Electron transfer from the solution to electric circuit"
        extends Icons.ElectronTransfer;
        extends Interfaces.PartialSubstanceInSolution(final stateOfMatter, final substanceData(
          MolarWeight=5.4857990946e-7,
          z=-1,
          DfH_25degC=0,
          DfG_25degC_1bar=0,
          Cp=0,
          density=1e20));

        Modelica.Electrical.Analog.Interfaces.PositivePin pin annotation (
            Placement(transformation(extent={{90,50},{110,70}}), iconTransformation(
                extent={{-110,-10},{-90,10}})));

      equation
        //electric
        pin.v = electricPotential;
        pin.i + z*Modelica.Constants.F*port_a.q + solution.i = 0;

        //pure substance
        x = 1;

        //solution changes
        solution.dH = 0;
        solution.dV = 0;

        //extensive properties of the solution
        solution.nj=0;
        solution.mj=0;
        solution.Vj=0;
        solution.Gj=0;
        solution.Qj=0;
        solution.Ij=0;
        solution.otherPropertiesOfSubstance=zeros(stateOfMatter.OtherPropertiesCount);

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
              graphics={
              Text(
                extent={{-146,-44},{154,-84}},
                textString="%name",
                lineColor={0,0,255})}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end ElectronTransfer;

      model Diffusion "Solute diffusion"
        extends Icons.Diffusion;
        extends Interfaces.OnePortParallel;
        extends Interfaces.ConditionalKinetics;

        parameter Real kE(unit="mol/J")=0 "Kinetic turnover coefficient";

      protected
        Modelica.SIunits.ChemicalPotential du;
      equation
        //the main equation
        du = (port_b.u - port_a.u);
        port_b.q = kC * du * exp(-kE*abs(du));

         annotation (                 Documentation(revisions="<html>
<p><i>2017-2018 by </i>Marek Matejak, http://www.physiolib.com </p>
</html>",       info="<html>
<p>Diffusion of the substance as equilibration of electro-chemical potentials.</p>
</html>"));
      end Diffusion;

      model GasSolubility "Henry's law of gas solubility in liquid."

        extends Icons.GasSolubility;

        parameter Boolean useWaterCorrection = true
        "Are free Gibbs energy of aqueous formation shifted by 10 kJ/mol?"
        annotation(Evaluate=true, HideResult=true, choices(checkbox=true));

      Interfaces.SubstancePort_b gas_port "Gaseous solution"
        annotation (Placement(transformation(extent={{-10,90},{10,110}})));

      Interfaces.SubstancePort_b liquid_port "Dissolved in liquid solution"
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}}),
            iconTransformation(extent={{-10,-110},{10,-90}})));

         extends Interfaces.ConditionalKinetics;

        parameter Real kE(unit="mol/J")=0 "Kinetic turnover coefficient";

      protected
        Modelica.SIunits.ChemicalPotential du;
      equation
        gas_port.q + liquid_port.q = 0;

        du = (liquid_port.u - gas_port.u - (if useWaterCorrection then Modelica.Constants.R*(298.15)*log(0.01801528) else 0));
        // the main equation
        liquid_port.q = kC * du * exp(-kE*abs(du));

         annotation (Documentation(revisions="<html>
<p><i>2017-2018 </i></p>
<p><i>by </i>Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<p>Gaseuous substance dissolition in liquid (Henry&apos;s law, Raoult&apos;s law, Nernst dissolution in one). </p>
<h4><span style=\"color:#008000\">Equilibrium equation</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>K<sub>H</sub> =x<sub>L</sub> / x<sub>g</sub>&nbsp;</p></td>
<td><p>Henry&apos;s coefficient, Raoult&apos;s coefficient</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>sol</sub>G = &Delta;<sub>f</sub>G<sub>L </sub>- &Delta;<sub>f</sub>G<sub>g </sub>= &Delta;<sub>sol</sub>H - T&middot;&Delta;<sub>sol</sub>S = -R&middot;T&middot;<a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(K<sub>H</sub>&middot; (f<sub>L</sub> / f<sub>g</sub>)) </p></td>
<td><p>molar Gibb&apos;s energy of the dissolition</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>sol</sub>H = &Delta;<sub>f</sub>H<sub>L </sub>- &Delta;<sub>f</sub>H<sub>g</sub></p></td>
<td><p>molar enthalpy of the dissolition</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>sol</sub>S = &Delta;<sub>f</sub>S<sub>L</sub> - &Delta;<sub>f</sub>S<sub>g</sub> = <a href=\"modelica://Modelica.Constants\">k</a>&middot;<a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(&Delta;<sub>sol</sub>&omega;) </p></td>
<td><p>molar entropy of the dissolition</p></td>
</tr>
</table>
<h4><span style=\"color:#008000\">Notations</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>x<sub>L</sub></p></td>
<td><p>mole fraction of the substance in the liquid</p></td>
</tr>
<tr>
<td><p>x<sub>g</sub></p></td>
<td><p>mole fraction of the substance in the gas</p></td>
</tr>
<tr>
<td><p>f<sub>L</sub></p></td>
<td><p>activity coefficient of the substance in the liquid</p></td>
</tr>
<tr>
<td><p>f<sub>g</sub></p></td>
<td><p>activity coefficient of the substance in the gas</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>f</sub>H<sub>L</sub></p></td>
<td><p>molar enthalpy of formation of the substance in the liquid</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>f</sub>H<sub>g</sub></p></td>
<td><p>molar enthalpy of formation of the substance in the gas</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>f</sub>S<sub>L</sub></p></td>
<td><p>molar entropy of formation of the substance in the liquid</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>f</sub>S<sub>g</sub></p></td>
<td><p>molar entropy of formation of the substance in the gas</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>sol</sub>G</p></td>
<td><p>molar Gibbs energy of dissolvation of the substance in the liquid</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>sol</sub>&omega;</p></td>
<td><p>change of number of microstates of particles by dissolution</p></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
</table>
</html>"));
      end GasSolubility;

      model Membrane
      "Passive transport of the substance through semipermeable membrane"
        extends Icons.Membrane;
        extends Interfaces.OnePortParallel;
        extends Interfaces.ConditionalKinetics;

        parameter Real kE(unit="mol/J")=0 "Kinetic turnover coefficient";

      protected
        Modelica.SIunits.ChemicalPotential du;
      equation
        //the main equation
        du = (port_a.u - port_b.u);
        port_a.q = kC * du * exp(-kE*abs(du));

        annotation ( Documentation(info="<html>
<p><u><b><font style=\"color: #008000; \">Filtration throught semipermeable membrane.</font></b></u></p>
<p>The penetrating particles are driven by electric and chemical gradient to reach Donnan&apos;s equilibrium.</p>
<p>If zero-flow Donnan&apos;s equilibrium is reached. </p>
</html>",   revisions="<html>
<p><i>2017-2018 by </i>Marek Matejak, http://www.physiolib.com </p>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={
              Text(
                extent={{-97,-12},{97,12}},
                textString="%name",
                lineColor={0,0,255},
              origin={69,2},
              rotation=90)}));
      end Membrane;

      model SubstancePump "Prescribed sunstance molar flow"
        extends Interfaces.OnePortParallel;
        extends Interfaces.ConditionalSubstanceFlow;

      equation
        port_a.q = q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Text(
                extent={{-150,-20},{150,20}},
                lineColor={0,0,255},
                origin={-10,-76},
                rotation=360,
                textString="%name")}),        Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end SubstancePump;

      model Speciation
      "Quaternary macromolecule form defined by all its subunits"
        extends Icons.Speciation;

        replaceable package stateOfMatter = Interfaces.Incompressible                    constrainedby
          Interfaces.StateOfMatter
        "Substance model to translate data into substance properties"
           annotation (choicesAllMatching = true);

        parameter Integer NumberOfSubunits=1
        "Number of independent subunits occurring in macromolecule";

        Interfaces.SolutionPort solution(redeclare package stateOfMatter =
              stateOfMatter)                                                              annotation (Placement(transformation(extent={{-70,
                  -110},{-50,-90}}),
              iconTransformation(extent={{-70,-110},{-50,-90}})));

          Modelica.SIunits.AmountOfSubstance nm
        "Amount of the macromolecule (all form in the conformation)";
          Modelica.SIunits.MoleFraction xm
        "Mole fraction of the macromolecule (all form of in the conformation)";

      public
        Interfaces.SolutionPort subunitSolution(redeclare package stateOfMatter =
              stateOfMatter) "The port to connect all subunits"
          annotation (Placement(transformation(extent={{-70,92},{-50,112}}),
              iconTransformation(extent={{30,50},{50,70}})));
      Interfaces.SubstancePort_a port_a annotation (Placement(transformation(
              extent={{90,-110},{110,-90}}), iconTransformation(extent={{90,-110},
                {110,-90}})));
      Interfaces.SubstancePorts_b subunits[NumberOfSubunits]
        "Subunits of macromolecule" annotation (Placement(transformation(extent={
                {-56,-14},{-36,66}}), iconTransformation(
            extent={{-10,-40},{10,40}},
            rotation=90,
            origin={-30,102})));
      equation
        //amount of macromolecule (all forms in conformation)
        nm*NumberOfSubunits + subunitSolution.nj = 0;

        //change of macromolecule = change of its subunits
        subunits.q = -port_a.q * ones(NumberOfSubunits);

        //mole fraction of all forms in conformation
        xm = nm/solution.n;

        //electrochemical potential of the specific form
        port_a.u = Modelica.Constants.R*solution.T*log(xm) +
              sum(subunits.u - Modelica.Constants.R*solution.T*log(xm)
               * ones(NumberOfSubunits));

        //properties from subunits
        subunitSolution.dH + solution.dH = 0;
        subunitSolution.i + solution.i = 0;
        subunitSolution.Qj + solution.Qj = 0;
        subunitSolution.Ij + solution.Ij = 0;

        //properties of macromolecule as a whole
        subunitSolution.nj + solution.nj*NumberOfSubunits = 0; //only amount of substance is necessery to express between sites' solution and real solution
        subunitSolution.mj + solution.mj = 0;
        subunitSolution.Vj + solution.Vj = 0;
        subunitSolution.Gj + solution.Gj = 0;
        subunitSolution.dV + solution.dV = 0;
        subunitSolution.otherPropertiesOfSubstance = -solution.otherPropertiesOfSubstance;

        //shift global solution status to subunits
        subunitSolution.T = solution.T;
        subunitSolution.v = solution.v;
        subunitSolution.p = solution.p;
        subunitSolution.n = solution.n;
        subunitSolution.m = solution.m;
        subunitSolution.V = solution.V;
        subunitSolution.G = solution.G;
        subunitSolution.Q = solution.Q;
        subunitSolution.I = solution.I;
        subunitSolution.otherProperties = solution.otherProperties;

        annotation (defaultComponentName="macromolecule",
          Documentation(revisions="<html>
<p><i>2017-2018 by </i>Marek Matejak, http://www.physiolib.com </p>
</html>",       info="<html>
<p><b>Macromolecule speciation in chemical equilibrium</b> </p>
<p>The equilibrium of the conformation reactions of macromolecules can be simplified to the reactions of their selected electro-neutral forms of the selected conformation, because of the law of detailed balance.</p>
<p>The assumptions of this calculation are:</p>
<ol>
<li><i>Initial total concentrations of each subunit must be set to the total macromolecule concentration (for the selected conformation).</i></li>
<li><i>The charge, enthalpy of formation, entropy of formation and molar volume of each selected independent subunit form is zero. </i></li>
<li><i>Subunits are connected to the same solution as the macromolecule. </i></li>
</ol>
<h4><span style=\"color:#008000\">Equilibrium equation</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>x<sub>m</sub>&nbsp;</p></td>
<td><p>the probability of macromolecule(of the selected conformation)</p></td>
</tr>
<tr>
<td><p>f<sub>i</sub> = (x<sub>i</sub>/x<sub>m</sub>)</p></td>
<td><p>the probalitivy of selected independent subunits forms (of the macromolecule in the selected conformation)</p></td>
</tr>
<tr>
<td><p>x<sub>s </sub>= x<sub>m</sub>&middot; &Pi; f<sub>i</sub> = x<sub>m</sub>&middot; &Pi; (x<sub>i</sub>/x<sub>m</sub>)</p></td>
<td><p>the probability of the selected form of macromolecule (composed from selected subunits in the selected conformation)</p></td>
</tr>
<tr>
<td><p>u<sub>s </sub>= u<sub>s</sub>&deg; + R&middot;T&middot;ln(x<sub>m</sub>) + &sum; (u<sub>i</sub> - R&middot;T&middot;ln(x<sub>m</sub>))</p></td>
<td><p>final equation of the equilibrium of electro-chemical potential</p></td>
</tr>
</table>
<p><br><br><br><b><font style=\"color: #008000; \">Notations</font></b></p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>n<sub>T</sub></p></td>
<td><p>total amount of substances in the solution</p></td>
</tr>
<tr>
<td><p>n<sub>m</sub></p></td>
<td><p>total amount of the macromolecule (of the selected conformation) in the solution</p></td>
</tr>
<tr>
<td><p>n<sub>s</sub></p></td>
<td><p>amount of the specific form of the macromolecule (of the selected conformation) in the solution</p></td>
</tr>
<tr>
<td><p>n<sub>i</sub></p></td>
<td><p>amount of the specific form of the i-th macromolecule(of the selected conformation)&apos;s subunit in the solution</p></td>
</tr>
<tr>
<td><p>x<sub>m </sub>= n<sub>m </sub>/ n<sub>T</sub></p></td>
<td><p>mole fraction of macromolecule (of the selected conformation)</p></td>
</tr>
<tr>
<td><p>x<sub>s </sub>= n<sub>s </sub>/ n<sub>T</sub></p></td>
<td><p>mole fraction of the selected form of the whole macromolecule (composed from selected subunits in the selected conformation)</p></td>
</tr>
<tr>
<td><p>x<sub>i </sub>= n<sub>i </sub>/ n<sub>T</sub></p></td>
<td><p>mole fraction of i-th macromolecule(of the selected conformation)&apos;s subunit form</p></td>
</tr>
<tr>
<td><p>u<sub>s</sub>&deg;</p></td>
<td><p>base chemical potential of the selected form of the macromolecule (composed from selected subunits in the selected conformation)</p></td>
</tr>
<tr>
<td><p>u<sub>s </sub>= u<sub>s</sub>&deg; + R&middot;T&middot;ln(x<sub>s</sub>)</p></td>
<td><p>chemical potential of the selected form of the macromolecule (composed from selected subunits in the selected conformation)</p></td>
</tr>
<tr>
<td><p>u<sub>i</sub>&deg; = 0</p></td>
<td><p>base chemical potential of the specific form of the i-th macromolecule(of the selected conformation)&apos;s subunit in the solution</p></td>
</tr>
<tr>
<td><p>u<sub>i </sub>= R&middot;T&middot;ln(x<sub>i</sub>)</p></td>
<td><p>chemical potential of the specific form of the i-th macromolecule(of the selected conformation)&apos;s subunit in the solution</p></td>
</tr>
</table>
<p><br><br><br><br>For example: If the macromolecule M has four identical independent subunits and each subunit can occur in two form F1 and F2, then the probability of macromolecule form S composed only from four subunits in form F1 is P(S)=P(M)*P(F1)^4.</p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),
              graphics={                                                        Text(
                extent={{-22,-106},{220,-140}},
                lineColor={0,0,255},
                textString="%name")}));
      end Speciation;

      model Stream "Flow of whole solution"
        extends Interfaces.ConditionalSolutionFlow;

        replaceable package stateOfMatter = Interfaces.Incompressible                    constrainedby
          Interfaces.StateOfMatter
        "Substance model to translate data into substance properties"
           annotation (choicesAllMatching = true);

        parameter stateOfMatter.SubstanceData substanceData
        "Definition of the substance"
           annotation (choicesAllMatching = true);

      Interfaces.SubstancePort_b port_b annotation (Placement(transformation(
              extent={{-110,-10},{-90,10}}), iconTransformation(extent={{-110,-10},
                {-90,10}})));
        Sensors.MoleFractionSensor moleFractionSensor(
           redeclare package stateOfMatter = stateOfMatter,
           substanceData=substanceData)
          annotation (Placement(transformation(extent={{56,-10},{76,10}})));
        Sensors.MoleFractionSensor moleFractionSensor1(
           redeclare package stateOfMatter = stateOfMatter,
           substanceData=substanceData)
          annotation (Placement(transformation(extent={{-56,-10},{-76,10}})));
        SubstancePump substancePump(useSubstanceFlowInput=true)
          annotation (Placement(transformation(extent={{-14,-74},{6,-54}})));
        Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=270,
              origin={0,-38})));
        Modelica.Blocks.Logical.GreaterThreshold greaterThreshold annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-4})));
        Modelica.Blocks.Math.Product product
          annotation (Placement(transformation(extent={{-40,-36},{-20,-16}})));
        Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={30,-26})));
      Interfaces.SubstancePort_b port_a
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        Interfaces.SolutionPort solution(redeclare package stateOfMatter =
            stateOfMatter)
          annotation (Placement(transformation(extent={{-70,-110},{-50,-90}})));
      equation
        product.u1=q;
        product1.u2=q;
        greaterThreshold.u=q;

        connect(port_b, moleFractionSensor1.port_a) annotation (Line(
            points={{-100,0},{-76,0}},
            color={158,66,200}));
        connect(moleFractionSensor.port_a, port_a) annotation (Line(
            points={{76,0},{100,0}},
            color={158,66,200}));
        connect(moleFractionSensor1.solution, solution) annotation (Line(
            points={{-60,-10},{-60,-100}},
            color={0,128,255}));
        connect(solution, moleFractionSensor.solution) annotation (Line(
            points={{-60,-100},{60,-100},{60,-10}},
            color={0,128,255}));
        connect(substancePump.substanceFlow, switch1.y) annotation (Line(
            points={{0,-60},{0,-49},{-2.22045e-015,-49}},
            color={0,0,127}));
        connect(switch1.u2, greaterThreshold.y) annotation (Line(
            points={{2.22045e-015,-26},{0,-26},{0,-15}},
            color={255,0,255}));
        connect(product1.u1, moleFractionSensor.moleFraction) annotation (Line(
            points={{42,-32},{50,-32},{50,0},{56,0}},
            color={0,0,127}));
        connect(product.u2, moleFractionSensor1.moleFraction) annotation (Line(
            points={{-42,-32},{-50,-32},{-50,0},{-56,0}},
            color={0,0,127}));
        connect(port_b, substancePump.port_a) annotation (Line(
            points={{-100,0},{-86,0},{-86,-64},{-14,-64}},
            color={158,66,200}));
        connect(substancePump.port_b, port_a) annotation (Line(
            points={{6,-64},{84,-64},{84,0},{100,0}},
            color={158,66,200}));
        connect(product.y, switch1.u1) annotation (Line(
            points={{-19,-26},{-8,-26}},
            color={0,0,127}));
        connect(product1.y, switch1.u3) annotation (Line(
            points={{19,-26},{8,-26}},
            color={0,0,127}));
       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                              graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Text(
                extent={{-150,-20},{150,20}},
                textString="%name",
                lineColor={0,0,255},
                origin={2,-74},
                rotation=180)}),
          Documentation(revisions="<html>
<p><i>2017-2018 by </i>Marek Matejak, http://www.physiolib.com </p>
</html>",       info="<html>
<h4><font color=\"#008000\">Bidirectional mass flow by concentration</font></h4>
<p>Possible field values: </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0.1\"><tr>
<td></td>
<td><h4>forward flow</h4></td>
<td><h4>backward flow</h4></td>
</tr>
<tr>
<td><h4>solutionFlow</h4></td>
<td><p align=\"center\">&gt;=0</p></td>
<td><p align=\"center\">&lt;=0</p></td>
</tr>
<tr>
<td><h4>q_in.q</h4></td>
<td><p align=\"center\">=solutionFlow*q_in.conc</p></td>
<td><p align=\"center\">=-q_out.q</p></td>
</tr>
<tr>
<td><h4>q_out.q</h4></td>
<td><p align=\"center\">=-q_in.q</p></td>
<td><p align=\"center\">=solutionFlow*q_out.conc</p></td>
</tr>
</table>
<br/>
</html>"));
      end Stream;

      model FluidAdapter
      "Adapter between chemical substances of one homogenous chemical solution and Modelica.Fluid package components of MSL 3.2.1"

       /* constant String substanceNames[:]= {""}
  "To express number and order of substances"         annotation (Evaluate=true);

  replaceable package Medium = Interfaces.SimpleChemicalMedium (substanceNames=substanceNames,
        redeclare package stateOfMatter = Interfaces.Incompressible)
  "Medium model"   annotation (choicesAllMatching=true);

  package StateOfMatter = Medium.stateOfMatter
  "State of matter of each chemical substance";
  constant StateOfMatter.SubstanceData substanceData[:] = Medium.substanceData
  "Definitions of all chemical substances";

  Modelica.Fluid.Interfaces.FluidPort_a fluid(redeclare package Medium = Medium)
  "Connector of Modelica.Fluid package"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Interfaces.SubstancePorts_b substances[n]
  "All chemical substances of the solution"                                           annotation (Placement(transformation(
          extent={{-110,-40},{-90,40}}), iconTransformation(extent={{-110,-40},{
            -90,40}})));
  Interfaces.SolutionPort solution(redeclare package stateOfMatter =
        Medium.stateOfMatter) "Chemical solution"
    annotation (Placement(transformation(extent={{30,-40},{50,-20}}),
        iconTransformation(extent={{30,-40},{50,-20}})));
   Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort
  "Heat port of the chemical solution"                                                               annotation (
      Placement(transformation(extent={{-50,-40},{-30,-20}}),iconTransformation(
          extent={{-50,-40},{-30,-20}})));

  Modelica.SIunits.MoleFraction x[n] "Mole fraction of the substance";

protected 
  constant Integer n=size(substanceNames,1) "Number of substances";
  Modelica.SIunits.MolarMass molarMass[n] "Molar mass of the substance";

  Modelica.SIunits.Temperature temperature(start=298.15)
  "Temperature of the solution";

  Modelica.SIunits.Pressure pressure(start=100000)
  "Pressure of the solution";

  Modelica.SIunits.ElectricPotential electricPotential(start=0)
  "Electric potential of the solution";

  Medium.ThermodynamicState actualStreamThermodynamicState
  "Thermodynamic state of solution inside stream";

  //  Modelica.SIunits.SpecificEnergy actualStreamSpecificEnthalpy
  //    "Specific Enthalpy of solution inside stream";

  Modelica.SIunits.SpecificEnergy actualStreamSpecificInternalEnergy
  "Specific Internal Energy of solution inside stream";

equation 
  //fluid
  fluid.p = pressure;
  fluid.m_flow * actualStream(fluid.Xi_outflow) + molarMass .* substances.q = zeros(n);
  fluid.Xi_outflow = x .* molarMass ./ (x*molarMass);

  //substances
  molarMass = StateOfMatter.molarMass(Medium.substanceData,temperature,pressure,electricPotential,solution.I);
  substances.u = StateOfMatter.chemicalPotentialPure(
    Medium.substanceData,
    temperature,
    pressure,
    electricPotential,
    solution.I)
    + Modelica.Constants.R*temperature*log(x .* StateOfMatter.activityCoefficient(Medium.substanceData,temperature,pressure,electricPotential,solution.I))
    + Modelica.Constants.F*electricPotential*StateOfMatter.chargeNumberOfIon(Medium.substanceData,temperature,pressure,electricPotential,solution.I);

  //energy balance
  //fluid.h_outflow = solution.H / solution.m;
  fluid.h_outflow = Medium.specificEnthalpy(Medium.setState_pTX(pressure, temperature, fluid.Xi_outflow, electricPotential, solution.I));

  actualStreamThermodynamicState = Medium.setState_phX(pressure, actualStream(fluid.h_outflow), actualStream(fluid.Xi_outflow), electricPotential, solution.I);

  //The first idea was to changne only the enthalpy as extensive energy, but it changes the temperature with change of volume during isobaric and isothermic conditions!!!
  //  actualStreamSpecificEnthalpy = Medium.specificEnthalpy(actualStreamThermodynamicState);
  //  heatPort.Q_flow = -actualStreamSpecificEnthalpy*fluid.m_flow;

  //As a result, whole internal energy must be changed during mass changes. This energy is balenced using heat port with solution.
  actualStreamSpecificInternalEnergy = Medium.specificInternalEnergy(actualStreamThermodynamicState);
  heatPort.Q_flow = -actualStreamSpecificInternalEnergy*fluid.m_flow;

  //solution aliasses
  temperature = solution.T;
  pressure = solution.p;
  electricPotential = solution.v;

  //do not affect solution at port:
  solution.dH = 0;
  solution.i = 0;
  solution.dV = 0;
  solution.Gj = 0;
  solution.nj = 0;
  solution.mj = 0;
  solution.Qj = 0;
  solution.Ij = 0;
  solution.Vj = 0;
  solution.otherPropertiesOfSubstance = zeros(Medium.stateOfMatter.OtherPropertiesCount);
*/
        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Line(
                points={{-90,0},{90,0}},
                color={158,66,200},
                thickness=1)}));
      end FluidAdapter;

      model FluidAdapter2
        "Adapter between chemical substances of one homogenous chemical solution and Modelica.Fluid package components of MSL 3.2.1"

        /*
  constant String substanceNames[:]= {""}
  "To express number and order of substances"         annotation (Evaluate=true);
*/
      /*  replaceable package Medium = Physiolib.Media.BaseMedium_C
    "Medium model"   annotation (choicesAllMatching=true);

  //Interfaces.SimpleChemicalMedium (
 ///       redeclare package stateOfMatter = Interfaces.Incompressible)
                                                                //substanceNames=substanceNames,

  package StateOfMatter = Medium.stateOfMatter
  "State of matter of each chemical substance";
  constant StateOfMatter.SubstanceData substanceData[Medium.nXi] = Medium.substanceData
  "Definitions of all chemical substances";

  // Fluid Port definitions
  parameter Integer nFluidPorts=0 "Number of fluid ports"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b fluidPorts[nFluidPorts](redeclare 
      each package Medium = Medium)
  "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},
      origin={100,0},
        rotation=90)));

  Interfaces.SubstancePorts_b substances[Medium.nXi]
  "All chemical substances of the solution"                                           annotation (Placement(transformation(
          extent={{-110,-40},{-90,40}}), iconTransformation(extent={{-110,-40},{
            -90,40}})));
  Interfaces.SolutionPort solution(redeclare package stateOfMatter =
        Medium.stateOfMatter) "Chemical solution"
    annotation (Placement(transformation(extent={{-50,-40},{-30,-20}}),
        iconTransformation(extent={{-50,-40},{-30,-20}})));
   Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort
  "Heat port of the chemical solution"                                                               annotation (
      Placement(transformation(extent={{30,-40},{50,-20}}),  iconTransformation(
          extent={{30,-40},{50,-20}})));

  Modelica.SIunits.MoleFraction x[Medium.nXi] "Mole fraction of the substance";

  //constant Integer n=size(substanceNames,1) "Number of substances";
protected 
  Modelica.SIunits.MolarMass molarMass[Medium.nXi] "Molar mass of the substance";

  Modelica.SIunits.Temperature temperature(start=298.15)
  "Temperature of the solution";

  Modelica.SIunits.Pressure pressure(start=100000)
  "Pressure of the solution";

  Modelica.SIunits.ElectricPotential electricPotential(start=0)
  "Electric potential of the solution";

  //Real actualStreamXFlow[n,nFluidPorts];

  Medium.ThermodynamicState actualStreamThermodynamicState[nFluidPorts]
  "Thermodynamic state of solution inside stream";

  //  Modelica.SIunits.SpecificEnergy actualStreamSpecificEnthalpy
  //    "Specific Enthalpy of solution inside stream";

  Modelica.SIunits.SpecificEnergy actualStreamSpecificInternalEnergy[nFluidPorts]
  "Specific Internal Energy of solution inside stream";

equation 
  //fluid connectors
  for i in 1:nFluidPorts loop
    assert(cardinality(fluidPorts[i]) <= 1,"
each fluidPorts[i] of boundary shall at most be connected to one component.
If two or more connections are present, ideal mixing takes
place with these connections, which is usually not the intention
of the modeller. Increase nFuildPorts to add an additional fluidPort.
");

     fluidPorts[i].p          = pressure;
     fluidPorts[i].Xi_outflow = x .* molarMass ./ (x*molarMass);

    //energy balance
     fluidPorts[i].h_outflow  = Medium.specificEnthalpy(Medium.setState_pTX(pressure, temperature, fluidPorts[i].Xi_outflow, electricPotential, solution.I));

     actualStreamThermodynamicState[i] = Medium.setState_phX(pressure, actualStream(fluidPorts[i].h_outflow), actualStream(fluidPorts[i].Xi_outflow), electricPotential, solution.I);
     actualStreamSpecificInternalEnergy[i] = Medium.specificInternalEnergy(actualStreamThermodynamicState[i]);
  end for;

  //substance flow balances
  for s in 1:Medium.nXi loop
     fluidPorts.m_flow * actualStream(fluidPorts.Xi_outflow[s]) + molarMass[s] * substances[s].q = 0;
  end for;

  //substances
  molarMass = StateOfMatter.molarMass(Medium.substanceData,temperature,pressure,electricPotential,solution.I);
  substances.u = StateOfMatter.chemicalPotentialPure(
    Medium.substanceData,
    temperature,
    pressure,
    electricPotential,
    solution.I)
    + Modelica.Constants.R*temperature*log(x .* StateOfMatter.activityCoefficient(Medium.substanceData,temperature,pressure,electricPotential,solution.I))
    + Modelica.Constants.F*electricPotential*StateOfMatter.chargeNumberOfIon(Medium.substanceData,temperature,pressure,electricPotential,solution.I);

  //The first idea was to changne only the enthalpy as extensive energy, but it changes the temperature with change of volume during isobaric and isothermic conditions!!!
  //  actualStreamSpecificEnthalpy = Medium.specificEnthalpy(actualStreamThermodynamicState);
  //  heatPort.Q_flow = -actualStreamSpecificEnthalpy*fluid.m_flow;

  //As a result, whole internal energy must be changed during mass changes. This energy is balenced using heat port with solution.
  heatPort.Q_flow = -actualStreamSpecificInternalEnergy*fluidPorts.m_flow;

  //solution aliasses
  temperature = solution.T;
  pressure = solution.p;
  electricPotential = solution.v;

  //do not affect solution at port:
  solution.dH = 0;
  solution.i = 0;
  solution.dV = 0;
  solution.Gj = 0;
  solution.nj = 0;
  solution.mj = 0;
  solution.Qj = 0;
  solution.Ij = 0;
  solution.Vj = 0;
  solution.otherPropertiesOfSubstance = zeros(Medium.stateOfMatter.OtherPropertiesCount);

  annotation ( Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Line(
          points={{-90,0},{90,0}},
          color={158,66,200},
          thickness=1)})); */
      end FluidAdapter2;

      model Vessel "Chemical solution as homogenous mixture of the substances in vessel"
        extends Icons.Solution;

        extends Interfaces.PartialSolution(T(start=temperature_start),p(start=ExternalPressure));

        parameter Boolean useElectricPort = false "Is electric port pressent?"
        annotation(Evaluate=true, HideResult=true, choices(checkbox=true),Dialog(group="Conditional inputs"));

        parameter Boolean ElectricGround = true
        "Is the solution electric potential equal to zero during simulation (if not useElectricPort)?"
          annotation (HideResult=true, Dialog(enable=not useElectricPort));


        parameter Boolean useThermalPort = false "Is thermal port pressent?"
        annotation(Evaluate=true, HideResult=true, choices(checkbox=true),Dialog(group="Conditional inputs"));

        parameter Boolean ConstantTemperature = true
        "Has the solution constant temperature during simulation (if not useThermalPort)?"
           annotation (HideResult=true, Dialog(enable=not useThermalPort));


        parameter Modelica.SIunits.Temperature temperature_start=298.15
        "Initial temperature of the solution"
           annotation (Dialog(group="Initialization"));

         Physiolib.Types.Mass excessMass
          "Additional fluid mass, that generate pressure";

         parameter Boolean useM0Input = false
          "=true, if zero-pressure-fluid_mass input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

         parameter Physiolib.Types.Mass ZeroPressureMass=1e-8
          "Maximal fluid mass, that does not generate pressure if useM0Input=false"
          annotation (Dialog(enable=not useV0Input)); //default = 1e-5 g

         parameter Physiolib.Types.Mass CollapsingPressureMass=1e-9
          "Maximal fluid mass, which generate negative collapsing pressure"; //default = 1e-6 g

         Physiolib.Types.RealIO.MassInput zeroPressureMass(start=
              ZeroPressureMass)=zpm if useM0Input annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-80,80}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,90})));
        parameter Boolean useComplianceInput = false
          "=true, if compliance input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
        parameter Physiolib.Types.HydraulicCompliance Compliance=1e+3
          "Compliance if useComplianceInput=false"
          annotation (Dialog(enable=not useComplianceInput));

        Physiolib.Types.RealIO.HydraulicComplianceInput compliance(start=
              Compliance)=c if useComplianceInput annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={20,90})));
        parameter Boolean useExternalPressureInput = false
          "=true, if external pressure input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
        parameter Physiolib.Types.AbsolutePressure ExternalPressure=101325
          "External absolute pressure. Set zero if internal pressure is relative to external. Valid only if useExternalPressureInput=false."
          annotation (Dialog(enable=not useExternalPressureInput));
        parameter Physiolib.Types.Pressure MinimalCollapsingPressure=0;
        Physiolib.Types.RealIO.PressureInput externalPressure(start=
              ExternalPressure)=ep if useExternalPressureInput annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={80,80}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={60,90})));

        Physiolib.Types.RealIO.MassOutput fluidMass = mass annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={116,-60}),iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={100,-80})));

      protected
        Physiolib.Types.Mass zpm;
        Physiolib.Types.HydraulicCompliance c;
        Physiolib.Types.Pressure ep;
        parameter Physiolib.Types.Pressure a=MinimalCollapsingPressure/log(
            Modelica.Constants.eps);

      public
        Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T=T,Q_flow=heatFromEnvironment) if useThermalPort annotation (
            Placement(transformation(extent={{-70,-90},{-50,-70}}),iconTransformation(
                extent={{-62,-104},{-58,-100}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin electricPin(v=solution.v,i=solution.i) if useElectricPort annotation (Placement(
              transformation(extent={{-70,70},{-50,90}}),    iconTransformation(
                extent={{-62,98},{-58,102}})));

      initial equation
        T=temperature_start;

      equation

        //elastic compartment
        if not useM0Input then
          zpm=ZeroPressureMass;
        end if;
        if not useComplianceInput then
          c=Compliance;
        end if;
        if not useExternalPressureInput then
          ep=ExternalPressure;
        end if;
        excessMass = max( 0, mass - zpm);

        p =
          smooth(0,
            if noEvent(mass>CollapsingPressureMass) then
              (excessMass/c + ep)
            else
              (a*log(max(Modelica.Constants.eps,mass/CollapsingPressureMass)) + ep));

        workFromEnvironment =
                          p*der(volume);
                              //(((der(excessMass)*c-excessMass*der(c))/(c*c)) + der(ep))*volume +
                                         // der(p*volume)
        //solution.p = BasePressure + Compliance*(volume-BaseVolume); //- f/SurfaceArea;

        //electric
        if (not useElectricPort) and
                                    ElectricGround then
          //Solution connected to ground has zero voltage. However, electric current from the solution can varies.
            solution.v = 0;
        end if;
        if (not useElectricPort) and
                                   (not ElectricGround) then
          //Electrically isolated solution has not any electric current from/to the solution. However, electric potential can varies.
            solution.i = 0;
        end if;

        //thermal
        if (not useThermalPort) and ConstantTemperature then
          //Ideal thermal exchange between environment and solution to reach constant temperature
          der(T)=0;
        end if;
        if (not useThermalPort) and (not ConstantTemperature) then
          //Thermally isolated without any thermal exchange with environment
          heatFromEnvironment = 0;
        end if;

                                                                                                          annotation (
          Icon(coordinateSystem(
                preserveAspectRatio=false, initialScale=1, extent={{-100,-100},{
                100,100}}),
              graphics={Text(
                extent={{-90,92},{78,84}},
                lineColor={0,0,255},
                textString="%name",
                horizontalAlignment=TextAlignment.Left)}),
          Documentation(revisions="<html>
<p>2017-2018 by Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<h4>amountOfSolution = &sum; amountOfSubstances</h4>
<h4>mass = &sum; massOfSubstances</h4>
<h4>volume = &sum; volumeOfSubstances</h4>
<h4>freeGibbsEnergy = &sum; freeGibbsEnergiesOfSubstances</h4>
<p>To calculate the sum of extensive substance's properties is misused the Modelica \"flow\" prefix even there are not real physical flows. </p>
</html>"));
      end Vessel;

      model FluidAdapter_C
        "Adapter between chemical substances of one homogenous chemical solution and Modelica.Fluid package components of MSL 3.2, where substances are stored as molarities in expraProperties"

        replaceable package Medium = Physiolib.Media.BaseMedium_C
        "Medium model"   annotation (choicesAllMatching=true);
          //SystemModelingInModelica.Interfaces.BloodPlasma

        //Interfaces.SimpleChemicalMedium (
       ///       redeclare package stateOfMatter = Interfaces.Incompressible)
                                                                      //substanceNames=substanceNames,

        package StateOfMatter = Medium.stateOfMatter
        "State of matter of each chemical substance";

        constant StateOfMatter.SubstanceData substanceData[Medium.nC] = Medium.substanceData
        "Definitions of all chemical substances";

        // Fluid Port definitions
        parameter Integer nFluidPorts=0 "Number of fluid ports"
          annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
        Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b fluidPorts[nFluidPorts](redeclare
            each package Medium = Medium)
        "Fluid inlets and outlets"
          annotation (Placement(transformation(extent={{-40,-10},{40,10}},
            origin={100,0},
              rotation=90)));

        Interfaces.SubstancePorts_b substances[Medium.nC]
        "All chemical substances of the solution"                                           annotation (Placement(transformation(
                extent={{-110,-40},{-90,40}}), iconTransformation(extent={{-110,-40},{
                  -90,40}})));
        Interfaces.SolutionPort solution(redeclare package stateOfMatter =
              Medium.stateOfMatter) "Chemical solution"
          annotation (Placement(transformation(extent={{-50,-40},{-30,-20}}),
              iconTransformation(extent={{-50,-40},{-30,-20}})));
         Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort
        "Heat port of the chemical solution"                                                               annotation (
            Placement(transformation(extent={{30,-40},{50,-20}}),  iconTransformation(
                extent={{30,-40},{50,-20}})));

        Modelica.SIunits.MoleFraction x[Medium.nC] "Mole fraction of the substance";

        //constant Integer n=size(substanceNames,1) "Number of substances";
      //protected

        Modelica.SIunits.MolarMass molarMass[Medium.nC] "Molar mass of the substance";

        Modelica.SIunits.Temperature temperature(start=298.15)
        "Temperature of the solution";

        Modelica.SIunits.Pressure pressure(start=101325)
        "Pressure of the solution";

        Modelica.SIunits.ElectricPotential electricPotential(start=0)
        "Electric potential of the solution";

        //Real actualStreamXFlow[n,nFluidPorts];

        Medium.ThermodynamicState actualStreamThermodynamicState[nFluidPorts]
        "Thermodynamic state of solution inside stream";

        //  Modelica.SIunits.SpecificEnergy actualStreamSpecificEnthalpy
        //    "Specific Enthalpy of solution inside stream";

        Modelica.SIunits.SpecificEnergy actualStreamSpecificInternalEnergy[nFluidPorts]
        "Specific Internal Energy of solution inside stream";
        Medium.ThermodynamicState state;
        Modelica.SIunits.Density density;

      equation
        //fluid connectors
        for i in 1:nFluidPorts loop
          assert(cardinality(fluidPorts[i]) <= 1,"
each fluidPorts[i] of boundary shall at most be connected to one component.
If two or more connections are present, ideal mixing takes
place with these connections, which is usually not the intention
of the modeller. Increase nFuildPorts to add an additional fluidPort.
");

           fluidPorts[i].p          = pressure;
           fluidPorts[i].C_outflow = (x ./ molarMass) * density;

          //energy balance
           fluidPorts[i].h_outflow  = Medium.specificEnthalpy(state);

           actualStreamThermodynamicState[i] = Medium.setState_phX(pressure, actualStream(fluidPorts[i].h_outflow), actualStream(fluidPorts[i].Xi_outflow));
           //, electricPotential, solution.I);
           actualStreamSpecificInternalEnergy[i] = Medium.specificInternalEnergy(actualStreamThermodynamicState[i]);
        end for;

        state = Medium.setState_pTX(pressure, temperature, x .* molarMass ./ (x*molarMass)); //, electricPotential, solution.I);
        density = Medium.density(state);

        //substance flow balances
        for s in 1:Medium.nC loop
           fluidPorts.m_flow * actualStream(fluidPorts.C_outflow[s])/density + substances[s].q = 0;
        end for;

        //substances
        molarMass = StateOfMatter.molarMass(Medium.substanceData,temperature,pressure,electricPotential,solution.I);
        substances.u = StateOfMatter.chemicalPotentialPure(
          Medium.substanceData,
          temperature,
          pressure,
          electricPotential,
          solution.I)
          + Modelica.Constants.R*temperature*log(x .* StateOfMatter.activityCoefficient(Medium.substanceData,temperature,pressure,electricPotential,solution.I))
          + Modelica.Constants.F*electricPotential*StateOfMatter.chargeNumberOfIon(Medium.substanceData,temperature,pressure,electricPotential,solution.I);

        //The first idea was to changne only the enthalpy as extensive energy, but it changes the temperature with change of volume during isobaric and isothermic conditions!!!
        //  actualStreamSpecificEnthalpy = Medium.specificEnthalpy(actualStreamThermodynamicState);
        //  heatPort.Q_flow = -actualStreamSpecificEnthalpy*fluid.m_flow;

        //As a result, whole internal energy must be changed during mass changes. This energy is balenced using heat port with solution.
        heatPort.Q_flow + fluidPorts.m_flow*actualStream(fluidPorts.h_outflow) = 0;
        //-actualStreamSpecificInternalEnergy*fluidPorts.m_flow;

        //solution aliasses
        temperature = solution.T;
        pressure = solution.p;
        electricPotential = solution.v;

        //do not affect solution at port:
        solution.dH = 0;
        solution.i = 0;
        solution.dV = 0;
        solution.Gj = 0;
        solution.nj = 0;
        solution.mj = 0;
        solution.Qj = 0;
        solution.Ij = 0;
        solution.Vj = 0;
        solution.otherPropertiesOfSubstance = zeros(Medium.stateOfMatter.OtherPropertiesCount);

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Line(
                points={{-90,0},{90,0}},
                color={158,66,200},
                thickness=1)}));
      end FluidAdapter_C;

      model FluidAdapter_D
        "Adapter between chemical substances of one homogenous chemical solution and Modelica.Fluid package components of MSL 3.2, where substances are stored as molarities in expraProperties"

        replaceable package Medium = Physiolib.Media.BaseMedium_C
        "Medium model"   annotation (choicesAllMatching=true);
          //SystemModelingInModelica.Interfaces.BloodPlasma

        //Interfaces.SimpleChemicalMedium (
       ///       redeclare package stateOfMatter = Interfaces.Incompressible)
                                                                      //substanceNames=substanceNames,

        package StateOfMatter = Medium.stateOfMatter
        "State of matter of each chemical substance";

        constant StateOfMatter.SubstanceData substanceData[Medium.nC] = Medium.substanceData
        "Definitions of all chemical substances";

        // Fluid Port definitions
        parameter Integer nFluidPorts=0 "Number of fluid ports"
          annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
        Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b fluidPorts[nFluidPorts](redeclare
            each package Medium = Medium)
        "Fluid inlets and outlets"
          annotation (Placement(transformation(extent={{-40,-10},{40,10}},
            origin={100,0},
              rotation=90)));

        Interfaces.SubstancePorts_b substances[Medium.nC]
        "All chemical substances of the solution"                                           annotation (Placement(transformation(
                extent={{-110,-40},{-90,40}}), iconTransformation(extent={{-110,-40},{
                  -90,40}})));
        Interfaces.SolutionPort solution(redeclare package stateOfMatter =
              Medium.stateOfMatter) "Chemical solution"
          annotation (Placement(transformation(extent={{-50,-40},{-30,-20}}),
              iconTransformation(extent={{-50,-40},{-30,-20}})));

        Modelica.SIunits.MoleFraction x[Medium.nC] "Mole fraction of the substance";

        //constant Integer n=size(substanceNames,1) "Number of substances";
      //protected

        Modelica.SIunits.MolarMass molarMass[Medium.nC] "Molar mass of the substance";

        Modelica.SIunits.Temperature temperature(start=298.15)
        "Temperature of the solution";

        Modelica.SIunits.Pressure pressure(start=101325)
        "Pressure of the solution";

        Modelica.SIunits.ElectricPotential electricPotential(start=0)
        "Electric potential of the solution";

        //Real actualStreamXFlow[n,nFluidPorts];

        Medium.ThermodynamicState actualStreamThermodynamicState[nFluidPorts]
        "Thermodynamic state of solution inside stream";

        //  Modelica.SIunits.SpecificEnergy actualStreamSpecificEnthalpy
        //    "Specific Enthalpy of solution inside stream";

        Modelica.SIunits.SpecificEnergy actualStreamSpecificInternalEnergy[nFluidPorts]
        "Specific Internal Energy of solution inside stream";
        Medium.ThermodynamicState state;
        Modelica.SIunits.Density density;

      equation
        //fluid connectors
        for i in 1:nFluidPorts loop
          assert(cardinality(fluidPorts[i]) <= 1,"
each fluidPorts[i] of boundary shall at most be connected to one component.
If two or more connections are present, ideal mixing takes
place with these connections, which is usually not the intention
of the modeller. Increase nFuildPorts to add an additional fluidPort.
");

           fluidPorts[i].p          = pressure;
           fluidPorts[i].C_outflow = (x ./ molarMass) * density;

          //energy balance
           fluidPorts[i].h_outflow  = Medium.specificEnthalpy(state);

           actualStreamThermodynamicState[i] = Medium.setState_phX(pressure, actualStream(fluidPorts[i].h_outflow), actualStream(fluidPorts[i].Xi_outflow));
           //, electricPotential, solution.I);
           actualStreamSpecificInternalEnergy[i] = Medium.specificInternalEnergy(actualStreamThermodynamicState[i]);
        end for;

        state = Medium.setState_pTX(pressure, temperature, x .* molarMass ./ (x*molarMass)); //, electricPotential, solution.I);
        density = Medium.density(state);

        //substance flow balances
        for s in 1:Medium.nC loop
           fluidPorts.m_flow * actualStream(fluidPorts.C_outflow[s])/density + substances[s].q = 0;
        end for;

        //substances
        molarMass = StateOfMatter.molarMass(Medium.substanceData,temperature,pressure,electricPotential,solution.I);
        substances.u = StateOfMatter.chemicalPotentialPure(
          Medium.substanceData,
          temperature,
          pressure,
          electricPotential,
          solution.I)
          + Modelica.Constants.R*temperature*log(x .* StateOfMatter.activityCoefficient(Medium.substanceData,temperature,pressure,electricPotential,solution.I))
          + Modelica.Constants.F*electricPotential*StateOfMatter.chargeNumberOfIon(Medium.substanceData,temperature,pressure,electricPotential,solution.I);

        //The first idea was to changne only the enthalpy as extensive energy, but it changes the temperature with change of volume during isobaric and isothermic conditions!!!
        //  actualStreamSpecificEnthalpy = Medium.specificEnthalpy(actualStreamThermodynamicState);
        //  heatPort.Q_flow = -actualStreamSpecificEnthalpy*fluid.m_flow;

        //As a result, whole internal energy must be changed during mass changes. This energy is balenced using heat port with solution.
       // heatPort.Q_flow + fluidPorts.m_flow*actualStream(fluidPorts.h_outflow) = 0;
        //-actualStreamSpecificInternalEnergy*fluidPorts.m_flow;

        //solution aliasses
        temperature = solution.T;
        pressure = solution.p;
        electricPotential = solution.v;

        solution.dH = -fluidPorts.m_flow*actualStream(fluidPorts.h_outflow); //0;

       //do not affect solution at port?
        solution.i = 0;
        solution.dV = 0;
        solution.Gj = 0;
        solution.nj = 0;
        solution.mj = 0;
        solution.Qj = 0;
        solution.Ij = 0;
        solution.Vj = 0;
        solution.otherPropertiesOfSubstance = zeros(Medium.stateOfMatter.OtherPropertiesCount);

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Line(
                points={{-90,0},{90,0}},
                color={158,66,200},
                thickness=1)}));
      end FluidAdapter_D;
    end Components;

    package Sensors "Chemical sensors"
      extends Modelica.Icons.SensorsPackage;

      model MolarFlowSensor "Measure of molar flow"

        extends Modelica.Icons.RotationalSensor;
        extends Interfaces.OnePortSerial;

        Modelica.Blocks.Interfaces.RealOutput molarFlowRate(final unit="mol/s") annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-100})));

      equation
        molarFlowRate = port_a.q;

        port_a.u = port_b.u;

       annotation (
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"),          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                  100,100}}), graphics={
              Line(
                points={{70,-10},{90,-10}},
                color={127,0,127}),
              Line(
                points={{70,10},{90,10}},
                color={127,0,127}),
              Line(
                points={{-90,10},{-70,10}},
                color={127,0,127}),
              Line(
                points={{-90,-10},{-70,-10}},
                color={127,0,127}),
              Text(
                extent={{-31,-5},{28,-64}},
                lineColor={0,0,0},
                textString="dn")}));
      end MolarFlowSensor;

      model MoleFractionSensor "Measure of mole fraction"
        extends Modelica.Icons.RotationalSensor;
        extends Interfaces.PartialSubstanceSensor;

        Modelica.Blocks.Interfaces.RealOutput moleFraction(final unit="1")
        "Mole fraction of the substance"
         annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              origin={-100,0},
            rotation=180)));

      equation
        port_a.q = 0;

        moleFraction = x;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}),   graphics={
              Text(
                extent={{-31,-3},{28,-62}},
                lineColor={0,0,0},
                textString="x"),
              Line(
                points={{70,0},{80,0}},
                color={127,0,127})}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end MoleFractionSensor;

      model ElectroChemicalPotentialSensor
      "Measure of electro-chemical potential"
        extends Modelica.Icons.RotationalSensor;

        Modelica.Blocks.Interfaces.RealOutput u(final unit="J/mol")
        "Electro-chemical potential of the substance"
         annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              origin={-100,0},
            rotation=180)));

      Interfaces.SubstancePort_b port_a
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      equation
        port_a.q = 0;

        port_a.u = u;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}),   graphics={
              Text(
                extent={{-31,-3},{28,-62}},
                lineColor={0,0,0},
              textString="u"),
              Line(
                points={{70,0},{80,0}},
                color={127,0,127})}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end ElectroChemicalPotentialSensor;

      model MolalitySensor "Measure of molality of the substance"
        extends Modelica.Icons.RotationalSensor;
        extends Interfaces.PartialSubstanceSensor;

        parameter Modelica.SIunits.AmountOfSubstance AmountOfSolutionPer1kgOfSolvent = 55.508
        "Amount of all particles in the solution per one kilogram of solvent";

         Modelica.Blocks.Interfaces.RealOutput molality(final unit="mol/kg")
        "Molality of the substance (amount of substance per mass of solvent)"
         annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              origin={-100,0},
            rotation=180)));

      protected
        constant Modelica.SIunits.Mass KG=1;
      equation
        port_a.q = 0;

        x=molality*KG / AmountOfSolutionPer1kgOfSolvent;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}),   graphics={
              Text(
                extent={{-31,-3},{28,-62}},
                lineColor={0,0,0},
              textString="b"),
              Line(
                points={{70,0},{80,0}},
                color={127,0,127})}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end MolalitySensor;

      model MolarConcentrationSensor "Measure of molarity of the substance"
        extends Modelica.Icons.RotationalSensor;
        extends Interfaces.PartialSubstanceSensor;

      parameter Modelica.SIunits.AmountOfSubstance AmountOfSolutionInOneLiter = 55.508
        "Amount of all particles in one liter of the solution";

         Modelica.Blocks.Interfaces.RealOutput molarConcentration(final unit="mol/m3", displayUnit="mol/l")
        "Molarity of the substance (amount of substance in one liter of whole solution)"
         annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              origin={-100,0},
            rotation=180)));

      protected
        constant Modelica.SIunits.Volume L=0.001;
      equation
        port_a.q = 0;

        x=molarConcentration*L / AmountOfSolutionInOneLiter;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}),   graphics={
              Text(
                extent={{-31,-3},{28,-62}},
                lineColor={0,0,0},
              textString="c"),
              Line(
                points={{70,0},{80,0}},
                color={127,0,127})}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end MolarConcentrationSensor;

      model MassFractionSensor "Measure of mass fraction of the substance"
        extends Modelica.Icons.RotationalSensor;
        extends Interfaces.PartialSubstanceSensor;

      parameter Modelica.SIunits.AmountOfSubstance AmountOfSolutionInOneKilogram = 55.508
        "Amount of all particles in one kilogram of the solution";

         Modelica.Blocks.Interfaces.RealOutput massFraction(final unit="kg/kg")
        "Mass fraction of the substance (mass of the substance per mass of the whole solution)"
         annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              origin={-100,0},
            rotation=180)));

      equation
        port_a.q = 0;

        x=(massFraction/molarMass) / AmountOfSolutionInOneKilogram;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}),   graphics={
              Text(
                extent={{-31,-3},{28,-62}},
                lineColor={0,0,0},
              textString="mx"),
              Line(
                points={{70,0},{80,0}},
                color={127,0,127})}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end MassFractionSensor;

      model PartialPressureSensor
      "Measure of partial pressure of the substance in gaseous solution"
        extends Modelica.Icons.RotationalSensor;
        extends Interfaces.PartialSubstanceSensor;

         Modelica.Blocks.Interfaces.RealOutput partialPressure(final unit="Pa")
        "Partial pressure of the substance in gaseous solution"
         annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              origin={-100,0},
            rotation=180)));

      equation
        port_a.q = 0;

        partialPressure = x*solution.p;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}),   graphics={
              Text(
                extent={{-31,-3},{28,-62}},
                lineColor={0,0,0},
              textString="p"),
              Line(
                points={{70,0},{80,0}},
                color={127,0,127})}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end PartialPressureSensor;

      model DissociationCoefficient
      "Meassure dissociation coefficient (mole fraction based) for pure substances"
        extends Modelica.Icons.TranslationalSensor;

        parameter Modelica.SIunits.Temperature T=298.15 "Temperature";

        parameter Modelica.SIunits.AmountOfSubstance n=55.508*m
        "Amount of all substances in solution per one liter of solution";

        parameter Modelica.SIunits.Mass m=0.997
        "Mass of solvent per one liter of solution";

        parameter Integer nS=1 "Number of substrates types"
          annotation ( HideResult=true);

        parameter Modelica.SIunits.StoichiometricNumber s[nS]=ones(nS)
        "Stoichiometric reaction coefficient for substrates"
          annotation (HideResult=true);

        parameter Integer nP=1 "Number of products types"
          annotation ( HideResult=true);

        parameter Modelica.SIunits.StoichiometricNumber p[nP]=ones(nP)
        "Stoichiometric reaction coefficients for products"
          annotation (HideResult=true);

      Interfaces.SubstancePort_b products[nP] "Products"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));

      Interfaces.SubstancePort_b substrates[nS] "Substrates"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

        Modelica.SIunits.MolarEnergy DrG "Free Gibbs energy of reaction";

        Modelica.Blocks.Interfaces.RealOutput DissociationCoefficient_MoleFractionBased
        "Dissociation constant (if all substances has activity=1)"   annotation (Placement(transformation(
                extent={{-6,-86},{14,-66}}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-80})));

        Real DissociationCoefficient_MolalityBased
        "As ratio of molalities in moles per 1 kg of solvent";
        Real DissociationCoefficient_MolarityBased
        "As ratio of molar concentration in moles per liter of solution";
      equation
        substrates.q = zeros(nS);
        products.q = zeros(nP);

        DrG = ((p * products.u) - (s * substrates.u));

        DissociationCoefficient_MoleFractionBased = exp(-DrG/(Modelica.Constants.R*T));

        DissociationCoefficient_MolalityBased = ((n/m)^(p*ones(nP)-s*ones(nS))) * DissociationCoefficient_MoleFractionBased;

        DissociationCoefficient_MolarityBased = ((n/1)^(p*ones(nP)-s*ones(nS))) * DissociationCoefficient_MoleFractionBased;

        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                100,100}}),   graphics={
              Text(
                extent={{-160,-94},{-12,-68}},
                lineColor={0,0,0},
              textString="%s"),
              Text(
                extent={{12,-92},{160,-66}},
                lineColor={0,0,0},
              textString="%p")}),
          Documentation(revisions="<html>
<p><i>2017-2018 by </i>Marek Matejak, http://www.physiolib.com </p>
</html>",       info="<html>
<p><b>s<sub>1</sub>&middot;S<sub>1</sub> + .. + s<sub>nS</sub>&middot;S<sub>nS</sub> &lt;-&gt; p<sub>1</sub>&middot;P<sub>1</sub> + .. + p<sub>nP</sub>&middot;P<sub>nP</sub></b> </p>
<p>By redefinition of stoichometry as v<sub>i</sub> = -s<sub>i</sub>, A<sub>i</sub> = S<sub>i</sub> for i=1..nS v<sub>i</sub> = p<sub>i-nS</sub>, A<sub>i</sub> = P<sub>i-nS</sub> for i=nS+1..nS+nP </p>
<p>So the reaction can be written also as 0 = &sum; (v<sub>i</sub> &middot; A<sub>i</sub>) </p>
<h4><span style=\"color:#008000\">Equilibrium equation</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>K = <a href=\"modelica://ModelicaReference.Operators.'product()'\">product</a>(a(S)<a href=\"ModelicaReference.Operators.ElementaryOperators\">.^</a>s) / <a href=\"modelica://ModelicaReference.Operators.'product()'\">product</a>( a(P)<a href=\"ModelicaReference.Operators.ElementaryOperators\">.^</a>s ) = <a href=\"modelica://ModelicaReference.Operators.'product()'\">product</a>(a(A)<a href=\"ModelicaReference.Operators.ElementaryOperators\">.^</a>v)&nbsp;</p></td>
<td><p>dissociation constant</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>r</sub>G = &sum; (v<sub>i</sub> &middot; &Delta;<sub>f</sub>G<sub>i</sub>) = &Delta;<sub>r</sub>H - T&middot;&Delta;<sub>r</sub>S = -R&middot;T&middot;<a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(K) </p></td>
<td><p>molar Gibb&apos;s energy of the reaction</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>r</sub>H = &sum; (v<sub>i</sub> &middot; &Delta;<sub>f</sub>H<sub>i</sub>) </p></td>
<td><p>molar enthalpy of the reaction</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>r</sub>S = &sum; (v<sub>i</sub> &middot; &Delta;<sub>f</sub>S<sub>i</sub>) = <a href=\"modelica://Modelica.Constants\">k</a>&middot;<a href=\"modelica://ModelicaReference.Operators.'log()'\">log</a>(&Delta;<sub>r</sub>&omega;) </p></td>
<td><p>molar entropy of the reaction</p></td>
</tr>
</table>
<h4><span style=\"color:#008000\">Notations</span></h4>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p>A<sub>i</sub></p></td>
<td><p>i-th substance</p></td>
</tr>
<tr>
<td><p>v<sub>i</sub></p></td>
<td><p>stochiometric coefficients of i-th substance</p></td>
</tr>
<tr>
<td><p>K</p></td>
<td><p>dissociation constant (activity based)</p></td>
</tr>
<tr>
<td><p>a(A<sub>i</sub>)=f<sub>i</sub>*x<sub>i</sub></p></td>
<td><p>activity of the substance A</p></td>
</tr>
<tr>
<td><p>f<sub>i</sub></p></td>
<td><p>activity coefficient of the substance A</p></td>
</tr>
<tr>
<td><p>x<sub>i</sub></p></td>
<td><p>mole fraction of the substance A</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>f</sub>H<sub>i</sub></p></td>
<td><p>molar enthalpy of formation of i-th substance</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>f</sub>G<sub>i</sub></p></td>
<td><p>molar Gibbs energy of formation of i-th substance</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>f</sub>S<sub>i</sub></p></td>
<td><p>molar entropy of formation of i-th substance</p></td>
</tr>
<tr>
<td><p>&Delta;<sub>r</sub>&omega;</p></td>
<td><p>change of number of microstates of particles by reaction</p></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
</table>
</html>"));
      end DissociationCoefficient;
    end Sensors;

    package Sources "Chemical sources"
      extends Modelica.Icons.SourcesPackage;

      model PureSubstance "Constant source of pure substance"
        extends Interfaces.PartialSubstance;

        parameter Modelica.SIunits.Temperature Temperature=298.15 "Temperature";
        parameter Modelica.SIunits.Pressure Pressure=101325 "Pressure";
        parameter Modelica.SIunits.ElectricPotential ElectricPotential=0
        "Electric potential";
        parameter Modelica.SIunits.MoleFraction MoleFractionBasedIonicStrength=0
        "Ionic strength";
        parameter Real OtherProperties[stateOfMatter.OtherPropertiesCount]=zeros(stateOfMatter.OtherPropertiesCount)
        "Other extensive properties of the solution";

      equation
        x = 1;

        //the solution
        temperature = Temperature;
        pressure = Pressure;
        electricPotential = ElectricPotential;
        moleFractionBasedIonicStrength = MoleFractionBasedIonicStrength;
        otherProperties = OtherProperties;

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
              graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                pattern=LinePattern.None,
                fillColor={107,45,134},
                fillPattern=FillPattern.Backward),
              Text(
                extent={{10,8},{-90,-92}},
                lineColor={0,0,0},
                textString="pure"),
              Line(
                points={{-62,0},{56,0}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{38,-20},{38,20},{78,0},{38,-20}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-104,-76},{100,-100}},
                lineColor={0,0,0},
                textString="%T K")}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end PureSubstance;

      model ExternalIdealGasSubstance
      "Ideal gas substance with defined partial pressure"
        extends Interfaces.PartialSubstance(redeclare package stateOfMatter =
              Interfaces.IdealGas);

        parameter Boolean usePartialPressureInput = false
        "=true, if fixed partial pressure is from input instead of parameter"
        annotation(Evaluate=true, HideResult=true, choices(checkbox=true),Dialog(group="Conditional inputs"));

        parameter Modelica.SIunits.Pressure PartialPressure=0
        "Fixed partial pressure if usePartialPressureInput=false"
          annotation (HideResult=true, Dialog(enable=not usePartialPressureInput));

        parameter Modelica.SIunits.Pressure TotalPressure=101325
        "Total pressure of the whole gaseous solution";

        parameter Modelica.SIunits.Temperature Temperature=298.15 "Temperature";
        parameter Modelica.SIunits.MoleFraction MoleFractionBasedIonicStrength=0
        "Ionic strength";
        parameter Modelica.SIunits.ElectricPotential ElectricPotential=0
        "Electric potential";

        Modelica.Blocks.Interfaces.RealInput partialPressure(start=
              PartialPressure, final unit="Pa")=p if usePartialPressureInput
        "Partial pressure of gas = total pressure * gas fraction"
          annotation (HideResult=true,Placement(transformation(extent={{-120,-20},{-80,20}})));

        Modelica.SIunits.Pressure p "Current partial pressure";

        parameter Modelica.SIunits.Volume Volume = 0.001
        "Volume of gaseous solution";

        parameter Real OtherProperties[stateOfMatter.OtherPropertiesCount]=zeros(stateOfMatter.OtherPropertiesCount)
        "Other extensive properties of the solution";

      equation
        if not usePartialPressureInput then
          p=PartialPressure;
        end if;

        //mole fraction
        x = p / TotalPressure;

        //the solution
        temperature = Temperature;
        pressure = TotalPressure;
        electricPotential = ElectricPotential;
        moleFractionBasedIonicStrength = 0;
        otherProperties = OtherProperties;

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
              graphics={
              Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              pattern=LinePattern.None,
              fillColor={170,255,255},
              fillPattern=FillPattern.Backward),
              Polygon(
                points={{-100,100},{100,-100},{100,100},{-100,100}},
                fillColor={159,159,223},
                fillPattern=FillPattern.Backward,
                pattern=LinePattern.None,
                lineColor={0,0,0}),
              Text(
                extent={{0,0},{-100,-100}},
                lineColor={0,0,0},
                textString="P,T"),
              Line(
                points={{-62,0},{56,0}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{38,-20},{38,20},{78,0},{38,-20}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-100,-102},{104,-126}},
                lineColor={0,0,0},
                textString="%T K")}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end ExternalIdealGasSubstance;

      model ExternalMolality "Constant source of substance molality"
        extends Interfaces.PartialSubstance;

         parameter Real Molality(final unit="mol/kg") = 1e-8
        "Fixed molality of the substance if useMolalityInput=false"
          annotation (HideResult=true, Dialog(enable=not useMolalityInput));

         parameter Modelica.SIunits.AmountOfSubstance AmountOfSolutionPer1KgSolvent = 55.508
        "Amount of all particles in the solution per one kilogram of solvent";

          parameter Boolean useMolalityInput = false
        "Is amount of substance an input?"
          annotation(Evaluate=true, HideResult=true, choices(checkbox=true),Dialog(group="Conditional inputs"));

        parameter Modelica.SIunits.Temperature Temperature=298.15 "Temperature";
        parameter Modelica.SIunits.Pressure Pressure=101325 "Pressure";
        parameter Modelica.SIunits.MoleFraction MoleFractionBasedIonicStrength=0
        "Ionic strength";
        parameter Modelica.SIunits.ElectricPotential ElectricPotential=0
        "Electric potential";

        parameter Real OtherProperties[stateOfMatter.OtherPropertiesCount]=zeros(stateOfMatter.OtherPropertiesCount)
        "Other extensive properties of the solution";

        Modelica.Blocks.Interfaces.RealInput molalityInput(start=Molality,final unit="mol/kg")=n/KG if
             useMolalityInput
          annotation (HideResult=true, Placement(transformation(extent={{-120,-20},{-80,20}})));

        Modelica.SIunits.AmountOfSubstance n "Current amount of the substance";

      protected
        constant Modelica.SIunits.Mass KG=1;
      equation
         if not useMolalityInput then
           n=Molality*KG;
         end if;

        x = n/AmountOfSolutionPer1KgSolvent;

        //solution properties at the port
        temperature = Temperature;
        pressure = Pressure;
        electricPotential = ElectricPotential;
        moleFractionBasedIonicStrength = MoleFractionBasedIonicStrength;
        otherProperties = OtherProperties;

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
              graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                pattern=LinePattern.None,
                fillColor={107,45,134},
                fillPattern=FillPattern.Backward),
              Line(
                points={{-62,0},{56,0}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{38,-20},{38,20},{78,0},{38,-20}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-104,-76},{100,-100}},
                lineColor={0,0,0},
                textString="%T K"),
              Text(
                extent={{94,-4},{-94,-78}},
                lineColor={0,0,0},
                textString="molality")}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end ExternalMolality;

      model ExternalConcentration "Constant source of molar concentration"
         extends Interfaces.PartialSubstance;

         parameter Real MolarConcentration(final unit="mol/m3", displayUnit="mol/l") = 1e-8
        "Fixed molarity of the substance if useMolarityInput=false"
          annotation (HideResult=true, Dialog(enable=not useMolarityInput));

         parameter Modelica.SIunits.AmountOfSubstance AmountOfSolutionIn1L = 55.508
        "Amount of all particles in the solution one liter of solvent";

          parameter Boolean useMolarityInput = false
        "Is amount of substance an input?"
          annotation(Evaluate=true, HideResult=true, choices(checkbox=true),Dialog(group="Conditional inputs"));

         parameter Modelica.SIunits.Temperature Temperature=298.15 "Temperature";
        parameter Modelica.SIunits.Pressure Pressure=101325 "Pressure";
        parameter Modelica.SIunits.MoleFraction MoleFractionBasedIonicStrength=0
        "Ionic strength";
        parameter Modelica.SIunits.ElectricPotential ElectricPotential=0
        "Electric potential";
        parameter Real OtherProperties[stateOfMatter.OtherPropertiesCount]=zeros(stateOfMatter.OtherPropertiesCount)
        "Other extensive properties of the solution";

        Modelica.Blocks.Interfaces.RealInput molarConcentrationInput(start=MolarConcentration,final unit="mol/m3", displayUnit="mol/l")=n/L if
             useMolarityInput
          annotation (HideResult=true, Placement(transformation(extent={{-120,-20},{-80,20}})));

        Modelica.SIunits.AmountOfSubstance n "Current amount of the substance";

      protected
        constant Modelica.SIunits.Volume L=0.001;
      equation
         if not useMolarityInput then
           n=MolarConcentration*L;
         end if;

        x = n/AmountOfSolutionIn1L;

        //solution properties at the port
        temperature = Temperature;
        pressure = Pressure;
        electricPotential = ElectricPotential;
        moleFractionBasedIonicStrength = MoleFractionBasedIonicStrength;
        otherProperties = OtherProperties;

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
              graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                pattern=LinePattern.None,
                fillColor={107,45,134},
                fillPattern=FillPattern.Backward),
              Text(
                extent={{94,92},{-94,18}},
                lineColor={0,0,0},
                textString="molarity"),
              Line(
                points={{-62,0},{56,0}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{38,-20},{38,20},{78,0},{38,-20}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-104,-76},{100,-100}},
                lineColor={0,0,0},
                textString="%T K")}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end ExternalConcentration;

      model ExternalMoleFraction "Constant source of substance mole fraction"
           extends Interfaces.PartialSubstance;

         parameter Modelica.SIunits.MoleFraction MoleFraction = 1e-8
        "Fixed mole fraction of the substance if useMoleFractionInput=false"
          annotation (HideResult=true, Dialog(enable=not useMoleFractionInput));

          parameter Boolean useMoleFractionInput = false
        "Is mole fraction of the substance an input?"
          annotation(Evaluate=true, HideResult=true, choices(checkbox=true),Dialog(group="Conditional inputs"));

        parameter Modelica.SIunits.Temperature Temperature=298.15 "Temperature";
        parameter Modelica.SIunits.Pressure Pressure=101325 "Pressure";
        parameter Modelica.SIunits.MoleFraction MoleFractionBasedIonicStrength=0
        "Ionic strength";
        parameter Modelica.SIunits.ElectricPotential ElectricPotential=0
        "Electric potential";
        parameter Real OtherProperties[stateOfMatter.OtherPropertiesCount]=zeros(stateOfMatter.OtherPropertiesCount)
        "Other extensive properties of the solution";

        Modelica.Blocks.Interfaces.RealInput moleFractionInput(
          final unit="mol/mol",
          start=MoleFraction)=x if
             useMoleFractionInput annotation (HideResult=true, Placement(transformation(
                extent={{-120,-20},{-80,20}})));

      equation
         if not useMoleFractionInput then
           x=MoleFraction;
         end if;

        //solution properties at the port
        temperature = Temperature;
        pressure = Pressure;
        electricPotential = ElectricPotential;
        moleFractionBasedIonicStrength = MoleFractionBasedIonicStrength;
        otherProperties = OtherProperties;

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
              graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                pattern=LinePattern.None,
                fillColor={107,45,134},
                fillPattern=FillPattern.Backward),
              Line(
                points={{-62,0},{56,0}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{38,-20},{38,20},{78,0},{38,-20}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-104,-76},{100,-100}},
                lineColor={0,0,0},
                textString="%T K"),
              Text(
                extent={{94,-4},{-94,-78}},
                lineColor={0,0,0},
                textString="n")}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end ExternalMoleFraction;

      model ExternalElectroChemicalPotential
      "Constant source of electro-chemical potential"

         parameter Modelica.SIunits.ChemicalPotential U = 1e-8
        "Fixed electro-chemical potential of the substance if usePotentialInput=false"
          annotation (HideResult=true, Dialog(enable=not usePotentialInput));

         parameter Boolean usePotentialInput = false
        "Is electro-chemical potential of the substance an input?"
          annotation(Evaluate=true, HideResult=true, choices(checkbox=true),Dialog(group="Conditional inputs"));

        Modelica.Blocks.Interfaces.RealInput uInput(final unit="J/mol")=port_a.u if
             usePotentialInput annotation (HideResult=true, Placement(transformation(
                extent={{-120,-20},{-80,20}})));

      Interfaces.SubstancePort_a port_a
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      equation
         if not usePotentialInput then
           port_a.u=U;
         end if;

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
              graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                pattern=LinePattern.None,
                fillColor={107,45,134},
                fillPattern=FillPattern.Backward),
              Line(
                points={{-62,0},{56,0}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{38,-20},{38,20},{78,0},{38,-20}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-104,-76},{100,-100}},
                lineColor={0,0,0},
                textString="%T K"),
              Text(
                extent={{94,-4},{-94,-78}},
                lineColor={0,0,0},
                textString="molality")}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end ExternalElectroChemicalPotential;

      model SubstanceInflow "Molar pump of substance to system"
        extends Interfaces.ConditionalSubstanceFlow;

      Interfaces.SubstancePort_b port_b "Outflow"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));

      equation
        port_b.q = - q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-42},{100,40}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-48,20},{50,0},{-48,-21},{-48,20}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-82,-82},{90,-58}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end SubstanceInflow;

      model SubstanceOutflow "Molar pump of substance out of system"
        extends Interfaces.ConditionalSubstanceFlow;

      Interfaces.SubstancePort_b port_a "Inflow"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

      equation
        port_a.q = q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-42},{100,40}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-48,20},{50,0},{-48,-21},{-48,20}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-82,-82},{90,-58}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end SubstanceOutflow;

      model Clearance "Physiological Clearance"
       extends Interfaces.ConditionalSolutionFlow(final SolutionFlow=Clearance/K);
       extends Interfaces.PartialSubstanceSensor;

        parameter Modelica.SIunits.VolumeFlowRate Clearance=0
        "Physiological clearance of the substance if useSolutionFlowInput=false"
          annotation (HideResult=true, Dialog(enable=not useSolutionFlowInput));

        parameter Real K(unit="1")=1
        "Coefficient such that Clearance = K*solutionFlow";

        Modelica.SIunits.MolarFlowRate molarClearance "Current molar clearance";

      equation
        molarClearance = q*K;

        port_a.q = molarClearance * x;

        assert(molarClearance>=-Modelica.Constants.eps, "Clearance can not be negative!");

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                              graphics={
              Rectangle(
                extent={{-100,-100},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{80,25},{-80,0},{80,-25},{80,25}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,-90},{150,-50}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-100,-30},{100,-50}},
                lineColor={0,0,0},
                textString="K=%K")}),        Documentation(revisions="<html>
<p><i>2017-2018 by </i>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end Clearance;

      model Degradation "Degradation of the substance"
        extends Interfaces.PartialSubstanceSensor;

        parameter Modelica.SIunits.Time HalfTime
        "Degradation half time. The time after which will remain half of initial concentration in the defined volume when no other generation, clearence and degradation exist.";

      equation
        port_a.q = (Modelica.Math.log(2)/HalfTime)*x*amountOfSolution;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                              graphics={
              Rectangle(
                extent={{-100,-100},{100,58}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{64,26},{-78,0},{64,-26},{64,26}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-148,-82},{152,-42}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-100,54},{100,28}},
                lineColor={0,0,0},
                textString="t1/2 = %HalfTime s"),
              Polygon(
                points={{54,24},{54,-24},{44,-22},{44,22},{54,24}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{30,20},{30,-20},{20,-18},{20,18},{30,20}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{8,16},{8,-16},{-2,-14},{-2,14},{8,16}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-12,12},{-12,-12},{-22,-10},{-22,10},{-12,12}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-34,8},{-34,-8},{-44,-6},{-44,6},{-34,8}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-56,4},{-56,-4},{-66,-2},{-66,2},{-56,4}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)}),
          Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>Date of:</td>
<td>2017-2018</td>
</tr>
</table>
</html>"));
      end Degradation;

      model Buffer
      "Source of substance bounded to constant amount of buffer to reach linear dependence between concentration and electrochemical potential"
        extends Icons.Buffer;
             extends Interfaces.PartialSubstanceInSolution(a(start = a_start));

           parameter Modelica.SIunits.MoleFraction a_start=1e-7
        "Initial value of mole fraction of the buffered substance";

           parameter Modelica.SIunits.AmountOfSubstance BufferValue = 0.001
        "Fixed buffer value (slope between amount of buffered substance and -log10(activity)) if useBufferValueInput=false"
            annotation (HideResult=true, Dialog(enable=not useMoleFractionInput));

           parameter Boolean useBufferValueInput = false
        "Is buffer value of the substance an input?"
            annotation(Evaluate=true, HideResult=true, choices(checkbox=true),Dialog(group="Conditional inputs"));

            extends Interfaces.ConditionalKinetics(KC=1/(Modelica.Constants.R*298.15));

            Real bufferValue(final unit="1");

          Modelica.Blocks.Interfaces.RealInput bufferValueInput(
            final unit="mol/mol",
            start=BufferValue)=bufferValue if
               useBufferValueInput annotation (HideResult=true, Placement(transformation(
                  extent={{-120,-20},{-80,20}})));

            Real xref;
          Modelica.SIunits.AmountOfSubstance nFreeBuffer(start=-log10(a_start)*BufferValue);
          Modelica.SIunits.MoleFraction xFreeBuffer;

      protected
          constant Real InvLog_10=1/log(10);
      initial equation
          xFreeBuffer = -log10(a_start)*(bufferValue/solution.n);

      equation
          if not useBufferValueInput then
            bufferValue = BufferValue;
          end if;

          der(nFreeBuffer) = -port_a.q;
          // <- This is mathematically the same as two following lines. However, the differential solvers can handle the log10n much better. :-)
          //der(log10nFreeBuffer)=(InvLog_10)*(port_a.q/nFreeBuffer);
          //nFreeBuffer = 10^log10nFreeBuffer;

          xFreeBuffer = nFreeBuffer/solution.n;
         // port_a.q = (solution.n*KC)*(xFreeBuffer - xref);
          port_a.q = KC*(Modelica.Constants.R*solution.T*log(xFreeBuffer) - Modelica.Constants.R*solution.T*log(xref)); //alternative kinetics
          xref = -log10(a)*(bufferValue/solution.n);

        //solution flows
        solution.dH = molarEnthalpy*port_a.q - der(molarEnthalpy)*nFreeBuffer;
        solution.i = Modelica.Constants.F * z * port_a.q - Modelica.Constants.F*der(z)*nFreeBuffer;
        solution.dV = molarVolume * port_a.q - der(molarVolume)*nFreeBuffer;

        //extensive properties
        solution.nj=0;
        solution.mj=-nFreeBuffer*molarMass;
        solution.Vj=-nFreeBuffer*molarVolume;
        solution.Gj=-nFreeBuffer*port_a.u;
        solution.Qj=-Modelica.Constants.F*nFreeBuffer*z;
        solution.Ij=-(1/2) * ( nFreeBuffer * z^2);
        solution.otherPropertiesOfSubstance=-nFreeBuffer*otherPropertiesPerSubstance;

          annotation ( Icon(coordinateSystem(
                  preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                graphics={
                Text(
                  extent={{-82,62},{92,24}},
                  textString="%name",
                  lineColor={0,0,255})}),
            Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end Buffer;
    end Sources;

    package Interfaces "Chemical interfaces"
      extends Modelica.Icons.InterfacesPackage;

      connector SubstancePort
      "Electro-chemical potential and molar change of the substance in the solution"

        Modelica.SIunits.ChemicalPotential u
        "Electro-chemical potential of the substance in the solution";

        flow Modelica.SIunits.MolarFlowRate q "Molar change of the substance";

        annotation (Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",       info="<html>
<p>Definition of electro-chemical potential of the substance:</p>
<h4>u(x,T,v) = u&deg;(T) + R*T*ln(gamma*x) + z*F*v</h4>
<h4>u&deg;(T) = DfG(T) = DfH - T * DfS</h4>
<p>where</p>
<p>x .. mole fraction of the substance in the solution</p>
<p>T .. temperature in Kelvins</p>
<p>v .. eletric potential of the solution</p>
<p>z .. elementary charge of the substance (like -1 for electron, +2 for Ca^2+)</p>
<p>R .. gas constant</p>
<p>F .. Faraday constant</p>
<p>gamma .. activity coefficient</p>
<p>u&deg;(T) .. chemical potential of pure substance</p>
<p>DfG(T) .. free Gibbs energy of formation of the substance at current temperature T. </p>
<p>DfH .. free enthalpy of formation of the substance</p>
<p>DfS .. free entropy of formation of the substance </p>
<p><br>Be carefull, DfS is not the same as absolute entropy of the substance S&deg; from III. thermodinamic law! It must be calculated from tabulated value of DfG(298.15 K) and DfH as DfS=(DfH - DfG)/298.15. </p>
</html>"));
      end SubstancePort;

      connector SubstancePort_a
      "Electro-chemical potential and molar flow of the substance in the solution"
        extends SubstancePort;

      annotation (
          defaultComponentName="port_a",
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                  100}}),     graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={158,66,200}),Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={158,66,200},
                fillColor={158,66,200},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
              graphics={Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={158,66,200},
                fillColor={158,66,200},
                fillPattern=FillPattern.Solid,
                lineThickness=1),
         Text(extent = {{-160,110},{40,50}}, lineColor={172,72,218},   textString = "%name")}),
          Documentation(info="<html>
<p>Chemical port with internal definition of the substance inside the component. </p>
</html>", revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end SubstancePort_a;

      connector SubstancePort_b
      "Electro-chemical potential and molar flow of the substance in the solution"
        extends SubstancePort;

      annotation (
          defaultComponentName="port_b",
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                  100}}),     graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={158,66,200}),Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={158,66,200},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
              graphics={Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={158,66,200},
                lineThickness=1,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
         Text(extent = {{-160,110},{40,50}}, lineColor={172,72,218},   textString = "%name")}),
          Documentation(info="<html>
<p>Chemical port with external definition of the substance outside the component.</p>
</html>", revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end SubstancePort_b;

      connector SubstancePorts_a
        extends SubstancePort;
        annotation (
           defaultComponentName="ports_a",
           Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-50,-200},{50,200}},
              initialScale=0.2),graphics={
              Text(extent={{-73,130},{77,100}}, textString="%name"),
              Rectangle(
                extent={{25,-100},{-25,100}},
                lineColor={158,66,200}),
                        Rectangle(
                extent={{-20,20},{20,-20}},
                lineColor={158,66,200},
                lineThickness=1),
                        Rectangle(
                extent={{-20,90},{20,50}},
                lineColor={158,66,200},
                lineThickness=1),
                        Rectangle(
                extent={{-20,-52},{20,-90}},
                lineColor={158,66,200},
                lineThickness=1)}),
                 Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-50,-200},{50,200}},
              initialScale=0.2),graphics={
              Rectangle(
                extent={{50,-200},{-50,200}},
                lineColor={158,66,200},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
                                        Rectangle(
                extent={{-40,38},{40,-42}},
                lineColor={158,66,200},
                fillColor={158,66,200},
                fillPattern=FillPattern.Solid),
                                        Rectangle(
                extent={{-40,170},{40,90}},
                lineColor={158,66,200},
                fillColor={158,66,200},
                fillPattern=FillPattern.Solid),
                                        Rectangle(
                extent={{-40,-92},{40,-172}},
                lineColor={158,66,200},
                fillColor={158,66,200},
                fillPattern=FillPattern.Solid)}));

      end SubstancePorts_a;

      connector SubstancePorts_b
        extends SubstancePort;
        annotation (
           defaultComponentName="ports_b",
           Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-50,-200},{50,200}},
              initialScale=0.2),graphics={
              Text(extent={{-73,130},{77,100}}, textString="%name"),
              Rectangle(
                extent={{25,-100},{-25,100}},
                lineColor={158,66,200}),
                        Rectangle(
                extent={{-20,20},{20,-20}},
                lineColor={158,66,200},
                lineThickness=1),
                        Rectangle(
                extent={{-20,90},{20,50}},
                lineColor={158,66,200},
                lineThickness=1),
                        Rectangle(
                extent={{-20,-52},{20,-90}},
                lineColor={158,66,200},
                lineThickness=1)}),
                 Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-50,-200},{50,200}},
              initialScale=0.2),graphics={
              Rectangle(
                extent={{50,-200},{-50,200}},
                lineColor={158,66,200},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
                                        Rectangle(
                extent={{-40,38},{40,-42}},
                lineColor={158,66,200}),Rectangle(
                extent={{-40,170},{40,90}},
                lineColor={158,66,200}),Rectangle(
                extent={{-40,-92},{40,-172}},
                lineColor={158,66,200})}));

      end SubstancePorts_b;

      partial model PartialSubstance

      SubstancePort_a port_a "The substance"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));

        replaceable package stateOfMatter = Incompressible                    constrainedby
          StateOfMatter
        "Substance model to translate data into substance properties"
           annotation (choicesAllMatching = true);

        parameter stateOfMatter.SubstanceData substanceData
        "Definition of the substance"
           annotation (choicesAllMatching = true);

        Modelica.SIunits.MoleFraction x "Mole fraction of the substance";

        Modelica.SIunits.ActivityOfSolute a
        "Activity of the substance (mole-fraction based)";

      protected
        Modelica.SIunits.ActivityCoefficient gamma
        "Activity coefficient of the substance";

        Modelica.SIunits.ChargeNumberOfIon z "Charge number of ion";

        Modelica.SIunits.Temperature temperature(start=298.15)
        "Temperature of the solution";

        Modelica.SIunits.Pressure pressure(start=100000)
        "Pressure of the solution";

        Modelica.SIunits.ElectricPotential electricPotential(start=0)
        "Electric potential of the solution";

        Modelica.SIunits.MoleFraction moleFractionBasedIonicStrength(start=0)
        "Ionic strength of the solution";

        Modelica.SIunits.MolarMass molarMass "Molar mass of the substance";

        Modelica.SIunits.MolarEnthalpy molarEnthalpy
        "Molar enthalpy of the substance";

        Modelica.SIunits.MolarEntropy molarEntropyPure
        "Molar entropy of the pure substance";

        Modelica.SIunits.ChemicalPotential u0
        "Chemical potential of the pure substance";

        Modelica.SIunits.ChemicalPotential uPure
        "Electro-Chemical potential of the pure substance";

        Modelica.SIunits.MolarVolume molarVolume "Molar volume of the substance";

        Modelica.SIunits.MolarVolume molarVolumePure
        "Molar volume of the pure substance";

        Modelica.SIunits.MolarVolume molarVolumeExcess
        "Molar volume excess of the substance in solution (typically it is negative as can be negative)";

      //  Modelica.SIunits.MolarHeatCapacity molarHeatCapacityCp
      //    "Molar heat capacity of the substance at constant pressure";

        Real otherProperties[stateOfMatter.OtherPropertiesCount];
        Real otherPropertiesPerSubstance[stateOfMatter.OtherPropertiesCount];

      equation
        //aliases
        gamma = stateOfMatter.activityCoefficient(substanceData,temperature,pressure,electricPotential,moleFractionBasedIonicStrength,otherProperties);
        z = stateOfMatter.chargeNumberOfIon(substanceData,temperature,pressure,electricPotential,moleFractionBasedIonicStrength,otherProperties);
        molarMass = stateOfMatter.molarMass(substanceData,temperature,pressure,electricPotential,moleFractionBasedIonicStrength,otherProperties);

        molarEnthalpy = stateOfMatter.molarEnthalpy(substanceData,temperature,pressure,electricPotential,moleFractionBasedIonicStrength,otherProperties);
        molarEntropyPure = stateOfMatter.molarEntropyPure(substanceData,temperature,pressure,electricPotential,moleFractionBasedIonicStrength,otherProperties);
        u0 = stateOfMatter.chemicalPotentialPure(
          substanceData,
          temperature,
          pressure,
          electricPotential,
          moleFractionBasedIonicStrength,otherProperties);
        uPure = stateOfMatter.electroChemicalPotentialPure(
          substanceData,
          temperature,
          pressure,
          electricPotential,
          moleFractionBasedIonicStrength,otherProperties);
        molarVolume = stateOfMatter.molarVolume(substanceData,temperature,pressure,electricPotential,moleFractionBasedIonicStrength,otherProperties);
        molarVolumePure = stateOfMatter.molarVolumePure(substanceData,temperature,pressure,electricPotential,moleFractionBasedIonicStrength,otherProperties);
        molarVolumeExcess = stateOfMatter.molarVolumeExcess(substanceData,temperature,pressure,electricPotential,moleFractionBasedIonicStrength,otherProperties);
        //  molarHeatCapacityCp = stateOfMatter.molarHeatCapacityCp(substanceData,temperature,pressure,electricPotential,moleFractionBasedIonicStrength,otherProperties);
        otherPropertiesPerSubstance = stateOfMatter.otherPropertiesPerSubstance(substanceData,temperature,pressure,electricPotential,moleFractionBasedIonicStrength);

        //activity of the substance
        a = gamma*x;

        //electro-chemical potential of the substance in the solution
        port_a.u = stateOfMatter.chemicalPotentialPure(
          substanceData,
          temperature,
          pressure,
          electricPotential,
          moleFractionBasedIonicStrength,otherProperties)
          + Modelica.Constants.R*temperature*log(a)
          + z*Modelica.Constants.F*electricPotential;

        annotation (
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"),experiment);
      end PartialSubstance;

      partial model PartialSubstanceInSolution
      "Substance properties for components, where the substance is connected with the solution"

        SolutionPort            solution(redeclare package stateOfMatter =
              stateOfMatter)
        "To connect substance with solution, where is pressented"                                  annotation (Placement(transformation(
                extent={{-70,-110},{-50,-90}}),iconTransformation(extent={{-70,-110},{
                  -50,-90}})));

        extends PartialSubstance;

      protected
         Modelica.SIunits.AmountOfSubstance amountOfSolution
        "Amount of all solution particles";

      equation
        //aliases
        temperature = solution.T;
        pressure = solution.p;
        electricPotential = solution.v;
        amountOfSolution = solution.n;
        moleFractionBasedIonicStrength = solution.I;
        otherProperties = solution.otherProperties;

      end PartialSubstanceInSolution;

      partial model PartialSubstanceSensor
      "Base class for sensor based on substance and solution properties"
        extends PartialSubstanceInSolution;

      equation
        //solution is not changed by the sensor components
        solution.dH = 0;
        solution.i = 0;
        solution.dV = 0;
        solution.Gj = 0;
        solution.nj = 0;
        solution.mj = 0;
        solution.Qj = 0;
        solution.Ij = 0;
        solution.Vj = 0;
        solution.otherPropertiesOfSubstance = zeros(stateOfMatter.OtherPropertiesCount);
      end PartialSubstanceSensor;

      partial package StateOfMatter "Abstract package for all state of matters"

       replaceable record SubstanceData
        "Definition data of the chemical substance"

       end SubstanceData;

       constant Integer OtherPropertiesCount=0
        "Number of other extensive properties";

       replaceable function activityCoefficient
        "Return activity coefficient of the substance in the solution"
          extends Modelica.Icons.Function;
          input SubstanceData substanceData "Data record of substance";
          input Modelica.SIunits.Temperature T=298.15 "Temperature";
          input Modelica.SIunits.Pressure p=100000 "Pressure";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          input Real r[OtherPropertiesCount]=zeros(OtherPropertiesCount)
          "Other extensive properties of the solution";
          output Real activityCoefficient "Activity Coefficient";
       end activityCoefficient;

       replaceable function chargeNumberOfIon
        "Return charge number of the substance in the solution"
          extends Modelica.Icons.Function;
          input SubstanceData substanceData "Data record of substance";
          input Modelica.SIunits.Temperature T=298.15 "Temperature";
          input Modelica.SIunits.Pressure p=100000 "Pressure";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          input Real r[OtherPropertiesCount]=zeros(OtherPropertiesCount)
          "Other extensive properties of the solution";
          output Modelica.SIunits.ChargeNumberOfIon chargeNumberOfIon
          "Charge number of ion";
       end chargeNumberOfIon;

       replaceable function molarEnthalpyElectroneutral
        "Molar enthalpy of the substance in electroneutral solution"
          extends Modelica.Icons.Function;
          input SubstanceData substanceData "Data record of substance";
          input Modelica.SIunits.Temperature T=298.15 "Temperature";
          input Modelica.SIunits.Pressure p=100000 "Pressure";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          input Real r[OtherPropertiesCount]=zeros(OtherPropertiesCount)
          "Other extensive properties of the solution";
          output Modelica.SIunits.MolarEnthalpy molarEnthalpyElectroneutral
          "Molar enthalpy";
       end molarEnthalpyElectroneutral;

       function molarEnthalpy
        "Molar enthalpy of the substance with electric potential dependence"
          extends Modelica.Icons.Function;
          input SubstanceData substanceData "Data record of substance";
          input Modelica.SIunits.Temperature T=298.15 "Temperature";
          input Modelica.SIunits.Pressure p=100000 "Pressure";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          input Real r[OtherPropertiesCount]=zeros(OtherPropertiesCount)
          "Other extensive properties of the solution";
          output Modelica.SIunits.MolarEnthalpy molarEnthalpy "Molar enthalpy";
       algorithm
          molarEnthalpy := molarEnthalpyElectroneutral(substanceData,T,p,v,I,r) +
               Modelica.Constants.F*chargeNumberOfIon(substanceData,T,p,v,I,r)*v;
       end molarEnthalpy;

       replaceable function molarEntropyPure
        "Molar entropy of the pure substance"
          extends Modelica.Icons.Function;
          input SubstanceData substanceData "Data record of substance";
          input Modelica.SIunits.Temperature T=298.15 "Temperature";
          input Modelica.SIunits.Pressure p=100000 "Pressure";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          input Real r[OtherPropertiesCount]=zeros(OtherPropertiesCount)
          "Other extensive properties of the solution";
          output Modelica.SIunits.MolarEntropy molarEntropyPure
          "Molar entropy of the pure substance";
       end molarEntropyPure;

        function molarEntropy "Molar entropy of the substance in the solution"
              extends Modelica.Icons.Function;
              input Modelica.SIunits.ChemicalPotential u
          "Electro-chemical potential of the substance";
              input SubstanceData substanceData "Data record of substance";
              input Modelica.SIunits.Temperature T=298.15 "Temperature";
              input Modelica.SIunits.Pressure p=100000 "Pressure";
              input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
              input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
              input Real r[OtherPropertiesCount]=zeros(OtherPropertiesCount)
          "Other extensive properties of the solution";
              output Modelica.SIunits.MolarEntropy molarEntropy "Molar entropy";
        algorithm
            molarEntropy :=  (u - molarEnthalpy(substanceData,T,p,v,I,r))/T;
        end molarEntropy;

       function chemicalPotentialPure "Chemical potential of the pure substance"
          extends Modelica.Icons.Function;
          input SubstanceData substanceData "Data record of substance";
          input Modelica.SIunits.Temperature T=298.15 "Temperature";
          input Modelica.SIunits.Pressure p=100000 "Pressure";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          input Real r[OtherPropertiesCount]=zeros(OtherPropertiesCount)
          "Other extensive properties of the solution";
          output Modelica.SIunits.ChemicalPotential chemicalPotentialPure
          "Base chemical potential";
       algorithm
           chemicalPotentialPure :=  molarEnthalpyElectroneutral(substanceData,T,p,v,I,r) - T*molarEntropyPure(substanceData,T,p,v,I,r);
       end chemicalPotentialPure;

       function electroChemicalPotentialPure
        "Electro-chemical potential of the pure substance"
          extends Modelica.Icons.Function;
          input SubstanceData substanceData "Data record of substance";
          input Modelica.SIunits.Temperature T=298.15 "Temperature";
          input Modelica.SIunits.Pressure p=100000 "Pressure";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          input Real r[OtherPropertiesCount]=zeros(OtherPropertiesCount)
          "Other extensive properties of the solution";
          output Modelica.SIunits.ChemicalPotential electroChemicalPotentialPure
          "Base electro-chemical potential";
       algorithm
        electroChemicalPotentialPure := chemicalPotentialPure(
             substanceData,
             T,
             p,
             v,
             I,r) + Modelica.Constants.F*chargeNumberOfIon(substanceData,T,p,v,I,r)*v;
       end electroChemicalPotentialPure;

       replaceable function molarMass "Molar mass of the substance"
          extends Modelica.Icons.Function;
          input SubstanceData substanceData "Data record of substance";
          input Modelica.SIunits.Temperature T=298.15 "Temperature";
          input Modelica.SIunits.Pressure p=100000 "Pressure";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          input Real r[OtherPropertiesCount]=zeros(OtherPropertiesCount)
          "Other extensive properties of the solution";
          output Modelica.SIunits.MolarMass molarMass "Molar mass";
       end molarMass;

       replaceable function molarVolumePure "Molar volume of the pure substance"
          extends Modelica.Icons.Function;
          input SubstanceData substanceData "Data record of substance";
          input Modelica.SIunits.Temperature T=298.15 "Temperature";
          input Modelica.SIunits.Pressure p=100000 "Pressure";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          input Real r[OtherPropertiesCount]=zeros(OtherPropertiesCount)
          "Other extensive properties of the solution";
          output Modelica.SIunits.MolarVolume molarVolumePure "Molar volume";
       end molarVolumePure;

       function molarVolumeExcess
        "Excess molar volume of the substance in the solution"
          extends Modelica.Icons.Function;
          input SubstanceData substanceData "Data record of substance";
          input Modelica.SIunits.Temperature T=298.15 "Temperature";
          input Modelica.SIunits.Pressure p=100000 "Pressure";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          input Real r[OtherPropertiesCount]=zeros(OtherPropertiesCount)
          "Other extensive properties of the solution";
          output Modelica.SIunits.MolarVolume molarVolumeExcess
          "Excess molar volume of the substance in the solution";
       algorithm
          molarVolumeExcess := molarVolumePure(substanceData,T,p,v,I,r)*
             log(activityCoefficient(substanceData,T,p,v,I,r)); //zero if activityCoefficient==1
       end molarVolumeExcess;

       replaceable function molarVolume "Molar volume of the substance"
          extends Modelica.Icons.Function;
          input SubstanceData substanceData "Data record of substance";
          input Modelica.SIunits.Temperature T=298.15 "Temperature";
          input Modelica.SIunits.Pressure p=100000 "Pressure";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          input Real r[OtherPropertiesCount]=zeros(OtherPropertiesCount)
          "Other extensive properties of the solution";

          output Modelica.SIunits.MolarVolume molarVolume "Molar volume";
       algorithm
        molarVolume :=molarVolumePure(
             substanceData,
             T,
             p,
             v,
             I,r) + molarVolumeExcess(
             substanceData,
             T,
             p,
             v,
             I,r);
       end molarVolume;

       replaceable function molarHeatCapacityCp
        "Molar heat capacity at constant pressure"
          extends Modelica.Icons.Function;
          input SubstanceData substanceData "Data record of substance";
          input Modelica.SIunits.Temperature T=298.15 "Temperature";
          input Modelica.SIunits.Pressure p=100000 "Pressure";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          input Real r[OtherPropertiesCount]=zeros(OtherPropertiesCount)
          "Other extensive properties of the solution";
          output Modelica.SIunits.MolarHeatCapacity molarHeatCapacityCp
          "Molar heat capacity at constant pressure";
       end molarHeatCapacityCp;

        replaceable function molarHeatCapacityCv
        "Molar heat capacity at constant volume"
          extends Modelica.Icons.Function;
          input SubstanceData substanceData "Data record of substance";
          input Modelica.SIunits.Temperature T=298.15 "Temperature";
          input Modelica.SIunits.Pressure p=100000 "Pressure";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          input Real r[OtherPropertiesCount]=zeros(OtherPropertiesCount)
          "Other extensive properties of the solution";
          output Modelica.SIunits.MolarHeatCapacity molarHeatCapacityCv
          "Molar heat capacity at constant volume";
        end molarHeatCapacityCv;

        replaceable function otherPropertiesPerSubstance
        "Other extensive properties of the substance in the solution per one mol of the substance"
          extends Modelica.Icons.Function;
          input SubstanceData substanceData "Data record of substance";
          input Modelica.SIunits.Temperature T=298.15 "Temperature";
          input Modelica.SIunits.Pressure p=100000 "Pressure";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the substance";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          output Real rj[OtherPropertiesCount] = zeros(OtherPropertiesCount)
          "Properties of the substance";
        algorithm
        end otherPropertiesPerSubstance;

        annotation (Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end StateOfMatter;

      package IdealGas "Ideal gas with constant heat capacity"
         extends StateOfMatter;

         redeclare replaceable record extends SubstanceData "Base substance data"

            parameter Modelica.SIunits.MolarMass MolarWeight(displayUnit="kDa")=0.01801528
          "Molar weight of the substance in kg/mol or kDa";

            parameter Modelica.SIunits.ChargeNumberOfIon z=0
          "Charge number of the substance (e.g. 0..uncharged, -1..electron, +2..Ca^2+)";

            parameter Modelica.SIunits.MolarEnergy DfH_25degC(displayUnit="kJ/mol")=0
          "Enthalpy of formation of the substance at 25 degC";

            parameter Modelica.SIunits.MolarEnergy DfG_25degC_1bar(displayUnit="kJ/mol")=0
          "Gibbs enerfy of formation of the substance at 25 degC,1bar";

            parameter Modelica.SIunits.ActivityCoefficient gamma=1
          "Activity coefficient of the substance";

            parameter Modelica.SIunits.MolarHeatCapacity Cp = 33.6
          "Molar heat capacity of the substance";

            parameter String References[:]={""}
          "References of these thermodynamical values";

          annotation (Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
         end SubstanceData;

       redeclare function extends activityCoefficient
        "Return activity coefficient of the substance in the solution"
       algorithm
           activityCoefficient := substanceData.gamma;
       end activityCoefficient;

       redeclare function extends chargeNumberOfIon
        "Return charge number of the substance in the solution"
       algorithm
          chargeNumberOfIon := substanceData.z;
       end chargeNumberOfIon;

       redeclare function extends molarEnthalpyElectroneutral
        "Molar enthalpy of the pure substance in electroneutral solution"
       algorithm
           //Molar enthalpy:
           // - temperature shift: to reach internal energy change by added heat (at constant amount of substance) dU = n*(dH-d(p*Vm)) = n*(dH - R*dT)
           //   where molar heat capacity at constant volume is Cv = dU/(n*dT) = dH/dT - R. As a result dH = dT*(Cv+R) for ideal gas.
           //   And the relation with molar heat capacity at constant pressure as Cp=Cv+R makes dH = dT*Cp.
           molarEnthalpyElectroneutral := substanceData.DfH_25degC
             +(T-298.15)*(substanceData.Cp);
       end molarEnthalpyElectroneutral;

       redeclare function extends molarEntropyPure
        "Molar entropy of the pure substance"
       algorithm
         //molarEntropyPure := ((substanceData.DfH - substanceData.DfG_25degC_1bar)/298.15)
         //+ (substanceData.Cp+Modelica.Constants.R)*log(T/298.15);

           //Molar entropy:
           // - temperature shift: to reach the definition of heat capacity at constant pressure Cp*dT = T*dS (small amount of added heat energy)
           // - pressure shift: to reach the ideal gas equation at constant temperature Vm*dP = -T*dS (small amount of work)
           molarEntropyPure := (substanceData.Cp)*log(T/298.15) - Modelica.Constants.R*log(p/100000) + ((substanceData.DfH_25degC
            - substanceData.DfG_25degC_1bar)/298.15);

           //For example at triple point of water should be T=273K, p=611.657Pa, DfH(l)-DfH(g)=44 kJ/mol and S(l)-s(g)=-166 J/mol/K
           //At T=298K, p=1bar, DfH(l)-DfH(g)=44 kJ/mol and S(l)-s(g)=-119 J/mol/K
       end molarEntropyPure;

       redeclare function extends molarMass "Molar mass of the substance"
       algorithm
           molarMass := substanceData.MolarWeight;
       end molarMass;

       redeclare function extends molarVolumePure
        "Molar volume of the pure substance"
       algorithm
           molarVolumePure := Modelica.Constants.R*T/p; //ideal gas
       end molarVolumePure;

       redeclare function extends molarHeatCapacityCp
        "Molar heat capacity of the substance at constant pressure"
       algorithm
           molarHeatCapacityCp := substanceData.Cp;
       end molarHeatCapacityCp;

       redeclare function extends molarHeatCapacityCv
        "Molar heat capacity of the substance at constant volume"
       algorithm
           molarHeatCapacityCv := substanceData.Cp - Modelica.Constants.R;
       end molarHeatCapacityCv;

        annotation (Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end IdealGas;

      package IdealGasShomate "Ideal gas based on Shomate equations"
         extends StateOfMatter;

       redeclare replaceable record extends SubstanceData
        "Base substance data based on Shomate equations http://old.vscht.cz/fch/cz/pomucky/fchab/Shomate.html"

            parameter Modelica.SIunits.MolarMass MolarWeight(displayUnit="kDa")=0.01801528
          "Molar weight of the substance in kg/mol or kDa";

            parameter Modelica.SIunits.ChargeNumberOfIon z=0
          "Charge number of the substance (e.g. 0..uncharged, -1..electron, +2..Ca^2+)";

            parameter Modelica.SIunits.MolarEnergy DfH_25degC(displayUnit="kJ/mol")=0
          "Enthalpy of formation of the substance at 25 degC";

            parameter Modelica.SIunits.MolarEnergy DfG_25degC_1bar(displayUnit="kJ/mol")=0
          "Gibbs enerfy of formation of the substance at 25 degC,1bar";

            parameter Modelica.SIunits.ActivityCoefficient gamma=1
          "Activity coefficient of the substance";

            parameter Real cp_25degC(unit="J.K-1.mol-1") = 33.6
          "Heat capacity at 25 degC";

            parameter Real B(unit="J.mol-1")=0 "Shomate parameter B";
            parameter Real C(unit="J.mol-1")=0 "Shomate parameter C";
            parameter Real D(unit="J.K.mol-1")=0 "Shomate parameter D";
            parameter Real E(unit="J.K2.mol-1")=0 "Shomate parameter E";
            parameter Real X=0 "Shomate parameter X";
            parameter Real A_(unit="J.K-1.mol-1")=0 "Shomate parameter A'";
            parameter Real E_(unit="K")=1e-8 "Shomate parameter E'";

            parameter String References[:]={"http://old.vscht.cz/fch/cz/pomucky/fchab/Shomate.html"}
          "References of these thermodynamical values";
          annotation (Documentation(revisions="<html>
<p><i>2017</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
       end SubstanceData;

       redeclare function extends activityCoefficient
        "Return activity coefficient of the substance in the solution"
       algorithm
           activityCoefficient := substanceData.gamma;
       end activityCoefficient;

       redeclare function extends chargeNumberOfIon
        "Return charge number of the substance in the solution"
       algorithm
          chargeNumberOfIon := substanceData.z;
       end chargeNumberOfIon;

       redeclare function extends molarEnthalpyElectroneutral
        "Molar enthalpy of the pure substance in electroneutral solution, where der(Hm)=cp*der(T)"
        protected
         parameter Real T0=298.15;
         Real t=T/1000;
         parameter Real A=substanceData.cp_25degC
           - ((10^6 * substanceData.A_* exp(1000*substanceData.E_)/T0)) / ((-1 + exp((1000*substanceData.E_)/T0))^2 * T0^2)
           - (10^6 * substanceData.E)/T0^2 - 0.001*substanceData.B*T0 - 10^(-6) * substanceData.C * T0^2
           - 10^(-9) * substanceData.D * T0^3 - sqrt(1/1000)* T0^0.5 * substanceData.X;

         parameter Real H=substanceData.DfH_25degC
           - 1000*(substanceData.A_/((-1 + exp((1000*substanceData.E_)/T0))*substanceData.E_)
           - (1000*substanceData.E)/T0 + 0.001*A*T0
           + 5.*10^(-7)*substanceData.B*T0^2 + (1/3)*10^(-9)*substanceData.C*T0^3
           + 2.5*10^(-13)*substanceData.D*T0^4 + (1/1000)^(1.5)/1.5 * T0^1.5 * substanceData.X);

       algorithm
           //Molar enthalpy:
           // - temperature shift: to reach internal energy change by added heat (at constant amount of substance) dU = n*(dH-d(p*Vm)) = n*(dH - R*dT)
           //   where molar heat capacity at constant volume is Cv = dU/(n*dT) = dH/dT - R. As a result dH = dT*(Cv+R) for ideal gas.
           //   And the relation with molar heat capacity at constant pressure as Cp=Cv+R makes dH = dT*Cp.
           molarEnthalpyElectroneutral :=
           H + 1000*(A*t + substanceData.B*t^2/2 + substanceData.C*t^3/3
           + substanceData.D*t^4/4 - substanceData.E/t + substanceData.X*t^1.5/1.5
           + substanceData.A_/substanceData.E_/(exp(substanceData.E_/t) - 1));

       end molarEnthalpyElectroneutral;

       redeclare function extends molarEntropyPure
        "Molar entropy of the pure substance, where der(Sm) = cp*der(T)/T"
        protected
         parameter Real T0=298.15;
         Real t=T/1000;
         parameter Real A= substanceData.cp_25degC
           - ((10^6 * substanceData.A_* exp(1000*substanceData.E_)/T0)) / ((-1 + exp((1000*substanceData.E_)/T0))^2 * T0^2)
           - (10^6 * substanceData.E)/T0^2 - 0.001*substanceData.B*T0 - 10^(-6) * substanceData.C * T0^2
           - 10^(-9) * substanceData.D * T0^3 - sqrt(1/1000)* T0^0.5 * substanceData.X;

         parameter Real G= (((substanceData.DfH_25degC - substanceData.DfG_25degC_1bar)/298.15)
           + (500000.* substanceData.E)/T0^2
           - (1000*substanceData.A_)/((-1 + exp((1000*substanceData.E_)/T0))*substanceData.E_*T0)
           - 0.001*substanceData.B*T0 - 5*10^(-7) * substanceData.C * T0^2
           - (1/3)*10^(-9)*substanceData.D*T0^3 - sqrt(0.004*T0)* substanceData.X
           + (substanceData.A_*log(1 - exp(-((1000*substanceData.E_)/T0))))/substanceData.E_^2
           - A*log(0.001*T0));

       algorithm
         //molarEntropyPure := ((substanceData.DfH - substanceData.DfG_25degC_1bar)/298.15)
         //+ (substanceData.Cp+Modelica.Constants.R)*log(T/298.15);

           //Molar entropy:
           // - temperature shift: to reach the definition of heat capacity at constant pressure Cp*dT = T*dS (small amount of added heat energy)
           // - pressure shift: to reach the ideal gas equation at constant temperature Vm*dP = -T*dS (small amount of work)
           molarEntropyPure := G
             + A*log(t) + substanceData.B*t + substanceData.C*t^2/2 + substanceData.D*t^3/3
             - substanceData.E/(2*t^2)
             + 2*substanceData.X*t^0.5 + substanceData.A_/substanceData.E_/t/(exp(substanceData.E_/t) - 1)
             - substanceData.A_/substanceData.E_^2*log(1 - exp(-substanceData.E_/t))
           - Modelica.Constants.R*log(p/100000);

       /*    AA*Log[t] + BB*t + CC*t^2/2 + DD*t^3/3 - EE/(2*t^2) + 2*X*t^0.5 + G + 
 AAA/EEE/t/(Exp[EEE/t] - 1) - AAA/EEE^2*Log[1 - Exp[-EEE/t]]
 
 G + AA*Log[t] + BB*t + CC*t^2/2 + DD*t^3/3 - EE/(2*t^2) + 2*X*t^0.5 + 
 AAA/EEE/t/(Exp[EEE/t] - 1) - AAA/EEE^2*Log[1 - Exp[-EEE/t]]
 */

           //For example at triple point of water should be T=273K, p=611.657Pa, DfH(l)-DfH(g)=44 kJ/mol and S(l)-s(g)=-166 J/mol/K
           //At T=298K, p=1bar, DfH(l)-DfH(g)=44 kJ/mol and S(l)-s(g)=-119 J/mol/K
       end molarEntropyPure;

       redeclare function extends molarMass "Molar mass of the substance"
       algorithm
           molarMass := substanceData.MolarWeight;
       end molarMass;

       redeclare function extends molarVolumePure
        "Molar volume of the pure substance"
       algorithm
           molarVolumePure := Modelica.Constants.R*T/p; //ideal gas
       end molarVolumePure;

       redeclare function extends molarHeatCapacityCp
        "Molar heat capacity of the substance at constant pressure"
        protected
         parameter Real T0=298.15;
         Real t=T/1000;
         parameter Real A= substanceData.cp_25degC
           - ((10^6 * substanceData.A_* exp(1000*substanceData.E_)/T0)) / ((-1 + exp((1000*substanceData.E_)/T0))^2 * T0^2)
           - (10^6 * substanceData.E)/T0^2 - 0.001*substanceData.B*T0 - 10^(-6) * substanceData.C * T0^2
           - 10^(-9) * substanceData.D * T0^3 - sqrt(1/1000)* T0^0.5 * substanceData.X;
       algorithm
           molarHeatCapacityCp := (A + substanceData.B*t + substanceData.C*t^2 +
           substanceData.D*t^3 + substanceData.E/t^2 + substanceData.X*t^0.5 +
           substanceData.A_/t^2*exp(substanceData.E_/t)/(exp(substanceData.E_/t)-1)^2);
       end molarHeatCapacityCp;

       redeclare function extends molarHeatCapacityCv
        "Molar heat capacity of the substance at constant volume"
       algorithm
           molarHeatCapacityCv := molarHeatCapacityCp(substanceData,T,p,v,I,r) - Modelica.Constants.R;
       end molarHeatCapacityCv;

        annotation (Documentation(revisions="<html>
<p><i>2017</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end IdealGasShomate;

      package Incompressible "Incompressible as basic state of matter"
         extends StateOfMatter(OtherPropertiesCount=0);

         redeclare replaceable record extends SubstanceData "Base substance data"

            parameter Modelica.SIunits.MolarMass MolarWeight(displayUnit="kDa")=0.01801528
          "Molar weight of the substance in kg/mol or kDa";

            parameter Modelica.SIunits.ChargeNumberOfIon z=0
          "Charge number of the substance (e.g. 0..uncharged, -1..electron, +2..Ca^2+)";

            parameter Modelica.SIunits.MolarEnergy DfG_25degC_1bar(displayUnit="kJ/mol")=0
          "Gibbs enerfy of formation of the substance at 25 degC,1bar";

            parameter Modelica.SIunits.MolarEnergy DfH_25degC(displayUnit="kJ/mol")=DfG_25degC_1bar
          "Enthalpy of formation of the substance at 25 degC";

            parameter Modelica.SIunits.ActivityCoefficient gamma=1
          "Activity coefficient of the substance";

            parameter Modelica.SIunits.MolarHeatCapacity Cp = 1
          "Molar heat capacity of the substance at constant pressure";

          //      parameter Modelica.SIunits.MolarHeatCapacity Cv = Cp
          //      "Molar heat capacity of the substance at constant volume";

            parameter Modelica.SIunits.Density density(displayUnit="kg/dm3")=1000
          "Density of the pure substance (default density of water at 25degC)";

            parameter String References[:]={""}
          "References of these thermodynamical values";

          annotation (Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
         end SubstanceData;

       redeclare function extends activityCoefficient
        "Return activity coefficient of the substance in the solution"
       algorithm
           activityCoefficient := substanceData.gamma;
       end activityCoefficient;

       redeclare function extends chargeNumberOfIon
        "Return charge number of the substance in the solution"
       algorithm
          chargeNumberOfIon := substanceData.z;
       end chargeNumberOfIon;

       redeclare function extends molarEnthalpyElectroneutral
        "Molar enthalpy of the pure electroneutral substance"
       algorithm
           //Molar enthalpy:
           // - temperature and pressure shift: to reach internal energy change by added heat (at constant amount of substance) dU = n*(dH-d(p*Vm)) = n*(dH - dp*Vm)
           //   where molar heat capacity at constant volume is Cv = dU/(n*dT) = dH/dT - (dp/dT)*Vm. As a result dH = dT*Cv - dp*Vm for incompressible substances.

           molarEnthalpyElectroneutral :=  substanceData.DfH_25degC
           + (T - 298.15) * substanceData.Cp;
        //   - (p - 100000) * molarVolumePure(substanceData,T,p,v,I);
       end molarEnthalpyElectroneutral;

        redeclare function extends molarEntropyPure
        "Molar entropy of the pure substance"
        algorithm
           //molarEntropyPure := ((substanceData.DfH - substanceData.DfG_25degC_1bar)/298.15)
           //+ substanceData.Cv*log(T/298.15);

           //Molar entropy shift:
           // - temperature shift: to reach the definition of heat capacity at constant pressure Cp*dT = T*dS (small amount of added heat energy)
           // - pressure shift: with constant molar volume at constant temperature Vm*dP = -T*dS (small amount of work)
           molarEntropyPure := substanceData.Cp*log(T/298.15) - (molarVolumePure(
             substanceData,
             T,
             p,
             v,
             I)/T)*(p - 100000) + ((substanceData.DfH_25degC - substanceData.DfG_25degC_1bar)/298.15);

           //For example at triple point of water should be T=273K, p=611.657Pa, DfH(l)-DfH(g)=44 kJ/mol and S(l)-s(g)=-166 J/mol/K
           //As data: http://www1.lsbu.ac.uk/water/water_phase_diagram.html
           //At T=298K, p=1bar, DfH(l)-DfH(g)=44 kJ/mol and S(l)-s(g)=-119 J/mol/K
        end molarEntropyPure;

       redeclare function extends molarMass "Molar mass of the substance"
       algorithm
           molarMass := substanceData.MolarWeight;
       end molarMass;

       redeclare function extends molarVolumePure
        "Molar volume of the pure substance"
       algorithm
           molarVolumePure := substanceData.MolarWeight/substanceData.density; //incompressible
       end molarVolumePure;

       redeclare function extends molarHeatCapacityCp
        "Molar heat capacity of the substance at constant pressure"
       algorithm
           molarHeatCapacityCp := substanceData.Cp;
       end molarHeatCapacityCp;

       redeclare function extends molarHeatCapacityCv
        "Molar heat capacity of the substance at constant volume"
       algorithm
           molarHeatCapacityCv := substanceData.Cp;
       end molarHeatCapacityCv;

        annotation (Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end Incompressible;

      connector SolutionPort
      "Only for connecting the one solution their substances. Please, do not use it in different way."

        //enthalpy
        Modelica.SIunits.Temperature T "Temperature of the solution";
        flow Modelica.SIunits.EnthalpyFlowRate dH
        "Internal enthalpy change of the solution";

        //pressure
        Modelica.SIunits.Pressure p "Pressure of the solution";
        flow Modelica.SIunits.VolumeFlowRate dV "Volume change of the solution";

        //electric port
        Modelica.SIunits.ElectricPotential v "Electric potential in the solution";
        flow Modelica.SIunits.ElectricCurrent i "Change of electric charge";

        //Extensive properties of the solution:

        // The extensive quantities here have not the real physical flows.
        // They hack the Kirchhof's flow equation to be counted as the sum from all connected substances in the solution.

        //amount of substances
        Modelica.SIunits.AmountOfSubstance n "Amount of the solution";
        flow Modelica.SIunits.AmountOfSubstance nj
        "Amount of the substance (fictive flow to calculate total extensive property in solution as sum from all substances)";

        //mass of substances
        Modelica.SIunits.Mass m "Mass of the solution";
        flow Modelica.SIunits.Mass mj
        "Mass of the substance (fictive flow to calculate total extensive property in solution as sum from all substances)";

        //volume of substances
        Modelica.SIunits.Volume V "Volume of the solution";
        flow Modelica.SIunits.Volume Vj
        "Volume of the substance (fictive flow to calculate total extensive property in solution as sum from all substances)";

        //free Gibbs energy of substances
        Modelica.SIunits.Energy G "Free Gibbs energy of the solution";
        flow Modelica.SIunits.Energy Gj
        "Free Gibbs energy of the substance (fictive flow to calculate total extensive property in solution as sum from all substances)";

        //electric charge of the substance
        Modelica.SIunits.ElectricCharge Q "Electric charge of the solution";
        flow Modelica.SIunits.ElectricCharge Qj
        "Electric charge of the substance (fictive flow to calculate total extensive property in solution as sum from all substances)";

        //ionic strength of substances
        Modelica.SIunits.MoleFraction I
        "Mole fraction based ionic strength of the solution";
        flow Modelica.SIunits.MoleFraction Ij
        "Mole-fraction based ionic strength of the substance (fictive flow to calculate total extensive property in solution as sum from all substances)";

        //suport for structural properties
        replaceable package stateOfMatter = Incompressible                    constrainedby
          StateOfMatter
        "Substance model to translate data into substance properties"
           annotation (choicesAllMatching = true);

        Real otherProperties[stateOfMatter.OtherPropertiesCount]
        "Other extensive properties of the solution";
        flow Real otherPropertiesOfSubstance[stateOfMatter.OtherPropertiesCount]
        "Other extensive properties of the substance (fictive flow to calculate total extensive property in solution as sum from all substances)";

        annotation (
        defaultComponentName="solution",
        Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",       info="<html>
<p>Solution port integrates all substances of the solution:</p>
<p>Such as if there are connected together with electric port, thermal port and with port composed with the amont of substance and molar change of substance.</p>
</html>"),   Icon(graphics={            Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={127,127,0},
                fillColor={127,127,0},
                fillPattern=FillPattern.Solid)}),
        Diagram(graphics={
         Text(extent={{-160,110},{40,50}},   lineColor={127,127,0},    textString = "%name",
              fillColor={127,127,0},
              fillPattern=FillPattern.Solid),
                        Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={127,127,0},
                fillColor={127,127,0},
                fillPattern=FillPattern.Solid,
                lineThickness=1)}));
      end SolutionPort;

      partial model PartialSolution
      "Chemical solution as homogenous mixture of the substances (only pressure and electric potential are not defined)"

       replaceable package stateOfMatter = Incompressible                    constrainedby
          StateOfMatter
        "Substance model to translate data into substance properties"
           annotation (choicesAllMatching = true);

        Modelica.SIunits.Temperature T(start=298.15) "Temperature";

        Modelica.SIunits.AbsolutePressure p(start=100000) "Absolute pressure";

        Modelica.SIunits.Mass mass(stateSelect=StateSelect.prefer)
        "Current mass of the solution";

        Modelica.SIunits.Volume volume(stateSelect=StateSelect.prefer)
        "Current volume of the solution";

        Interfaces.SolutionPort solution(redeclare package stateOfMatter =
              Incompressible) "Solution nonflows and flows" annotation (Placement(
              transformation(extent={{50,-90},{70,-70}}), iconTransformation(
                extent={{58,-100},{62,-96}})));

      protected
        Modelica.SIunits.Energy freeInternalEnergy(start=0)
        "Free Internal energy of the solution relative to start of the simulation";

        Modelica.SIunits.Entropy freeEntropy
        "Free entropy of the solution relative to start of the simulation";

        Modelica.SIunits.Energy freeEnthalpy
        "Free enthalpy of the solution relative to start of the simulation";

        Modelica.SIunits.Energy freeGibbsEnergy
        "Free Gibbs energy of the solution relative to start of the simulation";

        Modelica.SIunits.HeatFlowRate heatFromEnvironment
        "External heat flow rate";
         Modelica.SIunits.Power workFromEnvironment "External working power";

         Modelica.SIunits.ElectricCharge charge
        "Current electric charge of the solution";
                                                //(start=electricCharge_start)

      //   Modelica.SIunits.HeatFlowRate der_freeEnthalpy;
      initial equation

        freeInternalEnergy = 0;
        //freeEnthalpy + solution.Hj = 0;
        //der(freeEnthalpy) = -solution.dH;
      equation
        //internal energy
        der(freeInternalEnergy) = heatFromEnvironment + workFromEnvironment;

        heatFromEnvironment + workFromEnvironment = (-solution.dH) - solution.p*(-solution.dV); // - volume*der(solution.p);
       // heatFromEnvironment + workFromEnvironment = der(freeEnthalpy) - solution.p*(-solution.dV) - volume*der(solution.p);
        //It is the same as: der(freeEnthalpy)=-solution.dH;

        //thermodinamics equations:
        freeInternalEnergy = freeEnthalpy - volume*p; // H=U+p*V
        freeGibbsEnergy = freeEnthalpy - T*freeEntropy; // G=H-T*S

        //aliases
        solution.p = p;
        solution.T = T;
        solution.G = freeGibbsEnergy;
      //  solution.H = freeEnthalpy;

        //  solution.U = freeInternalEnergy;
        solution.Q = charge;
        solution.V = volume;
        solution.m = mass;
      //  der_freeEnthalpy = der(freeEnthalpy);

        //Extensive properties of the solution:

        // The extensive quantities here have not the real physical flows.
        // They hack the Kirchhof's flow equation to be counted as the sum from all connected substances in the solution.

        //amount of substances
        solution.n + solution.nj = 0; //total amount of solution is the sum of amounts of each substance

        //mass of substances
        solution.m + solution.mj = 0; //total mass of solution is the sum masses of each substance

        //free Gibs energy
        solution.G + solution.Gj = 0; //total free Gibbs energy of solution is the sum of free Gibbs energies of each substance

        //free enthalpy
      //  solution.H + solution.Hj = 0;  //total free enthalpy of solution is the sum of enthalpies of each substance

        //ionic strength (mole fraction based)
        solution.I + solution.Ij = 0; //total ionic strength of solution is the ionic strengths of each substance

        //electric charge
        solution.Q + solution.Qj = 0; //total electric charge of solution is the sum of charges of each substance

        //volume
        volume + solution.Vj = 0; //total volume of solution is the sum of volumes of each substance

        //structural properties
        solution.otherProperties = solution.otherPropertiesOfSubstance;
                                                                                                          annotation (
          Documentation(revisions="<html>
<p>2017-2018 by Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<h4>amountOfSubstances = &int; MolarFlows</h4>
<h4>mass = &int; massChanges</h4>
<h4>volume = &int; volumeChanges</h4>
<h4>freeEnthalpy = &int; EnthalpyChanges</h4>
<h4>freeEntropy = &int; EntropyChanges</h4>
<h4>freeGibbsEnergy = &int; GibbsEnergyChanges</h4>
<p>Integration of all substances together into one homogenous mixture - the solution.</p>
</html>"));
      end PartialSolution;

      partial model OnePortParallel
      "Partial molar flow between two substance definitions"

      SubstancePort_b port_a annotation (Placement(transformation(extent={{-110,-10},
                {-90,10}}), iconTransformation(extent={{-110,-10},{-90,10}})));
      SubstancePort_b port_b annotation (Placement(transformation(extent={{90,-10},
                {110,10}}), iconTransformation(extent={{90,-10},{110,10}})));
      equation
        port_a.q + port_b.q = 0;

      end OnePortParallel;

      partial model OnePortSerial
      "Partial transfer of substance from substance definition component to another transfer component (such as MolarFlowSensor)"

      SubstancePort_b port_a annotation (Placement(transformation(extent={{-110,-10},
                {-90,10}}), iconTransformation(extent={{-110,-10},{-90,10}})));
      SubstancePort_a port_b annotation (Placement(transformation(extent={{90,-10},
                {110,10}}), iconTransformation(extent={{90,-10},{110,10}})));
      equation
        port_a.q + port_b.q = 0;

      end OnePortSerial;

      partial model ConditionalSolutionFlow
      "Input of solution molar flow vs. parametric solution molar flow"

        parameter Boolean useSolutionFlowInput = false
        "Is solution flow an input?"
        annotation(Evaluate=true, HideResult=true, choices(checkbox=true),Dialog(group="Conditional inputs"));

        parameter Modelica.SIunits.VolumeFlowRate SolutionFlow=0
        "Volume flow rate of the solution if useSolutionFlowInput=false"   annotation (
            HideResult=true, Dialog(enable=not useSolutionFlowInput));

        parameter Modelica.SIunits.AmountOfSubstance AmountOfSolutionIn1L=55.508
        "The amount of all particles in one liter of the solution";

        Modelica.Blocks.Interfaces.RealInput solutionFlow(start=SolutionFlow, final unit="m3/s")=
           q*OneLiter/AmountOfSolutionIn1L if useSolutionFlowInput
           annotation ( HideResult=true, Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40})));

        Modelica.SIunits.MolarFlowRate q "Current molar solution flow";

      protected
       constant Modelica.SIunits.Volume OneLiter=0.001 "One liter";

      equation
        if not useSolutionFlowInput then
          q*OneLiter/AmountOfSolutionIn1L = SolutionFlow;
        end if;

      end ConditionalSolutionFlow;

      partial model ConditionalSubstanceFlow
      "Input of substance molar flow vs. parametric substance molar flow"

        parameter Boolean useSubstanceFlowInput = false
        "Is substance flow an input?"
        annotation(Evaluate=true, HideResult=true, choices(checkbox=true),Dialog(group="Conditional inputs"));

        parameter Modelica.SIunits.MolarFlowRate SubstanceFlow=0
        "Volumetric flow of Substance if useSubstanceFlowInput=false"   annotation (
            HideResult=true, Dialog(enable=not useSubstanceFlowInput));

        Modelica.Blocks.Interfaces.RealInput substanceFlow(start=SubstanceFlow, final unit="mol/s")=q if
             useSubstanceFlowInput
             annotation (HideResult=true,
             Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={40,40})));

        Modelica.SIunits.MolarFlowRate q "Current Substance flow";
      equation
        if not useSubstanceFlowInput then
          q = SubstanceFlow;
        end if;

      end ConditionalSubstanceFlow;

      partial model ConditionalKinetics
      "Input of kinetics coefficient vs. parametric kinetics coefficient"

        parameter Boolean useKineticsInput = false
        "Is kinetics coefficient as an input?"
        annotation(Evaluate=true, HideResult=true, choices(checkbox=true),Dialog(group="Conditional inputs"));

        parameter Real KC(final unit="mol2.s-1.J-1")=1
        "Chemical kinetics coefficient if useKineticsInput=false"   annotation (
            HideResult=true, Dialog(enable=not useKineticsInput));

        Modelica.Blocks.Interfaces.RealInput kineticsCoefficientInput(start=KC, final unit="mol2.s-1.J-1")=
           kC if useKineticsInput
           annotation ( HideResult=true, Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-60,40}),
                              iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-60,40})));

        Real kC(final unit="mol2.s-1.J-1") "Current kinetics coefficient";

      equation
        if not useKineticsInput then
          kC = KC;
        end if;

      end ConditionalKinetics;

      package SimpleChemicalMedium
      "Mixture of chemical substances as homogenous solution in one state of matter"
        extends Modelica.Media.Interfaces.PartialMixtureMedium(
          substanceNames={"H2O(l)"},
          final ThermoStates=Modelica.Media.Interfaces.Choices.IndependentVariables.pTX,
          final reducedX=false,
          final singleState=true,
          final fixedX=false,
          Temperature(
            min=273,
            max=450,
            start=298));                            //(

        replaceable package stateOfMatter =
                                Interfaces.Incompressible constrainedby
          Interfaces.StateOfMatter
        "Substance model to translate data into substance properties"
           annotation (choicesAllMatching = true);

        // Provide medium constants here
        constant stateOfMatter.SubstanceData substanceData[nS] = {Media.Substance.Water_liquid}
        "Definition of the substances"
           annotation (choicesAllMatching = true);

        // Simplified properties - default values are for water 25degC from Modelica.Media.CompressibleLiquids.LinearWater_pT_Ambient
        constant DynamicViscosity eta_const = 8.9e-4 "Constant dynamic viscosity";

        redeclare model extends BaseProperties(final standardOrderComponents=true)
        "Base properties of medium"

         input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the solution";
         input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";

         Modelica.SIunits.MolarMass molarMass[nS]=substanceData.MolarWeight "Molar mass";
         Modelica.SIunits.MolarVolume molarVolume[nS] "Molar volume";
         Modelica.SIunits.MolarEnthalpy molarEnthalpy[nS] "Molar enthalpy";
         Modelica.SIunits.MolarHeatCapacity molarHeatCapacity[nS]
          "Molar heat capacity";

         SpecificHeatCapacity Cp "Specific heat capacity at constant pressure";
        equation

         // molarMass = stateOfMatter.molarMass(substanceData,T,p,v,I);
          molarVolume = stateOfMatter.molarVolume(substanceData,T,p,v,I);
          molarEnthalpy = stateOfMatter.molarEnthalpy(substanceData,T,p,v,I);
          molarHeatCapacity = stateOfMatter.molarHeatCapacityCp(substanceData,T,p,v,I);

          MM = sum( molarMass ./ X);  // sum(MMj*nj)/sum(nj)
          d = 1 / sum( molarVolume .* X ./ molarMass);  //sum(MMj*nj)/sum(Vmj*nj), where xj=nj/nT, sum(Xj)=1
          Cp = sum( molarHeatCapacity .* X ./ molarMass); //sum(cpj*nj)/sum(MMj*nj)
          h = sum( molarEnthalpy .* X ./ molarMass); //sum(Hmj*nj)/sum(MMj*nj)
          u = h - p/d;
          R = Modelica.Constants.R/MM;
          state.p = p;
          state.T = T;
          state.X = X;
          state.v = v; //electric potential
          state.I = I; //ionic strength
        end BaseProperties;

        redeclare record ThermodynamicState
        "A selection of variables that uniquely defines the thermodynamic state"
          extends Modelica.Icons.Record;
          AbsolutePressure p "Absolute pressure of medium";
          Temperature T "Temperature of medium";

          Modelica.SIunits.MassFraction X[nS] "Mass fractions";

          Modelica.SIunits.ElectricPotential v
          "Electric potential of the solution";
          Modelica.SIunits.MoleFraction I "Ionic strengh (mole fraction based)";
          annotation (Documentation(info="<html>

</html>"));
        end ThermodynamicState;

        redeclare function setState_pTX
        "Return thermodynamic state from p, T, and X or Xi"
        extends Modelica.Icons.Function;
        input AbsolutePressure p "Pressure";
        input Temperature T "Temperature";
        input MassFraction X[:]=reference_X "Mass fractions";
        input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the solution";
        input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          //  input stateOfMatter.SubstanceData substanceData[nS] = substanceData       "Constant data of substances";
        output ThermodynamicState state "Thermodynamic state record";
        algorithm
          state := ThermodynamicState(p=p, T=T, X=X, v=v, I=I);
          annotation (Documentation(info="<html>

</html>"));
        end setState_pTX;

        redeclare function setState_phX
        "Return thermodynamic state from p, h, and X or Xi"
          extends Modelica.Icons.Function;
          input AbsolutePressure p "Pressure";
          input SpecificEnthalpy h "Specific enthalpy";
          input MassFraction X[nS]=reference_X "Mass fractions";
          input Modelica.SIunits.ElectricPotential v=0
          "Electric potential of the solution";
          input Modelica.SIunits.MoleFraction I=0
          "Ionic strengh (mole fraction based)";
          //    input stateOfMatter.SubstanceData substanceData[nS] = substanceData     "Constant data of substances";
          output ThermodynamicState state "Thermodynamic state record";
        protected
         Modelica.SIunits.MolarMass molarMass[nS]=substanceData.MolarWeight "Molar mass";
         Modelica.SIunits.MolarEnthalpy molarEnthalpyT0[nS]
          "Molar enthalpy at temperature T0";
         Modelica.SIunits.MolarHeatCapacity molarHeatCapacity[nS]
          "Molar heat capacity";

         SpecificHeatCapacity Cp "Specific heat capacity at constant pressure";
         Modelica.SIunits.SpecificEnthalpy hT0
          "Molar enthalpy of solution at temperature T0";
         constant Temperature T0=298;
        algorithm
        //  molarMass := stateOfMatter.molarMass(substanceData,T0,p,v,I);
          molarEnthalpyT0 :=stateOfMatter.molarEnthalpy(
              substanceData,
              T0,
              p,
              v,
              I);
          hT0 := sum(molarEnthalpyT0 .* X ./ molarMass);
          molarHeatCapacity := stateOfMatter.molarHeatCapacityCp(substanceData,T0,p,v,I);
          Cp := sum( molarHeatCapacity .* X ./ molarMass);
          state := ThermodynamicState(p=p, T=T0 + (h-hT0)/Cp, X=X, v=v, I=I);
        end setState_phX;

        //TODO: make model of dynamic viscosity from substance properties!!!
        redeclare function extends dynamicViscosity
        "Return constant dynamic viscosity"
        algorithm
          eta := eta_const;
        end dynamicViscosity;

        redeclare function extends pressure "Return pressure"

        algorithm
          p := state.p;
        end pressure;

        redeclare function extends temperature "Return temperature"

        algorithm
          T := state.T;
        end temperature;

        redeclare function extends density "Return density"
          //  input stateOfMatter.SubstanceData substanceData[nS] = substanceData       "Constant data of substances";
        protected
         Modelica.SIunits.MolarMass molarMass[nS]=substanceData.MolarWeight "Molar mass";
         Modelica.SIunits.MolarVolume molarVolume[nS] "Molar volume";
        algorithm
        //    molarMass := stateOfMatter.molarMass(substanceData,state.T,state.p,state.v,state.I);
          molarVolume := stateOfMatter.molarVolume(substanceData,state.T,state.p,state.v,state.I);

          d := 1 / sum( molarVolume .* state.X ./ molarMass); //sum(MMj*nj)/sum(Vmj*nj), where xj=nj/nT, sum(Xj)=1

        end density;

        redeclare function extends specificEnthalpy "Return specific enthalpy"
          //    input stateOfMatter.SubstanceData substanceData[nS] = substanceData       "Constant data of substances";
        algorithm
          h := sum( stateOfMatter.molarEnthalpy(substanceData,state.T,state.p,state.v,state.I) .* state.X ./ stateOfMatter.molarMass(substanceData,state.T,state.p,state.v,state.I));
        end specificEnthalpy;

        redeclare function extends specificEntropy
        "Return the specific entropy from the thermodynamic state"
          //    input stateOfMatter.SubstanceData substanceData[nS] = substanceData     "Constant data of substances";
        protected
         Modelica.SIunits.MolarMass molarMass[nS]=substanceData.MolarWeight "Molar mass";
         Modelica.SIunits.MolarEntropy molarEntropy[nS] "Molar entropies";
         Modelica.SIunits.MoleFraction x[nS] "Mole fractions";
         Modelica.SIunits.ChemicalPotential electrochemicalPotential[nS]
          "electrochemical potentials";
        algorithm
          //molarMass := stateOfMatter.molarMass(substanceData,state.T,state.p,state.v,state.I);

          x := (state.X ./ molarMass) / sum(state.X ./ molarMass);
          electrochemicalPotential :=
            stateOfMatter.electroChemicalPotentialPure(substanceData,state.T,state.p,state.v,state.I) +
            Modelica.Constants.R * state.T * log(x.*stateOfMatter.activityCoefficient(substanceData,state.T,state.p,state.v,state.I))
            + Modelica.Constants.F * state.v * stateOfMatter.chargeNumberOfIon(substanceData,state.T,state.p,state.v,state.I);

          molarEntropy := stateOfMatter.molarEntropy(electrochemicalPotential,substanceData,state.T,state.p,state.v,state.I);

          s := sum( molarEntropy .* state.X ./ molarMass);
        end specificEntropy;

        redeclare function extends specificInternalEnergy
        "Return the specific internal energy from the thermodynamic state"
          //    input stateOfMatter.SubstanceData substanceData[nS] = substanceData     "Constant data of substances";
        algorithm
          u := specificEnthalpy(state) - state.p/density(state);
        end specificInternalEnergy;

        redeclare function extends specificGibbsEnergy
        "Return specific Gibbs energy from the thermodynamic state"
          extends Modelica.Icons.Function;
          //    input stateOfMatter.SubstanceData substanceData[nS] = substanceData
        //    "Constant data of substances";
        algorithm
          g := specificEnthalpy(state) - state.T*specificEntropy(state);
        end specificGibbsEnergy;

        redeclare function extends specificHelmholtzEnergy
        "Return specific Helmholtz energy from the thermodynamic state"
          extends Modelica.Icons.Function;
        algorithm
          f := specificInternalEnergy(state) - state.T*specificEntropy(state);
        end specificHelmholtzEnergy;

        redeclare function extends specificHeatCapacityCp
        "Return specific heat capacity at constant pressure"
          //    input stateOfMatter.SubstanceData substanceData[nS] = substanceData
          //     "Constant data of substances";
        algorithm
          cp := sum( stateOfMatter.molarHeatCapacityCp(substanceData,state.T,state.p,state.v,state.I) .* state.X ./ stateOfMatter.molarMass(substanceData,state.T,state.p,state.v,state.I));

          annotation (Documentation(info="<html>

</html>"));
        end specificHeatCapacityCp;

        redeclare function extends specificHeatCapacityCv
        "Return specific heat capacity at constant volume"
         // input stateOfMatter.SubstanceData substanceData[nS] = substanceData
           // "Constant data of substances";
        algorithm
          cv := sum( stateOfMatter.molarHeatCapacityCv(substanceData,state.T,state.p,state.v,state.I) .* state.X ./ stateOfMatter.molarMass(substanceData,state.T,state.p,state.v,state.I));

          annotation (Documentation(info="<html>

</html>"));
        end specificHeatCapacityCv;

        redeclare function extends setState_dTX
          "Return thermodynamic state as function of d, T and composition X or Xi"
          input Density d "Density";
          input Temperature T "Temperature";
          input MassFraction X[:]=reference_X "Mass fractions";
          output ThermodynamicState state "Thermodynamic state record";

        algorithm
          state := ThermodynamicState(p=101325,T=T,X=X,v=0,I=0);
        end setState_dTX;

        function concentrationToMassFractions "Return mass fractions X from molarities"
          extends Modelica.Icons.Function;
          input Modelica.SIunits.Concentration concentration[nS] "Concentrations [mmol/L] of mixture";
          output Modelica.SIunits.MassFraction X[nS] "Mass fractions of mixture [kg/kg]";
        protected
           MolarMass MM[nS]=substanceData.MolarWeight "Molar masses [kg/mol]";
           Real density=concentration*MM "Total concentration of mixture [mol/m3 * kg/mol]=[kg/m3]";
        algorithm
          for i in 1:nS loop
            X[i] := concentration[i]*MM[i]/density;
          end for;
          annotation (smoothOrder=5);
        end concentrationToMassFractions;

        annotation (Documentation(info="<HTML>
<p>
This package is a <b>template</b> for <b>new medium</b> models. For a new
medium model just make a copy of this package, remove the
\"partial\" keyword from the package and provide
the information that is requested in the comments of the
Modelica source.
</p>
</HTML>"));
      end SimpleChemicalMedium;
    end Interfaces;

    package Icons "Icons for Physiolib models"
      //extends Modelica.Icons.IconsPackage;
      extends Modelica.Icons.Package;

      partial class Diffusion

        annotation (Icon(graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
                    "modelica://Physiolib/Resources/Icons/diffusion.png")}));

      end Diffusion;

      class Substance

          annotation ( Icon(coordinateSystem(
                preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
              graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
                    "modelica://Physiolib/Resources/Icons/Substance.png")}));
      end Substance;

      class Speciation

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
              graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
                    "modelica://Physiolib/Resources/Icons/Speciation.png")}));
      end Speciation;

      class GasSolubility

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}},
                  fileName=
                    "modelica://Physiolib/Resources/Icons/GasSolubility.png")}));
      end GasSolubility;

      class Membrane

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                  fileName="modelica://Physiolib/Resources/Icons/membrane.png")}));
      end Membrane;

      class EnzymeKinetics

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Bitmap(extent={{-80,-26},{86,84}},
                  fileName=
                    "modelica://Physiolib/Resources/Icons/EnzymeKinetics.png")}));
      end EnzymeKinetics;

      class Solution

          annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
              graphics={
            Line(
              points={{-98,90},{-94,96},{-84,98},{84,98},{96,96},{100,92},{98,86},
                  {94,80},{94,80},{94,-92},{94,-92},{94,-96},{92,-100},{88,-100},
                  {84,-100},{-84,-100},{-88,-100},{-92,-100},{-94,-96},{-94,-92},
                  {-94,24},{-94,78},{-94,80},{-98,90}},
              color={127,0,127},
              smooth=Smooth.Bezier,
              pattern=LinePattern.Dot,
              thickness=0.5)}));
      end Solution;

      class Buffer

          annotation ( Icon(coordinateSystem(
                preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
              graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
                    "modelica://Physiolib/Resources/Icons/buffer.png")}));
      end Buffer;

      class ElectronTransfer

          annotation ( Icon(coordinateSystem(
                preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
              graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/electron.png")}));
      end ElectronTransfer;
      annotation (Documentation(revisions=""));
    end Icons;

    package Examples "Examples that demonstrate usage of chemical library"
    extends Modelica.Icons.ExamplesPackage;

      model SimpleReaction
        "The simple chemical reaction A<->B with equilibrium B/A = 2"
         extends Modelica.Icons.Example;

        constant Real K = 2 "Dissociation constant of the reaction";

        constant Modelica.SIunits.Temperature T_25degC = 298.15 "Temperature";
        constant Real R = Modelica.Constants.R "Gas constant";

        Physiolib.Chemical.Components.Solution solution
          annotation (Placement(transformation(extent={{-100,-100},{100,100}})));

        Physiolib.Chemical.Components.Substance A(amountOfSubstance_start=0.9)
          annotation (Placement(transformation(extent={{-52,-8},{-32,12}})));

        Physiolib.Chemical.Components.Reaction reaction
          annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
        Physiolib.Chemical.Components.Substance B(substanceData(DfG_25degC_1bar=-
                R*T_25degC*log(K)), amountOfSubstance_start=0.1)
          annotation (Placement(transformation(extent={{62,-8},{42,12}})));

      equation
        connect(reaction.products[1], B.port_a) annotation (Line(
            points={{10,2},{42,2}},
            color={158,66,200},
            thickness=1));
        connect(A.solution, solution.solution) annotation (Line(
            points={{-48,-8},{-48,-92},{60,-92},{60,-98}},
            color={127,127,0}));
        connect(B.solution, solution.solution) annotation (Line(points={{58,-8},{
              58,-92},{60,-92},{60,-98}},  color={127,127,0}));
        connect(A.port_a, reaction.substrates[1]) annotation (Line(
            points={{-32,2},{-10,2}},
            color={158,66,200},
            thickness=1));
        annotation (Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",     info="<html>
<p>Simple reaction demonstrating equilibria between substance A and substance B, mixed in one solution. Observe the molar concentration (A.c) and molar fraction. Note, that mole fraction (A.x and B.x) are always summed to 1 for the solution.</p>
</html>"),experiment(StopTime=0.001));
      end SimpleReaction;

      model SimpleReaction2
        "The simple chemical reaction A+B<->C with equilibrium [C]/([A]*[B]) = 2, where [A] is molar concentration of A in water"
         extends Modelica.Icons.Example;

        constant Real Kb(unit="kg/mol") = 2
          "Molarity based dissociation constant of the reaction with one more reactant";

        constant Real Kx(unit="1") = Kb*55.508
          "Mole fraction based dissociation constant of the reaction with one more reactant in the pure water";

        constant Modelica.SIunits.Temperature T_25degC = 298.15 "Temperature";
        constant Real R = Modelica.Constants.R "Gas constant";

        Physiolib.Chemical.Components.Solution solution
          annotation (Placement(transformation(extent={{-100,-100},{100,100}})));

        Physiolib.Chemical.Components.Substance A(amountOfSubstance_start=0.1)
          annotation (Placement(transformation(extent={{-34,2},{-14,22}})));
        Physiolib.Chemical.Components.Reaction reaction(nS=2)
          annotation (Placement(transformation(extent={{4,-8},{24,12}})));
        Physiolib.Chemical.Components.Substance B(amountOfSubstance_start=0.1)
          annotation (Placement(transformation(extent={{-34,-24},{-14,-4}})));
        Physiolib.Chemical.Components.Substance C(substanceData(DfG_25degC_1bar=-
                R*T_25degC*log(Kx)), amountOfSubstance_start=0.1)
          annotation (Placement(transformation(extent={{68,-8},{48,12}})));

      equation
        connect(reaction.products[1], C.port_a) annotation (Line(
            points={{24,2},{48,2}},
            color={158,66,200},
            thickness=1));
        connect(A.solution, solution.solution) annotation (Line(
            points={{-30,2},{-30,-90},{60,-90},{60,-98}},
            color={127,127,0}));
        connect(C.solution, solution.solution) annotation (Line(points={{64,-8},{
              66,-8},{66,-90},{60,-90},{60,-98}},  color={127,127,0}));
        connect(B.solution, solution.solution) annotation (Line(points={{-30,-24},
              {-30,-90},{60,-90},{60,-98}},color={127,127,0}));

        connect(B.port_a, reaction.substrates[1]) annotation (Line(
            points={{-14,-14},{-10,-14},{-10,0},{4,0}},
            color={158,66,200},
            thickness=1));
        connect(A.port_a, reaction.substrates[2]) annotation (Line(
            points={{-14,12},{-10,12},{-10,4},{4,4}},
            color={158,66,200},
            thickness=1));
        annotation ( Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",     info="<html>
<p>Simple reaction demonstrating equilibria between substance A, B, and substance C, mixed in one solution. Observe the molar concentration (A.c) and molar fraction. Note, that molar fractions (A.x and B.x and C.x) are always summed to 1 for the whole solution.</p>
</html>"),experiment(StopTime=0.001));
      end SimpleReaction2;

      model HeatingOfWater "Heating of 1 kg water"
        extends Modelica.Icons.Example;

        Physiolib.Chemical.Components.Solution solution(
          useElectricPort=true,
          useMechanicPorts=true,
          useThermalPort=true)
          annotation (Placement(transformation(extent={{-100,-100},{100,100}})));
        Physiolib.Chemical.Components.Substance H2O(
          redeclare package stateOfMatter =
              Physiolib.Chemical.Interfaces.Incompressible,
          substanceData=Media.Substance.Water_liquid,
          amountOfSubstance_start=55.508)
          annotation (Placement(transformation(extent={{56,-32},{76,-12}})));
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow=4180)
          annotation (Placement(transformation(extent={{-86,-72},{-66,-52}})));
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-70,60},{-50,80}})));
        Modelica.Mechanics.Translational.Components.Fixed fixed1
          annotation (Placement(transformation(extent={{-28,-94},{-8,-74}})));
      equation
        connect(H2O.solution, solution.solution) annotation (Line(
            points={{60,-32},{60,-98}},
            color={127,127,0}));
        connect(fixedHeatFlow.port, solution.heatPort) annotation (Line(
            points={{-66,-62},{-60,-62},{-60,-102}},
            color={191,0,0}));
        connect(ground.p, solution.electricPin) annotation (Line(
            points={{-60,80},{-60,100}},
            color={0,0,255}));
      connect(fixed1.flange, solution.bottom) annotation (Line(
          points={{-18,-84},{0,-84},{0,-102}},
          color={0,127,0}));
        annotation (experiment(StopTime=1),
        Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",     info="<html>
<p>Heating of solution by one degree, using standard HeatPort from Modelica Standard Library.</p>
<p>Observe Solution.T (or H2O.Solution.T) for temperature change.</p>
</html>"));
      end HeatingOfWater;

      model HeatingOfAlcohol "Heating of 50% ethanol"
        extends Modelica.Icons.Example;

        Physiolib.Chemical.Components.Solution solution(
          useElectricPort=true,
          useMechanicPorts=true,
          useThermalPort=true)
          annotation (Placement(transformation(extent={{-100,-100},{100,100}})));
                                  /*(mass_start=0.5 + (55.508/2)*Substances.Ethanol_liquid.MolarWeight,
    volume_start=1/(0.997*0.91251))*/
        Physiolib.Chemical.Components.Substance H2O(
          redeclare package stateOfMatter =
              Physiolib.Chemical.Interfaces.Incompressible,
          substanceData=Media.Substance.Water_liquid,
          amountOfSubstance_start=55.508/2)
          annotation (Placement(transformation(extent={{-46,-8},{-26,12}})));
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow=4180)
          annotation (Placement(transformation(extent={{-86,-76},{-66,-56}})));
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-70,62},{-50,82}})));
        Physiolib.Chemical.Components.Substance Ethanol(
          redeclare package stateOfMatter =
              Physiolib.Chemical.Interfaces.Incompressible,
          substanceData=Media.Substance.Ethanol_liquid,
          amountOfSubstance_start=55.508/2)
          annotation (Placement(transformation(extent={{18,-8},{38,12}})));
        Modelica.Mechanics.Translational.Components.Fixed fixed1
          annotation (Placement(transformation(extent={{-28,-94},{-8,-74}})));
      equation
        connect(H2O.solution, solution.solution) annotation (Line(
            points={{-42,-8},{-42,-34},{60,-34},{60,-98}},
            color={127,127,0}));
        connect(fixedHeatFlow.port, solution.heatPort) annotation (Line(
            points={{-66,-66},{-60,-66},{-60,-102}},
            color={191,0,0}));
        connect(ground.p, solution.electricPin) annotation (Line(
            points={{-60,82},{-60,100}},
            color={0,0,255}));
      connect(solution.solution, Ethanol.solution) annotation (Line(
          points={{60,-98},{60,-34},{22,-34},{22,-8}},
          color={127,127,0}));
      connect(solution.bottom, fixed1.flange) annotation (Line(
          points={{0,-102},{0,-84},{-18,-84}},
          color={0,127,0}));
        annotation (experiment(StopTime=1),      Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",     info="<html>
<p>Heating of solution of water and ethanol, using standard HeatPort from Modelica Standard Library.</p>
<p>Observe Solution.T (or H2O.Solution.T or Ethanol.Solution.T) for temperature change. Note, that we can heat all substances in solution at once and the results would differ from HeatingOfWater.</p>
</html>"));
      end HeatingOfAlcohol;

      model ExothermicReaction
        "Exothermic reaction in ideally thermal isolated solution and in constant temperature conditions"

         extends Modelica.Icons.Example;

        parameter Modelica.SIunits.MolarEnergy ReactionEnthalpy=-55000;

        Physiolib.Chemical.Components.Solution thermal_isolated_solution(
          useElectricPort=true,
          useMechanicPorts=true,
          useThermalPort=true)
          annotation (Placement(transformation(extent={{-100,-100},{98,-6}})));
        Physiolib.Chemical.Components.Substance A(amountOfSubstance_start=0.9)
          annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
        Physiolib.Chemical.Components.Reaction reaction
          annotation (Placement(transformation(extent={{-8,-60},{12,-40}})));
        Physiolib.Chemical.Components.Substance B(amountOfSubstance_start=0.1,
            substanceData(DfH_25degC=ReactionEnthalpy))
          annotation (Placement(transformation(extent={{40,-60},{20,-40}})));

        Physiolib.Chemical.Components.Solution solution_at_constant_temperature(
          useElectricPort=true,
          useMechanicPorts=true,
          useThermalPort=true)
          annotation (Placement(transformation(extent={{-100,0},{98,94}})));
        Physiolib.Chemical.Components.Substance A1(amountOfSubstance_start=0.9)
          annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
        Physiolib.Chemical.Components.Reaction reaction1
          annotation (Placement(transformation(extent={{-8,40},{12,60}})));
        Physiolib.Chemical.Components.Substance B1(amountOfSubstance_start=0.1,
            substanceData(DfH_25degC=ReactionEnthalpy))
          annotation (Placement(transformation(extent={{40,40},{20,60}})));

        Modelica.SIunits.HeatFlowRate q
          "Heat flow to environment to reach constant temperature";
        Modelica.SIunits.Temperature t
          "Temperature if the solution is ideally thermal isolated from environment";
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-86,56},{-66,76}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=
            298.15) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            origin={-78,28})));
        Physiolib.Chemical.Components.Substance H2O(
          redeclare package stateOfMatter =
              Physiolib.Chemical.Interfaces.Incompressible,
          substanceData=Media.Substance.Water_liquid,
          amountOfSubstance_start=55.508)
          annotation (Placement(transformation(extent={{20,4},{40,24}})));
        Physiolib.Chemical.Components.Substance H2O1(
          redeclare package stateOfMatter =
              Physiolib.Chemical.Interfaces.Incompressible,
          substanceData=Media.Substance.Water_liquid,
          amountOfSubstance_start=55.508)
          annotation (Placement(transformation(extent={{20,-94},{40,-74}})));
        Modelica.Mechanics.Translational.Components.Fixed fixed1
          annotation (Placement(transformation(extent={{-28,4},{-8,24}})));
        Modelica.Mechanics.Translational.Components.Fixed fixed2
          annotation (Placement(transformation(extent={{-26,-96},{-6,-76}})));
        Modelica.Electrical.Analog.Basic.Ground ground1
          annotation (Placement(transformation(extent={{-78,-32},{-58,-12}})));
      equation
        q = fixedTemperature.port.Q_flow;

        t = thermal_isolated_solution.solution.T;

        connect(A.port_a, reaction.substrates[1]) annotation (Line(
            points={{-20,-50},{-8,-50}},
            color={158,66,200},
            thickness=1));
        connect(reaction.products[1], B.port_a) annotation (Line(
            points={{12,-50},{20,-50}},
            color={158,66,200},
            thickness=1));
        connect(B.solution, thermal_isolated_solution.solution) annotation (Line(
            points={{36,-60},{36,-64},{58.4,-64},{58.4,-99.06}},
            color={127,127,0}));
        connect(A.solution, thermal_isolated_solution.solution) annotation (Line(
              points={{-36,-60},{-36,-64},{58.4,-64},{58.4,-99.06}},
                                                               color={127,127,0}));
        connect(A1.port_a, reaction1.substrates[1]) annotation (Line(
            points={{-20,50},{-8,50}},
            color={158,66,200},
            thickness=1));
        connect(reaction1.products[1], B1.port_a) annotation (Line(
            points={{12,50},{20,50}},
            color={158,66,200},
            thickness=1));
        connect(B1.solution, solution_at_constant_temperature.solution) annotation (
            Line(
            points={{36,40},{36,34},{58.4,34},{58.4,0.94}},
            color={127,127,0}));
        connect(A1.solution, solution_at_constant_temperature.solution) annotation (
            Line(points={{-36,40},{-36,34},{58.4,34},{58.4,0.94}},
                                                            color={127,127,0}));
      connect(solution_at_constant_temperature.electricPin, ground.p) annotation (
         Line(
          points={{-60.4,94},{-60,94},{-60,76},{-76,76}},
          color={0,0,255}));
      connect(fixedTemperature.port, solution_at_constant_temperature.heatPort)
        annotation (Line(
          points={{-68,28},{-60.4,28},{-60.4,-0.94}},
          color={191,0,0}));
      connect(solution_at_constant_temperature.solution, H2O.solution)
        annotation (Line(
          points={{58.4,0.94},{24,0.94},{24,4}},
          color={127,127,0}));
      connect(thermal_isolated_solution.solution, H2O1.solution) annotation (Line(
          points={{58.4,-99.06},{24,-99.06},{24,-94}},
          color={127,127,0}));
      connect(solution_at_constant_temperature.bottom, fixed1.flange) annotation (
         Line(
          points={{-1,-0.94},{0,-0.94},{0,14},{-18,14}},
          color={0,127,0}));
      connect(thermal_isolated_solution.bottom, fixed2.flange) annotation (Line(
          points={{-1,-100.94},{-1,-86},{-16,-86}},
          color={0,127,0}));
      connect(thermal_isolated_solution.electricPin, ground1.p) annotation (Line(
          points={{-60.4,-6},{-68,-6},{-68,-12}},
          color={0,0,255}));
        annotation ( Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",     info="<html>
<p>Demonstration of exotermic reaction with perfect cooling (i.e. connected fixed temperature to the HeatPort) and thermally insulated (HetPort unconnected). See solution_(...).T</p>
</html>"),experiment(StopTime=0.001),
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}), graphics));
      end ExothermicReaction;

      model HydrogenCombustion "Hydrogen combustion in piston"
        extends Modelica.Icons.Example;

        parameter Modelica.SIunits.Volume V=0.001 "Initial volume";
       // parameter Modelica.SIunits.Pressure p=100000 "Initial pressure";
        parameter Modelica.SIunits.Temperature T=298.15 "Initial temperature";

        parameter Modelica.SIunits.Area A=0.01 "Cross area of cylinder";

        //p*V=n*R*T
       // parameter Modelica.SIunits.AmountOfSubstance n=p*V/(Modelica.Constants.R*T)
       //   "Initial amount of substances in sulution";

        Physiolib.Chemical.Components.Solution idealGas(
          SurfaceArea=A,
          useMechanicPorts=true,
          useThermalPort=true,
          redeclare package stateOfMatter = Chemical.Interfaces.IdealGas)
          annotation (Placement(transformation(extent={{-50,-56},{50,44}})));
                         // AmbientPressure=p)
        //  volume_start=V,
        Physiolib.Chemical.Components.Substance H2_gas(
          redeclare package stateOfMatter =
              Physiolib.Chemical.Interfaces.IdealGas,
          substanceData=Media.Substance.Hydrogen_gas,
          amountOfSubstance_start(displayUnit="mmol") = 0.026)
          annotation (Placement(transformation(extent={{-40,-32},{-20,-12}})));
        Physiolib.Chemical.Components.Substance O2_gas(
          substanceData=Media.Substance.Oxygen_gas,
          redeclare package stateOfMatter =
              Physiolib.Chemical.Interfaces.IdealGas,
          amountOfSubstance_start(displayUnit="mmol") = 0.013)
          annotation (Placement(transformation(extent={{-40,4},{-20,24}})));
        Physiolib.Chemical.Components.Substance H2O_gas(substanceData=Media.Substance.Water_gas,
            redeclare package stateOfMatter =
              Physiolib.Chemical.Interfaces.IdealGas)
          annotation (Placement(transformation(extent={{44,-14},{24,6}})));
        Physiolib.Chemical.Components.Reaction reaction(
          nS=2,
          s={2,1},
          p={2},
          kE=4e-05)
          annotation (Placement(transformation(extent={{-10,-14},{10,6}})));
        Modelica.Mechanics.Translational.Components.Spring spring(c=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={0,58})));
        Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=2)
          annotation (Placement(transformation(extent={{-40,-86},{-20,-66}})));
        Modelica.Thermal.HeatTransfer.Sources.FixedTemperature coolerTemperature(T=298.15)
          annotation (Placement(transformation(extent={{40,-86},{20,-66}})));
        Modelica.Mechanics.Translational.Components.Fixed fixed
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=180,
              origin={0,72})));
        Modelica.Mechanics.Translational.Components.Fixed fixed1
          annotation (Placement(transformation(extent={{-10,-72},{10,-52}})));
      equation
      connect(reaction.products[1], H2O_gas.port_a) annotation (Line(
          points={{10,-4},{24,-4}},
          color={158,66,200},
          thickness=1));
      connect(H2_gas.port_a, reaction.substrates[1]) annotation (Line(
          points={{-20,-22},{-16,-22},{-16,-6},{-10,-6}},
          color={158,66,200},
          thickness=1));
      connect(O2_gas.port_a, reaction.substrates[2]) annotation (Line(
          points={{-20,14},{-16,14},{-16,-2},{-10,-2}},
          color={158,66,200},
          thickness=1));
      connect(H2_gas.solution, idealGas.solution) annotation (Line(
          points={{-36,-32},{30,-32},{30,-55}},
          color={127,127,0}));
      connect(O2_gas.solution, idealGas.solution) annotation (Line(
          points={{-36,4},{-44,4},{-44,-32},{30,-32},{30,-55}},
          color={127,127,0}));
      connect(H2O_gas.solution, idealGas.solution) annotation (Line(
          points={{40,-14},{40,-32},{30,-32},{30,-55}},
          color={127,127,0}));
        connect(idealGas.surfaceFlange, spring.flange_a) annotation (Line(
            points={{0,44},{0,48}},
            color={0,127,0}));
        connect(idealGas.heatPort, thermalConductor.port_a) annotation (Line(
            points={{-30,-57},{-30,-62},{-48,-62},{-48,-76},{-40,-76}},
            color={191,0,0}));
        connect(thermalConductor.port_b, coolerTemperature.port) annotation (Line(
            points={{-20,-76},{20,-76}},
            color={191,0,0}));
        connect(fixed.flange, spring.flange_b) annotation (Line(
            points={{0,72},{0,68}},
            color={0,127,0}));
      connect(idealGas.bottom, fixed1.flange) annotation (Line(
          points={{0,-57},{0,-62}},
          color={0,127,0}));
        annotation ( experiment(StopTime=1), Documentation(info="<html>
<p>The gaseous reaction of hydrogen combustion: </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p align=\"center\"><b>2 H<sub>2</sub> + O<sub>2</sub> &lt;-&gt; 2 H<sub>2</sub>O</b></p></td>
<td><p>(1)</p></td>
</tr>
</table>
<p><br>This reaction generates a large amount of energy which can be used for mechanical or thermal purposes. </p>
<p>Building this model using the Physiolib components is easy. First, we drag and drop the library class &lsquo;Components.Solution&rsquo; into the diagram of our new model, labeled &lsquo;idealGas&rsquo; in Figure 4. In parameter dialog of this solution we check &ldquo;useThermalPorts&rdquo; and &ldquo;useMechanicsPorts&rdquo; to enable the thermal and mechanical interface. In the same dialog we need to set the area of the piston (e.g., 1 dm<sup>2</sup>), where the pressure provides the force of the green mechanical port of the uppermost side. The next parameter is the ambient external pressure surrounding the system (e.g., 1 bar). All three chemical substances of the reaction (1) can be added by dragging and dropping the library class &lsquo;Components.Substance&rsquo;. Because this model uses gases, the state of matter must be changed to some gas, such as the ideal gas prepared as &lsquo;Interfaces.IdealGas&rsquo;. The substance data must be selected to define the appropriate substances such as &lsquo;Hydrogen_gas&rsquo;, &lsquo;.Oxygen_gas&rsquo; and &lsquo;.Water_gas&rsquo; in package &lsquo;Examples.Substances&rsquo;. In addition, the initial amounts of substances can be prepared for the ideal solution of hydrogen and oxygen gases at a ratio 2:1 to attain the chemical equation above, with the expectation that at the end of the burning process, only water vapor would be presented. Therefore, the initial values of H<sub>2</sub> particles could be set to 26 mmol and of O<sub>2</sub> particles as 13 mmol. All substances must be connected with the &lsquo;idealGas&rsquo; using the blue colored solution port situated on the bottom side of each substance and solution. Then, the chemical reaction is inserted into the diagram of this model as library class &lsquo;Components.Reaction&rsquo;, and it is set to two substrates (nS=2) with stoichiometry s={2,1} and one product with stoichiometry p={2} to represent the reaction (3). The substances are then connected using violet colored substance connectors with appropriate indexes: H<sub>2</sub> to substrates[1], O<sub>2</sub> to substrates[2] and H<sub>2</sub>O to products[1]. At this point, the model is prepared to simulate the conditions of an unconnected heat port and an unconnected mechanical port. This simulation reaches the theoretical ideal of thermally isolated (zero heat flow from/to the solution) and isobaric (zero force generated on piston) conditions. </p>
<p><br><img src=\"modelica://Physiolib/Resources/Images/Examples/HydrogenBurning.png\"/></p>
<p><font style=\"color: #222222; \">Mueller, M. A., Kim, T. J., Yetter, R. A., &amp; Dryer, F. L. (1999). Flow reactor studies and kinetic modeling of the H2/O2 reaction.&nbsp;<i>International Journal of Chemical Kinetics</i>,&nbsp;<i>31</i>(2), 113-125.</font></p>
<p><br>However, in the real world, there is always some thermal energy flow from the solution, and this cooling process can be connected using the thermal connector of the Modelica Standard Library 3.2.1. For example, the simple thermal conductor of thermal conductance 2W/K at a constant temperature environment of 25&deg;C is represented in the model. The mechanical power of the engine can be connected to the robust mechanical model. However, in our example we selected only a very strong mechanical spring with a spring constant of 10<sup>6</sup> N/m to stop the motion of the piston in order to generate the pressure. This standard spring component is situated above the solution in the model diagram. The results of this experiment are shown in Figure 1. </p>
</html>"));
      end HydrogenCombustion;

      model WaterVaporization "Evaporation of water"
         extends Modelica.Icons.Example;

         parameter Modelica.SIunits.Temperature T_start=273.15
          "Initial temperature";

        Physiolib.Chemical.Components.Solution liquid(
          temperature_start=T_start,
          useElectricPort=true,
          useMechanicPorts=true,
          useThermalPort=true)
          annotation (Placement(transformation(extent={{-98,-98},{-6,-8}})));

        //  kH_T0(displayUnit="(mol/kg H2O)/bar at 25degC,101325Pa")= 0.00062064026806947,

        Physiolib.Chemical.Components.Substance H2O_liquid(substanceData=Media.Substance.Water_liquid,
            amountOfSubstance_start=55.508) "Liquid water"
          annotation (Placement(transformation(extent={{-30,-64},{-50,-44}})));

        Physiolib.Chemical.Components.Solution gas(
          temperature_start=T_start,
          useMechanicPorts=true,
          useThermalPort=true,
          redeclare package stateOfMatter = Chemical.Interfaces.IdealGas)
          annotation (Placement(transformation(extent={{-46,6},{46,96}})));
                                      /*volume_start(
        displayUnit="l") = 0.001, */
        Physiolib.Chemical.Components.GasSolubility gasSolubility(
            useWaterCorrection=false, KC=10)
          annotation (Placement(transformation(extent={{-98,24},{-78,44}})));
        Physiolib.Chemical.Components.Substance H2O_gaseuous(
          redeclare package stateOfMatter =
              Physiolib.Chemical.Interfaces.IdealGas,
          substanceData=Media.Substance.Water_gas,
          amountOfSubstance_start(displayUnit="mmol") = 0.001)
          annotation (Placement(transformation(extent={{28,50},{8,70}})));
      Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
                                                             fixedTemperature
                    annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            origin={84,8})));
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-80,-36},{-60,-16}})));
        Modelica.Blocks.Sources.Clock clock(offset=1*T_start)
          annotation (Placement(transformation(extent={{62,36},{82,56}})));
        Physiolib.Chemical.Components.Substance otherSubstances(substanceData=
              Media.Substance.Water_liquid, amountOfSubstance_start=1)
          annotation (Placement(transformation(extent={{0,28},{20,48}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(
          G=1e6) annotation (Placement(transformation(extent={{48,-8},{68,12}})));
        Modelica.Mechanics.Translational.Components.Fixed fixed1
          annotation (Placement(transformation(extent={{-24,12},{-4,32}})));
        Modelica.Mechanics.Translational.Components.Fixed fixed2
          annotation (Placement(transformation(extent={{-74,-92},{-54,-72}})));
      equation

        connect(H2O_liquid.solution, liquid.solution) annotation (Line(
            points={{-34,-64},{-34,-97.1},{-24.4,-97.1}},
            color={127,127,0}));
        connect(H2O_liquid.port_a, gasSolubility.liquid_port) annotation (Line(
            points={{-50,-54},{-88,-54},{-88,24}},
            color={158,66,200},
            thickness=1));
        connect(gas.solution, H2O_gaseuous.solution) annotation (Line(
            points={{27.6,6.9},{24,6.9},{24,50}},
            color={127,127,0}));
        connect(H2O_gaseuous.port_a, gasSolubility.gas_port) annotation (Line(
            points={{8,60},{-88,60},{-88,44}},
            color={158,66,200},
            thickness=1));
        connect(liquid.electricPin, ground.p) annotation (Line(
            points={{-79.6,-8},{-79.6,-8},{-70,-8},{-70,-16}},
            color={0,0,255}));
      connect(fixedTemperature.T, clock.y) annotation (Line(
          points={{96,8},{98,8},{98,46},{83,46}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(gas.solution, otherSubstances.solution) annotation (Line(
          points={{27.6,6.9},{4,6.9},{4,28}},
          color={127,127,0}));
      connect(fixedTemperature.port, thermalConductor.port_b) annotation (Line(
          points={{74,8},{72,8},{72,2},{68,2}},
          color={191,0,0}));
      connect(gas.heatPort, thermalConductor.port_a) annotation (Line(
          points={{-27.6,5.1},{-28,5.1},{-28,2},{48,2}},
          color={191,0,0}));
      connect(liquid.heatPort, thermalConductor.port_a) annotation (Line(
          points={{-79.6,-98.9},{-80,-98.9},{-80,-102},{-8,-102},{-8,2},{48,2}},
          color={191,0,0}));
      connect(liquid.bottom, fixed2.flange) annotation (Line(
          points={{-52,-98.9},{-52,-82},{-64,-82}},
          color={0,127,0}));
      connect(gas.bottom, fixed1.flange) annotation (Line(
          points={{0,5.1},{0,22},{-14,22}},
          color={0,127,0}));
        annotation (
          experiment(StopTime=100),
          Documentation(info="<html>
<p>Demonstraiton of water vaporization between two solutions - liquid and gaseous. The temperature is increased in time to illustrate, how the vaporization rate rises in higher temperatures. See liquid.T and liquid.Volume, compared to gas.T and gas.volume.</p>
</html>",   revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end WaterVaporization;

      model WaterSublimation "Sublimation of water"
         extends Modelica.Icons.Example;

         parameter Modelica.SIunits.Temperature T_start=273.15-50
          "Initial temperature";

        //  kH_T0(displayUnit="(mol/kg H2O)/bar at 25degC,101325Pa")= 0.00062064026806947,

        Physiolib.Chemical.Components.Solution gas(
          temperature_start=T_start,
          useMechanicPorts=true,
          useThermalPort=true,
          redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
          BasePressure=600)
          annotation (Placement(transformation(extent={{-46,6},{46,96}})));
                                      /*volume_start(
        displayUnit="l") = 0.001, */
        Physiolib.Chemical.Components.Substance H2O_gaseuous(
          redeclare package stateOfMatter =
              Physiolib.Chemical.Interfaces.IdealGas,
          substanceData=Media.Substance.Water_gas,
          amountOfSubstance_start(displayUnit="mmol") = 0.001)
          annotation (Placement(transformation(extent={{24,56},{4,76}})));
      Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
                                                             fixedTemperature
                    annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            origin={84,8})));
        Modelica.Blocks.Sources.Clock clock(offset=1*T_start)
          annotation (Placement(transformation(extent={{62,36},{82,56}})));
        Physiolib.Chemical.Components.Substance otherSubstances(substanceData=
              Media.Substance.Water_liquid, amountOfSubstance_start=1)
          annotation (Placement(transformation(extent={{-4,36},{16,56}})));
        Physiolib.Chemical.Components.Solution solid(
          temperature_start=T_start,
          BasePressure=600,
          useElectricPort=true,
          useMechanicPorts=true,
          useThermalPort=true)
          annotation (Placement(transformation(extent={{8,-98},{100,-8}})));
        Physiolib.Chemical.Components.Substance H2O_solid(amountOfSubstance_start=
             55.508, substanceData=Media.Substance.Water_IceIh) "Solid water"
          annotation (Placement(transformation(extent={{70,-62},{50,-42}})));
        Physiolib.Chemical.Components.GasSolubility gasSolubility1(
            useWaterCorrection=false, KC=10)
          annotation (Placement(transformation(extent={{-76,18},{-56,38}})));
        Modelica.Electrical.Analog.Basic.Ground ground1
          annotation (Placement(transformation(extent={{12,-38},{32,-18}})));
        Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=1e6)
          annotation (Placement(transformation(extent={{48,-8},{68,12}})));
        Modelica.Mechanics.Translational.Components.Fixed fixed1
          annotation (Placement(transformation(extent={{-18,14},{2,34}})));
        Modelica.Mechanics.Translational.Components.Fixed fixed2
          annotation (Placement(transformation(extent={{32,-92},{52,-72}})));
      equation

        connect(gas.solution, H2O_gaseuous.solution) annotation (Line(
            points={{27.6,6.9},{20,6.9},{20,56}},
            color={127,127,0}));
      connect(fixedTemperature.T, clock.y) annotation (Line(
          points={{96,8},{98,8},{98,46},{83,46}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(gas.solution, otherSubstances.solution) annotation (Line(
          points={{27.6,6.9},{24,6.9},{24,6},{20,6},{20,36},{0,36}},
          color={127,127,0}));
        connect(solid.solution, H2O_solid.solution) annotation (Line(
            points={{81.6,-97.1},{60,-97.1},{60,-62},{66,-62}},
            color={127,127,0}));
        connect(H2O_gaseuous.port_a, gasSolubility1.gas_port) annotation (Line(
            points={{4,66},{-66,66},{-66,38}},
            color={158,66,200},
            thickness=1));
        connect(gasSolubility1.liquid_port, H2O_solid.port_a) annotation (Line(
            points={{-66,18},{-66,-52},{50,-52}},
            color={158,66,200},
            thickness=1));
        connect(solid.electricPin, ground1.p) annotation (Line(
            points={{26.4,-8},{22,-8},{22,-18}},
            color={0,0,255}));
        connect(fixedTemperature.port, thermalConductor.port_b) annotation (Line(
            points={{74,8},{72,8},{72,2},{68,2}},
            color={191,0,0}));
        connect(gas.heatPort, thermalConductor.port_a) annotation (Line(
            points={{-27.6,5.1},{-28,5.1},{-28,2},{48,2}},
            color={191,0,0}));
        connect(solid.heatPort, thermalConductor.port_a) annotation (Line(
            points={{26.4,-98.9},{-2,-98.9},{-2,2},{48,2}},
            color={191,0,0}));
      connect(solid.bottom, fixed2.flange) annotation (Line(
          points={{54,-98.9},{54,-82},{42,-82}},
          color={0,127,0}));
      connect(fixed1.flange, gas.bottom) annotation (Line(
          points={{-8,24},{0,24},{0,5.1}},
          color={0,127,0}));
        annotation (
          experiment(StopTime=50.01),
          Documentation(info="<html>
<p>Demonstraiton of water sublimation between two solutions - solid and gaseous. The temperature is increased in time to illustrate, how the sublimation rate rises in higher temperatures. See solid.T and solid.Volume, compared to gas.T and gas.volume. Note, that the liquid phase is omitted here.</p>
</html>",   revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end WaterSublimation;

      model GasSolubility "Dissolution of gases in liquids"
         extends Modelica.Icons.Example;

        Physiolib.Chemical.Components.Solution blood_plasma
          annotation (Placement(transformation(extent={{-100,-76},{-8,14}})));
                                            //(amountOfSolution_start=52.3)
        Physiolib.Chemical.Components.Solution red_cells
          annotation (Placement(transformation(extent={{8,-78},{102,14}})));
                                         //(amountOfSolution_start=39.7)

        Physiolib.Chemical.Components.GasSolubility CO2_dissolutionP
          annotation (Placement(transformation(extent={{-78,44},{-58,64}})));
        //  kH_T0(displayUnit="(mol/kg H2O)/bar at 25degC,101325Pa")= 0.00062064026806947,

        Physiolib.Chemical.Components.Substance CO2_unbound_plasma(substanceData=
              Media.Substance.CarbonDioxide_aqueous)
          "Free dissolved CO2 in blood plasma"
          annotation (Placement(transformation(extent={{-90,-24},{-70,-4}})));
        Physiolib.Chemical.Components.GasSolubility O2_dissolutionP
          annotation (Placement(transformation(extent={{-34,44},{-14,64}})));

        Physiolib.Chemical.Sources.ExternalIdealGasSubstance O2_g_n1(
          substanceData=Media.Substance.Oxygen_gas,
          PartialPressure=12665.626804425,
          TotalPressure=101325.0144354)
          annotation (Placement(transformation(extent={{22,76},{42,96}})));
        Physiolib.Chemical.Components.Substance O2_unbound_plasma(substanceData=
              Media.Substance.Oxygen_aqueous) "Free dissolved O2 in blood plasma"
          annotation (Placement(transformation(extent={{-50,-26},{-30,-6}})));
        Physiolib.Chemical.Components.GasSolubility CO2_dissolutionE
          annotation (Placement(transformation(extent={{36,44},{56,64}})));

        Physiolib.Chemical.Sources.ExternalIdealGasSubstance CO2_g_n2(
          substanceData=Media.Substance.CarbonDioxide_gas,
          PartialPressure=5332.8954966,
          TotalPressure=101325.0144354)
          annotation (Placement(transformation(extent={{-56,78},{-36,98}})));

        Physiolib.Chemical.Components.Substance CO2_unbound_erythrocyte(
            substanceData=Media.Substance.CarbonDioxide_aqueous)
          "Free dissolved CO2 in red cells"
          annotation (Placement(transformation(extent={{18,-32},{38,-12}})));

        Physiolib.Chemical.Components.GasSolubility O2_dissolutionE_NIST(
            useWaterCorrection=true)
          annotation (Placement(transformation(extent={{78,44},{98,64}})));
        Physiolib.Chemical.Components.Substance O2_unbound_erythrocyte_NIST(
            substanceData=Media.Substance.Oxygen_aqueous)
          "Free dissolved O2 in red cells"
          annotation (Placement(transformation(extent={{58,-32},{78,-12}})));
        Physiolib.Chemical.Components.Substance otherSubstances(substanceData=
              Media.Substance.Water_liquid, amountOfSubstance_start=52.3)
          annotation (Placement(transformation(extent={{-42,-70},{-22,-50}})));
        Physiolib.Chemical.Components.Substance otherSubstances_erythrocytes(
            substanceData=Media.Substance.Water_liquid, amountOfSubstance_start=
              38.7)
          annotation (Placement(transformation(extent={{64,-68},{84,-48}})));
      equation

      connect(CO2_g_n2.port_a, CO2_dissolutionP.gas_port) annotation (Line(
          points={{-36,88},{-26,88},{-26,72},{-68,72},{-68,64}},
          color={158,66,200},
          thickness=1));
      connect(CO2_g_n2.port_a, CO2_dissolutionE.gas_port) annotation (Line(
          points={{-36,88},{-26,88},{-26,72},{46,72},{46,64}},
          color={158,66,200},
          thickness=1));
      connect(CO2_dissolutionP.liquid_port, CO2_unbound_plasma.port_a)
        annotation (Line(
          points={{-68,44},{-68,-14},{-70,-14}},
          color={158,66,200},
          thickness=1));
      connect(CO2_dissolutionE.liquid_port, CO2_unbound_erythrocyte.port_a)
        annotation (Line(
          points={{46,44},{46,-22},{38,-22}},
          color={158,66,200},
          thickness=1));
      connect(O2_g_n1.port_a, O2_dissolutionP.gas_port) annotation (Line(
          points={{42,86},{66,86},{66,70},{-24,70},{-24,64}},
          color={158,66,200},
          thickness=1));
      connect(O2_dissolutionP.liquid_port, O2_unbound_plasma.port_a) annotation (
          Line(
          points={{-24,44},{-24,-16},{-30,-16}},
          color={158,66,200},
          thickness=1));
      connect(CO2_unbound_plasma.solution, blood_plasma.solution) annotation (
          Line(
          points={{-86,-24},{-86,-75.1},{-26.4,-75.1}},
          color={127,127,0}));
      connect(O2_unbound_plasma.solution, blood_plasma.solution) annotation (Line(
          points={{-46,-26},{-46,-75.1},{-26.4,-75.1}},
          color={127,127,0}));
      connect(CO2_unbound_erythrocyte.solution, red_cells.solution) annotation (
          Line(
          points={{22,-32},{22,-77.08},{83.2,-77.08}},
          color={127,127,0}));
      connect(O2_g_n1.port_a, O2_dissolutionE_NIST.gas_port) annotation (Line(
          points={{42,86},{66,86},{66,70},{88,70},{88,64}},
          color={158,66,200},
          thickness=1));
      connect(O2_dissolutionE_NIST.liquid_port, O2_unbound_erythrocyte_NIST.port_a)
        annotation (Line(
          points={{88,44},{88,-22},{78,-22}},
          color={158,66,200},
          thickness=1));
      connect(O2_unbound_erythrocyte_NIST.solution, red_cells.solution)
        annotation (Line(
          points={{62,-32},{62,-77.08},{83.2,-77.08}},
          color={127,127,0}));
      connect(blood_plasma.solution, otherSubstances.solution) annotation (Line(
          points={{-26.4,-75.1},{-38,-75.1},{-38,-70}},
          color={127,127,0}));
      connect(red_cells.solution, otherSubstances_erythrocytes.solution)
        annotation (Line(
          points={{83.2,-77.08},{68,-77.08},{68,-68}},
          color={127,127,0}));
        annotation (
          experiment(StopTime=1e-005),
          Documentation(info="<html>
<p>Demonstration of different blood gases solubility in erythrocytes and in plasma. The difference is governed by various amount of other substances in the solution. </p>
<p>Please note, that the total content of CO2 and O2 in blood plasma and erythrocytes must be determined by including bicarbonate and hemoglobin connected amounts. </p>
</html>",   revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end GasSolubility;

      model EnzymeKinetics "Basic enzyme kinetics"
        extends Modelica.Icons.Example;

        Physiolib.Chemical.Components.Solution solution
          annotation (Placement(transformation(extent={{-100,-100},{100,100}})));

        //The huge negative Gibbs energy of the product will make the second reaction almost irreversible (e.g. K=exp(50))
        Physiolib.Chemical.Components.Substance P(substanceData(DfG_25degC_1bar=-
                Modelica.Constants.R*298.15*50))
          annotation (Placement(transformation(extent={{92,-12},{72,8}})));
        Physiolib.Chemical.Components.Substance S(amountOfSubstance_start=1)
          annotation (Placement(transformation(extent={{-92,-14},{-72,6}})));

           parameter Modelica.SIunits.AmountOfSubstance tE=1e-6
          "Total amount of enzyme";
           parameter Real k_cat(unit="1/s", displayUnit="1/min")= 1
          "Forward rate of second reaction";
           constant Modelica.SIunits.Concentration Km=0.1
          "Michaelis constant = substrate concentration at rate of half Vmax";

          parameter Modelica.SIunits.MolarFlowRate Vmax=1e-5*k_cat
          "Maximal molar flow";
          parameter Modelica.SIunits.AmountOfSubstance AmountOfSolution= 55.508
          "Amount of solution used in kinetics";

        Physiolib.Chemical.Components.Substance ES(substanceData(DfG_25degC_1bar=
                -Modelica.Constants.R*298.15*log(2/Km)), amountOfSubstance_start=
              tE/2)
          annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
        Physiolib.Chemical.Components.Substance E(amountOfSubstance_start=tE/2)
          annotation (Placement(transformation(extent={{-10,38},{10,58}})));
        Physiolib.Chemical.Components.Reaction chemicalReaction(nS=2, KC=Vmax/(2*
              Modelica.Constants.R*298.15*log(2)))
          annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));

        Physiolib.Chemical.Components.Reaction chemicalReaction1(nP=2, KC=Vmax/(2
              *Modelica.Constants.R*298.15*(50 - log(2))))
          annotation (Placement(transformation(extent={{24,-10},{44,10}})));

        Physiolib.Chemical.Components.Substance otherSubstances(substanceData=
              Media.Substance.Water_liquid, amountOfSubstance_start=52.3)
          annotation (Placement(transformation(extent={{42,-76},{62,-56}})));
      equation
           //Michaelis-Menton: v=((E.q_out.conc + ES.q_out.conc)*k_cat)*S.concentration/(Km+S.concentration);

        connect(S.port_a, chemicalReaction.substrates[1]) annotation (Line(
            points={{-72,-4},{-56,-4},{-56,-2},{-42,-2}},
            color={158,66,200},
            thickness=1));
        connect(chemicalReaction.products[1], ES.port_a) annotation (Line(
            points={{-22,0},{8,0}},
            color={158,66,200},
            thickness=1));
        connect(ES.port_a, chemicalReaction1.substrates[1]) annotation (Line(
            points={{8,0},{24,0}},
            color={158,66,200},
            thickness=1));
        connect(E.port_a, chemicalReaction.substrates[2]) annotation (Line(
            points={{10,48},{-52,48},{-52,2},{-42,2}},
            color={158,66,200},
            thickness=1));
        connect(E.port_a, chemicalReaction1.products[2]) annotation (Line(
            points={{10,48},{54,48},{54,2},{44,2}},
            color={158,66,200},
            thickness=1));
        connect(chemicalReaction1.products[1], P.port_a) annotation (Line(
            points={{44,-2},{58,-2},{58,-2},{72,-2}},
            color={158,66,200},
            thickness=1));
        connect(E.solution, solution.solution) annotation (Line(
            points={{-6,38},{-8,38},{-8,-98},{60,-98}},
            color={127,127,0}));
        connect(ES.solution, solution.solution)
          annotation (Line(points={{-8,-10},{-8,-98},{60,-98}},         color={127,127,0}));

        connect(S.solution, solution.solution) annotation (Line(
            points={{-88,-14},{-88,-56},{-8,-56},{-8,-98},{60,-98}},
            color={127,127,0}));
        connect(P.solution, solution.solution) annotation (Line(
            points={{88,-12},{88,-98},{60,-98}},
            color={127,127,0}));
      connect(solution.solution, otherSubstances.solution) annotation (Line(
          points={{60,-98},{46,-98},{46,-76}},
          color={127,127,0}));
            annotation ( Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",       info="<html>
<p>Be carefull, the assumption for Michaelis-Menton are very strong: </p>
<p>The substrate must be in sufficiently high concentration and the product must be in very low concentration to reach almost all enzyme in enzyme-substrate complex all time. ([S] &gt;&gt; Km) &amp;&amp; ([P] &lt;&lt; K2)</p>
<p><br>To recalculate the enzyme kinetics from Michaelis-Menton parameters Km, tE a k_cat is selected the same half-rate of the reaction defined as:</p>
<p>E = ES = tE/2 .. the amount of free enzyme is the same as the amount of enzyme-substrate complexes</p>
<p>S = Km .. the amount of substrate is Km</p>
<p>r = Vmax/2 = tE*k_cat / 2 .. the rate of reaction is the half of maximal rate</p>
<p><br>Conversions of molar concentration to mole fraction (MM is molar mass of the solvent in solution -&gt; 55.508 kg/mol for water):</p>
<p>x(Km) = Km/MM</p>
<p>x(tE) = tE/MM</p>
<p>xS = S/MM = Km/MM</p>
<p><br>The new kinetics of the system defined as:</p>
<p>uS&deg; = DfG(S) = 0</p>
<p>uE&deg; = DfG(E) = 0</p>
<p>uES&deg; = <b>DfG(ES) = DfG(S) + DfG(E) - R*T*ln(2/x(Km))</b></p>
<p>from dissociation coeficient of the frist reaction 2/x(Km) = xSE/(xS*xE) = exp((uE&deg; + uS&deg; - uES&deg;)/(RT))</p>
<p>uP&deg; = DfG(P) </p>
<p><br>r = Vmax/2</p>
<p>r = -kC1 * (uES&deg; - uE&deg; - uS&deg; + R*T*ln(xES/(xE*xS) ) = -kC1 * (-R*T*ln(2/x(Km)) + R*T*ln(xS) ) = kC1 * R * T * ln(2)</p>
<p>because xES=xE this time</p>
<p>r = -kC2 * (uP&deg; + uE&deg; - uES&deg; + R*T*ln(xP*xE/xES) ) = -kC2 * (DfG(P) - uES&deg; + R*T*ln(xP) ) = kC2 * (-DfG(P) - R * T * ln(2))</p>
<h4>kC1 = (Vmax/2) / (R * T * ln(2))</h4>
<h4>kC2 = (Vmax/2) / ( -DfG(P) - R * T * ln(2) ) </h4>
<p><br>For example in case of C=AmountOfSolution/(Tau*ActivationPotential) we can rewrite C to ActivationPotential (Be carefull: this energy is not the same as in <a href=\"http://en.wikipedia.org/wiki/Arrhenius_equation\">Arrhenius equation</a> or in Transition State Theory):</p>
<p>ActivationPotential1 = AmountOfSolution/(Tau*(Vmax/2)) * R * T * ln(2) </p>
<p>ActivationPotential2 = AmountOfSolution/(Tau*(Vmax/2)) * ( -DfG(P) - R * T * ln(2) ) </p>
<p><br>where</p>
<p>AmountOfSolution = MM = 55.508 (for water)</p>
<p>Tau = 1 s (just to be physical unit correct)</p>
<p>DfG(P) = -R*T*50 is Gibbs energy of formation of product (setting negative enough makes second reaction almost irreversible)</p>
<h4>The maximum of the new enzyme kinetics</h4>
<p>The enzymatic rate must have a maximum near of Vmax. </p>
<p>The new maximum is a litle higher: Vmax * (1 + 1/( -uP&deg;/(R*T*ln(2)) - 1) ), for example if -uP&deg;/RT = 50, the new maximum is around 1.014*Vmax, where Vmax is the maximum of Michaelis Menten.</p>
<p>The proof:</p>
<p>We want to sutisfied the following inequality:</p>
<p>-kC2 * (uP&deg; + uE&deg; - uES&deg; + R*T*ln(xP*xE/xES) ) ?=&lt;? Vmax * (1 + 1/( -uP&deg;/(R*T*ln(2)) - 1) )</p>
<p><br>(Vmax/2) * (uP&deg; + uE&deg; - uES&deg; + R*T*ln(xP*xE/xES) ) / ( - uP&deg; - R * T * ln(2) ) ?=&lt;? Vmax*(1 + R*T*ln(2) / ( -uP&deg; - R*T*ln(2)) )</p>
<p>(uP&deg; +<b> </b>R*T*ln(2/x(Km)) + R*T*ln(xP*xE/xES) ) ?=&lt;? 2*( - uP&deg; - R * T * ln(2) ) + 2*R*T*ln(2)</p>
<p>R*T*ln(xP*xE/xES) ?=&lt;? - uP&deg; - R*T*ln(2/x(Km)) </p>
<p>xP*xE/xES ?=&lt;? exp((- uP&deg; - R*T*ln(2/x(Km))/(R*T))</p>
<p>The equality is the equation of the equilibrium: xP*xE/xES = exp((- uP&deg; - uE&deg; + uES&deg; )/(R*T)) = exp((- uP&deg; - R*T*ln(2/x(Km))/(R*T))</p>
<p>If the equilibrium of the reaction is reached only by forward rate then xP*xE/xES must be less than the dissociation constant.</p>
<h4>The increasing of the amount of the enzyme</h4>
<p>In the situation of doubled amount of enzyme should double also the maximal speed of the reaction, shouldn&apos;t?</p>
<p>The assumptions of</p>
</html>"),experiment(StopTime=199000));
      end EnzymeKinetics;

      model ElectrochemicalCell
        "The electrochemical cell: Pt(s) | H2(g) | H+(aq), Cl-(aq) | AgCl(s) | Ag(s)"
       extends Modelica.Icons.Example;

        Physiolib.Chemical.Components.Solution cathode(ElectricGround=false)
          annotation (Placement(transformation(extent={{-88,-44},{-46,72}})));
        Physiolib.Chemical.Components.Solution anode(ElectricGround=false)
          annotation (Placement(transformation(extent={{62,-50},{96,50}})));

        Physiolib.Chemical.Components.Solution solution1(ElectricGround=false)
          annotation (Placement(transformation(extent={{-30,-60},{38,6}})));

        Physiolib.Chemical.Components.Substance Ag(substanceData=Media.Substance.Silver_solid,
            amountOfSubstance_start=1)
          annotation (Placement(transformation(extent={{-72,-30},{-52,-10}})));
        Physiolib.Chemical.Components.Substance Cl(substanceData=Media.Substance.Chloride_aqueous,
            amountOfSubstance_start=1)
          annotation (Placement(transformation(extent={{-2,-36},{-22,-16}})));
        Physiolib.Chemical.Components.Substance AgCl(substanceData=Media.Substance.SilverChloride_solid)
          annotation (Placement(transformation(extent={{-76,4},{-56,24}})));
        Physiolib.Chemical.Sources.ExternalIdealGasSubstance H2(
          substanceData=Media.Substance.Hydrogen_gas,
          PartialPressure=100000,
          TotalPressure=100000)
          annotation (Placement(transformation(extent={{24,32},{44,52}})));
        Physiolib.Chemical.Components.Substance H(substanceData=Media.Substance.Proton_aqueous,
            amountOfSubstance_start=1)
          annotation (Placement(transformation(extent={{6,-36},{26,-16}})));
        Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
          annotation (Placement(transformation(extent={{-6,64},{14,84}})));
        Physiolib.Chemical.Components.Reaction electrodeReaction(nP=2, p={2,2})
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=270,
              origin={52,6})));
        Physiolib.Chemical.Components.Reaction electrodeReaction1(nS=2, nP=2)
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-40,0})));

        Physiolib.Chemical.Components.ElectronTransfer electrone
          annotation (Placement(transformation(extent={{-78,32},{-58,52}})));
                                   //(substanceData=Physiolib.Examples.Substances.Electrone_solid)
        Physiolib.Chemical.Components.ElectronTransfer electrone1
          annotation (Placement(transformation(extent={{88,-26},{68,-6}})));
                                    //(substanceData=Physiolib.Examples.Substances.Electrone_solid)

      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{84,-84},{104,-64}})));
      equation
        connect(Ag.port_a, electrodeReaction1.substrates[1]) annotation (Line(
            points={{-52,-20},{-42,-20},{-42,-10},{-42,-10}},
            color={158,66,200},
            thickness=1));
        connect(Cl.port_a, electrodeReaction1.substrates[2]) annotation (Line(
            points={{-22,-26},{-38,-26},{-38,-10}},
            color={158,66,200},
            thickness=1));
        connect(AgCl.port_a, electrodeReaction1.products[1]) annotation (Line(
            points={{-56,14},{-42,14},{-42,10}},
            color={158,66,200},
            thickness=1));
        connect(H2.port_a, electrodeReaction.substrates[1]) annotation (Line(
            points={{44,42},{52,42},{52,16}},
            color={158,66,200},
            thickness=1));
        connect(H.port_a, electrodeReaction.products[1]) annotation (Line(
            points={{26,-26},{54,-26},{54,-4}},
            color={158,66,200},
            thickness=1));
        connect(electrodeReaction.products[2], electrone1.port_a) annotation (Line(
            points={{50,-4},{50,-16},{68,-16}},
            color={158,66,200},
            thickness=1));
        connect(electrodeReaction1.products[2], electrone.port_a) annotation (Line(
            points={{-38,10},{-38,42},{-58,42}},
            color={158,66,200},
            thickness=1));
        connect(Cl.solution, solution1.solution) annotation (Line(
            points={{-6,-36},{-6,-40},{24.4,-40},{24.4,-59.34}},
            color={127,127,0}));
        connect(H.solution, solution1.solution) annotation (Line(points={{10,-36},
              {10,-40},{24.4,-40},{24.4,-59.34}},
                                           color={127,127,0}));
      connect(electrone.solution, cathode.solution) annotation (Line(
          points={{-74,32},{-74,-34},{-68,-34},{-68,-42.84},{-54.4,-42.84}},
          color={127,127,0}));
      connect(electrone1.solution, anode.solution) annotation (Line(
          points={{84,-26},{84,-49},{89.2,-49}},
          color={127,127,0}));
      connect(AgCl.solution, cathode.solution) annotation (Line(
          points={{-72,4},{-74,4},{-74,-34},{-68,-34},{-68,-42.84},{-54.4,-42.84}},
          color={127,127,0}));
      connect(Ag.solution, cathode.solution) annotation (Line(
          points={{-68,-30},{-68,-42.84},{-54.4,-42.84}},
          color={158,66,200}));
        connect(voltageSensor.p, electrone.pin) annotation (Line(
            points={{-6,74},{-96,74},{-96,42},{-78,42}},
            color={0,0,255}));
        connect(voltageSensor.n, electrone1.pin) annotation (Line(
            points={{14,74},{92,74},{92,-16},{88,-16}},
            color={0,0,255}));
        connect(electrone1.pin, ground.p) annotation (Line(
            points={{88,-16},{92,-16},{92,-64},{94,-64}},
            color={0,0,255}));
        annotation (
        experiment(StopTime=1),      Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end ElectrochemicalCell;

      model RedCellMembrane
       // import Chemical;
        extends Modelica.Icons.Example;

        parameter Real KC=1;//e-6 "Slow down factor";

        Physiolib.Chemical.Components.Solution blood_erythrocytes(ElectricGround=
              false, temperature_start=310.15)
          annotation (Placement(transformation(extent={{-180,-100},{180,-10}})));
        Physiolib.Chemical.Components.Solution blood_plasma(temperature_start=
              310.15)
          annotation (Placement(transformation(extent={{-180,12},{180,100}})));

        Physiolib.Chemical.Components.Substance HCO3(substanceData=Media.Substance.Bicarbonate_blood,
            amountOfSubstance_start(displayUnit="mmol") = 0.024) annotation (
            Placement(transformation(extent={{-10,-10},{10,10}}, origin={-18,30})));

        Physiolib.Chemical.Components.Substance H2O(substanceData=Media.Substance.Water_liquid,
            amountOfSubstance_start=51.8*0.994648)
          annotation (Placement(transformation(extent={{-146,20},{-166,40}})));
        Physiolib.Chemical.Components.Substance HCO3_E(substanceData=Media.Substance.Bicarbonate_blood,
            amountOfSubstance_start(displayUnit="mmol") = 0.0116)
          annotation (Placement(transformation(extent={{-28,-38},{-8,-18}})));
        Physiolib.Chemical.Components.Substance H2O_E(substanceData=Media.Substance.Water_liquid,
            amountOfSubstance_start=38.7*0.994648)
          annotation (Placement(transformation(extent={{-144,-38},{-164,-18}})));
        Physiolib.Chemical.Components.Substance Cl_E(substanceData=Media.Substance.Chloride_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.0499)
          annotation (Placement(transformation(extent={{-4,-38},{16,-18}})));
        Physiolib.Chemical.Components.Substance Cl(substanceData=Media.Substance.Chloride_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.123)
          annotation (Placement(transformation(extent={{-4,20},{16,40}})));

      //  Real pH_e; //,pH_p;

        Physiolib.Chemical.Components.Membrane Aquapirin(KC=KC) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-168,0})));
        Physiolib.Chemical.Components.Membrane Band3(KC=KC) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-6,0})));
        Physiolib.Chemical.Components.Membrane Band3_(useKineticsInput=false, KC=
              KC) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={18,0})));
        Physiolib.Chemical.Components.Substance permeableUncharged(
            amountOfSubstance_start(displayUnit="mmol") = 0.0118)
          annotation (Placement(transformation(extent={{166,20},{146,40}})));
        Physiolib.Chemical.Components.Substance permeableUncharged_E(
            amountOfSubstance_start(displayUnit="mmol") = 0.00903, substanceData(
              MolarWeight=0.1))
          annotation (Placement(transformation(extent={{164,-38},{144,-18}})));
        Physiolib.Chemical.Components.Substance chargedImpermeable_E(
            amountOfSubstance_start(displayUnit="mmol") = 0.0165, substanceData(
              MolarWeight=1))
          annotation (Placement(transformation(extent={{144,-62},{164,-42}})));
        Physiolib.Chemical.Components.Membrane leak(useKineticsInput=false, KC=KC)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={140,0})));
        Physiolib.Chemical.Components.Substance Lac_E(substanceData=Media.Substance.Chloride_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.00062)
          annotation (Placement(transformation(extent={{56,-38},{76,-18}})));
        Physiolib.Chemical.Components.Substance Lac(substanceData=Media.Substance.Chloride_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.00131)
          annotation (Placement(transformation(extent={{56,20},{76,40}})));
        Physiolib.Chemical.Components.Membrane MCT_(useKineticsInput=false, KC=KC)
          "Monocarboxylate transporters" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={78,0})));
        Physiolib.Chemical.Components.Substance CO2(substanceData=Media.Substance.CarbonDioxide_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.00167)
          "free dissolved unbound CO2"
          annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
        Physiolib.Chemical.Components.Substance CO2_E(substanceData=Media.Substance.CarbonDioxide_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.00125)
          "free dissolved unbound CO2"
          annotation (Placement(transformation(extent={{-58,-38},{-38,-18}})));
        Physiolib.Chemical.Components.Membrane freeCO2(KC=KC) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-36,0})));
        Physiolib.Chemical.Components.Substance O2(substanceData=Media.Substance.Oxygen_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.000167)
          "free dissolved undound oxygen"
          annotation (Placement(transformation(extent={{96,20},{116,40}})));
        Physiolib.Chemical.Components.Membrane freeO2(KC=KC) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={118,0})));
        Physiolib.Chemical.Components.Substance O2_E(amountOfSubstance_start(
              displayUnit="mmol") = 0.000125, substanceData=Media.Substance.Oxygen_aqueous)
          "free dissolved undound O2"
          annotation (Placement(transformation(extent={{96,-38},{116,-18}})));
        Physiolib.Chemical.Components.Substance K(substanceData=Media.Substance.Potassium_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.004)
          annotation (Placement(transformation(extent={{-92,20},{-112,40}})));
        Physiolib.Chemical.Components.Substance Na(substanceData=Media.Substance.Sodium_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.138)
          annotation (Placement(transformation(extent={{-118,20},{-138,40}})));
        Physiolib.Chemical.Components.Substance Na_E(substanceData=Media.Substance.Sodium_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.007)
          annotation (Placement(transformation(extent={{-118,-38},{-138,-18}})));
        Physiolib.Chemical.Components.Substance K_E(substanceData=Media.Substance.Potassium_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.096)
          annotation (Placement(transformation(extent={{-112,-38},{-92,-18}})));
        Physiolib.Chemical.Components.Substance H2PO4_E(substanceData=Media.Substance.DihydrogenPhosphate_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.000175)
          annotation (Placement(transformation(extent={{-84,-38},{-64,-18}})));
        Physiolib.Chemical.Components.Substance ADP_E(substanceData(z=-3),
            amountOfSubstance_start(displayUnit="mmol") = 9.6e-05)
          annotation (Placement(transformation(extent={{-114,-62},{-94,-42}})));
        Physiolib.Chemical.Components.Substance ATP_E(substanceData(
            z=-4,
            DfH_25degC=16700,
            DfG_25degC_1bar=30500,
            References={
                "http://www.wiley.com/college/pratt/0471393878/student/review/thermodynamics/7_relationship.html"}),
            amountOfSubstance_start(displayUnit="mmol") = 0.00128)
          annotation (Placement(transformation(extent={{-118,-62},{-138,-42}})));
        Physiolib.Chemical.Components.Substance HPO4_E(substanceData=Media.Substance.HydrogenPhosphate_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.000495)
          annotation (Placement(transformation(extent={{-84,-62},{-64,-42}})));
        Physiolib.Chemical.Components.Substance H2PO4(substanceData=Media.Substance.DihydrogenPhosphate_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.000365)
          annotation (Placement(transformation(extent={{-86,20},{-66,40}})));
        Physiolib.Chemical.Components.Substance HPO4(substanceData=Media.Substance.HydrogenPhosphate_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.001635)
          annotation (Placement(transformation(extent={{-86,42},{-66,62}})));
        Physiolib.Chemical.Components.Substance albumin(substanceData(
            MolarWeight=66.463,
            z=-17,
            density=1080), amountOfSubstance_start(displayUnit="mmol") = 0.0007)
          annotation (Placement(transformation(extent={{116,76},{96,96}})));
        Physiolib.Chemical.Components.Substance globulins(substanceData(
            MolarWeight=34,
            z=-2.43,
            density=1080), amountOfSubstance_start(displayUnit="mmol") = 0.00082)
          annotation (Placement(transformation(extent={{150,76},{130,96}})));
        Physiolib.Chemical.Components.Substance Ca(substanceData=Media.Substance.Calcium_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.00175) "Ca2+"
          annotation (Placement(transformation(extent={{-112,42},{-92,62}})));
        Physiolib.Chemical.Components.Substance Mg(substanceData=Media.Substance.Magnesium_aqueous,
            amountOfSubstance_start(displayUnit="mmol") = 0.00108) "Mg2+"
          annotation (Placement(transformation(extent={{-112,-84},{-92,-64}})));
        Physiolib.Chemical.Components.Substance hemoglobin(substanceData(
            MolarWeight=64,
            z=-4.4,
            density=1500), amountOfSubstance_start(displayUnit="mmol") = 0.00513)
          annotation (Placement(transformation(extent={{94,-94},{74,-74}})));
        Physiolib.Chemical.Components.Substance DPG(amountOfSubstance_start(
              displayUnit="mmol") = 0.0051, substanceData(
            MolarWeight=0.266,
            z=-2.2,
            density=1000))
          annotation (Placement(transformation(extent={{128,-94},{108,-74}})));
        Physiolib.Chemical.Components.Substance GSH(substanceData(
            MolarWeight=0.2,
            z=-1,
            density=1000), amountOfSubstance_start(displayUnit="mmol") = 0.00223)
          annotation (Placement(transformation(extent={{164,-94},{144,-74}})));
      equation
      //  pH_p = -log10(H.a);
       // pH_e = -log10(H_E.a);
      connect(H2O.solution, blood_plasma.solution)
        annotation (Line(points={{-150,20},{108,20},{108,12.88}},
                                                          color={127,127,0}));
      connect(Cl.solution, blood_plasma.solution) annotation (Line(
          points={{0,20},{0,12.88},{108,12.88}},
          color={127,127,0}));
        connect(H2O_E.solution, blood_erythrocytes.solution) annotation (Line(
              points={{-148,-38},{108,-38},{108,-99.1}},
                                                      color={127,127,0}));
        connect(Cl_E.solution, blood_erythrocytes.solution) annotation (Line(
            points={{0,-38},{0,-99.1},{108,-99.1}},
            color={127,127,0}));
        connect(HCO3_E.solution, blood_erythrocytes.solution) annotation (Line(
              points={{-24,-38},{108,-38},{108,-99.1}},
                                                    color={127,127,0}));
        connect(Aquapirin.port_b, H2O_E.port_a) annotation (Line(
            points={{-168,-10},{-168,-28},{-164,-28}},
            color={158,66,200},
            thickness=1));
        connect(Aquapirin.port_a, H2O.port_a) annotation (Line(
            points={{-168,10},{-168,30},{-166,30}},
            color={158,66,200},
            thickness=1));
        connect(Band3.port_a, HCO3.port_a) annotation (Line(
            points={{-6,10},{-6,30},{-8,30}},
            color={158,66,200},
            thickness=1));
        connect(Band3.port_b, HCO3_E.port_a) annotation (Line(
            points={{-6,-10},{-6,-28},{-8,-28}},
            color={158,66,200},
            thickness=1));
        connect(Band3_.port_b, Cl_E.port_a) annotation (Line(
            points={{18,-10},{18,-28},{16,-28}},
            color={158,66,200},
            thickness=1));
        connect(Band3_.port_a, Cl.port_a) annotation (Line(
            points={{18,10},{18,30},{16,30}},
            color={158,66,200},
            thickness=1));
      connect(HCO3.solution, blood_plasma.solution) annotation (Line(
          points={{-24,20},{108,20},{108,12.88}},
          color={127,127,0}));
        connect(blood_plasma.solution, permeableUncharged.solution) annotation (Line(
            points={{108,12.88},{108,20},{162,20}},
            color={127,127,0}));
        connect(blood_erythrocytes.solution, permeableUncharged_E.solution)
          annotation (Line(
            points={{108,-99.1},{108,-38},{160,-38}},
            color={127,127,0}));
        connect(blood_erythrocytes.solution,chargedImpermeable_E. solution)
          annotation (Line(
            points={{108,-99.1},{108,-38},{140,-38},{140,-62},{148,-62}},
            color={127,127,0}));
        connect(permeableUncharged.port_a, leak.port_a) annotation (Line(
            points={{146,30},{140,30},{140,10}},
            color={158,66,200},
            thickness=1));
        connect(permeableUncharged_E.port_a, leak.port_b) annotation (Line(
            points={{144,-28},{140,-28},{140,-10}},
            color={158,66,200},
            thickness=1));
        connect(MCT_.port_a, Lac.port_a) annotation (Line(
            points={{78,10},{78,30},{76,30}},
            color={158,66,200},
            thickness=1));
        connect(MCT_.port_b, Lac_E.port_a) annotation (Line(
            points={{78,-10},{78,-28},{76,-28}},
            color={158,66,200},
            thickness=1));
        connect(Lac.solution, blood_plasma.solution) annotation (Line(
            points={{60,20},{108,20},{108,12.88}},
            color={127,127,0}));
        connect(blood_erythrocytes.solution, Lac_E.solution) annotation (Line(
            points={{108,-99.1},{108,-38},{60,-38}},
            color={127,127,0}));
        connect(CO2.port_a, freeCO2.port_a) annotation (Line(
            points={{-40,30},{-36,30},{-36,10}},
            color={158,66,200},
            thickness=1));
        connect(freeCO2.port_b, CO2_E.port_a) annotation (Line(
            points={{-36,-10},{-36,-28},{-38,-28}},
            color={158,66,200},
            thickness=1));
        connect(blood_plasma.solution, CO2.solution) annotation (Line(
            points={{108,12.88},{108,20},{-56,20}},
            color={127,127,0}));
        connect(CO2_E.solution, blood_erythrocytes.solution) annotation (Line(
            points={{-54,-38},{108,-38},{108,-99.1}},
            color={127,127,0}));
        connect(blood_plasma.solution, O2.solution) annotation (Line(
            points={{108,12.88},{108,20},{100,20}},
            color={127,127,0}));
        connect(O2_E.solution, blood_erythrocytes.solution) annotation (Line(
            points={{100,-38},{108,-38},{108,-99.1}},
            color={127,127,0}));
        connect(O2_E.port_a, freeO2.port_b) annotation (Line(
            points={{116,-28},{118,-28},{118,-10}},
            color={158,66,200},
            thickness=1));
        connect(freeO2.port_a, O2.port_a) annotation (Line(
            points={{118,10},{118,30},{116,30}},
            color={158,66,200},
            thickness=1));
        connect(H2O.solution, K.solution) annotation (Line(
            points={{-150,20},{-96,20}},
            color={158,66,200}));
        connect(H2O.solution, Na.solution) annotation (Line(
            points={{-150,20},{-122,20}},
            color={158,66,200}));
        connect(H2O_E.solution, Na_E.solution) annotation (Line(
            points={{-148,-38},{-122,-38}},
            color={158,66,200}));
        connect(H2O_E.solution, K_E.solution) annotation (Line(
            points={{-148,-38},{-108,-38}},
            color={158,66,200}));
        connect(H2O_E.solution, H2PO4_E.solution) annotation (Line(
            points={{-148,-38},{-80,-38}},
            color={158,66,200}));
        connect(ADP_E.solution, K_E.solution) annotation (Line(
            points={{-110,-62},{-110,-38},{-108,-38}},
            color={158,66,200}));
        connect(ATP_E.solution, Na_E.solution) annotation (Line(
            points={{-122,-62},{-122,-38}},
            color={127,127,0}));
        connect(H2O.solution, H2PO4.solution) annotation (Line(
            points={{-150,20},{-82,20}},
            color={127,127,0}));
        connect(HPO4_E.solution, H2PO4_E.solution) annotation (Line(
            points={{-80,-62},{-110,-62},{-110,-38},{-80,-38}},
            color={127,127,0}));
        connect(HPO4.solution, H2PO4.solution) annotation (Line(
            points={{-82,42},{-82,20}},
            color={158,66,200}));
        connect(albumin.solution, permeableUncharged.solution) annotation (Line(
            points={{112,76},{92,76},{92,20},{162,20}},
            color={127,127,0}));
        connect(globulins.solution, permeableUncharged.solution) annotation (Line(
            points={{146,76},{92,76},{92,20},{162,20}},
            color={127,127,0}));
        connect(Ca.solution, CO2.solution) annotation (Line(
            points={{-108,42},{-82,42},{-82,20},{-56,20}},
            color={127,127,0}));
        connect(Mg.solution, blood_erythrocytes.solution) annotation (Line(
            points={{-108,-84},{-108,-38},{108,-38},{108,-99.1}},
            color={127,127,0}));
        connect(DPG.solution, permeableUncharged_E.solution) annotation (Line(
            points={{124,-94},{140,-94},{140,-38},{160,-38}},
            color={158,66,200}));
        connect(hemoglobin.solution, permeableUncharged_E.solution) annotation (Line(
            points={{90,-94},{140,-94},{140,-38},{160,-38}},
            color={127,127,0}));
        connect(GSH.solution, permeableUncharged_E.solution) annotation (Line(
            points={{160,-94},{140,-94},{140,-38},{160,-38}},
            color={127,127,0}));
        annotation ( Documentation(info="<html>
<p>Blood eqiulibrium across erythrocyte membrane bewteen blood plasma and intracellular fluid of erythrocytes.</p>
<p>Data of blood status are from:</p>
<p>Raftos, J.E., Bulliman, B.T. and Kuchel, P.W. Evaluation of an electrochemical model of erythrocyte pH buffering using 31P nuclear magnetic resonance data. <i>The Journal of general physiology</i> 1990;95(6):1183-1204. </p>
</html>",      revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"),experiment(StopTime=1e-008),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-100},{180,100}}),
                             graphics));
      end RedCellMembrane;

      model LeadAcidBattery
        "The electrochemical cell: PbSO4(s) | Pb(s) | HSO4-(aq) , H+(aq) | PbO2(s) | PbSO4(s) + 2 H2O"
       extends Modelica.Icons.Example;

        Physiolib.Chemical.Components.Solution anode(ElectricGround=false)
          annotation (Placement(transformation(extent={{24,-76},{58,32}})));

        Physiolib.Chemical.Components.Solution cathode(ElectricGround=false)
          annotation (Placement(transformation(extent={{-80,-78},{-46,30}})));

        Physiolib.Chemical.Components.Solution solution1(ElectricGround=false)
          annotation (Placement(transformation(extent={{-26,-80},{2,20}})));

        Physiolib.Chemical.Components.Substance Pb(substanceData=Media.Substance.Lead_solid,
            amountOfSubstance_start=1)
          annotation (Placement(transformation(extent={{50,-66},{30,-46}})));
        Physiolib.Chemical.Components.Substance HSO4(substanceData=Media.Substance.HydrogenSulfate_aqueous,
            amountOfSubstance_start=1)
          annotation (Placement(transformation(extent={{-2,-70},{-22,-50}})));
        Physiolib.Chemical.Components.Substance PbSO4_(substanceData=Media.Substance.LeadSulfate_solid,
            amountOfSubstance_start=0.01)
          annotation (Placement(transformation(extent={{50,-32},{30,-12}})));
        Physiolib.Chemical.Components.Substance H(substanceData=Media.Substance.Proton_aqueous,
            amountOfSubstance_start=1)
          annotation (Placement(transformation(extent={{-2,-42},{-22,-22}})));
        Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
          annotation (Placement(transformation(extent={{-32,72},{-12,92}})));
        Physiolib.Chemical.Components.Reaction electrodeReaction(
          nP=2,
          nS=4,
          s={1,1,3,2},
          p={1,2}) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-36,-14})));
        Physiolib.Chemical.Components.Reaction electrodeReaction1(
          nS=2,
          nP=3,
          p={1,1,2}) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={14,-16})));

        Physiolib.Chemical.Components.ElectronTransfer electrone
          annotation (Placement(transformation(extent={{50,2},{30,22}})));
        Physiolib.Chemical.Components.ElectronTransfer electrone1
          annotation (Placement(transformation(extent={{-72,-38},{-52,-18}})));
        Physiolib.Chemical.Components.Substance PbO2(substanceData=Media.Substance.LeadDioxide_solid,
            amountOfSubstance_start=1) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}}, origin={-60,-58})));
        Physiolib.Chemical.Components.Substance H2O(substanceData=Media.Substance.Water_liquid,
            amountOfSubstance_start=0.1)
          annotation (Placement(transformation(extent={{-2,-8},{-22,12}})));
        Physiolib.Chemical.Components.Substance PbSO4(substanceData=Media.Substance.LeadSulfate_solid,
            amountOfSubstance_start=0.01) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}}, origin={-60,6})));

      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{16,30},{36,50}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor(R=1)
        annotation (Placement(transformation(extent={{-14,40},{6,60}})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
        annotation (Placement(transformation(extent={{-56,40},{-36,60}})));
      equation
        connect(Pb.port_a, electrodeReaction1.substrates[1]) annotation (Line(
            points={{30,-56},{15.5,-56},{15.5,-26},{16,-26}},
            color={158,66,200},
            thickness=0.5));
        connect(HSO4.port_a, electrodeReaction1.substrates[2]) annotation (Line(
            points={{-22,-60},{12,-60},{12,-26}},
            color={158,66,200},
            thickness=0.5));
        connect(PbSO4_.port_a, electrodeReaction1.products[1]) annotation (Line(
            points={{30,-22},{26,-22},{26,-2},{16,-2},{16,-6},{16.6667,-6}},
            color={158,66,200},
            thickness=0.5));
        connect(HSO4.solution, solution1.solution) annotation (Line(
            points={{-6,-70},{-6,-70},{-6,-78},{-3.6,-78},{-3.6,-79}},
            color={127,127,0}));
        connect(H.solution, solution1.solution) annotation (Line(points={{-6,-42},
              {-6,-78},{-3.6,-78},{-3.6,-79}},
                                           color={127,127,0}));
        connect(H2O.solution, solution1.solution) annotation (Line(
            points={{-6,-8},{-6,-79},{-3.6,-79}},
            color={127,127,0}));
        connect(electrodeReaction.products[1], PbSO4.port_a) annotation (Line(
            points={{-38,-4},{-38,6},{-50,6}},
            color={158,66,200},
            thickness=0.5));
        connect(electrodeReaction.products[2], H2O.port_a) annotation (Line(
            points={{-34,-4},{-34,-4},{-34,2},{-22,2}},
            color={158,66,200},
            thickness=0.5));
        connect(PbO2.port_a, electrodeReaction.substrates[1]) annotation (Line(
            points={{-50,-58},{-36,-58},{-36,-24},{-39,-24}},
            color={158,66,200},
            thickness=0.5));
        connect(HSO4.port_a, electrodeReaction.substrates[2]) annotation (Line(
            points={{-22,-60},{-34,-60},{-34,-24},{-37,-24}},
            color={158,66,200},
            thickness=0.5));
        connect(H.port_a, electrodeReaction.substrates[3]) annotation (Line(
            points={{-22,-32},{-32,-32},{-32,-24},{-35,-24}},
            color={158,66,200},
            thickness=0.5));
        connect(electrone1.port_a, electrodeReaction.substrates[4]) annotation (Line(
            points={{-52,-28},{-38,-28},{-38,-24},{-33,-24}},
            color={158,66,200},
            thickness=0.5));
        connect(H.port_a, electrodeReaction1.products[2]) annotation (Line(
            points={{-22,-32},{2,-32},{2,2},{12,2},{12,-6},{14,-6}},
            color={158,66,200},
            thickness=0.5));
        connect(electrone.port_a, electrodeReaction1.products[3]) annotation (Line(
            points={{30,12},{14,12},{14,-6},{11.3333,-6}},
            color={158,66,200},
            thickness=0.5));
      connect(Pb.solution, anode.solution) annotation (Line(
          points={{46,-66},{46,-74.92},{51.2,-74.92}},
          color={127,127,0}));
      connect(PbSO4_.solution, anode.solution) annotation (Line(
          points={{46,-32},{46,-74.92},{51.2,-74.92}},
          color={127,127,0}));
      connect(PbO2.solution, cathode.solution) annotation (Line(
          points={{-66,-68},{-66,-70},{-60,-70},{-60,-76.92},{-52.8,-76.92}},
          color={127,127,0}));
      connect(electrone1.pin, voltageSensor.p) annotation (Line(
          points={{-72,-28},{-82,-28},{-82,50},{-64,50},{-64,82},{-32,82}},
          color={0,0,255}));
      connect(electrone.pin, voltageSensor.n) annotation (Line(
          points={{50,12},{50,50},{26,50},{26,82},{-12,82},{-12,82}},
          color={0,0,255}));
      connect(electrone.solution, anode.solution) annotation (Line(
          points={{46,2},{46,-74.92},{51.2,-74.92}},
          color={127,127,0}));
      connect(electrone.pin, ground.p) annotation (Line(
          points={{50,12},{50,50},{26,50}},
          color={0,0,255}));
      connect(electrone1.pin, currentSensor.p) annotation (Line(
          points={{-72,-28},{-82,-28},{-82,50},{-56,50}},
          color={0,0,255}));
      connect(currentSensor.n, resistor.p) annotation (Line(
          points={{-36,50},{-14,50}},
          color={0,0,255}));
      connect(resistor.n, electrone.pin) annotation (Line(
          points={{6,50},{50,50},{50,12}},
          color={0,0,255}));
      connect(PbSO4.solution, cathode.solution) annotation (Line(
          points={{-66,-4},{-66,-70},{-60,-70},{-60,-76.92},{-52.8,-76.92}},
          color={127,127,0}));
      connect(electrone1.solution, cathode.solution) annotation (Line(
          points={{-68,-38},{-66,-38},{-66,-70},{-60,-70},{-60,-76.92},{-52.8,
                -76.92}},
          color={127,127,0}));

        annotation (
        experiment(StopTime=49500), Documentation(revisions=
                          "<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",     info="<html>
<p>The lead-acid electrochemical cells are characterized by two chemical reactions:</p>
<table width=100%>
<tr><th>PbO2 + HSO4- + 3 H+ +2 e- &harr; PbSO4 + 2 H2O</th><td>(1)</td></tr>
<tr><th>Pb + HSO4- &harr; PbSO4 + H+ + 2 e-</th><td>(2)</td></tr>
</table>
<p>The building of one cell of a lead-acid battery starts with the definition of three solutions: two for the lead elec-trodes and one for the liquid-acid solution (Figure 1A). This can be done by dragging and dropping the library class &lsquo;Components.Solution&rsquo; into the diagram. We called the first instance &ldquo;cathode&rdquo;, the second &ldquo;solution&rdquo; and the last &ldquo;anode&rdquo;. We set the parameter &lsquo;Electri-calGround&rsquo; as &ldquo;false&rdquo; for all of these solutions in order to attain the possibility of non-zero voltages. Now we can specify the chemical substances inside the chemical solutions. We drag and drop the library class &lsquo;Compo-nents.Substance&rsquo; into the &ldquo;solution&rdquo; as chemical sub-stances (Figure 1B). H2O(liquid), H+(aqueous) and HSO4-(aqueous) representing the liquid aqueous solu-tion of sulfuric acid. PbSO4(solid) and PbO2(solid) are placed in the &ldquo;cathode&rdquo;, representing the elements of the positive electrode. The substances Pb(solid) and aP-bSO4(solid) are placed into the &ldquo;anode&rdquo;, representing the elements of the negative electrode. All of these sub-stances must be given unique names (e.g., &ldquo;PbSO4&rdquo; for the cathode and &ldquo;aPbSO4&rdquo; for the anode), because the Modelica language does not support two instances with the same name in a single class.</p>
<p><img src=\"modelica://Physiolib/Resources/Images/Examples/LeadAcidBatterry1.png\"/></p>
<p>Figure 1) The building of one electro-chemical cell of a lead-acid battery in four steps: A) adding chemical solutions, B) adding chemical substances, C) adding electron transfers and D) adding chemical reactions.</p>
<p>As mentioned above, the appropriate substance data for all these substances must be selected as predefined parametric records, e.g., &lsquo;Exam-ples.Substances.Water_liquid&rsquo;, &lsquo;.Lead_solid&rsquo;, &lsquo;.Lead_dioxide_solid&rsquo;, &lsquo;.Lead_sulfate_solid&rsquo;, and so on. The last, very special substance to be included is an electron. This class is called &lsquo;Compo-nents.ElectronTransfer&rsquo; and it must be added in order for each electrode to transfer electron from the chemical reaction to the electric circuit (Figure 1C). Each of these substances must be connected to the appropriate solu-tion using a solution port situated in the bottom of the component&rsquo;s icons to indicate that they are all mixed in the solution. By having all these substances, it is possi-ble to implement the chemical reactions. Dragging and dropping the library class &lsquo;Components.Reaction&rsquo; for both chemical reactions, and setting their parameters as an appropriate number of reactants, products and stoi-chiometry, allows the connection of each substance with the reaction, as expressed in reaction (1) and reaction (2). This setting can be done using the parameter dialog of the cathode chemical reaction (1) as there are four types of substrates (nS=4) with stoichiometric coeffi-cients: one for the first and second reactant, three for the third reactant and two for the fourth reactant (s={1,1,3,2}). There are also two types of products (nP=2) with stoichiometry: one for PbSO4 and two for water (p={1,2}), following the chemical scheme of the first chemical reaction above. After setting the number of reactants and products, it is possible to connect the substances with reactions. Each instance of reaction has an array of connectors for substrates and an array of con-nectors for products; the user must be very careful to connect each element of these arrays in the same order as defined by stoichiometric coefficients. This means that, for example, the water must be connected in index 2 to products of the first chemical reaction, because we had already selected the order of products by setting the array of stoichiometric coefficients in reaction (1). The chemical reaction (2) must be set analogically as nS=2, nP=3, p={1,1,2} with connections of substance ports of Pb to substrate[1], HSO4- to substrate[2], PbSO4 to prod-uct[1], H+ to product[2] and e- to product[3], as repre-sented in Figure 1D.</p>
<p>The electrochemical cell has already been imple-mented at this stage. However, the simulation requires the initial state of substances, which for the fully charged battery means that almost all elements of the cathode are PbO2 and almost all elements of the anode are Pb. In this state, the sulfuric acid can be concen-trated, which increases the effectiveness of the electro-chemical cell. To set this state, it is possible to just dou-ble-click on PbO2 and Pb and set the amount, e.g., 1mol. To set the pure concentrated sulfuric acid we can also set the amount of SO4- and H+ as 1mol. This fully charged ideal state is ready to simulate when it is con-nected to the electric ground via one of the electric ports of the one electron transfer component.</p>
<p>These batteries can be connected to any electrical cir-cuit that is slowly discharging. For example, if we only connect the simple electric resistance of 1 Ohm as ex-pressed in Figure 1D, then the simulation of the dis-charging process over 13 hours and 45 minutes gives the results of electric current and electric potential, as can be seen in Figure 2. The exchange of the resistor with a voltage source can simulate the charging process for a discharged cell.</p>
<p><img src=\"modelica://Physiolib/Resources/Images/Examples/LeadAcidBatterry2.png\"/></p>
<p>Figure 2) Discharging simulation of the lead-acid battery cell from Figure 2D, with the initial amount of substances as described in the text.</p>
</html>"));
      end LeadAcidBattery;

      package AcidBase

        model WaterSelfIonization "H2O  <->  OH-   +   H+ "
          import Physiolib;
            extends Modelica.Icons.Example;

          Physiolib.Chemical.Components.Solution solution
            annotation (Placement(transformation(extent={{-72,2},{76,96}})));
          Physiolib.Chemical.Components.Solution solution1
            annotation (Placement(transformation(extent={{-76,-98},{72,-4}})));
          Physiolib.Chemical.Components.Substance H3O(amountOfSubstance_start=
                1e-7, substanceData=Physiolib.Media.Substance.Hydronium_aqueous)
            annotation (Placement(transformation(extent={{10,-10},{-10,10}},
                  origin={30,70})));
          Physiolib.Chemical.Components.Substance OH(amountOfSubstance_start=1e-7,
              substanceData=Physiolib.Media.Substance.Hydroxide_aqueous)
            annotation (Placement(transformation(extent={{10,-10},{-10,10}},
                  origin={30,26})));
          Physiolib.Chemical.Components.Substance H2O(amountOfSubstance_start=1,
              substanceData=Physiolib.Media.Substance.Water_liquid) annotation (
              Placement(transformation(extent={{-10,-10},{10,10}}, origin={-30,46})));
          Physiolib.Chemical.Components.Reaction waterDissociation(nP=2, s={2})
            annotation (Placement(transformation(extent={{-12,36},{8,56}})));
                Real pH, pH_;
          Physiolib.Chemical.Components.Substance H_(amountOfSubstance_start=1e-7,
              substanceData=Physiolib.Media.Substance.Proton_aqueous) annotation (
             Placement(transformation(extent={{10,-10},{-10,10}}, origin={28,-30})));
          Physiolib.Chemical.Components.Substance OH_(amountOfSubstance_start=
                1e-7, substanceData=Physiolib.Media.Substance.Hydroxide_aqueous)
            annotation (Placement(transformation(extent={{10,-10},{-10,10}},
                  origin={28,-76})));
          Physiolib.Chemical.Components.Substance H2O_(amountOfSubstance_start=1,
              substanceData=Physiolib.Media.Substance.Water_liquid) annotation (
              Placement(transformation(extent={{-10,-10},{10,10}}, origin={-32,-56})));
          Physiolib.Chemical.Components.Reaction waterDissociation_(nP=2)
            annotation (Placement(transformation(extent={{-14,-66},{6,-46}})));

        equation
          pH = -log10( H3O.a);

          pH_ = -log10( H_.a);

          connect(OH.port_a, waterDissociation.products[1]) annotation (Line(
              points={{20,26},{16,26},{16,44},{8,44}},
              color={158,66,200},
              thickness=1));
          connect(waterDissociation.products[2], H3O.port_a) annotation (Line(
              points={{8,48},{16,48},{16,70},{20,70}},
              color={158,66,200},
              thickness=1));
          connect(H2O.port_a, waterDissociation.substrates[1]) annotation (Line(
              points={{-20,46},{-12,46}},
              color={158,66,200},
              thickness=1));
          connect(OH_.port_a,waterDissociation_. products[1]) annotation (Line(
              points={{18,-76},{14,-76},{14,-58},{6,-58}},
              color={158,66,200},
              thickness=1));
          connect(waterDissociation_.products[2], H_.port_a) annotation (Line(
              points={{6,-54},{14,-54},{14,-30},{18,-30}},
              color={158,66,200},
              thickness=1));
          connect(H2O_.port_a,waterDissociation_. substrates[1]) annotation (Line(
              points={{-22,-56},{-14,-56}},
              color={158,66,200},
              thickness=1));
          connect(H2O.solution, solution.solution) annotation (Line(
              points={{-36,36},{46.4,36},{46.4,2.94}},
              color={127,127,0}));
          connect(OH.solution, solution.solution) annotation (Line(
              points={{36,16},{36,2.94},{46.4,2.94}},
              color={127,127,0}));
          connect(H3O.solution, solution.solution) annotation (Line(
              points={{36,60},{36,2.94},{46.4,2.94}},
              color={127,127,0}));
          connect(H2O_.solution, solution1.solution) annotation (Line(
              points={{-38,-66},{42.4,-66},{42.4,-97.06}},
              color={127,127,0}));
          connect(OH_.solution, solution1.solution) annotation (Line(
              points={{34,-86},{34,-97.06},{42.4,-97.06}},
              color={127,127,0}));
          connect(H_.solution, solution1.solution) annotation (Line(
              points={{34,-40},{34,-97.06},{42.4,-97.06}},
              color={127,127,0}));
          annotation ( Documentation(info="<html>
<p>Self-ionization of water.</p>
<p>Ions difference (SID) in water causes the acidity/basicity, where pH = -log10(aH+). An activity of hydrogen ions aH+ is approximated with concentration (mol/l) of the oxonium cations H3O+.</p>
<pre><b>plotExpression(apply(-log10(WaterSelfIonization.H3O.solute)),&nbsp;false,&nbsp;&quot;pH&quot;,&nbsp;1);</b></pre>
<p><br>The titration slope der(pH)/der(SID)=1.48e+6 1/(mol/L) at pH=7.4.</p>
</html>",        revisions="<html>
<p><i>2017</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"),  experiment(StopTime=1));
        end WaterSelfIonization;

        model CarbonDioxideInWater "CO2 as alone acid-base buffer"
          import Physiolib;
            extends Modelica.Icons.Example;
          Physiolib.Chemical.Components.Solution solution
            annotation (Placement(transformation(extent={{-100,-100},{100,46}})));
          Physiolib.Chemical.Components.Substance HCO3(substanceData=Physiolib.Media.Substance.Bicarbonate_aqueous)
            annotation (Placement(transformation(extent={{-16,-4},{4,16}})));
          Physiolib.Chemical.Components.Reaction HendersonHasselbalch(
            nP=2,
            nS=2,
            useKineticsInput=false) "K=10^(-6.103 + 3), dH=7.3 kJ/mol"
            annotation (Placement(transformation(extent={{-48,-6},{-28,14}})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance CO2_gas(
            substanceData=Physiolib.Media.Substance.CarbonDioxide_gas,
            PartialPressure=5332.8954966,
            TotalPressure=101325.0144354) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-60,86})));
          Physiolib.Chemical.Components.Substance H(substanceData=Physiolib.Media.Substance.Proton_aqueous,
              amountOfSubstance_start=3e-8) annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}}, origin={-6,-38})));
          Physiolib.Chemical.Components.GasSolubility gasSolubility
            annotation (Placement(transformation(extent={{-70,36},{-50,56}})));
                                                /*(C=2400, kH_T0(
        displayUnit="(mmol/l)/kPa at 25degC") = 0.81805576878885)*/
          Physiolib.Chemical.Components.Substance CO2_liquid(substanceData=
                Physiolib.Media.Substance.CarbonDioxide_aqueous)
            annotation (Placement(transformation(extent={{-82,-6},{-62,14}})));
          Physiolib.Chemical.Components.Substance CO3(substanceData=Physiolib.Media.Substance.Carbonate_aqueous)
            annotation (Placement(transformation(extent={{70,-2},{50,18}})));
          Physiolib.Chemical.Components.Reaction c2(nP=2, nS=1)
            "K=10^(-10.33 + 3), dH=14.9kJ/mol"
            annotation (Placement(transformation(extent={{16,-4},{36,16}})));
          Physiolib.Chemical.Components.Substance H2O(substanceData=Physiolib.Media.Substance.Water_liquid,
              amountOfSubstance_start=55.507)
            annotation (Placement(transformation(extent={{-82,-50},{-62,-30}})));
          Real pH;

        equation
          pH = -log10( H.a);

          connect(CO2_gas.port_a, gasSolubility.gas_port) annotation (Line(
              points={{-60,76},{-60,56}},
              color={158,66,200},
              thickness=1));
          connect(gasSolubility.liquid_port, CO2_liquid.port_a) annotation (Line(
              points={{-60,36},{-60,4},{-62,4}},
              color={158,66,200},
              thickness=1));
          connect(HendersonHasselbalch.products[1], H.port_a) annotation (Line(
              points={{-28,2},{-22,2},{-22,-38},{4,-38}},
              color={158,66,200},
              thickness=1));
          connect(HendersonHasselbalch.products[2], HCO3.port_a) annotation (Line(
              points={{-28,6},{4,6}},
              color={158,66,200},
              thickness=1));
          connect(HCO3.port_a, c2.substrates[1]) annotation (Line(
              points={{4,6},{16,6}},
              color={158,66,200},
              thickness=1));
          connect(c2.products[1], H.port_a) annotation (Line(
              points={{36,4},{44,4},{44,-38},{4,-38}},
              color={158,66,200},
              thickness=1));
          connect(c2.products[2], CO3.port_a) annotation (Line(
              points={{36,8},{48,8},{48,8},{50,8}},
              color={158,66,200},
              thickness=1));
          connect(CO2_liquid.port_a, HendersonHasselbalch.substrates[2]) annotation (
              Line(
              points={{-62,4},{-62,6},{-48,6}},
              color={158,66,200},
              thickness=1));
          connect(H2O.port_a, HendersonHasselbalch.substrates[1]) annotation (Line(
              points={{-62,-40},{-56,-40},{-56,2},{-48,2}},
              color={158,66,200},
              thickness=1));
          connect(CO2_liquid.solution, solution.solution) annotation (Line(
              points={{-78,-6},{-78,-98.54},{60,-98.54}},
              color={127,127,0}));
          connect(H2O.solution, solution.solution) annotation (Line(points={{-78,-50},
                {-78,-98.54},{60,-98.54}},color={127,127,0}));
          connect(HCO3.solution, solution.solution) annotation (Line(points={{-12,-4},
                {-12,-98.54},{60,-98.54}},color={127,127,0}));
          connect(H.solution, solution.solution) annotation (Line(points={{-12,-48},
                {-12,-98.54},{60,-98.54}},color={127,127,0}));
          connect(CO3.solution, solution.solution) annotation (Line(points={{66,-2},
                {66,-98.54},{60,-98.54}}, color={127,127,0}));
          annotation ( Documentation(info="<html>
<p>CO2 solution in water without any other acid-base buffers.</p>
<pre><b>plotExpression(apply(-log10(CarbonDioxideInWater.H3O.solute)),&nbsp;false,&nbsp;&quot;pH&quot;,&nbsp;1);</b></pre>
<p><br>Please note, that OH- (and CO3^-2) can be neglected from electroneutrality calculation, because of very small concentrations (in physiological pH) anyway. </p>
<p>And if SID&gt;0 then also H3O+ can be also neglected from electroneutrality, because only bicarbonate anions HCO3- (or CO3^-2) are needed there to balance the electroneutrality.</p>
<p><br>The partial pressure of CO2 in gas are input parameter. Outputs are an amount of free dissolved CO2 in liquid and an amount of HCO3-.</p>
<p><br>The titration slope der(pH)/der(SID)=17.5 1/(mol/L) at pH=7.4 and pCO2=40 mmHg.</p>
<p><br>Molar heat of formation (aqueous):</p>
<p>CO2:        -413.5 kJ/mol  (gas: -393.5 kJ/mol )</p>
<p>H2O:        -285.8 kJ/mol</p>
<p>HCO3-:        -692.0 kJ/mol</p>
<p>CO3^-2:        -677.1 kJ/mol</p>
<p><br>Enthalphy of reaction H2O + CO2 &lt;-&gt; HCO3- + H+  :         7.3 kJ/mol</p>
<p>Enthalphy of reaction HCO3- &lt;-&gt; CO3^-2 + H+  :        14.9 kJ/mol</p>
</html>",        revisions="<html>
<p><i>2017</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"),  experiment(StopTime=0.02));
        end CarbonDioxideInWater;

        model Phosphate
          import Physiolib;
            extends Modelica.Icons.Example;

          Physiolib.Chemical.Components.Solution solution
            annotation (Placement(transformation(extent={{-98,-100},{100,100}})));

          Physiolib.Chemical.Components.Substance H(amountOfSubstance_start=55.6*
                10^(-7.4), substanceData=Physiolib.Media.Substance.Proton_aqueous)
            "hydrogen ions activity" annotation (Placement(transformation(extent=
                    {{-10,-10},{10,10}}, origin={28,-14})));

          Physiolib.Chemical.Components.Substance H3PO4(amountOfSubstance_start=
                1e-08, substanceData=Physiolib.Media.Substance.PhosphoricAcid_aqueous)
            annotation (Placement(transformation(extent={{-90,-58},{-70,-38}})));
          Physiolib.Chemical.Components.Substance H2PO4(amountOfSubstance_start=
                0.0005, substanceData=Physiolib.Media.Substance.DihydrogenPhosphate_aqueous)
            annotation (Placement(transformation(extent={{-40,-58},{-20,-38}})));
          Physiolib.Chemical.Components.Substance HPO4(substanceData=Physiolib.Media.Substance.HydrogenPhosphate_aqueous,
              amountOfSubstance_start=0.0006)
            annotation (Placement(transformation(extent={{16,-58},{36,-38}})));
          Physiolib.Chemical.Components.Substance PO4(substanceData=Physiolib.Media.Substance.Phosphate_aqueous,
              amountOfSubstance_start=1e-08)
            annotation (Placement(transformation(extent={{92,-58},{72,-38}})));

          Physiolib.Chemical.Components.Reaction chemicalReaction(nP=2)
            "10^(-1.915 + 3)"
            annotation (Placement(transformation(extent={{-66,-58},{-46,-38}})));
          Physiolib.Chemical.Components.Reaction chemicalReaction1(nP=2)
            "10^(-6.66 + 3)"
            annotation (Placement(transformation(extent={{-14,-58},{6,-38}})));
          Physiolib.Chemical.Components.Reaction chemicalReaction2(nP=2)
            "10^(-11.78 + 3)"
            annotation (Placement(transformation(extent={{44,-58},{64,-38}})));

          Physiolib.Chemical.Components.Substance H2O(substanceData=Physiolib.Media.Substance.Water_liquid,
              amountOfSubstance_start=55.508) annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={58,-76})));
        equation
          connect(H3PO4.port_a, chemicalReaction.substrates[1]) annotation (Line(
              points={{-70,-48},{-66,-48}},
              color={107,45,134},
              thickness=1));
          connect(chemicalReaction.products[1], H2PO4.port_a) annotation (Line(
              points={{-46,-50},{-42,-50},{-42,-48},{-20,-48}},
              color={107,45,134},
              thickness=1));
          connect(H2PO4.port_a, chemicalReaction1.substrates[1]) annotation (Line(
              points={{-20,-48},{-14,-48}},
              color={107,45,134},
              thickness=1));
          connect(chemicalReaction1.products[1], HPO4.port_a) annotation (Line(
              points={{6,-50},{16,-50},{16,-48},{36,-48}},
              color={107,45,134},
              thickness=1));
          connect(HPO4.port_a, chemicalReaction2.substrates[1]) annotation (Line(
              points={{36,-48},{44,-48}},
              color={107,45,134},
              thickness=1));
          connect(chemicalReaction2.products[1], PO4.port_a) annotation (Line(
              points={{64,-50},{74,-50},{74,-48},{72,-48}},
              color={107,45,134},
              thickness=1));
          connect(chemicalReaction.products[2], H.port_a) annotation (Line(
              points={{-46,-46},{-44,-46},{-44,-32},{38,-32},{38,-14}},
              color={107,45,134},
              thickness=1));
          connect(chemicalReaction1.products[2], H.port_a) annotation (Line(
              points={{6,-46},{14,-46},{14,-32},{38,-32},{38,-14}},
              color={107,45,134},
              thickness=1));
          connect(chemicalReaction2.products[2], H.port_a) annotation (Line(
              points={{64,-46},{66,-46},{66,-32},{38,-32},{38,-14}},
              color={107,45,134},
              thickness=1));
          connect(H3PO4.solution, solution.solution) annotation (Line(
              points={{-86,-58},{-46,-58},{-46,-98},{60.4,-98}}));
          connect(H2PO4.solution, solution.solution) annotation (Line(points={{-36,-58},
                {-36,-88},{60.4,-88},{60.4,-98}}));
          connect(HPO4.solution, solution.solution) annotation (Line(points={{20,-58},
                {22,-58},{22,-88},{60.4,-88},{60.4,-98}}));
          connect(PO4.solution, solution.solution) annotation (Line(points={{88,-58},
                {88,-88},{60.4,-88},{60.4,-98}}));
          connect(H.solution, solution.solution) annotation (Line(points={{22,-24},
                {22,-88},{60.4,-88},{60.4,-98}}));
        connect(chemicalReaction.substrates[1], H3PO4.port_a) annotation (Line(
            points={{-66,-48},{-70,-48}},
            color={158,66,200},
            thickness=1));
        connect(H2O.solution, solution.solution) annotation (Line(
            points={{52,-86},{52,-98},{60.4,-98}},
            color={158,66,200}));
          annotation ( Documentation(info="<html>
</html>",        revisions="<html>
<p><i>2017</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"),  experiment(StopTime=0.05));
        end Phosphate;

        model AlbuminTitration "Figge-Fencl model (22. Dec. 2007)"
          extends Modelica.Icons.Example;

          Physiolib.Chemical.Components.Solution solution
            annotation (Placement(transformation(extent={{-104,-100},{96,100}})));

          Physiolib.Chemical.Sources.Buffer H(substanceData=Media.Substance.Proton_aqueous,
              a_start=10^(-7.4)) "hydrogen ions activity" annotation (Placement(
                transformation(extent={{10,-10},{-10,10}}, origin={14,36})));

          constant Integer n=218 "Number of weak acid group in albumin molecule";
          constant Real pKAs[n]=cat(1,{8.5},fill(4.0,98),fill(11.7,18),fill(12.5,24),fill(5.8,2),fill(6.0,2),{7.6,7.8,7.8,8,8},fill(10.3,50),{7.19,7.29,7.17,7.56,7.08,7.38,6.82,6.43,4.92,5.83,6.24,6.8,5.89,5.2,6.8,5.5,8,3.1})
            "acid dissociation constants";
          constant Real K[n]=fill(10.0, n) .^ (-pKAs);
          constant Real DfG[n]= Modelica.Constants.R*(298.15)*log(K);

          Physiolib.Chemical.Components.Substance A[n](each
              amountOfSubstance_start=0.00033, substanceData(each z=-1))
            "deprotonated acid groups"
            annotation (Placement(transformation(extent={{26,-16},{6,4}})));
          Physiolib.Chemical.Components.Reaction react[n](each nP=2)
            annotation (Placement(transformation(extent={{-44,-2},{-24,18}})));

          Physiolib.Chemical.Components.Substance HA[n](substanceData(
                DfG_25degC_1bar=DfG), each amountOfSubstance_start=0.00033)
            "protonated acid groups"
            annotation (Placement(transformation(extent={{-78,-2},{-58,18}})));

          Physiolib.Chemical.Components.Substance H2O(substanceData=Media.Substance.Water_liquid,
              amountOfSubstance_start=55.508) annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={62,-68})));
        equation
          connect(react.products[1], A.port_a) annotation (Line(
              points={{-24,6},{-12,6},{-12,-6},{6,-6}},
              color={107,45,134},
              thickness=1));
          for i in 1:n loop
            connect(react[i].products[2], H.port_a) annotation (Line(
                points={{-24,10},{-14,10},{-14,36},{4,36}},
                color={107,45,134},
                thickness=1));
            connect(HA[i].solution, solution.solution) annotation (Line(
              points={{-74,-2},{-74,-86},{56,-86},{56,-98}},
              color={127,127,0}));
            connect(A[i].solution, solution.solution) annotation (Line(
              points={{22,-16},{22,-86},{56,-86},{56,-98}},
              color={127,127,0}));
          end for;
          connect(HA.port_a, react.substrates[1]) annotation (Line(
              points={{-58,8},{-44,8}},
              color={107,45,134},
              thickness=1));

        connect(solution.solution, H2O.solution) annotation (Line(
            points={{56,-98},{56,-78}},
            color={127,127,0}));
        connect(H.solution, solution.solution) annotation (Line(
            points={{20,26},{20,14},{36,14},{36,-98},{56,-98}},
            color={127,127,0}));
          annotation ( Documentation(revisions="<html>
<p><i>2017</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",         info="<html>
<p>The titration slope der(pH)/der(SID)=185 1/(mol/L) at pH=7.4 and tAlb=0.66 mmol/l.</p>
<p>Data and model is described in</p>
<p><font style=\"color: #222222; \">Jame Figge: Role of non-volatile weak acids (albumin, phosphate and citrate). In: Stewart&apos;s Textbook of Acid-Base, 2nd Edition, John A. Kellum, Paul WG Elbers editors, &nbsp;AcidBase org, 2009, pp. 216-232.</font></p>
</html>"),  experiment(StopTime=1.6));
        end AlbuminTitration;

        model CarbonDioxideInBlood
          import Physiolib;
            extends Modelica.Icons.Example;

          parameter Real KC=10;//e-6 "Slow down factor";

          Physiolib.Chemical.Components.Solution blood_erythrocytes(
              ElectricGround=false, temperature_start=310.15)
            annotation (Placement(transformation(extent={{-100,-98},{100,-38}})));
          Physiolib.Chemical.Components.Solution blood_plasma(temperature_start=
                310.15)
            annotation (Placement(transformation(extent={{-100,4},{100,56}})));

          Physiolib.Chemical.Components.Substance HCO3(substanceData=Physiolib.Media.Substance.Bicarbonate_blood,
              amountOfSubstance_start=0.024) annotation (Placement(transformation(
                  extent={{10,-10},{-10,10}}, origin={18,24})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance CO2_gas(
            substanceData=Physiolib.Media.Substance.CarbonDioxide_gas,
            TotalPressure(displayUnit="mmHg") = 101325.0144354,
            PartialPressure(displayUnit="mmHg") = 5332.8954966,
            usePartialPressureInput=true,
            Temperature=310.15) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-84,84})));
          Physiolib.Chemical.Components.GasSolubility gasSolubility(KC=KC)
            annotation (Placement(transformation(extent={{-94,48},{-74,68}})));

          Physiolib.Chemical.Components.Substance CO2(substanceData=Physiolib.Media.Substance.CarbonDioxide_aqueous,
              amountOfSubstance_start=0.00148) "Free dissolved CO2 in plasma"
            annotation (Placement(transformation(extent={{-88,28},{-68,48}})));
          Physiolib.Chemical.Components.Substance H2O(substanceData=Physiolib.Media.Substance.Water_liquid,
              amountOfSubstance_start=51.6159)
            annotation (Placement(transformation(extent={{-60,12},{-40,32}})));
          Physiolib.Chemical.Components.Substance HCO3_E(substanceData=Physiolib.Media.Substance.Bicarbonate_blood,
              amountOfSubstance_start=0.0116)
            annotation (Placement(transformation(extent={{28,-60},{8,-40}})));
          Physiolib.Chemical.Components.Reaction HendersonHasselbalch1(
            nP=2,
            nS=2,
            KC=KC) "K=10^(-6.103 + 3), dH=7.3 kJ/mol"
            annotation (Placement(transformation(extent={{-26,-68},{-6,-48}})));
          Physiolib.Chemical.Components.Substance CO2_E(substanceData=Physiolib.Media.Substance.CarbonDioxide_aqueous,
              amountOfSubstance_start=0.0011) "Free dissolved CO2 in erythrocyte"
            annotation (Placement(transformation(extent={{-90,-82},{-70,-62}})));
          Physiolib.Chemical.Components.Substance H2O_E(substanceData=Physiolib.Media.Substance.Water_liquid,
              amountOfSubstance_start=38.4008)
            annotation (Placement(transformation(extent={{-60,-62},{-40,-42}})));
          Physiolib.Chemical.Components.Substance Cl_E(substanceData=Physiolib.Media.Substance.Chloride_aqueous,
              amountOfSubstance_start=0.0499)
            annotation (Placement(transformation(extent={{68,-60},{48,-40}})));
          Physiolib.Chemical.Components.Substance Cl(substanceData=Physiolib.Media.Substance.Chloride_aqueous,
              amountOfSubstance_start=0.103)
            annotation (Placement(transformation(extent={{68,20},{48,40}})));

          Real pH_e, pH_p;

          Physiolib.Chemical.Components.Membrane aquaporin(KC=KC) annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-34,-16})));
          Physiolib.Chemical.Components.Membrane Band3_HCO3(KC=KC) annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={4,-16})));
          Physiolib.Chemical.Components.Membrane Band3_Cl(useKineticsInput=false,
              KC=KC) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={46,-16})));
          Physiolib.Chemical.Sources.Buffer H_E(
            substanceData=Physiolib.Media.Substance.Proton_aqueous,
            BufferValue=0.063,
            a_start=10^(-7.2))
            annotation (Placement(transformation(extent={{48,-84},{30,-66}})));
          Modelica.Blocks.Sources.Clock clock(offset=5000)
            annotation (Placement(transformation(extent={{-54,62},{-34,82}})));
          Physiolib.Chemical.Components.Substance others_E(substanceData(
              density=(1.045 - 0.695523)*1000/(1 - 0.697583),
              References={"erythrocyte intracellular fluid density 1045kg/m3"},
              MolarWeight=(1.045 - 0.695523)/(38.7*(1 - 0.994648) - 0.0499 -
                  0.0116 - 0.00123)), amountOfSubstance_start=0.1444)
            annotation (Placement(transformation(extent={{68,-88},{88,-68}})));
          Physiolib.Chemical.Components.Substance others_P(substanceData(
              References={
                  "to reach plasma density 1024 kg/m3 and plasma volume 1 liter"},
              density=(1.024 - 0.933373)*1000/(1 - 0.936137),
              MolarWeight=(1.024 - 0.933373)/(51.8*(1 - 0.994648) - 0.103 - 0.024
                   - 0.0017)), amountOfSubstance_start=0.1487)
            annotation (Placement(transformation(extent={{70,14},{90,34}})));

          Physiolib.Chemical.Components.Diffusion diffusion annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-66,-16})));
          Physiolib.Chemical.Sources.Buffer H(
            substanceData=Physiolib.Media.Substance.Proton_aqueous,
            BufferValue=0.0077,
            a_start=10^(-7.4))
            "buffer value 7.7 mmol/L for plasma is from (O. Siggaard-Andersen 1995)"
            annotation (Placement(transformation(extent={{38,38},{20,56}})));
          Physiolib.Chemical.Components.Reaction HendersonHasselbalch2(
            nP=2,
            nS=2,
            KC=(1e-10)*KC) "K=10^(-6.103 + 3), dH=7.3 kJ/mol"
            annotation (Placement(transformation(extent={{-26,26},{-6,46}})));
        equation
          pH_p = -log10(H.a);
          pH_e = -log10(H_E.a);
          connect(HendersonHasselbalch1.products[1], HCO3_E.port_a) annotation (Line(
              points={{-6,-60},{2,-60},{2,-50},{8,-50}},
              color={107,45,134},
              thickness=0.5));
        connect(CO2_E.port_a, HendersonHasselbalch1.substrates[1]) annotation (
            Line(
            points={{-70,-72},{-36,-72},{-36,-60},{-26,-60}},
            color={107,45,134},
            thickness=0.5));
          connect(H2O_E.port_a, HendersonHasselbalch1.substrates[2]) annotation (Line(
              points={{-40,-52},{-34,-52},{-34,-56},{-26,-56}},
              color={158,66,200},
              thickness=0.5));
        connect(CO2.solution, blood_plasma.solution) annotation (Line(
            points={{-84,28},{-84,12},{60,12},{60,4.52}},
            color={127,127,0}));
        connect(H2O.solution, blood_plasma.solution)
          annotation (Line(points={{-56,12},{-56,12},{60,12},{60,10},{60,4},{60,
                  4.52}},                                   color={127,127,0}));
        connect(Cl.solution, blood_plasma.solution) annotation (Line(
            points={{64,20},{64,12},{60,12},{60,4.52}},
            color={127,127,0}));
        connect(CO2_E.solution, blood_erythrocytes.solution) annotation (Line(
            points={{-86,-82},{-86,-88},{60,-88},{60,-97.4}},
            color={127,127,0}));
          connect(H2O_E.solution, blood_erythrocytes.solution) annotation (Line(
                points={{-56,-62},{-56,-88},{60,-88},{60,-97.4}},
                                                        color={127,127,0}));
          connect(Cl_E.solution, blood_erythrocytes.solution) annotation (Line(
              points={{64,-60},{64,-78},{60,-78},{60,-97.4}},
              color={127,127,0}));
          connect(HCO3_E.solution, blood_erythrocytes.solution) annotation (Line(
                points={{24,-60},{24,-88},{60,-88},{60,-97.4}},
                                                      color={127,127,0}));
        connect(gasSolubility.liquid_port, CO2.port_a) annotation (Line(
            points={{-84,48},{-84,38},{-68,38}},
            color={158,66,200},
            thickness=0.5));
          connect(aquaporin.port_b, H2O_E.port_a) annotation (Line(
              points={{-34,-26},{-34,-52},{-40,-52}},
              color={158,66,200},
              thickness=0.5));
        connect(aquaporin.port_a, H2O.port_a) annotation (Line(
            points={{-34,-6},{-34,22},{-40,22}},
            color={158,66,200},
            thickness=0.5));
          connect(Band3_HCO3.port_a, HCO3.port_a) annotation (Line(
              points={{4,-6},{4,24},{8,24}},
              color={158,66,200},
              thickness=0.5));
          connect(Band3_HCO3.port_b, HCO3_E.port_a) annotation (Line(
              points={{4,-26},{4,-50},{8,-50}},
              color={158,66,200},
              thickness=0.5));
          connect(Band3_Cl.port_b, Cl_E.port_a) annotation (Line(
              points={{46,-26},{46,-38},{46,-50},{48,-50}},
              color={158,66,200},
              thickness=0.5));
          connect(Band3_Cl.port_a, Cl.port_a) annotation (Line(
              points={{46,-6},{46,12},{46,30},{48,30}},
              color={158,66,200},
              thickness=0.5));
          connect(gasSolubility.gas_port, CO2_gas.port_a) annotation (Line(
              points={{-84,68},{-84,74}},
              color={158,66,200},
              thickness=0.5));
        connect(HCO3.solution, blood_plasma.solution) annotation (Line(
            points={{24,14},{24,12},{60,12},{60,8},{60,4},{60,4.52}},
            color={127,127,0}));
        connect(H_E.port_a, HendersonHasselbalch1.products[2]) annotation (Line(
            points={{30,-75},{4,-75},{4,-56},{-6,-56}},
            color={158,66,200},
            thickness=0.5));
        connect(blood_erythrocytes.solution, others_E.solution) annotation (Line(
            points={{60,-97.4},{60,-88},{72,-88}},
            color={127,127,0}));
        connect(blood_plasma.solution, others_P.solution) annotation (Line(
            points={{60,4.52},{60,4},{60,8},{60,12},{74,12},{74,14}},
            color={127,127,0}));
        connect(clock.y, CO2_gas.partialPressure) annotation (Line(
            points={{-33,72},{-24,72},{-24,98},{-84,98},{-84,94}},
            color={0,0,127}));
        connect(H_E.solution, blood_erythrocytes.solution) annotation (Line(
            points={{44.4,-84},{44,-84},{44,-88},{60,-88},{60,-97.4}},
            color={127,127,0}));
          connect(CO2_E.port_a, diffusion.port_b) annotation (Line(
              points={{-70,-72},{-66,-72},{-66,-26}},
              color={158,66,200},
              thickness=0.5));
          connect(CO2.port_a, diffusion.port_a) annotation (Line(
              points={{-68,38},{-66,38},{-66,-6}},
              color={158,66,200},
              thickness=0.5));
          connect(blood_plasma.solution, H.solution) annotation (Line(
              points={{60,4.52},{60,4.52},{60,12},{34,12},{34,38},{34.4,38}},
              color={127,127,0}));
          connect(CO2.port_a, HendersonHasselbalch2.substrates[2]) annotation (Line(
              points={{-68,38},{-26,38}},
              color={158,66,200},
              thickness=0.5));
          connect(H2O.port_a, HendersonHasselbalch2.substrates[1]) annotation (Line(
              points={{-40,22},{-34,22},{-34,34},{-26,34}},
              color={158,66,200},
              thickness=0.5));
          connect(HendersonHasselbalch2.products[1], HCO3.port_a) annotation (Line(
              points={{-6,34},{2,34},{2,24},{8,24}},
              color={158,66,200},
              thickness=0.5));
          connect(HendersonHasselbalch2.products[2], H.port_a) annotation (Line(
              points={{-6,38},{2,38},{2,48},{20,48},{20,47}},
              color={158,66,200},
              thickness=0.5));
          annotation ( Documentation(info="<html>
<p>The mature red blood cell (erythrocyte) is the simplest cell in the human body. Its primary function is the transportation of blood gases, such as oxygen O<sub>2</sub> (from the lungs to tissues) and carbon dioxide CO<sub>2</sub> (from tissues to the lungs). The chemical processes behind the gases&rsquo; transportation are complex because the capacity of water to transport their freely dissolved forms is very low. To transport sufficient amounts of O<sub>2</sub> and CO<sub>2</sub>, the gases must be chemically bound to hemoglobin such as described in (Matej&aacute;k, et al., 2017-2018) and/or transported as different substances, which can be present in water in much higher concentrations than their freely dissolved forms allow. Therefore, to transport a sufficient amount of CO<sub>2</sub>, it must be changed to HCO<sub>3</sub><sup>-</sup> using the chemical reaction: </p>
<table width=100%><tr>
<th><p align=\"center\"><b>CO<sub>2</sub> + H<sub>2</sub>O &lt;-&gt; HCO<sub>3</sub><sup>-</sup> + H<sup>+</sup></b></p></th>
<td><p>(1)</p></td>
</tr>
</table>
<p><br>This reaction takes place mainly inside the red blood cell, because only here it is presented with the enzyme carbonic anhydrase. Therefore, the increase of total carbon dioxide content of blood in tissues and its decrease in lungs are always connected with the chloride shift between blood plasma and the intracellular fluid of erythrocytes, as represented in followin Figure: </p>
<p><img src=\"modelica://Physiolib/Resources/Images/Examples/CO2inBlood.png\"/></p>
<p>Figure: Chloride shift with carbon dioxide hydration with assumption of non-bicarbonate linear acid-base buffering properties of plasma and erythrocytes. </p>
<p><br>The blood plasma and intracellular fluid are divided by the cellular membrane composed of a special, very compact lipid double-layer. A lipophobic compound (not soluble in lipids) cannot cross the membrane without special proteins called membrane channels. Even water molecules must have membrane channels (called aquaporins) in order to cross the cellular membrane. In addition, the chloride shift (also known as the Hamburger shift) is exchanging an aqueous chloride Cl<sup>-</sup> for an aqueous bicarbonate HCO<sub>3</sub><sup>-</sup> in both directions across the cellular membranes of red blood cells using the membrane channel &ldquo;Band 3&rdquo;. Each passive membrane channel only allows the equilibration of the electrochemical potentials of the specific permeable ions on both sides of membrane. The different electric potentials on each side of membrane allow their different concentrations to achieve equilibrium. </p>
<p>Conversely, the solution&rsquo;s equilibrium of different ions&rsquo; compositions on both sides of the membrane creates the measurable electric membrane potential. This process is not so intuitive, because even though neither solution needs to have an electric charge, there can be a non-zero electric potential for permeable ions. This potential for permeable ions at equilibrium is called the Nernst membrane potential and, in the Physiolib, it is a direct mathematical result of the equality of the electrochemical potential of the ion in both solutions. </p>
<p>The intracellular solution must be set at the possible nonzero electric potential (ElectricalGround=false) because, as a result, the membrane potential of the erythrocytes is calculated as -12mV, which agrees with experimental data by Gedde and Huestis (Gedde and Huestis, 1997) in the electrolytes&rsquo; setting by Raftos et al. (Raftos, et al., 1990). </p>
<p>In this way, it is possible to model more complex processes of a membrane where chemical reactions of active membrane channels or membrane receptors can both be used.&nbsp; </p>
<p><br>CO2 in blood with linear H+ non-bicarbonates buffering without binding to hemoglobin.</p>
<p>The buffer values 0.063 mmol/L commes from Siggaard-Andersen.</p>
</html>",        revisions="<html>
<p><i>2017</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"),  experiment(
            StopTime=1000),
            Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}}), graphics));
        end CarbonDioxideInBlood;

        model AcidBaseBufferTest
            extends Modelica.Icons.Example;

          Physiolib.Chemical.Sources.Buffer buffer(
            substanceData(z=1.045),
            a_start=10^(-7.2),
            BufferValue=3)
            annotation (Placement(transformation(extent={{-50,4},{-30,24}})));
          Physiolib.Chemical.Components.Solution simpleSolution
            annotation (Placement(transformation(extent={{-104,-100},{96,100}})));
          Physiolib.Chemical.Sources.ExternalMoleFraction externalMoleFraction(
              substanceData=Media.Substance.Proton_aqueous, MoleFraction=10^(-7.1))
            annotation (Placement(transformation(extent={{0,-46},{20,-26}})));
          Physiolib.Chemical.Components.Substance substance(substanceData=Media.Substance.Water_liquid,
              amountOfSubstance_start=1)
            annotation (Placement(transformation(extent={{52,-82},{72,-62}})));
        equation
          connect(buffer.solution, simpleSolution.solution) annotation (Line(
              points={{-46,4},{-26,4},{-26,-98},{56,-98}},
              color={127,127,0}));
          connect(externalMoleFraction.port_a, buffer.port_a) annotation (Line(
              points={{20,-36},{40,-36},{40,10},{-30,10},{-30,14}},
              color={158,66,200}));
          connect(simpleSolution.solution, substance.solution) annotation (Line(
              points={{56,-98},{26,-98},{26,-82},{56,-82}},
              color={127,127,0}));
          annotation (                experiment(StopTime=0.05));
        end AcidBaseBufferTest;

        package Dev
          model RedCellMembrane
           // import Chemical;
            extends Modelica.Icons.Example;

            parameter Real KC=1;//e-6 "Slow down factor";

            Physiolib.Chemical.Components.Solution blood_erythrocytes(
                ElectricGround=false) annotation (Placement(transformation(extent=
                     {{-180,-100},{180,-10}})));
            Physiolib.Chemical.Components.Solution blood_plasma annotation (
                Placement(transformation(extent={{-180,12},{180,100}})));

            Physiolib.Chemical.Components.Substance HCO3(substanceData=Media.Substance.Bicarbonate_blood,
                amountOfSubstance_start(displayUnit="mmol") = 0.024) annotation (
                Placement(transformation(extent={{-10,-10},{10,10}}, origin={-18,
                      30})));

            Physiolib.Chemical.Components.Substance H2O(substanceData=Media.Substance.Water_liquid,
                amountOfSubstance_start=51.8*0.994648) annotation (Placement(
                  transformation(extent={{-146,44},{-166,64}})));
            Physiolib.Chemical.Components.Substance HCO3_E(substanceData=Media.Substance.Bicarbonate_blood,
                amountOfSubstance_start(displayUnit="mmol") = 0.0116)
              annotation (Placement(transformation(extent={{-28,-38},{-8,-18}})));
            Physiolib.Chemical.Components.Substance H2O_E(substanceData=Media.Substance.Water_liquid,
                amountOfSubstance_start=38.7*0.994648) annotation (Placement(
                  transformation(extent={{-144,-38},{-164,-18}})));
            Physiolib.Chemical.Components.Substance Cl_E(substanceData=Media.Substance.Chloride_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.0499)
              annotation (Placement(transformation(extent={{-4,-38},{16,-18}})));
            Physiolib.Chemical.Components.Substance Cl(substanceData=Media.Substance.Chloride_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.103)
              annotation (Placement(transformation(extent={{-4,20},{16,40}})));
            Physiolib.Chemical.Components.Substance albumin(substanceData(
                MolarWeight=66.463,
                z=-17,
                density=1080), amountOfSubstance_start(displayUnit="mmol")=
                0.0007)
              annotation (Placement(transformation(extent={{112,76},{92,96}})));
          //  Real pH_e; //,pH_p;

            Physiolib.Chemical.Components.Membrane Aquapirin(KC=KC) annotation (
                Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={-168,0})));
            Physiolib.Chemical.Components.Membrane Band3(KC=KC) annotation (
                Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={-6,0})));
            Physiolib.Chemical.Components.Membrane Band3_(useKineticsInput=false,
                KC=KC) annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={18,0})));
            Physiolib.Chemical.Components.Substance permeableUncharged(
                amountOfSubstance_start(displayUnit="mmol") = 0.0118)
              annotation (Placement(transformation(extent={{166,20},{146,40}})));
            Physiolib.Chemical.Components.Substance permeableUncharged_E(
                amountOfSubstance_start(displayUnit="mmol") = 0.00903,
                substanceData(MolarWeight=0.1)) annotation (Placement(
                  transformation(extent={{164,-38},{144,-18}})));
            Physiolib.Chemical.Components.Substance chargedImpermeable_E(
                amountOfSubstance_start(displayUnit="mmol") = 0.0165,
                substanceData(MolarWeight=1)) annotation (Placement(
                  transformation(extent={{144,-62},{164,-42}})));
            Physiolib.Chemical.Components.Membrane leak(useKineticsInput=false,
                KC=KC) annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={140,0})));
            Physiolib.Chemical.Components.Substance Lac_E(substanceData=Media.Substance.Chloride_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.00062)
              annotation (Placement(transformation(extent={{56,-38},{76,-18}})));
            Physiolib.Chemical.Components.Substance Lac(substanceData=Media.Substance.Chloride_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.00131)
              annotation (Placement(transformation(extent={{56,20},{76,40}})));
            Physiolib.Chemical.Components.Membrane MCT_(useKineticsInput=false,
                KC=KC) "Monocarboxylate transporters" annotation (Placement(
                  transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={78,0})));
            Physiolib.Chemical.Components.Substance H_E(substanceData=Media.Substance.Proton_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 38.7*10^(-7.2))
              "H+"
              annotation (Placement(transformation(extent={{30,-38},{50,-18}})));
            Physiolib.Chemical.Components.Substance H(substanceData=Media.Substance.Proton_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 51.8*10^(-7.4))
              "H+ in plasma"
              annotation (Placement(transformation(extent={{30,20},{50,40}})));
            Physiolib.Chemical.Components.Membrane MCT(useKineticsInput=false, KC=
                 KC) "Monocarboxylate transporters" annotation (Placement(
                  transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={52,0})));
            Physiolib.Chemical.Components.Substance CO2(substanceData=Media.Substance.CarbonDioxide_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.00167)
              "free dissolved unbound CO2"
              annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
            Physiolib.Chemical.Components.Substance CO2_E(substanceData=Media.Substance.CarbonDioxide_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.00125)
              "free dissolved unbound CO2" annotation (Placement(transformation(
                    extent={{-58,-38},{-38,-18}})));
            Physiolib.Chemical.Components.Membrane freeCO2(KC=KC) annotation (
                Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={-38,2})));
            Physiolib.Chemical.Components.Substance O2(substanceData=Media.Substance.Oxygen_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.000167)
              "free dissolved undound oxygen"
              annotation (Placement(transformation(extent={{96,20},{116,40}})));
            Physiolib.Chemical.Components.Membrane freeO2(KC=KC) annotation (
                Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={118,0})));
            Physiolib.Chemical.Components.Substance O2_E(amountOfSubstance_start(
                  displayUnit="mmol") = 0.000125, substanceData=Media.Substance.Oxygen_aqueous)
              "free dissolved undound O2"
              annotation (Placement(transformation(extent={{96,-38},{116,-18}})));
            Physiolib.Chemical.Components.Substance K(substanceData=Media.Substance.Potassium_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.004) annotation (
                Placement(transformation(extent={{-100,20},{-120,40}})));
            Physiolib.Chemical.Components.Substance Na(substanceData=Media.Substance.Sodium_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.138) annotation (
                Placement(transformation(extent={{-124,20},{-144,40}})));
            Physiolib.Chemical.Components.Substance Na_E(substanceData=Media.Substance.Sodium_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.007) annotation (
                Placement(transformation(extent={{-118,-38},{-138,-18}})));
            Physiolib.Chemical.Components.Substance K_E(substanceData=Media.Substance.Potassium_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.096) annotation (
                Placement(transformation(extent={{-112,-38},{-92,-18}})));
            Physiolib.Chemical.Components.Substance H2PO4_E(substanceData=Media.Substance.DihydrogenPhosphate_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.000175)
              annotation (Placement(transformation(extent={{-84,-38},{-64,-18}})));
            Physiolib.Chemical.Components.Substance ADP_E(substanceData(z=-3),
                amountOfSubstance_start(displayUnit="mmol") = 9.6e-05)
              annotation (Placement(transformation(extent={{-114,-62},{-94,-42}})));
            Physiolib.Chemical.Components.Substance ATP_E(substanceData(
                z=-4,
                DfH_25degC=16700,
                DfG_25degC_1bar=30500,
                References={
                    "http://www.wiley.com/college/pratt/0471393878/student/review/thermodynamics/7_relationship.html"}),
                amountOfSubstance_start(displayUnit="mmol") = 0.00128)
              annotation (Placement(transformation(extent={{-146,-62},{-166,-42}})));
            Physiolib.Chemical.Components.Substance HPO4_E(substanceData=Media.Substance.HydrogenPhosphate_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.000495)
              annotation (Placement(transformation(extent={{-84,-62},{-64,-42}})));
            Physiolib.Chemical.Components.Substance H2PO4(substanceData=Media.Substance.DihydrogenPhosphate_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.000365)
              annotation (Placement(transformation(extent={{-86,78},{-66,98}})));
            Physiolib.Chemical.Components.Substance HPO4(substanceData=Media.Substance.HydrogenPhosphate_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.001635)
              annotation (Placement(transformation(extent={{-80,58},{-60,78}})));
            Physiolib.Chemical.Components.Substance globulins(substanceData(
                MolarWeight=34,
                z=-2.43,
                density=1080), amountOfSubstance_start(displayUnit="mmol")=
                0.00082)
              annotation (Placement(transformation(extent={{150,76},{130,96}})));
            Physiolib.Chemical.Components.Substance Ca(substanceData=Media.Substance.Calcium_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.00175) "Ca2+"
              annotation (Placement(transformation(extent={{-78,20},{-98,40}})));
            Physiolib.Chemical.Components.Substance Mg(substanceData=Media.Substance.Magnesium_aqueous,
                amountOfSubstance_start(displayUnit="mmol") = 0.00108) "Mg2+"
              annotation (Placement(transformation(extent={{-112,-84},{-92,-64}})));
            Physiolib.Chemical.Components.Substance DPG(amountOfSubstance_start(
                  displayUnit="mmol") = 0.0051, substanceData(
                MolarWeight=0.266,
                z=-2.2,
                density=1000)) annotation (Placement(transformation(extent={{128,
                      -94},{108,-74}})));
            Physiolib.Chemical.Components.Substance GSH(substanceData(
                MolarWeight=0.2,
                z=-1,
                density=1000), amountOfSubstance_start(displayUnit="mmol")=
                0.00223) annotation (Placement(transformation(extent={{164,-94},{
                      144,-74}})));
            Chemical.Components.Reaction chemicalReaction1(nP=2) "10^(-6.66 + 3)"
              annotation (Placement(transformation(extent={{-56,78},{-36,98}})));
            Chemical.Components.Reaction HendersonHasselbalch(
              nP=2,
              nS=2,
              useKineticsInput=false) "K=10^(-6.103 + 3), dH=7.3 kJ/mol"
              annotation (Placement(transformation(extent={{-34,64},{-14,44}})));
            Chemical.Sources.Buffer Hemoglobin(
              substanceData(z=1.045),
              a_start=10^(-7.2),
              BufferValue=3) annotation (Placement(transformation(extent={{10,-10},
                      {-10,10}}, origin={82,-76})));
          equation
          //  pH_p = -log10(H.a);
           // pH_e = -log10(H_E.a);
          connect(H2O.solution, blood_plasma.solution)
            annotation (Line(points={{-150,44},{-150,44},{-150,26},{-150,26},{-150,20},{108,
                    20},{108,12.88}}, color={127,127,0}));
          connect(Cl.solution, blood_plasma.solution) annotation (Line(
              points={{0,20},{0,16},{0,12.88},{108,12.88}},
              color={127,127,0}));
            connect(H2O_E.solution, blood_erythrocytes.solution) annotation (Line(
                  points={{-148,-38},{108,-38},{108,-99.1}},
                                                          color={127,127,0}));
            connect(Cl_E.solution, blood_erythrocytes.solution) annotation (Line(
                points={{0,-38},{0,-68},{0,-99.1},{108,-99.1}},
                color={127,127,0}));
            connect(HCO3_E.solution, blood_erythrocytes.solution) annotation (Line(
                  points={{-24,-38},{108,-38},{108,-99.1}},
                                                        color={127,127,0}));
            connect(Aquapirin.port_b, H2O_E.port_a) annotation (Line(
                points={{-168,-10},{-168,-28},{-164,-28}},
                color={158,66,200},
                thickness=1));
            connect(Aquapirin.port_a, H2O.port_a) annotation (Line(
                points={{-168,10},{-168,54},{-166,54}},
                color={158,66,200},
                thickness=1));
            connect(Band3.port_a, HCO3.port_a) annotation (Line(
                points={{-6,10},{-6,30},{-8,30}},
                color={158,66,200},
                thickness=1));
            connect(Band3.port_b, HCO3_E.port_a) annotation (Line(
                points={{-6,-10},{-6,-28},{-8,-28}},
                color={158,66,200},
                thickness=1));
            connect(Band3_.port_b, Cl_E.port_a) annotation (Line(
                points={{18,-10},{18,-28},{16,-28}},
                color={158,66,200},
                thickness=1));
            connect(Band3_.port_a, Cl.port_a) annotation (Line(
                points={{18,10},{18,30},{16,30}},
                color={158,66,200},
                thickness=1));
          connect(HCO3.solution, blood_plasma.solution) annotation (Line(
              points={{-24,20},{108,20},{108,12.88}},
              color={127,127,0}));
            connect(blood_plasma.solution, permeableUncharged.solution) annotation (Line(
                points={{108,12.88},{108,20},{162,20}},
                color={127,127,0}));
            connect(blood_erythrocytes.solution, permeableUncharged_E.solution)
              annotation (Line(
                points={{108,-99.1},{108,-38},{160,-38}},
                color={127,127,0}));
            connect(blood_erythrocytes.solution,chargedImpermeable_E. solution)
              annotation (Line(
                points={{108,-99.1},{108,-38},{140,-38},{140,-62},{148,-62}},
                color={127,127,0}));
            connect(permeableUncharged.port_a, leak.port_a) annotation (Line(
                points={{146,30},{140,30},{140,10}},
                color={158,66,200},
                thickness=1));
            connect(permeableUncharged_E.port_a, leak.port_b) annotation (Line(
                points={{144,-28},{140,-28},{140,-10}},
                color={158,66,200},
                thickness=1));
            connect(MCT_.port_a, Lac.port_a) annotation (Line(
                points={{78,10},{78,30},{76,30}},
                color={158,66,200},
                thickness=1));
            connect(MCT_.port_b, Lac_E.port_a) annotation (Line(
                points={{78,-10},{78,-28},{76,-28}},
                color={158,66,200},
                thickness=1));
            connect(Lac.solution, blood_plasma.solution) annotation (Line(
                points={{60,20},{108,20},{108,12.88}},
                color={127,127,0}));
            connect(blood_erythrocytes.solution, Lac_E.solution) annotation (Line(
                points={{108,-99.1},{108,-38},{60,-38}},
                color={127,127,0}));
            connect(H_E.solution, blood_erythrocytes.solution) annotation (Line(
                points={{34,-38},{108,-38},{108,-99.1}},
                color={127,127,0}));
            connect(H_E.port_a, MCT.port_b) annotation (Line(
                points={{50,-28},{52,-28},{52,-10}},
                color={158,66,200},
                thickness=1));
            connect(MCT.port_a, H.port_a) annotation (Line(
                points={{52,10},{52,30},{50,30}},
                color={158,66,200},
                thickness=1));
            connect(blood_plasma.solution, H.solution) annotation (Line(
                points={{108,12.88},{108,20},{34,20}},
                color={127,127,0}));
            connect(CO2.port_a, freeCO2.port_a) annotation (Line(
                points={{-40,30},{-38,30},{-38,12}},
                color={158,66,200},
                thickness=1));
            connect(freeCO2.port_b, CO2_E.port_a) annotation (Line(
                points={{-38,-8},{-38,-28}},
                color={158,66,200},
                thickness=1));
            connect(blood_plasma.solution, CO2.solution) annotation (Line(
                points={{108,12.88},{108,20},{-56,20}},
                color={127,127,0}));
            connect(CO2_E.solution, blood_erythrocytes.solution) annotation (Line(
                points={{-54,-38},{108,-38},{108,-99.1}},
                color={127,127,0}));
            connect(blood_plasma.solution, O2.solution) annotation (Line(
                points={{108,12.88},{108,20},{100,20}},
                color={127,127,0}));
            connect(O2_E.solution, blood_erythrocytes.solution) annotation (Line(
                points={{100,-38},{108,-38},{108,-99.1}},
                color={127,127,0}));
            connect(O2_E.port_a, freeO2.port_b) annotation (Line(
                points={{116,-28},{118,-28},{118,-10}},
                color={158,66,200},
                thickness=1));
            connect(freeO2.port_a, O2.port_a) annotation (Line(
                points={{118,10},{118,30},{116,30}},
                color={158,66,200},
                thickness=1));
            connect(H2O.solution, K.solution) annotation (Line(
                points={{-150,44},{-150,20},{-104,20}},
                color={158,66,200}));
            connect(H2O.solution, Na.solution) annotation (Line(
                points={{-150,44},{-150,20},{-128,20}},
                color={158,66,200}));
            connect(H2O_E.solution, Na_E.solution) annotation (Line(
                points={{-148,-38},{-122,-38}},
                color={158,66,200}));
            connect(H2O_E.solution, K_E.solution) annotation (Line(
                points={{-148,-38},{-108,-38}},
                color={158,66,200}));
            connect(H2O_E.solution, H2PO4_E.solution) annotation (Line(
                points={{-148,-38},{-80,-38}},
                color={127,127,0}));
            connect(ADP_E.solution, K_E.solution) annotation (Line(
                points={{-110,-62},{-110,-38},{-108,-38}},
                color={158,66,200}));
            connect(ATP_E.solution, Na_E.solution) annotation (Line(
                points={{-150,-62},{-122,-62},{-122,-38}},
                color={127,127,0}));
            connect(H2O.solution, H2PO4.solution) annotation (Line(
                points={{-150,44},{-150,44},{-150,20},{-82,20},{-82,78}},
                color={127,127,0}));
            connect(HPO4_E.solution, H2PO4_E.solution) annotation (Line(
                points={{-80,-62},{-110,-62},{-110,-38},{-80,-38}},
                color={127,127,0}));
            connect(HPO4.solution, H2PO4.solution) annotation (Line(
                points={{-76,58},{-82,58},{-82,78}},
                color={127,127,0}));
            connect(Ca.solution, CO2.solution) annotation (Line(
                points={{-82,20},{-82,20},{-56,20}},
                color={127,127,0}));
            connect(Mg.solution, blood_erythrocytes.solution) annotation (Line(
                points={{-108,-84},{-108,-38},{108,-38},{108,-99.1}},
                color={127,127,0}));
            connect(DPG.solution, permeableUncharged_E.solution) annotation (Line(
                points={{124,-94},{140,-94},{140,-38},{160,-38}},
                color={127,127,0}));
            connect(GSH.solution, permeableUncharged_E.solution) annotation (Line(
                points={{160,-94},{140,-94},{140,-38},{160,-38}},
                color={127,127,0}));
            connect(H2PO4.port_a, chemicalReaction1.substrates[1]) annotation (Line(
                points={{-66,88},{-58,88},{-56,88}},
                color={158,66,200},
                thickness=1));
            connect(HPO4.port_a, chemicalReaction1.products[1]) annotation (Line(
                points={{-60,68},{-60,68},{-22,68},{-22,86},{-36,86}},
                color={158,66,200},
                thickness=1));
            connect(H.port_a, chemicalReaction1.products[2]) annotation (Line(
                points={{50,30},{50,30},{50,90},{50,90},{-36,90}},
                color={158,66,200},
                thickness=1));
            connect(CO2.port_a, HendersonHasselbalch.substrates[2]) annotation (Line(
                points={{-40,30},{-38,30},{-38,52},{-34,52}},
                color={158,66,200},
                thickness=1));
            connect(HCO3.port_a, HendersonHasselbalch.products[2]) annotation (Line(
                points={{-8,30},{-8,30},{-8,52},{-14,52}},
                color={158,66,200},
                thickness=1));
            connect(HendersonHasselbalch.substrates[1], H2O.port_a) annotation (Line(
                points={{-34,56},{-166,56},{-166,54}},
                color={158,66,200},
                thickness=1));
            connect(HendersonHasselbalch.products[1], H.port_a) annotation (Line(
                points={{-14,56},{18,56},{50,56},{50,30}},
                color={158,66,200},
                thickness=1));
            connect(Hemoglobin.solution, blood_erythrocytes.solution) annotation (Line(
                  points={{88,-86},{94,-86},{108,-86},{108,-99.1}}, color={127,127,
                    0}));
            connect(Hemoglobin.port_a, H_E.port_a) annotation (Line(points={{72,-76},{64,-76},
                    {50,-76},{50,-28}}, color={158,66,200}));

            connect(albumin.solution, blood_plasma.solution) annotation (Line(
                points={{108,76},{126,76},{126,20},{108,20},{108,12.88}},
                color={127,127,0},
                smooth=Smooth.None));
            connect(globulins.solution, blood_plasma.solution) annotation (Line(
                points={{146,76},{126,76},{126,20},{108,20},{108,12.88}},
                color={127,127,0},
                smooth=Smooth.None));
            annotation ( Documentation(info="<html>
<p>Blood eqiulibrium across erythrocyte membrane bewteen blood plasma and intracellular fluid of erythrocytes.</p>
<p>Data of blood status are from:</p>
<p>Raftos, J.E., Bulliman, B.T. and Kuchel, P.W. Evaluation of an electrochemical model of erythrocyte pH buffering using 31P nuclear magnetic resonance data. <i>The Journal of general physiology</i> 1990;95(6):1183-1204. </p>
</html>",          revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"),    experiment(StopTime=1e-008),
            Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-100},
                      {180,100}}), graphics));
          end RedCellMembrane;
        end Dev;
      end AcidBase;

      package Hemoglobin "Hemoglobin blood gases binding"
        model Allosteric_Hemoglobin_MWC "Monod,Wyman,Changeux (1965)"
          extends Modelica.Icons.Example;

          constant Modelica.SIunits.AmountOfSubstance THb = 0.001
            "Total amount of hemoglobin";

          constant Modelica.SIunits.Temperature T=298.15 "Base Temperature";
          constant Real RT=Modelica.Constants.R*T;

          constant Modelica.SIunits.AmountOfSubstance AmountOfSolutionIn1L = 38.7
            "Amount of solution used for molarity to mole fraction conversion";

          constant Modelica.SIunits.Volume OneLiter = 0.001;

          constant Real L=7.0529*10^6
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
          constant Real c=0.00431555
            "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
          constant Modelica.SIunits.Concentration KR=0.000671946
            "Oxygen dissociation coefficient on relaxed(R) hemoglobin subunit";

          constant Real KRx=KR*OneLiter/AmountOfSolutionIn1L
            "Mole fraction based KR";

        //Relative Gibbs formation energies of the substances in the system:
          constant Modelica.SIunits.MolarEnergy
            GO2aq=-RT*log(0.0013/55.508),
            GR0=0,                            GT0=GR0 -RT*log(L),
            GR1=GR0+GO2aq +RT*log(KRx/4),     GT1=GR1 -RT*log(c*L),
            GR2=GR1+GO2aq +RT*log(KRx/(3/2)), GT2=GR2 -RT*log(c^2*L),
            GR3=GR2+GO2aq +RT*log(KRx/(2/3)), GT3=GR3 -RT*log(c^3*L),
            GR4=GR3+GO2aq +RT*log(KRx*4),     GT4=GR4 -RT*log(c^4*L);
                                          //*0.018),

          parameter Real KC = 0.001 "Slow down factor";

          Physiolib.Chemical.Components.Solution solution
            annotation (Placement(transformation(extent={{-72,-102},{94,124}})));

          Physiolib.Chemical.Components.Substance oxygen_unbound(substanceData(
                DfG_25degC_1bar=GO2aq), amountOfSubstance_start(displayUnit="mol")=
                 1e-5)
            annotation (Placement(transformation(extent={{-62,-46},{-42,-26}})));

          Physiolib.Chemical.Components.Substance T0(substanceData(
                DfG_25degC_1bar=GT0), amountOfSubstance_start=THb)
            annotation (Placement(transformation(extent={{34,78},{54,98}})));

          Physiolib.Chemical.Components.Substance T1(substanceData(
                DfG_25degC_1bar=GT1), amountOfSubstance_start=THb*1e-4)
            annotation (Placement(transformation(extent={{34,36},{54,56}})));

          Physiolib.Chemical.Components.Substance T2(substanceData(
                DfG_25degC_1bar=GT2), amountOfSubstance_start=THb*1e-8)
            annotation (Placement(transformation(extent={{34,-10},{54,10}})));

          Physiolib.Chemical.Components.Substance R1(substanceData(
                DfG_25degC_1bar=GR1), amountOfSubstance_start=THb*1e-8)
            annotation (Placement(transformation(extent={{-20,36},{0,56}})));

          Physiolib.Chemical.Components.Substance R2(substanceData(
                DfG_25degC_1bar=GR2), amountOfSubstance_start=THb*1e-10)
            annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

          Physiolib.Chemical.Components.Substance T3(substanceData(
                DfG_25degC_1bar=GT3), amountOfSubstance_start=THb*1e-12)
            annotation (Placement(transformation(extent={{34,-54},{54,-34}})));

          Physiolib.Chemical.Components.Substance R3(substanceData(
                DfG_25degC_1bar=GR3), amountOfSubstance_start=THb*1e-12)
            annotation (Placement(transformation(extent={{-20,-54},{0,-34}})));

          Physiolib.Chemical.Components.Substance T4(substanceData(
                DfG_25degC_1bar=GT4), amountOfSubstance_start=THb*1e-17)
            annotation (Placement(transformation(extent={{34,-92},{54,-72}})));

          Physiolib.Chemical.Components.Substance R4(substanceData(
                DfG_25degC_1bar=GR4), amountOfSubstance_start=THb*1e-14)
            annotation (Placement(transformation(extent={{-20,-92},{0,-72}})));

          Physiolib.Chemical.Components.Substance R0(substanceData(
                DfG_25degC_1bar=GR0), amountOfSubstance_start=THb*1e-7)
            annotation (Placement(transformation(extent={{-20,78},{0,98}})));

          Physiolib.Chemical.Components.Reaction quaternaryForm(KC=KC)
            annotation (Placement(transformation(extent={{4,78},{24,98}})));
          Physiolib.Chemical.Components.Reaction oxyR1(nP=2, KC=KC) annotation (
              Placement(transformation(
                extent={{-10,10},{10,-10}},
                rotation=90,
                origin={-8,64})));
          Physiolib.Chemical.Components.Reaction oxyT1(nP=2, KC=KC) annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={44,64})));
          Physiolib.Chemical.Components.Reaction oxyR2(nP=2, KC=KC) annotation (
              Placement(transformation(
                extent={{-10,10},{10,-10}},
                rotation=90,
                origin={-10,22})));
          Physiolib.Chemical.Components.Reaction oxyR3(nP=2, KC=KC) annotation (
              Placement(transformation(
                extent={{-10,10},{10,-10}},
                rotation=90,
                origin={-10,-24})));
          Physiolib.Chemical.Components.Reaction oxyR4(nP=2, KC=KC) annotation (
              Placement(transformation(
                extent={{-10,10},{10,-10}},
                rotation=90,
                origin={-10,-66})));
          Physiolib.Chemical.Components.Reaction oxyT2(nP=2, KC=KC) annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={44,22})));
          Physiolib.Chemical.Components.Reaction oxyT3(nP=2, KC=KC) annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={44,-24})));
          Physiolib.Chemical.Components.Reaction oxyT4(nP=2, KC=KC) annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={44,-66})));
          Physiolib.Chemical.Components.Reaction quaternaryForm1(KC=KC)
            annotation (Placement(transformation(extent={{8,36},{28,56}})));
          Physiolib.Chemical.Components.Reaction quaternaryForm2(KC=KC)
            annotation (Placement(transformation(extent={{8,-10},{28,10}})));
          Physiolib.Chemical.Components.Reaction quaternaryForm3(KC=KC)
            annotation (Placement(transformation(extent={{8,-54},{28,-34}})));
          Physiolib.Chemical.Components.Reaction quaternaryForm4(KC=KC)
            annotation (Placement(transformation(extent={{10,-92},{30,-72}})));

          Modelica.Blocks.Sources.Clock clock(offset=10)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-84,62})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance O2_in_air(
            TotalPressure(displayUnit="kPa") = 101325.0144354,
            substanceData=Media.Substance.Oxygen_gas,
            PartialPressure(displayUnit="kPa") = 1000,
            usePartialPressureInput=true) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-84,22})));

          Physiolib.Chemical.Components.GasSolubility gasSolubility(
              useWaterCorrection=false, KC=KC)
            annotation (Placement(transformation(extent={{-94,-16},{-74,4}})));

          Physiolib.Chemical.Components.Substance H2O(substanceData=Media.Substance.Water_liquid,
              amountOfSubstance_start=38.7)
            annotation (Placement(transformation(extent={{64,-100},{84,-80}})));

          Real sO2;
        equation
          sO2 = (R1.x + 2*R2.x + 3*R3.x + 4*R4.x + T1.x + 2*T2.x + 3*T3.x + 4*T4.x) /
           (4*(R0.x + R1.x + R2.x + R3.x + R4.x + T0.x + T1.x + T2.x + T3.x + T4.x));

          connect(quaternaryForm.products[1],T0. port_a) annotation (Line(
              points={{24,88},{54,88}},
              color={107,45,134}));
          connect(oxyR1.substrates[1],R1. port_a) annotation (Line(
              points={{-8,54},{-8,46},{0,46}},
              color={107,45,134}));
          connect(R1.port_a,oxyR2. products[1]) annotation (Line(
              points={{0,46},{0,32},{-12,32}},
              color={107,45,134}));
          connect(oxyR2.substrates[1],R2. port_a) annotation (Line(
              points={{-10,12},{-10,0},{0,0}},
              color={107,45,134}));
          connect(oxyR3.substrates[1],R3. port_a) annotation (Line(
              points={{-10,-34},{-10,-44},{0,-44}},
              color={107,45,134}));
          connect(oxyR3.products[1],R2. port_a) annotation (Line(
              points={{-12,-14},{-12,-7},{0,-7},{0,0}},
              color={107,45,134}));
          connect(R3.port_a,oxyR4. products[1]) annotation (Line(
              points={{0,-44},{0,-56},{-12,-56}},
              color={107,45,134}));
          connect(oxyR4.substrates[1],R4. port_a) annotation (Line(
              points={{-10,-76},{-10,-82},{0,-82}},
              color={107,45,134}));
          connect(oxyT1.products[1],T0. port_a) annotation (Line(
              points={{46,74},{46,88},{54,88}},
              color={107,45,134}));
          connect(oxyT1.substrates[1],T1. port_a) annotation (Line(
              points={{44,54},{44,46},{54,46}},
              color={107,45,134}));
          connect(T1.port_a,oxyT2. products[1]) annotation (Line(
              points={{54,46},{54,32},{46,32}},
              color={107,45,134}));
          connect(oxyT3.substrates[1],T3. port_a) annotation (Line(
              points={{44,-34},{44,-44},{54,-44}},
              color={107,45,134}));
          connect(T3.port_a,oxyT4. products[1]) annotation (Line(
              points={{54,-44},{54,-56},{46,-56}},
              color={107,45,134}));
          connect(oxyT4.substrates[1],T4. port_a) annotation (Line(
              points={{44,-76},{44,-82},{54,-82}},
              color={107,45,134}));
          connect(R0.port_a,quaternaryForm. substrates[1]) annotation (Line(
              points={{0,88},{4,88}},
              color={107,45,134}));
          connect(R0.port_a,oxyR1. products[1]) annotation (Line(
              points={{0,88},{0,74},{-10,74}},
              color={107,45,134}));
          connect(R1.port_a,quaternaryForm1. substrates[1]) annotation (Line(
              points={{0,46},{8,46}},
              color={107,45,134}));
          connect(quaternaryForm1.products[1],T1. port_a) annotation (Line(
              points={{28,46},{54,46}},
              color={107,45,134}));
          connect(R2.port_a,quaternaryForm2. substrates[1]) annotation (Line(
              points={{0,0},{8,0}},
              color={107,45,134}));
          connect(R3.port_a,quaternaryForm3. substrates[1]) annotation (Line(
              points={{0,-44},{8,-44}},
              color={107,45,134}));
          connect(quaternaryForm3.products[1],T3. port_a) annotation (Line(
              points={{28,-44},{54,-44}},
              color={107,45,134}));
          connect(R4.port_a,quaternaryForm4. substrates[1]) annotation (Line(
              points={{0,-82},{10,-82}},
              color={107,45,134}));
          connect(quaternaryForm4.products[1],T4. port_a) annotation (Line(
              points={{30,-82},{54,-82}},
              color={107,45,134}));
          connect(oxyR1.products[2],oxygen_unbound. port_a)
                                              annotation (Line(
              points={{-6,74},{-42,74},{-42,-36}},
              color={107,45,134}));
          connect(oxyR2.products[2],oxygen_unbound. port_a)
                                              annotation (Line(
              points={{-8,32},{-42,32},{-42,-36}},
              color={107,45,134}));
          connect(oxyR3.products[2],oxygen_unbound. port_a)
                                              annotation (Line(
              points={{-8,-14},{-42,-14},{-42,-36}},
              color={107,45,134}));
          connect(oxyR4.products[2],oxygen_unbound. port_a)
                                              annotation (Line(
              points={{-8,-56},{-42,-56},{-42,-36}},
              color={107,45,134}));
          connect(oxygen_unbound.port_a, oxyT1.products[2])
                                              annotation (Line(
              points={{-42,-36},{-42,74},{42,74}},
              color={107,45,134}));
          connect(oxygen_unbound.port_a, oxyT2.products[2])
                                              annotation (Line(
              points={{-42,-36},{-42,32},{42,32}},
              color={107,45,134}));
          connect(oxygen_unbound.port_a, oxyT3.products[2])
                                              annotation (Line(
              points={{-42,-36},{-42,-14},{42,-14}},
              color={107,45,134}));
          connect(oxygen_unbound.port_a, oxyT4.products[2])
                                              annotation (Line(
              points={{-42,-36},{-42,-56},{42,-56}},
              color={107,45,134}));
          connect(O2_in_air.port_a, gasSolubility.gas_port) annotation (Line(
              points={{-84,12},{-84,4}},
              color={158,66,200}));
          connect(gasSolubility.liquid_port, oxygen_unbound.port_a) annotation (Line(
              points={{-84,-16},{-84,-36},{-42,-36}},
              color={158,66,200}));
          connect(oxygen_unbound.solution, solution.solution) annotation (Line(
              points={{-58,-46},{-58,-64},{-58,-64},{-58,-82},{-16,-82},{-16,-100},
                  {-16,-100},{-16,-100},{-16,-99.74},{22,-99.74},{60.8,-99.74}},
              color={127,127,0}));
          connect(R0.solution, solution.solution) annotation (Line(
              points={{-16,78},{-16,-99.74},{60.8,-99.74}},
              color={127,127,0}));
          connect(T0.solution, solution.solution) annotation (Line(
              points={{38,78},{38,-99.74},{60.8,-99.74}},
              color={127,127,0}));
          connect(R1.solution, solution.solution) annotation (Line(points={{-16,36},
                  {-16,-99.74},{60.8,-99.74}},
                                    color={127,127,0}));
          connect(T1.solution, solution.solution) annotation (Line(points={{38,36},
                  {38,-99.74},{60.8,-99.74}},
                              color={127,127,0}));
          connect(R2.solution, solution.solution) annotation (Line(points={{-16,-10},
                  {-16,-99.74},{60.8,-99.74}},
                                    color={127,127,0}));
          connect(T3.solution, solution.solution) annotation (Line(points={{38,-54},
                  {38,-99.74},{60.8,-99.74}},
                                    color={127,127,0}));
          connect(R3.solution, solution.solution) annotation (Line(points={{-16,-54},
                  {-16,-99.74},{60.8,-99.74}},
                                    color={127,127,0}));
          connect(R4.solution, solution.solution) annotation (Line(points={{-16,-92},
                  {-16,-99.74},{60.8,-99.74}},
                                    color={127,127,0}));
          connect(T4.solution, solution.solution) annotation (Line(points={{38,-92},
                  {38,-99.74},{60.8,-99.74}},
                                    color={127,127,0}));
          connect(quaternaryForm2.products[1], T2.port_a) annotation (Line(
              points={{28,0},{54,0}},
              color={158,66,200}));
          connect(oxyT2.substrates[1], T2.port_a) annotation (Line(
              points={{44,12},{44,0},{54,0}},
              color={158,66,200}));
          connect(T2.port_a, oxyT3.products[1]) annotation (Line(
              points={{54,0},{54,-14},{46,-14}},
              color={158,66,200}));
          connect(T2.solution, solution.solution) annotation (Line(points={{38,-10},
                  {38,-99.74},{60.8,-99.74}},
                                    color={127,127,0}));
          connect(clock.y, O2_in_air.partialPressure) annotation (Line(
              points={{-84,51},{-84,32}},
              color={0,0,127}));
        connect(H2O.solution, solution.solution) annotation (Line(
            points={{68,-100},{68,-99.74},{60.8,-99.74}},
            color={127,127,0}));
          annotation (          experiment(StopTime=15000, Tolerance=0.01),
                                  Documentation(info="<html>
<p>To understand the model is necessary to study the principles of MWC allosteric transitions first published by </p>
<p>[1] Monod,Wyman,Changeux (1965). &quot;On the nature of allosteric transitions: a plausible model.&quot; Journal of molecular biology 12(1): 88-118.</p>
<p><br>In short it is about binding oxygen to hemoglobin.</p>
<p>Oxgen are driven by its partial pressure using clock source - from very little pressure to pressure of 10kPa.</p>
<p>(Partial pressure of oxygen in air is the air pressure multiplied by the fraction of the oxygen in air.)</p>
<p>Hemoglobin was observed (by Perutz) in two structuraly different forms R and T.</p>
<p>These forms are represented by blocks T0..T4 and R0..R4, where the suffexed index means the number of oxygen bounded to the form.</p>
<p><br>In equilibrated model can be four chemical reactions removed and the results will be the same, but dynamics will change a lot. ;)</p>
<p>If you remove the quaternaryForm1,quaternaryForm2,quaternaryForm3,quaternaryForm4 then the model in equilibrium will be exactly the same as in MWC article.</p>
<p><br>Parameters was fitted to data of Severinghaus article from 1979. (For example at pO2=26mmHg is oxygen saturation sO2 = 48.27 %).</p>
</html>",     revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
        end Allosteric_Hemoglobin_MWC;

        model Allosteric_Hemoglobin2_MWC
          "Monod,Wyman,Changeux (1965) - The same allosteric hemoglobin model as Allosteric_Hemoglobin_MWC implemented by Speciation blocks"
          extends Modelica.Icons.Example;

          constant Modelica.SIunits.AmountOfSubstance THb = 0.001
            "Total amount of hemoglobin";

          constant Modelica.SIunits.Temperature T=298.15 "Base Temperature";
          constant Real RT=Modelica.Constants.R*T;

          constant Modelica.SIunits.AmountOfSubstance AmountOfSolutionIn1L = 38.7
            "Amount of solution used for molarity to mole fraction conversion";

          constant Modelica.SIunits.Volume OneLiter = 0.001;

          parameter Real L=7.0529*10^6
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
          parameter Real c=0.00431555
            "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
          parameter Modelica.SIunits.Concentration KR=0.000671946
            "oxygen dissociation on relaxed(R) hemoglobin subunit";
                                                                      //*7.875647668393782383419689119171e-5
                                                                    //10.500001495896 7.8756465463794e-05

          parameter Modelica.SIunits.Concentration KT=KR/c
            "oxygen dissociation on tensed(T) hemoglobin subunit";

          parameter Modelica.SIunits.MoleFraction KRx = KR*OneLiter/AmountOfSolutionIn1L;
          parameter Modelica.SIunits.MoleFraction KTx = KT*OneLiter/AmountOfSolutionIn1L;

          parameter Modelica.SIunits.ChemicalPotential DfG_O2 = -RT*log(0.0013/55.508);
          parameter Modelica.SIunits.ChemicalPotential DfG_uR = 0;
          parameter Modelica.SIunits.ChemicalPotential DfG_uRO2 = DfG_uR + DfG_O2 + RT * log(KRx);
          parameter Modelica.SIunits.ChemicalPotential DfG_uT = 0;
          parameter Modelica.SIunits.ChemicalPotential DfG_uTO2 = DfG_uT + DfG_O2 + RT * log(KTx);
          parameter Modelica.SIunits.ChemicalPotential DfG_tT = 0;
          parameter Modelica.SIunits.ChemicalPotential DfG_tR = DfG_tT + RT * log(L);

          parameter Real KC = 1e-3 "Slow down factor";
                                   //0.000001

          Physiolib.Chemical.Components.Solution solution
            annotation (Placement(transformation(extent={{-100,-100},{100,42}})));

          Physiolib.Chemical.Components.Reaction quaternaryForm(KC=KC)
            annotation (Placement(transformation(extent={{12,-58},{32,-38}})));
          Physiolib.Chemical.Components.Speciation R0_in_R(NumberOfSubunits=4)
            annotation (Placement(transformation(extent={{-46,-48},{-26,-28}})));
           // AmountOfSubstance_start=4e-11)
          Physiolib.Chemical.Components.Speciation T0_in_T(NumberOfSubunits=4)
            annotation (Placement(transformation(extent={{76,-48},{56,-28}})));
           // AmountOfSubstance_start=totalAmountOfHemoglobin)
          Physiolib.Chemical.Components.Substance OxyRHm[4](
            each amountOfSubstance_start=5.88e-9,
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_O2 + RT*log(KRx) + DfG_tR/4))
            "Oxygenated subunit in R structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{-96,-18},{-76,2}})));

          Physiolib.Chemical.Components.Reaction oxygenation_R[4](each nP=2,
              each KC=KC)
            annotation (Placement(transformation(extent={{-68,-18},{-48,2}})));
          Physiolib.Chemical.Components.Substance DeoxyRHm[4](
            each amountOfSubstance_start=1.58e-7,
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_tR/4))
            "Deoxygenated subunit in R structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{-8,-20},{-28,0}})));

          Physiolib.Chemical.Components.Substance OxyTHm[4](
            each amountOfSubstance_start=1e-4,
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_O2 + RT*log(KTx) + DfG_tT/4))
            "Oxygenated subunit in T structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{14,-18},{34,2}})));

          Physiolib.Chemical.Components.Reaction oxygenation_T[4](each nP=2,
              each KC=KC)
            annotation (Placement(transformation(extent={{42,-18},{62,2}})));
          Physiolib.Chemical.Components.Substance DeoxyTHm[4](
            each amountOfSubstance_start=THb - 1e-4 - 1.58e-7 - 5.88e-9,
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_tT/4))
            "Deoxygenated subunit in T structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{96,-20},{76,0}})));

          Physiolib.Chemical.Components.Substance oxygen_unbound(substanceData(
                DfG_25degC_1bar=DfG_O2), amountOfSubstance_start=2e-8)
            annotation (Placement(transformation(extent={{-2,6},{18,26}})));
          Modelica.Blocks.Sources.Clock clock(offset=100)
            annotation (Placement(transformation(extent={{-40,74},{-20,94}})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance oxygen_in_air(
              usePartialPressureInput=true, substanceData=Media.Substance.Oxygen_gas)
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={8,68})));
          Physiolib.Chemical.Components.GasSolubility partialPressure1(
              useWaterCorrection=false, KC=KC) annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={8,40})));

          Real sO2 "Hemoglobin oxygen saturation";
          Physiolib.Chemical.Components.Substance H2O(substanceData=Media.Substance.Water_liquid,
              amountOfSubstance_start=38.7)
            annotation (Placement(transformation(extent={{32,-92},{52,-72}})));
        equation
          sO2 = (sum(OxyRHm.x) + sum(OxyTHm.x)) /
          (sum(DeoxyRHm.x) + sum(DeoxyTHm.x) + sum(OxyRHm.x) + sum(OxyTHm.x));

          connect(OxyTHm.port_a, oxygenation_T.substrates[1])
                                                   annotation (Line(
              points={{34,-8},{42,-8}},
              color={107,45,134}));
          connect(oxygenation_T.products[1], DeoxyTHm.port_a)
                                                 annotation (Line(
              points={{62,-10},{70,-10},{76,-10}},
              color={107,45,134}));

          connect(clock.y, oxygen_in_air.partialPressure) annotation (Line(
              points={{-19,84},{8,84},{8,78}},
              color={0,0,127}));
          connect(OxyRHm.port_a, oxygenation_R.substrates[1]) annotation (Line(
              points={{-76,-8},{-68,-8}},
              color={107,45,134}));
          connect(DeoxyRHm.port_a, R0_in_R.subunits) annotation (Line(
              points={{-28,-10},{-39,-10},{-39,-27.8}},
              color={107,45,134}));
          connect(oxygenation_R.products[1], DeoxyRHm.port_a) annotation (Line(
              points={{-48,-10},{-28,-10}},
              color={107,45,134}));

          connect(T0_in_T.subunits, DeoxyTHm.port_a)   annotation (Line(
              points={{69,-27.8},{69,-10},{76,-10}},
              color={107,45,134}));

          connect(oxygen_in_air.port_a, partialPressure1.gas_port) annotation (Line(
              points={{8,58},{8,50}},
              color={158,66,200}));
          connect(partialPressure1.liquid_port, oxygen_unbound.port_a) annotation (Line(
              points={{8,30},{8,16},{18,16}},
              color={158,66,200}));
          connect(R0_in_R.port_a, quaternaryForm.substrates[1]) annotation (Line(
              points={{-26,-48},{-26,-48},{12,-48}},
              color={158,66,200}));
          connect(quaternaryForm.products[1], T0_in_T.port_a) annotation (Line(
              points={{32,-48},{32,-48},{56,-48}},
              color={158,66,200}));

          for i in 1:4 loop
            connect(oxygenation_T[i].products[2], oxygen_unbound.port_a) annotation (Line(
              points={{62,-6},{70,-6},{70,16},{18,16}},
              color={107,45,134}));
            connect(oxygenation_R[i].products[2], oxygen_unbound.port_a) annotation (Line(
              points={{-48,-6},{-34,-6},{-34,16},{18,16}},
              color={107,45,134}));
          connect(R0_in_R.subunitSolution, DeoxyRHm[i].solution) annotation (Line(
              points={{-32,-32},{-32,-22},{-12,-22},{-12,-20}},
              color={127,127,0}));
          connect(R0_in_R.subunitSolution, OxyRHm[i].solution) annotation (Line(
              points={{-32,-32},{-32,-22},{-92,-22},{-92,-18}},
              color={127,127,0}));
          connect(OxyTHm[i].solution, T0_in_T.subunitSolution) annotation (Line(
              points={{18,-18},{18,-22},{62,-22},{62,-32}},
              color={127,127,0}));
          connect(DeoxyTHm[i].solution, T0_in_T.subunitSolution) annotation (Line(
              points={{92,-20},{92,-22},{62,-22},{62,-32}},
              color={127,127,0}));
          end for;

          connect(R0_in_R.solution, solution.solution) annotation (Line(
              points={{-42,-48},{-42,-98.58},{60,-98.58}},
              color={127,127,0}));
          connect(T0_in_T.solution, solution.solution) annotation (Line(
              points={{72,-48},{72,-98.58},{60,-98.58}},
              color={127,127,0}));
          connect(oxygen_unbound.solution, solution.solution) annotation (Line(points={{2,6},{2,
                  -98.58},{60,-98.58}},            color={127,127,0}));
          connect(solution.solution, H2O.solution) annotation (Line(
              points={{60,-98.58},{36,-98.58},{36,-92}},
              color={127,127,0}));

          annotation (          experiment(StopTime=15000),
            Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<p><br>To understand the model is necessary to study the principles of MWC allosteric transitions first published by </p>
<p>[1] Monod,Wyman,Changeux (1965). &quot;On the nature of allosteric transitions: a plausible model.&quot; Journal of molecular biology 12(1): 88-118.</p>
<p><br>In short it is about binding oxygen to hemoglobin.</p>
<p>Oxgen are driven by its partial pressure using clock source - from very little pressure to pressure of 10kPa.</p>
<p>(Partial pressure of oxygen in air is the air pressure multiplied by the fraction of the oxygen in air.)</p>
<p>Hemoglobin was observed (by Perutz) in two structuraly different forms R and T.</p>
<p>These forms are represented by blocks T0..T4 and R0..R4, where the suffexed index means the number of oxygen bounded to the form.</p>
<p><br>In equilibrated model can be four chemical reactions removed and the results will be the same, but dynamics will change a lot. ;)</p>
<p>If you remove the quaternaryForm1,quaternaryForm2,quaternaryForm3,quaternaryForm4 then the model in equilibrium will be exactly the same as in MWC article.</p>
<p><br>Parameters was fitted to data of Severinghaus article from 1979. (For example at pO2=26mmHg is oxygen saturation sO2 = 48.27 %).</p>
</html>"));
        end Allosteric_Hemoglobin2_MWC;

        model HemoglobinQuaternaryForm
          "Hemoglobib quaternary form - part of multiple-ligand allosteric hemoglobin model"

          constant Integer N=12
            "Number of distinguished independent sides in quaternary structure";
          constant Real RT=Modelica.Constants.R*298.15;

          parameter Modelica.SIunits.MolarEnthalpy Ho = 59000
            "Enthalpy of deoxygenation";
          parameter Modelica.SIunits.MoleFraction Ko37 "KRx and KTx at 37degC";
          parameter Modelica.SIunits.MoleFraction Ko25 = Ko37*exp((Ho/Modelica.Constants.R)*(1/310.15 - 1/298.15))
            "KRx and KTx at 25degC";

          parameter Modelica.SIunits.MolarEnthalpy Hco = 59000
            "Enthalpy of carbon monoxide dissociation";
          parameter Modelica.SIunits.MoleFraction Kco37
            "Carboxyhemoglobin dissociation at 37degC";
          parameter Modelica.SIunits.MoleFraction Kco25 = Kco37*exp((Hco/Modelica.Constants.R)*(1/310.15 - 1/298.15))
            "Carboxyhemoglobin dissociation at 25degC";

          parameter Modelica.SIunits.MolarEnthalpy Hh
            "Enthalpy of deprotonation of h site";
          parameter Modelica.SIunits.MoleFraction Kh37 "KRhx and KThx at 37 degC";
          parameter Modelica.SIunits.MoleFraction Kh25 = Kh37*exp(((Hh)/Modelica.Constants.R)*(1/310.15 - 1/298.15))
            "KRhx and KThx at 25 degC";

          parameter Modelica.SIunits.MolarEnthalpy Hz
            "Enthalpy of deprotonation of -NH3+ terminus";
          parameter Modelica.SIunits.MoleFraction Kz37 "KRzx and KTzx at 37 degC";
          parameter Modelica.SIunits.MoleFraction Kz25 = Kz37*exp(((Hz)/Modelica.Constants.R)*(1/310.15 - 1/298.15))
            "KRzx and KTzx at 25 degC";

          parameter Modelica.SIunits.MolarEnthalpy Hc "Enthalpy of carboxylation";
          parameter Modelica.SIunits.MoleFraction Kc37 "KRcx and KTcx at 37degC";
          parameter Modelica.SIunits.MoleFraction Kc25 = Kc37*exp((Hc/Modelica.Constants.R)*(1/310.15 - 1/298.15))
            "KRcx and KTcx at 25degC";

          parameter Modelica.SIunits.ChemicalPotential DfG_O2=-RT*log(0.0013/
              55.508) + Physiolib.Media.Substance.Oxygen_gas.DfG_25degC_1bar;
          parameter Modelica.SIunits.ChemicalPotential DfH_O2=Physiolib.Media.Substance.Oxygen_aqueous.DfH_25degC;

          parameter Modelica.SIunits.ChemicalPotential DfG_CO2=-RT*log(0.034/
              55.508) + Physiolib.Media.Substance.CarbonDioxide_gas.DfG_25degC_1bar;
          parameter Modelica.SIunits.ChemicalPotential DfH_CO2=Physiolib.Media.Substance.CarbonDioxide_aqueous.DfH_25degC;

          parameter Modelica.SIunits.ChemicalPotential DfG_selectedForm
            "DfG_tR and DfG_tT";
          parameter Modelica.SIunits.MolarEnthalpy DfH_selectedForm = 0
            "DfH_tR and DfH_tT";

          parameter Real KC = 1e-3 "Slow down factor";
                                   //0.000001
          parameter Modelica.SIunits.MoleFraction initialO2
            "Initial mole fraction of unbound oxygen disoluted around hemoglobin";
          parameter Modelica.SIunits.MoleFraction initialH
            "Initial mole fraction of H+";
          parameter Modelica.SIunits.MoleFraction initialCO2
            "Initial mole fraction of unbound carbon dioxide disoluted around hemoglobin";
          parameter Modelica.SIunits.AmountOfSubstance initialHb
            "Initial amount of hemoglobin tetramers in this quaternary form";

          Physiolib.Chemical.Components.Speciation speciation(NumberOfSubunits=N)
            annotation (Placement(transformation(extent={{-18,-72},{2,-52}})));
           // AmountOfSubstance_start=4e-11)
           // AmountOfSubstance_start=totalAmountOfHemoglobin)
          Physiolib.Chemical.Components.Substance OxyHm[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_O2 + RT*log(Ko25) +
                  DfG_selectedForm/N, DfH_25degC=DfH_O2 - Ho + DfH_selectedForm/N),
            each amountOfSubstance_start=initialO2*initialHb/(Ko37 + initialO2))
            "Oxygenated subunit"
            annotation (Placement(transformation(extent={{-88,14},{-68,34}})));

          Physiolib.Chemical.Components.Reaction o[4](each nP=2, each KC=KC)
            annotation (Placement(transformation(extent={{-60,14},{-40,34}})));
          Physiolib.Chemical.Components.Substance DeoxyHm[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_selectedForm/N, DfH_25degC=
                  DfH_selectedForm/N),
            each amountOfSubstance_start=Ko37*initialHb/(Ko37 + initialO2))
            "Deoxygenated subunit"
            annotation (Placement(transformation(extent={{-8,12},{-28,32}})));

          Physiolib.Chemical.Interfaces.SolutionPort solution annotation (
              Placement(transformation(extent={{-50,-82},{-32,-62}}),
                iconTransformation(extent={{-50,-90},{-30,-70}})));
          Physiolib.Chemical.Interfaces.SubstancePort_b O2 annotation (Placement(
                transformation(extent={{-28,32},{-8,52}}), iconTransformation(
                  extent={{-90,70},{-70,90}})));
          Physiolib.Chemical.Interfaces.SubstancePort_a selectedForm annotation (
              Placement(transformation(extent={{26,-82},{46,-62}}),
                iconTransformation(extent={{30,-90},{50,-70}})));
          Physiolib.Chemical.Components.Substance HmAH[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=RT*log(Kh25) + DfG_selectedForm/N,
                DfH_25degC=-Hh + DfH_selectedForm/N),
            each amountOfSubstance_start=initialH*initialHb/(Kh37 + initialH))
            "Protonated h site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{10,12},{30,32}})));
          Physiolib.Chemical.Components.Reaction h[4](each nP=2, each KC=KC)
            annotation (Placement(transformation(extent={{36,32},{56,12}})));
          Physiolib.Chemical.Components.Substance HmA[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_selectedForm/N, DfH_25degC=
                  DfH_selectedForm/N),
            each amountOfSubstance_start=Kh37*initialHb/(Kh37 + initialH))
            "Deprotonated h site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{92,14},{72,34}})));
          Physiolib.Chemical.Components.Substance HmNH3[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=RT*log(Kz25) + DfG_selectedForm/N,
                DfH_25degC=-Hz + DfH_selectedForm/N),
            each amountOfSubstance_start=(initialH^2)*initialHb/(initialH^2 +
                initialH*Kz37 + Kz37*Kc37*initialCO2))
            "Protonated z site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{-84,-42},{-64,-22}})));
          Physiolib.Chemical.Components.Reaction z[4](each nP=2, each KC=KC)
            annotation (Placement(transformation(extent={{-54,-42},{-34,-22}})));
          Physiolib.Chemical.Components.Substance HmNH2[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_selectedForm/N, DfH_25degC=
                  DfH_selectedForm/N),
            each amountOfSubstance_start=initialH*Kz37*initialHb/(initialH^2 +
                initialH*Kz37 + Kz37*Kc37*initialCO2))
            "Deprotonated z site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{12,-44},{-8,-24}})));
          Physiolib.Chemical.Components.Reaction c[4](
            each nP=2,
            each KC=KC,
            each nS=2)
            annotation (Placement(transformation(extent={{20,-42},{40,-22}})));
          Physiolib.Chemical.Interfaces.SubstancePort_b CO2 annotation (Placement(
                transformation(extent={{-8,-26},{12,-6}}), iconTransformation(
                  extent={{10,70},{30,90}})));
          Physiolib.Chemical.Components.Substance HmNHCOO[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each amountOfSubstance_start=(Kz37*Kc37*initialCO2)*initialHb/(
                initialH^2 + initialH*Kz37 + Kz37*Kc37*initialCO2),
            each substanceData(DfG_25degC_1bar=DfG_CO2 - RT*log(Kc25) +
                  DfG_selectedForm/N, DfH_25degC=DfH_CO2 + Hc + DfH_selectedForm/
                  N))
            "Carboxylated c site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{70,-44},{50,-24}})));
          Chemical.Interfaces.SubstancePort_b H annotation (Placement(
                transformation(extent={{50,-12},{70,8}}), iconTransformation(
                  extent={{70,70},{90,90}})));
        equation

          connect(OxyHm.port_a, o.substrates[1])
            annotation (Line(points={{-68,24},{-60,24},{-60,24}}, color={158,66,200}));
          connect(o.products[1], DeoxyHm.port_a)
            annotation (Line(points={{-40,22},{-28,22},{-28,22}},
                                                         color={158,66,200}));

          for i in 1:4 loop
            connect(h[i].products[2], H) annotation (Line(
                points={{56,20},{60,20},{60,-2}},
                color={158,66,200}));
            connect(speciation.subunitSolution, HmA[i].solution) annotation (Line(
              points={{-4,-56},{-4,-44},{94,-44},{94,12},{88,12},{88,14}},
              color={127,127,0}));
            connect(speciation.subunitSolution, HmAH[i].solution) annotation (Line(
              points={{-4,-56},{-4,-44},{94,-44},{94,12},{14,12}},
              color={127,127,0}));
            connect(HmA[i].port_a, speciation.subunits[i+4]) annotation (Line(
              points={{72,24},{72,-52},{-11,-52},{-11,-51.8}},
              color={158,66,200}));

            connect(o[i].products[2], O2) annotation (Line(points={{-40,26},{-16,26},
                    {-16,42},{-18,42}},
                                   color={158,66,200}));
            connect(speciation.subunitSolution, DeoxyHm[i].solution) annotation (Line(
                  points={{-4,-56},{-4,-44},{94,-44},{94,12},{-12,12}},
                                                                  color={127,127,0}));
            connect(speciation.subunitSolution, OxyHm[i].solution) annotation (Line(
                  points={{-4,-56},{-4,-44},{94,-44},{94,12},{92,12},{-84,12},{-84,
                    14}},                                           color={127,127,
                    0}));
            connect(DeoxyHm[i].port_a, speciation.subunits[i]) annotation (Line(
              points={{-28,22},{-28,22},{-12,22},{-12,-22},{-11,-22},{-11,-51.8}},
              color={158,66,200}));

            connect(z[i].products[2], H) annotation (Line(
                points={{-34,-30},{-22,-30},{-22,-2},{60,-2}},
                color={158,66,200}));
            connect(speciation.subunitSolution, HmNH2[i].solution) annotation (Line(
              points={{-4,-56},{-4,-44},{8,-44}},
              color={127,127,0}));
            connect(HmNH2[i].port_a, speciation.subunits[i + 8]) annotation (Line(
              points={{-8,-34},{-11,-34},{-11,-51.8}},
              color={158,66,200}));
            connect(HmNH3[i].solution, speciation.subunitSolution) annotation (Line(
              points={{-80,-42},{-80,-44},{-4,-44},{-4,-56}},
              color={127,127,0}));

            connect(c[i].products[2], H) annotation (Line(
                points={{40,-30},{46,-30},{46,-2},{60,-2}},
                color={158,66,200}));
            connect(CO2, c[i].substrates[2]) annotation (Line(
                points={{2,-16},{16,-16},{16,-30},{20,-30}},
                color={158,66,200}));
            connect(HmNHCOO[i].solution, speciation.subunitSolution) annotation (Line(
              points={{66,-44},{-4,-44},{-4,-56}},
              color={127,127,0}));

          end for;

          connect(speciation.solution, solution) annotation (Line(
              points={{-14,-72},{-22,-72},{-22,-56},{-28,-56},{-28,-72},{-41,-72}},
              color={127,127,0}));
          connect(speciation.port_a, selectedForm) annotation (Line(
              points={{2,-72},{12,-72},{12,-56},{20,-56},{20,-72},{36,-72}},
              color={158,66,200}));
          connect(HmAH.port_a,h. substrates[1]) annotation (Line(
              points={{30,22},{36,22}},
              color={158,66,200}));
          connect(h.products[1],HmA. port_a) annotation (Line(
              points={{56,24},{64,24},{72,24}},
              color={158,66,200}));

          connect(z.products[1], HmNH2.port_a) annotation (Line(
              points={{-34,-34},{-8,-34}},
              color={107,45,134}));

          connect(HmNH3.port_a, z.substrates[1]) annotation (Line(
              points={{-64,-32},{-62,-32},{-60,-32},{-54,-32}},
              color={158,66,200}));

          connect(HmNH2.port_a, c.substrates[1]) annotation (Line(
              points={{-8,-34},{20,-34}},
              color={158,66,200}));

          connect(HmNHCOO.port_a, c.products[1]) annotation (Line(
              points={{50,-34},{40,-34}},
              color={158,66,200}));

          connect(solution, solution) annotation (Line(
              points={{-41,-72},{-41,-72}},
              color={127,127,0}));
          connect(H, H) annotation (Line(
              points={{60,-2},{60,-2}},
              color={158,66,200}));

          annotation (          experiment(StopTime=15000),
            Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<p>M. Matej&aacute;k, T. Kulh&aacute;nek, and S. Matou&scaron;ek, &quot;Adair-based hemoglobin equilibrium with oxygen, carbon dioxide and hydrogen ion activity,&quot; Scandinavian Journal of Clinical &amp; Laboratory Investigation, pp. 1-8, 2017-2018.</p>
</html>"),  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}}),
                    graphics),
            Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                    100,100}}), graphics));
        end HemoglobinQuaternaryForm;

        model HemoglobinMultipleAllostery
          "Multiple-ligand allosteric hemoglobin model"
          extends Modelica.Icons.Example;

          constant Modelica.SIunits.AmountOfSubstance THb = 0.001
            "Total amount of hemoglobin";

          constant Real RT=Modelica.Constants.R*298.15;

          constant Modelica.SIunits.AmountOfSubstance AmountOfSolutionIn1L = 38.7
            "Amount of solution used for molarity to mole fraction conversion";

          constant Modelica.SIunits.Volume OneLiter = 0.001;

          parameter Real L_old=7.0529*10^6
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
          parameter Real c=0.00431555
            "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
          parameter Modelica.SIunits.Concentration KR=0.000671946
            "oxygen dissociation on relaxed(R) hemoglobin subunit";

          parameter Modelica.SIunits.Concentration KT=KR/c
            "oxygen dissociation on tensed(T) hemoglobin subunit";

          parameter Modelica.SIunits.MoleFraction KRo37 = KR*OneLiter/AmountOfSolutionIn1L;
          parameter Modelica.SIunits.MoleFraction KTo37 = KT*OneLiter/AmountOfSolutionIn1L;

          parameter Modelica.SIunits.ChemicalPotential DfG_O2 = -RT*log(0.0013/55.508);
          parameter Modelica.SIunits.ChemicalPotential DfG_CO2=-RT*log(0.034/
              55.508) + Physiolib.Media.Substance.CarbonDioxide_gas.DfG_25degC_1bar;

          parameter Modelica.SIunits.ChemicalPotential DfG_tT = 0;
          parameter Modelica.SIunits.ChemicalPotential DfG_tR = DfG_tT + RT * log(L);

          parameter Real KC = 1e-3 "Slow down factor";

          parameter Modelica.SIunits.MoleFraction initialO2=1.9594e-07
            "Initial O2 at 37degC, pO2=100Pa";             //at 25degC: 2.342e-8;
          parameter Modelica.SIunits.MoleFraction initialH=10^(-7.2);
          parameter Modelica.SIunits.MoleFraction initialCO2=2.4217e-10
            "Initial CO2 at 37degC, pCO2=40mmHg";          //at 25degC: 3.267e-5;
          parameter Modelica.SIunits.MoleFraction initialCO=1e-10
            "Initial CO at 37degC, pCO=0mmHg";          //at 25degC: 3.267e-5;

          parameter Modelica.SIunits.MoleFraction KRh37 = 10^(-6.89);
          parameter Modelica.SIunits.MoleFraction KTh37 = 10^(-7.52);

          parameter Modelica.SIunits.MoleFraction KRz37 = 10^(-7.25);
          parameter Modelica.SIunits.MoleFraction KTz37 = 10^(-7.73);

          parameter Modelica.SIunits.MoleFraction KRc37 = (10^(-8.35)) / (OneLiter/AmountOfSolutionIn1L);
          parameter Modelica.SIunits.MoleFraction KTc37 = (10^(-7.54)) / (OneLiter/AmountOfSolutionIn1L);

          parameter Real L=L_old
            *
            (((KTh37/((10^(-7.2))+KTh37)) / (KRh37/((10^(-7.2))+KRh37)))^4)
            *
            (((KTz37*((10^(-7.2))^2 + KRz37*(10^(-7.2)) + KRz37*KRc37*(2.4217e-5)))/(KRz37*((10^(-7.2))^2 + KTz37*(10^(-7.2)) + KTz37*KTc37*(2.4217e-5))))^4)
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";

          Physiolib.Chemical.Components.Solution solution(temperature_start=
                310.15)
            annotation (Placement(transformation(extent={{-100,-56},{100,32}})));

          Physiolib.Chemical.Components.Reaction quaternaryForm(KC=KC)
            annotation (Placement(transformation(extent={{-22,-52},{-2,-32}})));

          Physiolib.Chemical.Components.Substance O2_free(amountOfSubstance_start=
               initialO2*AmountOfSolutionIn1L, substanceData(DfG_25degC_1bar=
                  DfG_O2, DfH_25degC=-11700))
            annotation (Placement(transformation(extent={{-76,-12},{-56,8}})));
          Modelica.Blocks.Sources.Clock oxygenSource(offset=1000)
            annotation (Placement(transformation(extent={{-78,48},{-58,68}})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance oxygen_in_air(
            usePartialPressureInput=true,
            substanceData=Physiolib.Media.Substance.Oxygen_gas,
            Temperature=310.15) annotation (Placement(transformation(extent={{-10,
                    -10},{10,10}}, origin={-36,58})));
          Physiolib.Chemical.Components.GasSolubility partialPressure1(
              useWaterCorrection=false, KC=KC) annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={-14,32})));

          Physiolib.Chemical.Components.Substance H2O(substanceData=Physiolib.Media.Substance.Water_liquid,
              amountOfSubstance_start=AmountOfSolutionIn1L - THb - (initialO2 +
                initialCO2)*AmountOfSolutionIn1L)
            annotation (Placement(transformation(extent={{56,-54},{76,-34}})));
          HemoglobinQuaternaryForm                              relaxed(
            Ko37=KRo37,
            DfG_selectedForm=DfG_tR,
            initialO2=initialO2,
            initialHb=THb/(L + 1),
            initialH=initialH,
            Kh37=KRh37,
            Kz37=KRz37,
            Kc37=KRc37,
            initialCO2=initialCO2,
            DfG_O2=DfG_O2,
            DfG_CO2=DfG_CO2,
            KC=KC,
            Hc(displayUnit="kJ/mol") = -41000,
            Hz=8000,
            Hh=127000,
            Kco37=KRo37)
            annotation (Placement(transformation(extent={{-54,-44},{-34,-24}})));
          HemoglobinQuaternaryForm                              tensed(
            Ko37=KTo37,
            DfG_selectedForm=DfG_tT,
            initialO2=initialO2,
            initialHb=THb*L/(L + 1),
            initialH=initialH,
            Kh37=KTh37,
            Kz37=KTz37,
            Kc37=KTc37,
            initialCO2=initialCO2,
            DfG_O2=DfG_O2,
            DfG_CO2=DfG_CO2,
            KC=KC,
            Hc(displayUnit="kJ/mol") = 59000,
            Hz=-51000,
            Hh=59000,
            Kco37=KTo37)
                      annotation (Placement(transformation(extent={{32,-44},{12,-24}})));
          Physiolib.Chemical.Sources.ExternalMoleFraction H(
            substanceData=Physiolib.Media.Substance.Proton_aqueous,
            MoleFraction=initialH,
            Temperature=310.15) annotation (Placement(transformation(extent={{10,
                    -10},{-10,10}}, origin={-12,-18})));
          Physiolib.Chemical.Components.Substance CO2_free(
              amountOfSubstance_start=initialCO2*AmountOfSolutionIn1L,
              substanceData(DfG_25degC_1bar=DfG_CO2, DfH_25degC=-412900))
            annotation (Placement(transformation(extent={{86,-8},{66,12}})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance CO2_gas(
            substanceData=Physiolib.Media.Substance.CarbonDioxide_gas,
            PartialPressure(displayUnit="kPa") = 5330,
            Temperature=310.15) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={62,60})));
          Physiolib.Chemical.Components.GasSolubility partialPressure2(
              useWaterCorrection=false, KC=KC) annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={62,32})));

          Real sO2 "Hemoglobin oxygen saturation";
          Real sCO2 "Hemoglobin carbon dioxide saturation";
          Real dH "Hemoglobin charge change caused by binding of Bohr's protons";
        equation
          sO2 = (sum(relaxed.OxyHm.x) + sum(tensed.OxyHm.x)) /
          (sum(relaxed.DeoxyHm.x) + sum(tensed.DeoxyHm.x) + sum(relaxed.OxyHm.x) + sum(tensed.OxyHm.x));

          sCO2 = (sum(relaxed.HmNHCOO.x) + sum(tensed.HmNHCOO.x)) /
          (sum(relaxed.HmNH3.x) + sum(tensed.HmNH3.x) + sum(relaxed.HmNH2.x) + sum(tensed.HmNH2.x) + sum(relaxed.HmNHCOO.x) + sum(tensed.HmNHCOO.x));

          dH = (sum(relaxed.HmNH3.x) + sum(tensed.HmNH3.x) - sum(relaxed.HmNHCOO.x) - sum(tensed.HmNHCOO.x) - sum(relaxed.HmA.x) - sum(tensed.HmA.x)) /
          THb;

          connect(oxygenSource.y, oxygen_in_air.partialPressure)
            annotation (Line(points={{-57,58},{-46,58}}, color={0,0,127}));

          connect(oxygen_in_air.port_a, partialPressure1.gas_port) annotation (Line(
              points={{-26,58},{-26,58},{-14,58},{-14,42}},
              color={158,66,200}));
          connect(partialPressure1.liquid_port, O2_free.port_a) annotation (Line(
                points={{-14,22},{-14,-2},{-56,-2}}, color={158,66,200}));

          connect(O2_free.solution, solution.solution) annotation (Line(points={{-72,-12},
                  {-72,-54},{60,-54},{60,-55.12}},        color={127,127,0}));
          connect(solution.solution, H2O.solution) annotation (Line(
              points={{60,-55.12},{60,-54}},
              color={127,127,0}));

          connect(relaxed.solution, solution.solution) annotation (Line(
              points={{-48,-42},{-48,-54},{60,-54},{60,-55.12}},
              color={127,127,0}));
          connect(relaxed.O2, O2_free.port_a) annotation (Line(
              points={{-52,-26},{-52,-2},{-56,-2}},
              color={158,66,200}));
          connect(relaxed.selectedForm, quaternaryForm.substrates[1]) annotation (Line(
              points={{-40,-42},{-22,-42}},
              color={158,66,200}));
          connect(tensed.solution, solution.solution) annotation (Line(
              points={{26,-42},{26,-54},{60,-54},{60,-55.12}},
              color={127,127,0}));
          connect(tensed.O2, O2_free.port_a) annotation (Line(
              points={{30,-26},{30,-2},{-56,-2}},
              color={158,66,200}));
          connect(tensed.selectedForm, quaternaryForm.products[1]) annotation (Line(
              points={{18,-42},{-2,-42}},
              color={158,66,200}));
          connect(H.port_a, relaxed.H) annotation (Line(
              points={{-22,-18},{-36,-18},{-36,-26}},
              color={158,66,200}));
          connect(H.port_a, tensed.H) annotation (Line(
              points={{-22,-18},{14,-18},{14,-26}},
              color={158,66,200}));
          connect(CO2_gas.port_a, partialPressure2.gas_port) annotation (Line(
              points={{62,50},{62,42}},
              color={158,66,200}));
          connect(partialPressure2.liquid_port, CO2_free.port_a)
            annotation (Line(points={{62,22},{62,2},{66,2}}, color={158,66,200}));
          connect(CO2_free.port_a, tensed.CO2) annotation (Line(
              points={{66,2},{20,2},{20,-26}},
              color={158,66,200}));
          connect(CO2_free.port_a, relaxed.CO2) annotation (Line(
              points={{66,2},{-42,2},{-42,-26}},
              color={158,66,200}));
          connect(CO2_free.solution, solution.solution) annotation (Line(
              points={{82,-8},{82,-8},{82,-54},{60,-54},{60,-55.12}},
              color={127,127,0}));
          annotation (          experiment(StopTime=15000),
            Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<p>Oxygen dissociation curve of hemoglobin.</p>
<p>M. Matej&aacute;k, T. Kulh&aacute;nek, and S. Matou&scaron;ek, &quot;Adair-based hemoglobin equilibrium with oxygen, carbon dioxide and hydrogen ion activity,&quot; Scandinavian Journal of Clinical &amp; Laboratory Investigation, pp. 1-8, 2017-2018.</p>
<p><img src=\"modelica://Physiolib/Resources/Images/Examples/ODC_pH_CO2_Hb.png\"/></p>
<p>J. W. Severinghaus, &quot;Simple, accurate equations for human blood O2 dissociation computations,&quot; Journal of Applied Physiology, vol. 46, pp. 599-602, 1979.</p>
<p><br>pO2 .. partial pressure of oxygen in gas</p>
<p>pCO2 .. partial pressure of carbon dioxide</p>
<p>sO2 .. oxygen saturation of hemoglobin</p>
<p>pH = log10(aH), where aH is mole fraction based activity of hydrogen ions</p>
<p><img src=\"modelica://Physiolib/Resources/Images/Examples/ODC_T_Hb.png\"/></p>
<p>R. B. Reeves, &quot;The effect of temperature on the oxygen equilibrium curve of human blood,&quot; Respiration physiology, vol. 42, pp. 317-328, 1980.</p>
<p><br>T .. temperature</p>
</html>"),  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                    100}}), graphics));
        end HemoglobinMultipleAllostery;

        model HemoglobinQuaternaryFormCO
          "Hemoglobib quaternary form - part of multiple-ligand allosteric hemoglobin model"

          constant Integer N=12
            "Number of distinguished independent sides in quaternary structure";
          constant Real RT=Modelica.Constants.R*298.15;

          parameter Modelica.SIunits.MolarEnthalpy Ho = 59000
            "Enthalpy of deoxygenation";
          parameter Modelica.SIunits.MoleFraction Ko37 "KRx and KTx at 37degC";
          parameter Modelica.SIunits.MoleFraction Ko25 = Ko37*exp((Ho/Modelica.Constants.R)*(1/310.15 - 1/298.15))
            "KRx and KTx at 25degC";

          parameter Modelica.SIunits.MolarEnthalpy Hco = 59000
            "Enthalpy of carbon monoxide dissociation";
          parameter Modelica.SIunits.MoleFraction Kco37
            "Carboxyhemoglobin dissociation at 37degC";
          parameter Modelica.SIunits.MoleFraction Kco25 = Kco37*exp((Hco/Modelica.Constants.R)*(1/310.15 - 1/298.15))
            "Carboxyhemoglobin dissociation at 25degC";

          parameter Modelica.SIunits.MolarEnthalpy Hh
            "Enthalpy of deprotonation of h site";
          parameter Modelica.SIunits.MoleFraction Kh37 "KRhx and KThx at 37 degC";
          parameter Modelica.SIunits.MoleFraction Kh25 = Kh37*exp(((Hh)/Modelica.Constants.R)*(1/310.15 - 1/298.15))
            "KRhx and KThx at 25 degC";

          parameter Modelica.SIunits.MolarEnthalpy Hz
            "Enthalpy of deprotonation of -NH3+ terminus";
          parameter Modelica.SIunits.MoleFraction Kz37 "KRzx and KTzx at 37 degC";
          parameter Modelica.SIunits.MoleFraction Kz25 = Kz37*exp(((Hz)/Modelica.Constants.R)*(1/310.15 - 1/298.15))
            "KRzx and KTzx at 25 degC";

          parameter Modelica.SIunits.MolarEnthalpy Hc "Enthalpy of carboxylation";
          parameter Modelica.SIunits.MoleFraction Kc37 "KRcx and KTcx at 37degC";
          parameter Modelica.SIunits.MoleFraction Kc25 = Kc37*exp((Hc/Modelica.Constants.R)*(1/310.15 - 1/298.15))
            "KRcx and KTcx at 25degC";

          parameter Modelica.SIunits.ChemicalPotential DfG_O2=-RT*log(0.0013/
              55.508) + Physiolib.Media.Substance.Oxygen_gas.DfG_25degC_1bar;
          parameter Modelica.SIunits.ChemicalPotential DfH_O2=Physiolib.Media.Substance.Oxygen_aqueous.DfH_25degC;

          parameter Modelica.SIunits.ChemicalPotential DfG_CO=-RT*log(0.00099/
              55.508) + Physiolib.Media.Substance.CarbonMonoxide_gas.DfG_25degC_1bar;                                                                       //==Physiolib.Examples.Substances.CarbonMonoxide_aqueous.DfG_25degC_1bar
          parameter Modelica.SIunits.ChemicalPotential DfH_CO=Physiolib.Media.Substance.CarbonMonoxide_aqueous.DfH_25degC;

          parameter Modelica.SIunits.ChemicalPotential DfG_CO2=-RT*log(0.034/
              55.508) + Physiolib.Media.Substance.CarbonDioxide_gas.DfG_25degC_1bar;
          parameter Modelica.SIunits.ChemicalPotential DfH_CO2=Physiolib.Media.Substance.CarbonDioxide_aqueous.DfH_25degC;

          parameter Modelica.SIunits.ChemicalPotential DfG_selectedForm
            "DfG_tR and DfG_tT";
          parameter Modelica.SIunits.MolarEnthalpy DfH_selectedForm = 0
            "DfH_tR and DfH_tT";

          parameter Real KC = 1e-3 "Slow down factor";
                                   //0.000001
          parameter Modelica.SIunits.MoleFraction initialO2
            "Initial mole fraction of unbound oxygen disoluted around hemoglobin";
          parameter Modelica.SIunits.MoleFraction initialCO
            "Initial mole fraction of unbound carbon monoxide disoluted around hemoglobin";
          parameter Modelica.SIunits.MoleFraction initialH
            "Initial mole fraction of H+";
          parameter Modelica.SIunits.MoleFraction initialCO2
            "Initial mole fraction of unbound carbon dioxide disoluted around hemoglobin";
          parameter Modelica.SIunits.AmountOfSubstance initialHb
            "Initial amount of hemoglobin tetramers in this quaternary form";

          Physiolib.Chemical.Components.Speciation speciation(NumberOfSubunits=N)
            annotation (Placement(transformation(extent={{-18,-72},{2,-52}})));
           // AmountOfSubstance_start=4e-11)
           // AmountOfSubstance_start=totalAmountOfHemoglobin)
          Physiolib.Chemical.Components.Substance OxyHm[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_O2 + RT*log(Ko25) +
                  DfG_selectedForm/N, DfH_25degC=DfH_O2 - Ho + DfH_selectedForm/N),
            each amountOfSubstance_start=(initialO2/Ko37)*initialHb/(1 +
                initialO2/Ko37 + initialCO/Kco37)) "Oxygenated subunit"
            annotation (Placement(transformation(extent={{-88,14},{-68,34}})));

          Physiolib.Chemical.Components.Reaction o[4](each nP=2, each KC=KC)
            annotation (Placement(transformation(extent={{-60,14},{-40,34}})));
          Physiolib.Chemical.Components.Substance DeoxyHm[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_selectedForm/N, DfH_25degC=
                  DfH_selectedForm/N),
            each amountOfSubstance_start=initialHb/(1 + initialO2/Ko37 +
                initialCO/Kco37)) "Deoxygenated subunit"
            annotation (Placement(transformation(extent={{-8,12},{-28,32}})));

          Physiolib.Chemical.Interfaces.SolutionPort solution annotation (
              Placement(transformation(extent={{-50,-82},{-32,-62}}),
                iconTransformation(extent={{-50,-90},{-30,-70}})));
          Physiolib.Chemical.Interfaces.SubstancePort_b O2 annotation (Placement(
                transformation(extent={{-28,32},{-8,52}}), iconTransformation(
                  extent={{-90,70},{-70,90}})));
          Physiolib.Chemical.Interfaces.SubstancePort_a selectedForm annotation (
              Placement(transformation(extent={{26,-82},{46,-62}}),
                iconTransformation(extent={{30,-90},{50,-70}})));
          Physiolib.Chemical.Components.Substance HmAH[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=RT*log(Kh25) + DfG_selectedForm/N,
                DfH_25degC=-Hh + DfH_selectedForm/N),
            each amountOfSubstance_start=initialH*initialHb/(Kh37 + initialH))
            "Protonated h site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{10,12},{30,32}})));
          Physiolib.Chemical.Components.Reaction h[4](each nP=2, each KC=KC)
            annotation (Placement(transformation(extent={{36,32},{56,12}})));
          Physiolib.Chemical.Components.Substance HmA[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_selectedForm/N, DfH_25degC=
                  DfH_selectedForm/N),
            each amountOfSubstance_start=Kh37*initialHb/(Kh37 + initialH))
            "Deprotonated h site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{92,14},{72,34}})));
          Physiolib.Chemical.Components.Substance HmNH3[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=RT*log(Kz25) + DfG_selectedForm/N,
                DfH_25degC=-Hz + DfH_selectedForm/N),
            each amountOfSubstance_start=(initialH^2)*initialHb/(initialH^2 +
                initialH*Kz37 + Kz37*Kc37*initialCO2))
            "Protonated z site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{-84,-42},{-64,-22}})));
          Physiolib.Chemical.Components.Reaction z[4](each nP=2, each KC=KC)
            annotation (Placement(transformation(extent={{-54,-42},{-34,-22}})));
          Physiolib.Chemical.Components.Substance HmNH2[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_selectedForm/N, DfH_25degC=
                  DfH_selectedForm/N),
            each amountOfSubstance_start=initialH*Kz37*initialHb/(initialH^2 +
                initialH*Kz37 + Kz37*Kc37*initialCO2))
            "Deprotonated z site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{12,-44},{-8,-24}})));
          Physiolib.Chemical.Components.Reaction c[4](
            each nP=2,
            each KC=KC,
            each nS=2)
            annotation (Placement(transformation(extent={{20,-42},{40,-22}})));
          Physiolib.Chemical.Interfaces.SubstancePort_b CO2 annotation (Placement(
                transformation(extent={{-8,-26},{12,-6}}), iconTransformation(
                  extent={{10,70},{30,90}})));
          Physiolib.Chemical.Components.Substance HmNHCOO[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each amountOfSubstance_start=(Kz37*Kc37*initialCO2)*initialHb/(
                initialH^2 + initialH*Kz37 + Kz37*Kc37*initialCO2),
            each substanceData(DfG_25degC_1bar=DfG_CO2 - RT*log(Kc25) +
                  DfG_selectedForm/N, DfH_25degC=DfH_CO2 + Hc + DfH_selectedForm/
                  N))
            "Carboxylated c site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{70,-44},{50,-24}})));
          Chemical.Interfaces.SubstancePort_b H annotation (Placement(
                transformation(extent={{50,-12},{70,8}}), iconTransformation(
                  extent={{70,70},{90,90}})));
          Physiolib.Chemical.Components.Substance COHm[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each amountOfSubstance_start=(initialCO/Kco37)*initialHb/(1 +
                initialO2/Ko37 + initialCO/Kco37),
            each substanceData(DfH_25degC=DfH_CO - Hco + DfH_selectedForm/N,
                DfG_25degC_1bar=DfG_CO + RT*log(Kco25) + DfG_selectedForm/N))
            "Subunit with Carbon Monoxide"
            annotation (Placement(transformation(extent={{78,44},{58,64}})));
          Physiolib.Chemical.Components.Reaction o1[4](each nP=2, each KC=KC)
            annotation (Placement(transformation(extent={{46,44},{26,64}})));
          Physiolib.Chemical.Interfaces.SubstancePort_b CO annotation (Placement(
                transformation(extent={{-12,62},{8,82}}), iconTransformation(
                  extent={{-50,70},{-30,90}})));
        equation

          connect(OxyHm.port_a, o.substrates[1])
            annotation (Line(points={{-68,24},{-60,24}},          color={158,66,200}));
          connect(o.products[1], DeoxyHm.port_a)
            annotation (Line(points={{-40,22},{-28,22}}, color={158,66,200}));

          for i in 1:4 loop
            connect(h[i].products[2], H) annotation (Line(
                points={{56,20},{60,20},{60,-2}},
                color={158,66,200}));
            connect(speciation.subunitSolution, HmA[i].solution) annotation (Line(
              points={{-4,-56},{-4,-44},{94,-44},{94,12},{88,12},{88,14}},
              color={127,127,0}));
            connect(speciation.subunitSolution, HmAH[i].solution) annotation (Line(
              points={{-4,-56},{-4,-44},{94,-44},{94,12},{14,12}},
              color={127,127,0}));
            connect(HmA[i].port_a, speciation.subunits[i+4]) annotation (Line(
              points={{72,24},{72,-52},{-11,-52},{-11,-51.8}},
              color={158,66,200}));

            connect(o[i].products[2], O2) annotation (Line(points={{-40,26},{-16,26},{-16,
                    42},{-18,42}}, color={158,66,200}));
            connect(speciation.subunitSolution, DeoxyHm[i].solution) annotation (Line(
                  points={{-4,-56},{-4,-44},{94,-44},{94,12},{-12,12}},
                                                                  color={127,127,0}));
            connect(speciation.subunitSolution, OxyHm[i].solution) annotation (Line(
                  points={{-4,-56},{-4,-44},{94,-44},{94,12},{92,12},{-84,12},{-84,14}},
                                                                    color={127,127,
                    0}));
            connect(DeoxyHm[i].port_a, speciation.subunits[i]) annotation (Line(
              points={{-28,22},{-28,22},{-12,22},{-12,-22},{-11,-22},{-11,-51.8}},
              color={158,66,200}));

            connect(z[i].products[2], H) annotation (Line(
                points={{-34,-30},{-22,-30},{-22,-2},{60,-2}},
                color={158,66,200}));
            connect(speciation.subunitSolution, HmNH2[i].solution) annotation (Line(
              points={{-4,-56},{-4,-44},{8,-44}},
              color={127,127,0}));
            connect(HmNH2[i].port_a, speciation.subunits[i + 8]) annotation (Line(
              points={{-8,-34},{-11,-34},{-11,-51.8}},
              color={158,66,200}));
            connect(HmNH3[i].solution, speciation.subunitSolution) annotation (Line(
              points={{-80,-42},{-80,-44},{-4,-44},{-4,-56}},
              color={127,127,0}));

            connect(c[i].products[2], H) annotation (Line(
                points={{40,-30},{46,-30},{46,-2},{60,-2}},
                color={158,66,200}));
            connect(CO2, c[i].substrates[2]) annotation (Line(
                points={{2,-16},{16,-16},{16,-30},{20,-30}},
                color={158,66,200}));
            connect(HmNHCOO[i].solution, speciation.subunitSolution) annotation (Line(
              points={{66,-44},{-4,-44},{-4,-56}},
              color={127,127,0}));

            connect(COHm[i].solution, speciation.subunitSolution) annotation (Line(
              points={{74,44},{74,42},{94,42},{94,-44},{-4,-44},{-4,-56}},
              color={127,127,0},
              smooth=Smooth.None));
            connect(o1[i].products[2], CO) annotation (Line(
              points={{26,56},{14,56},{14,72},{-2,72}},
              color={158,66,200},
              smooth=Smooth.None));

          end for;

          connect(speciation.solution, solution) annotation (Line(
              points={{-14,-72},{-22,-72},{-22,-56},{-28,-56},{-28,-72},{-41,-72}},
              color={127,127,0}));
          connect(speciation.port_a, selectedForm) annotation (Line(
              points={{2,-72},{12,-72},{12,-56},{20,-56},{20,-72},{36,-72}},
              color={158,66,200}));
          connect(HmAH.port_a,h. substrates[1]) annotation (Line(
              points={{30,22},{36,22}},
              color={158,66,200}));
          connect(h.products[1],HmA. port_a) annotation (Line(
              points={{56,24},{64,24},{72,24}},
              color={158,66,200}));

          connect(z.products[1], HmNH2.port_a) annotation (Line(
              points={{-34,-34},{-8,-34}},
              color={107,45,134}));

          connect(HmNH3.port_a, z.substrates[1]) annotation (Line(
              points={{-64,-32},{-62,-32},{-60,-32},{-54,-32}},
              color={158,66,200}));

          connect(HmNH2.port_a, c.substrates[1]) annotation (Line(
              points={{-8,-34},{20,-34}},
              color={158,66,200}));

          connect(HmNHCOO.port_a, c.products[1]) annotation (Line(
              points={{50,-34},{40,-34}},
              color={158,66,200}));

          connect(solution, solution) annotation (Line(
              points={{-41,-72},{-41,-72}},
              color={127,127,0}));
          connect(H, H) annotation (Line(
              points={{60,-2},{60,-2}},
              color={158,66,200}));

          connect(COHm.port_a, o1.substrates[1]) annotation (Line(
              points={{58,54},{46,54}},
              color={158,66,200},
              smooth=Smooth.None));

          connect(DeoxyHm.port_a, o1.products[1]) annotation (Line(
              points={{-28,22},{-2,22},{-2,52},{26,52}},
              color={158,66,200},
              smooth=Smooth.None));
          annotation (          experiment(StopTime=15000),
            Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<p>M. Matej&aacute;k, T. Kulh&aacute;nek, and S. Matou&scaron;ek, &quot;Adair-based hemoglobin equilibrium with oxygen, carbon dioxide and hydrogen ion activity,&quot; Scandinavian Journal of Clinical &amp; Laboratory Investigation, pp. 1-8, 2017-2018.</p>
</html>"),  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                    100}}),
                    graphics),
            Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                    100,100}}), graphics));
        end HemoglobinQuaternaryFormCO;

        model HemoglobinMultipleAllosteryCO
          "Multiple-ligand allosteric hemoglobin model"
          extends Modelica.Icons.Example;

          constant Modelica.SIunits.AmountOfSubstance THb = 0.001
            "Total amount of hemoglobin";

          constant Real RT=Modelica.Constants.R*298.15;

          constant Modelica.SIunits.AmountOfSubstance AmountOfSolutionIn1L = 38.7
            "Amount of solution used for molarity to mole fraction conversion";

          constant Modelica.SIunits.Volume OneLiter = 0.001;

          parameter Real L_old=7.0529*10^6
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
          parameter Real c=0.00431555
            "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
          parameter Modelica.SIunits.Concentration KR=0.000671946
            "oxygen dissociation on relaxed(R) hemoglobin subunit";

          parameter Modelica.SIunits.Concentration KT=KR/c
            "oxygen dissociation on tensed(T) hemoglobin subunit";

          parameter Modelica.SIunits.MoleFraction KRo37 = KR*OneLiter/AmountOfSolutionIn1L;
          parameter Modelica.SIunits.MoleFraction KTo37 = KT*OneLiter/AmountOfSolutionIn1L;

          parameter Modelica.SIunits.ChemicalPotential DfG_O2 = -RT*log(0.0013/55.508);
          parameter Modelica.SIunits.ChemicalPotential DfG_CO2=-RT*log(0.034/
              55.508) + Physiolib.Media.Substance.CarbonDioxide_gas.DfG_25degC_1bar;

          parameter Modelica.SIunits.ChemicalPotential DfG_tT = 0;
          parameter Modelica.SIunits.ChemicalPotential DfG_tR = DfG_tT + RT * log(L);

          parameter Real KC = 1e-3 "Slow down factor";

          parameter Modelica.SIunits.MoleFraction initialO2=1.9594e-07
            "Initial O2 at 37degC, pO2=100Pa";             //at 25degC: 2.342e-8;
          parameter Modelica.SIunits.MoleFraction initialH=10^(-7.2);
          parameter Modelica.SIunits.MoleFraction initialCO2=2.4217e-10
            "Initial CO2 at 37degC, pCO2=40mmHg";          //at 25degC: 3.267e-5;
          parameter Modelica.SIunits.MoleFraction initialCO=1e-10
            "Initial CO at 37degC, pCO=0mmHg";          //at 25degC: 3.267e-5;

          parameter Modelica.SIunits.MoleFraction KRh37 = 10^(-6.89);
          parameter Modelica.SIunits.MoleFraction KTh37 = 10^(-7.52);

          parameter Modelica.SIunits.MoleFraction KRz37 = 10^(-7.25);
          parameter Modelica.SIunits.MoleFraction KTz37 = 10^(-7.73);

          parameter Modelica.SIunits.MoleFraction KRc37 = (10^(-8.35)) / (OneLiter/AmountOfSolutionIn1L);
          parameter Modelica.SIunits.MoleFraction KTc37 = (10^(-7.54)) / (OneLiter/AmountOfSolutionIn1L);

          parameter Real L=L_old
            *
            (((KTh37/((10^(-7.2))+KTh37)) / (KRh37/((10^(-7.2))+KRh37)))^4)
            *
            (((KTz37*((10^(-7.2))^2 + KRz37*(10^(-7.2)) + KRz37*KRc37*(2.4217e-5)))/(KRz37*((10^(-7.2))^2 + KTz37*(10^(-7.2)) + KTz37*KTc37*(2.4217e-5))))^4)
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";

          Physiolib.Chemical.Components.Solution solution(temperature_start=
                310.15)
            annotation (Placement(transformation(extent={{-100,-56},{100,32}})));

          Physiolib.Chemical.Components.Reaction quaternaryForm(KC=KC)
            annotation (Placement(transformation(extent={{-22,-52},{-2,-32}})));

          Physiolib.Chemical.Components.Substance O2_free(amountOfSubstance_start=
               initialO2*AmountOfSolutionIn1L, substanceData(DfG_25degC_1bar=
                  DfG_O2, DfH_25degC=-11700))
            annotation (Placement(transformation(extent={{-76,-12},{-56,8}})));
          Modelica.Blocks.Sources.Clock oxygenSource(offset=1000)
            annotation (Placement(transformation(extent={{-78,48},{-58,68}})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance oxygen_in_air(
            usePartialPressureInput=true,
            substanceData=Physiolib.Media.Substance.Oxygen_gas,
            Temperature=310.15) annotation (Placement(transformation(extent={{-10,
                    -10},{10,10}}, origin={-36,58})));
          Physiolib.Chemical.Components.GasSolubility partialPressure1(
              useWaterCorrection=false, KC=KC) annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={-14,32})));

          Physiolib.Chemical.Components.Substance H2O(substanceData=Physiolib.Media.Substance.Water_liquid,
              amountOfSubstance_start=AmountOfSolutionIn1L - THb - (initialO2 +
                initialCO2)*AmountOfSolutionIn1L)
            annotation (Placement(transformation(extent={{56,-54},{76,-34}})));
          HemoglobinQuaternaryFormCO                            relaxed(
            DfG_selectedForm=DfG_tR,
            initialO2=initialO2,
            initialHb=THb/(L + 1),
            initialH=initialH,
            Kh37=KRh37,
            Kz37=KRz37,
            Kc37=KRc37,
            initialCO2=initialCO2,
            DfG_O2=DfG_O2,
            DfG_CO2=DfG_CO2,
            KC=KC,
            Hc(displayUnit="kJ/mol") = -41000,
            Hz=8000,
            Hh=127000,
            initialCO=initialCO,
            Ko37=KRo37,
            Kco37=KRo37/3200)
            annotation (Placement(transformation(extent={{-54,-44},{-34,-24}})));
          HemoglobinQuaternaryFormCO                            tensed(
            DfG_selectedForm=DfG_tT,
            initialO2=initialO2,
            initialHb=THb*L/(L + 1),
            initialH=initialH,
            Kh37=KTh37,
            Kz37=KTz37,
            Kc37=KTc37,
            initialCO2=initialCO2,
            DfG_O2=DfG_O2,
            DfG_CO2=DfG_CO2,
            KC=KC,
            Hc(displayUnit="kJ/mol") = 59000,
            Hz=-51000,
            Hh=59000,
            initialCO=initialCO,
            Ko37=KTo37,
            Kco37=KTo37/3200)
                      annotation (Placement(transformation(extent={{32,-44},{12,-24}})));
          Physiolib.Chemical.Sources.ExternalMoleFraction H(
            substanceData=Physiolib.Media.Substance.Proton_aqueous,
            MoleFraction=initialH,
            Temperature=310.15) annotation (Placement(transformation(extent={{10,
                    -10},{-10,10}}, origin={-12,-18})));
          Physiolib.Chemical.Components.Substance CO2_free(
              amountOfSubstance_start=initialCO2*AmountOfSolutionIn1L,
              substanceData(DfG_25degC_1bar=DfG_CO2, DfH_25degC=-412900))
            annotation (Placement(transformation(extent={{86,-8},{66,12}})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance CO2_gas(
            substanceData=Physiolib.Media.Substance.CarbonDioxide_gas,
            PartialPressure(displayUnit="kPa") = 5330,
            Temperature=310.15) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={62,60})));
          Physiolib.Chemical.Components.GasSolubility partialPressure2(
              useWaterCorrection=false, KC=KC) annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={62,32})));

          Real sCO "Hemoglobin carbon monoxide saturation";
          Real sO2 "Hemoglobin oxygen saturation";
          Real sCO2 "Hemoglobin carbon dioxide saturation";
          Real dH "Hemoglobin charge change caused by binding of Bohr's protons";
          Physiolib.Chemical.Components.Substance CO_free(substanceData=Physiolib.Media.Substance.CarbonMonoxide_aqueous,
              amountOfSubstance_start=initialCO*AmountOfSolutionIn1L)
            annotation (Placement(transformation(extent={{-92,8},{-72,28}})));
          Physiolib.Chemical.Components.GasSolubility partialPressure3(
              useWaterCorrection=false, KC=KC) annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={26,32})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance CO_gas(
            substanceData=Physiolib.Media.Substance.CarbonMonoxide_gas,
            PartialPressure(displayUnit="Pa") = 1e-3,
            Temperature=310.15) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={26,60})));
        equation
          sCO = (sum(relaxed.COHm.x) + sum(tensed.COHm.x)) /
          (sum(relaxed.DeoxyHm.x) + sum(tensed.DeoxyHm.x) + sum(relaxed.OxyHm.x) + sum(tensed.OxyHm.x)+ sum(relaxed.COHm.x) + sum(tensed.COHm.x));

          sO2 = (sum(relaxed.OxyHm.x) + sum(tensed.OxyHm.x)) /
          (sum(relaxed.DeoxyHm.x) + sum(tensed.DeoxyHm.x) + sum(relaxed.OxyHm.x) + sum(tensed.OxyHm.x)+ sum(relaxed.COHm.x) + sum(tensed.COHm.x));

          sCO2 = (sum(relaxed.HmNHCOO.x) + sum(tensed.HmNHCOO.x)) /
          (sum(relaxed.HmNH3.x) + sum(tensed.HmNH3.x) + sum(relaxed.HmNH2.x) + sum(tensed.HmNH2.x) + sum(relaxed.HmNHCOO.x) + sum(tensed.HmNHCOO.x));

          dH = (sum(relaxed.HmNH3.x) + sum(tensed.HmNH3.x) - sum(relaxed.HmNHCOO.x) - sum(tensed.HmNHCOO.x) - sum(relaxed.HmA.x) - sum(tensed.HmA.x)) /
          THb;

          connect(oxygenSource.y, oxygen_in_air.partialPressure)
            annotation (Line(points={{-57,58},{-46,58}}, color={0,0,127}));

          connect(oxygen_in_air.port_a, partialPressure1.gas_port) annotation (Line(
              points={{-26,58},{-26,58},{-14,58},{-14,42}},
              color={158,66,200}));
          connect(partialPressure1.liquid_port, O2_free.port_a) annotation (Line(
                points={{-14,22},{-14,-2},{-56,-2}}, color={158,66,200}));

          connect(O2_free.solution, solution.solution) annotation (Line(points={{-72,-12},
                  {-72,-54},{60,-54},{60,-55.12}},        color={127,127,0}));
          connect(solution.solution, H2O.solution) annotation (Line(
              points={{60,-55.12},{60,-54}},
              color={127,127,0}));

          connect(relaxed.solution, solution.solution) annotation (Line(
              points={{-48,-42},{-48,-54},{60,-54},{60,-55.12}},
              color={127,127,0}));
          connect(relaxed.O2, O2_free.port_a) annotation (Line(
              points={{-52,-26},{-52,-2},{-56,-2}},
              color={158,66,200}));
          connect(relaxed.selectedForm, quaternaryForm.substrates[1]) annotation (Line(
              points={{-40,-42},{-22,-42}},
              color={158,66,200}));
          connect(tensed.solution, solution.solution) annotation (Line(
              points={{26,-42},{26,-54},{60,-54},{60,-55.12}},
              color={127,127,0}));
          connect(tensed.O2, O2_free.port_a) annotation (Line(
              points={{30,-26},{30,-2},{-56,-2}},
              color={158,66,200}));
          connect(tensed.selectedForm, quaternaryForm.products[1]) annotation (Line(
              points={{18,-42},{-2,-42}},
              color={158,66,200}));
          connect(H.port_a, relaxed.H) annotation (Line(
              points={{-22,-18},{-36,-18},{-36,-26}},
              color={158,66,200}));
          connect(H.port_a, tensed.H) annotation (Line(
              points={{-22,-18},{14,-18},{14,-26}},
              color={158,66,200}));
          connect(CO2_gas.port_a, partialPressure2.gas_port) annotation (Line(
              points={{62,50},{62,42}},
              color={158,66,200}));
          connect(partialPressure2.liquid_port, CO2_free.port_a)
            annotation (Line(points={{62,22},{62,2},{66,2}}, color={158,66,200}));
          connect(CO2_free.port_a, tensed.CO2) annotation (Line(
              points={{66,2},{20,2},{20,-26}},
              color={158,66,200}));
          connect(CO2_free.port_a, relaxed.CO2) annotation (Line(
              points={{66,2},{-42,2},{-42,-26}},
              color={158,66,200}));
          connect(CO2_free.solution, solution.solution) annotation (Line(
              points={{82,-8},{82,-8},{82,-54},{60,-54},{60,-55.12}},
              color={127,127,0}));
          connect(CO_free.solution, solution.solution) annotation (Line(
              points={{-88,8},{-88,-14},{-72,-14},{-72,-54},{60,-54},{60,-55.12}},
              color={127,127,0},
              smooth=Smooth.None));
          connect(CO_gas.port_a, partialPressure3.gas_port) annotation (Line(
              points={{26,50},{26,42}},
              color={158,66,200},
              smooth=Smooth.None));
          connect(partialPressure3.liquid_port, CO_free.port_a) annotation (Line(
              points={{26,22},{26,18},{-72,18}},
              color={158,66,200},
              smooth=Smooth.None));
          connect(CO_free.port_a, relaxed.CO) annotation (Line(
              points={{-72,18},{-48,18},{-48,-26}},
              color={158,66,200},
              smooth=Smooth.None));
          connect(CO_free.port_a, tensed.CO) annotation (Line(
              points={{-72,18},{26,18},{26,-26}},
              color={158,66,200},
              smooth=Smooth.None));
          annotation (          experiment(StopTime=15000),
            Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<p>Oxygen dissociation curve of hemoglobin.</p>
<p>M. Matej&aacute;k, T. Kulh&aacute;nek, and S. Matou&scaron;ek, &quot;Adair-based hemoglobin equilibrium with oxygen, carbon dioxide and hydrogen ion activity,&quot; Scandinavian Journal of Clinical &amp; Laboratory Investigation, pp. 1-8, 2017-2018.</p>
<p><img src=\"modelica://Physiolib/Resources/Images/Examples/ODC_pH_CO2_Hb.png\"/></p>
<p>J. W. Severinghaus, &quot;Simple, accurate equations for human blood O2 dissociation computations,&quot; Journal of Applied Physiology, vol. 46, pp. 599-602, 1979.</p>
<p><br>pO2 .. partial pressure of oxygen in gas</p>
<p>pCO2 .. partial pressure of carbon dioxide</p>
<p>sO2 .. oxygen saturation of hemoglobin</p>
<p>pH = log10(aH), where aH is mole fraction based activity of hydrogen ions</p>
<p><img src=\"modelica://Physiolib/Resources/Images/Examples/ODC_T_Hb.png\"/></p>
<p>R. B. Reeves, &quot;The effect of temperature on the oxygen equilibrium curve of human blood,&quot; Respiration physiology, vol. 42, pp. 317-328, 1980.</p>
<p><br>T .. temperature</p>
</html>"),  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                    100}}), graphics));
        end HemoglobinMultipleAllosteryCO;

        model HemoglobinQuaternaryForm_
          "Hemoglobib quaternary form - part of multiple-ligand allosteric hemoglobin model"

          constant Integer N=12
            "Number of distinguished independent sides in quaternary structure";
          constant Real RT=Modelica.Constants.R*298.15;
        /*
  parameter Modelica.SIunits.MolarEnthalpy Ho = 59000 
    "Enthalpy of deoxygenation";
  parameter Modelica.SIunits.MoleFraction Ko37 "KRx and KTx at 37degC";
  parameter Modelica.SIunits.MoleFraction Ko25 = Ko37*exp((Ho/Modelica.Constants.R)*(1/310.15 - 1/298.15)) 
    "KRx and KTx at 25degC";
*/
          parameter Modelica.SIunits.MolarEnthalpy Hco = 59000
            "Enthalpy of carbon monoxide dissociation";
          parameter Modelica.SIunits.MoleFraction Kco37
            "Carboxyhemoglobin dissociation at 37degC";
          parameter Modelica.SIunits.MoleFraction Kco25 = Kco37*exp((Hco/Modelica.Constants.R)*(1/310.15 - 1/298.15))
            "Carboxyhemoglobin dissociation at 25degC";

          parameter Modelica.SIunits.MolarEnthalpy Hh
            "Enthalpy of deprotonation of h site";
          parameter Modelica.SIunits.MoleFraction Kh37 "KRhx and KThx at 37 degC";
          parameter Modelica.SIunits.MoleFraction Kh25 = Kh37*exp(((Hh)/Modelica.Constants.R)*(1/310.15 - 1/298.15))
            "KRhx and KThx at 25 degC";

          parameter Modelica.SIunits.MolarEnthalpy Hz
            "Enthalpy of deprotonation of -NH3+ terminus";
          parameter Modelica.SIunits.MoleFraction Kz37 "KRzx and KTzx at 37 degC";
          parameter Modelica.SIunits.MoleFraction Kz25 = Kz37*exp(((Hz)/Modelica.Constants.R)*(1/310.15 - 1/298.15))
            "KRzx and KTzx at 25 degC";

          parameter Modelica.SIunits.MolarEnthalpy Hc "Enthalpy of carboxylation";
          parameter Modelica.SIunits.MoleFraction Kc37 "KRcx and KTcx at 37degC";
          parameter Modelica.SIunits.MoleFraction Kc25 = Kc37*exp((Hc/Modelica.Constants.R)*(1/310.15 - 1/298.15))
            "KRcx and KTcx at 25degC";

        //  parameter Modelica.SIunits.ChemicalPotential DfG_O2 = -RT*log(0.0013/55.508)  + Physiolib.Examples.Substances.Oxygen_gas.DfG_25degC_1bar;
        //  parameter Modelica.SIunits.ChemicalPotential DfH_O2 = Physiolib.Examples.Substances.Oxygen_aqueous.DfH_25degC;

          parameter Modelica.SIunits.ChemicalPotential DfG_CO=-RT*log(0.00099/
              55.508) + Physiolib.Media.Substance.CarbonMonoxide_gas.DfG_25degC_1bar;                                                                       //==Physiolib.Examples.Substances.CarbonMonoxide_aqueous.DfG_25degC_1bar
          parameter Modelica.SIunits.ChemicalPotential DfH_CO=Physiolib.Media.Substance.CarbonMonoxide_aqueous.DfH_25degC;

          parameter Modelica.SIunits.ChemicalPotential DfG_CO2=-RT*log(0.034/
              55.508) + Physiolib.Media.Substance.CarbonDioxide_gas.DfG_25degC_1bar;
          parameter Modelica.SIunits.ChemicalPotential DfH_CO2=Physiolib.Media.Substance.CarbonDioxide_aqueous.DfH_25degC;

          parameter Modelica.SIunits.ChemicalPotential DfG_selectedForm
            "DfG_tR and DfG_tT";
          parameter Modelica.SIunits.MolarEnthalpy DfH_selectedForm = 0
            "DfH_tR and DfH_tT";

          parameter Real KC = 1e-3 "Slow down factor";
                                   //0.000001
        //  parameter Modelica.SIunits.MoleFraction initialO2
        //    "Initial mole fraction of unbound oxygen disoluted around hemoglobin";
          parameter Modelica.SIunits.MoleFraction initialCO
            "Initial mole fraction of unbound oxygen disoluted around hemoglobin";
          parameter Modelica.SIunits.MoleFraction initialH
            "Initial mole fraction of H+";
          parameter Modelica.SIunits.MoleFraction initialCO2
            "Initial mole fraction of unbound carbon dioxide disoluted around hemoglobin";
          parameter Modelica.SIunits.AmountOfSubstance initialHb
            "Initial amount of hemoglobin tetramers in this quaternary form";

          Physiolib.Chemical.Components.Speciation speciation(NumberOfSubunits=N)
            annotation (Placement(transformation(extent={{-18,-72},{2,-52}})));
           // AmountOfSubstance_start=4e-11)
           // AmountOfSubstance_start=totalAmountOfHemoglobin)
          Physiolib.Chemical.Components.Substance COHm[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfH_25degC=DfH_CO - Hco + DfH_selectedForm/N,
                DfG_25degC_1bar=DfG_CO + RT*log(Kco25) + DfG_selectedForm/N),
            each amountOfSubstance_start=initialCO*initialHb/(Kco37 + initialCO))
            "Carboxysubunit"
            annotation (Placement(transformation(extent={{-88,14},{-68,34}})));

          Physiolib.Chemical.Components.Reaction o[4](each nP=2, each KC=KC)
            annotation (Placement(transformation(extent={{-60,14},{-40,34}})));
          Physiolib.Chemical.Components.Substance DeoxyHm[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_selectedForm/N, DfH_25degC=
                  DfH_selectedForm/N),
            each amountOfSubstance_start=Kco37*initialHb/(Kco37 + initialCO))
            "Deoxygenated subunit"
            annotation (Placement(transformation(extent={{-8,12},{-28,32}})));

          Physiolib.Chemical.Interfaces.SolutionPort solution annotation (
              Placement(transformation(extent={{-50,-82},{-32,-62}}),
                iconTransformation(extent={{-50,-90},{-30,-70}})));
          Physiolib.Chemical.Interfaces.SubstancePort_b CO annotation (Placement(
                transformation(extent={{-28,32},{-8,52}}), iconTransformation(
                  extent={{-90,70},{-70,90}})));
          Physiolib.Chemical.Interfaces.SubstancePort_a selectedForm annotation (
              Placement(transformation(extent={{26,-82},{46,-62}}),
                iconTransformation(extent={{30,-90},{50,-70}})));
          Physiolib.Chemical.Components.Substance HmAH[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=RT*log(Kh25) + DfG_selectedForm/N,
                DfH_25degC=-Hh + DfH_selectedForm/N),
            each amountOfSubstance_start=initialH*initialHb/(Kh37 + initialH))
            "Protonated h site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{10,12},{30,32}})));
          Physiolib.Chemical.Components.Reaction h[4](each nP=2, each KC=KC)
            annotation (Placement(transformation(extent={{36,32},{56,12}})));
          Physiolib.Chemical.Components.Substance HmA[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_selectedForm/N, DfH_25degC=
                  DfH_selectedForm/N),
            each amountOfSubstance_start=Kh37*initialHb/(Kh37 + initialH))
            "Deprotonated h site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{92,14},{72,34}})));
          Physiolib.Chemical.Components.Substance HmNH3[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=RT*log(Kz25) + DfG_selectedForm/N,
                DfH_25degC=-Hz + DfH_selectedForm/N),
            each amountOfSubstance_start=(initialH^2)*initialHb/(initialH^2 +
                initialH*Kz37 + Kz37*Kc37*initialCO2))
            "Protonated z site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{-84,-42},{-64,-22}})));
          Physiolib.Chemical.Components.Reaction z[4](each nP=2, each KC=KC)
            annotation (Placement(transformation(extent={{-54,-42},{-34,-22}})));
          Physiolib.Chemical.Components.Substance HmNH2[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each substanceData(DfG_25degC_1bar=DfG_selectedForm/N, DfH_25degC=
                  DfH_selectedForm/N),
            each amountOfSubstance_start=initialH*Kz37*initialHb/(initialH^2 +
                initialH*Kz37 + Kz37*Kc37*initialCO2))
            "Deprotonated z site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{12,-44},{-8,-24}})));
          Physiolib.Chemical.Components.Reaction c[4](
            each nP=2,
            each KC=KC,
            each nS=2)
            annotation (Placement(transformation(extent={{20,-42},{40,-22}})));
          Physiolib.Chemical.Interfaces.SubstancePort_b CO2 annotation (Placement(
                transformation(extent={{-8,-26},{12,-6}}), iconTransformation(
                  extent={{10,70},{30,90}})));
          Physiolib.Chemical.Components.Substance HmNHCOO[4](
            redeclare package stateOfMatter =
                Physiolib.Chemical.Interfaces.Incompressible,
            each amountOfSubstance_start=(Kz37*Kc37*initialCO2)*initialHb/(
                initialH^2 + initialH*Kz37 + Kz37*Kc37*initialCO2),
            each substanceData(DfG_25degC_1bar=DfG_CO2 - RT*log(Kc25) +
                  DfG_selectedForm/N, DfH_25degC=DfH_CO2 + Hc + DfH_selectedForm/
                  N))
            "Carboxylated c site of subunit in quaternary structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{70,-44},{50,-24}})));
          Chemical.Interfaces.SubstancePort_b H annotation (Placement(
                transformation(extent={{50,-12},{70,8}}), iconTransformation(
                  extent={{70,70},{90,90}})));
        equation

          connect(COHm.port_a, o.substrates[1])
            annotation (Line(points={{-68,24},{-60,24}}, color={158,66,200}));
          connect(o.products[1], DeoxyHm.port_a)
            annotation (Line(points={{-40,22},{-28,22},{-28,22}},
                                                         color={158,66,200}));

          for i in 1:4 loop
            connect(h[i].products[2], H) annotation (Line(
                points={{56,20},{60,20},{60,-2}},
                color={158,66,200}));
            connect(speciation.subunitSolution, HmA[i].solution) annotation (Line(
              points={{-4,-56},{-4,-44},{94,-44},{94,12},{88,12},{88,14}},
              color={127,127,0}));
            connect(speciation.subunitSolution, HmAH[i].solution) annotation (Line(
              points={{-4,-56},{-4,-44},{94,-44},{94,12},{14,12}},
              color={127,127,0}));
            connect(HmA[i].port_a, speciation.subunits[i+4]) annotation (Line(
              points={{72,24},{72,-52},{-11,-52},{-11,-51.8}},
              color={158,66,200}));

            connect(o[i].products[2],CO)  annotation (Line(points={{-40,26},{-32,26},{-32,
                    42},{-18,42}}, color={158,66,200}));
            connect(speciation.subunitSolution, DeoxyHm[i].solution) annotation (Line(
                  points={{-4,-56},{-4,-44},{94,-44},{94,12},{-12,12}},
                                                                  color={127,127,0}));
            connect(speciation.subunitSolution, COHm[i].solution) annotation (Line(
                  points={{-4,-56},{-4,-44},{94,-44},{94,12},{92,12},{-84,12},{-84,14}},
                  color={127,127,0}));
            connect(DeoxyHm[i].port_a, speciation.subunits[i]) annotation (Line(
              points={{-28,22},{-28,22},{-12,22},{-12,-22},{-11,-22},{-11,-51.8}},
              color={158,66,200}));

            connect(z[i].products[2], H) annotation (Line(
                points={{-34,-30},{-22,-30},{-22,-2},{60,-2}},
                color={158,66,200}));
            connect(speciation.subunitSolution, HmNH2[i].solution) annotation (Line(
              points={{-4,-56},{-4,-44},{8,-44}},
              color={127,127,0}));
            connect(HmNH2[i].port_a, speciation.subunits[i + 8]) annotation (Line(
              points={{-8,-34},{-11,-34},{-11,-51.8}},
              color={158,66,200}));
            connect(HmNH3[i].solution, speciation.subunitSolution) annotation (Line(
              points={{-80,-42},{-80,-44},{-4,-44},{-4,-56}},
              color={127,127,0}));

            connect(c[i].products[2], H) annotation (Line(
                points={{40,-30},{46,-30},{46,-2},{60,-2}},
                color={158,66,200}));
            connect(CO2, c[i].substrates[2]) annotation (Line(
                points={{2,-16},{16,-16},{16,-30},{20,-30}},
                color={158,66,200}));
            connect(HmNHCOO[i].solution, speciation.subunitSolution) annotation (Line(
              points={{66,-44},{-4,-44},{-4,-56}},
              color={127,127,0}));

          end for;

          connect(speciation.solution, solution) annotation (Line(
              points={{-14,-72},{-22,-72},{-22,-56},{-28,-56},{-28,-72},{-41,-72}},
              color={127,127,0}));
          connect(speciation.port_a, selectedForm) annotation (Line(
              points={{2,-72},{12,-72},{12,-56},{20,-56},{20,-72},{36,-72}},
              color={158,66,200}));
          connect(HmAH.port_a,h. substrates[1]) annotation (Line(
              points={{30,22},{36,22}},
              color={158,66,200}));
          connect(h.products[1],HmA. port_a) annotation (Line(
              points={{56,24},{64,24},{72,24}},
              color={158,66,200}));

          connect(z.products[1], HmNH2.port_a) annotation (Line(
              points={{-34,-34},{-8,-34}},
              color={107,45,134}));

          connect(HmNH3.port_a, z.substrates[1]) annotation (Line(
              points={{-64,-32},{-62,-32},{-60,-32},{-54,-32}},
              color={158,66,200}));

          connect(HmNH2.port_a, c.substrates[1]) annotation (Line(
              points={{-8,-34},{20,-34}},
              color={158,66,200}));

          connect(HmNHCOO.port_a, c.products[1]) annotation (Line(
              points={{50,-34},{40,-34}},
              color={158,66,200}));

          connect(solution, solution) annotation (Line(
              points={{-41,-72},{-41,-72}},
              color={127,127,0}));
          connect(H, H) annotation (Line(
              points={{60,-2},{60,-2}},
              color={158,66,200}));

          annotation (          experiment(StopTime=15000),
            Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<p>M. Matej&aacute;k, T. Kulh&aacute;nek, and S. Matou&scaron;ek, &quot;Adair-based hemoglobin equilibrium with oxygen, carbon dioxide and hydrogen ion activity,&quot; Scandinavian Journal of Clinical &amp; Laboratory Investigation, pp. 1-8, 2017-2018.</p>
</html>"),  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                    100}}),
                    graphics),
            Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                    100,100}}), graphics));
        end HemoglobinQuaternaryForm_;

        model HemoglobinMultipleAllostery_
          "Multiple-ligand allosteric hemoglobin model"
          extends Modelica.Icons.Example;

          constant Modelica.SIunits.AmountOfSubstance THb = 0.001
            "Total amount of hemoglobin";

          constant Real RT=Modelica.Constants.R*298.15;

          constant Modelica.SIunits.AmountOfSubstance AmountOfSolutionIn1L = 38.7
            "Amount of solution used for molarity to mole fraction conversion";

          constant Modelica.SIunits.Volume OneLiter = 0.001;

          parameter Real KRco37=KRo37/3200;
          parameter Real KTco37=KTo37/3200;

          parameter Real pH=7.4;
          parameter Modelica.SIunits.Pressure pCO2=5330;

          parameter Real L_old=7.0529*10^6
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
          parameter Real c=0.00431555
            "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
          parameter Modelica.SIunits.Concentration KR=0.000671946
            "oxygen dissociation on relaxed(R) hemoglobin subunit";

          parameter Modelica.SIunits.Concentration KT=KR/c
            "oxygen dissociation on tensed(T) hemoglobin subunit";

          parameter Modelica.SIunits.MoleFraction KRo37 = KR*OneLiter/AmountOfSolutionIn1L;
          parameter Modelica.SIunits.MoleFraction KTo37 = KT*OneLiter/AmountOfSolutionIn1L;

        //  parameter Modelica.SIunits.ChemicalPotential DfG_O2 = -RT*log(0.0013/55.508);
          parameter Modelica.SIunits.ChemicalPotential DfG_CO2=-RT*log(0.034/
              55.508) + Physiolib.Media.Substance.CarbonDioxide_gas.DfG_25degC_1bar;

          parameter Modelica.SIunits.ChemicalPotential DfG_tT = 0;
          parameter Modelica.SIunits.ChemicalPotential DfG_tR = DfG_tT + RT * log(L);

          parameter Real KC = 1e-3 "Slow down factor";

          parameter Modelica.SIunits.MoleFraction initialO2=1.9594e-07
            "Initial O2 at 37degC, pO2=100Pa";             //at 25degC: 2.342e-8;
          parameter Modelica.SIunits.MoleFraction initialH=10^(-pH);
          parameter Modelica.SIunits.MoleFraction initialCO2=2.4217e-10
            "Initial CO2 at 37degC, pCO2=40mmHg";          //at 25degC: 3.267e-5;
          parameter Modelica.SIunits.MoleFraction initialCO=1e-10
            "Initial CO at 37degC, pCO=0mmHg";          //at 25degC: 3.267e-5;

          parameter Modelica.SIunits.MoleFraction KRh37 = 10^(-6.89);
          parameter Modelica.SIunits.MoleFraction KTh37 = 10^(-7.52);

          parameter Modelica.SIunits.MoleFraction KRz37 = 10^(-7.25);
          parameter Modelica.SIunits.MoleFraction KTz37 = 10^(-7.73);

          parameter Modelica.SIunits.MoleFraction KRc37 = (10^(-8.35)) / (OneLiter/AmountOfSolutionIn1L);
          parameter Modelica.SIunits.MoleFraction KTc37 = (10^(-7.54)) / (OneLiter/AmountOfSolutionIn1L);

          parameter Real L=L_old
            *
            (((KTh37/((10^(-7.2))+KTh37)) / (KRh37/((10^(-7.2))+KRh37)))^4)
            *
            (((KTz37*((10^(-7.2))^2 + KRz37*(10^(-7.2)) + KRz37*KRc37*(2.4217e-5)))/(KRz37*((10^(-7.2))^2 + KTz37*(10^(-7.2)) + KTz37*KTc37*(2.4217e-5))))^4)
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";

          Physiolib.Chemical.Components.Solution solution(temperature_start=
                310.15)
            annotation (Placement(transformation(extent={{-100,-56},{100,32}})));

          Physiolib.Chemical.Components.Reaction quaternaryForm(KC=KC)
            annotation (Placement(transformation(extent={{-22,-52},{-2,-32}})));

          Physiolib.Chemical.Components.Substance CO_free(amountOfSubstance_start=
               initialCO*AmountOfSolutionIn1L, substanceData=Physiolib.Media.Substance.CarbonMonoxide_aqueous)
            annotation (Placement(transformation(extent={{-76,-12},{-56,8}})));
          Modelica.Blocks.Sources.Clock oxygenSource(offset=1)
            annotation (Placement(transformation(extent={{-78,48},{-58,68}})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance CO_in_air(
            usePartialPressureInput=true,
            substanceData=Physiolib.Media.Substance.CarbonMonoxide_gas,
            Temperature=310.15) annotation (Placement(transformation(extent={{-10,
                    -10},{10,10}}, origin={-36,58})));
          Physiolib.Chemical.Components.GasSolubility partialPressure1(
              useWaterCorrection=false, KC=KC) annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={-14,32})));

          Physiolib.Chemical.Components.Substance H2O(substanceData=Physiolib.Media.Substance.Water_liquid,
              amountOfSubstance_start=AmountOfSolutionIn1L - THb - (initialO2 +
                initialCO2)*AmountOfSolutionIn1L)
            annotation (Placement(transformation(extent={{56,-54},{76,-34}})));
          HemoglobinQuaternaryForm_                             relaxed(
            DfG_selectedForm=DfG_tR,
            initialHb=THb/(L + 1),
            initialH=initialH,
            Kh37=KRh37,
            Kz37=KRz37,
            Kc37=KRc37,
            initialCO2=initialCO2,
            DfG_CO2=DfG_CO2,
            KC=KC,
            Hc(displayUnit="kJ/mol") = -41000,
            Hz=8000,
            Hh=127000,
            initialCO=initialCO,
            Kco37=KRco37)
            annotation (Placement(transformation(extent={{-54,-44},{-34,-24}})));
          HemoglobinQuaternaryForm_                             tensed(
            DfG_selectedForm=DfG_tT,
            initialHb=THb*L/(L + 1),
            initialH=initialH,
            Kh37=KTh37,
            Kz37=KTz37,
            Kc37=KTc37,
            initialCO2=initialCO2,
            DfG_CO2=DfG_CO2,
            KC=KC,
            Hc(displayUnit="kJ/mol") = 59000,
            Hz=-51000,
            Hh=59000,
            initialCO=initialCO,
            Kco37=KTco37)
                      annotation (Placement(transformation(extent={{32,-44},{12,-24}})));
          Physiolib.Chemical.Sources.ExternalMoleFraction H(
            substanceData=Physiolib.Media.Substance.Proton_aqueous,
            MoleFraction=initialH,
            Temperature=310.15) annotation (Placement(transformation(extent={{10,
                    -10},{-10,10}}, origin={-12,-18})));
          Physiolib.Chemical.Components.Substance CO2_free(
              amountOfSubstance_start=initialCO2*AmountOfSolutionIn1L,
              substanceData(DfG_25degC_1bar=DfG_CO2, DfH_25degC=-412900))
            annotation (Placement(transformation(extent={{86,-8},{66,12}})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance CO2_gas(
            substanceData=Physiolib.Media.Substance.CarbonDioxide_gas,
            PartialPressure(displayUnit="kPa") = pCO2,
            Temperature=310.15) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={62,60})));
          Physiolib.Chemical.Components.GasSolubility partialPressure2(
              useWaterCorrection=false, KC=KC) annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={62,32})));

        //  Real sO2 "Hemoglobin oxygen saturation";
          Real sCO "Hemoglobin carbon monoxide saturation";
          Real sCO2 "Hemoglobin carbon dioxide saturation";
          Real dH "Hemoglobin charge change caused by binding of Bohr's protons";
        equation
        //  sO2 = (sum(relaxed.OxyHm.x) + sum(tensed.OxyHm.x)) /
        //  (sum(relaxed.DeoxyHm.x) + sum(tensed.DeoxyHm.x) + sum(relaxed.OxyHm.x) + sum(tensed.OxyHm.x));

          sCO = (sum(relaxed.COHm.x) + sum(tensed.COHm.x)) /
          (sum(relaxed.DeoxyHm.x) + sum(tensed.DeoxyHm.x) + sum(relaxed.COHm.x) + sum(tensed.COHm.x));
        //+ sum(relaxed.OxyHm.x) + sum(tensed.OxyHm.x));

          sCO2 = (sum(relaxed.HmNHCOO.x) + sum(tensed.HmNHCOO.x)) /
          (sum(relaxed.HmNH3.x) + sum(tensed.HmNH3.x) + sum(relaxed.HmNH2.x) + sum(tensed.HmNH2.x) + sum(relaxed.HmNHCOO.x) + sum(tensed.HmNHCOO.x));

          dH = (sum(relaxed.HmNH3.x) + sum(tensed.HmNH3.x) - sum(relaxed.HmNHCOO.x) - sum(tensed.HmNHCOO.x) - sum(relaxed.HmA.x) - sum(tensed.HmA.x)) /
          THb;

          connect(oxygenSource.y, CO_in_air.partialPressure)
            annotation (Line(points={{-57,58},{-46,58}}, color={0,0,127}));

          connect(CO_in_air.port_a, partialPressure1.gas_port) annotation (Line(points={
                  {-26,58},{-26,58},{-14,58},{-14,42}}, color={158,66,200}));
          connect(partialPressure1.liquid_port,CO_free. port_a) annotation (Line(
                points={{-14,22},{-14,-2},{-56,-2}}, color={158,66,200}));

          connect(CO_free.solution, solution.solution) annotation (Line(points={{-72,-12},
                  {-72,-54},{60,-54},{60,-55.12}},        color={127,127,0}));
          connect(solution.solution, H2O.solution) annotation (Line(
              points={{60,-55.12},{60,-54}},
              color={127,127,0}));

          connect(relaxed.solution, solution.solution) annotation (Line(
              points={{-48,-42},{-48,-54},{60,-54},{60,-55.12}},
              color={127,127,0}));
          connect(relaxed.selectedForm, quaternaryForm.substrates[1]) annotation (Line(
              points={{-40,-42},{-22,-42}},
              color={158,66,200}));
          connect(tensed.solution, solution.solution) annotation (Line(
              points={{26,-42},{26,-54},{60,-54},{60,-55.12}},
              color={127,127,0}));
          connect(tensed.selectedForm, quaternaryForm.products[1]) annotation (Line(
              points={{18,-42},{-2,-42}},
              color={158,66,200}));
          connect(H.port_a, relaxed.H) annotation (Line(
              points={{-22,-18},{-36,-18},{-36,-26}},
              color={158,66,200}));
          connect(H.port_a, tensed.H) annotation (Line(
              points={{-22,-18},{14,-18},{14,-26}},
              color={158,66,200}));
          connect(CO2_gas.port_a, partialPressure2.gas_port) annotation (Line(
              points={{62,50},{62,42}},
              color={158,66,200}));
          connect(partialPressure2.liquid_port, CO2_free.port_a)
            annotation (Line(points={{62,22},{62,2},{66,2}}, color={158,66,200}));
          connect(CO2_free.port_a, tensed.CO2) annotation (Line(
              points={{66,2},{20,2},{20,-26}},
              color={158,66,200}));
          connect(CO2_free.port_a, relaxed.CO2) annotation (Line(
              points={{66,2},{-42,2},{-42,-26}},
              color={158,66,200}));
          connect(CO2_free.solution, solution.solution) annotation (Line(
              points={{82,-8},{82,-8},{82,-54},{60,-54},{60,-55.12}},
              color={127,127,0}));
          connect(CO_free.port_a, relaxed.CO) annotation (Line(
              points={{-56,-2},{-52,-2},{-52,-26}},
              color={158,66,200},
              smooth=Smooth.None));
          connect(CO_free.port_a, tensed.CO) annotation (Line(
              points={{-56,-2},{30,-2},{30,-26}},
              color={158,66,200},
              smooth=Smooth.None));
          annotation (          experiment(StopTime=50),
            Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<p>Oxygen dissociation curve of hemoglobin.</p>
<p>M. Matej&aacute;k, T. Kulh&aacute;nek, and S. Matou&scaron;ek, &quot;Adair-based hemoglobin equilibrium with oxygen, carbon dioxide and hydrogen ion activity,&quot; Scandinavian Journal of Clinical &amp; Laboratory Investigation, pp. 1-8, 2017-2018.</p>
<p><img src=\"modelica://Physiolib/Resources/Images/Examples/ODC_pH_CO2_Hb.png\"/></p>
<p>J. W. Severinghaus, &quot;Simple, accurate equations for human blood O2 dissociation computations,&quot; Journal of Applied Physiology, vol. 46, pp. 599-602, 1979.</p>
<p><br>pO2 .. partial pressure of oxygen in gas</p>
<p>pCO2 .. partial pressure of carbon dioxide</p>
<p>sO2 .. oxygen saturation of hemoglobin</p>
<p>pH = log10(aH), where aH is mole fraction based activity of hydrogen ions</p>
<p><img src=\"modelica://Physiolib/Resources/Images/Examples/ODC_T_Hb.png\"/></p>
<p>R. B. Reeves, &quot;The effect of temperature on the oxygen equilibrium curve of human blood,&quot; Respiration physiology, vol. 42, pp. 317-328, 1980.</p>
<p><br>T .. temperature</p>
</html>"),  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                    100}}), graphics),
            __Dymola_experimentSetupOutput);
        end HemoglobinMultipleAllostery_;

        model Joels57

          parameter Real r=5.42e-12, t=1.26e-9;
          HemoglobinMultipleAllostery_ pCO2_2000(pH=7.6, pCO2(displayUnit="kPa") = 2000,
            KRco37=r,
            KTco37=t)
            annotation (Placement(transformation(extent={{-50,-18},{-30,2}})));
          HemoglobinMultipleAllostery_ pCO2_5330(pH=7.5, pCO2(displayUnit="kPa") = 5330,
            KRco37=r,
            KTco37=t)
            annotation (Placement(transformation(extent={{-6,-16},{14,4}})));
          HemoglobinMultipleAllostery_ pCO2_9330(pH=7.4, pCO2(displayUnit="kPa") = 9330,
            KRco37=r,
            KTco37=t)
            annotation (Placement(transformation(extent={{40,-16},{60,4}})));
        end Joels57;

        model HemoglobinTitration "Multiple-ligand allosteric hemoglobin model"
          extends Modelica.Icons.Example;

          constant Modelica.SIunits.AmountOfSubstance THb = 0.001
            "Total amount of hemoglobin";

          constant Real RT=Modelica.Constants.R*298.15;

          constant Modelica.SIunits.AmountOfSubstance AmountOfSolutionIn1L = 38.7
            "Amount of solution used for molarity to mole fraction conversion";

          constant Modelica.SIunits.Volume OneLiter = 0.001;

          parameter Real L_old=7.0529*10^6
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
          parameter Real c=0.00431555
            "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
          parameter Modelica.SIunits.Concentration KR=0.000671946
            "oxygen dissociation on relaxed(R) hemoglobin subunit";

          parameter Modelica.SIunits.Concentration KT=KR/c
            "oxygen dissociation on tensed(T) hemoglobin subunit";

          parameter Modelica.SIunits.MoleFraction KRo37 = KR*OneLiter/AmountOfSolutionIn1L;
          parameter Modelica.SIunits.MoleFraction KTo37 = KT*OneLiter/AmountOfSolutionIn1L;

          parameter Modelica.SIunits.MoleFraction KRco37 = (KR/218)*OneLiter/AmountOfSolutionIn1L;
          parameter Modelica.SIunits.MoleFraction KTco37 = (KT/218)*OneLiter/AmountOfSolutionIn1L;

          parameter Modelica.SIunits.ChemicalPotential DfG_O2 = -RT*log(0.0013/55.508);
          parameter Modelica.SIunits.ChemicalPotential DfG_CO2=-RT*log(0.034/
              55.508) + Physiolib.Media.Substance.CarbonDioxide_gas.DfG_25degC_1bar;

          parameter Modelica.SIunits.ChemicalPotential DfG_tT = 0;
          parameter Modelica.SIunits.ChemicalPotential DfG_tR = DfG_tT + RT * log(L);

          parameter Real KC = 1e-2 "Slow down factor";

          parameter Modelica.SIunits.MoleFraction initialO2=1.9594e-07
            "Initial O2 at 37degC, pO2=100Pa";             //at 25degC: 2.342e-8;
          parameter Modelica.SIunits.MoleFraction initialH=10^(-7.2);
          parameter Modelica.SIunits.MoleFraction initialCO2=2.4217e-10
            "Initial CO2 at 37degC, pCO2=40mmHg";          //at 25degC: 3.267e-5;

          parameter Modelica.SIunits.MoleFraction KRh37 = 10^(-6.89);
          parameter Modelica.SIunits.MoleFraction KTh37 = 10^(-7.52);

          parameter Modelica.SIunits.MoleFraction KRz37 = 10^(-7.25);
          parameter Modelica.SIunits.MoleFraction KTz37 = 10^(-7.73);

          parameter Modelica.SIunits.MoleFraction KRc37 = (10^(-8.35)) / (OneLiter/AmountOfSolutionIn1L);
          parameter Modelica.SIunits.MoleFraction KTc37 = (10^(-7.54)) / (OneLiter/AmountOfSolutionIn1L);

          parameter Real L=L_old
            *
            (((KTh37/((10^(-7.2))+KTh37)) / (KRh37/((10^(-7.2))+KRh37)))^4)
            *
            (((KTz37*((10^(-7.2))^2 + KRz37*(10^(-7.2)) + KRz37*KRc37*(2.4217e-5)))/(KRz37*((10^(-7.2))^2 + KTz37*(10^(-7.2)) + KTz37*KTc37*(2.4217e-5))))^4)
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";

          Physiolib.Chemical.Components.Solution solution(temperature_start=
                310.15)
            annotation (Placement(transformation(extent={{-100,-28},{100,60}})));

          Physiolib.Chemical.Components.Reaction quaternaryForm(KC=KC)
            annotation (Placement(transformation(extent={{-22,-24},{-2,-4}})));

          Physiolib.Chemical.Components.Substance O2_free(amountOfSubstance_start=
               initialO2*AmountOfSolutionIn1L, substanceData(DfG_25degC_1bar=
                  DfG_O2, DfH_25degC=-11700))
            annotation (Placement(transformation(extent={{-76,28},{-56,48}})));
          Modelica.Blocks.Sources.Clock pHSource(offset=6.9)
            annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance oxygen_in_air(
            substanceData=Physiolib.Media.Substance.Oxygen_gas,
            PartialPressure(displayUnit="bar") = 100000,
            Temperature=310.15) annotation (Placement(transformation(extent={{-10,
                    -10},{10,10}}, origin={-36,86})));
          Physiolib.Chemical.Components.GasSolubility partialPressure1(
              useWaterCorrection=false, KC=KC) annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={-14,60})));

          Physiolib.Chemical.Components.Substance H2O(substanceData=Physiolib.Media.Substance.Water_liquid,
              amountOfSubstance_start=AmountOfSolutionIn1L - THb - (initialO2 +
                initialCO2)*AmountOfSolutionIn1L)
            annotation (Placement(transformation(extent={{56,-26},{76,-6}})));
          HemoglobinQuaternaryForm                              relaxed(
            Ko37=KRo37,
            DfG_selectedForm=DfG_tR,
            initialO2=initialO2,
            initialHb=THb/(L + 1),
            initialH=initialH,
            Kh37=KRh37,
            Kz37=KRz37,
            Kc37=KRc37,
            initialCO2=initialCO2,
            DfG_O2=DfG_O2,
            DfG_CO2=DfG_CO2,
            KC=KC,
            Hc(displayUnit="kJ/mol") = -41000,
            Hz=8000,
            Hh=127000,
            Kco37=KRco37)
            annotation (Placement(transformation(extent={{-54,-16},{-34,4}})));
          HemoglobinQuaternaryForm                              tensed(
            Ko37=KTo37,
            DfG_selectedForm=DfG_tT,
            initialO2=initialO2,
            initialHb=THb*L/(L + 1),
            initialH=initialH,
            Kh37=KTh37,
            Kz37=KTz37,
            Kc37=KTc37,
            initialCO2=initialCO2,
            DfG_O2=DfG_O2,
            DfG_CO2=DfG_CO2,
            KC=KC,
            Hc(displayUnit="kJ/mol") = 59000,
            Hz=-51000,
            Hh=59000,
            Kco37=KTco37)
                      annotation (Placement(transformation(extent={{32,-16},{12,4}})));
          Physiolib.Chemical.Sources.ExternalMoleFraction H(
            substanceData=Physiolib.Media.Substance.Proton_aqueous,
            MoleFraction=initialH,
            useMoleFractionInput=true,
            Temperature=310.15) annotation (Placement(transformation(extent={{10,
                    -10},{-10,10}}, origin={-10,14})));
          Physiolib.Chemical.Components.Substance CO2_free(
              amountOfSubstance_start=initialCO2*AmountOfSolutionIn1L,
              substanceData(DfG_25degC_1bar=DfG_CO2, DfH_25degC=-412900))
            annotation (Placement(transformation(extent={{76,20},{56,40}})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance CO2_gas(
            substanceData=Physiolib.Media.Substance.CarbonDioxide_gas,
            PartialPressure(displayUnit="kPa") = 5330,
            Temperature=310.15) annotation (Placement(transformation(extent={{-10,
                    -10},{10,10}}, origin={34,84})));
          Physiolib.Chemical.Components.GasSolubility partialPressure2(
              useWaterCorrection=false, KC=KC) annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={48,60})));

          Modelica.Blocks.Math.Exp exp
            annotation (Placement(transformation(extent={{4,-60},{24,-40}})));
          Modelica.Blocks.Math.Gain gain(k=-log(10))
            annotation (Placement(transformation(extent={{-28,-60},{-8,-40}})));

          Real sO2 "Hemoglobin oxygen saturation";
          Real sCO2 "Hemoglobin carbon dioxide saturation";
          Real dH "Hemoglobin charge change caused by binding of Bohr's protons";
        equation
          sO2 = (sum(relaxed.OxyHm.x) + sum(tensed.OxyHm.x)) /
          (sum(relaxed.DeoxyHm.x) + sum(tensed.DeoxyHm.x) + sum(relaxed.OxyHm.x) + sum(tensed.OxyHm.x));

          sCO2 = (sum(relaxed.HmNHCOO.x) + sum(tensed.HmNHCOO.x)) /
          (sum(relaxed.HmNH3.x) + sum(tensed.HmNH3.x) + sum(relaxed.HmNH2.x) + sum(tensed.HmNH2.x) + sum(relaxed.HmNHCOO.x) + sum(tensed.HmNHCOO.x));

          dH = (sum(relaxed.HmNH3.x) + sum(tensed.HmNH3.x) - sum(relaxed.HmNHCOO.x) - sum(tensed.HmNHCOO.x) - sum(relaxed.HmA.x) - sum(tensed.HmA.x)) /
          THb;

          connect(oxygen_in_air.port_a, partialPressure1.gas_port) annotation (Line(
              points={{-26,86},{-26,86},{-14,86},{-14,70}},
              color={158,66,200}));
          connect(partialPressure1.liquid_port, O2_free.port_a) annotation (Line(
                points={{-14,50},{-14,38},{-56,38}}, color={158,66,200}));

          connect(O2_free.solution, solution.solution) annotation (Line(points={{-72,28},
                  {-72,-26},{60,-26},{60,-27.12}},        color={127,127,0}));
          connect(solution.solution, H2O.solution) annotation (Line(
              points={{60,-27.12},{60,-26}},
              color={127,127,0}));

          connect(relaxed.solution, solution.solution) annotation (Line(
              points={{-48,-14},{-48,-26},{60,-26},{60,-27.12}},
              color={127,127,0}));
          connect(relaxed.O2, O2_free.port_a) annotation (Line(
              points={{-52,2},{-52,38},{-56,38}},
              color={158,66,200}));
          connect(relaxed.selectedForm, quaternaryForm.substrates[1]) annotation (Line(
              points={{-40,-14},{-22,-14}},
              color={158,66,200}));
          connect(tensed.solution, solution.solution) annotation (Line(
              points={{26,-14},{26,-26},{60,-26},{60,-27.12}},
              color={127,127,0}));
          connect(tensed.O2, O2_free.port_a) annotation (Line(
              points={{30,2},{30,38},{-56,38}},
              color={158,66,200}));
          connect(tensed.selectedForm, quaternaryForm.products[1]) annotation (Line(
              points={{18,-14},{-2,-14}},
              color={158,66,200}));
          connect(H.port_a, relaxed.H) annotation (Line(
              points={{-20,14},{-36,14},{-36,2}},
              color={158,66,200}));
          connect(H.port_a, tensed.H) annotation (Line(
              points={{-20,14},{-24,14},{-24,2},{14,2}},
              color={158,66,200}));
          connect(CO2_gas.port_a, partialPressure2.gas_port) annotation (Line(
              points={{44,84},{44,84},{48,84},{48,70}},
              color={158,66,200}));
          connect(partialPressure2.liquid_port, CO2_free.port_a)
            annotation (Line(points={{48,50},{48,30},{56,30}},
                                                             color={158,66,200}));
          connect(CO2_free.port_a, tensed.CO2) annotation (Line(
              points={{56,30},{20,30},{20,2}},
              color={158,66,200}));
          connect(CO2_free.port_a, relaxed.CO2) annotation (Line(
              points={{56,30},{-42,30},{-42,2}},
              color={158,66,200}));
          connect(CO2_free.solution, solution.solution) annotation (Line(
              points={{72,20},{82,20},{82,-26},{60,-26},{60,-27.12}},
              color={127,127,0}));
          connect(exp.y, H.moleFractionInput) annotation (Line(
              points={{25,-50},{42,-50},{42,14},{0,14}},
              color={0,0,127}));
          connect(pHSource.y, gain.u) annotation (Line(
              points={{-39,-50},{-30,-50}},
              color={0,0,127}));
          connect(exp.u, gain.y) annotation (Line(
              points={{2,-50},{-7,-50}},
              color={0,0,127}));
          annotation (          experiment(StopTime=0.6),
            Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<p>Bohr&apos;s protons released during hemoglobin oxygenation</p>
<p>M. Matej&aacute;k, T. Kulh&aacute;nek, and S. Matou&scaron;ek, &quot;Adair-based hemoglobin equilibrium with oxygen, carbon dioxide and hydrogen ion activity,&quot; Scandinavian Journal of Clinical &amp; Laboratory Investigation, pp. 1-8, 2017-2018.</p>
<p><br><img src=\"modelica://Physiolib/Resources/Images/Examples/Bohr_Hb.png\"/></p>
<p>O. Siggaard-Andersen, &quot;Oxygen-Linked Hydrogen Ion Binding of Human Hemoglobin. Effects of Carbon Dioxide and 2, 3-Diphosphoglycerate I. Studies on Erythrolysate,&quot; Scandinavian Journal of Clinical &amp; Laboratory Investigation, vol. 27, pp. 351-360, 1971.</p>
</html>"));
        end HemoglobinTitration;

        model HemoglobinCarboxylation "Multiple-ligand allosteric hemoglobin model"
          extends Modelica.Icons.Example;

          constant Modelica.SIunits.AmountOfSubstance THb = 0.001
            "Total amount of hemoglobin";

          constant Real RT=Modelica.Constants.R*298.15;

          constant Modelica.SIunits.AmountOfSubstance AmountOfSolutionIn1L = 38.7
            "Amount of solution used for molarity to mole fraction conversion";

          constant Modelica.SIunits.Volume OneLiter = 0.001;

          parameter Real L_old=7.0529*10^6
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
          parameter Real c=0.00431555
            "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
          parameter Modelica.SIunits.Concentration KR=0.000671946
            "oxygen dissociation on relaxed(R) hemoglobin subunit";

          parameter Modelica.SIunits.Concentration KT=KR/c
            "oxygen dissociation on tensed(T) hemoglobin subunit";

          parameter Modelica.SIunits.MoleFraction KRo37 = KR*OneLiter/AmountOfSolutionIn1L;
          parameter Modelica.SIunits.MoleFraction KTo37 = KT*OneLiter/AmountOfSolutionIn1L;

          parameter Modelica.SIunits.MoleFraction KRco37 = (KR/218)*OneLiter/AmountOfSolutionIn1L;
          parameter Modelica.SIunits.MoleFraction KTco37 = (KT/218)*OneLiter/AmountOfSolutionIn1L;

          parameter Modelica.SIunits.ChemicalPotential DfG_O2 = -RT*log(0.0013/55.508);
          parameter Modelica.SIunits.ChemicalPotential DfG_CO2=-RT*log(0.034/
              55.508) + Physiolib.Media.Substance.CarbonDioxide_gas.DfG_25degC_1bar;

          parameter Modelica.SIunits.ChemicalPotential DfG_tT = 0;
          parameter Modelica.SIunits.ChemicalPotential DfG_tR = DfG_tT + RT * log(L);

          parameter Real KC = 1e-3 "Slow down factor";

          parameter Modelica.SIunits.MoleFraction initialO2=1.9594e-07
            "Initial O2 at 37degC, pO2=100Pa";             //at 25degC: 2.342e-8;
          parameter Modelica.SIunits.MoleFraction initialH=10^(-7.2);
          parameter Modelica.SIunits.MoleFraction initialCO2=2.4217e-10
            "Initial CO2 at 37degC, pCO2=40mmHg";          //at 25degC: 3.267e-5;

          parameter Modelica.SIunits.MoleFraction KRh37 = 10^(-6.89);
          parameter Modelica.SIunits.MoleFraction KTh37 = 10^(-7.52);

          parameter Modelica.SIunits.MoleFraction KRz37 = 10^(-7.25);
          parameter Modelica.SIunits.MoleFraction KTz37 = 10^(-7.73);

          parameter Modelica.SIunits.MoleFraction KRc37 = (10^(-8.35)) / (OneLiter/AmountOfSolutionIn1L);
          parameter Modelica.SIunits.MoleFraction KTc37 = (10^(-7.54)) / (OneLiter/AmountOfSolutionIn1L);

          parameter Real L=L_old
            *
            (((KTh37/((10^(-7.2))+KTh37)) / (KRh37/((10^(-7.2))+KRh37)))^4)
            *
            (((KTz37*((10^(-7.2))^2 + KRz37*(10^(-7.2)) + KRz37*KRc37*(2.4217e-5)))/(KRz37*((10^(-7.2))^2 + KTz37*(10^(-7.2)) + KTz37*KTc37*(2.4217e-5))))^4)
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";

          Physiolib.Chemical.Components.Solution solution(temperature_start=
                310.15)
            annotation (Placement(transformation(extent={{-100,-56},{100,32}})));

          Physiolib.Chemical.Components.Reaction quaternaryForm(KC=KC)
            annotation (Placement(transformation(extent={{-22,-52},{-2,-32}})));

          Physiolib.Chemical.Components.Substance O2_free(amountOfSubstance_start=
               initialO2*AmountOfSolutionIn1L, substanceData(DfG_25degC_1bar=
                  DfG_O2, DfH_25degC=-11700))
            annotation (Placement(transformation(extent={{-76,0},{-56,20}})));
          Modelica.Blocks.Sources.Clock pHSource(offset=6.9)
            annotation (Placement(transformation(extent={{-60,-88},{-40,-68}})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance oxygen_in_air(
            substanceData=Physiolib.Media.Substance.Oxygen_gas,
            PartialPressure(displayUnit="bar") = 100000,
            Temperature=310.15) annotation (Placement(transformation(extent={{-10,
                    -10},{10,10}}, origin={-36,58})));
          Physiolib.Chemical.Components.GasSolubility partialPressure1(
              useWaterCorrection=false, KC=KC) annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={-14,32})));

          Physiolib.Chemical.Components.Substance H2O(substanceData=Physiolib.Media.Substance.Water_liquid,
              amountOfSubstance_start=AmountOfSolutionIn1L - THb - (initialO2 +
                initialCO2)*AmountOfSolutionIn1L)
            annotation (Placement(transformation(extent={{56,-54},{76,-34}})));
          HemoglobinQuaternaryForm                              relaxed(
            Ko37=KRo37,
            DfG_selectedForm=DfG_tR,
            initialO2=initialO2,
            initialHb=THb/(L + 1),
            initialH=initialH,
            Kh37=KRh37,
            Kz37=KRz37,
            Kc37=KRc37,
            initialCO2=initialCO2,
            DfG_O2=DfG_O2,
            DfG_CO2=DfG_CO2,
            KC=KC,
            Hc(displayUnit="kJ/mol") = -41000,
            Hz=8000,
            Hh=127000,
            Kco37=KRco37)
            annotation (Placement(transformation(extent={{-54,-44},{-34,-24}})));
          HemoglobinQuaternaryForm                              tensed(
            Ko37=KTo37,
            DfG_selectedForm=DfG_tT,
            initialO2=initialO2,
            initialHb=THb*L/(L + 1),
            initialH=initialH,
            Kh37=KTh37,
            Kz37=KTz37,
            Kc37=KTc37,
            initialCO2=initialCO2,
            DfG_O2=DfG_O2,
            DfG_CO2=DfG_CO2,
            KC=KC,
            Hc(displayUnit="kJ/mol") = 59000,
            Hz=-51000,
            Hh=59000,
            Kco37=KTco37)
                      annotation (Placement(transformation(extent={{32,-44},{12,-24}})));
          Physiolib.Chemical.Sources.ExternalMoleFraction H(
            substanceData=Physiolib.Media.Substance.Proton_aqueous,
            MoleFraction=initialH,
            useMoleFractionInput=true,
            Temperature=310.15) annotation (Placement(transformation(extent={{10,
                    -10},{-10,10}}, origin={-10,-14})));
          Physiolib.Chemical.Components.Substance CO2_free(
              amountOfSubstance_start=initialCO2*AmountOfSolutionIn1L,
              substanceData(DfG_25degC_1bar=DfG_CO2, DfH_25degC=-412900))
            annotation (Placement(transformation(extent={{76,-8},{56,12}})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance CO2_gas(
            substanceData=Physiolib.Media.Substance.CarbonDioxide_gas,
            PartialPressure(displayUnit="kPa") = 5330,
            Temperature=310.15) annotation (Placement(transformation(extent={{-10,
                    -10},{10,10}}, origin={34,56})));
          Physiolib.Chemical.Components.GasSolubility partialPressure2(
              useWaterCorrection=false, KC=KC) annotation (Placement(
                transformation(extent={{-10,-10},{10,10}}, origin={48,32})));

          Modelica.Blocks.Math.Exp exp
            annotation (Placement(transformation(extent={{4,-88},{24,-68}})));
          Modelica.Blocks.Math.Gain gain(k=-log(10))
            annotation (Placement(transformation(extent={{-28,-88},{-8,-68}})));

          Real sO2 "Hemoglobin oxygen saturation";
          Real sCO2 "Hemoglobin carbon dioxide saturation";
          Real dH "Hemoglobin charge change caused by binding of Bohr's protons";
        equation
          sO2 = (sum(relaxed.OxyHm.x) + sum(tensed.OxyHm.x)) /
          (sum(relaxed.DeoxyHm.x) + sum(tensed.DeoxyHm.x) + sum(relaxed.OxyHm.x) + sum(tensed.OxyHm.x));

          sCO2 = (sum(relaxed.HmNHCOO.x) + sum(tensed.HmNHCOO.x)) /
          (sum(relaxed.HmNH3.x) + sum(tensed.HmNH3.x) + sum(relaxed.HmNH2.x) + sum(tensed.HmNH2.x) + sum(relaxed.HmNHCOO.x) + sum(tensed.HmNHCOO.x));

          dH = (sum(relaxed.HmNH3.x) + sum(tensed.HmNH3.x) - sum(relaxed.HmNHCOO.x) - sum(tensed.HmNHCOO.x) - sum(relaxed.HmA.x) - sum(tensed.HmA.x)) /
          THb;

          connect(oxygen_in_air.port_a, partialPressure1.gas_port) annotation (Line(
              points={{-26,58},{-26,58},{-14,58},{-14,42}},
              color={158,66,200}));
          connect(partialPressure1.liquid_port, O2_free.port_a) annotation (Line(
                points={{-14,22},{-14,10},{-56,10}}, color={158,66,200}));

          connect(O2_free.solution, solution.solution) annotation (Line(points={{
                  -72,0},{-72,-54},{60,-54},{60,-55.12}}, color={127,127,0}));
          connect(solution.solution, H2O.solution) annotation (Line(
              points={{60,-55.12},{60,-54}},
              color={127,127,0}));

          connect(relaxed.solution, solution.solution) annotation (Line(
              points={{-48,-42},{-48,-54},{60,-54},{60,-55.12}},
              color={127,127,0}));
          connect(relaxed.O2, O2_free.port_a) annotation (Line(
              points={{-52,-26},{-52,10},{-56,10}},
              color={158,66,200}));
          connect(relaxed.selectedForm, quaternaryForm.substrates[1]) annotation (Line(
              points={{-40,-42},{-22,-42}},
              color={158,66,200}));
          connect(tensed.solution, solution.solution) annotation (Line(
              points={{26,-42},{26,-54},{60,-54},{60,-55.12}},
              color={127,127,0}));
          connect(tensed.O2, O2_free.port_a) annotation (Line(
              points={{30,-26},{30,10},{-56,10}},
              color={158,66,200}));
          connect(tensed.selectedForm, quaternaryForm.products[1]) annotation (Line(
              points={{18,-42},{-2,-42}},
              color={158,66,200}));
          connect(H.port_a, relaxed.H) annotation (Line(
              points={{-20,-14},{-36,-14},{-36,-26}},
              color={158,66,200}));
          connect(H.port_a, tensed.H) annotation (Line(
              points={{-20,-14},{-24,-14},{-24,-26},{14,-26}},
              color={158,66,200}));
          connect(CO2_gas.port_a, partialPressure2.gas_port) annotation (Line(
              points={{44,56},{44,56},{48,56},{48,42}},
              color={158,66,200}));
          connect(partialPressure2.liquid_port, CO2_free.port_a)
            annotation (Line(points={{48,22},{48,2},{56,2}}, color={158,66,200}));
          connect(CO2_free.port_a, tensed.CO2) annotation (Line(
              points={{56,2},{20,2},{20,-26}},
              color={158,66,200}));
          connect(CO2_free.port_a, relaxed.CO2) annotation (Line(
              points={{56,2},{-42,2},{-42,-26}},
              color={158,66,200}));
          connect(CO2_free.solution, solution.solution) annotation (Line(
              points={{72,-8},{82,-8},{82,-54},{60,-54},{60,-55.12}},
              color={127,127,0}));
          connect(exp.y, H.moleFractionInput) annotation (Line(
              points={{25,-78},{42,-78},{42,-14},{0,-14}},
              color={0,0,127}));
          connect(pHSource.y, gain.u) annotation (Line(
              points={{-39,-78},{-30,-78}},
              color={0,0,127}));
          connect(exp.u, gain.y) annotation (Line(
              points={{2,-78},{-7,-78}},
              color={0,0,127}));
          annotation (          experiment(StopTime=0.6),
            Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<p>Binding of carbon dioxide to hemoglobin</p>
<p><br>M. Matej&aacute;k, T. Kulh&aacute;nek, and S. Matou&scaron;ek, &quot;Adair-based hemoglobin equilibrium with oxygen, carbon dioxide and hydrogen ion activity,&quot; Scandinavian Journal of Clinical &amp; Laboratory Investigation, pp. 1-8, 2017-2018.</p>
<p><br><img src=\"modelica://Physiolib/Resources/Images/Examples/CDDC_Hb.png\"/></p>
<p>C. Bauer and E. Schr&ouml;der, &quot;Carbamino compounds of haemoglobin in human adult and foetal blood,&quot; Journal of Physiology, vol. 227, pp. 457-471, 1972.</p>
</html>"));
        end HemoglobinCarboxylation;
      end Hemoglobin;

      package CheckSubstancesData
        model SimpleReaction
          "The simple chemical reaction A<->B with equilibrium B/A = 2"
           extends Modelica.Icons.Example;

          constant Real K = 2 "Dissociation constant of the reaction";

          constant Modelica.SIunits.Temperature T_25degC = 298.15 "Temperature";
          constant Real R = Modelica.Constants.R "Gas constant";

          Physiolib.Chemical.Sensors.DissociationCoefficient
            dissociationCoefficient
            annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
          Physiolib.Chemical.Sources.PureSubstance A
            annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
          Physiolib.Chemical.Sources.PureSubstance B(redeclare package
              stateOfMatter = Physiolib.Chemical.Interfaces.Incompressible,
              substanceData(DfG_25degC_1bar=-R*T_25degC*log(K)))
            annotation (Placement(transformation(extent={{60,-10},{40,10}})));
        equation
        connect(A.port_a, dissociationCoefficient.substrates[1]) annotation (Line(
            points={{-36,0},{-10,0}},
            color={158,66,200},
            thickness=1));
        connect(B.port_a, dissociationCoefficient.products[1]) annotation (Line(
            points={{40,0},{10,0}},
            color={158,66,200},
            thickness=1));
          annotation (Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"),  experiment(StopTime=0.001));
        end SimpleReaction;

        model SimpleReaction2
          "The simple chemical reaction A+B<->C with equilibrium [C]/([A]*[B]) = 2, where [A] is molar concentration of A in water"
           extends Modelica.Icons.Example;

          constant Real Kb(unit="kg/mol") = 2
            "Molarity based dissociation constant of the reaction with one more reactant";

          constant Real Kx(unit="1") = Kb*55.508
            "Mole fraction based dissociation constant of the reaction with one more reactant in the pure water";

          constant Modelica.SIunits.Temperature T_25degC = 298.15 "Temperature";
          constant Real R = Modelica.Constants.R "Gas constant";

          Physiolib.Chemical.Sources.PureSubstance A
            annotation (Placement(transformation(extent={{-34,2},{-14,22}})));
          Physiolib.Chemical.Sensors.DissociationCoefficient reaction(nS=2)
            annotation (Placement(transformation(extent={{4,-8},{24,12}})));
          Physiolib.Chemical.Sources.PureSubstance B
            annotation (Placement(transformation(extent={{-34,-24},{-14,-4}})));
          Physiolib.Chemical.Sources.PureSubstance C(substanceData(
                DfG_25degC_1bar=-R*T_25degC*log(Kx)))
            annotation (Placement(transformation(extent={{68,-8},{48,12}})));

        equation
          connect(reaction.products[1], C.port_a) annotation (Line(
              points={{24,2},{48,2}},
              color={158,66,200},
              thickness=1));

          connect(B.port_a, reaction.substrates[1]) annotation (Line(
              points={{-14,-14},{-10,-14},{-10,1.5},{4,1.5}},
              color={158,66,200},
              thickness=1));
          connect(A.port_a, reaction.substrates[2]) annotation (Line(
              points={{-14,12},{-10,12},{-10,2.5},{4,2.5}},
              color={158,66,200},
              thickness=1));
          annotation ( Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"),  experiment(StopTime=0.001));
        end SimpleReaction2;

        model SimpleReaction2_Get_DfG
          "The simple chemical reaction A+B<->C with equilibrium [C]/([A]*[B]) = 2, where [A] is molar concentration of A in water"
           extends Modelica.Icons.Example;

          Physiolib.Chemical.Sources.PureSubstance A
            annotation (Placement(transformation(extent={{-28,42},{-8,62}})));
          Physiolib.Chemical.Sensors.DissociationCoefficient reaction(nS=2)
            annotation (Placement(transformation(extent={{10,32},{30,52}})));
          Physiolib.Chemical.Sources.PureSubstance B
            annotation (Placement(transformation(extent={{-28,16},{-8,36}})));

          Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints
            annotation (Placement(transformation(extent={{-42,-80},{82,80}})));
          Physiolib.Chemical.Sources.ExternalElectroChemicalPotential C(
              usePotentialInput=true)
            annotation (Placement(transformation(extent={{60,32},{40,52}})));
          Modelica.Blocks.Sources.Constant K(k=2*55.508)
            annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
        equation

          connect(B.port_a, reaction.substrates[1]) annotation (Line(
              points={{-8,26},{-4,26},{-4,41.5},{10,41.5}},
              color={158,66,200},
              thickness=1));
          connect(A.port_a, reaction.substrates[2]) annotation (Line(
              points={{-8,52},{-4,52},{-4,42.5},{10,42.5}},
              color={158,66,200},
              thickness=1));
          connect(reaction.DissociationCoefficient_MoleFractionBased,
            inverseBlockConstraints.u2) annotation (Line(
              points={{20,34},{20,0},{-29.6,0}},
              color={0,0,127}));
          connect(reaction.products[1], C.port_a) annotation (Line(
              points={{30,42},{40,42}},
              color={158,66,200},
              thickness=1));
          connect(C.uInput, inverseBlockConstraints.y2) annotation (Line(
              points={{60,42},{70,42},{70,24},{46,24},{46,0},{72.7,0}},
              color={0,0,127}));
          connect(inverseBlockConstraints.u1, K.y) annotation (Line(
              points={{-48.2,0},{-71,0}},
              color={0,0,127}));
          annotation ( Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"),  experiment(StopTime=0.001));
        end SimpleReaction2_Get_DfG;

        model StandardElectrochemicalCell
          "Hypothetical experiment of pure substances reaction to define the standard electrochemical cell potential "
         extends Modelica.Icons.Example;

          Physiolib.Chemical.Components.Solution cathode(ElectricGround=false)
            annotation (Placement(transformation(extent={{-90,-40},{-46,68}})));

          Physiolib.Chemical.Components.Solution anode(ElectricGround=false)
            annotation (Placement(transformation(extent={{60,-40},{96,70}})));

          Physiolib.Chemical.Sources.PureSubstance Ag(substanceData=Media.Substance.Silver_solid)
            annotation (Placement(transformation(extent={{-80,-28},{-60,-8}})));
          Physiolib.Chemical.Sources.PureSubstance Cl(substanceData=Media.Substance.Chloride_aqueous)
            annotation (Placement(transformation(extent={{-8,-36},{-28,-16}})));
          Physiolib.Chemical.Sources.PureSubstance AgCl(substanceData=Media.Substance.SilverChloride_solid)
            annotation (Placement(transformation(extent={{-80,12},{-60,32}})));
          Physiolib.Chemical.Sources.ExternalIdealGasSubstance H2(
            substanceData=Media.Substance.Hydrogen_gas,
            PartialPressure=100000,
            TotalPressure=100000)
            annotation (Placement(transformation(extent={{24,32},{44,52}})));
          Physiolib.Chemical.Sources.PureSubstance H(substanceData=Media.Substance.Proton_aqueous)
            annotation (Placement(transformation(extent={{18,-36},{38,-16}})));
          Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
            annotation (Placement(transformation(extent={{-6,64},{14,84}})));
          Physiolib.Chemical.Components.Reaction electrodeReaction(nP=2, p={2,2})
            annotation (Placement(transformation(
                extent={{-10,10},{10,-10}},
                rotation=270,
                origin={52,6})));
          Physiolib.Chemical.Components.Reaction electrodeReaction1(nS=2, nP=2)
            annotation (Placement(transformation(
                extent={{-10,10},{10,-10}},
                rotation=90,
                origin={-40,6})));
          Physiolib.Chemical.Components.ElectronTransfer electrone
            annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
          Physiolib.Chemical.Components.ElectronTransfer electrone1
            annotation (Placement(transformation(extent={{86,-26},{66,-6}})));

        equation
          connect(Ag.port_a, electrodeReaction1.substrates[1]) annotation (Line(
              points={{-60,-18},{-42,-18},{-42,-4},{-42,-4}},
              color={158,66,200},
              thickness=1));
          connect(Cl.port_a, electrodeReaction1.substrates[2]) annotation (Line(
              points={{-28,-26},{-38,-26},{-38,-4}},
              color={158,66,200},
              thickness=1));
          connect(AgCl.port_a, electrodeReaction1.products[1]) annotation (Line(
              points={{-60,22},{-42,22},{-42,16}},
              color={158,66,200},
              thickness=1));
          connect(H2.port_a, electrodeReaction.substrates[1]) annotation (Line(
              points={{44,42},{52,42},{52,16}},
              color={158,66,200},
              thickness=1));
          connect(H.port_a, electrodeReaction.products[1]) annotation (Line(
              points={{38,-26},{54,-26},{54,-4}},
              color={158,66,200},
              thickness=1));
          connect(electrodeReaction.products[2], electrone1.port_a) annotation (Line(
              points={{50,-4},{50,-16},{66,-16}},
              color={158,66,200},
              thickness=1));
          connect(electrodeReaction1.products[2], electrone.port_a) annotation (Line(
              points={{-38,16},{-38,50},{-60,50}},
              color={158,66,200},
              thickness=1));
          connect(electrone.pin, voltageSensor.p) annotation (Line(
              points={{-80,50},{-86,50},{-86,74},{-6,74}},
              color={0,0,255}));
          connect(electrone1.pin, voltageSensor.n) annotation (Line(
              points={{86,-16},{90,-16},{90,74},{14,74}},
              color={0,0,255}));
        connect(electrone1.solution, anode.solution) annotation (Line(
            points={{82,-26},{80,-26},{80,-38.9},{88.8,-38.9}},
            color={127,127,0}));
        connect(electrone.solution, cathode.solution) annotation (Line(
            points={{-76,40},{-88,40},{-88,-38.92},{-54.8,-38.92}},
            color={127,127,0}));
          annotation (
          experiment(StopTime=1), Documentation(info=
                        "<html>
<p>Hypothetical experiment of pure substances reaction to define the standard electrochemical cell potential </p>
</html>",     revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
        end StandardElectrochemicalCell;

        model StandardLeadAcidPotential
          "Standard potential of the lead acid battery"
         extends Modelica.Icons.Example;

          Physiolib.Chemical.Components.Solution anode(ElectricGround=false)
            annotation (Placement(transformation(extent={{54,-46},{92,62}})));

          Physiolib.Chemical.Components.Solution cathode(ElectricGround=false)
            annotation (Placement(transformation(extent={{-94,-50},{-56,58}})));

          Physiolib.Chemical.Sources.PureSubstance Pb(substanceData=Media.Substance.Lead_solid)
            annotation (Placement(transformation(extent={{84,-34},{64,-14}})));
          Physiolib.Chemical.Sources.PureSubstance HSO4(substanceData=Media.Substance.HydrogenSulfate_aqueous)
            annotation (Placement(transformation(extent={{-22,-58},{-2,-38}})));
          Physiolib.Chemical.Sources.PureSubstance PbSO4_(substanceData=Media.Substance.LeadSulfate_solid)
            annotation (Placement(transformation(extent={{84,4},{64,24}})));
          Physiolib.Chemical.Sources.PureSubstance H(substanceData=Media.Substance.Proton_aqueous)
            annotation (Placement(transformation(extent={{6,-28},{26,-8}})));
          Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
            annotation (Placement(transformation(extent={{-6,60},{14,80}})));
          Physiolib.Chemical.Components.Reaction electrodeReaction(
            nP=2,
            nS=4,
            s={1,1,3,2},
            p={1,2}) annotation (Placement(transformation(
                extent={{-10,10},{10,-10}},
                rotation=90,
                origin={-42,14})));
          Physiolib.Chemical.Components.Reaction electrodeReaction1(
            nS=2,
            nP=3,
            p={1,1,2}) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={44,14})));

          Physiolib.Chemical.Components.ElectronTransfer electrone
            annotation (Placement(transformation(extent={{84,32},{64,52}})));
          Physiolib.Chemical.Components.ElectronTransfer electrone1
            annotation (Placement(transformation(extent={{-86,-12},{-66,8}})));
          Physiolib.Chemical.Sources.PureSubstance PbO2(substanceData=Media.Substance.LeadDioxide_solid)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  origin={-74,-30})));
          Physiolib.Chemical.Sources.PureSubstance H2O(substanceData=Media.Substance.Water_liquid)
            annotation (Placement(transformation(extent={{-2,-10},{-22,10}})));
          Physiolib.Chemical.Sources.PureSubstance PbSO4(substanceData=Media.Substance.LeadSulfate_solid)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  origin={-74,32})));

        equation
          connect(Pb.port_a, electrodeReaction1.substrates[1]) annotation (Line(
              points={{64,-24},{45.5,-24},{45.5,4},{46,4}},
              color={158,66,200},
              thickness=1));
          connect(HSO4.port_a, electrodeReaction1.substrates[2]) annotation (Line(
              points={{-2,-48},{44,-48},{44,4},{42,4}},
              color={158,66,200},
              thickness=1));
          connect(PbSO4_.port_a, electrodeReaction1.products[1]) annotation (Line(
              points={{64,14},{56,14},{56,28},{46,28},{46,24},{46.6667,24}},
              color={158,66,200},
              thickness=1));
          connect(electrodeReaction.products[1], PbSO4.port_a) annotation (Line(
              points={{-44,24},{-44,32},{-64,32}},
              color={158,66,200},
              thickness=1));
          connect(electrodeReaction.products[2], H2O.port_a) annotation (Line(
              points={{-40,24},{-40,24},{-40,32},{-34,32},{-34,0},{-22,0}},
              color={158,66,200},
              thickness=1));
          connect(PbO2.port_a, electrodeReaction.substrates[1]) annotation (Line(
              points={{-64,-30},{-42,-30},{-42,4},{-45,4}},
              color={158,66,200},
              thickness=1));
          connect(HSO4.port_a, electrodeReaction.substrates[2]) annotation (Line(
              points={{-2,-48},{-40,-48},{-40,4},{-43,4}},
              color={158,66,200},
              thickness=1));
          connect(H.port_a, electrodeReaction.substrates[3]) annotation (Line(
              points={{26,-18},{-38,-18},{-38,4},{-41,4}},
              color={158,66,200},
              thickness=1));
          connect(electrone1.port_a, electrodeReaction.substrates[4]) annotation (Line(
              points={{-66,-2},{-44,-2},{-44,4},{-39,4}},
              color={158,66,200},
              thickness=1));
          connect(H.port_a, electrodeReaction1.products[2]) annotation (Line(
              points={{26,-18},{32,-18},{32,32},{42,32},{42,24},{44,24}},
              color={158,66,200},
              thickness=1));
          connect(electrone.port_a, electrodeReaction1.products[3]) annotation (Line(
              points={{64,42},{44,42},{44,24},{41.3333,24}},
              color={158,66,200},
              thickness=1));
        connect(electrone1.pin, voltageSensor.p) annotation (Line(
            points={{-86,-2},{-98,-2},{-98,70},{-6,70}},
            color={0,0,255}));
        connect(electrone.pin, voltageSensor.n) annotation (Line(
            points={{84,42},{96,42},{96,70},{14,70}},
            color={0,0,255}));
        connect(electrone1.solution, cathode.solution) annotation (Line(
            points={{-82,-12},{-82,-48.92},{-63.6,-48.92}},
            color={127,127,0}));
        connect(electrone.solution, anode.solution) annotation (Line(
            points={{80,32},{80,-44.92},{84.4,-44.92}},
            color={127,127,0}));
          annotation (
          experiment(StopTime=100), Documentation(revisions=
                          "<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
        end StandardLeadAcidPotential;

      end CheckSubstancesData;
    /*
  model FluidAdapter
   extends Modelica.Icons.Example;

   package Medium = Physiolib.Chemical.Interfaces.SimpleChemicalMedium (
          substanceNames={"H2O(l)"}, substanceData={Media.Substance.Water_liquid});

    inner Modelica.Fluid.System system
      annotation (Placement(transformation(extent={{-82,66},{-62,86}})));
    Physiolib.Chemical.Components.FluidAdapter fluidConversion1(
      substanceNames={"H2O(l)"},
      substanceData={Media.Substance.Water_liquid},
      redeclare package Medium = Medium)
      annotation (Placement(transformation(extent={{-50,-2},{-30,18}})));
    Physiolib.Chemical.Components.Solution simpleSolution1(BasePressure=
          110000, useThermalPort=true)
      annotation (Placement(transformation(extent={{-96,-20},{-26,40}})));
    Physiolib.Chemical.Components.Substance H2O1(
      redeclare package stateOfMatter =
          Physiolib.Chemical.Interfaces.Incompressible,
      substanceData=Media.Substance.Water_liquid,
      amountOfSubstance_start=55)
      annotation (Placement(transformation(extent={{-80,-2},{-60,18}})));
    Physiolib.Chemical.Components.Solution simpleSolution2(temperature_start=
          299.15, useThermalPort=true)
      annotation (Placement(transformation(extent={{24,-20},{98,42}})));
    Physiolib.Chemical.Components.Substance H2O2(
      redeclare package stateOfMatter =
          Physiolib.Chemical.Interfaces.Incompressible,
      substanceData=Media.Substance.Water_liquid,
      amountOfSubstance_start=55)
      annotation (Placement(transformation(extent={{84,-2},{64,18}})));
    Physiolib.Chemical.Components.FluidAdapter fluidConversion2(
      substanceNames={"H2O(l)"},
      substanceData={Media.Substance.Water_liquid},
      redeclare package Medium = Medium)
      annotation (Placement(transformation(extent={{56,-2},{36,18}})));
    Modelica.Fluid.Pipes.StaticPipe pipe1(
      length=1,
      diameter=0.005,
      redeclare package Medium = Medium)
      annotation (Placement(transformation(extent={{-10,-2},{10,18}})));
  equation 
  connect(fluidConversion1.solution, simpleSolution1.solution) annotation (
      Line(
      points={{-36,5},{-36,-8},{-40,-8},{-40,-19.4}},
      color={127,127,0}));
  connect(H2O1.port_a, fluidConversion1.substances[1]) annotation (Line(
      points={{-60,8},{-50,8}},
      color={158,66,200}));
  connect(H2O1.solution, simpleSolution1.solution) annotation (Line(
      points={{-76,-2},{-76,-8},{-40,-8},{-40,-19.4}},
      color={127,127,0}));
  connect(fluidConversion2.solution, simpleSolution2.solution) annotation (
      Line(
      points={{42,5},{42,-8},{80,-8},{80,-20},{83.2,-20},{83.2,-19.38}},
      color={127,127,0}));
  connect(H2O2.solution, simpleSolution2.solution) annotation (Line(
      points={{80,-2},{80,-19.38},{83.2,-19.38}},
      color={127,127,0}));
  connect(H2O2.port_a, fluidConversion2.substances[1]) annotation (Line(
      points={{64,8},{56,8}},
      color={158,66,200}));
  connect(fluidConversion1.fluid, pipe1.port_a) annotation (Line(
      points={{-30,8},{-10,8}},
      color={0,127,255}));
  connect(fluidConversion2.fluid, pipe1.port_b) annotation (Line(
      points={{36,8},{10,8}},
      color={0,127,255}));
    connect(simpleSolution1.heatPort, fluidConversion1.heatPort) annotation (Line(
        points={{-82,-20.6},{-82,-6},{-44,-6},{-44,5}},
        color={191,0,0}));
    connect(simpleSolution2.heatPort, fluidConversion2.heatPort) annotation (Line(
        points={{38.8,-20.62},{38.8,-6},{50,-6},{50,5}},
        color={191,0,0}));
    annotation (    experiment(StopTime=31));
  end FluidAdapter;

  model FluidAdapter2
   extends Modelica.Icons.Example;

   package Medium = Physiolib.Chemical.Interfaces.SimpleChemicalMedium (
          substanceNames={"H2O(l)","Ethanol"}, substanceData={Media.Substance.Water_liquid,
            Media.Substance.Ethanol_liquid});

    inner Modelica.Fluid.System system
      annotation (Placement(transformation(extent={{-82,66},{-62,86}})));
    Physiolib.Chemical.Components.FluidAdapter fluidConversion1(
      substanceData={Media.Substance.Water_liquid,Media.Substance.Ethanol_liquid},
      substanceNames={"H2O(l)","Ethanol"},
      redeclare package Medium = Medium)
      annotation (Placement(transformation(extent={{-50,-2},{-30,18}})));

    Physiolib.Chemical.Components.Solution simpleSolution1(BasePressure=
          110000, useThermalPort=true)
      annotation (Placement(transformation(extent={{-96,-20},{-26,40}})));
    Physiolib.Chemical.Components.Substance H2O(
      redeclare package stateOfMatter =
          Physiolib.Chemical.Interfaces.Incompressible,
      substanceData=Media.Substance.Water_liquid,
      amountOfSubstance_start=5)
      annotation (Placement(transformation(extent={{-90,-2},{-70,18}})));
    Physiolib.Chemical.Components.Solution simpleSolution2(temperature_start=
          299.15, useThermalPort=true)
      annotation (Placement(transformation(extent={{24,-20},{98,42}})));
    Physiolib.Chemical.Components.Substance H2O_(
      redeclare package stateOfMatter =
          Physiolib.Chemical.Interfaces.Incompressible,
      substanceData=Media.Substance.Water_liquid,
      amountOfSubstance_start=55)
      annotation (Placement(transformation(extent={{80,-2},{60,18}})));
    Physiolib.Chemical.Components.FluidAdapter fluidConversion2(
      substanceNames={"H2O(l)","Ethanol"},
      substanceData={Media.Substance.Water_liquid,Media.Substance.Ethanol_liquid},
      redeclare package Medium = Medium)
      annotation (Placement(transformation(extent={{56,-2},{36,18}})));

    Modelica.Fluid.Pipes.StaticPipe pipe1(
      length=1,
    diameter=0.005,
    redeclare package Medium =Medium)
                  annotation (Placement(transformation(extent={{-10,-2},{10,
            18}})));
    Physiolib.Chemical.Components.Substance C2H5OH(
      redeclare package stateOfMatter =
          Physiolib.Chemical.Interfaces.Incompressible,
      substanceData=Media.Substance.Ethanol_liquid,
      amountOfSubstance_start=100)
      annotation (Placement(transformation(extent={{-70,18},{-50,38}})));
    Physiolib.Chemical.Components.Substance C2H5OH_(
      redeclare package stateOfMatter =
          Physiolib.Chemical.Interfaces.Incompressible,
      amountOfSubstance_start=55,
      substanceData=Media.Substance.Ethanol_liquid)
      annotation (Placement(transformation(extent={{90,20},{70,40}})));
  equation 
  connect(fluidConversion1.solution, simpleSolution1.solution) annotation (
      Line(
      points={{-36,5},{-36,-8},{-40,-8},{-40,-19.4}},
      color={127,127,0}));
    connect(H2O.port_a, fluidConversion1.substances[1]) annotation (Line(
        points={{-70,8},{-60,8},{-60,8},{-50,8}},
        color={158,66,200}));
    connect(H2O.solution, simpleSolution1.solution) annotation (Line(
        points={{-86,-2},{-86,-8},{-40,-8},{-40,-19.4}},
        color={127,127,0}));
  connect(fluidConversion2.solution, simpleSolution2.solution) annotation (
      Line(
      points={{42,5},{42,-6},{82,-6},{82,-19.38},{83.2,-19.38}},
      color={127,127,0}));
  connect(H2O_.solution, simpleSolution2.solution) annotation (Line(
      points={{76,-2},{76,-6},{82,-6},{82,-19.38},{83.2,-19.38}},
      color={127,127,0}));
  connect(H2O_.port_a, fluidConversion2.substances[1]) annotation (Line(
      points={{60,8},{58,8},{58,8},{56,8}},
      color={158,66,200}));
  connect(fluidConversion1.fluid, pipe1.port_a) annotation (Line(
      points={{-30,8},{-10,8}},
      color={0,127,255}));
  connect(fluidConversion2.fluid, pipe1.port_b) annotation (Line(
      points={{36,8},{10,8}},
      color={0,127,255}));
    connect(simpleSolution1.heatPort, fluidConversion1.heatPort) annotation (Line(
        points={{-82,-20.6},{-82,-6},{-44,-6},{-44,5}},
        color={191,0,0}));
    connect(simpleSolution2.heatPort, fluidConversion2.heatPort) annotation (Line(
        points={{38.8,-20.62},{38.8,-4},{50,-4},{50,5}},
        color={191,0,0}));
  connect(C2H5OH.solution, simpleSolution1.solution) annotation (Line(
      points={{-66,18},{-66,-8},{-40,-8},{-40,-19.4}},
      color={127,127,0}));
  connect(C2H5OH.port_a, fluidConversion1.substances[2]) annotation (Line(
      points={{-50,28},{-50,8}},
      color={158,66,200}));
  connect(C2H5OH_.solution, simpleSolution2.solution) annotation (Line(
      points={{86,20},{86,-6},{82,-6},{82,-19.38},{83.2,-19.38}},
      color={127,127,0}));
  connect(C2H5OH_.port_a, fluidConversion2.substances[2]) annotation (Line(
      points={{70,30},{56,30},{56,8}},
      color={158,66,200}));
    annotation (    experiment(
        StopTime=18.4),
      Documentation(info="<html>
<p>Demonstration of compatibility with FluidPort from Modelica Standard Library.</p>
</html>"));
  end FluidAdapter2;
  */
    end Examples;
  end Chemical;

  package Fluid
    package Components
      extends Modelica.Icons.Package;
      model Conductor "Hydraulic resistor, where conductance=1/resistance"
       extends Interfaces.OnePort;
       extends Physiolib.Icons.HydraulicResistor;

        parameter Boolean useConductanceInput = false
          "=true, if external conductance value is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolib.Types.HydraulicConductance Conductance=0
          "Hydraulic conductance if useConductanceInput=false"
          annotation (Dialog(enable=not useConductanceInput));

        Physiolib.Types.RealIO.HydraulicConductanceInput cond(start=
              Conductance)=c if useConductanceInput annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,60})));
      protected
         Physiolib.Types.HydraulicConductance c;
      equation
        if not useConductanceInput then
          c=Conductance;
        end if;
        q_in.m_flow = c * (q_in.p - q_out.p);
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                  -100,-100},{100,100}}),
                         graphics={Text(
                extent={{-220,-40},{200,-80}},
                lineColor={127,0,0},
                fillColor={58,117,175},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
<p>All rights reserved. </p>
</html>",   info="<html>
<p>This hydraulic conductance (resistance) element contains two connector sides. No hydraulic medium volume is changing in this element during simulation. That means that sum of flow in both connector sides is zero. The flow through element is determined by <b>Ohm&apos;s law</b>. It is used conductance (=1/resistance) because it could be numerical zero better then infinity in resistance. </p>
</html>"));
      end Conductor;

      model Resistor
        extends Physiolib.Fluid.Components.Conductor(final Conductance=1/
              Resistance);
        parameter Physiolib.Types.HydraulicResistance Resistance
          "Hydraulic conductance if useConductanceInput=false";
      end Resistor;

      model ElasticVessel "Elastic container for blood vessels, bladder, lumens"
       extends Physiolib.Icons.ElasticBalloon;
       //extends Physiolib.SteadyStates.Interfaces.SteadyState(state_start=
       //       volume_start, storeUnit="ml");

        replaceable package Medium = Physiolib.Media.BaseMedium_C
        "Medium model"   annotation (choicesAllMatching=true);

        parameter Integer nHydraulicPorts=0 "Number of hydraulic ports"
          annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));

        Physiolib.Fluid.Interfaces.FluidPorts_a q_in[nHydraulicPorts](redeclare
            package Medium = Medium) annotation (Placement(transformation(extent={{-6,
                  -42},{14,14}}), iconTransformation(
              extent={{-7,-26},{7,26}},
              rotation=180,
              origin={-3,0})));

        parameter Physiolib.Types.Mass mass_start=1e-8
          "Mass start value" annotation (Dialog(group="Initialization"));            //default = 1e-5 g
        parameter Physiolib.Types.Concentration concentration_start[Medium.nC]=Medium.C_default
          "Initial molar concentrations" annotation (Dialog(group="Initialization"));

         parameter Boolean useM0Input = false
          "=true, if zero-pressure-mass input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

         parameter Physiolib.Types.Mass ZeroPressureMass=1e-8
          "Maximal mass, that does not generate pressure if useM0Input=false"
          annotation (Dialog(enable=not useV0Input)); //default = 1e-5 g

          parameter Physiolib.Types.Mass CollapsingPressureMass=1e-9
          "Maximal mass, which generate negative collapsing pressure"; //default = 1e-6 g

         Physiolib.Types.RealIO.MassInput zeroPressureMass(start=
              ZeroPressureMass) if useM0Input annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-20,100}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-80,100})));
        parameter Boolean useComplianceInput = false
          "=true, if compliance input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
        parameter Physiolib.Types.HydraulicCompliance Compliance=1e+3
          "Compliance if useComplianceInput=false"
          annotation (Dialog(enable=not useComplianceInput));

        Physiolib.Types.RealIO.HydraulicComplianceInput compliance(start=
              Compliance) if useComplianceInput annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={20,100}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
        parameter Boolean useExternalPressureInput = false
          "=true, if external pressure input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
        parameter Physiolib.Types.AbsolutePressure ExternalPressure=101325
          "External pressure. Set zero if internal pressure is relative to external. Valid only if useExternalPressureInput=false."
          annotation (Dialog(enable=not useExternalPressureInput));
        parameter Physiolib.Types.AbsolutePressure MinimalCollapsingPressure=10;
        Physiolib.Types.RealIO.PressureInput externalPressure(start=
              ExternalPressure) if useExternalPressureInput annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,100}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={80,100})));

        Physiolib.Types.RealIO.MassOutput mass annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={110,-80}),iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,-100})));

      protected
        parameter Physiolib.Types.Pressure a=MinimalCollapsingPressure/log(
            Modelica.Constants.eps);

      public
        Chemical.Components.FluidAdapter_D fluidAdapter_D(nFluidPorts=
              nHydraulicPorts, redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{-36,-24},{-16,-4}})));
        Chemical.Components.Vessel vessel(
          stateOfMatter = Medium.stateOfMatter,
          useM0Input=useM0Input,
          ZeroPressureMass=ZeroPressureMass,
          CollapsingPressureMass=CollapsingPressureMass,
          useComplianceInput=useComplianceInput,
          Compliance=Compliance,
          useExternalPressureInput=useExternalPressureInput,
          ExternalPressure=ExternalPressure,
          MinimalCollapsingPressure=MinimalCollapsingPressure)
          annotation (
            Placement(transformation(extent={{-100,-100},{100,100}})));

        Chemical.Components.Substance substance[Medium.nC](
          redeclare package stateOfMatter = Chemical.Interfaces.Incompressible,
          substanceData=Medium.substanceData,
          amountOfSubstance_start=(concentration_start/Medium.density( Medium.setState_pTX(101325,310,zeros(Medium.nC))))*
              mass_start)
          annotation (Placement(transformation(extent={{-74,-24},{-54,-4}})));
      equation

        if useM0Input then
          connect(zeroPressureMass,vessel.zeroPressureMass);
        end if;
        if useComplianceInput then
          connect(compliance,vessel.compliance);
        end if;
        if useExternalPressureInput then
          connect(externalPressure,vessel.externalPressure);
        end if;
        /* 
  excessVolume = max( 0, volume - zpv);

 for i in 1:nHydraulicPorts loop
    q_in[i].p =
    smooth(0,
      if noEvent(volume>CollapsingPressureVolume) then 
        (excessVolume/c + ep)
      else 
        (a*log(max(Modelica.Constants.eps,volume/CollapsingPressureVolume)) + ep));
        end for;
   */

        //then: normal physiological state
        //else: abnormal collapsing state

        //Collapsing state: the max function prevents the zero or negative input to logarithm, the logarithm brings more negative pressure for smaller volume
        //However this collapsing is limited with numerical precission, which is reached relatively soon.

        //state = volume; // der(volume) =  q_in.q;
        //change = q_in.m_flow*ones(nHyrdaulicPorts);

       // assert(volume>=-Modelica.Constants.eps,"Collapsing of vessels are not supported!");
        connect(q_in,fluidAdapter_D. fluidPorts)
          annotation (Line(points={{4,-14},{-16,-14}}, color={238,46,47}));
        connect(substance.port_a,fluidAdapter_D. substances)
          annotation (Line(points={{-54,-14},{-36,-14}}, color={158,66,200}));
        for i in 1:Medium.nC loop
          connect(vessel.solution, substance[i].solution) annotation (Line(points=
               {{60,-98},{-70,-98},{-70,-24}}, color={127,127,0}));
        end for;
        connect(fluidAdapter_D.solution, vessel.solution) annotation (Line(
              points={{-30,-17},{-30,-98},{60,-98}}, color={127,127,0}));
        connect(vessel.fluidMass, mass) annotation (Line(points={{100,-80},{110,-80}},
                          color={0,0,127}));
       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={Text(
                extent={{-318,-140},{160,-100}},
                lineColor={127,0,0},
                textString="%name")}),         Documentation(revisions="<html>
<p><i>2017-2018</i>Marek Matejak, http://www.physiolib.com</p>
</html>",   info="<html>
<p>Pressure can be generated by an elastic tissue surrounding some accumulated volume. Typically there is a threshold volume, below which the relative pressure is equal to external pressure and the wall of the blood vessels is not stressed. But if the volume rises above this value, the pressure increases proportionally. The slope in this pressure-volume characteristic is called &ldquo;Compliance&rdquo;.</p>
<ul>
<li>Increassing volume above ZeroPressureVolume (V0) generate positive pressure (greater than external pressure) lineary dependent on excess volume.</li>
<li>Decreasing volume below CollapsingPressureVolume (V00) generate negative pressure (lower than external pressure) logarithmicaly dependent on volume.</li>
<li>Otherwise external pressure is presented as pressure inside ElasticVessel.</li>
</ul>
<p><br><img src=\"modelica://Physiolib/Resources/Images/UserGuide/ElasticVessel_PV.png\"/></p>
</html>"));
      end ElasticVessel;

      model ElasticVesselElastance
        extends Physiolib.Fluid.Components.ElasticVessel(final Compliance=1/
              Elastance);
        parameter Physiolib.Types.HydraulicElastance Elastance = 1
          "Elastance if useComplianceInput=false" annotation (Dialog(enable=not useComplianceInput));
      end ElasticVesselElastance;

      model HydrostaticColumn
        "Hydrostatic column pressure between two connectors (with specific muscle pump effect)"
        extends Physiolib.Icons.HydrostaticGradient;
        Physiolib.Fluid.Interfaces.FluidPort_a q_up "Top site" annotation (
            Placement(transformation(extent={{86,26},{114,54}}),
              iconTransformation(extent={{86,26},{114,54}})));
        Physiolib.Fluid.Interfaces.FluidPort_a q_down "Bottom site" annotation (
           Placement(transformation(extent={{84,-56},{112,-28}}),
              iconTransformation(extent={{84,-56},{112,-28}})));
        parameter Boolean useHeightInput = false "=true, if height input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
        parameter Physiolib.Types.Height H=0
          "Height of hydrostatic column if useHeightInput=false"
          annotation (Dialog(enable=not useFlowInput));

        Physiolib.Types.RealIO.HeightInput height(start=H)=h if
          useHeightInput "Vertical distance between top and bottom connector"
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                origin={-110,0}), iconTransformation(extent={{-130,-20},{-90,20}})));
        parameter Modelica.SIunits.Density ro=1060; //liquid density
        parameter Boolean useExternalG = false
          "=true, if external gravity acceleration is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
        parameter Physiolib.Types.Acceleration GravityAcceleration=9.81
          "Gravity acceleration if useExternalG=false"
          annotation (Dialog(enable=not useExternalG));
         //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.
        Physiolib.Types.RealIO.AccelerationInput G(start=
              GravityAcceleration)=g if useExternalG "Gravity acceleration"
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={0,-100})));
        parameter Boolean usePumpEffect = false
          "=true, if musce pump effect is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
        Physiolib.Types.RealIO.FractionInput pumpEffect(start=PumpEffect)=
          pe if usePumpEffect annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
      protected
        parameter Physiolib.Types.Fraction PumpEffect=1
          "Pump effect if usePumpEffect=false"
          annotation (Dialog(enable=not usePumpEffect));
      protected
        Physiolib.Types.Acceleration g;
        Physiolib.Types.Fraction pe;
        Physiolib.Types.Height h;
      equation
        if not useHeightInput then
          h=H;
        end if;
        if not useExternalG then
          g=GravityAcceleration;
        end if;
        if not usePumpEffect then
          pe = PumpEffect;
       end if;
        q_down.p = q_up.p + g*ro*h*pe;
        q_up.m_flow + q_down.m_flow = 0;

        q_up.h_outflow = inStream(q_down.h_outflow);
        q_up.Xi_outflow = inStream(q_down.Xi_outflow);
        q_up.C_outflow = inStream(q_down.C_outflow);

        q_down.h_outflow = inStream(q_up.h_outflow);
        q_down.Xi_outflow = inStream(q_up.Xi_outflow);
        q_down.C_outflow = inStream(q_up.C_outflow);
       annotation (
          Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",   info="<html>
<p>The hydrostatic pressure is proportional to height of the column.&nbsp;</p>
</html>"));
      end HydrostaticColumn;

      model Inertia "Inertia of the volumetric flow"
        extends Physiolib.Fluid.Interfaces.OnePort;
        extends Physiolib.Icons.Inertance;
        parameter Physiolib.Types.MassFlowRate massFlow_start=0.3
          "Volumetric flow start value"
          annotation (Dialog(group="Initialization"));                                                           //5 l/min is normal volumetric flow in aorta

        parameter Physiolib.Types.HydraulicInertance I "Inertance";

      equation
        I*der(q_in.m_flow) = (q_in.p - q_out.p);
        annotation (                Documentation(info="<html>
<p>Inertance I of the simple tube could be calculated as I=ro*l/A, where ro is fuid density, l is tube length and A is tube cross-section area.</p>
</html>",   revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>"));
      end Inertia;

      model IdealValve
        extends Icons.IdealValve;
        extends Physiolib.Fluid.Interfaces.OnePort;
         Boolean open(start=true) "Switching state";
         Real passableVariable(start=0, final unit="1")
          "Auxiliary variable for actual position on the ideal diode characteristic";
        /*  = 0: knee point
      < 0: below knee point, diode locking
      > 0: above knee point, diode conducting */
        parameter Physiolib.Types.HydraulicConductance _Gon(
          final min=0,
          displayUnit="l/(mmHg.min)")=1.2501026264094e-02
          "Forward state-on conductance (open valve conductance)"
          annotation (Dialog(enable=not useLimitationInputs)); //= the same as resistance 1e-5 mmHg/(l/min)
        parameter Physiolib.Types.HydraulicConductance _Goff(
          final min=0,
          displayUnit="l/(mmHg.min)")=1.2501026264094e-12
          "Backward state-off conductance (closed valve conductance)"
          annotation (Dialog(enable=not useLimitationInputs)); //= 1e-5 (l/min)/mmHg
        parameter Physiolib.Types.Pressure Pknee(final min=0)=0
          "Forward threshold pressure";
        parameter Boolean useLimitationInputs = false
          "=true, if Gon and Goff are from inputs"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
        Physiolib.Types.RealIO.HydraulicConductanceInput Gon(start=_Gon)=
          gon if useLimitationInputs
          "open valve conductance = infinity for ideal case" annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-60,100})));
        Physiolib.Types.RealIO.HydraulicConductanceInput Goff(start=_Goff)=
          goff if useLimitationInputs
          "closed valve conductance = zero for ideal case" annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,100})));
      protected
        Physiolib.Types.HydraulicConductance gon;
        Physiolib.Types.HydraulicConductance goff;
        constant Physiolib.Types.Pressure unitPressure=1;
        constant Physiolib.Types.MassFlowRate unitFlow=1;
      equation
        if not useLimitationInputs then
          gon = _Gon;
          goff = _Goff;
        end if;
        open = passableVariable > Modelica.Constants.eps;
        dp = (passableVariable*unitFlow)*(if open then 1/gon else 1) + Pknee;
        massFlowRate = (passableVariable*unitPressure)*(if open then 1 else goff) + goff*Pknee;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),
                               graphics={
              Text(
                extent={{-188,-96},{196,-126}},
                lineColor={127,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={255,85,85},
                textString="%name")}),
          Documentation(info="<html>
<p>Ideal Valve allows a volumetric flow in one direction in case of pressure gradient is greater. </p>
</html>",   revisions="<html>
</html>"));
      end IdealValve;

      model IdealValveResistance
        extends Physiolib.Fluid.Components.IdealValve(final _Gon=1/_Ron);
        parameter Physiolib.Types.HydraulicResistance _Ron = 79.993432449
          "forward state resistance";
      end IdealValveResistance;

      model Pump "Prescribed volumetric flow"
        extends Icons.Pump;
        extends Physiolib.Fluid.Interfaces.OnePort;
        extends Physiolib.Fluid.Interfaces.ConditionalSolutionFlow;
      equation
        massFlowRate = q;
       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={
              Text(
                extent={{-150,-90},{150,-50}},
                lineColor={127,0,0},
                textString="%name")}),         Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>Web:</td>
<td>http://www.physiolib.com</td>
</tr>
<tr>
<td>Date of:</td>
<td>october 2017</td>
</tr>
</table>
</html>",       info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
      end Pump;

      model Reabsorption "Divide inflow to outflow and reabsorption"
        import Physiolib;
        extends Physiolib.Icons.Reabsorption;

        Physiolib.Fluid.Interfaces.FluidPort_a Inflow
          annotation (Placement(transformation(extent={{-114,26},{-86,54}})));
        Physiolib.Fluid.Interfaces.FluidPort_b Outflow
          annotation (Placement(transformation(extent={{86,26},{114,54}})));
        Physiolib.Fluid.Interfaces.FluidPort_b Reabsorption
          annotation (Placement(transformation(extent={{-14,-114},{14,-86}})));
        Physiolib.Types.RealIO.FractionInput FractReab
          annotation (Placement(transformation(extent={{-100,-60},{-60,-20}})));
        parameter Boolean useExternalOutflowMin = false
          "=true, if minimal outflow is garanted"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
        parameter Physiolib.Types.MassFlowRate OutflowMin=0
          "Minimal outflow if useExternalOutflowMin=false"
          annotation (Dialog(enable=not useExternalOutflowMin));

        Physiolib.Types.RealIO.MassFlowRateInput outflowMin(start=
              OutflowMin)=om if useExternalOutflowMin annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={40,80})));
      protected
         Physiolib.Types.MassFlowRate om;
      equation
        if not useExternalOutflowMin then
          om = OutflowMin;
        end if;
        Inflow.p = Outflow.p;
        0 = Inflow.m_flow + Outflow.m_flow + Reabsorption.m_flow;
       // assert(Inflow.q>=-Modelica.Constants.eps,"Only one directional flow is supported!");
        Reabsorption.m_flow = -max(0,FractReab*(Inflow.m_flow-om));

      //Solve streams variable as in connection of all three connectors:
        0=Inflow.m_flow * Inflow.h_outflow
        + Outflow.m_flow * actualStream(Outflow.h_outflow)
        + Reabsorption.m_flow * actualStream(Reabsorption.h_outflow);
        0=Inflow.m_flow * actualStream(Inflow.h_outflow)
        + Outflow.m_flow * Outflow.h_outflow
        + Reabsorption.m_flow * actualStream(Reabsorption.h_outflow);
        0=Inflow.m_flow * actualStream(Inflow.h_outflow)
        + Outflow.m_flow * actualStream(Outflow.h_outflow)
        + Reabsorption.m_flow * Reabsorption.h_outflow;

        zeros(Inflow.Medium.nXi) =
         Inflow.m_flow * Inflow.Xi_outflow
        + Outflow.m_flow * actualStream(Outflow.Xi_outflow)
        + Reabsorption.m_flow * actualStream(Reabsorption.Xi_outflow);
        zeros(Outflow.Medium.nXi) =
         Inflow.m_flow * actualStream(Inflow.Xi_outflow)
        + Outflow.m_flow * Outflow.Xi_outflow
        + Reabsorption.m_flow * actualStream(Reabsorption.Xi_outflow);
        zeros(Reabsorption.Medium.nXi) =
         Inflow.m_flow * actualStream(Inflow.Xi_outflow)
        + Outflow.m_flow * actualStream(Outflow.Xi_outflow)
        + Reabsorption.m_flow * Reabsorption.Xi_outflow;

        zeros(Inflow.Medium.nC) =
         Inflow.m_flow * Inflow.C_outflow
        + Outflow.m_flow * actualStream(Outflow.C_outflow)
        + Reabsorption.m_flow * actualStream(Reabsorption.C_outflow);
        zeros(Outflow.Medium.nC) =
         Inflow.m_flow * actualStream(Inflow.C_outflow)
        + Outflow.m_flow * Outflow.C_outflow
        + Reabsorption.m_flow * actualStream(Reabsorption.C_outflow);
        zeros(Reabsorption.Medium.nC) =
         Inflow.m_flow * actualStream(Inflow.C_outflow)
        + Outflow.m_flow * actualStream(Outflow.C_outflow)
        + Reabsorption.m_flow * Reabsorption.C_outflow;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                  {100,100}}),       graphics={Text(
                extent={{-100,130},{100,108}},
                lineColor={127,0,0},
                textString="%name")}),        Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>",       info="<html>
<p><h4><font color=\"#008000\">Hydraulic Reabsorption</font></h4></p>
<p>If useOutflowMin=false then the next schema is used.</p>
<p><ul>
<li><img src=\"modelica://Physiolib/Resources/Images/UserGuide/HydraulicReabsorption.png\"/></li>
</ul></p>
<p><br/>If  useOutflowMin=true then the extended schema is used:</p>
<p><ul>
<li><img src=\"modelica://Physiolib/Resources/Images/UserGuide/HydraulicReabsorptionWithOutflowMin.png\"/></li>
</ul></p>
</html>"));
      end Reabsorption;

      model ElasticMembrane "Interaction between internal and external cavities"
      /* extends Physiolib.SteadyStates.Interfaces.SteadyState(state_start=
        volume_start, storeUnit="ml");
 extends Physiolib.Icons.InternalElasticBalloon;
  Physiolib.Hydraulic.Interfaces.HydraulicPort_a q_int
    "Internal space"
    annotation (Placement(transformation(extent={{-94,-14},{-66,14}})));
  Physiolib.Hydraulic.Interfaces.HydraulicPort_b q_ext
    "External space"
    annotation (Placement(transformation(extent={{26,-14},{54,14}})));
 parameter Physiolib.Types.HydraulicCompliance Compliance
    "Compliance";
 parameter Physiolib.Types.Volume zeroPressureVolume=0
    "Maximal volume, that does not generate pressure";
 parameter Physiolib.Types.Volume volume_start=0 "Volume start value"
    annotation (Dialog(group="Initialization"));
 Physiolib.Types.Volume volume;
 Physiolib.Types.Volume stressedVolume;

 parameter Physiolib.Types.Volume NominalVolume=1e-6
    "Scale numerical calculation from quadratic meter to miniliters.";
equation 
  q_int.m_flow + q_ext.m_flow = 0;
  q_int.p = (stressedVolume/Compliance) + q_ext.p;
  stressedVolume = max(volume-zeroPressureVolume,0);
  state = volume; // der(volume) =  q_int.q;
  change = q_int.m_flow;
  // assert(volume>=-Modelica.Constants.eps,"Totally collapsed compartments are not supported!");
  annotation (        Documentation(revisions="<html>
<p><i>2017-2018</i></p>
<p>Marek Matejak, http://www.physiolib.com </p>
</html>")); */
      end ElasticMembrane;

    end Components;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;
      connector FluidPort =     Modelica.Fluid.Interfaces.FluidPort (
        redeclare package Medium = Physiolib.Media.BaseMedium_C);
      connector FluidPort_a "Hydraulical inflow connector"
        extends FluidPort;
        annotation (defaultComponentName="port_a",
                    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Ellipse(
                extent={{-40,40},{40,-40}},
                lineColor={0,0,0},
                fillColor={127,0,0},
                fillPattern=FillPattern.Solid), Text(extent={{-150,110},{150,50}},
                  textString="%name")}),
             Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                  100,100}}), graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={127,0,0},
                fillColor={127,0,0},
                fillPattern=FillPattern.Solid,
                lineThickness=0.5),             Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={127,0,0},
                fillPattern=FillPattern.Solid)}),
          Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>", revisions="<html>
<p><i>2017</i></p>
<p>Marek Matejak, marek@matfyz.cz </p>
</html>"));
      end FluidPort_a;

      connector FluidPort_b "Hydraulical outflow connector"
        extends FluidPort;
        annotation (defaultComponentName="port_b",
                    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={
              Ellipse(
                extent={{-40,40},{40,-40}},
                lineColor={0,0,0},
                fillColor={127,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-30,30},{30,-30}},
                lineColor={127,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(extent={{-150,110},{150,50}}, textString="%name")}),
             Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                  100,100}}), graphics={
              Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={127,0,0},
                fillColor={127,0,0},
                fillPattern=FillPattern.Solid,
                lineThickness=0.5),
              Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={127,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-80,80},{80,-80}},
                lineColor={127,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}));
      end FluidPort_b;

      connector FluidPorts_a
        "Fluid connector with filled, large icon to be used for vectors of FluidPorts (vector dimensions must be added after dragging)"
      extends FluidPort;
      annotation (defaultComponentName="ports_a",
                  Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-50,-200},{50,200}},
            initialScale=0.2), graphics={
            Text(extent={{-75,130},{75,100}}, textString="%name"),
            Rectangle(
              extent={{25,-100},{-25,100}},
              lineColor={127,0,0}),
            Ellipse(
              extent={{-25,90},{25,40}},
              lineColor={0,0,0},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-25,25},{25,-25}},
              lineColor={0,0,0},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-25,-40},{25,-90}},
              lineColor={0,0,0},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid)}),
           Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-50,-200},{50,200}},
            initialScale=0.2), graphics={
            Rectangle(
              extent={{50,-200},{-50,200}},
              lineColor={127,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
                lineThickness=0.5),
            Ellipse(
              extent={{-50,180},{50,80}},
              lineColor={0,0,0},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,50},{50,-50}},
              lineColor={0,0,0},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-50,-80},{50,-180}},
              lineColor={0,0,0},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid)}));
      end FluidPorts_a;

      partial model OnePort "Hydraulical OnePort"
        FluidPort_a q_in "Inflow"
          annotation (Placement(transformation(extent={{-114,-14},{-86,14}})));
        FluidPort_b q_out "Outflow"
          annotation (Placement(transformation(extent={{86,-14},{114,14}})));
         Physiolib.Types.MassFlowRate massFlowRate "Mass flow";
         Physiolib.Types.Pressure dp "Pressure gradient";
      equation
        q_in.m_flow + q_out.m_flow = 0;
        massFlowRate = q_in.m_flow;
        dp = q_in.p - q_out.p;

        q_in.h_outflow = inStream(q_out.h_outflow);
        q_in.Xi_outflow = inStream(q_out.Xi_outflow);
        q_in.C_outflow = inStream(q_out.C_outflow);

        q_out.h_outflow = inStream(q_in.h_outflow);
        q_out.Xi_outflow = inStream(q_in.Xi_outflow);
        q_out.C_outflow = inStream(q_in.C_outflow);
      end OnePort;

      partial model ConditionalSolutionFlow
        "Input of solution mass flow vs. parametric solution mass flow"

        parameter Boolean useSolutionFlowInput = false
          "=true, if solution flow input is used instead of parameter SolutionFlow"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolib.Types.MassFlowRate SolutionFlow=0
          "Mass flow of solution if useSolutionFlowInput=false"
          annotation (HideResult=not useSolutionFlowInput, Dialog(enable=not
                useSolutionFlowInput));

        Physiolib.Types.RealIO.MassFlowRateInput solutionFlow(start=
              SolutionFlow)=q if useSolutionFlowInput annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,70})));

        Physiolib.Types.MassFlowRate q "Current solution flow";
      equation
        if not useSolutionFlowInput then
          q = SolutionFlow;
        end if;

      end ConditionalSolutionFlow;
    end Interfaces;

    package Sensors
      extends Modelica.Icons.SensorsPackage;
      model FlowMeasure "Volumetric flow between ports"
        extends Physiolib.Fluid.Interfaces.OnePort;
        //extends Icons.FlowMeasure;
        extends Modelica.Icons.RotationalSensor;

        Physiolib.Types.RealIO.MassFlowRateOutput massFlow
          "Actual mass flow rate" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={0,120})));
      equation
        q_out.p = q_in.p;
        massFlow = q_in.m_flow;
        annotation (
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),       Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),
                               graphics={
              Line(
                points={{-60,80},{80,80},{62,60}},
                color={0,0,255}),
              Line(
                points={{62,100},{80,80}},
                color={0,0,255}),
              Text(
                extent={{-25,-11},{34,-70}},
                lineColor={0,0,0},
                textString="V'")}));
      end FlowMeasure;

      model PressureMeasure "Hydraulic pressure at port"
        extends Physiolib.Icons.PressureMeasure;

        outer Modelica.Fluid.System system "System wide properties";

        Physiolib.Fluid.Interfaces.FluidPort_a q_in
          annotation (Placement(transformation(extent={{-60,-80},{-20,-40}})));
        Physiolib.Types.RealIO.PressureOutput pressure "Pressure"
          annotation (Placement(transformation(extent={{40,-60},{80,-20}})));
      equation
        pressure = q_in.p - system.p_ambient;
        q_in.m_flow = 0;

        q_in.h_outflow = 0;
        q_in.Xi_outflow = zeros(q_in.Medium.nXi);
        q_in.C_outflow = zeros(q_in.Medium.nC);

       annotation (
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end PressureMeasure;
    end Sensors;

    package Sources
      extends Modelica.Icons.SourcesPackage;
      model UnlimitedPump "Prescribed flow at port"
        extends Physiolib.Fluid.Interfaces.ConditionalSolutionFlow;

        parameter Modelica.SIunits.SpecificEnthalpy h=q_out.Medium.h_default "Fluid enthalphy";
        parameter Modelica.SIunits.MassFraction X[q_out.Medium.nXi]=q_out.Medium.X_default "Mass fractions of fluid";
        parameter Real C[q_out.Medium.nC]=q_out.Medium.C_default "Extra properties of fluid";

        Physiolib.Fluid.Interfaces.FluidPort_b q_out
          annotation (Placement(transformation(extent={{86,-14},{114,14}})));
      equation
        q_out.m_flow = - q;

        q_out.h_outflow = h;
        q_out.Xi_outflow = X;
        q_out.C_outflow = C;
       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,-94},{150,-54}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",       info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
      end UnlimitedPump;

        model UnlimitedVolume "Prescribed pressure at port"
          parameter Boolean usePressureInput = false
          "=true, if pressure input is used"
            annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

          parameter Physiolib.Types.Pressure P=y.Medium.p_default
          "Hydraulic pressure if usePressureInput=false"
          annotation (Dialog(enable=not usePressureInput));

          Physiolib.Types.RealIO.PressureInput pressure(start=P)=p if
          usePressureInput "Pressure"
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Physiolib.Fluid.Interfaces.FluidPort_a y
          "PressureFlow output connectors"
          annotation (Placement(transformation(extent={{84,-16},{116,16}})));

          parameter Modelica.SIunits.SpecificEnthalpy h=y.Medium.h_default "Fluid enthalphy";
          parameter Modelica.SIunits.MassFraction X[y.Medium.nXi]=y.Medium.X_default "Mass fractions of fluid";
          parameter Real C[y.Medium.nC]=y.Medium.C_default "Extra properties of fluid";
      protected
          Physiolib.Types.Pressure p;

        equation
          if not usePressureInput then
            p=P;
          end if;
          y.p = p;

          y.h_outflow = h;
          y.Xi_outflow = X;
          y.C_outflow = C;

          annotation (Documentation(info="<html>
<p>Model has a vector of continuous Real input signals as pressures for vector of pressure-flow connectors. </p>
<p>Usage in tests: Set defaul volume&gt;0 and try to set STEADY in instances to &quot;false&quot;!</p>
</html>",  revisions=
             "<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}),
                            graphics={
                Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                pattern=LinePattern.None,
                fillColor={170,255,255},
                fillPattern=FillPattern.Backward),
                Text(
                  extent={{0,0},{-100,-100}},
                  lineColor={0,0,0},
                textString="P"),
                Line(
                  points={{-100,0},{56,0}},
                  color={191,0,0},
                  thickness=0.5),
                Polygon(
                  points={{38,-20},{38,20},{78,0},{38,-20}},
                  lineColor={191,0,0},
                  fillColor={191,0,0},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-150,150},{150,110}},
                  textString="%name",
                  lineColor={0,0,255})}));
        end UnlimitedVolume;

      model UnlimitedOutflowPump "Prescribed flow at port"
        extends Physiolib.Fluid.Interfaces.ConditionalSolutionFlow;
        Physiolib.Fluid.Interfaces.FluidPort_a q_in annotation (Placement(
              transformation(extent={{-114,-14},{-86,14}}), iconTransformation(
                extent={{-114,-14},{-86,14}})));

        parameter Modelica.SIunits.SpecificEnthalpy h=q_in.Medium.h_default "Fluid enthalphy";
        parameter Modelica.SIunits.MassFraction X[q_in.Medium.nXi]=q_in.Medium.X_default "Mass fractions of fluid";
        parameter Real C[q_in.Medium.nC]=q_in.Medium.C_default "Extra properties of fluid";
      equation
        q_in.m_flow = q;

        q_in.h_outflow = h;
        q_in.Xi_outflow = X;
        q_in.C_outflow = C;
       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                              graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,-94},{150,-54}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",       info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
      end UnlimitedOutflowPump;
    end Sources;

    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;

      model MinimalCirculation
        "Minimal circulation models driven by cardiac output"
         extends Modelica.Icons.Example;
        Physiolib.Fluid.Components.Pump heart(useSolutionFlowInput=true)
          annotation (Placement(transformation(extent={{-6,-50},{14,-30}})));
        Physiolib.Fluid.Components.ElasticVessel arteries(
          fluidAdapter_D(solution(T(start=310.15))),
          mass_start(displayUnit="kg") = 1,
          ZeroPressureMass(displayUnit="kg") = 0.85,
          nHydraulicPorts=2,
          vessel(redeclare package stateOfMatter =
                Chemical.Interfaces.Incompressible,
              temperature_start=310.15),
          Compliance(displayUnit="g/mmHg") = 1.1625954425608e-5,
          ExternalPressure(displayUnit="mmHg") = 101325.0144354)
          annotation (Placement(transformation(extent={{36,-84},{56,-64}})));
        Physiolib.Fluid.Components.Conductor resistance(Conductance(displayUnit="g/(mmHg.min)")=
               6.2755151845753e-6)
          annotation (Placement(transformation(extent={{-2,-90},{18,-70}})));
        Physiolib.Fluid.Components.ElasticVessel veins(
          fluidAdapter_D(solution(T(start=310.15))),
          ZeroPressureMass(displayUnit="kg") = 2.95,
          mass_start(displayUnit="kg") = 3.2,
          nHydraulicPorts=2,
          vessel(redeclare package stateOfMatter =
                Chemical.Interfaces.Incompressible,
              temperature_start=310.15),
          Compliance(displayUnit="g/mmHg") = 0.00061880080007267,
          ExternalPressure=101325.0144354)
          annotation (Placement(transformation(extent={{-42,-84},{-22,-64}})));
        Modelica.Blocks.Sources.Pulse pulse(
          width=25,
          period=60/75,
          amplitude=3.3e-1)
          annotation (Placement(transformation(extent={{-94,74},{-74,94}})));
      equation
        connect(pulse.y, heart.solutionFlow) annotation (Line(
            points={{-73,84},{-62,84},{-62,-26},{4,-26},{4,-33}},
            color={0,0,127}));
        connect(heart.q_out, arteries.q_in[1]) annotation (Line(
            points={{14,-40},{45.7,-40},{45.7,-72.7}},
            color={127,0,0},
            thickness=0.5));
        connect(resistance.q_out, arteries.q_in[2]) annotation (Line(
            points={{18,-80},{30,-80},{30,-75.3},{45.7,-75.3}},
            color={127,0,0},
            thickness=0.5));
        connect(veins.q_in[1], heart.q_in) annotation (Line(
            points={{-32.3,-72.7},{-32,-72.7},{-32,-40},{-6,-40}},
            color={127,0,0},
            thickness=0.5));
        connect(veins.q_in[2], resistance.q_in) annotation (Line(
            points={{-32.3,-75.3},{-18,-75.3},{-18,-80},{-2,-80}},
            color={127,0,0},
            thickness=0.5));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={                          Text(
                extent={{-40,-12},{80,-22}},
                lineColor={175,175,175},
                textString="Minimal circulation driven by cardiac output")}),
            Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=10));
      end MinimalCirculation;

      model Windkessel_2element "Two-element Windkessel model"
        extends Modelica.Icons.Example;
        Physiolib.Fluid.Components.ElasticVessel arteries(
          ZeroPressureMass(displayUnit="kg") = 0.85,
          mass_start(displayUnit="kg") = 0.97,
          nHydraulicPorts=2,
          redeclare package Medium = Media.BaseMedium_C,
          Compliance(displayUnit="g/mmHg") = 1.0500862061839e-5)
          annotation (Placement(transformation(extent={{-12,38},{8,58}})));
        Physiolib.Fluid.Components.Conductor resistance(useConductanceInput=false,
            Conductance(displayUnit="g/(mmHg.s)") = 8.1006650191331e-6)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={18,34})));
        Utilities.Pulses pulses(QP(displayUnit="kg/s")=
               0.424, HR=1.2)
          annotation (Placement(transformation(extent={{-80,58},{-60,78}})));
        Sources.UnlimitedPump unlimitedPump(useSolutionFlowInput=true)
          annotation (Placement(transformation(extent={{-48,38},{-28,58}})));
        Sources.UnlimitedVolume unlimitedVolume
          annotation (Placement(transformation(extent={{-56,0},{-36,20}})));
      equation
        connect(arteries.q_in[1], resistance.q_in) annotation (Line(
            points={{-2.3,49.3},{18,49.3},{18,44}},
            color={127,0,0},
            thickness=0.5));
        connect(pulses.massflowrate, unlimitedPump.solutionFlow) annotation (
            Line(points={{-61,68},{-38,68},{-38,55}}, color={0,0,127}));
        connect(unlimitedPump.q_out, arteries.q_in[2]) annotation (Line(
            points={{-28,48},{-16,48},{-16,46.7},{-2.3,46.7}},
            color={127,0,0},
            thickness=0.5));
        connect(unlimitedVolume.y, resistance.q_out) annotation (Line(
            points={{-36,10},{20,10},{20,24},{18,24}},
            color={127,0,0},
            thickness=0.5));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                    extent={{-74,90},{46,80}},
                    lineColor={175,175,175},
                    textString="2-element Windkessel model")}),
          Documentation(revisions="<html>
<ul>
<li><i>Sep 2014</i> by Tomas Kulhanek:
<br/>Updated pulse generator and diagram to conform electric analogy diagrams.
</li>
<li><i>May 2014 </i> by Marek Matejak:
<br/>Created.
</li>
</ul>
</html>",   info="<html>
<p>Two-element windkessel model consisting of resistance and compliance element.</p>
<ul>
<li>Frank O (1899) Die Grundform des arteriellen Pulses. Z Biol 37:483&ndash;526</li>
<li>Westerhof, N., Lankhaar, J.-W., &amp; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &amp; Biological Engineering &amp; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
<li><a href=\"http://en.wikipedia.org/wiki/Windkessel_effect\">http://en.wikipedia.org/wiki/Windkessel_effect</a></li>
</ul>
</html>"),experiment(StopTime=5));
      end Windkessel_2element;

      model Windkessel_3element "Three-element windkessel model"
        extends Modelica.Icons.Example;
        Physiolib.Fluid.Sources.UnlimitedPump heart(useSolutionFlowInput=true)
          annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
        Physiolib.Fluid.Components.ElasticVessel arteries(
          ZeroPressureMass(displayUnit="kg") = 0.85,
          Compliance(displayUnit="g/mmHg") = 1.0500862061839e-05,
          mass_start(displayUnit="kg") = 0.97,
          nHydraulicPorts=2)
          annotation (Placement(transformation(extent={{16,38},{36,58}})));
        Physiolib.Fluid.Components.Conductor resistance(useConductanceInput=false,
            Conductance(displayUnit="g/(mmHg.s)") = 8.1006650191331e-06)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={50,34})));
        Physiolib.Fluid.Sources.UnlimitedVolume veins annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}, origin={-40,20})));
        Utilities.Pulses pulses(
          QP(displayUnit="kg/s") = 0.424,
          TD1(displayUnit="s"),
          HR(displayUnit="1/min") = 1.2)
          annotation (Placement(transformation(extent={{-64,58},{-44,78}})));
        Physiolib.Fluid.Components.Conductor impedance(useConductanceInput=false,
            Conductance(displayUnit="g/(mmHg.s)") = 1.5001231516913e-03)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                origin={-6,50})));
      equation
        connect(resistance.q_out, veins.y) annotation (Line(
            points={{50,24},{50,20},{-30,20}},
            thickness=1));
        connect(pulses.massflowrate, heart.solutionFlow) annotation (Line(
            points={{-45,68},{-40,68},{-40,55}},
            color={0,0,127}));
        connect(heart.q_out, impedance.q_in) annotation (Line(
            points={{-30,48},{-24,48},{-24,50},{-16,50}},
            thickness=1));
        connect(impedance.q_out, arteries.q_in[1]) annotation (Line(
            points={{4,50},{16,50},{16,49.3},{25.7,49.3}},
            color={127,0,0},
            thickness=0.5));
        connect(arteries.q_in[2], resistance.q_in) annotation (Line(
            points={{25.7,46.7},{50,46.7},{50,44}},
            color={127,0,0},
            thickness=0.5));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                    extent={{-74,90},{46,80}},
                    lineColor={175,175,175},
                    textString="3-element Windkessel model")}),
          Documentation(revisions="<html>
<ul>
<li><i>Sep 2014</i> by Tomas Kulhanek: <br>Created. </li>
</ul>
<p> </p>
</html>",   info="<html>
<p>Three-element windkessel model, updated two-element windkessel model with an impedance element. Impedance can be approximated by resistance.</p>
<ul>
<li>Westerhof N, Elzinga G (1991) Normalized input impedance and arterial decay time over heart period are independent of animal size. Am J Physiol 261:R126&ndash;R133</li>
<li>Westerhof, N., Lankhaar, J.-W., &amp; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &amp; Biological Engineering &amp; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
</ul>
</html>"),experiment(StopTime=5));
      end Windkessel_3element;

      model Windkessel_4element "Four-element windkessel model"
        extends Modelica.Icons.Example;
        Physiolib.Fluid.Sources.UnlimitedPump heart(useSolutionFlowInput=true)
          annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
        Physiolib.Fluid.Components.ElasticVessel arteries(
          ZeroPressureMass(displayUnit="kg") = 0.85,
          Compliance(displayUnit="g/mmHg") = 1.0500862061839e-05,
          mass_start(displayUnit="kg") = 0.97,
          nHydraulicPorts=3)
          annotation (Placement(transformation(extent={{16,38},{36,58}})));
        Physiolib.Fluid.Components.Conductor resistance(useConductanceInput=false,
            Conductance(displayUnit="g/(mmHg.s)") = 8.1006650191331e-06)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={48,34})));
        Physiolib.Fluid.Sources.UnlimitedVolume veins annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}, origin={-40,20})));
        Utilities.Pulses pulses(QP(displayUnit="kg/s")=
               0.424, HR=1.2)
          annotation (Placement(transformation(extent={{-64,58},{-44,78}})));
        Physiolib.Fluid.Components.Conductor impedance(useConductanceInput=false,
            Conductance(displayUnit="g/(mmHg.s)") = 1.5001231516913e-03)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                origin={-6,48})));
        Physiolib.Fluid.Components.Inertia inertia(I(displayUnit="mmHg.s2/g")=
               666.611937075, massFlow_start(displayUnit="kg/min") = 8.3333333333333e-02)
          annotation (Placement(transformation(extent={{-16,56},{4,76}})));
      equation
        connect(resistance.q_out, veins.y) annotation (Line(
            points={{48,24},{48,20},{-30,20}},
            thickness=1));
        connect(pulses.massflowrate, heart.solutionFlow) annotation (Line(
            points={{-45,68},{-40,68},{-40,55}},
            color={0,0,127}));
        connect(heart.q_out, impedance.q_in) annotation (Line(
            points={{-30,48},{-16,48}},
            thickness=1));
        connect(heart.q_out, inertia.q_in) annotation (Line(
            points={{-30,48},{-26,48},{-26,66},{-16,66}},
            thickness=1));
        connect(inertia.q_out, arteries.q_in[1]) annotation (Line(
            points={{4,66},{16,66},{16,49.7333},{25.7,49.7333}},
            color={127,0,0},
            thickness=0.5));
        connect(impedance.q_out, arteries.q_in[2]) annotation (Line(
            points={{4,48},{16,48},{16,48},{25.7,48}},
            color={127,0,0},
            thickness=0.5));
        connect(arteries.q_in[3], resistance.q_in) annotation (Line(
            points={{25.7,46.2667},{48,46.2667},{48,44}},
            color={127,0,0},
            thickness=0.5));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                    extent={{-74,90},{46,80}},
                    lineColor={175,175,175},
                    textString="4-element Windkessel model")}),
          Documentation(revisions="<html>
<ul>
<li><i>Sep 2014</i> by Tomas Kulhanek: <br>Created. </li>
</ul>
</html>",   info="<html>
<p>Four-element windkessel model, updated three-element windkessel model with an inertia element. </p>
<ul>
<li>Stergiopulos N, Westerhof BE, Westerhof N (1999) Total arterial inertance as the fourth element of the windkessel model. Am J Physiol 276:H81&ndash;H88</li>
<li>Westerhof, N., Lankhaar, J.-W., &amp; Westerhof, B. E. (2009). The arterial Windkessel. <i>Medical &amp; Biological Engineering &amp; Computing</i>, <i>47</i>(2), 131&ndash;41. doi:10.1007/s11517-008-0359-2</li>
</ul>
</html>"),experiment(StopTime=5));
      end Windkessel_4element;

      model CardiovascularSystem_GCG
        "Cardiovascular part of Guyton-Coleman-Granger's model from 1972"
         extends Modelica.Icons.Example;
         import Hydraulic = Physiolib.Fluid;
        Hydraulic.Components.ElasticVessel pulmonaryVeinsAndLeftAtrium(
          mass_start(displayUnit="kg") = 0.4,
          ZeroPressureMass(displayUnit="kg") = 0.4,
          Compliance(displayUnit="kg/mmHg") = 7.5006157584566e-05,
          nHydraulicPorts=3)
          annotation (Placement(transformation(extent={{4,74},{24,94}})));
        Hydraulic.Components.ElasticVessel pulmonaryArteries(
          ZeroPressureMass(displayUnit="kg") = 0.30625,
          Compliance(displayUnit="kg/mmHg") = 3.6002955640592e-05,
          mass_start(displayUnit="kg") = 0.38,
          nHydraulicPorts=2)
          annotation (Placement(transformation(extent={{-62,74},{-42,94}})));
        Hydraulic.Components.Conductor
                 pulmonary(Conductance(displayUnit="kg/(mmHg.min)") = 4.1665920538226e-05)
          annotation (Placement(transformation(extent={{-30,74},{-10,94}})));
        Hydraulic.Components.ElasticVessel arteries(
          mass_start(displayUnit="kg") = 0.85,
          ZeroPressureMass(displayUnit="kg") = 0.495,
          Compliance(displayUnit="kg/mmHg") = 2.6627185942521e-05,
          nHydraulicPorts=4)
          annotation (Placement(transformation(extent={{14,-46},{34,-26}})));
        Hydraulic.Components.ElasticVessel veins(
          Compliance(displayUnit="kg/mmHg") = 6.1880080007267e-04,
          mass_start(displayUnit="kg") = 3.25,
          ZeroPressureMass(displayUnit="kg") = 2.95,
          nHydraulicPorts=4)
          annotation (Placement(transformation(extent={{-64,-46},{-44,-26}})));
        Hydraulic.Components.Conductor
                 nonMuscle(Conductance(displayUnit="kg/(mmHg.min)") = 3.5627924852669e-06)
          annotation (Placement(transformation(extent={{-24,-46},{-4,-26}})));
        Hydraulic.Sensors.PressureMeasure pressureMeasure
          annotation (Placement(transformation(extent={{-78,26},{-58,46}})));
        Hydraulic.Components.Pump rightHeart(useSolutionFlowInput=true)
          annotation (Placement(transformation(extent={{-56,8},{-36,28}})));
        Physiolib.Types.Constants.MassFlowRateConst RNormalCO(k(displayUnit=
                "kg/min") = 0.083333333333333)
          annotation (Placement(transformation(extent={{-60,40},{-52,48}})));
        Hydraulic.Sensors.PressureMeasure pressureMeasure1
          annotation (Placement(transformation(extent={{-8,26},{12,46}})));
        Hydraulic.Components.Pump leftHeart(useSolutionFlowInput=true)
          annotation (Placement(transformation(extent={{16,6},{36,26}})));
        Physiolib.Types.Constants.MassFlowRateConst LNormalCO(k(displayUnit=
                "kg/min") = 0.083333333333333)
          annotation (Placement(transformation(extent={{12,42},{20,50}})));
        Hydraulic.Components.Conductor
                 kidney(Conductance(displayUnit="kg/(mmHg.min)") = 1.4126159678427e-06)
          annotation (Placement(transformation(extent={{-24,-64},{-4,-44}})));
        Hydraulic.Components.Conductor
                 muscle(Conductance(displayUnit="kg/(mmHg.min)") = 1.3001067314658e-06)
          annotation (Placement(transformation(extent={{-24,-28},{-4,-8}})));
        Hydraulic.Components.Conductor
                 largeVeins(Conductance(displayUnit="kg/(mmHg.min)") = 1.6888886482791e-04)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-84,-8})));
        Hydraulic.Components.ElasticVessel rightAtrium(
          mass_start(displayUnit="kg") = 0.1,
          ZeroPressureMass(displayUnit="kg") = 0.1,
          Compliance(displayUnit="kg/mmHg") = 3.7503078792283e-05,
          nHydraulicPorts=3)
          annotation (Placement(transformation(extent={{-82,8},{-62,28}})));
        Physiolib.Blocks.Factors.Spline rightStarling(data={{-6,0,0},{-3,
              0.15,0.104},{-1,0.52,0.48},{2,1.96,0.48},{4,2.42,0.123},{8,2.7,0}},
            Xscale=101325/760)
          "At filling pressure 0mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
          annotation (Placement(transformation(extent={{-56,22},{-36,42}})));
        Physiolib.Blocks.Factors.Spline leftStarling(data={{-4,0,0},{-1,
              0.72,0.29},{0,1.01,0.29},{3,1.88,0.218333},{10,2.7,0}}, Xscale=
              101325/760)
          "At filling pressure -0.0029mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
          annotation (Placement(transformation(extent={{16,22},{36,42}})));
        inner Modelica.Fluid.System system
          annotation (Placement(transformation(extent={{68,62},{88,82}})));
      equation
        connect(RNormalCO.y, rightStarling.yBase) annotation (Line(
            points={{-51,44},{-46,44},{-46,34}},
            color={0,0,127}));
        connect(LNormalCO.y, leftStarling.yBase) annotation (Line(
            points={{21,46},{26,46},{26,34}},
            color={0,0,127}));
        connect(rightHeart.solutionFlow, rightStarling.y) annotation (Line(
            points={{-46,25},{-46,28},{-46,28}},
            color={0,0,127}));
        connect(leftStarling.y, leftHeart.solutionFlow) annotation (Line(
            points={{26,28},{26,23}},
            color={0,0,127}));
        connect(pressureMeasure.pressure, rightStarling.u) annotation (Line(
            points={{-62,32},{-54,32}},
            color={0,0,127}));
        connect(pressureMeasure1.pressure, leftStarling.u) annotation (Line(
            points={{8,32},{18,32}},
            color={0,0,127}));
        connect(rightHeart.q_out, pulmonaryArteries.q_in[1]) annotation (Line(
            points={{-36,18},{-30,18},{-30,60},{-82,60},{-82,85.3},{-52.3,85.3}},

            color={127,0,0},
            thickness=0.5));
        connect(pulmonary.q_in, pulmonaryArteries.q_in[2]) annotation (Line(
            points={{-30,84},{-42,84},{-42,82.7},{-52.3,82.7}},
            color={127,0,0},
            thickness=0.5));
        connect(pulmonary.q_out, pulmonaryVeinsAndLeftAtrium.q_in[1])
          annotation (Line(
            points={{-10,84},{2,84},{2,85.7333},{13.7,85.7333}},
            color={127,0,0},
            thickness=0.5));
        connect(pulmonaryVeinsAndLeftAtrium.q_in[2], leftHeart.q_in)
          annotation (Line(
            points={{13.7,84},{36,84},{36,60},{-12,60},{-12,16},{16,16}},
            color={127,0,0},
            thickness=0.5));
        connect(pressureMeasure1.q_in, pulmonaryVeinsAndLeftAtrium.q_in[3])
          annotation (Line(
            points={{-2,30},{-12,30},{-12,60},{36,60},{36,84},{13.7,84},{13.7,
                82.2667}},
            color={127,0,0},
            thickness=0.5));
        connect(leftHeart.q_out, arteries.q_in[1]) annotation (Line(
            points={{36,16},{54,16},{54,-34.05},{23.7,-34.05}},
            color={127,0,0},
            thickness=0.5));
        connect(muscle.q_out, arteries.q_in[2]) annotation (Line(
            points={{-4,-18},{10,-18},{10,-35.35},{23.7,-35.35}},
            color={127,0,0},
            thickness=0.5));
        connect(nonMuscle.q_out, arteries.q_in[3]) annotation (Line(
            points={{-4,-36},{10,-36},{10,-36.65},{23.7,-36.65}},
            color={127,0,0},
            thickness=0.5));
        connect(kidney.q_out, arteries.q_in[4]) annotation (Line(
            points={{-4,-54},{10,-54},{10,-37.95},{23.7,-37.95}},
            color={127,0,0},
            thickness=0.5));
        connect(muscle.q_in, veins.q_in[1]) annotation (Line(
            points={{-24,-18},{-40,-18},{-40,-34.05},{-54.3,-34.05}},
            color={127,0,0},
            thickness=0.5));
        connect(nonMuscle.q_in, veins.q_in[2]) annotation (Line(
            points={{-24,-36},{-40,-36},{-40,-35.35},{-54.3,-35.35}},
            color={127,0,0},
            thickness=0.5));
        connect(kidney.q_in, veins.q_in[3]) annotation (Line(
            points={{-24,-54},{-38,-54},{-38,-36.65},{-54.3,-36.65}},
            color={127,0,0},
            thickness=0.5));
        connect(veins.q_in[4], largeVeins.q_out) annotation (Line(
            points={{-54.3,-37.95},{-84,-37.95},{-84,-18}},
            color={127,0,0},
            thickness=0.5));
        connect(largeVeins.q_in, rightAtrium.q_in[1]) annotation (Line(
            points={{-84,2},{-86,2},{-86,19.7333},{-72.3,19.7333}},
            color={127,0,0},
            thickness=0.5));
        connect(rightAtrium.q_in[2], rightHeart.q_in) annotation (Line(
            points={{-72.3,18},{-64,18},{-64,18},{-56,18}},
            color={127,0,0},
            thickness=0.5));
        connect(rightAtrium.q_in[3], pressureMeasure.q_in) annotation (Line(
            points={{-72.3,16.2667},{-72,16.2667},{-72,30}},
            color={127,0,0},
            thickness=0.5));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                extent={{-82,-80},{80,-100}},
                lineColor={175,175,175},
                textString=
                    "Circulation part of Guyton-Coleman-Granger's model from 1972")}),
                                                Documentation(info="<html>
<p>Cardiovascular subsystem in famous Guyton-Coleman-Granger model from 1972. </p>
<p><br/>Model, all parameters and all initial values are from article: </p>
<p>A.C. Guyton, T.G. Coleman, H.J. Granger (1972). &quot;Circulation: overall regulation.&quot; Annual review of physiology 34(1): 13-44.</p>
</html>",   revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=300));
      end CardiovascularSystem_GCG;

      package Utilities "Utility components used by package Examples"
      extends Modelica.Icons.UtilitiesPackage;

        model Pulses "example pulse flow generator"
          import Physiolib.Types.*;
          Physiolib.Types.RealIO.MassFlowRateOutput massflowrate
            annotation (Placement(transformation(extent={{80,-10},{100,10}}),
                iconTransformation(extent={{80,-10},{100,10}})));
          discrete Time T0 "beginning of cardiac cycle";
          Boolean b(start=false);
          discrete Time HP "duration of cardiac cycle";
          parameter Frequency HR=1.2;
          Time tc "relative time in carciac cycle";
          parameter Time TD1=0.07 "relative time of start of systole";
          discrete Time TD2 "relative time of end of systole";
          parameter MassFlowRate QP=0.424 "peak mass flowrate";
        equation
          b = time - pre(T0) >= pre(HP) "true if new cardiac cycle begins";
          when {initial(),b} then
            T0 = time "set beginning of cardiac cycle";
            HP = 1/HR "update length of carciac cycle";
            TD2 = TD1 + (2/5)*HP "compute end time of systole";
          end when;
          tc = time - T0 "relative time in carciac cycle";
          massflowrate = if tc < TD1 then 0 else if tc < TD2 then sin((tc - TD1)/
            (TD2 - TD1)*Modelica.Constants.pi)*QP else 0
            "zero before and after systole, otherwise sin up to peak flow";
          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics={Rectangle(
                      extent={{-80,80},{80,-80}},
                      lineColor={0,0,255},
                      fillColor={255,255,170},
                      fillPattern=FillPattern.Solid),Line(
                      points={{-70,0},{-50,0},{-48,2},{-42,52},{-36,60},{-28,52},{-24,
                    2},{-20,0},{14,0},{18,2},{24,48},{24,54},{32,58},{40,50},{44,2},
                    {50,0},{74,0}},
                      color={0,0,255},
                      smooth=Smooth.Bezier),
                Text(
                  extent={{-80,108},{80,88}},
                  lineColor={0,0,255},
                  textString="%name"),
                Text(
                  extent={{-80,-92},{78,-112}},
                  lineColor={0,0,255},
                  textString="rate=%HR")}));
        end Pulses;
      end Utilities;

      package Kofranek2014
        "models of cardiovascular system used in www.physiome.cz/atlas"
        extends Modelica.Icons.ExamplesPackage;
        model NonPulsatileCirculation
          extends Physiolib.Icons.CardioVascular;
          Physiolib.Fluid.Components.ElasticVessel PulmonaryArteries(
            useM0Input=true,
            useComplianceInput=true,
            mass_start=0.373,
            nHydraulicPorts=2)
            annotation (Placement(transformation(extent={{-40,28},{-20,48}})));
          Physiolib.Types.Constants.HydraulicComplianceConst CAP(k=
                2.2576853432954e-05)
            annotation (Placement(transformation(extent={{-50,56},{-36,70}})));
          Physiolib.Types.Constants.MassConst V0AP(k=0.327)
            annotation (Placement(transformation(extent={{-66,44},{-52,58}})));
          Physiolib.Fluid.Components.Conductor TotalPulmonaryResistance(
              useConductanceInput=true)
            annotation (Placement(transformation(extent={{-2,28},{18,48}})));
          Physiolib.Types.Constants.HydraulicResistanceToConductanceConst RP(k(
                displayUnit="(Pa.s)/kg") = 9332.56711905)
            annotation (Placement(transformation(extent={{-6,60},{6,70}})));
          Physiolib.Fluid.Components.ElasticVessel PulmonaryVeins(
            useM0Input=true,
            useComplianceInput=true,
            mass_start=0.704,
            nHydraulicPorts=2)
            annotation (Placement(transformation(extent={{42,28},{62,48}})));
          Physiolib.Types.Constants.HydraulicComplianceConst CVP(k=
                2.250184727537e-07)
            annotation (Placement(transformation(extent={{36,60},{50,74}})));
          Physiolib.Types.Constants.MassConst V0VP(k=0.435)
            annotation (Placement(transformation(extent={{20,48},{34,62}})));
          Physiolib.Fluid.Components.ElasticVessel SystemicVeins(
            useM0Input=true,
            useComplianceInput=true,
            mass_start=3.922,
            nHydraulicPorts=2)
                              annotation (Placement(transformation(extent={
                    {-46,-70},{-26,-50}})));
          Physiolib.Types.Constants.HydraulicComplianceConst CVS(k=
                1.5001231516913e-03)
            annotation (Placement(transformation(extent={{-52,-42},{-38,-28}})));
          Physiolib.Types.Constants.MassConst V0VS(k=2.845)
            annotation (Placement(transformation(extent={{-74,-54},{-60,-40}})));
          Physiolib.Fluid.Components.Conductor TotalSystemicResistance(
              useConductanceInput=true)
            annotation (Placement(transformation(extent={{16,-70},{-4,-50}})));
          Physiolib.Types.Constants.HydraulicResistanceToConductanceConst RT(k(
                displayUnit="(Pa.s)/kg") = 133322.387415)
            annotation (Placement(transformation(extent={{-14,-50},{-4,-40}})));
          Physiolib.Fluid.Components.ElasticVessel SystemicArteries(
            useM0Input=true,
            useComplianceInput=true,
            mass_start=0.672,
            nHydraulicPorts=3)
            annotation (Placement(transformation(extent={{36,-70},{56,-50}})));
          Physiolib.Types.Constants.HydraulicComplianceConst CAS(k=
                1.1250923637685e-05)
            annotation (Placement(transformation(extent={{30,-38},{44,-24}})));
          Physiolib.Types.Constants.MassConst V0AS(k=0.529)
            annotation (Placement(transformation(extent={{14,-50},{28,-36}})));
          replaceable Parts.HeartPump rightHeart(StarlingSlope(displayUnit=
                  "g/(mmHg.s)") = 1.2503526469347e-04)
            annotation (Placement(transformation(extent={{-72,-10},{-48,16}})));
          replaceable Parts.HeartPump leftHeart(StarlingSlope(displayUnit=
                  "g/(Pa.s)") = 7.5006157584566e-05)
            annotation (Placement(transformation(extent={{74,-10},{52,10}})));
          inner Modelica.Fluid.System system(p_ambient(displayUnit="mmHg") =
              101325.0144354)
            annotation (Placement(transformation(extent={{-94,70},{-74,90}})));
          Sensors.PressureMeasure pressureMeasure
            annotation (Placement(transformation(extent={{68,-66},{88,-46}})));
        equation
          connect(CAP.y, PulmonaryArteries.compliance) annotation (Line(
              points={{-34.25,63},{-30,63},{-30,48}},
              color={0,0,127}));
          connect(V0AP.y, PulmonaryArteries.zeroPressureMass) annotation (Line(
              points={{-50.25,51},{-50.25,50.5},{-38,50.5},{-38,48}},
              color={0,0,127}));
          connect(RP.y, TotalPulmonaryResistance.cond) annotation (Line(
              points={{7.5,65},{8,65},{8,44}},
              color={0,0,127}));
          connect(CVP.y, PulmonaryVeins.compliance) annotation (Line(
              points={{51.75,67},{52,67},{52,48}},
              color={0,0,127}));
          connect(CVS.y, SystemicVeins.compliance) annotation (Line(
              points={{-36.25,-35},{-36,-35},{-36,-50}},
              color={0,0,127}));
          connect(RT.y, TotalSystemicResistance.cond) annotation (Line(
              points={{-2.75,-45},{6,-45},{6,-54}},
              color={0,0,127}));
          connect(CAS.y, SystemicArteries.compliance) annotation (Line(
              points={{45.75,-31},{46,-31},{46,-50}},
              color={0,0,127}));
          connect(PulmonaryVeins.zeroPressureMass, V0VP.y) annotation (Line(
              points={{44,48},{40,48},{40,55},{35.75,55}},
              color={0,0,127}));
          connect(SystemicVeins.zeroPressureMass, V0VS.y) annotation (Line(
              points={{-44,-50},{-52,-50},{-52,-47},{-58.25,-47}},
              color={0,0,127}));
          connect(V0AS.y, SystemicArteries.zeroPressureMass) annotation (Line(
              points={{29.75,-43},{38,-43},{38,-50}},
              color={0,0,127}));
          connect(rightHeart.q_out, PulmonaryArteries.q_in[1]) annotation (Line(
              points={{-48,3},{-40,3},{-40,39.3},{-30.3,39.3}},
              color={127,0,0},
              thickness=0.5));
          connect(PulmonaryArteries.q_in[2], TotalPulmonaryResistance.q_in)
            annotation (Line(
              points={{-30.3,36.7},{-16,36.7},{-16,38},{-2,38}},
              color={127,0,0},
              thickness=0.5));
          connect(TotalPulmonaryResistance.q_out, PulmonaryVeins.q_in[1])
            annotation (Line(
              points={{18,38},{34,38},{34,39.3},{51.7,39.3}},
              color={127,0,0},
              thickness=0.5));
          connect(PulmonaryVeins.q_in[2], leftHeart.q_in) annotation (Line(
              points={{51.7,36.7},{74,36.7},{74,0}},
              color={127,0,0},
              thickness=0.5));
          connect(leftHeart.q_out, SystemicArteries.q_in[1]) annotation (Line(
              points={{52,2.22045e-16},{50,2.22045e-16},{50,-58.2667},{45.7,
                  -58.2667}},
              color={127,0,0},
              thickness=0.5));
          connect(SystemicArteries.q_in[2], TotalSystemicResistance.q_in)
            annotation (Line(
              points={{45.7,-60},{30,-60},{30,-60},{16,-60}},
              color={127,0,0},
              thickness=0.5));
          connect(TotalSystemicResistance.q_out, SystemicVeins.q_in[1])
            annotation (Line(
              points={{-4,-60},{-20,-60},{-20,-58.7},{-36.3,-58.7}},
              color={127,0,0},
              thickness=0.5));
          connect(SystemicVeins.q_in[2], rightHeart.q_in) annotation (Line(
              points={{-36.3,-61.3},{-80,-61.3},{-80,3},{-72,3}},
              color={127,0,0},
              thickness=0.5));
          connect(SystemicArteries.q_in[3], pressureMeasure.q_in) annotation (
              Line(
              points={{45.7,-61.7333},{60,-61.7333},{60,-62},{74,-62}},
              color={127,0,0},
              thickness=0.5));
          annotation ( Documentation(info="<html>
<p>Model of cardiovascular system using to demonstrate elastic and resistance features of veins and arteries in pulmonary and systemic circulation and influence of cardiac output on it. </p>
<ul>
<li>J. Kofranek, S. Matousek, J. Rusz, P. Stodulka, P. Privitzer,M. Matejak, M. Tribula, The Atlas of Physiology and Pathophysiology: Web-based multimedia enabled interactive simulations., Comput. Methods Programs Biomed. 104 (2) (2011) 143&ndash;53. doi:10.1016/j.cmpb.2010.12.007.</li>
<li>Kofr&aacute;nek J, Matej&aacute;k M, Je~ek F, Privitzer P, &Scaron;ilar J. V&yacute;ukov&yacute; webov&yacute; simulator krevn&iacute;ho obhu. In: Sborn&iacute;k PY&iacute;spvko MEDSOFT 2011: 106-121. </li>
<li>Tribula M, Je~ek F, Privitzer P, Kofr&aacute;nek J, Kolman J. Webov&yacute; v&yacute;ukov&yacute; simul&aacute;tor krevn&iacute;ho obhu. In: Sborn&iacute;k PY&iacute;spvko MEDSOFT 2013: 197-204.</li>
<li><a href=\"http://physiome.cz/atlas/cirkulace/05/SimpleUncontrolledSimulation.html\">http://physiome.cz/atlas/cirkulace/05/SimpleUncontrolledSimulation.html</a></li>
</ul>
</html>"),  experiment(StopTime=5));
        end NonPulsatileCirculation;

        model PulsatileCirculation
            extends NonPulsatileCirculation(
            redeclare Parts.PulsatileHeartPump rightHeart(pulses(
                  QP=0.338)),
            redeclare Parts.PulsatileHeartPump leftHeart(pulses(QP=
                   0.338)),
            CAS(k=7.2755972857029e-06),
            SystemicArteries(mass_start=0.603),
            SystemicVeins(mass_start=3.991));

          annotation ( Documentation(info="<html>
<p>Extension of the model of cardiovascular system with pulsatile dynamics</p>
<ul>
<li>Kulh&aacute;nek T, Tribula M, Kofr&aacute;nek J, Matej&aacute;k M. Simple models of the cardiovascular system for educational and research purposes. MEFANET Journal 2014. Available at WWW:<a href=\"
 http://mj.mefanet.cz/mj-04140914\"> http://mj.mefanet.cz/mj-04140914</a>.</li>
</ul>
</html>"),  experiment(StopTime=5));
        end PulsatileCirculation;

        package Parts "Utility components used by package KofranekModels2013"
        extends Modelica.Icons.UtilitiesPackage;
          model HeartPump "Heart as pump, which flowrate is determined
  by the StarlingSlope and filling pressure."

            outer Modelica.Fluid.System system "System wide properties";

            extends Physiolib.Fluid.Interfaces.OnePort;

            parameter Physiolib.Types.HydraulicConductance StarlingSlope;
          equation
            q_in.m_flow = StarlingSlope*(q_in.p-system.p_ambient);
            annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                      {-100,-100},{100,100}}), graphics={Polygon(
                            points={{32,-34},{24,-24},{18,-10},{18,-8},{22,22},{
                      24,24},{34,40},{30,70},{26,82},{-22,100},{-26,42},{-26,40},
                      {-30,-6},{-30,-10},{-6,-40},{52,-74},{32,-34}},
                            lineColor={0,0,127},
                            smooth=Smooth.Bezier,
                            fillColor={255,170,170},
                            fillPattern=FillPattern.Solid),Text(
                            extent={{-100,-60},{102,-98}},
                            lineColor={0,0,127},
                            fillColor={255,170,170},
                            fillPattern=FillPattern.Solid,
                            textString="%name")}));
          end HeartPump;

          model PulsatileHeartPump "Heart as pump, which flowrate is determined
  by the StarlingSlope and filling pressure."

            Physiolib.Fluid.Interfaces.FluidPort_a q_in annotation (Placement(
                  transformation(extent={{-64,0},{-44,20}}), iconTransformation(
                    extent={{-110,-10},{-90,10}})));
            Physiolib.Fluid.Interfaces.FluidPort_b q_out annotation (
                Placement(transformation(extent={{42,2},{62,22}}),
                  iconTransformation(extent={{42,2},{62,22}})));
            Utilities.Pulses pulses
              annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
            Physiolib.Fluid.Components.Pump pump(useSolutionFlowInput=true)
              annotation (Placement(transformation(extent={{-14,2},{6,22}})));
            parameter Physiolib.Types.HydraulicConductance StarlingSlope;
          equation
            connect(pump.q_out, q_out) annotation (Line(
                points={{6,12},{52,12}},
                thickness=1));
            connect(pump.solutionFlow, pulses.massflowrate) annotation (Line(
                points={{-4,19},{-4,40},{-21,40}},
                color={0,0,127}));
            connect(q_in, pump.q_in) annotation (Line(
                points={{-54,10},{-34,10},{-34,12},{-14,12}},
                thickness=1));

            annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                      {-100,-100},{100,100}}), graphics={Polygon(
                            points={{32,-34},{24,-24},{18,-10},{18,-8},{22,22},{
                      24,24},{34,40},{30,70},{26,82},{-22,100},{-26,42},{-26,40},
                      {-30,-6},{-30,-10},{-6,-40},{52,-74},{32,-34}},
                            lineColor={0,0,127},
                            smooth=Smooth.Bezier,
                            fillColor={255,170,170},
                            fillPattern=FillPattern.Solid),Text(
                            extent={{-100,-60},{102,-98}},
                            lineColor={0,0,127},
                            fillColor={255,170,170},
                            fillPattern=FillPattern.Solid,
                            textString="%name")}));
          end PulsatileHeartPump;

        end Parts;

        annotation (Documentation(info="<html>
<p>Model of cardiovascular system using to demonstrate elastic and resistance features of veins and arteries in pulmonary and systemic circulation and influence of cardiac output on it.</p>
</html>"));
      end Kofranek2014;

      package Fernandez2013
        "Model of CVS introduced by Fernandez de Canete et al. 2013"
          extends Modelica.Icons.ExamplesPackage;

        model PulsatileCirculation
          "Model of cardiovascular system with pulsatile dynamic"
                                  extends Physiolib.Icons.CardioVascular;

          Physiolib.Fluid.Components.Conductor RPulmonaryVeins(
              useConductanceInput=false, Conductance(displayUnit="kg/(Pa.s)")=
                 7.425609600872e-03) annotation (Placement(transformation(
                  origin={-220,60}, extent={{15,-15},{-15,15}})));
          Physiolib.Fluid.Components.Inertia pulmonaryVeinsInertia(
              massFlow_start(displayUnit="kg/s") = 2.225e-02, I(displayUnit="Pa.s2/kg")=
                 410.6329532382) annotation (Placement(transformation(origin={-278,
                    60}, extent={{15,-15},{-15,15}})));
          Physiolib.Fluid.Components.Conductor RPulmonaryArtery(
              useConductanceInput=false, Conductance(displayUnit="kg/(Pa.s)")=
                 2.2216823876548e-04) annotation (Placement(transformation(
                  origin={200,58}, extent={{17.5,-17.5},{-17.5,17.5}})));
          Physiolib.Fluid.Components.Inertia pulmonaryArterialInertia(
              massFlow_start(displayUnit="g/min") = 7.3233333333333e-04, I(
                displayUnit="mmHg.s2/g") = 99.99179056125) annotation (
              Placement(transformation(origin={158,58}, extent={{15,-15},{-15,15}})));
          Physiolib.Fluid.Components.ElasticVessel pulmonaryVeins(
            useComplianceInput=false,
            mass_start(displayUnit="g") = 0.6597,
            ZeroPressureMass=0.1,
            Compliance(displayUnit="g/mmHg") = 3.5027875591992e-04,
            nHydraulicPorts=2)
            annotation (Placement(transformation(origin={-279,-3}, extent={{-15,
                    -15},{15,15}})));
          Physiolib.Fluid.Components.IdealValve mitralValve(useLimitationInputs=
               false, _Gon(displayUnit="g/(mmHg.s)") = 1.9996641612045e-03)
            annotation (Placement(transformation(origin={-243,-3}, extent={{-15,
                    -15},{15,15}})));
          Physiolib.Fluid.Components.ElasticVessel leftVentricle(
            useComplianceInput=true,
            useExternalPressureInput=true,
            mass_start=0.2097,
            ZeroPressureMass=9e-02,
            nHydraulicPorts=2)      annotation (Placement(transformation(
                  origin={-209,-3}, extent={{-15,-15},{15,15}})));
          Physiolib.Fluid.Components.Conductor RLeftMyo(useConductanceInput=false,
              Conductance(displayUnit="kg/(Pa.s)") = 9.3757696980707e-05)
            annotation (Placement(transformation(origin={-181,-3}, extent={{-15,
                    -15},{15,15}})));
          Physiolib.Fluid.Components.IdealValve aorticValve(_Gon(displayUnit="g/(mmHg.s)")=
                 1.9996641612045e-03, useLimitationInputs=false) annotation (
              Placement(transformation(origin={-143,-3}, extent={{-15,-15},{15,15}})));
          Physiolib.Fluid.Components.ElasticVessel aorta(
            mass_start=4.6e-02,
            ZeroPressureMass=3e-02,
            Compliance(displayUnit="g/mmHg") = 1.6501354668604e-06,
            nHydraulicPorts=2)
            annotation (Placement(transformation(origin={-111,-3}, extent={{-15,
                    -15},{15,15}})));
          Physiolib.Fluid.Components.Conductor Raorta(useConductanceInput=false,
              Conductance(displayUnit="kg/(Pa.s)") = 1.1108411938274e-04)
            annotation (Placement(transformation(origin={-79,-3}, extent={{-15,-15},
                    {15,15}})));
          Physiolib.Fluid.Components.Inertia aorticInertia(massFlow_start(
                displayUnit="kg/s") = 1.0385e-02, I(displayUnit="Pa.s2/kg") = 109.99096961737)
            annotation (Placement(transformation(origin={-37,-3}, extent={{-15,-15},
                    {15,15}})));
          Physiolib.Fluid.Components.ElasticVessel arteries(
            mass_start=0.805,
            ZeroPressureMass=0.7,
            Compliance(displayUnit="g/mmHg") = 1.0950899007347e-05,
            nHydraulicPorts=2)
            annotation (Placement(transformation(origin={-1,-3}, extent={{-15,-15},
                    {15,15}})));
          Physiolib.Fluid.Components.Conductor RSystemic(useConductanceInput=false,
              Conductance(displayUnit="kg/(Pa.s)") = 7.5006157584566e-06)
            annotation (Placement(transformation(origin={31,-3}, extent={{-15,-15},
                    {15,15}})));
          Physiolib.Fluid.Components.Inertia systemicInertia(massFlow_start(
                displayUnit="kg/s") = 7.935e-02, I(displayUnit="Pa.s2/kg") = 479.960594694)
            annotation (Placement(transformation(origin={75,-3}, extent={{-15,-15},
                    {15,15}})));
          Physiolib.Fluid.Components.IdealValve tricuspidValve(
              useLimitationInputs=false, _Gon(displayUnit="g/(mmHg.s)") = 1.9996641612045e-03)
            annotation (Placement(transformation(origin={137,-3}, extent={{-15,-15},
                    {15,15}})));
          Physiolib.Fluid.Components.ElasticVessel rightVentricle(
            useComplianceInput=true,
            useExternalPressureInput=true,
            mass_start=0.18,
            ZeroPressureMass=7e-02,
            nHydraulicPorts=2)      annotation (Placement(transformation(
                  origin={171,-3}, extent={{-15,-15},{15,15}})));
          Physiolib.Fluid.Components.Conductor RRightMyo(useConductanceInput=false,
              Conductance(displayUnit="kg/(Pa.s)") = 4.2858518443821e-04)
            annotation (Placement(transformation(origin={207,-3}, extent={{-15,-15},
                    {15,15}})));
          Physiolib.Fluid.Components.IdealValve pulmonaryValve(_Gon(displayUnit=
                 "g/(mmHg.s)") = 1.9996641612045e-03, useLimitationInputs=false)
            annotation (Placement(transformation(origin={245,-3}, extent={{-15,-15},
                    {15,15}})));
          Physiolib.Fluid.Components.ElasticVessel pulmonaryArtery(
            mass_start=2.1e-02,
            ZeroPressureMass=2e-02,
            Compliance(displayUnit="kg/Pa") = 6.7505541826109e-7,
            nHydraulicPorts=2)                                    annotation (
              Placement(transformation(origin={243,57}, extent={{-15,-15},{15,15}})));
          Physiolib.Fluid.Components.ElasticVessel pulmonaryArterioles(
            mass_start=0.637,
            ZeroPressureMass=0.6,
            Compliance(displayUnit="g/mmHg") = 2.0026644075079e-05,
            nHydraulicPorts=2)
            annotation (Placement(transformation(origin={124,58}, extent={{-15,-15},
                    {15,15}})));
          Physiolib.Fluid.Components.ElasticVessel veins(
            mass_start(displayUnit="g") = 2.443,
            ZeroPressureMass=2.37,
            Compliance(displayUnit="g/mmHg") = 1.5001231516913e-04,
            nHydraulicPorts=2)
            annotation (Placement(transformation(origin={105,-3}, extent={{-15,-15},
                    {15,15}})));
          Parts.TimeVaryingElastance timeVaryingElastanceLeft(
            Ed(displayUnit="mmHg/g") = 13332.2387415,
            Es(displayUnit="mmHg/g") = 183318.28269563,
            Pi0(displayUnit="mmHg") = 6666.11937075)
            annotation (Placement(transformation(extent={{-222,16},{-202,36}})));
          Parts.TimeVaryingElastance timeVaryingElastanceRight(
            Ed(displayUnit="mmHg/g") = 3999.67162245,
            Es(displayUnit="mmHg/g") = 43729.7430721,
            Pi0(displayUnit="mmHg") = 3199.73729796)
            annotation (Placement(transformation(extent={{164,18},{184,38}})));
          Physiolib.Types.Constants.FrequencyConst heartRate(k(displayUnit=
                  "Hz") = 1.2)
            annotation (Placement(transformation(extent={{-262,30},{-244,42}})));
          inner Modelica.Fluid.System system(p_ambient(displayUnit="mmHg") =
              101325.0144354)
            annotation (Placement(transformation(extent={{-94,70},{-74,90}})));
        equation
          connect(Raorta.q_out, aorticInertia.q_in) annotation (Line(
              points={{-64,-3},{-52,-3}},
              thickness=1));
          connect(timeVaryingElastanceLeft.C, leftVentricle.compliance)
            annotation (Line(
              points={{-212,17},{-209,17},{-209,12}},
              color={0,0,127}));
          connect(timeVaryingElastanceRight.C, rightVentricle.compliance)
            annotation (Line(
              points={{174,19},{174,12},{171,12}},
              color={0,0,127}));
          connect(timeVaryingElastanceLeft.Pi, leftVentricle.externalPressure)
            annotation (Line(
              points={{-205,17},{-205,16.5},{-197,16.5},{-197,12}},
              color={0,0,127}));
          connect(timeVaryingElastanceRight.Pi, rightVentricle.externalPressure)
            annotation (Line(
              points={{181,19},{181,12},{183,12}},
              color={0,0,127}));
          connect(heartRate.y, timeVaryingElastanceLeft.HR) annotation (Line(
              points={{-241.75,36},{-232.375,36},{-232.375,33.6},{-220.6,33.6}},
              color={0,0,127}));
          connect(RSystemic.q_out, systemicInertia.q_in) annotation (Line(
              points={{46,-3},{60,-3}},
              thickness=1));
          connect(heartRate.y, timeVaryingElastanceRight.HR) annotation (Line(
              points={{-241.75,36},{-34,36},{-34,35.6},{165.4,35.6}},
              color={0,0,127}));
          connect(RRightMyo.q_out, pulmonaryValve.q_in) annotation (Line(
              points={{222,-3},{230,-3}},
              thickness=1));
          connect(RPulmonaryArtery.q_out, pulmonaryArterialInertia.q_in)
            annotation (Line(
              points={{182.5,58},{173,58}},
              thickness=1));
          connect(RPulmonaryVeins.q_out, pulmonaryVeinsInertia.q_in) annotation (
              Line(
              points={{-235,60},{-263,60}},
              thickness=1));
          connect(RLeftMyo.q_out, aorticValve.q_in) annotation (Line(
              points={{-166,-3},{-158,-3}},
              thickness=1));
          connect(RPulmonaryVeins.q_in, pulmonaryArterioles.q_in[1])
            annotation (Line(
              points={{-205,60},{-40,60},{-40,59.95},{123.55,59.95}},
              color={127,0,0},
              thickness=0.5));
          connect(pulmonaryArterioles.q_in[2], pulmonaryArterialInertia.q_out)
            annotation (Line(
              points={{123.55,56.05},{133,56.05},{133,58},{143,58}},
              color={127,0,0},
              thickness=0.5));
          connect(RPulmonaryArtery.q_in, pulmonaryArtery.q_in[1]) annotation (
              Line(
              points={{217.5,58},{229.75,58},{229.75,58.95},{242.55,58.95}},
              color={127,0,0},
              thickness=0.5));
          connect(pulmonaryArtery.q_in[2], pulmonaryValve.q_out) annotation (
              Line(
              points={{242.55,55.05},{292,55.05},{292,-3},{260,-3}},
              color={127,0,0},
              thickness=0.5));
          connect(tricuspidValve.q_out, rightVentricle.q_in[1]) annotation (
              Line(
              points={{152,-3},{162,-3},{162,-1.05},{170.55,-1.05}},
              color={127,0,0},
              thickness=0.5));
          connect(RRightMyo.q_in, rightVentricle.q_in[2]) annotation (Line(
              points={{192,-3},{181,-3},{181,-4.95},{170.55,-4.95}},
              color={127,0,0},
              thickness=0.5));
          connect(tricuspidValve.q_in, veins.q_in[1]) annotation (Line(
              points={{122,-3},{114,-3},{114,-1.05},{104.55,-1.05}},
              color={127,0,0},
              thickness=0.5));
          connect(systemicInertia.q_out, veins.q_in[2]) annotation (Line(
              points={{90,-3},{98,-3},{98,-4.95},{104.55,-4.95}},
              color={127,0,0},
              thickness=0.5));
          connect(RSystemic.q_in, arteries.q_in[1]) annotation (Line(
              points={{16,-3},{8,-3},{8,-1.05},{-1.45,-1.05}},
              color={127,0,0},
              thickness=0.5));
          connect(aorticInertia.q_out, arteries.q_in[2]) annotation (Line(
              points={{-22,-3},{-11,-3},{-11,-4.95},{-1.45,-4.95}},
              color={127,0,0},
              thickness=0.5));
          connect(Raorta.q_in, aorta.q_in[1]) annotation (Line(
              points={{-94,-3},{-104,-3},{-104,-1.05},{-111.45,-1.05}},
              color={127,0,0},
              thickness=0.5));
          connect(aorticValve.q_out, aorta.q_in[2]) annotation (Line(
              points={{-128,-3},{-120,-3},{-120,-4.95},{-111.45,-4.95}},
              color={127,0,0},
              thickness=0.5));
          connect(mitralValve.q_out, leftVentricle.q_in[1]) annotation (Line(
              points={{-228,-3},{-220,-3},{-220,-1.05},{-209.45,-1.05}},
              color={127,0,0},
              thickness=0.5));
          connect(leftVentricle.q_in[2], RLeftMyo.q_in) annotation (Line(
              points={{-209.45,-4.95},{-203.725,-4.95},{-203.725,-3},{-196,-3}},

              color={127,0,0},
              thickness=0.5));
          connect(pulmonaryVeins.q_in[1], pulmonaryVeinsInertia.q_out)
            annotation (Line(
              points={{-279.45,-1.05},{-318,-1.05},{-318,60},{-293,60}},
              color={127,0,0},
              thickness=0.5));
          connect(pulmonaryVeins.q_in[2], mitralValve.q_in) annotation (Line(
              points={{-279.45,-4.95},{-268.725,-4.95},{-268.725,-3},{-258,-3}},

              color={127,0,0},
              thickness=0.5));
          annotation(Diagram(coordinateSystem(extent={{-350,-100},{400,100}},      preserveAspectRatio=false,  grid = {2, 2})),
                                                                                                                              Icon(coordinateSystem(extent={{-350,
                    -100},{400,100}},                                                                                                    preserveAspectRatio = true, grid = {2, 2})),
            Documentation(info="<html>
<p>Model of cardiovascular system with pulsatile dynamics</p>
<ul>
<li>Javier Fernandez de Canete, P del Saz-Orozco, D Moreno-Boza, E Duran-Venegas (2013), <a href=\"http://www.mendeley.com/library/#\">Object-oriented modeling and simulation of the closed loop cardiovascular systemby using SIMSCAPE.</a> <i>Computers in biology and medicine</i> 43 (4) p. 323-33</li>
<li>Kulh&aacute;nek T, Tribula M, Kofr&aacute;nek J, Matej&aacute;k M. Simple models of the cardiovascular system for educational and research purposes<i>. MEFANET Journal 2014</i>. Available at WWW: http://mj.mefanet.cz/mj-04140914.</li>
</ul>
</html>",         revisions="<html>
<ul>
<li><i>Sep 2014 </i>by Tomas Kulhanek: <br>Created. </li>
</ul>
</html>"),  experiment(StopTime=5));
        end PulsatileCirculation;

        package Parts "Utility components used by package KofranekModels2013"
          extends Modelica.Icons.UtilitiesPackage;
          model TimeVaryingElastance

            outer Modelica.Fluid.System system "System wide properties";


            parameter Physiolib.Types.HydraulicElastance Ed
              "elastance of diastole";
            parameter Physiolib.Types.HydraulicElastance Es
              "elastance of systole";
            parameter Physiolib.Types.Pressure Pi0 "peak isovolumic pressure";
            Physiolib.Types.Time tm
              "relative time from the beginning of cardiac cycle";
            discrete Physiolib.Types.Time HP "heart period";
            discrete Physiolib.Types.Time t0
              "time of beginning of the cardiac cycle";
            discrete Physiolib.Types.Time ts "duration of systole";
            Real a;
            Physiolib.Types.RealIO.HydraulicComplianceOutput C
              annotation (Placement(transformation(extent={{-4,-102},{16,-82}}),
                  iconTransformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={0,-90})));
                  Physiolib.Types.HydraulicElastance E;
            Physiolib.Types.RealIO.PressureOutput Pi annotation (Placement(
                  transformation(extent={{-72,-100},{-52,-80}}), iconTransformation(
                  extent={{-10,-10},{10,10}},
                  rotation=270,
                  origin={70,-90})));
            Physiolib.Types.RealIO.FrequencyInput HR "heart rate" annotation (Placement(
                  transformation(extent={{-106,56},{-66,96}}), iconTransformation(extent={
                      {-106,56},{-66,96}})));
          equation
            tm = time - pre(t0);
            if (tm<pre(ts)) then
              a= (1-cos(2*Modelica.Constants.pi*tm/pre(ts)))/2;
            else
              a=0;
            end if;
            E=Ed+Es*a;
            C=1/E;
            Pi = Pi0*a + system.p_ambient;
            when {initial(), tm >= pre(HP)} then
              HP = 1/HR;
              t0= time;
              ts = 0.16+0.3*HP;
            end when;
            annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                      -100},{100,100}}),
                                   graphics={
                  Rectangle(
                    extent={{-80,80},{80,-80}},
                    lineColor={0,0,255},
                    fillColor={170,255,255},
                    fillPattern=FillPattern.Solid),
                  Line(
                    points={{-78,0},{-68,18},{-54,52},{-44,64},{-30,60},{-26,46}},
                    color={0,0,255}),
                  Line(
                    points={{-26,46},{-26,32},{-20,10},{-8,2},{36,2},{80,2}},
                    color={0,0,255}),
                  Text(
                    extent={{-70,98},{-22,80}},
                    lineColor={0,0,255},
                    textString="HR"),
                  Text(
                    extent={{-74,-40},{40,-80}},
                    lineColor={0,0,255},
                    textString="Et"),
                  Text(
                    extent={{42,-40},{100,-80}},
                    lineColor={0,0,255},
                    textString="Pi"),
                  Text(
                    extent={{-272,16},{276,-40}},
                    lineColor={0,0,255},
                    textString="%name")}));
          end TimeVaryingElastance;
        end Parts;
      end Fernandez2013;

      package MeursModel2011
        "models of cardiovascular system used in www.physiome.cz/atlas"
        extends Modelica.Icons.ExamplesPackage;
        package Parts "Utility components used by package KofranekModels2013"
          extends Modelica.Icons.UtilitiesPackage;
          model AtrialElastance
            extends HeartIntervals;
            Physiolib.Types.RealIO.HydraulicComplianceOutput Ct "compliance" annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -20}, {138, 18}})));
            Physiolib.Types.HydraulicElastance Et "elasticity";
            parameter Physiolib.Types.HydraulicElastance EMIN
              "Diastolic elastance";
          parameter Boolean useEs_extInput = false
              "=true, if external elastance/compliance value is used"
              annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
            parameter Physiolib.Types.HydraulicElastance EMAX
              "Maximum systolic elastance"         annotation (Dialog(enable=not useEs_extInput));
          Physiolib.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/Ees)=1/es_int if useEs_extInput
             annotation (
                Placement(transformation(extent={{60,60},{100,100}}), iconTransformation(
                  extent={{-20,-20},{20,20}},
                  origin={-80,80})));
          protected
             Physiolib.Types.HydraulicElastance es_int;
          equation
            if not useEs_extInput then
              es_int=EMAX;
            end if;
            if time - T0 < Tas then
              Et = EMIN + (es_int - EMIN) * sin(Modelica.Constants.pi * (time - T0) / Tas);
            else
              Et = EMIN;
            end if;
            Ct = 1 / Et "reciprocal value of elastance";
            annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                      -100},{100,100}}),                                                                        graphics={  Rectangle(extent = {{-100, 82}, {100, -100}}, pattern = LinePattern.None,
                      lineThickness =                                                                                                   1, fillColor = {255, 255, 170},
                      fillPattern =                                                                                                   FillPattern.Solid, lineColor = {0, 0, 255}), Text(extent={{
                        -98,82},{98,24}},                                                                                                    lineColor = {0, 0, 255},
                      lineThickness =                                                                                                   1, fillColor = {255, 255, 170},
                      fillPattern =                                                                                                   FillPattern.Solid, textString = "Atrial elastance"), Line(points = {{-78, -34}, {-76, -26}, {-70, -14}, {-58, 6}, {-36, 36}, {-14, 14}, {-6, -10}, {0, -32}, {6, -34}, {88, -34}, {94, -34}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Text(extent = {{-220, -102}, {200, -120}}, lineColor = {0, 0, 255},
                      lineThickness =                                                                                                   1, fillColor = {255, 255, 170},
                      fillPattern =                                                                                                   FillPattern.Solid, textString = "%name"), Text(extent = {{72, 4}, {102, -8}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                      fillPattern =                                                                                                   FillPattern.Solid, textString = "Ct")}));
          end AtrialElastance;

          model VentricularElastance
            extends HeartIntervals;
            Physiolib.Types.RealIO.HydraulicComplianceOutput Ct
              "ventricular elasticity"                                                       annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, 4}, {138, 42}})));
            Modelica.Blocks.Interfaces.RealOutput Et0
              "normalized ventricular elasticity (0..1)"                                         annotation(Placement(transformation(extent = {{100, -24}, {120, -4}}), iconTransformation(extent = {{100, -40}, {138, -2}})));
            Physiolib.Types.RealIO.TimeOutput HeartInterval "eapsed time" annotation(Placement(transformation(extent = {{102, -42}, {122, -22}}), iconTransformation(extent = {{100, -98}, {138, -60}})));
            Physiolib.Types.HydraulicElastance Et;
            parameter Physiolib.Types.HydraulicElastance EMIN
              "Diastolic elastance ";
            constant Real Kn = 0.57923032735652;
            //Kn is always = 0.5792303273565197
            //... the t * sin(pi*t) has its maximum at t = 0.645773676543406 and = 0.5792303273565197
            //Equation to calculate normalized elastance ET0 was:
            //Et0=EMIN+(EMAX-EMIN)*((time-T0)-(Tas+Tav))/Tvs)*sin(Modelica.Constants.pi*(((time-T0)-(Tas+Tav))/Tvs));
          parameter Boolean useEs_extInput = false
              "=true, if external elastance/compliance value is used"
              annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
            parameter Physiolib.Types.HydraulicElastance EMAX
              "Maximum systolic elastance"         annotation (Dialog(enable=not useEs_extInput));
          Physiolib.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/EMAX)=1/es_int if useEs_extInput
             annotation (
                Placement(transformation(extent={{60,60},{100,100}}), iconTransformation(
                  extent={{-20,-20},{20,20}},
                  origin={-80,80})));
          protected
             Physiolib.Types.HydraulicElastance es_int;
          equation
            if not useEs_extInput then
              es_int=EMAX;
            end if;
            HeartInterval = time - T0;
            Et = EMIN + (es_int - EMIN) * Et0;
            if HeartInterval >= Tas + Tav and HeartInterval < Tas + Tav + Tvs then
              Et0 = (HeartInterval - (Tas + Tav)) / Tvs * sin(Modelica.Constants.pi * (HeartInterval - (Tas + Tav)) / Tvs) / Kn;
            else
              Et0 = 0;
            end if;
            Ct = 1 / Et "reciprocal value of elastance";
            annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-98, 82}, {100, -100}}, pattern = LinePattern.None,
                      lineThickness =                                                                                                   1, fillColor = {255, 255, 170},
                      fillPattern =                                                                                                   FillPattern.Solid, lineColor = {0, 0, 255}), Text(extent = {{-82, 82}, {80, 24}}, lineColor = {0, 0, 255},
                      lineThickness =                                                                                                   1, fillColor = {255, 255, 170},
                      fillPattern =                                                                                                   FillPattern.Solid, textString = "Ventricular elastance"), Line(points = {{-72, -34}, {-62, -34}, {-52, -34}, {-44, 8}, {-18, 38}, {-12, 14}, {-6, -10}, {0, -32}, {6, -34}, {88, -34}, {94, -34}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Text(extent = {{-220, -102}, {200, -120}}, lineColor = {0, 0, 255},
                      lineThickness =                                                                                                   1, fillColor = {255, 255, 170},
                      fillPattern =                                                                                                   FillPattern.Solid, textString = "%name"), Text(extent = {{96, -32}, {68, -8}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                      fillPattern =                                                                                                   FillPattern.Solid, textString = "Et0"), Text(extent = {{42, -72}, {88, -84}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
                      fillPattern =                                                                                                   FillPattern.Solid, textString = "Heart interval"), Text(extent = {{62, 30}, {96, 8}}, lineColor = {0, 0, 255},
                      lineThickness =                                                                                                   1, fillColor = {255, 255, 170},
                      fillPattern =                                                                                                   FillPattern.Solid, textString = "Ct")}));
          end VentricularElastance;

          model HeartIntervals
            discrete Physiolib.Types.Time Tas, T0, Tvs;
            parameter Physiolib.Types.Time Tav(displayUnit = "s") = 0.01
              "atrioventricular delay";
            discrete Modelica.SIunits.Time HP(start = 0) "heart period";
            Boolean b(start = false);
            Physiolib.Types.RealIO.FrequencyInput HR "heart rate" annotation(Placement(transformation(extent = {{-12, 68}, {28, 108}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 80})));
          equation
            b = time - pre(T0) >= pre(HP) "true if new pulse occurs";
            when {initial(), b} then
              T0 = time "start time of cardiac cycle";
              HP = 1 / HR "update heart period per heart rate";
              Tas = 0.03 + 0.09 * HP "duration of atrial systole";
              Tvs = 0.16 + 0.2 * HP "duration of ventricular systole";
            end when;
            annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent={{
                        -64,102},{-6,78}},                                                                                                    lineColor = {0, 0, 255}, textString = "HR")}));
          end HeartIntervals;
        end Parts;

        model HemodynamicsMeurs_flatNorm
        extends Physiolib.Icons.CardioVascular;
          Physiolib.Fluid.Components.ElasticVesselElastance Epa(
            useM0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            mass_start=0.106,
            ZeroPressureMass=5e-02,
            ExternalPressure=101325-533.28954966,
            Elastance=31064.116267695,
            nHydraulicPorts=2)
            annotation (Placement(transformation(extent={{-94,84},{-66,112}})));
          Physiolib.Fluid.Components.Resistor Rpp(useConductanceInput=false,
              Resistance(displayUnit="(mmHg.s)/g") = 14665.46261565)
            annotation (Placement(transformation(extent={{-56,85},{-22,111}})));
          Physiolib.Fluid.Components.ElasticVesselElastance Epv(
            useM0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            mass_start=0.518,
            ZeroPressureMass=0.35,
            ExternalPressure=101325-533.28954966,
            Elastance=6066.1686273825,
            nHydraulicPorts=2)
            annotation (Placement(transformation(extent={{-10,84},{24,112}})));
          Physiolib.Fluid.Components.Resistor Rlain(useConductanceInput=false,
              Resistance(displayUnit="(mmHg.s)/g") = 399.967162245)
            annotation (Placement(transformation(extent={{26,86},{56,110}})));
          Physiolib.Fluid.Components.ElasticVesselElastance LeftAtrium(
            useComplianceInput=true,
            useM0Input=false,
            useExternalPressureInput=false,
            mass_start=9.31e-02,
            ZeroPressureMass=3e-02,
            ExternalPressure=101325-533.28954966,
            nHydraulicPorts=2)
            annotation (Placement(transformation(extent={{74,50},{102,78}})));
          Physiolib.Fluid.Components.ElasticVesselElastance LeftVentricle(
            useComplianceInput=true,
            useM0Input=false,
            useExternalPressureInput=false,
            mass_start=0.144,
            ZeroPressureMass=6e-02,
            ExternalPressure=101325-533.28954966,
            nHydraulicPorts=2)
            annotation (Placement(transformation(extent={{150,50},{178,78}})));
          Physiolib.Fluid.Components.IdealValveResistance AorticValve(
            _Goff(displayUnit="g/(mmHg.s)") = 0,
            useLimitationInputs=false,
            _Ron(displayUnit="(mmHg.s)/g") = 1066.57909932)
            annotation (Placement(transformation(extent={{184,76},{208,52}})));
          Parts.AtrialElastance LAtrialElastance(
            Tav(displayUnit="s"),
            EMIN=15998.6864898,
            EMAX=37330.2684762)
            annotation (Placement(transformation(extent={{80,92},{118,124}})));
          Parts.VentricularElastance LVentricularElastance(EMIN=11999.01486735,
              EMAX=533289.54966)
            annotation (Placement(transformation(extent={{164,88},{200,120}})));
          Physiolib.Fluid.Components.IdealValveResistance MitralValve(
            useLimitationInputs=false,
            _Goff(displayUnit="g/(mmHg.s)") = 0,
            _Ron(displayUnit="(mmHg.s)/g") = 399.967162245) annotation (
              Placement(transformation(origin={127,64}, extent={{-13,12},{13,-12}})));
          Physiolib.Fluid.Components.ElasticVesselElastance Eitha(
            useM0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            mass_start=0.204,
            ZeroPressureMass=0.14,
            ExternalPressure=101325-533.28954966,
            Elastance=190651.01400345,
            nHydraulicPorts=2)
            annotation (Placement(transformation(extent={{168,6},{190,28}})));
          Physiolib.Fluid.Components.ElasticVesselElastance Eetha(
            mass_start(displayUnit="g") = 0.526,
            useM0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            ZeroPressureMass=0.37,
            Elastance=74127.24740274,
            nHydraulicPorts=2)
            annotation (Placement(transformation(extent={{56,4},{82,30}})));
          Physiolib.Fluid.Components.Inertia inertia(I(displayUnit="mmHg.s2/g")=
                 93.3256711905, massFlow_start(displayUnit="g/min") = 2.1666666666667e-02)
            annotation (Placement(transformation(
                extent={{-11,-11},{11,11}},
                rotation=180,
                origin={141,17})));
          Physiolib.Fluid.Components.Resistor Retha(useConductanceInput=false,
              Resistance(displayUnit="(mmHg.s)/g") = 7999.3432449)
            annotation (Placement(transformation(extent={{90,6},{112,28}})));
          Physiolib.Fluid.Components.Resistor Rsart(useConductanceInput=false,
              Resistance(displayUnit="(mmHg.s)/g") = 106657.909932)
            annotation (Placement(transformation(extent={{14,-13},{-14,13}},
                  origin={24,17})));
          Physiolib.Fluid.Components.Resistor Rsven(useConductanceInput=false,
              Resistance(displayUnit="(mmHg.s)/g") = 26664.477483) annotation (
             Placement(transformation(extent={{14,-13},{-14,13}}, origin={-60,17})));
          Physiolib.Fluid.Components.ElasticVesselElastance Est(
            useM0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            mass_start=0.283,
            ZeroPressureMass=0.185,
            Elastance=34930.46550273,
            nHydraulicPorts=2)
            annotation (Placement(transformation(extent={{-28,6},{-4,28}})));
          Physiolib.Fluid.Components.Resistor Rethv(useConductanceInput=false,
              Resistance(displayUnit="(mmHg.s)/g") = 11999.01486735)
            annotation (Placement(transformation(extent={{-120,4},{-146,30}})));
          Physiolib.Fluid.Components.Resistor Rrain(useConductanceInput=false,
              Resistance(displayUnit="(mmHg.s)/g") = 399.967162245)
            annotation (Placement(transformation(extent={{-208,4},{-236,30}})));
          Physiolib.Fluid.Components.ElasticVesselElastance Eithv(
            useM0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            mass_start=1.48,
            ZeroPressureMass=1.19,
            ExternalPressure=101325-533.28954966,
            Elastance=2426.467450953,
            nHydraulicPorts=2)
            annotation (Placement(transformation(extent={{-194,4},{-166,30}})));
          Physiolib.Fluid.Components.ElasticVesselElastance Eethv(
            useM0Input=false,
            useExternalPressureInput=false,
            useComplianceInput=false,
            mass_start=1.53,
            ZeroPressureMass=1,
            Elastance=2253.1483473135,
            nHydraulicPorts=2)
            annotation (Placement(transformation(extent={{-108,4},{-82,30}})));
          Physiolib.Fluid.Components.ElasticVesselElastance RightAtrium(
            useComplianceInput=true,
            useM0Input=false,
            useExternalPressureInput=false,
            mass_start=0.135,
            ZeroPressureMass=3e-02,
            ExternalPressure=101325-533.28954966,
            nHydraulicPorts=2)                    annotation (Placement(
                transformation(extent={{-242,44},{-214,72}})));
          Physiolib.Fluid.Components.ElasticVesselElastance RightVentricle(
            useComplianceInput=true,
            useM0Input=false,
            useExternalPressureInput=false,
            mass_start=0.131,
            ZeroPressureMass=4e-02,
            ExternalPressure=101325-533.28954966,
            nHydraulicPorts=2)                    annotation (Placement(
                transformation(extent={{-170,42},{-140,72}})));
          Physiolib.Fluid.Components.IdealValveResistance PulmonaryValve(
            _Goff(displayUnit="g/(mmHg.s)") = 0,
            useLimitationInputs=false,
            _Ron(displayUnit="(mmHg.s)/g") = 399.967162245) annotation (
              Placement(transformation(extent={{-132,70},{-106,44}})));
          Parts.AtrialElastance RAtrialElastance(EMIN=6666.11937075, EMAX=
                19998.35811225)
            annotation (Placement(transformation(extent={{-244,86},{-206,118}})));
          Parts.VentricularElastance RVentricularElastance(EMIN=7599.376082655,
              EMAX=65327.96983335)
            annotation (Placement(transformation(extent={{-180,88},{-150,122}})));
          Physiolib.Fluid.Components.IdealValveResistance TricuspidValve(
            _Goff=0,
            useLimitationInputs=false,
            _Ron(displayUnit="(mmHg.s)/g") = 399.967162245) annotation (
              Placement(transformation(origin={-189,58}, extent={{-13,12},{13,-12}})));
          replaceable Physiolib.Types.Constants.FrequencyConst HeartRate(k(displayUnit = "1/min") = 1.2) annotation(Placement(transformation(origin = {-243, 128.5}, extent = {{-11, -6.5}, {11, 6.5}})));
        equation
          connect(LeftVentricle.compliance, LVentricularElastance.Ct) annotation (
             Line(
              points={{164,78},{164,74},{212,74},{212,107.68},{203.42,107.68}},
              color={0,0,127}));
          connect(Retha.q_out, inertia.q_out) annotation (Line(
              points={{112,17},{130,17}},
              thickness=1));
          connect(RightAtrium.compliance,RAtrialElastance. Ct) annotation(Line(points={{-228,72},
                  {-228,92},{-202.39,92},{-202.39,101.84}},                                                                                           color = {0, 0, 127}));
          connect(RightVentricle.compliance,RVentricularElastance. Ct) annotation(Line(points={{-155,72},
                  {-155,80},{-126,80},{-126,108.91},{-147.15,108.91}},                                                                                                   color = {0, 0, 127}));
          connect(LeftAtrium.compliance, LAtrialElastance.Ct) annotation (Line(
              points={{88,78},{88,74},{121.61,74},{121.61,107.84}},
              color={0,0,127}));
          connect(HeartRate.y,RAtrialElastance. HR) annotation(Line(points = {{-229.25, 128.5}, {-225, 128.5}, {-225, 114.8}}, color = {0, 0, 127}));
          connect(RVentricularElastance.HR, HeartRate.y) annotation(Line(points = {{-165, 118.6}, {-165, 128.5}, {-229.25, 128.5}}, color = {0, 0, 127}));
          connect(LAtrialElastance.HR, HeartRate.y) annotation (Line(
              points={{99,120.8},{99,128.5},{-229.25,128.5}},
              color={0,0,127}));
          connect(LVentricularElastance.HR, HeartRate.y) annotation (Line(
              points={{182,116.8},{182,128.5},{-229.25,128.5}},
              color={0,0,127}));
          connect(Rrain.q_out, RightAtrium.q_in[1]) annotation (Line(
              points={{-236,17},{-254,17},{-254,59.82},{-228.42,59.82}},
              color={127,0,0},
              thickness=0.5));
          connect(RightAtrium.q_in[2], TricuspidValve.q_in) annotation (Line(
              points={{-228.42,56.18},{-214,56.18},{-214,58},{-202,58}},
              color={127,0,0},
              thickness=0.5));
          connect(TricuspidValve.q_out, RightVentricle.q_in[1]) annotation (
              Line(
              points={{-176,58},{-166,58},{-166,58.95},{-155.45,58.95}},
              color={127,0,0},
              thickness=0.5));
          connect(RightVentricle.q_in[2], PulmonaryValve.q_in) annotation (Line(
              points={{-155.45,55.05},{-143.725,55.05},{-143.725,57},{-132,57}},

              color={127,0,0},
              thickness=0.5));
          connect(PulmonaryValve.q_out, Epa.q_in[1]) annotation (Line(
              points={{-106,57},{-94,57},{-94,99.82},{-80.42,99.82}},
              color={127,0,0},
              thickness=0.5));
          connect(Epa.q_in[2], Rpp.q_in) annotation (Line(
              points={{-80.42,96.18},{-68,96.18},{-68,98},{-56,98}},
              color={127,0,0},
              thickness=0.5));
          connect(Rpp.q_out, Epv.q_in[1]) annotation (Line(
              points={{-22,98},{-8,98},{-8,99.82},{6.49,99.82}},
              color={127,0,0},
              thickness=0.5));
          connect(Epv.q_in[2], Rlain.q_in) annotation (Line(
              points={{6.49,96.18},{16,96.18},{16,98},{26,98}},
              color={127,0,0},
              thickness=0.5));
          connect(Rlain.q_out, LeftAtrium.q_in[1]) annotation (Line(
              points={{56,98},{70,98},{70,65.82},{87.58,65.82}},
              color={127,0,0},
              thickness=0.5));
          connect(LeftAtrium.q_in[2], MitralValve.q_in) annotation (Line(
              points={{87.58,62.18},{102,62.18},{102,64},{114,64}},
              color={127,0,0},
              thickness=0.5));
          connect(MitralValve.q_out, LeftVentricle.q_in[1]) annotation (Line(
              points={{140,64},{154,64},{154,66},{163.58,66},{163.58,65.82}},
              color={127,0,0},
              thickness=0.5));
          connect(LeftVentricle.q_in[2], AorticValve.q_in) annotation (Line(
              points={{163.58,62.18},{172,62.18},{172,64},{184,64}},
              color={127,0,0},
              thickness=0.5));
          connect(AorticValve.q_out, Eitha.q_in[1]) annotation (Line(
              points={{208,64},{224,64},{224,18.43},{178.67,18.43}},
              color={127,0,0},
              thickness=0.5));
          connect(inertia.q_in, Eitha.q_in[2]) annotation (Line(
              points={{152,17},{164,17},{164,15.57},{178.67,15.57}},
              color={127,0,0},
              thickness=0.5));
          connect(Retha.q_in, Eetha.q_in[1]) annotation (Line(
              points={{90,17},{80,17},{80,18.69},{68.61,18.69}},
              color={127,0,0},
              thickness=0.5));
          connect(Rsart.q_in, Eetha.q_in[2]) annotation (Line(
              points={{38,17},{52,17},{52,15.31},{68.61,15.31}},
              color={127,0,0},
              thickness=0.5));
          connect(Est.q_in[1], Rsart.q_out) annotation (Line(
              points={{-16.36,18.43},{-3.18,18.43},{-3.18,17},{10,17}},
              color={127,0,0},
              thickness=0.5));
          connect(Est.q_in[2], Rsven.q_in) annotation (Line(
              points={{-16.36,15.57},{-31.18,15.57},{-31.18,17},{-46,17}},
              color={127,0,0},
              thickness=0.5));
          connect(Rsven.q_out, Eethv.q_in[1]) annotation (Line(
              points={{-74,17},{-86,17},{-86,18.69},{-95.39,18.69}},
              color={127,0,0},
              thickness=0.5));
          connect(Rethv.q_in, Eethv.q_in[2]) annotation (Line(
              points={{-120,17},{-107,17},{-107,15.31},{-95.39,15.31}},
              color={127,0,0},
              thickness=0.5));
          connect(Rethv.q_out, Eithv.q_in[1]) annotation (Line(
              points={{-146,17},{-164,17},{-164,18.69},{-180.42,18.69}},
              color={127,0,0},
              thickness=0.5));
          connect(Rrain.q_in, Eithv.q_in[2]) annotation (Line(
              points={{-208,17},{-194,17},{-194,15.31},{-180.42,15.31}},
              color={127,0,0},
              thickness=0.5));
          annotation(Diagram(coordinateSystem(extent={{-280,-140},{280,180}},      preserveAspectRatio=false)),             Icon(coordinateSystem(extent = {{-280, -140}, {280, 180}}, preserveAspectRatio = false), graphics),
            Documentation(info="<html>
<p>Model of cardiovascular system using to demonstrate elastic and resistance features of veins and arteries in pulmonary and systemic circulation and influence of cardiac output on it.</p>
<ul>
<li>J. A. Goodwin, W. L. van Meurs, C. D. Sa Couto, J. E. W.Beneken, S. A. Graves, A model for educational simulation of infant cardiovascular physiology., Anesthesia and analgesia 99 (6)(2004) 1655&ndash;1664. doi:10.1213/01.ANE.0000134797.52793.AF.</li>
<li>C. D. Sa Couto, W. L. van Meurs, J. A. Goodwin, P. Andriessen,A Model for Educational Simulation of Neonatal Cardiovascular Pathophysiology, Simulation in Healthcare 1 (Inaugural) (2006) 4&ndash;12.</li>
<li>W. van Meurs, Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology, McGraw-Hill Professional, 2011.</li>
</ul>
</html>",         revisions="<html>
<ul>
<li><i>Jul 2015 </i>by Tomas Kulhanek: Created. </li>
</ul>
</html>"),  experiment(StopTime=5));
        end HemodynamicsMeurs_flatNorm;
        annotation(Documentation(info="<html>
</html>"));
      end MeursModel2011;

    end Examples;
  end Fluid;

  package Thermal
    "Domain with Temperature and Heat Flow - extension of Modelica.Thermal.HeatTransfer"
   extends Modelica.Icons.Package;
    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;

      model SkinHeatFlow
      extends Modelica.Icons.Example;

        Components.IdealRadiator skinCirculation(MassFlow(displayUnit="g/min")=
            0.0028333333333333) "Blood flow through skin"
          annotation (Placement(transformation(extent={{16,-32},{36,-12}})));
        Sources.UnlimitedHeat bodyCore(T(displayUnit="degC") = 310.15)
          annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
        Sources.UnlimitedHeat skin(T(displayUnit="degC") = 301.15)
          annotation (Placement(transformation(extent={{-8,4},{12,24}})));
      equation
        connect(skinCirculation.q_in, bodyCore.port) annotation (Line(
            points={{16,-20},{0,-20}},
            color={191,0,0},
            thickness=1));
        connect(skin.port, skinCirculation.q_out) annotation (Line(
            points={{12,14},{26,14},{26,-12}},
            color={191,0,0},
            thickness=1));
        annotation (        experiment(StopTime=10000, Tolerance=1e-006),
            Documentation(revisions=
                          "<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SkinHeatFlow;

      model MuscleHeat
      extends Modelica.Icons.Example;

        Components.HeatAccumulation
                         muscle(
          relativeHeat_start=52125.66,
          SpecificHeat=3475.044,
          Weight(displayUnit="kg") = 15)
          annotation (Placement(transformation(extent={{16,22},{36,42}})));
        Components.IdealRadiator
                      muscleCirculation(MassFlow(displayUnit="g/min") = 0.0114)
          "Blood circulation in skeletal muscle"
          annotation (Placement(transformation(extent={{16,-32},{36,-12}})));
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow generatedHeat(Q_flow=13.956)
          "Heat energy created by muscle"
          annotation (Placement(transformation(extent={{-32,20},{-12,40}})));
        Sources.UnlimitedHeat                                  body(T(displayUnit="degC")=
               310.15)
          annotation (Placement(transformation(extent={{-32,-30},{-12,-10}})));
      equation
        connect(muscle.q_in, generatedHeat.port)
                                              annotation (Line(
            points={{26,32},{8,32},{8,30},{-12,30}},
            color={191,0,0},
            thickness=1));
        connect(muscleCirculation.q_in, body.port) annotation (Line(
            points={{16,-20},{-12,-20}},
            color={191,0,0},
            thickness=1));
        connect(muscle.q_in, muscleCirculation.q_out) annotation (Line(
            points={{26,32},{26,-12}},
            color={191,0,0},
            thickness=1));
        annotation (        experiment(StopTime=10000, Tolerance=1e-006),
            Documentation(revisions=
                          "<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end MuscleHeat;

      model ThermalBody_QHP
        import Physiolib;
        extends Modelica.Icons.Example;
        Thermal.Components.HeatAccumulation core(SpecificHeat=3475.044, Weight=
              10.75)
          annotation (Placement(transformation(extent={{-12,-4},{8,16}})));
        Thermal.Components.HeatAccumulation GILumen(Weight=1)
          annotation (Placement(transformation(extent={{40,-52},{60,-32}})));
        Thermal.Components.HeatAccumulation skeletalMuscle(SpecificHeat=
              3475.044, Weight=7.05)
          annotation (Placement(transformation(extent={{36,42},{56,62}})));
        Thermal.Components.IdealRadiator muscleBloodFlow(
          MassFlow(displayUnit="g/min") = 0.0114,
          useMassFlowInput=false,
          SpecificHeat=3851.856) annotation (Placement(transformation(extent={{
                  -10,-10},{10,10}}, origin={32,30})));
        Thermal.Sources.MassOutflow urination
          annotation (Placement(transformation(extent={{-28,-60},{-48,-40}})));
        Thermal.Sources.MassOutflow lungsVapor(
          VaporizationHeat(displayUnit="kcal/g") = 2428344,
          SpecificHeat(displayUnit="kcal/(kg.K)"),
          MassFlow(displayUnit="g/min") = 4.6666666666667e-06)
          annotation (Placement(transformation(extent={{12,66},{32,86}})));
        Thermal.Components.HeatAccumulation skin(
          relativeHeat_start=-8373.6,
          SpecificHeat=3475.044,
          Weight=0.56)
          annotation (Placement(transformation(extent={{-68,4},{-48,24}})));
        Thermal.Components.IdealRadiator skinBloodFlow(
          MassFlow(displayUnit="g/min") = 0.0028333333333333,
          useMassFlowInput=false,
          SpecificHeat=3851.856) annotation (Placement(transformation(extent={{
                  10,-10},{-10,10}}, origin={-28,2})));
        Thermal.Sources.MassOutflow insensibleVapor(
          VaporizationHeat(displayUnit="kcal/g") = 2428344,
          SpecificHeat(displayUnit="kcal/(kg.K)"),
          MassFlow(displayUnit="g/min") = 6.5e-06)
          annotation (Placement(transformation(extent={{-48,32},{-28,52}})));
        Thermal.Sources.MassOutflow sweating(VaporizationHeat(displayUnit=
                "kcal/g") = 2428344, SpecificHeat(displayUnit="kcal/(kg.K)"))
          annotation (Placement(transformation(extent={{-44,58},{-24,78}})));
        Modelica.Thermal.HeatTransfer.Components.ThermalConductor lumenVolume(G(
              displayUnit="kcal/(min.K)") = 1)
          annotation (Placement(transformation(extent={{32,-60},{12,-40}})));
        Modelica.Thermal.HeatTransfer.Components.ThermalConductor air(G(
              displayUnit="kcal/(min.K)") = 2.4423)                   annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-76,50})));
        Thermal.Sources.UnlimitedHeat ambient(T=295.15) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-76,84})));
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow skinMetabolicHeat(Q_flow=
              1.95384)
          annotation (Placement(transformation(extent={{-92,2},{-72,22}})));
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow coreMetabolicHeat(Q_flow=
              55.824)
          annotation (Placement(transformation(extent={{86,-6},{66,14}})));
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow muscleMetabolicHeat(Q_flow(
              displayUnit="kcal/min") = 9.7692)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={78,60})));
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow foodHeatIntake(Q_flow=0)
                                                                       annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={78,-38})));
        Thermal.Components.Stream foodAbsorption(SpecificHeat=4186.8)
          annotation (Placement(transformation(extent={{44,-32},{24,-12}})));
      equation

        connect(core.q_in, muscleBloodFlow.q_in) annotation (Line(
            points={{-2,6},{-2,32},{22,32}},
            color={191,0,0},
            thickness=1));
        connect(skeletalMuscle.q_in, muscleBloodFlow.q_out) annotation (Line(
            points={{46,52},{32,52},{32,40}},
            color={191,0,0},
            thickness=1));
        connect(core.q_in, urination.q_in) annotation (Line(
            points={{-2,6},{-6,6},{-6,-50},{-28,-50}},
            color={191,0,0},
            thickness=1));
        connect(core.q_in, lungsVapor.q_in) annotation (Line(
            points={{-2,6},{-2,76},{12,76}},
            color={191,0,0},
            thickness=1));
        connect(skinBloodFlow.q_in, lungsVapor.q_in) annotation (Line(
            points={{-18,4},{-2,4},{-2,76},{12,76}},
            color={191,0,0},
            thickness=1));
        connect(skin.q_in, skinBloodFlow.q_out) annotation (Line(
            points={{-58,14},{-28,14},{-28,12}},
            color={191,0,0},
            thickness=1));
        connect(skin.q_in, insensibleVapor.q_in) annotation (Line(
            points={{-58,14},{-58,42},{-48,42}},
            color={191,0,0},
            thickness=1));
        connect(sweating.q_in, insensibleVapor.q_in) annotation (Line(
            points={{-44,68},{-58,68},{-58,42},{-48,42}},
            color={191,0,0},
            thickness=1));
        connect(GILumen.q_in, lumenVolume.port_a) annotation (Line(
            points={{50,-42},{40,-42},{40,-50},{32,-50}},
            color={191,0,0},
            thickness=1));
        connect(core.q_in, lumenVolume.port_b) annotation (Line(
            points={{-2,6},{2,6},{2,-50},{12,-50}},
            color={191,0,0},
            thickness=1));
        connect(skin.q_in, air.port_b) annotation (Line(
            points={{-58,14},{-58,30},{-76,30},{-76,40}},
            color={191,0,0},
            thickness=1));
        connect(skin.q_in, skinMetabolicHeat.port)
                                                annotation (Line(
            points={{-58,14},{-66,14},{-66,12},{-72,12}},
            color={191,0,0},
            thickness=1));
        connect(GILumen.q_in, foodHeatIntake.port)
                                               annotation (Line(
            points={{50,-42},{60,-42},{60,-38},{68,-38}},
            color={191,0,0},
            thickness=1));
        connect(skeletalMuscle.q_in, muscleMetabolicHeat.port)
                                                            annotation (Line(
            points={{46,52},{58,52},{58,60},{68,60}},
            color={191,0,0},
            thickness=1));
        connect(core.q_in, coreMetabolicHeat.port)
                                                annotation (Line(
            points={{-2,6},{32,6},{32,4},{66,4}},
            color={191,0,0},
            thickness=1));
        connect(skinBloodFlow.q_in, core.q_in) annotation (Line(
            points={{-18,4},{-12,4},{-12,6},{-2,6}},
            color={191,0,0},
            thickness=1));
        connect(GILumen.q_in,foodAbsorption. q_in)
                                               annotation (Line(
            points={{50,-42},{50,-22},{44,-22}},
            color={191,0,0},
            thickness=1));
        connect(foodAbsorption.q_out, core.q_in)
                                             annotation (Line(
            points={{24,-22},{2,-22},{2,6},{-2,6}},
            color={191,0,0},
            thickness=1));
        connect(ambient.port, air.port_a) annotation (Line(
            points={{-76,74},{-76,60}},
            color={191,0,0},
            thickness=1));
        annotation ( Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=3600));
      end ThermalBody_QHP;

      model SkinHeatTransferOnBloodFlow
      extends Modelica.Icons.Example;

        Components.IdealRadiator skinCirculation(MassFlow(displayUnit="g/min")=
            0.0028333333333333) "Blood circulation through skin"
          annotation (Placement(transformation(extent={{16,-32},{36,-12}})));
        Sources.UnlimitedHeat                                  core(T(displayUnit="degC")=
               310.15)
          annotation (Placement(transformation(extent={{-32,-30},{-12,-10}})));
        Sources.UnlimitedHeat skin(T(displayUnit="degC") = 301.15)
          annotation (Placement(transformation(extent={{-12,2},{8,22}})));
      equation
        connect(skinCirculation.q_in, core.port) annotation (Line(
            points={{16,-20},{-12,-20}},
            color={191,0,0},
            thickness=1));
        connect(skin.port, skinCirculation.q_out) annotation (Line(
            points={{8,12},{26,12},{26,-12}},
            color={191,0,0},
            thickness=1));
        annotation (        experiment(StopTime=10000, Tolerance=1e-006),
            Documentation(revisions=
                          "<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>This flow rate can affect how much heat leaves the body, especially in cold conditions. This is shown in this model, where modeling constant temperatures of the body core (37&deg;C) and skin (28&deg;C), with a skin blood flow of 170 g/min and blood specific heat of 0.92 kcal/(kg.K), gives heat losses of about 1.4 kcal/min.</p>
</html>"));
      end SkinHeatTransferOnBloodFlow;
    end Examples;

    package Components
      extends Modelica.Icons.Package;

      model HeatAccumulation "Accumulating of heat to substance"
        extends Physiolib.Icons.HeatAccumulation;
      //  extends Physiolib.SteadyStates.Interfaces.SteadyState(state_start=
      //        relativeHeat_start, storeUnit="kcal");
        Interfaces.HeatPort_b
                         q_in "Heat inflow/outflow connector"
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

        parameter Physiolib.Types.Heat relativeHeat_start=0
          "Heat start value = weight*(initialTemperature - 37degC)*specificHeat"
          annotation (Dialog(group="Initialization"));

        parameter Physiolib.Types.SpecificHeatCapacity SpecificHeat=4186.8
          "Mass specific heat";
        Physiolib.Types.Temperature T "Current temperature";

        Physiolib.Types.RealIO.HeatOutput relativeHeat( start=relativeHeat_start)
          "Current accumulated heat = weight*(T - 37degC)*specificHeat"
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-100}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,-100})));                                           //nominal=1
       //absoluteHeat =  weight*310.15*specificHeat + relativeHeat

        constant Physiolib.Types.Temperature NormalBodyTemperature=310.15
          "Shift of absolute zero temperature to normal body values";

        parameter Boolean useMassInput = false "=true, if mass input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolib.Types.Mass Weight=1
          "Total mass weight if useMassInput=false"
          annotation (Dialog(enable=not useMassInput));
        Physiolib.Types.RealIO.MassInput weight(start=Weight)=m if
          useMassInput "Weight of mass, where the heat are accumulated"
          annotation (Placement(transformation(extent={{-120,60},{-80,100}})));
      protected
        Physiolib.Types.Mass m;

      equation
        if not useMassInput then
          m=Weight;
        end if;

        q_in.T=NormalBodyTemperature + relativeHeat/(m*SpecificHeat);
        T = q_in.T;

        //state = relativeHeat;  //
        der(relativeHeat)=q_in.Q_flow;
        //change = q_in.Q_flow;
        annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>The &quot;HeatAccumulation&quot; library class models heat accumulation in Physiolib. This class has one thermal connector with temperature and heat flow. Heat energy is accumulated inside the class, stored in the variable &quot;relativeHeat&quot;. This value is relative to normal body temperature of 37 &deg;C; a positive value therefore indicates an internal temperature above 37 &deg;C, while a negative value indicates temperature below 37 &deg;C. Of course the particular value of temperature depends on the mass and specific heat of the instance.</p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                  100,100}}),
               graphics={
              Text(
                extent={{-80,100},{220,140}},
                textString="%name",
                lineColor={0,0,255})}));
      end HeatAccumulation;

      model IdealRadiator
        "Closed circiut radiator, where outflowed = ambient temperature"
        extends Interfaces.ConditionalMassFlow;
        extends Physiolib.Icons.Radiator;

        parameter Physiolib.Types.SpecificHeatCapacity SpecificHeat=3851.856
          "Specific heat of flow circuit medium";  //default heat capacity of blood is used as 0.92 kcal/(degC.kg)

        Thermal.Interfaces.HeatPort_a q_in
          annotation (Placement(transformation(extent={{-110,10},{-90,30}})));
        Thermal.Interfaces.HeatPort_b q_out
          annotation (Placement(transformation(extent={{-10,90},{10,110}})));
      equation
        q_in.Q_flow + q_out.Q_flow = 0;
      //  assert(substanceFlow>=-Modelica.Constants.eps,"In IdealRadiator must be always the forward flow direction! Not 'substanceFlow<0'!");
        q_in.Q_flow = q*(q_in.T-q_out.T)*SpecificHeat;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                  100}}),     graphics={
              Text(
                extent={{-144,-142},{156,-102}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",       info="<html>
<p>This class has two thermal connectors &ndash; one for liquid inside the radiator and another for the material around the radiator. Note that there is no liquid flow inside these connectors. The liquid flow can be described by a parameter or input to the instance. Together with the liquid specific heat, this flow determines the amount of heat flux from the liquid to a surrounding environment of different temperature. The calculation fulfills the ideal condition of microcirculation, where the outflowing blood has the same temperature as a tissue. This is really useful for modeling body thermal transfers, because the transfer of heat with blood flow is more significant than the typical rate of conduction through solid mass.&nbsp;</p>
<p><br>The real inflow to radiator can be described by substanceFlow and temperature q_in.T.</p>
<p><b>q_in.q=q_out.q is not the heat inflow to Radiator input</b>, but the heat convected from radiator to environment!</p>
<p>The environment temperature is the same as radiator output temperature q_out.T. </p>
<p>And the flow of heat from radiator to environment is driven by Fick principle.</p>
</html>"));
      end IdealRadiator;

      model Conductor "Heat resistor"
       extends Interfaces.OnePort;
       extends Physiolib.Icons.Resistor;

        parameter Boolean useConductanceInput = false
          "=true, if external conductance value is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolib.Types.ThermalConductance Conductance=0
          "Thermal conductance if useConductanceInput=false"
          annotation (Dialog(enable=not useConductanceInput));

        Physiolib.Types.RealIO.ThermalConductanceInput conductance(start=
              Conductance)=c if useConductanceInput annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40})));

      protected
         Physiolib.Types.ThermalConductance c;
      equation
        if not useConductanceInput then
          c=Conductance;
        end if;

        q_in.Q_flow = c * (q_in.T - q_out.T);
        annotation (Icon(graphics={Text(
                extent={{-70,-30},{70,30}},
                textString="%name",
                lineColor={0,0,255})}), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Conductor;

      model Stream "Flow of whole heated mass"
        extends Interfaces.OnePort;
        extends Interfaces.ConditionalMassFlow;

        parameter Physiolib.Types.SpecificHeatCapacity SpecificHeat
          "Of flow circuit medium";

      equation
        q_in.Q_flow = if (q>0) then q*q_in.T*SpecificHeat else q*q_out.T*SpecificHeat;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={191,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{20,-84},{320,-44}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p><h4><font color=\"#008000\">Bidirectional heated mass flow by temperature</font></h4></p>
<p>Possible field values: </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0.1\"><tr>
<td></td>
<td><p align=\"center\"><h4>forward flow</h4></p></td>
<td><p align=\"center\"><h4>backward flow</h4></p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>massFlow</h4></p></td>
<td><p align=\"center\">&gt;=0</p></td>
<td><p align=\"center\">&lt;=0</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_in.q</h4></p></td>
<td><p align=\"center\">=massFlow*q_in.T*SpecificHeat</p></td>
<td><p align=\"center\">=-q_out.q</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_out.q</h4></p></td>
<td><p align=\"center\">=-q_in.q</p></td>
<td><p align=\"center\">=massFlow*q_out.T*SpecificHeat</p></td>
</tr>
</table>
<br/>
</html>"));
      end Stream;

    end Components;

    package Sources
      extends Modelica.Icons.SourcesPackage;
      model UnlimitedHeat "Prescribed temperature"
        //extends Modelica.Thermal.HeatTransfer.Sources.FixedTemperature;

        parameter Boolean useTemperatureInput = false
          "=true, if fixed temperature is from input instead of parameter"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

         parameter Physiolib.Types.Temperature T=0
          "Fixed temperature at port if useTemperatureInput=false"
          annotation (Dialog(enable=not useTemperatureInput));

        parameter Boolean isIsolatedInSteadyState = false
          "=true, if there is no flow at port in steady state"
          annotation (Dialog(group="Simulation",tab="Equilibrium"));
      /*
  parameter Physiolib.Types.SimulationType Simulation=Physiolib.Types.SimulationType.NormalInit
    "If in equilibrium, then zero-flow equation is added."
    annotation (Dialog(group="Simulation", tab="Equilibrium"));
    */

        Interfaces.HeatPort_b       port annotation (Placement(transformation(extent={{90,-10},
                  {110,10}})));

      protected
        Physiolib.Types.Temperature t "Current temperature";
      public
        Physiolib.Types.RealIO.TemperatureInput temperature(start=T)=t if
          useTemperatureInput
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
      /*
initial equation 
  if isIsolatedInSteadyState and (Simulation == Physiolib.Types.SimulationType.InitSteadyState) then
    port.Q_flow = 0;
  end if;
*/
      equation
        if not useTemperatureInput then
          t=T;
        end if;

        port.T = t;
      /*
  if isIsolatedInSteadyState and (Simulation == Physiolib.Types.SimulationType.SteadyState) then
      port.Q_flow = 0;
  end if;
*/
         annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                              graphics={
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-150,-110},{150,-140}},
                lineColor={0,0,0},
                textString="T=%T"),
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                pattern=LinePattern.None,
                fillColor={159,159,223},
                fillPattern=FillPattern.Backward),
              Text(
                extent={{0,0},{-100,-100}},
                lineColor={0,0,0},
                textString="K"),
              Line(
                points={{-52,0},{56,0}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{50,-20},{50,20},{90,0},{50,-20}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid)}),
          Documentation(info="<HTML>
<p>
This model defines a fixed temperature T at its port in Kelvin,
i.e., it defines a fixed temperature as a boundary condition.
</p>
</HTML>
",       revisions=
               "<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end UnlimitedHeat;

      model MassOutflow
        "One-directional outflow of heated mass with enthalpy (vaporization heat)"
        extends Interfaces.ConditionalMassFlow;

        Interfaces.HeatPort_a
                         q_in "flow circuit"     annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}})));
        parameter Physiolib.Types.SpecificEnergy VaporizationHeat=0
          "Used for whole outflow stream";                                            // or 2428344 for water vaporization
        parameter Physiolib.Types.SpecificHeatCapacity SpecificHeat=4186.8
          "Of outflowing medium";  //default heat capacity of water is 1 kcal/(degC.kg)

      equation
      //  assert(liquidOutflow_>=-Modelica.Constants.eps,"HeatOutstream must have always one forward flow direction! Not 'liquidOutflow_<0'!");
        q_in.Q_flow = q*(q_in.T*SpecificHeat + VaporizationHeat);

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                              graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={191,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{20,-84},{320,-44}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end MassOutflow;

      model MassInflow
        "One-directional inflow of heated mass with enthalpy (heat of solvation)"
        extends Interfaces.ConditionalMassFlow;
        extends Interfaces.ConditionalTemperature;

        Interfaces.HeatPort_b
                         q_out "flow circuit"     annotation (Placement(
              transformation(extent={{90,-10},{110,10}}), iconTransformation(
                extent={{90,-10},{110,10}})));
        parameter Physiolib.Types.SpecificEnergy dH=0
          "Enthalpy of incoming substance (i.e. enthalpy of solvation)";                                            // or 2428344 for water vaporization
        parameter Physiolib.Types.SpecificHeatCapacity SpecificHeat=4186.8
          "Of inflowing medium";  //default heat capacity of water is 1 kcal/(degC.kg)

      equation
      //  assert(liquidOutflow_>=-Modelica.Constants.eps,"HeatOutstream must have always one forward flow direction! Not 'liquidOutflow_<0'!");
        q_out.Q_flow = - q*(temperature*SpecificHeat + dH);

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={191,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{20,-84},{320,-44}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end MassInflow;
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

      connector HeatPort = Modelica.Thermal.HeatTransfer.Interfaces.HeatPort(T(displayUnit="degC"),Q_flow(displayUnit="kcal/min", nominal=4186.8/60));
      connector HeatPort_a "Heat inflow"
        extends HeatPort;

        annotation (
          defaultComponentName="port_a",
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={191,0,0},
                lineThickness=1),       Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid)}),
          Diagram(graphics={
                        Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
         Text(extent={{-160,110},{40,50}},   lineColor = {191,0,0}, textString = "%name")}));
      end HeatPort_a;

      connector HeatPort_b "Heat outflow"
        extends HeatPort;

      annotation (
          defaultComponentName="port_b",
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={191,0,0},
                lineThickness=1),       Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={191,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(graphics={
                        Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={191,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
         Text(extent={{-160,110},{40,50}},   lineColor = {191,0,0}, textString = "%name")}));

      end HeatPort_b;

      partial model OnePort "Heat OnePort"

        HeatPort_a       q_in annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}})));
        HeatPort_b       q_out annotation (Placement(
              transformation(extent={{90,-10},{110,10}})));
      equation
        q_in.Q_flow + q_out.Q_flow = 0;
        annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end OnePort;

      partial model ConditionalMassFlow
        "Input of mass flow vs. parametric mass flow"

        parameter Boolean useMassFlowInput = false
          "=true, if mass flow input is used instead of parameter MassFlow"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolib.Types.MassFlowRate MassFlow=0
          "Mass flow if useMassFlowInput=false"
          annotation (Dialog(enable=not useMassFlowInput));

        Physiolib.Types.RealIO.MassFlowRateInput massFlow(start=MassFlow)=q if
             useMassFlowInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-80,70})));

        Physiolib.Types.MassFlowRate q "Current mass flow";
      equation
        if not useMassFlowInput then
          q = MassFlow;
        end if;

      end ConditionalMassFlow;

      partial model ConditionalTemperature
        "Input of temperature vs. parametric temperature"

        parameter Boolean useTemperatureInput = false
          "=true, if temperature input is used instead of parameter T"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolib.Types.Temperature T=0
          "Temperature if useTemperatureInput=false"
          annotation (Dialog(enable=not useTemperatureInput));

        Physiolib.Types.RealIO.TemperatureInput t(start=T)=temperature if
          useTemperatureInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-80,70}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,70})));

        Physiolib.Types.Temperature temperature "Current temperature";
      equation
        if not useTemperatureInput then
          temperature = T;
        end if;

      end ConditionalTemperature;
    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>",   info="<html>
<p>For the human body to function optimally, it is critical to hold the core temperature at 35&ndash;39&deg;C. A fever of 41&deg;C for more than a short period of time causes brain damage. If the core temperature falls below 10&deg;C, the heart stops. As in the hydraulic domain, the thermal domain is simplified to these conditions. </p>
<p>In the Thermal package extends the package Modelica.Thermal.HeatTransfer from Modelica Standard Library 3.2 (MSL), where the connector is composed of temperature and heat flow. The main blocks in Thermal are: Conductor, IdealRadiator and HeatAccumulation. The heat conductor conducts the heat from the source, such us muscles or metabolically active tissue, to its surrounding. IdealRadiator delivers heat to tissues by blood circulation. HeatAccumulation plays a role in accumulating thermal energy in each tissue mass driven by its heat capacity. We recommend to use this block instead of Modelica.Thermal.HeatTransfer.HeatCapacitor to have possibility of variable mass amount or to have a support for calculation of steady state. </p>
</html>"));
  end Thermal;

  package Population
    "Domain for populatiom models for cells, viruses, bacterias, tissues, organism etc."
    extends Modelica.Icons.Package;
    package Examples "Examples that demonstrate usage of the Population models"
       extends Modelica.Icons.ExamplesPackage;

      model PredatorPrey "Lotka–Volterra equations"
        extends Modelica.Icons.Example;

        Components.Population predator(population_start=2)
          annotation (Placement(transformation(extent={{-8,42},{12,62}})));
        Components.Reproduction reproduction2(useChangePerMemberInput=true)
          annotation (Placement(transformation(extent={{-52,42},{-32,62}})));
        Components.Mortality mortality2(LifeTime(displayUnit="s") = 1)
          annotation (Placement(transformation(extent={{34,42},{54,62}})));
        Components.Reproduction reproduction1(LifeTime(displayUnit="s") = 1)
          annotation (Placement(transformation(extent={{-56,-40},{-36,-20}})));
        Components.Mortality mortality1(useChangePerMemberInput=true)
          annotation (Placement(transformation(extent={{32,-40},{52,-20}})));
        Components.Population prey(population_start=1)
          annotation (Placement(transformation(extent={{-12,-40},{8,-20}})));
        Physiolib.Types.Constants.PopulationChangePerMemberConst preyMortality(LifeTime(
              displayUnit="s") = 1)
          annotation (Placement(transformation(extent={{28,-4},{36,4}})));
        Physiolib.Blocks.Factors.Normalization predatorEffect
          annotation (Placement(transformation(extent={{52,-24},{32,-4}})));
        Physiolib.Types.Constants.PopulationChangePerMemberConst predatorReproduction(LifeTime(
              displayUnit="s") = 1)
          annotation (Placement(transformation(extent={{-56,80},{-48,88}})));
        Physiolib.Blocks.Factors.Normalization preyEffekt
          annotation (Placement(transformation(extent={{-52,60},{-32,80}})));
      equation
        connect(preyMortality.y, predatorEffect.yBase) annotation (Line(
            points={{37,0},{42,0},{42,-12}},
            color={0,0,127}));
        connect(predator.population, predatorEffect.u) annotation (Line(
            points={{8,42},{8,20},{56,20},{56,-14},{50,-14}},
            color={0,0,127}));
        connect(predatorReproduction.y, preyEffekt.yBase) annotation (Line(
            points={{-47,84},{-42,84},{-42,72}},
            color={0,0,127}));
        connect(prey.population, preyEffekt.u) annotation (Line(
            points={{4,-40},{4,-48},{-66,-48},{-66,70},{-50,70}},
            color={0,0,127}));
        connect(reproduction2.port_b, predator.port) annotation (Line(
            points={{-32,52},{2,52}},
            color={0,127,127},
            thickness=1));
        connect(predator.port, mortality2.port_a) annotation (Line(
            points={{2,52},{34.2,52}},
            color={0,127,127},
            thickness=1));
        connect(reproduction1.port_b, prey.port) annotation (Line(
            points={{-36,-30},{-2,-30}},
            color={0,127,127},
            thickness=1));
        connect(prey.port, mortality1.port_a) annotation (Line(
            points={{-2,-30},{32.2,-30}},
            color={0,127,127},
            thickness=1));
        connect(preyEffekt.y, reproduction2.changePerMember) annotation (Line(
            points={{-42,66},{-42,56}},
            color={0,0,127}));
        connect(predatorEffect.y, mortality1.changePerMember) annotation (Line(
            points={{42,-18},{42,-26}},
            color={0,0,127}));
        annotation (
          experiment(StopTime=20),
          __Dymola_experimentSetupOutput(equdistant=false));
      end PredatorPrey;
    end Examples;

    package Components
      extends Modelica.Icons.Package;
      model Population
        extends Physiolib.Icons.Population;
      /*  extends Physiolib.SteadyStates.Interfaces.SteadyState(
    state(nominal=NominalPopulation),
    change(nominal=NominalPopulationChange),
    state_start=population_start,
    storeUnit="1");
*/
        parameter Physiolib.Types.Population population_start(nominal=
              NominalPopulation)=1e-8 "Initial population size in compartment"
          annotation (HideResult=true, Dialog(group="Initialization"));

        parameter Physiolib.Types.Population NominalPopulation=1
          "Numerical scale. Default is 1, but for huge amount of cells it should be any number in the appropriate numerical order of typical amount."
          annotation (HideResult=true, Dialog(tab="Solver", group=
                "Numerical support of very huge populations"));
        parameter Physiolib.Types.PopulationChange NominalPopulationChange=1/(60*60*
            24)
          "Numerical scale. Default change is 1 individual per day, but for much faster or much slower chnages should be different."
          annotation (HideResult=true, Dialog(tab="Solver", group=
                "Numerical support of very fast or very slow changes"));

        Interfaces.PopulationPort_b port(population(nominal=NominalPopulation),change(nominal=NominalPopulationChange)) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}}), iconTransformation(extent={{-10,-10},{10,
                  10}})));

        Physiolib.Types.RealIO.PopulationOutput population(start = population_start,nominal=
              NominalPopulation) annotation (Placement(transformation(extent={{
                  46,-102},{66,-82}}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,-100})));
      equation
        port.population = population;

        //state = population; //
        der(population) = port.change;
        //change = port.change;
        annotation (Icon(graphics={
                        Text(
                extent={{-112,100},{248,140}},
                lineColor={0,0,255},
                textString="%name")}), Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Population;

      model Reproduction "As population change per one individual"
         extends Interfaces.ConditionalLifeTime;
        Interfaces.PopulationPort_b port_b annotation (Placement(transformation(
                extent={{90,-10},{110,10}}), iconTransformation(extent={{90,-10},{110,
                  10}})));
      equation
        port_b.change = - changePerPopulationMember * port_b.population;
        annotation (Icon(graphics={
              Rectangle(
                extent={{-100,-52},{100,48}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Polygon(
                points={{-80,23},{80,-2},{-80,-27},{-80,23}},
                lineColor={0,127,127},
                rotation=360),
              Text(
                extent={{-150,-20},{150,20}},
                lineColor={0,0,255},
                origin={-8,-78},
                rotation=360,
                textString="%name")}));
      end Reproduction;

      model Mortality "As population change per one individual"
         extends Interfaces.ConditionalLifeTime;
        Interfaces.PopulationPort_a port_a annotation (Placement(transformation(
                extent={{-108,-10},{-88,10}}), iconTransformation(extent={{-108,-10},{
                  -88,10}})));
      equation
        port_a.change = changePerPopulationMember*port_a.population;
        annotation (Icon(graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={0,127,127},
                rotation=360),
              Text(
                extent={{-150,-20},{150,20}},
                lineColor={0,0,255},
                origin={-8,-76},
                rotation=360,
                textString="%name")}));
      end Mortality;

      model Stream "As population change per one individual"
        extends Interfaces.OnePort;
        extends Interfaces.ConditionalLifeTime;

      equation
        port_a.change = if (changePerPopulationMember>0) then changePerPopulationMember*port_a.population else changePerPopulationMember*port_b.population;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={0,127,127},
                rotation=360),
              Text(
                extent={{-150,-20},{150,20}},
                lineColor={0,0,255},
                origin={-8,-76},
                rotation=360,
                textString="%name")}));
      end Stream;

      model Change
        extends Interfaces.OnePort;
        extends Interfaces.ConditionalChange;

      equation
        port_a.change = change;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,127,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={0,127,127},
                fillColor={0,127,127},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Text(
                extent={{-150,-20},{150,20}},
                lineColor={0,0,255},
                origin={-8,-76},
                rotation=360,
                textString="%name")}));
      end Change;
    end Components;

    package Sources
      extends Modelica.Icons.SourcesPackage;
      model Growth
       extends Interfaces.ConditionalChange;
        Interfaces.PopulationPort_b port_b annotation (Placement(transformation(
                extent={{90,-10},{110,10}}), iconTransformation(extent={{90,-10},{110,
                  10}})));
      equation
        port_b.change = - change;
        annotation (Icon(graphics={
              Rectangle(
                extent={{-100,-52},{100,48}},
                lineColor={0,127,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Polygon(
                points={{-80,23},{80,-2},{-80,-27},{-80,23}},
                rotation=360,
                fillColor={0,127,127},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None,
                lineColor={0,127,127}),
              Text(
                extent={{-150,-20},{150,20}},
                lineColor={0,0,255},
                origin={-8,-78},
                rotation=360,
                textString="%name")}));
      end Growth;

      model Loss
       extends Interfaces.ConditionalChange;
        Interfaces.PopulationPort_a port_a annotation (Placement(transformation(
                extent={{-110,-10},{-90,10}}),
                                             iconTransformation(extent={{-110,-10},{
                  -90,10}})));
      equation
        port_a.change = change;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}),
                         graphics={
              Rectangle(
                extent={{-100,-52},{100,48}},
                lineColor={0,127,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Polygon(
                points={{-80,23},{80,-2},{-80,-27},{-80,23}},
                lineColor={0,127,127},
                rotation=360,
                fillColor={0,127,127},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,-20},{150,20}},
                lineColor={0,0,255},
                origin={-8,-78},
                rotation=360,
                textString="%name")}));
      end Loss;
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;
      connector PopulationPort
        "Average number of population members and their change"
        Physiolib.Types.Population population
          "Average number of population individuals";
        flow Physiolib.Types.PopulationChange change
          "Average population change = change of population individuals";
        annotation (Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end PopulationPort;

      connector PopulationPort_a "Increase (or decrease) of population"
        extends PopulationPort;

      annotation (
          defaultComponentName="port_a",
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                  100}}),     graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={0,127,127},
                lineThickness=1),       Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,127,127},
                fillColor={0,127,127},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
              graphics={Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={0,127,127},
                fillColor={0,127,127},
                fillPattern=FillPattern.Solid),
          Text(extent = {{-160,110},{40,50}}, lineColor={0,127,127},
                textString="%name")}),
          Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>", revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

      end PopulationPort_a;

      connector PopulationPort_b "Decrease (or increase) of population"
        extends PopulationPort;

      annotation (
          defaultComponentName="port_b",
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                  100}}),     graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={0,127,127},
                lineThickness=1),       Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,127,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
              graphics={Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={0,127,127},
                fillColor={0,127,127},
                fillPattern=FillPattern.Solid),
          Text(extent={{-160,112},{40,52}},   lineColor={0,127,127},
                fillColor={0,127,127},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>", revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

      end PopulationPort_b;

      partial model OnePort
        "Partial change of population between two ports without its accumulation"

        PopulationPort_b port_b
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        PopulationPort_a port_a
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      equation
        port_a.change + port_b.change = 0;
      end OnePort;

      partial model ConditionalChange
        "Input of population change vs. parametric constant change"

        parameter Boolean useChangeInput = false
          "=true, if real input connector is used instead of parameter PopulationChange"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolib.Types.PopulationChange PopulationChange=0
          "Population change if useChangeInput=false" annotation (HideResult=
              not useChangeInput, Dialog(enable=not useChangeInput));

        Physiolib.Types.RealIO.PopulationChangeInput populationChange(start=
              PopulationChange)=change if useChangeInput annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40})));

        Physiolib.Types.PopulationChange change "Current population change";
      equation
        if not useChangeInput then
          change = PopulationChange;
        end if;

      end ConditionalChange;

      partial model ConditionalLifeTime
        "Input of population change per one population member vs. parametric lifetime"

        parameter Boolean useChangePerMemberInput = false
          "=true, if real input connector is used instead of parameter LifeTime"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolib.Types.Time LifeTime=1e-8
          "Mean life time for population (=1.44*halftime) if useChangePerMember=false"
          annotation (HideResult=not useChangePerMemberInput, Dialog(enable=
                not useChangePerMemberInput));

        Physiolib.Types.RealIO.PopulationChangePerMemberInput changePerMember(start=1/
              LifeTime)=changePerPopulationMember if useChangePerMemberInput
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40})));

        Physiolib.Types.PopulationChangePerMember changePerPopulationMember
          "Current population change per individual";
      equation
        if not useChangePerMemberInput then
          changePerPopulationMember = 1/LifeTime;
        end if;

      end ConditionalLifeTime;
    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>"));
  end Population;

  package Icons "Icons for physiological models"
    //extends Modelica.Icons.IconsPackage;
    extends Modelica.Icons.Package;

    class Golem

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-98},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/golem.png")}));
    end Golem;

    class CardioVascular

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/csv.png")}));
    end CardioVascular;

    class Water

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/indexVoda.png")}));
    end Water;

    class Electrolytes

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/electrolytes.png")}));
    end Electrolytes;

    class Proteins

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-98,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/protein.png")}));
    end Proteins;

    class Gases

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/gases.png")}));
    end Gases;

    class NutrientsMetabolism

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/vyziva.png")}));
    end NutrientsMetabolism;

    class Heat

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/ohen.png")}));
    end Heat;

    class Hormones

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/hormony.png")}));
    end Hormones;

    class Nerves

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/nervyNeuron.png")}));
    end Nerves;

    class Setup

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/setup.png")}));
    end Setup;

    class Status

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-98,-100},{100,
                  100}}, fileName="modelica://Physiolib/Resources/Icons/tissueFitness.png")}));
    end Status;

    class SkeletalMuscle

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-70,-80},{40,92}},
                fileName="modelica://Physiolib/Resources/Icons/sval.png")}));
    end SkeletalMuscle;

    class Bone

      annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Bitmap(extent={{-88,-84},{52,96}},
                fileName="modelica://Physiolib/Resources/Icons/bone.png")}));
    end Bone;

    class OtherTissue

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-74,-94},{48,60}},
                fileName="modelica://Physiolib/Resources/Icons/pojivovaTkan.png")}));
    end OtherTissue;

    class RespiratoryMuscle

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-66,-86},{44,86}},
                fileName="modelica://Physiolib/Resources/Icons/respiracniSvaly.png")}));
    end RespiratoryMuscle;

    class Fat

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-84,-68},{38,86}},
                fileName="modelica://Physiolib/Resources/Icons/tukovaBunka.png")}));
    end Fat;

    class Skin

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-74,-84},{48,56}},
                fileName="modelica://Physiolib/Resources/Icons/skin.png")}));
    end Skin;

    class Brain

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-78,-92},{44,62}},
                fileName="modelica://Physiolib/Resources/Icons/brain.png")}));
    end Brain;

    class GITract

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-80,-80},{42,74}},
                fileName="modelica://Physiolib/Resources/Icons/traviciTrakt.png")}));
    end GITract;

    class LeftHeart

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),        graphics={Bitmap(extent={{-96,-100},{24,100}},
                fileName="modelica://Physiolib/Resources/Icons/srdceLeva.png")}));
    end LeftHeart;

    class RightHeart

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),       graphics={Bitmap(extent={{-26,-100},{92,66}},
                fileName="modelica://Physiolib/Resources/Icons/srdceprava.png")}));
    end RightHeart;

    class Liver

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-84,-100},{86,34}},
                fileName="modelica://Physiolib/Resources/Icons/jatra.png")}));
    end Liver;

    class Kidney

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-92,-88},{40,86}},
                fileName="modelica://Physiolib/Resources/Icons/kidney.png")}));
    end Kidney;

    class Bladder

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Bitmap(extent={{-92,-88},{40,86}},
                fileName="modelica://Physiolib/Resources/Icons/mocovyMechyr.png")}));
    end Bladder;

    class GILumen

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/traviciTrakt2.png")}));
    end GILumen;

    class ThyroidGland

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-92,-88},{40,86}},
                fileName="modelica://Physiolib/Resources/Icons/stitnaZlaza.png")}));
    end ThyroidGland;

    class Pancreas

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/pankreas.png")}));
    end Pancreas;

    class AdrenalGland

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/nadledviny.png")}));
    end AdrenalGland;

    class Lungs

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-70,-80},{40,92}},
                fileName="modelica://Physiolib/Resources/Icons/plice.png")}));
    end Lungs;

    class Tissues

      annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}), graphics={
            Bitmap(extent={{-46,26},{32,98}}, fileName="modelica://Physiolib/Resources/Icons/bone.png"),
            Bitmap(extent={{-62,-92},{50,-10}}, fileName="modelica://Physiolib/Resources/Icons/skin.png"),
            Bitmap(extent={{-38,-20},{64,90}}, fileName="modelica://Physiolib/Resources/Icons/sval.png"),
            Bitmap(extent={{-10,-56},{102,36}}, fileName=
                  "modelica://Physiolib/Resources/Icons/traviciTrakt.png"),
            Text(
              extent={{64,-66},{94,-96}},
              lineColor={0,0,0},
              textString="..."),
            Bitmap(extent={{-98,-30},{-24,36}}, fileName="modelica://Physiolib/Resources/Icons/brain.png")}));

    end Tissues;

    class Peritoneum

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-70,-80},{40,92}},
                fileName="modelica://Physiolib/Resources/Icons/peritoneum.png")}));
    end Peritoneum;

    class Plasma

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-70,-80},{40,92}},
                fileName="modelica://Physiolib/Resources/Icons/plazma.png")}));
    end Plasma;

    class Hypophysis

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/hypofyza.png")}));
    end Hypophysis;

    class Heart

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/heart.png")}));
    end Heart;

    class SweatGland

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/potniZlaza.png")}));
    end SweatGland;

    class Cell

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/OsmothicCell.png")}));
    end Cell;

    package HeatLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-82},{76,44}},
                fileName="modelica://Physiolib/Resources/Icons/ohen.png")}));

    end HeatLib;

    package StatusLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,40},{72,-96}},
                fileName="modelica://Physiolib/Resources/Icons/tissueFitness.png")}));

    end StatusLib;

     package NervesLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,-96},{72,42}},
                fileName="modelica://Physiolib/Resources/Icons/nervyNeuron.png")}));

     end NervesLib;

    package NutrientsMetabolismLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-98,-100},{80,40}},
                fileName="modelica://Physiolib/Resources/Icons/vyziva.png")}));

    end NutrientsMetabolismLib;

    package OxygenLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,-98},{78,42}},
                fileName="modelica://Physiolib/Resources/Icons/O2.png")}));
    end OxygenLib;

    package ProteinsLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-98,-98},{76,42}},
                fileName="modelica://Physiolib/Resources/Icons/protein.png")}));

    end ProteinsLib;

    package SetupLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-94,-98},{72,44}},
                fileName="modelica://Physiolib/Resources/Icons/setup.png")}));

    end SetupLib;

    package CardioVascularLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,-100},{76,42}},
                fileName="modelica://Physiolib/Resources/Icons/csv.png")}));

    end CardioVascularLib;

    package WaterLib
     extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-90,-84},{72,42}},
                fileName="modelica://Physiolib/Resources/Icons/indexVoda.png")}));

    end WaterLib;

     package KidneyLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,-96},{72,42}},
                fileName="modelica://Physiolib/Resources/Icons/Kidney.png")}));

     end KidneyLib;

    package ElectrolytesLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-78,-94},{64,38}},
                fileName="modelica://Physiolib/Resources/Icons/electrolytes.png")}));

    end ElectrolytesLib;

    package GasesLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-88,-82},{66,34}},
                fileName="modelica://Physiolib/Resources/Icons/gases.png")}));

    end GasesLib;

    package GolemLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,-98},{78,42}},
                fileName="modelica://Physiolib/Resources/Icons/golem.png")}));
    end GolemLib;

    package BaseLib
      extends Modelica.Icons.Package;
    end BaseLib;

    package HormonesLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-88,-88},{74,30}},
                fileName="modelica://Physiolib/Resources/Icons/hormony.png")}));

    end HormonesLib;

     package AutonomicControlLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,-96},{72,42}},
                fileName="modelica://Physiolib/Resources/Icons/sympatetickeNervy.png")}));

     end AutonomicControlLib;

    partial class Resistor

     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-70,-30},{70,30}},
              lineColor={0,0,0},
              fillColor={241,241,241},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{-70,0}}),
            Line(points={{70,0},{90,0}})}));
    end Resistor;

    class Lymph

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/Lymph.png")}));
    end Lymph;

    class RespiratoryCenter

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/respiracniCentrum.png")}));
    end RespiratoryCenter;

    class Oxygen

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                      Bitmap(extent={{-100,-100},{100,100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/O2.png")}));
    end Oxygen;

    class CarbonDioxide

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                      Bitmap(extent={{-100,-100},{100,100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/prvkyCO2.png")}));
    end CarbonDioxide;

    class AcidBase

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                      Bitmap(extent={{-100,-100},{100,100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/acidobaze.png")}));
    end AcidBase;

    class Ventilation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/dychani.png")}));
    end Ventilation;

    class PeripheralChemoreceptors

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/baroreflex.png")}));
    end PeripheralChemoreceptors;

    class HeatCore

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Bitmap(extent={{-100,100},{
                  100,-100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/torzo2.png")}));
    end HeatCore;

    class Glycogen

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                                 Rectangle(
              extent={{-100,-100},{100,100}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),     Bitmap(extent={{-100,-100},{100,100}},
                          fileName=
                  "modelica://Physiolib/Resources/Icons/glykogen.png")}));
    end Glycogen;

    class Lipids

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                   100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/FattyAcid.png")}));
    end Lipids;

    class KetoAcids

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                   100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/KetoAcid.png")}));
    end KetoAcids;

    class Glucose

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                   100}}, fileName="modelica://Physiolib/Resources/Icons/glucose.png")}));
    end Glucose;

    class Lactate

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                   100}}, fileName="modelica://Physiolib/Resources/Icons/Lactate.png")}));
    end Lactate;

    class AminoAcids

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                   100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/AminoAcid.png")}));
    end AminoAcids;

    class Urea

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                   100}}, fileName="modelica://Physiolib/Resources/Icons/Urea.png")}));
    end Urea;

    class MetabolismPart

      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,120}}),
            graphics={             Bitmap(extent={{28,120},{98,44}}, fileName=
                 "modelica://Physiolib/Resources/Icons/ohen.png")}));
    end MetabolismPart;

    class CellularMetabolism

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                   100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/cellularMetabolism.png")}));
    end CellularMetabolism;

    class FemaleSex

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                   100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/hormonesFemaleSex.png")}));
    end FemaleSex;

    class Barroreceptor

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                   100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/baroreflex.png")}));
    end Barroreceptor;

    class NervusVagus

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                   100}}, fileName="modelica://Physiolib/Resources/Icons/vagus.png")}));
    end NervusVagus;

    class SympatheticNerves

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                   100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/sympatetickeNervy.png")}));
    end SympatheticNerves;

    class PhysicalExercise

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                   100}}, fileName="modelica://Physiolib/Resources/Icons/cviceni.png")}));
    end PhysicalExercise;

    class SinoatrialNode

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName="modelica://Physiolib/Resources/Icons/SANode.png")}));
    end SinoatrialNode;

    block StatusNormal

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/siluetaNormal.png")}));
    end StatusNormal;

    block StatusConfused

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/siluetaZmateni.png")}));
    end StatusConfused;

    block StatusImpaired

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/siluetaVaznejsiStav.png")}));
    end StatusImpaired;

    block StatusNotBreathing

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/siluetaNedychaSam.png")}));
    end StatusNotBreathing;

    block StatusComatose

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/siluetaKoma.png")}));
    end StatusComatose;

    block StatusMayBeDead

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/siluetaSkoroMrtvy.png")}));
    end StatusMayBeDead;

    block StatusIsReallyDead

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/siluetaMrtvy.png")}));
    end StatusIsReallyDead;

    class SkeletalMuscleAcidity

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/kyselostVeSvalech.png")}));
    end SkeletalMuscleAcidity;

    class Sodium

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName="modelica://Physiolib/Resources/Icons/Na.png")}));
    end Sodium;

    class Potassium

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName="modelica://Physiolib/Resources/Icons/K.png")}));
    end Potassium;

    class Phosphate

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName="modelica://Physiolib/Resources/Icons/fosfat.png")}));
    end Phosphate;

    class Sulphate

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/sulfat02.png")}));
    end Sulphate;

    class Amonium

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName="modelica://Physiolib/Resources/Icons/NH4.png")}));
    end Amonium;

    class Chloride

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName="modelica://Physiolib/Resources/Icons/Cl.png")}));
    end Chloride;

    class LungShunt

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/lungBloodFlow.png")}));
    end LungShunt;

    class Hydrostatics

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/pressureMeassure.png")}));
    end Hydrostatics;

    class UpperTorso

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName="modelica://Physiolib/Resources/Icons/torzo1.png")}));
    end UpperTorso;

    class MiddleTorso

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName="modelica://Physiolib/Resources/Icons/torzo2.png")}));
    end MiddleTorso;

    class LowerTorso

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName="modelica://Physiolib/Resources/Icons/torzo3.png")}));
    end LowerTorso;

    class RedCells

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/cervenaKrvinka.png")}));
    end RedCells;

    class SystemicCirculation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/krevniRecisteSiluetacloveka.png")}));
    end SystemicCirculation;

    class PulmonaryCirculation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/krevniRecistePlice.png")}));
    end PulmonaryCirculation;

    class Blood

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/bloodProperties.png")}));
    end Blood;

    class BaseFactorIcon0

      annotation (Icon(graphics={  Rectangle(
              extent={{-100,-40},{100,60}},
              lineColor={0,127,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-76,-22},{64,44}},
              lineColor={0,0,0},
              textString="%name")}));
    end BaseFactorIcon0;

    partial class BaseFactorIcon

      Modelica.Blocks.Interfaces.RealInput yBase
                       annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={0,20})));
      Modelica.Blocks.Interfaces.RealOutput y
                    annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-40})));

     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,-20},{100,20}},
              lineColor={95,95,95},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-90,-10},{92,10}},
              textString="%name",
              lineColor={0,0,0})}));
    end BaseFactorIcon;

    partial class BaseFactorIcon2

      Modelica.Blocks.Interfaces.RealInput yBase
                       annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={0,60})));
      Modelica.Blocks.Interfaces.RealOutput y
                    annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-60})));

     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,127,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-86,-36},{100,40}},
              textString="%name",
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere)}));
    end BaseFactorIcon2;

    partial class BaseFactorIcon3

      Modelica.Blocks.Interfaces.RealInput yBase
                       annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={0,20})));
      Modelica.Blocks.Interfaces.RealOutput y
                    annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-40})));

     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,-20},{100,20}},
              lineColor={0,127,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-90,-10},{92,10}},
              textString="%name",
              lineColor={0,0,0})}));
    end BaseFactorIcon3;

    partial class BaseFactorIcon4

      Modelica.Blocks.Interfaces.RealInput yBase
                       annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={0,20})));
      Modelica.Blocks.Interfaces.RealOutput y
                    annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-40})));

     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,-20},{100,20}},
              lineColor={127,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-90,-10},{92,10}},
              textString="%name",
              lineColor={0,0,0})}));
    end BaseFactorIcon4;

    partial class BaseFactorIcon5

      Modelica.Blocks.Interfaces.RealInput yBase
                       annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={0,20})));
      Modelica.Blocks.Interfaces.RealOutput y
                    annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-40})));

     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,-20},{100,20}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-90,-10},{92,10}},
              textString="%name",
              lineColor={0,0,0})}));
    end BaseFactorIcon5;

    partial class BaseFactorIcon6

      Modelica.Blocks.Interfaces.RealInput yBase
                       annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={0,20})));
      Modelica.Blocks.Interfaces.RealOutput y
                    annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-40})));

     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
            extent={{-100,-20},{100,20}},
            lineColor={0,87,87},
            fillColor={255,255,255},
            fillPattern=FillPattern.Sphere)}));
    end BaseFactorIcon6;

    partial class ConversionIcon "Base icon for conversion functions"

      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={191,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-74,0},{30,0}}, color={191,0,0}),
            Polygon(
              points={{80,0},{20,20},{20,-20},{80,0}},
              lineColor={191,0,0},
              fillColor={191,0,0},
              fillPattern=FillPattern.Solid)}));

    end ConversionIcon;

    partial class Diffusion

      annotation (Icon(graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/diffusion.png")}));

    end Diffusion;

    class Substance

        annotation ( Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/Concentration.png")}));
    end Substance;

    class Speciation

      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/Speciation.png"), Text(
              extent={{-182,-84},{60,-118}},
              lineColor={0,0,255},
              textString="%name")}));
    end Speciation;

    class MolarFlowMeasure

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/molarFlowMeassure.png")}));
    end MolarFlowMeasure;

    class GasSolubility

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName=
                  "modelica://Physiolib/Resources/Icons/GasSolubility.png")}));
    end GasSolubility;

    class Reabsorption

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName=
                  "modelica://Physiolib/Resources/Icons/reabsorption.svg")}));
    end Reabsorption;

    class Reabsorption2

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName=
                  "modelica://Physiolib/Resources/Icons/reabsorption.png")}));
    end Reabsorption2;

    class Dilution

      annotation (Icon(graphics={     Bitmap(extent={{-100,-101},{100,101}},
                fileName="modelica://Physiolib/Resources/Icons/dilution.png",
              origin={0,33},
              rotation=270)}));
    end Dilution;

    class ElasticBalloon

    annotation (Icon(graphics={     Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/elastic_vessel.svg")}));
    end ElasticBalloon;

    class BloodElasticCompartment

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/elastickyKompartment.png")}));
    end BloodElasticCompartment;

    class BloodSequesteredCompartment

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,
                  100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/sequerestedVolume.png")}));
    end BloodSequesteredCompartment;

    partial class HydraulicResistor

    annotation (Icon(graphics={    Bitmap(extent={{-120,-42},{120,44}},
                fileName="modelica://Physiolib/Resources/Icons/resistor.svg")}));
    end HydraulicResistor;

    class FlowMeasure

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                                      Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/flowMeassure.png")}));
    end FlowMeasure;

    class Membrane

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/membrane.png")}));
    end Membrane;

    class PressureMeasure

      annotation ( Icon(graphics={Bitmap(extent={
                  {-100,-100},{100,100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/pressureMeassure.png")}));
    end PressureMeasure;

    class InternalElasticBalloon

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName=
                  "modelica://Physiolib/Resources/Icons/elastic_membrane.svg")}));
    end InternalElasticBalloon;

    class Inertance

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName=
                  "modelica://Physiolib/Resources/Icons/inertia.svg")}));
    end Inertance;

    class HydrostaticGradient

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Bitmap(extent={{-100,-100},{102,100}},
                fileName="modelica://Physiolib/Resources/Icons/hydrostatic_column.svg")}));

    end HydrostaticGradient;

    class Radiator

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/Radiator.png")}));
    end Radiator;

    class MichaelisMenten

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-80,-84},{86,26}},
                fileName=
                  "modelica://Physiolib/Resources/Icons/MichaelisMenten.png")}));
    end MichaelisMenten;

    class HeatAccumulation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName=
                  "modelica://Physiolib/Resources/Icons/HeatAccumulation.png")}));
    end HeatAccumulation;

    class OsmoticCell

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName=
                  "modelica://Physiolib/Resources/Icons/OsmothicCell.png")}));
    end OsmoticCell;

    class IdealGas

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/IdealGas.png")}));
    end IdealGas;

    class PartialPressure

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName=
                  "modelica://Physiolib/Resources/Icons/PartialPressure.png")}));
    end PartialPressure;

    class ConservationLaw

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,-100},{100,100}},
              fillColor={170,255,213},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Polygon(
              points={{-40,-60},{-40,-20},{-80,-40},{-40,-60}},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Line(
              points={{-80,10},{-80,-80},{-80,-80}})}));
    end ConservationLaw;

    class Nephron

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/Nefron.png")}));
    end Nephron;

    class Torso

      annotation (Icon(graphics={            Bitmap(extent={{-28,58},{28,98}},
                          fileName="modelica://Physiolib/Resources/Icons/torzo1.png"),
                                             Bitmap(extent={{-40,-24},{40,56}},
                          fileName="modelica://Physiolib/Resources/Icons/torzo2.png"),
                                             Bitmap(extent={{-40,-98},{40,-18}},
                          fileName="modelica://Physiolib/Resources/Icons/torzo3.png")}));
    end Torso;

    class PerfusionOD

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                      Bitmap(extent={{-160,-100},{152,100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/perfusion.png")}));
    end PerfusionOD;

    class PerfusionDO

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                      Bitmap(extent={{-160,-100},{160,100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/perfusion2.png")}));
    end PerfusionDO;

    class CollapsingVessel

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                      Bitmap(extent={{-100,-100},{100,100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/kolaps.png")}));
    end CollapsingVessel;

    class PeripheralCirculation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                      Bitmap(extent={{-100,-100},{100,100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/krevniReciste.png")}));
    end PeripheralCirculation;

    class HeartVentricle

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                      Bitmap(extent={{-100,-100},{100,100}}, fileName=
                  "modelica://Physiolib/Resources/Icons/komoraSrdce.png")}));
    end HeartVentricle;

    class Population

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/Populace.png")}));
    end Population;

    class FlowFiltration

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-74},{100,100}},
                fileName=
                  "modelica://Physiolib/Resources/Icons/flowFiltration.png")}));
    end FlowFiltration;

    class Microcirculation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,-98},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/microcirculation.png")}));
    end Microcirculation;

    class IdealValve

    annotation (Icon(graphics={     Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/ideal_valve.svg")}));
    end IdealValve;

    class Pump

    annotation (Icon(graphics={     Bitmap(extent={{-100,-100},{100,100}},
                fileName="modelica://Physiolib/Resources/Icons/pump.svg")}));
    end Pump;
    annotation (Documentation(revisions=""));
  end Icons;

  package Types "Physiological units with nominals"
    //extends Modelica.Icons.TypesPackage;
    extends Modelica.Icons.Package;
  //If you have an idea to add the next physiological type to the next version, please write me at marek@matfyz.cz. Thank you

    package UsersGuide "User's Guide"
      extends Modelica.Icons.Information;

    class NewType "Adding new type"
      extends Modelica.Icons.Information;

     annotation (Documentation(info="<html>
<p>Definition of new type (&quot;QuantityX&quot;) in Physiolib:</p>
<ul>
<li>Define base type Types.QuantityX with SI units in &quot;final unit&quot;, default display units and nominal (e.g. value of one display unit at SI units). </li>
</ul>
<p>Optional: </p>
<ul>
<li>Define typed input and output connectors for QuantityX: Types.RealIO.QuantityXInput and Types.RealIO.QuantityXOutput. </li>
<li>Define typed constant for QuantityX: Types.Constants.QuantityXConst </li>
<li>Define typed RealInputParameter for QuantityX: Types.RealInputParameters.QuantityX </li>
<li>Define typed replaceable variable RealTypes for QuantityX: Types.RealTypes.QuantityX </li>
</ul>
</html>"));
    end NewType;
    annotation (DocumentationClass=true, Documentation(info="<html>
<p>Package <b>Physiolib</b> is a modelica package for <b>Human Physiology</b> that is developed from <b>HumMod</b> modelica implementation, see <a href=\"http://patf-biokyb.lf1.cuni.cz/wiki/hummod/hummod\">http://hummod.org</a>. It provides constants, types, connectors, partial models and model components fitted for physiological models of human body. </p>
<p>This is a short <b>User&apos;s Guide</b> for the overall library. Some of the main sublibraries have their own User&apos;s Guides that can be accessed by the following links: </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td valign=\"top\"><p>Types </p></td>
<td valign=\"top\"><p>Physiological types. Physiological unit vs. SI units, nominals, inputs/outputs, typed constants.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Blocks</p></td>
<td valign=\"top\"><p>Useful blocks, that are missing in package Modelica.Blocks (MSL 3.2), cubic interpolation curves, multiplication factors.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Chemical</p></td>
<td valign=\"top\"><p>Library to chemical subsystems such as intravascular, interstitial or intracellular chemical substances in fluxes and interactions.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Hydraulic</p></td>
<td valign=\"top\"><p>Library to hydraulic subsystems such as in cardiovascular system.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Thermal</p></td>
<td valign=\"top\"><p>Library of termoregulation support.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Osmotic</p></td>
<td valign=\"top\"><p>Library to model water fluxes through semipermeable membrane caused by osmotic pressure.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Mixed</p></td>
<td valign=\"top\"><p>Library to join domains above together.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Icons</p></td>
<td valign=\"top\"><p>Icons</p></td>
</tr>
<tr>
<td valign=\"top\"><p>FileUtilities</p></td>
<td valign=\"top\"><p>Read/write values from/to file. </p></td>
</tr>
</table>
</html>"));
    end UsersGuide;

    package Constants
      extends Modelica.Icons.SourcesPackage;

    block AccelerationConst "Constant signal of type Acceleration"
     parameter Types.Acceleration k "Constant Acceleration output value";
          RealIO.AccelerationOutput y "Acceleration constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="acceleration",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end AccelerationConst;

    block AmountOfSubstanceConst "Constant signal of type AmountOfSubstance"
     parameter Types.AmountOfSubstance k
          "Constant AmountOfSubstance output value";
          RealIO.AmountOfSubstanceOutput y "AmountOfSubstance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="amountOfSubstance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end AmountOfSubstanceConst;

    block ConcentrationConst "Constant signal of type Concentration"
     parameter Types.Concentration k "Constant Concentration output value";
          RealIO.ConcentrationOutput y "Concentration constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="concentration",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end ConcentrationConst;

    block DensityConst "Constant signal of type Density"
     parameter Types.Density k "Constant Density output value";
          RealIO.DensityOutput y "Density constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="density",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end DensityConst;

    block DiffusionPermeabilityConst
        "Constant signal of type DiffusionPermeability"
     parameter Types.DiffusionPermeability k
          "Constant DiffusionPermeability output value";
          RealIO.DiffusionPermeabilityOutput y "DiffusionPermeability constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="diffusionPermeability",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end DiffusionPermeabilityConst;

    block ElectricChargeConst "Constant signal of type ElectricCharge"
     parameter Types.ElectricCharge k "Constant ElectricCharge output value";
          RealIO.ElectricChargeOutput y "ElectricCharge constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="electricCharge",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end ElectricChargeConst;

    block ElectricCurrentConst "Constant signal of type ElectricCurrent"
     parameter Types.ElectricCurrent k "Constant ElectricCurrent output value";
          RealIO.ElectricCurrentOutput y "ElectricCurrent constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="electricCurrent",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end ElectricCurrentConst;

    block ElectricPotentialConst "Constant signal of type ElectricPotential"
     parameter Types.ElectricPotential k
          "Constant ElectricPotential output value";
          RealIO.ElectricPotentialOutput y "ElectricPotential constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="electricPotential",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end ElectricPotentialConst;

      block EnergyConst "Constant signal of type Energy"
        parameter Types.Energy k "Constant Energy output value";
          RealIO.EnergyOutput y "Energy constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
      equation
          y=k;
      annotation (defaultComponentName="energy",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
      end EnergyConst;

    block FractionConst "Constant signal of type Fraction"
     parameter Types.Fraction k "Constant Fraction output value";
          RealIO.FractionOutput y "Fraction constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="fraction",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end FractionConst;

    block FrequencyConst "Constant signal of type Frequency"
     parameter Types.Frequency k "Constant Frequency output value";
          RealIO.FrequencyOutput y "Frequency constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="frequency",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end FrequencyConst;

    block GasSolubilityConst "Constant signal of type GasSolubility"
     parameter Types.GasSolubility k "Constant GasSolubility output value";
          RealIO.GasSolubilityOutput y "GasSolubility constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="gasSolubility",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end GasSolubilityConst;

    block HeatConst "Constant signal of type Heat"
     parameter Types.Heat k "Constant Heat output value";
          RealIO.HeatOutput y "Heat constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="heat",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HeatConst;

    block HeightConst "Constant signal of type Height"
     parameter Types.Height k "Constant Height output value";
          RealIO.HeightOutput y "Height constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="height",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HeightConst;

    block HeatFlowRateConst "Constant signal of type HeatFlowRate"
     parameter Types.HeatFlowRate k "Constant HeatFlowRate output value";
          RealIO.HeatFlowRateOutput y "HeatFlowRate constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="heatFlowRate",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HeatFlowRateConst;

    block HydraulicComplianceConst "Constant signal of type HydraulicCompliance"
     parameter Types.HydraulicCompliance k
          "Constant HydraulicCompliance output value";
          RealIO.HydraulicComplianceOutput y "HydraulicCompliance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="hydraulicCompliance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HydraulicComplianceConst;

    block HydraulicElastanceConst
        "Obsolete, please use HydraulicCompliance instead!"
      extends Modelica.Icons.ObsoleteModel;
     parameter Types.HydraulicElastance k "Hydraulic elastance";
          RealIO.HydraulicElastanceOutput  y
          "HydraulicElastance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="hydraulicElastance",
                      Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}),
          Documentation(info="<html>
<p>Please use the reciprocal value of hydraulic elastance, wich is called hydraulic compliance for the compatibility with other blocks and models!</p>
<p>Even it is not recommended, you can use this block, but do not forget to make reciprocal value (in example using Blocks.Math.Reciprocal) before connecting to library components!</p>
</html>"));
    end HydraulicElastanceConst;

    block HydraulicElastanceToComplianceConst
        "Constant signal of type HydraulicCompliance from HydraulicElastance constant"
     parameter Types.HydraulicElastance k
          "Reciprocal constant value of hydraulic compliance";
          RealIO.HydraulicComplianceOutput y "HydraulicCompliance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=1/k;
      annotation (defaultComponentName="hydraulicElastance2Compliance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HydraulicElastanceToComplianceConst;

    block HydraulicConductanceConst
        "Constant signal of type HydraulicConductance"
     parameter Types.HydraulicConductance k
          "Constant HydraulicConductance output value";
          RealIO.HydraulicConductanceOutput y "HydraulicConductance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="hydraulicConductance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HydraulicConductanceConst;

    block HydraulicResistanceConst
        "Obsolete, please use HydraulicConductance instead!"

     parameter Types.HydraulicResistance k "Hydraulic resistance";
          Modelica.Blocks.Interfaces.RealOutput
                                            y(final quantity="HydraulicConductance",final unit="(Pa.s)/kg", displayUnit="(mmHg.min)/g", nominal=(1e+6)*(133.322387415)*60)
          "HydraulicResistance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="hydraulicResistance",
                      Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}),
          Documentation(info="<html>
<p>Please use the reciprocal value of hydraulic resistance, wich is called hydraulic conductance for the compatibility with other blocks and models!</p>
<p>Because zero hydraulic conductance means zero volumetric flow, it is much better to use this reciprocal value of hydraulic resistance.</p>
<p>Even it is not recommended, you can use this block, but do not forget to make reciprocal value (in example using Blocks.Math.Reciprocal) before connecting to library components!</p>
</html>"));
    end HydraulicResistanceConst;

    block HydraulicResistanceToConductanceConst
        "Constant signal of type HydraulicConductance from HydraulicResistance parameter"
     parameter Types.HydraulicResistance k
          "Reciprocal constant value of hydraulic conductance";
          RealIO.HydraulicConductanceOutput y "HydraulicConductance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=1/k;
      annotation (defaultComponentName="hydraulicResistance2conductance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HydraulicResistanceToConductanceConst;

    block HydraulicInertanceConst "Constant signal of type HydraulicInertance"
     parameter Types.HydraulicInertance k
          "Constant HydraulicInertance output value";
          RealIO.HydraulicInertanceOutput y "HydraulicInertance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="hydraulicInertance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HydraulicInertanceConst;

    block MassConst "Constant signal of type Mass"
     parameter Types.Mass k "Constant Mass output value";
          RealIO.MassOutput y "Mass constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="mass",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end MassConst;

    block MassConcentrationConst "Constant signal of type MassConcentration"
     parameter Types.MassConcentration k
          "Constant MassConcentration output value";
          RealIO.MassConcentrationOutput y "MassConcentration constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="massConcentration",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end MassConcentrationConst;

    block MassFlowRateConst "Constant signal of type MassFlowRate"
     parameter Types.MassFlowRate k "Constant MassFlowRate output value";
          RealIO.MassFlowRateOutput y "MassFlowRate constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="massFlowRate",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end MassFlowRateConst;

    block MolarFlowRateConst "Constant signal of type MolarFlowRate"
     parameter Types.MolarFlowRate k "Constant MolarFlowRate output value";
          RealIO.MolarFlowRateOutput y "MolarFlowRate constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="molarFlowRate",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end MolarFlowRateConst;

    block OsmolarityConst "Constant signal of type Osmolarity"
     parameter Types.Osmolarity k "Constant Osmolarity output value";
          RealIO.OsmolarityOutput y "Osmolarity constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="osmolarity",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end OsmolarityConst;

    block OsmoticPermeabilityConst "Constant signal of type OsmoticPermeability"
     parameter Types.OsmoticPermeability k
          "Constant OsmoticPermeability output value";
          RealIO.OsmoticPermeabilityOutput y "OsmoticPermeability constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="osmoticPermeability",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end OsmoticPermeabilityConst;

    block PressureConst "Constant signal of type Pressure"
     parameter Types.Pressure k "Constant Pressure output value";
          RealIO.PressureOutput y "Pressure constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="pressure",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end PressureConst;

    block SpecificEnergyConst "Constant signal of type SpecificEnergy"
     parameter Types.SpecificEnergy k "Constant SpecificEnergy output value";
          RealIO.SpecificEnergyOutput y "SpecificEnergy constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="specificEnergy",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end SpecificEnergyConst;

    block SpecificHeatCapacityConst
        "Constant signal of type SpecificHeatCapacity"
     parameter Types.SpecificHeatCapacity k
          "Constant SpecificHeatCapacity output value";
          RealIO.SpecificHeatCapacityOutput y "SpecificHeatCapacity constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="specificHeatCapacity",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end SpecificHeatCapacityConst;

    block TemperatureConst "Constant signal of type Temperature"
     parameter Types.Temperature k "Constant Temperature output value";
          RealIO.TemperatureOutput y "Temperature constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="temperature",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end TemperatureConst;

    block ThermalConductanceConst "Constant signal of type ThermalConductance"
     parameter Types.ThermalConductance k
          "Constant ThermalConductance output value";
          RealIO.ThermalConductanceOutput y "ThermalConductance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="thermalConductance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end ThermalConductanceConst;

    block TimeConst "Constant signal of type Time"
     parameter Types.Time k "Constant Time output value";
          RealIO.TimeOutput y "Time constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="time",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end TimeConst;

    block VolumeFlowRateConst "Constant signal of type VolumeFlowRate"
     parameter Types.VolumeFlowRate k "Constant VolumeFlowRate output value";
          RealIO.VolumeFlowRateOutput y "VolumeFlowRate constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="volumeFlowRate",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end VolumeFlowRateConst;

    block VolumeConst "Constant signal of type Volume"
     parameter Types.Volume k "Constant Volume output value";
          RealIO.VolumeOutput y "Volume constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="volume",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end VolumeConst;

    block DeprecatedUntypedConstant
        "Deprecated Untyped Constant for automatic conversion from initial versions of Physiolib"
      extends Modelica.Icons.ObsoleteModel;
     parameter Real k "Untyped constant output value";
     parameter String varName="";
     parameter String units="1";

          Modelica.Blocks.Interfaces.RealOutput
                                    y "Untyped constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="acceleration",
                      Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end DeprecatedUntypedConstant;

    block pHConst "Constant signal of type pH"
     parameter Types.pH k "Constant pH output value";
          Types.RealIO.pHOutput y "pH constant" annotation (Placement(
              transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="pH",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end pHConst;

    block VolumeDensityOfChargeConst
        "Constant signal of type VolumeDensityOfCharge"
     parameter Types.VolumeDensityOfCharge k
          "Constant VolumeDensityOfCharge output value";
          Types.RealIO.VolumeDensityOfChargeOutput y
          "VolumeDensityOfCharge constant" annotation (Placement(transformation(
                extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},{
                  60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="volumeDensityOfCharge",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end VolumeDensityOfChargeConst;

    block VelocityConst "Constant signal of type Velocity"
     parameter Types.Velocity k "Constant Velocity output value";
          Types.RealIO.VelocityOutput y "Velocity constant" annotation (Placement(
              transformation(extent={{40,-10},{60,10}}), iconTransformation(
                extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="velocity",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end VelocityConst;

    block PowerConst "Constant signal of type Power"
     parameter Types.Power k "Constant Power output value";
          RealIO.PowerOutput y "Power constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="power",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end PowerConst;

    block PositionConst "Constant signal of type Position"
     parameter Types.Position k "Constant Position output value";
          RealIO.PositionOutput y "Position constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="height",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end PositionConst;

      block MolarEnergyConst "Constant signal of type MolarEnergy"
        parameter Types.MolarEnergy k "Constant MolarEnergy output value";
          RealIO.MolarEnergyOutput y "MolarEnergy constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
      equation
          y=k;
      annotation (defaultComponentName="molarEnergy",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
      end MolarEnergyConst;

    block OneConst "1"

          RealIO.FractionOutput     y "=1"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=1;
      annotation (defaultComponentName="one",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
              textString="1")}));
    end OneConst;

      block PopulationConst "Constant signal of type Population"
        parameter Types.Population k "Constant Population output value";
          RealIO.PopulationOutput y "Population constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
      equation
          y=k;
      annotation (defaultComponentName="population",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
      end PopulationConst;

      block PopulationChangeConst "Constant signal of type PopulationChange"
        parameter Types.PopulationChange k
          "Constant PopulationChange output value";
          RealIO.PopulationChangeOutput y "PopulationChange constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
      equation
          y=k;
      annotation (defaultComponentName="populationChange",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
      end PopulationChangeConst;

      block PopulationChangePerMemberConst
        "Constant signal of type PopulationChangePerMember"
        parameter Types.Time LifeTime
          "Mean lifetime as 1/PopulationChangePerMember output value";
          RealIO.PopulationChangePerMemberOutput y
          "PopulationChangePerMember constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
      equation
          y=1/LifeTime;
      annotation (defaultComponentName="populationChangePerMember",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
      end PopulationChangePerMemberConst;
    end Constants;

    package RealIO
      extends Modelica.Icons.Package;

      connector AccelerationInput = input Acceleration
        "input Acceleration as connector"
        annotation (defaultComponentName="acceleration",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Acceleration.
    </p>
    </html>"));
      connector AccelerationOutput = output Acceleration
        "output Acceleration as connector"
        annotation (defaultComponentName="acceleration",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector AmountOfSubstanceInput = input AmountOfSubstance
        "input AmountOfSubstance as connector"
        annotation (defaultComponentName="amountofsubstance",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type AmountOfSubstance.
    </p>
    </html>"));
      connector AmountOfSubstanceOutput = output AmountOfSubstance
        "output AmountOfSubstance as connector"
        annotation (defaultComponentName="amountofsubstance",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector ConcentrationInput = input Concentration
        "input Concentration as connector"
        annotation (defaultComponentName="concentration",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Concentration.
    </p>
    </html>"));
      connector ConcentrationOutput = output Concentration
        "output Concentration as connector"
        annotation (defaultComponentName="concentration",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector DiffusionPermeabilityInput = input DiffusionPermeability
        "input DiffusionPermeability as connector"
        annotation (defaultComponentName="diffusionmembranepermeability",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type DiffusionMembranePermeability.
    </p>
    </html>"));
      connector DiffusionPermeabilityOutput = output DiffusionPermeability
        "output DiffusionPermeability as connector"
        annotation (defaultComponentName="diffusionmembranepermeability",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector ElectricCurrentInput = input ElectricCurrent
        "input ElectricCurrent as connector"
        annotation (defaultComponentName="electriccurrent",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type ElectricCurrent.
    </p>
    </html>"));
      connector ElectricCurrentOutput = output ElectricCurrent
        "output ElectricCurrent as connector"
        annotation (defaultComponentName="electriccurrent",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector ElectricChargeInput = input ElectricCharge
        "input ElectricCharge as connector"
        annotation (defaultComponentName="electriccharge",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type ElectricCharge.
    </p>
    </html>"));
      connector ElectricChargeOutput = output ElectricCharge
        "output ElectricCharge as connector"
        annotation (defaultComponentName="electriccharge",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector EnergyInput = input Energy "input Energy as connector"
        annotation (defaultComponentName="energy",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Energy.
    </p>
    </html>"));
      connector EnergyOutput = output Energy "output Energy as connector"
        annotation (defaultComponentName="energy",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector HeatInput = input Heat "input Heat as connector"
        annotation (defaultComponentName="heat",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Heat.
    </p>
    </html>"));
      connector HeatOutput = output Heat "output Heat as connector"
        annotation (defaultComponentName="heat",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector HeatFlowRateInput = input HeatFlowRate
        "input HeatFlowRate as connector"
        annotation (defaultComponentName="heatflowrate",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type HeatFlowRate.
    </p>
    </html>"));
      connector HeatFlowRateOutput = output HeatFlowRate
        "output HeatFlowRate as connector"
        annotation (defaultComponentName="heatflowrate",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector HeightInput = input Height "input Height as connector"
        annotation (defaultComponentName="height",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Height.
    </p>
    </html>"));
      connector HeightOutput = output Height "output Height as connector"
        annotation (defaultComponentName="height",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector MassInput = input Mass "input Mass as connector"
        annotation (defaultComponentName="mass",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Mass.
    </p>
    </html>"));
      connector MassOutput = output Mass "output Mass as connector"
        annotation (defaultComponentName="mass",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector MassFlowRateInput = input MassFlowRate
        "input MassFlowRate as connector"
        annotation (defaultComponentName="massflowrate",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type MassFlowRate.
    </p>
    </html>"));
      connector MassFlowRateOutput = output MassFlowRate
        "output MassFlowRate as connector"
        annotation (defaultComponentName="massflowrate",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector MolarFlowRateInput = input MolarFlowRate
        "input MolarFlowRate as connector"
        annotation (defaultComponentName="molarflowrate",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type MolarFlowRate.
    </p>
    </html>"));
      connector MolarFlowRateOutput = output MolarFlowRate
        "output MolarFlowRate as connector"
        annotation (defaultComponentName="molarflowrate",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector OsmolarityInput = input Osmolarity
        "input Concentration as connector"
        annotation (defaultComponentName="osmolarity",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Concentration.
    </p>
    </html>"));
      connector OsmolarityOutput = output Osmolarity
        "output Concentration as connector"
        annotation (defaultComponentName="osmolarity",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector PressureInput = input Pressure "input Pressure as connector"
        annotation (defaultComponentName="pressure",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Pressure.
    </p>
    </html>"));
      connector PressureOutput = output Pressure "output Pressure as connector"
        annotation (defaultComponentName="pressure",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector VolumeInput = input Volume "input Volume as connector"
        annotation (defaultComponentName="volume",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Volume.
    </p>
    </html>"));
      connector VolumeOutput = output Volume "output Volume as connector"
        annotation (defaultComponentName="volume",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector VolumeFlowRateInput = input VolumeFlowRate
        "input VolumeFlowRate as connector"
        annotation (defaultComponentName="volumeflowrate",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type VolumeFlowRate.
    </p>
    </html>"));
      connector VolumeFlowRateOutput = output VolumeFlowRate
        "output VolumeFlowRate as connector"
        annotation (defaultComponentName="volumeflowrate",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector TemperatureInput = input Temperature
        "input Temperature as connector"
        annotation (defaultComponentName="temperature",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Temperature.
    </p>
    </html>"));
      connector TemperatureOutput = output Temperature
        "output Temperature as connector"
        annotation (defaultComponentName="temperature",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector TimeInput = input Time "input Time as connector"
        annotation (defaultComponentName="time",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Time.
    </p>
    </html>"));
      connector TimeOutput = output Time "output Time as connector"
        annotation (defaultComponentName="time",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector ThermalConductanceInput = input ThermalConductance
        "input ThermalConductance as connector"
        annotation (defaultComponentName="thermalconductance",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type ThermalConductance.
    </p>
    </html>"));
      connector ThermalConductanceOutput = output ThermalConductance
        "output ThermalConductance as connector"
        annotation (defaultComponentName="thermalconductance",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector ElectricPotentialInput = input ElectricPotential
        "input ElectricPotential as connector"
        annotation (defaultComponentName="electricpotential",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type ElectricPotential.
    </p>
    </html>"));
      connector ElectricPotentialOutput = output ElectricPotential
        "output ElectricPotential as connector"
        annotation (defaultComponentName="electricpotential",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector FractionInput = input Fraction "input Fraction as connector"
        annotation (defaultComponentName="fraction",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Fraction.
    </p>
    </html>"));
      connector FractionOutput = output Fraction "output Fraction as connector"
        annotation (defaultComponentName="fraction",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector FrequencyInput = input Frequency "input Frequency as connector"
        annotation (defaultComponentName="frequency",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Frequency.
    </p>
    </html>"));
      connector FrequencyOutput = output Frequency
        "output Frequency as connector"
        annotation (defaultComponentName="frequency",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Frequency.
  </p>
  </html>"));
      connector OsmoticPermeabilityInput = input OsmoticPermeability
        "input OsmoticPermeability as connector"
        annotation (defaultComponentName="osmoticmembranepermeability",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type OsmoticMembranePermeability.
    </p>
    </html>"));
      connector OsmoticPermeabilityOutput = output OsmoticPermeability
        "output OsmoticPermeability as connector"
        annotation (defaultComponentName="osmoticmembranepermeability",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector HydraulicConductanceInput = input HydraulicConductance
        "input HydraulicConductance as connector"
        annotation (defaultComponentName="hydraulicconductance",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type HydraulicConductance.
    </p>
    </html>"));
      connector HydraulicConductanceOutput = output HydraulicConductance
        "output HydraulicConductance as connector"
        annotation (defaultComponentName="hydraulicconductance",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector HydraulicComplianceInput = input HydraulicCompliance
        "input HydraulicCompliance as connector"
        annotation (defaultComponentName="hydrauliccompliance",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type HydraulicCompliance.
    </p>
    </html>"));
      connector HydraulicComplianceOutput = output HydraulicCompliance
        "output HydraulicCompliance as connector"
        annotation (defaultComponentName="hydrauliccompliance",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
       connector HydraulicElastanceInput = input HydraulicElastance
        "input HydraulicElastance as connector"
        annotation (defaultComponentName="hydraulicelastance",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type HydraulicElastance.
    </p>
    </html>"));
      connector HydraulicElastanceOutput = output HydraulicElastance
        "output HydraulicElastance as connector"
        annotation (defaultComponentName="hydraulicelastance",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector DensityInput =input Density "input Density as connector"
        annotation (defaultComponentName="density",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Volume.
    </p>
    </html>"));
      connector DensityOutput =output Density "output Density as connector"
        annotation (defaultComponentName="density",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector HydraulicInertanceInput = input HydraulicInertance
        "input HydraulicInertance as connector"
        annotation (defaultComponentName="hydraulicinertance",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type HydraulicInertance.
    </p>
    </html>"));
      connector HydraulicInertanceOutput = output HydraulicInertance
        "output HydraulicInertance as connector"
        annotation (defaultComponentName="hydraulicinertance",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector GasSolubilityInput = input GasSolubility
        "input GasSolubility as connector"
        annotation (defaultComponentName="gassolubility",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type GasSolubility.
    </p>
    </html>"));
      connector GasSolubilityOutput = output GasSolubility
        "output GasSolubility as connector"
        annotation (defaultComponentName="gassolubility",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector SpecificEnergyInput =
                              input SpecificEnergy
        "input SpecificEnergy as connector"
        annotation (defaultComponentName="specificEnergy",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Volume.
    </p>
    </html>"));
      connector SpecificEnergyOutput =
                               output SpecificEnergy
        "output SpecificEnergy as connector"
        annotation (defaultComponentName="specificEnergy",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector SpecificHeatCapacityInput =
                              input SpecificHeatCapacity
        "input SpecificHeatCapacity as connector"
        annotation (defaultComponentName="specificHeatCapacity",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Volume.
    </p>
    </html>"));
      connector SpecificHeatCapacityOutput =
                               output SpecificHeatCapacity
        "output SpecificHeatCapacity as connector"
        annotation (defaultComponentName="specificHeatCapacity",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector pHInput =           input pH "input pH as connector"
        annotation (defaultComponentName="pH",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type pH.
    </p>
    </html>"));
      connector pHOutput =           output pH "output pH as connector"
        annotation (defaultComponentName="pH",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type pH.
  </p>
  </html>"));
      connector VolumeDensityOfChargeInput =           input
          VolumeDensityOfCharge "input VolumeDensityOfCharge as connector"
        annotation (defaultComponentName="volumeDensityOfCharge",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type VolumeDensityOfCharge.
    </p>
    </html>"));
      connector VolumeDensityOfChargeOutput =           output
          VolumeDensityOfCharge "output VolumeDensityOfCharge as connector"
        annotation (defaultComponentName="volumeDensityOfCharge",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type VolumeDensityOfCharge.
  </p>
  </html>"));
      connector MassConcentrationInput =
                                     input MassConcentration
        "input MassConcentration as connector"
        annotation (defaultComponentName="massConcentration",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type MassConcentration.
    </p>
    </html>"));
      connector MassConcentrationOutput =
                                      output MassConcentration
        "output MassConcentration as connector"
        annotation (defaultComponentName="massConcentration",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type MassConcentration.
  </p>
  </html>"));
      connector VelocityInput =      input Velocity "input Velocity as connector"
        annotation (defaultComponentName="velocity",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Velocity.
    </p>
    </html>"));
      connector VelocityOutput =      output Velocity
        "output Velocity as connector"
        annotation (defaultComponentName="velocity",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Velocity.
  </p>
  </html>"));
      connector PowerInput = input Power "input Power as connector"
        annotation (defaultComponentName="power",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Power.
    </p>
    </html>"));
      connector PowerOutput = output Power "output Power as connector"
        annotation (defaultComponentName="power",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Power.
  </p>
  </html>"));
      connector PositionInput = input Position "input Position as connector"
        annotation (defaultComponentName="position",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Position.
    </p>
    </html>"));
      connector PositionOutput = output Position "output Position as connector"
        annotation (defaultComponentName="position",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Position.
  </p>
  </html>"));
       connector MolarEnergyInput = input MolarEnergy
        "input MolarEnergy as connector"
        annotation (defaultComponentName="molarEnergy",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type MolarEnergy.
    </p>
    </html>"));
      connector MolarEnergyOutput = output MolarEnergy
        "output MolarEnergy as connector"
        annotation (defaultComponentName="molarEnergy",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type MolarEnergy.
  </p>
  </html>"));
       connector PopulationInput =  input Population
        "input Population as connector"
        annotation (defaultComponentName="population",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Population.
    </p>
    </html>"));
      connector PopulationOutput =  output Population
        "output Population as connector"
        annotation (defaultComponentName="population",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Population.
  </p>
  </html>"));
       connector PopulationChangeInput =
                                    input PopulationChange
        "input PopulationChange as connector"
        annotation (defaultComponentName="populationChange",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type PopulationChange.
    </p>
    </html>"));
      connector PopulationChangeOutput =
                                    output PopulationChange
        "output PopulationChange as connector"
        annotation (defaultComponentName="populationChange",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type PopulationChange.
  </p>
  </html>"));
      connector PopulationChangePerMemberInput =
                                    input PopulationChangePerMember
        "input PopulationChangePerMember as connector"
        annotation (defaultComponentName="populationChangePerMember",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type PopulationChangePerMember.
    </p>
    </html>"));
      connector PopulationChangePerMemberOutput =
                                    output PopulationChangePerMember
        "output PopulationChangePerMember as connector"
        annotation (defaultComponentName="populationChangePerMember",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type PopulationChangePerMember.
  </p>
  </html>"));
    end RealIO;

      expandable connector BusConnector
      "Empty control bus that is adapted to the signals connected to it"

      annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.2), graphics={
              Rectangle(
                extent={{-20,2},{20,-2}},
                lineColor={0,0,255},
                lineThickness=0.5),
              Polygon(
                points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{
                  -80,-40},{-100,30},{-80,50}},
                lineColor={0,0,0},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-65,25},{-55,15}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-5,25},{5,15}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{55,25},{65,15}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-35,-15},{-25,-25}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{25,-15},{35,-25}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.2), graphics={
              Polygon(
                points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,
                    -20},{-50,15},{-40,25}},
                lineColor={0,0,0},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-32.5,7.5},{-27.5,12.5}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-2.5,12.5},{2.5,7.5}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{27.5,12.5},{32.5,7.5}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-17.5,-7.5},{-12.5,-12.5}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{12.5,-7.5},{17.5,-12.5}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,70},{150,40}},
                lineColor={0,0,0},
                textString="%name")}),
          Documentation(info="<html>
<p>
This connector defines the \"expandable connector\" that
is used as bus in the Physiomodel (www.physiomodel.org).
Note, this connector is \"empty\". When using it, the actual content is
constructed by the signals connected to this bus.
</p>
</html>"));

      end BusConnector;

    type Energy = Modelica.SIunits.Energy(displayUnit="kcal", nominal=4186.8);
    type Time = Modelica.SIunits.Time(displayUnit="min", nominal=60);
    type Frequency = Modelica.SIunits.Frequency(displayUnit="1/min");
    type Mass = Modelica.SIunits.Mass(displayUnit="g", nominal=1e-3, min=0);
    type MassFlowRate = Modelica.SIunits.MassFlowRate(displayUnit="mg/min", nominal=(1e-6)/60);
    type Density = Modelica.SIunits.Density(displayUnit="kg/l", nominal=1e-3);
    type MolarMass = Modelica.SIunits.MolarMass(displayUnit="kDa", nominal=1);
    type Height = Modelica.SIunits.Height(displayUnit="cm", nominal=1e-2);
    type Position = Modelica.SIunits.Position(displayUnit="cm", nominal=1e-2);
    type Velocity = Modelica.SIunits.Velocity(displayUnit="km/h", nominal=1);
    type Acceleration = Modelica.SIunits.Acceleration(displayUnit="m/s2", nominal=1);
    type AbsolutePressure = Modelica.SIunits.AbsolutePressure(displayUnit="mmHg", nominal=133.322387415);
    type Pressure =  Modelica.SIunits.Pressure(displayUnit="mmHg", nominal=133.322387415);
    type Volume =  Modelica.SIunits.Volume(displayUnit="ml", nominal=1e-6, min=0);
    type VolumeFlowRate = Modelica.SIunits.VolumeFlowRate(displayUnit="ml/min", nominal=(1e-6)/60);
    replaceable type Concentration = Modelica.SIunits.Concentration (displayUnit="mmol/l", min=0) constrainedby Real;
    replaceable type AmountOfSubstance = Modelica.SIunits.AmountOfSubstance (displayUnit="mmol", min=0) constrainedby Real;
    replaceable type MolarFlowRate = Modelica.SIunits.MolarFlowRate(displayUnit="mmol/min") constrainedby Real;
    replaceable type MolarEnergy = Modelica.SIunits.MolarEnergy(displayUnit="kcal/mol", nominal=4186.8) constrainedby Real
      "chemical internal energy, chemical enthalpy, Gibb's energy ..";
    type MassConcentration =
                   Modelica.SIunits.MassConcentration(displayUnit="mg/l", nominal=1e-3, min=0);
    type Osmolarity = Modelica.SIunits.Concentration (displayUnit="mosm/l", nominal=1);
    type Heat = Modelica.SIunits.Heat(displayUnit="kcal", nominal=4186800); //needed to heat 1 liter of water by 1 degC
    type Temperature = Modelica.SIunits.Temperature(displayUnit="degC", nominal=1, min=0);
    type HeatFlowRate = Modelica.SIunits.HeatFlowRate(displayUnit="kcal/min", nominal=4186.8/60);
    type Power = Modelica.SIunits.Power(displayUnit="kcal/min", nominal=4186.8/60);
    type PowerPerMass = Real(final quantity="Power per Mass",final unit="W/kg",displayUnit="cal/(g.min)", nominal=4.1868/(0.001*60));
    type ThermalConductance = Modelica.SIunits.ThermalConductance(displayUnit="kcal/(min.K)", nominal=4186.8/60);
    type SpecificHeatCapacity = Modelica.SIunits.SpecificHeatCapacity(displayUnit="kcal/(kg.K)", nominal=4186.8);
    type SpecificEnergy = Modelica.SIunits.SpecificEnergy(displayUnit="kcal/kg", nominal=4186.8)
      "vaporization, ..";
    type ElectricPotential = Modelica.SIunits.ElectricPotential(displayUnit="mV", nominal=1e-3);
    type ElectricCharge = Modelica.SIunits.ElectricCharge(displayUnit="meq", nominal=1e-3);
    type VolumeDensityOfCharge =
                          Modelica.SIunits.VolumeDensityOfCharge(displayUnit="meq/l", nominal=(9.64853399*10^4));
    type ElectricCurrent = Modelica.SIunits.ElectricCurrent(displayUnit="meq/min", nominal=(9.64853399*10^4/1000)/60);
  //unknown units in Standard Modelica Library 3.2
    type Fraction = Real(final quantity="Fraction",final unit="1", displayUnit="%", nominal=1e-2);
    type pH =       Real(final quantity="pH",final unit="1",final displayUnit="1", nominal=7, min=0, max=14);
    type OsmoticPermeability = Real(final quantity="OsmoticPermeability",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60), min=0);
    type DiffusionPermeability = Real(final quantity="DiffusionPermeability", final unit="m3/s", displayUnit="ml/min", nominal=(1e-6)/60, min=0);
    type HydraulicConductance = Real(final quantity="HydraulicConductance",final unit="kg/(Pa.s)", displayUnit="g/(mmHg.min)", nominal=(1e-3)/((133.322387415)*60), min=0);
    type HydraulicResistance = Real(final quantity="HydraulicConductance",final unit="(Pa.s)/kg", displayUnit="(mmHg.min)/g", nominal=(1e+3)*(133.322387415)*60, min=0);
    type HydraulicCompliance =  Real(final quantity="HydraulicCompliance",final unit="kg/Pa", displayUnit="g/mmHg", nominal=(1e-3)/(133.322387415));
    type HydraulicElastance = Real(final quantity="HydraulicElastance",final unit="Pa/kg", displayUnit="mmHg/g", nominal=(133.322387415)/(1e-3));
    type HydraulicInertance =  Real(final quantity="HydraulicInertance",final unit="Pa.s2/kg", displayUnit="mmHg.min2/g", nominal=((133.322387415)*(60^2)/(1e-3)));
    type GasSolubility = Real(final quantity="GasSolubility", final unit="(mol/m3)/(mol/m3)", displayUnit="(mmol/l)/kPa at 25degC", nominal=1e-2, min=0)
      "Gas solubility in liquid";
    type StoichiometricNumber = Modelica.SIunits.StoichiometricNumber; // Integer(final quantity="StoichiometricNumber", min=1);

    type Population = Real (final quantity="Population", final unit="1", displayUnit="1", min=0)
      "Average number of population individuals";
    type PopulationChange = Real (final quantity="PopulationChange", final unit="1/s", displayUnit="1/d")
      "Average change of population individuals";
    type PopulationChangePerMember = Real (final quantity="PopulationChangePerMember", final unit="1/s", displayUnit="1/d")
      "Average change per population individual";

    annotation (Documentation(revisions="<html>
<p>Copyright (c) 2017-2018, Marek Matej&aacute;k, http://www.physiolib.com </p>
<p>All rights reserved. </p>
</html>",   info="<html>
<p>The main problem of medical research, articles, and experiments is using obscure units from medicine, pharmacology, biology and non-physics disciplines. The Physiolib fulfills the Modelica ideal of using SI units as the main unit for each variable, and the previously described physiological units are also implemented as the displayUnits for each variable. Using these displayUnits the user sets and sees the &quot;physiological&quot; values. The implementation can also be joined to any unit-correct Modelica models and physical equations without crashing due to unit incompatibilities. The unit support of Physiolib is so strong that you even can chose the right unit-typed &ldquo;input real&rdquo;/&rdquo;output real&rdquo; from the library package Types.RealIO. As can be expected, only the non-specific packages States and Blocks in the Physiolib have variables without units.</p>
</html>"));
  end Types;

  package Blocks "Base Signal Blocks Library"
    extends Modelica.Icons.Package;
    package Math "Modelica.Math extension"
      extends Modelica.Icons.Package;
      model Integrator "Integrator with support of steady state calculation."
        extends Physiolib.SteadyStates.Interfaces.SteadyState(state_start=
              y_start, state(nominal=NominalValue));

        parameter Real k=1 "Integrator gain";

        parameter Real y_start=0 "Initial or guess value of output (= state)"
          annotation (Dialog(group="Initialization"));
        extends Modelica.Blocks.Interfaces.SISO(u(nominal=NominalValue/k),y(nominal=NominalValue));

        parameter Real NominalValue = 1
          "Numerical scale. For some substances such as hormones, hydronium or hydroxide ions should be set."
            annotation ( HideResult=true, Dialog(tab="Solver",group="Numerical support of very small concentrations"));
      equation
        state = y;  //der(y) = k*u
        change = k*u;

        annotation (defaultComponentName="int",
          Documentation(info="<html>
<p>
This blocks computes output <b>y</b> (element-wise) as
<i>integral</i> of the input <b>u</b> multiplied with
the gain <i>k</i>:
</p>
<pre>
         k
     y = - u
         s
</pre>

<p>
It might be difficult to initialize the integrator in steady state.
This is discussed in the description of package
<a href=\"Modelica://Modelica.Blocks.Continuous#info\">Continuous</a>.
</p>

</html>
"),       Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
              Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
              Polygon(
                points={{90,-80},{68,-72},{68,-88},{90,-80}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{0,-10},{60,-70}},
                lineColor={192,192,192},
                textString="I"),
              Text(
                extent={{-150,-150},{150,-110}},
                lineColor={0,0,0},
                textString="k=%k"),
              Line(points={{-80,-80},{80,80}}, color={0,0,127})}),
          Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
              Line(points={{-100,0},{-60,0}}, color={0,0,255}),
              Line(points={{60,0},{100,0}}, color={0,0,255}),
              Text(
                extent={{-36,60},{32,2}},
                lineColor={0,0,0},
                textString="k"),
              Text(
                extent={{-32,0},{36,-58}},
                lineColor={0,0,0},
                textString="s"),
              Line(points={{-46,0},{46,0}})}));
      end Integrator;

          block Add "u + parameter"

            parameter Real k(start=1) "value added to input signal";
      public
            Modelica.Blocks.Interfaces.RealInput u "Input signal connector"
              annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
            Modelica.Blocks.Interfaces.RealOutput y "Output signal connector"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));

          equation
            y = k+u;
            annotation (defaultComponentName="add",
              Documentation(info="<html>
<p>This block computes output <i>y</i> as <i>sum</i> of offset <i>k</i> with the input <i>u</i>: </p>
<p><code>    y = k + u;</code> </p>
</html>"),    Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Polygon(
                points={{-100,100},{100,40},{100,-40},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-100,-42},{100,40}},
                lineColor={0,0,0},
                textString="u+%k"),
              Text(
                extent={{-150,140},{150,100}},
                textString="%name",
                lineColor={0,0,255})}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Polygon(
                points={{-100,-100},{-100,100},{100,0},{-100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-76,38},{0,-34}},
                lineColor={0,0,255},
                textString="k")}));
          end Add;

          block Reciprocal "1 / u"
            extends Modelica.Blocks.Interfaces.SISO;
          equation
            y = 1/u;
            annotation (defaultComponentName="rec",
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Text(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                textString="1/u")}),
              Documentation(info="<html>
<p>This blocks computes the output <b>y</b> as <i>reciprocal value</i> of the input <b>u</b>: </p>
<p><code>    y = 1 / u ;</code> </p>
</html>"));
          end Reciprocal;

          block Power "b ^ u"

            parameter Boolean useBaseInput = false
          "=true, if exponential base input is used instead of parameter Base"
            annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

            parameter Real Base=10 "exponential base if useBaseInput=false"
              annotation (Dialog(enable=not useBaseInput));

            Modelica.Blocks.Interfaces.RealOutput y
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));
            Modelica.Blocks.Interfaces.RealInput base(start=Base) = b if useBaseInput annotation (Placement(
                  transformation(extent={{-120,40},{-80,80}})));
            Modelica.Blocks.Interfaces.RealInput exponent annotation (Placement(
                  transformation(extent={{-120,-80},{-80,-40}})));

      protected
            Real b "Current exponential base";
          equation
            if not useBaseInput then
              b = Base;
            end if;

            y = b^exponent;
             annotation (defaultComponentName="pow",
              Documentation(info="<html>
<p>y = base^exponent</p>
</html>"),    Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
                  initialScale=0.04), graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-100,-40},{100,40}},
                lineColor={0,0,0},
                    textString="b^u")}));
          end Power;

      block Min "Pass through the smallest signal"
        extends Modelica.Blocks.Interfaces.MISO;
      equation
         y = min(u);
        annotation (defaultComponentName="min", Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                extent={{-90,36},{90,-36}},
                lineColor={160,160,164},
                textString="min()")}),
                                Documentation(info="<html>
<p>
This block computes the output <b>y</b> as <i>minimum</i> of
the Real inputs <b>u[1]</b>,<b>u[2]</b> .. <b>u[nin]</b>:
</p>
<pre>    y = <b>min</b> ( u );
</pre>
</html>
"));
      end Min;

          block Log10AsEffect "min( 0, log10(u) )"

            extends Modelica.Blocks.Interfaces.SISO;
          equation
            y = if u>1 then Modelica.Math.log10(u) else 0;
            annotation (defaultComponentName="logEffect",
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Polygon(
                points={{90,0},{68,8},{68,-8},{90,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-90,0},{68,0}}, color={192,192,192}),
              Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-80,-80},{-80,68}}, color={192,192,192}),
              Text(
                extent={{-44,-56},{94,-80}},
                lineColor={192,192,192},
                textString="max(log10,0)"),
              Line(points={{-100,0},{-80,0},{-78,0},{-74,0},{-76,0},{-74,0},{-72,
                    0},{-69.5,6.08},{-64.7,15.9},{-57.5,26},{-47,36.1},{-31.8,
                    46.1},{-10.1,56},{22.1,66},{68.7,76.1},{80,78}}, color={0,0,
                    0})}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Line(points={{-80,80},{-88,80}}, color={192,192,192}),
              Line(points={{-80,-80},{-88,-80}}, color={192,192,192}),
              Line(points={{-80,-90},{-80,84}}, color={192,192,192}),
              Text(
                extent={{-65,96},{-38,78}},
                lineColor={160,160,164},
                textString="y"),
              Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-100,0},{84,0}}, color={192,192,192}),
              Polygon(
                points={{100,0},{84,6},{84,-6},{100,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-100,0},{-80,0},{-78,0},{-74,0},{-76,0},{-74,0},{-72,
                    0},{-69.5,6.08},{-64.7,15.9},{-57.5,26},{-47,36.1},{-31.8,
                    46.1},{-10.1,56},{22.1,66},{68.7,76.1},{80,78}}, color={0,0,
                    0}),
              Text(
                extent={{70,-3},{90,-23}},
                textString="20",
                lineColor={0,0,255}),
              Text(
                extent={{-78,-1},{-58,-21}},
                textString="1",
                lineColor={0,0,255}),
              Text(
                extent={{-109,72},{-89,88}},
                textString=" 1.3",
                lineColor={0,0,255}),
              Text(
                extent={{-109,-88},{-89,-72}},
                textString="-1.3",
                lineColor={0,0,255}),
              Text(
                extent={{62,30},{90,10}},
                lineColor={160,160,164},
                textString="u")}),
              Documentation(info="<html>
<p>This blocks computes the output <b>y</b> as the <i>base 10 logarithm</i> of the input <b>u </b>if <b>u&gt;1</b> or 0 otherwise </p>
<p><code>    y = if(u&gt;1) <b>log10</b>( u ) else 0;</code></p>
</html>"));
          end Log10AsEffect;

          block Parts "Divide the input value by weights"
            extends Modelica.Blocks.Interfaces.SIMO;
            parameter Real w[nout]=ones(nout) "Optional: weight coefficients";
      protected
           Real coef;
           Real weight[nout];
          equation
            ones(nout)*weight = 1;
            for i in 1:nout loop
                weight[i] = w[i] * coef;
                y[i] = u * weight[i];
            end for;
            annotation (defaultComponentName="parts",
              Documentation(info="<html>
<p>This blocks divide input value u to output array y by weights. The sum of output values is equal to input value <b>u</b>: </p>
<p><code>    u = (w[1]*y[1] + w[2]*y[2] + ... + w[n]*y[n]) / (w[1] + w[2] + ... + w[n]);</code></p>
<p>Example: </p>
<pre>     parameter:   nin = 3;  w=ones(3);

  results in the following equations:

<p><code>     y[1]=u/3,  y[2]=u/3,  y[3]=u/3;</code> </p>
</html>"),    Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Text(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,0},
                textString="Parts")}));
          end Parts;

          block HomotopyStrongComponentBreaker
        "Break the strong component in normalized signal with independent default constant value"
            extends Modelica.Blocks.Interfaces.SISO;
            parameter Real defaultValue=1;
            parameter Real defaultSlope=0;
          equation
            y = homotopy(u,defaultValue + defaultSlope*(u-defaultValue));
            //y = homotopy(u,defaultValue);
             annotation (defaultComponentName="homotopy",
              Documentation(info="<html>
<p>This blocks should solve the initial strong component problem. In the non-linear-strong-component-cycled place, where the default or mean value of variable is known.</p>
<p>For example the regulation loop L driven by loop-dependent effect E with default value 1:</p>
<p> </p>
<p>E=f(L(E)) can be rewritten to E=f(L( H )), where H is output from this block with input E. </p>
</html>"),    Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
                  initialScale=0.04), graphics={Text(
                extent={{-100,-24},{96,20}},
                lineColor={0,0,255},
                    textString="Homotopy")}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
                  initialScale=0.04), graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-98,-18},{98,26}},
                lineColor={0,0,255},
                    textString="Homotopy")}));
          end HomotopyStrongComponentBreaker;

          block DegradationGain
        "Output the degradation flow from HalfTime and the amount as the input signal"

            parameter Physiolib.Types.Time HalfTime
          "Half time to compute degradation from amount or mass";
      public
            Modelica.Blocks.Interfaces.RealInput u "Input signal connector" annotation (
                Placement(transformation(extent={{-140,-20},{-100,20}})));
            Modelica.Blocks.Interfaces.RealOutput y "Output signal connector" annotation (
               Placement(transformation(extent={{100,-10},{120,10}})));

          equation
            y = (Modelica.Math.log(2)/HalfTime)*u;
            annotation (
              Documentation(info="<html>
<p>
This block computes output <i>y</i> as
<i>product</i> of gain <i>k</i> with the
input <i>u</i>:
</p>
<pre>
    y = k * u;
</pre>

</html>"),           Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Polygon(
                points={{-100,-100},{-100,100},{100,0},{-100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,140},{150,100}},
                textString="%name",
                lineColor={0,0,255})}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={Polygon(
                points={{-100,-100},{-100,100},{100,0},{-100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-76,38},{0,-34}},
                textString="k",
                lineColor={0,0,255})}));
          end DegradationGain;

          block FractionGain "Output the fraction of the input signal"

            parameter Physiolib.Types.Fraction f
          "Half time to compute degradation from amount or mass";
      public
            Modelica.Blocks.Interfaces.RealInput u "Input signal connector" annotation (
                Placement(transformation(extent={{-140,-20},{-100,20}})));
            Modelica.Blocks.Interfaces.RealOutput y "Output signal connector" annotation (
               Placement(transformation(extent={{100,-10},{120,10}})));

          equation
            y = f*u;
            annotation (
              Documentation(info="<html>
<p>
This block computes output <i>y</i> as
<i>product</i> of gain <i>k</i> with the
input <i>u</i>:
</p>
<pre>
    y = k * u;
</pre>

</html>"),           Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Polygon(
                points={{-100,-100},{-100,100},{100,0},{-100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,140},{150,100}},
                textString="%name",
                lineColor={0,0,255})}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={Polygon(
                points={{-100,-100},{-100,100},{100,0},{-100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-76,38},{0,-34}},
                textString="k",
                lineColor={0,0,255})}));
          end FractionGain;
    end Math;

    package Interpolation "Empirical Dependence of Two Variables"
      extends Modelica.Icons.Package;
     function Spline "Cubic spline interpolation function"

          input Real[:] x "x coordinations of interpolating points"; //souradnice x souradnice uzlovych bodu
          input Real[:,4] a
          "cubic polynom coefficients of curve segments between interpolating points";                   //parametry kubiky
          input Real xVal "input value of x to calculate y value"; //vstupni hodnota

          output Real yVal "y value at xVal";
     //     output Real outExtra;
      protected
        Integer index "index of segment";
        Integer n "number of interpolating points";

     algorithm
            // Najdi interval, ve kterem se nachazi xVal

            if (xVal <= x[1]) then //kdyz je hodnota xVal pred prvnim uzlovym bodem

              yVal := xVal * a[1,3] + a[1,4]; //pocitam primku

            else
              n := size(x,1); //pocet uzlovych bodu
              if (xVal>=x[n]) then //kdyz je hodnota xVal za poslednim uzlovym bodem

                 yVal := xVal * a[n+1,3] + a[n+1,4];  //pocitam primku

            else
              index := 2;
              while  xVal > x[index] and index < n loop
                index:=index+1;
              end while;
              yVal := ((a[index,1]*xVal + a[index,2])*xVal + a[index,3])*xVal + a[index,4];

              /*
         x1:=x[index-1];
         x2:=x[index];
         y1:=y[index-1];
         y2:=y[index];
         slope1:=slope[index-1];
         slope2:=slope[index];

         a1:=-(-x2*slope2 - x2*slope1 + slope2*x1 + slope1*x1 + 2*y2 - 2*y1)/(x2 - x1)^3;
         a2:=(-x2^2*slope2-2*x2^2*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*x1^2+3*y2*x1+2*slope2*x1^2)/(x2-x1)^3;
         a3:=-(-slope1*x2^3-2*x2^2*slope2*x1-x2^2*slope1*x1+x2*slope2*x1^2+2*x2*slope1*x1^2+6*x2*x1*y2-6*x2*x1*y1+slope2*x1^3)/(x2-x1)^3;
         a4:=(-slope1*x2^3*x1+y1*x2^3-slope2*x1^2*x2^2+slope1*x1^2*x2^2-3*y1*x2^2*x1+3*y2*x1^2*x2+slope2*x1^3*x2-y2*x1^3)/(x2-x1)^3;

         yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;
         */
              end if;
           end if;
       //    outExtra := xVal + yVal;
            annotation (Documentation(revisions="<html>
<p>author: Ondrej Vacek</p>
</html>"));
     end Spline;

     function SplineCoefficients "Cubic spline interpolation coefficients"

          input Real[:] x "x coordinations of interpolating points";
          input Real[:] y "y coordinations of interpolating points";
          input Real[:] slope "slopes at interpolating points";

          output Real[size(x,1)+1,4] a
          "cubic polynom coefficients of curve segments between interpolating points";                               //pocet hodnot ctyrech parametru kubiky je o jeden vic nez pocet bodu

      protected
        Integer n "number of interpolating points";
        Integer i "index of segment";

        Real x1 "previos point";
        Real x2 "current point";

        Real y1 "previous point";
        Real y2 "current point";
        Real slope1 "previous point";
        Real slope2 "current point";

     algorithm
        n := size(x,1);//pocet uzlovych bodu
        for i in 2:n loop //cyklus od 2 do n
              x1:=x[i-1]; //predchozi bod
              x2:=x[i];  //soucasny bod
              y1:=y[i-1]; //predchozi bod
              y2:=y[i]; //soucasny bod
              slope1:=slope[i-1]; //predchozi bod
              slope2:=slope[i]; //soucasny bod
              //vypocty parametru kubiky (od 2 do n) podle souradnic a smernic dvou bodu : y=a[i,4]+a[i,3]*x+a[i,2]*x^2+a[i,1]*x^3
              a[i,1]:=-(-x2*slope2 - x2*slope1 + x1*slope2 + x1*slope1 + 2*y2 - 2*y1)/((x2 - x1)^3);
              a[i,2]:=(-(x2^2)*slope2-2*(x2^2)*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*(x1^2)+3*y2*x1+2*slope2*(x1^2))/((x2-x1)^3);
              a[i,3]:=-(-slope1*(x2^3)-2*(x2^2)*slope2*x1-(x2^2)*slope1*x1+x2*slope2*(x1^2)+2*x2*slope1*(x1^2)+6*x2*x1*y2-6*x2*x1*y1+slope2*(x1^3))/((x2-x1)^3);
              a[i,4]:=(-slope1*(x2^3)*x1+y1*(x2^3)-slope2*(x1^2)*(x2^2)+slope1*(x1^2)*(x2^2)-3*y1*(x2^2)*x1+3*y2*(x1^2)*x2+slope2*(x1^3)*x2-y2*(x1^3))/((x2-x1)^3);
        end for;
        a[1,  :] := { 0, 0, slope[1], y[1] - x[1]*slope[1]}; //vypocet prvni sady parametru kubiky  - primky
        a[n+1,:] := { 0, 0, slope[n], y[n] - x[n]*slope[n]}; //vypocet posledni sady parametru kubiky - primky

            annotation (Documentation(revisions="<html>
<p>author: Ondrej Vacek</p>
</html>"));
     end SplineCoefficients;

          model Curve
        "2D natural cubic interpolation spline defined with (x,y,slope) points"

               parameter Real x[:] = fill(Modelica.Constants.N_A,1)
          "x coordinations of interpolating points";
               parameter Real y[:] = fill(Modelica.Constants.N_A,1)
          "y coordinations of interpolating points";
               parameter Real slope[:] = fill(Modelica.Constants.N_A,1)
          "slopes at interpolating points";

               parameter Real[:,3] data = transpose({x,y,slope})
          "Array of interpolating points as {x,y,slope}";

              parameter Real Xscale = 1 "conversion scale to SI unit of x values";
              parameter Real Yscale = 1 "conversion scale to SI unit of y values";

               Modelica.Blocks.Interfaces.RealInput u
                            annotation (Placement(transformation(extent={{-120,
                  -20},{-80,20}})));
               Modelica.Blocks.Interfaces.RealOutput val
                               annotation (Placement(transformation(extent={{80,-20},
                  {120,20}})));

      protected
              parameter Real a[:,:] = SplineCoefficients( data[:, 1]*Xscale,data[:, 2]*Yscale,data[:, 3]*Yscale/Xscale)
          "cubic polynom coefficients of curve segments between interpolating points";

          equation
            val = Spline(
                  data[:, 1]*Xscale,
                  a,
                  u);

             annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
              graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-70,-76},{-20,-48},{0,12},{34,62},{76,72}},
                color={0,0,127},
                smooth=Smooth.Bezier),
              Line(
                points={{-48,-82},{-48,90},{-48,90}},
                color={0,0,127},
                smooth=Smooth.Bezier,
                arrow={Arrow.None,Arrow.Filled}),
              Line(
                points={{-72,-74},{68,-74},{68,-74}},
                color={0,0,127},
                smooth=Smooth.Bezier,
                arrow={Arrow.None,Arrow.Filled})}));
          end Curve;
    end Interpolation;

    package Factors "Multiplication Effects"
      extends Modelica.Icons.Package;
      model Normalization "effect = u/NormalValue"
       extends Physiolib.Icons.BaseFactorIcon;

       parameter Real NormalValue=1
          "Normal value of u, because y=(u/NormalValue)*yBase.";

       parameter Boolean enabled=true "disabled => y=yBase";

       Modelica.Blocks.Interfaces.RealInput u
                    annotation (Placement(transformation(extent={{-100,-20},{-60,
                  20}})));

        Physiolib.Types.Fraction effect;
      equation
        effect = if enabled then u/NormalValue else 1;
        y=effect*yBase;
        annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p><h4>y = yBase * u</h4></p>
</html>"));
      end Normalization;

      model DamagedFraction "effect = 1 - DamagedAreaFraction"
       extends Physiolib.Icons.BaseFactorIcon;

       parameter Physiolib.Types.Fraction DamagedAreaFraction=0;

        Physiolib.Types.Fraction effect;
      equation
        effect = 1-DamagedAreaFraction;
        y=yBase*effect;
      end DamagedFraction;

      model Spline "effect = spline(data,u)"
       extends Physiolib.Icons.BaseFactorIcon4;
       Modelica.Blocks.Interfaces.RealInput u(nominal=Xscale)
                    annotation (Placement(transformation(extent={{-100,-20},{-60,
                  20}})));

       parameter Boolean enabled=true "disabled => y=yBase";

       parameter Real[:,3] data "Array of interpolating points as {x,y,slope}";

       parameter Real Xscale = 1 "conversion scale to SI unit of x values";
       parameter Real Yscale = 1 "conversion scale to SI unit of y values";

       parameter Boolean UsePositiveLog10 = false
          "x = if u/scaleX <=1 then 0 else log10(u/scaleX)";

        Physiolib.Types.Fraction effect
          "Multiplication coeffecient for yBase to reach y";

      protected
          parameter Real a[:,:] = if enabled then Interpolation.SplineCoefficients(
                                                            data[:, 1],data[:, 2]*Yscale,data[:, 3]*Yscale) else zeros(1,1)
          "Cubic polynom coefficients of curve segments between interpolating points";

      equation
        effect = if not enabled then 1 elseif UsePositiveLog10 then Interpolation.Spline(data[:, 1],a,if u/Xscale <= 1 then 0 else log10(u/Xscale))
         else Interpolation.Spline(data[:, 1],a,u/Xscale);

        y=effect*yBase;
        annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Spline;

      model LagSpline "Adapt the input signal before interpolation"
       extends Physiolib.Icons.BaseFactorIcon5;
       Modelica.Blocks.Interfaces.RealInput u
                    annotation (Placement(transformation(extent={{-100,-20},{-60,
                  20}})));

       parameter Boolean enabled=true "disabled => y=yBase";

       parameter Physiolib.Types.Time HalfTime(displayUnit="min");
                                                         //=3462.468;

       parameter Real initialValue = 1 "as u/Xscale";

       parameter Real Xscale = 1 "conversion scale to SI unit of x values";
       parameter Real Yscale = 1 "conversion scale to SI unit of y values";

       parameter Boolean UsePositiveLog10 = false
          "x = if u_delayed/scaleX <=1 then 0 else log10(u_delayed/scaleX)";

       parameter Real[:,3] data;
        Blocks.Math.Integrator integrator(
          k=(Modelica.Math.log(2)/HalfTime),
          y_start=initialValue*Xscale,
          NominalValue=Xscale) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-38,38})));
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-38,68})));
        Physiolib.Types.Fraction effect;
        Spline spline(
          data=data,
          Xscale=Xscale,
          Yscale=Yscale,
          UsePositiveLog10=UsePositiveLog10,
          enabled=enabled)
          annotation (Placement(transformation(extent={{-10,-18},{10,2}})));
      equation
        effect = spline.effect;
        connect(feedback.y, integrator.u) annotation (Line(
            points={{-38,59},{-38,50}},
            color={0,0,127}));
        connect(integrator.y, feedback.u2) annotation (Line(
            points={{-38,27},{-38,16},{-62,16},{-62,68},{-46,68}},
            color={0,0,127}));
        connect(feedback.u1, u) annotation (Line(
            points={{-38,76},{-38,94},{-88,94},{-88,0},{-80,0}},
            color={0,0,127}));
        connect(integrator.y, spline.u) annotation (Line(
            points={{-38,27},{-38,-8},{-8,-8}},
            color={0,0,127}));
        connect(yBase, spline.yBase) annotation (Line(
            points={{0,20},{0,-6}},
            color={0,0,127}));
        connect(spline.y, y) annotation (Line(
            points={{0,-12},{0,-40}},
            color={0,0,127}));
        annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>If the input signal u is constant and it is different from starting delayed input d, the middle value between u and d will be reached after HalfTime.</p>
<p>The mathematical background:</p>
<p>d&apos;(t) = k*(u(t) - d(t))       =&gt;       The solution of d(t) in special case, if u(t) is constant at each time t:  d(t)=u+(d(0)-u)*e^(-k*t),  where the definition of HalfTime is  d(HalfTime) = d(0) + (d(0)-u)/2.</p>
</html>"));
      end LagSpline;

      model SplineLag "Adapt the effect after interpolation"
       extends Physiolib.Icons.BaseFactorIcon3;
       Modelica.Blocks.Interfaces.RealInput u
                    annotation (Placement(transformation(extent={{-100,-20},{-60,
                  20}})));

       parameter Boolean enabled=true "disabled => y=yBase";

       parameter Physiolib.Types.Time HalfTime(displayUnit="d");
                                                      //Tau(unit="day");

       parameter String stateName=getInstanceName()
          "Name in Utilities input/output function"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

       parameter Real Xscale = 1 "conversion scale to SI unit of x values";

       parameter Boolean UsePositiveLog10 = false
          "x = if u/scaleX <=1 then 0 else log10(u/scaleX)";

       parameter Real[:,3] data;
        Modelica.Blocks.Math.Product product annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-32})));
        Blocks.Math.Integrator integrator(
          y_start=1,
          k=(Modelica.Math.log(2)/HalfTime),
          stateName=stateName) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-26,12})));
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-26,44})));
        Physiolib.Types.Fraction effect;
        Spline spline(
          data=data,
          Xscale=Xscale,
          UsePositiveLog10=UsePositiveLog10,
          enabled=enabled)
          annotation (Placement(transformation(extent={{-36,56},{-16,76}})));
        Physiolib.Types.Constants.FractionConst fraction(k(displayUnit="1")=
               1)
          annotation (Placement(transformation(extent={{-44,82},{-36,90}})));
      equation
        //der(effect) = (ln(2)/HalfTime)*(spline(data,u)-effect)
        effect = integrator.y;
        connect(yBase, product.u1) annotation (Line(
            points={{0,20},{0,30},{0,-20},{6,-20}},
            color={0,0,127}));
        connect(product.y, y) annotation (Line(
            points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-40}},
            color={0,0,127}));
        connect(feedback.y, integrator.u) annotation (Line(
            points={{-26,35},{-26,24}},
            color={0,0,127}));
        connect(integrator.y, feedback.u2) annotation (Line(
            points={{-26,1},{-26,-8},{-50,-8},{-50,44},{-34,44}},
            color={0,0,127}));
        connect(integrator.y, product.u2) annotation (Line(
            points={{-26,1},{-26,-8},{-6,-8},{-6,-20}},
            color={0,0,127}));
        connect(feedback.u1, spline.y) annotation (Line(
            points={{-26,52},{-26,62}},
            color={0,0,127}));
        connect(u, spline.u) annotation (Line(
            points={{-80,0},{-82,0},{-82,66},{-34,66}},
            color={0,0,127}));
        connect(fraction.y, spline.yBase) annotation (Line(
            points={{-35,86},{-26,86},{-26,68}},
            color={0,0,127}));
        annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SplineLag;

      model SplineLagOrZero "LagSpline if not Failed"
       extends Physiolib.Icons.BaseFactorIcon2;
       Modelica.Blocks.Interfaces.RealInput u
                    annotation (Placement(transformation(extent={{-120,-40},{-80,
                  0}}), iconTransformation(extent={{-120,-40},{-80,0}})));

       parameter Boolean enabled=true "disabled => y=yBase";

       parameter Physiolib.Types.Time HalfTime(displayUnit="d");
       parameter Real[:,3] data;

       parameter String stateName=getInstanceName()
          "Name in Utilities input/output function"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

       parameter Real Xscale = 1 "conversion scale to SI unit of x values";

        Interpolation.Curve
                     curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3],
          Xscale=Xscale)
          annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
        Modelica.Blocks.Math.Product product annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-50})));
        Blocks.Math.Integrator integrator(
          y_start=1,
          k=(Modelica.Math.log(2)/HalfTime),
          stateName=stateName) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,-6})));
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,26})));
        Modelica.Blocks.Logical.Switch switch1
          annotation (Placement(transformation(extent={{-48,40},{-28,60}})));
        Modelica.Blocks.Sources.Constant      Constant1(k=0)
          annotation (Placement(transformation(extent={{-70,52},{-58,64}})));
        Modelica.Blocks.Interfaces.BooleanInput
                                              Failed
                            annotation (Placement(transformation(extent={{-120,20},{-80,
                  60}})));
         Physiolib.Types.Fraction effect;
        Modelica.Blocks.Logical.Switch switch2
          annotation (Placement(transformation(extent={{-24,90},{-4,70}})));
        Physiolib.Types.Constants.OneConst One
          annotation (Placement(transformation(extent={{-60,78},{-40,98}})));
        Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=enabled)
          annotation (Placement(transformation(extent={{-96,62},{-76,82}})));
      equation
        effect = integrator.y;
        connect(curve.u, u) annotation (Line(
            points={{-76,0},{-88,0},{-88,-20},{-100,-20}},
            color={0,0,127}));
        connect(yBase, product.u1) annotation (Line(
            points={{0,60},{0,31},{0,-38},{6,-38}},
            color={0,0,127}));
        connect(product.y, y) annotation (Line(
            points={{-2.02067e-015,-61},{-2.02067e-015,-55.5},{0,-55.5},{0,-60}},
            color={0,0,127}));
        connect(feedback.y, integrator.u) annotation (Line(
            points={{-14,17},{-14,6}},
            color={0,0,127}));
        connect(integrator.y, feedback.u2) annotation (Line(
            points={{-14,-17},{-14,-26},{-38,-26},{-38,26},{-22,26}},
            color={0,0,127}));
        connect(integrator.y, product.u2) annotation (Line(
            points={{-14,-17},{-14,-26},{-6,-26},{-6,-38}},
            color={0,0,127}));
        connect(curve.val, switch1.u3) annotation (Line(
            points={{-56,0},{-54,0},{-54,42},{-50,42}},
            color={0,0,127}));
        connect(Constant1.y, switch1.u1) annotation (Line(
            points={{-57.4,58},{-50,58}},
            color={0,0,127}));
        connect(switch1.u2, Failed) annotation (Line(
            points={{-50,50},{-58,50},{-58,38},{-80,38},{-80,40},{-100,40}},
            color={255,0,255}));
        connect(switch2.y, feedback.u1) annotation (Line(
            points={{-3,80},{0,80},{0,64},{-14,64},{-14,34}},
            color={0,0,127}));
        connect(booleanConstant.y, switch2.u2) annotation (Line(
            points={{-75,72},{-38,72},{-38,80},{-26,80}},
            color={255,0,255}));
        connect(switch2.u1, switch1.y) annotation (Line(
            points={{-26,72},{-34,72},{-34,66},{-22,66},{-22,50},{-27,50}},
            color={0,0,127}));
        connect(One.y, switch2.u3) annotation (Line(
            points={{-37.5,88},{-26,88}},
            color={0,0,127}));
        annotation (        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SplineLagOrZero;
    end Factors;
    annotation (Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>"));
  end Blocks;

  package Media
    package Substance "Definitions of substances"
        extends Modelica.Icons.Package;

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Silver_solid(
        MolarWeight=0.1078682,
        z=0,
        DfH_25degC=0,
        DfG_25degC_1bar=0,
        Cp=25.4,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html, http://www.update.uu.se/~jolkkonen/pdf/CRC_TD.pdf"})
        "Ag(s)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Silver_aqueous(
        MolarWeight=0.1078682,
        z=1,
        DfH_25degC=105900,
        DfG_25degC_1bar=77100,
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf"})
        "Ag+(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        SilverChloride_solid(
        MolarWeight=0.14332,
        z=0,
        DfH_25degC=-127030,
        DfG_25degC_1bar=-109720,
        Cp=50.8,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "AgCl(s)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Calcium_aqueous(
        MolarWeight=0.0401,
        z=2,
        DfH_25degC=-542960,
        DfG_25degC_1bar=-542960 - 298.15*(33.67),
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf"})
        "Ca++(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Chloride_aqueous(
        MolarWeight=0.03545,
        z=-1,
        DfH_25degC=-167460,
        DfG_25degC_1bar=-131170,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "Cl-(aq)";

      constant Physiolib.Chemical.Interfaces.IdealGas.SubstanceData
        CarbonMonoxide_gas(
        MolarWeight=0.02801,
        DfH_25degC=-110500,
        DfG_25degC_1bar=-137300,
        Cp=29.13,
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf, http://www.engineeringtoolbox.com/carbon-monoxide-d_975.html"})
        "CO(g)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        CarbonMonoxide_aqueous(
        MolarWeight=0.02801,
        DfH_25degC=-276900,
        DfG_25degC_1bar=-110200,
        References={"Calculated from gas phase using Henry's coefficient from http://webbook.nist.gov/cgi/cbook.cgi?ID=C630080&Mask=10"})
        "CO(aq*)";
        //  DfG_25degC_1bar = -8.314*298.15*log(0.00099/55.508)  +  -137300

      constant Physiolib.Chemical.Interfaces.IdealGas.SubstanceData
        CarbonDioxide_gas(
        MolarWeight=0.044,
        DfH_25degC=-393500,
        DfG_25degC_1bar=-394400,
        Cp=37.1,
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf"})
        "CO2(g)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        CarbonDioxide_aqueous(
        MolarWeight=0.044,
        DfH_25degC=-412900,
        DfG_25degC_1bar=-386200,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "CO2(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Carbonate_aqueous(
        MolarWeight=0.06001,
        z=-2,
        DfH_25degC=-676300,
        DfG_25degC_1bar=-676300 - 298.15*(-497.065),
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "CO3--(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Electrone_solid(
        MolarWeight=5.4857990946e-7,
        z=-1,
        DfH_25degC=0,
        DfG_25degC_1bar=0,
        Cp=0,
        References={"http://physics.nist.gov/cgi-bin/cuu/Value?mme, To solve standard electo-chemical cell potentials"})
        "e-(s)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Iron2_aqueous(
        MolarWeight=0.05585,
        z=2,
        DfH_25degC=-87860,
        DfG_25degC_1bar=-87860 - 298.15*(-9.93),
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf"})
        "Fe++(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Iron3_aqueous(
        MolarWeight=0.05585,
        z=3,
        DfH_25degC=-47700,
        DfG_25degC_1bar=-47700 - 298.15*(-124.77),
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf"})
        "Fe+++(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Glucose_solid(
        MolarWeight=0.1806,
        DfH_25degC=-1274500,
        DfG_25degC_1bar=-1274500 - 298.15*(-1220.66),
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf"})
        "Glu(s)";

      constant Physiolib.Chemical.Interfaces.IdealGas.SubstanceData Hydrogen_gas(
        MolarWeight=0.00201588,
        z=0,
        DfH_25degC=0,
        DfG_25degC_1bar=0,
        Cp=28.8,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "H2(g)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        CarbonicAcid_aqueous(
        MolarWeight=0.062027,
        DfH_25degC=-699700,
        DfG_25degC_1bar=-699700 - 298.15*(-256.582),
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "H2CO3(aq)";

      constant Physiolib.Chemical.Interfaces.IdealGas.SubstanceData Water_gas(
        MolarWeight=0.018015,
        DfH_25degC=-241830,
        DfG_25degC_1bar=-228590,
        Cp=33.6,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "H2O(g)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Water_liquid(
        MolarWeight=0.018015,
        DfH_25degC=-285830,
        DfG_25degC_1bar=-237190,
        Cp=75.3,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "H2O(l)";
     //   Cv=74.539,

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Water_IceIh(
        MolarWeight=0.018015,
        DfH_25degC=-292639,
        DfG_25degC_1bar=-236590,
        Cp=37.77,
        References={"http://www1.lsbu.ac.uk/water/water_properties.html#pot"})
        "H2O(s) - Ice I h";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        DihydrogenPhosphate_aqueous(
        MolarWeight=0.095,
        z=-1,
        DfH_25degC=-1302480,
        DfG_25degC_1bar=-1302480 - 298.15*(-561.395),
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf"})
        "H2PO4-(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Hydronium_aqueous(
        MolarWeight=0.019022,
        z=1,
        DfH_25degC=-285840,
        DfG_25degC_1bar=-285840 - 298.15*(-163.17),
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "H3O+(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        PhosphoricAcid_aqueous(
        MolarWeight=0.095,
        DfH_25degC=-1288000,
        DfG_25degC_1bar=-1288000 - 298.15*(-496.4),
        References={"https://en.wikipedia.org/wiki/Phosphoric_acid, https://www.researchgate.net/publication/6600409_Standard_thermodynamic_properties_of_H3PO4%28aq%29_over_a_wide_range_of_temperatures_and_pressures"})
        "H3PO4(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Proton_aqueous(
        MolarWeight=0.001007,
        z=1,
        DfH_25degC=0,
        DfG_25degC_1bar=0,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "H+(aq)";
                 // as hypothetical HA <-> H+ + A- simplification of H2O + HA <-> H3O+ + A-";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Bicarbonate_aqueous(
        MolarWeight=0.06102,
        z=-1,
        DfH_25degC=-691100,
        DfG_25degC_1bar=-691100 - 298.15*(-348.82),
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "HCO3-(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Bicarbonate_blood(
        MolarWeight=0.06102,
        z=-1,
        DfH_25degC=-691100,
        DfG_25degC_1bar=-691100 - 298.15*(-348.82),
        gamma=0.79,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "HCO3-(blood)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        HydrogenPhosphate_aqueous(
        MolarWeight=0.095,
        z=-2,
        DfH_25degC=-1298700,
        DfG_25degC_1bar=-1298700 - 298.15*(-686.232),
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf"})
        "HPO4--(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        HydrogenSulfate_aqueous(
        MolarWeight=0.097,
        z=-1,
        DfH_25degC=-885750,
        DfG_25degC_1bar=-752870,
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf"})
        "HSO4-(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Potassium_aqueous(
        MolarWeight=0.0391,
        z=1,
        DfH_25degC=-251200,
        DfG_25degC_1bar=-251200 - 298.15*(103.97),
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "K+(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Magnesium_aqueous(
        MolarWeight=0.0243,
        z=2,
        DfH_25degC=-461960,
        DfG_25degC_1bar=-461960 - 298.15*(-19.99),
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf, http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "Mg++(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Sodium_aqueous(
        MolarWeight=0.02299,
        z=1,
        DfH_25degC=-239660,
        DfG_25degC_1bar=-239660 - 298.15*(74.49),
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "Na+(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Amonium_aqueous(
        MolarWeight=0.01804,
        z=1,
        DfH_25degC=-132800,
        DfG_25degC_1bar=-132800 - 298.15*(-178.77),
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf"})
        "NH4+(aq)";

      constant Physiolib.Chemical.Interfaces.IdealGas.SubstanceData Oxygen_gas(
        MolarWeight=0.032,
        DfH_25degC=0,
        DfG_25degC_1bar=0,
        Cp=29.4,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "O2(g)";

      constant Physiolib.Chemical.Interfaces.IdealGasShomate.SubstanceData
        Oxygen_gas_Shomate_298_6000(
        MolarWeight=0.032,
        DfH_25degC=0,
        DfG_25degC_1bar=0,
        cp_25degC=29.4,
        B=6.137261,
        C=-1.186521,
        D=0.09578,
        E=-0.219663,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html","http://old.vscht.cz/fch/cz/pomucky/fchab/C.html"})
        "O2(g) Shomate 298K–6000K";

      constant Physiolib.Chemical.Interfaces.IdealGasShomate.SubstanceData
        Oxygen_gas_Shomate_200_5000(
        MolarWeight=0.032,
        DfH_25degC=0,
        DfG_25degC_1bar=0,
        cp_25degC=29.4,
        B=-21.55543,
        C=2.456517,
        D=-0.16151,
        E=0.175056,
        X=44.837013,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html","http://old.vscht.cz/fch/cz/pomucky/fchab/C.html"})
        "O2(g) Shomate 200K–5000K";
        //A=8.99044,

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Oxygen_aqueous(
        MolarWeight=0.032,
        DfH_25degC=-11700,
        DfG_25degC_1bar=16320,
        References={"http://webserver.dmt.upm.es/~isidoro/dat1/Heat%20of%20solution%20data.pdf, https://books.google.cz/books?id=dr-VBAAAQBAJ&pg=PA156&lpg=PA156&dq=Gibbs+energy+of+formation++%22O2(aq)%22&source=bl&ots=09N5CxY7OD&sig=hbsTXQvX59vXBqHUjFVVIZQpHCA&hl=cs&sa=X&ei=sDQtVaeUMMaRsAHpzYHgAg&redir_esc=y#v=onepage&q=Gibbs%20energy%20of%20formation%20%20%22O2(aq)%22&f=false"})
        "O2(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Hydroxide_aqueous(
        MolarWeight=0.017006,
        z=-1,
        DfH_25degC=-229940,
        DfG_25degC_1bar=-157300,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html"})
        "OH-(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Lead_solid(
        MolarWeight=0.2072,
        z=0,
        DfH_25degC=0,
        DfG_25degC_1bar=0,
        Cp=26.4,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html, http://www.update.uu.se/~jolkkonen/pdf/CRC_TD.pdf"})
        "Pb(s)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        LeadDioxide_solid(
        MolarWeight=0.2391988,
        z=0,
        DfH_25degC=-276600,
        DfG_25degC_1bar=-219000,
        Cp=64.6,
        References={"http://www.vias.org/genchem/standard_enthalpies_table.html, http://www.update.uu.se/~jolkkonen/pdf/CRC_TD.pdf"})
        "PbO2(s)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        LeadSulfate_solid(
        MolarWeight=0.30326,
        z=0,
        DfH_25degC=-918400,
        DfG_25degC_1bar=-811200,
        Cp=103.2,
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf, http://www.update.uu.se/~jolkkonen/pdf/CRC_TD.pdf"})
        "PbSO4(s)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Phosphate_aqueous(
        MolarWeight=0.095,
        z=-3,
        DfH_25degC=-1284070,
        DfG_25degC_1bar=-1284070 - 298.15*(-866.946),
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf"})
        "PO4---(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Sulphates_aqueous(
        MolarWeight=0.09607,
        z=-2,
        DfH_25degC=-907500,
        DfG_25degC_1bar=-907500 - 298.15*(-555.123),
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf"})
        "SO4--(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Ethanol_liquid(
        MolarWeight=0.04607,
        z=0,
        DfH_25degC=-276980,
        DfG_25degC_1bar=-174180,
        Cp=112.4,
        density=789,
        References={"http://www.mhhe.com/physsci/chemistry/chang7/ssg/graphics/chang7/pdf/cng7pa08.pdf, https://en.wikipedia.org/wiki/Ethanol_(data_page)"})
        "Ethanol C2H5OH(l)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData Urea_aqueous(
        MolarWeight=0.06006,
        z=0,
        DfH_25degC=-333189,
        DfG_25degC_1bar=-197150,
        References={"https://en.wikipedia.org/wiki/Urea"}) "Urea(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Albumin_aqueous(
        MolarWeight=66.5,
        z=-11.4,
        DfH_25degC=0,
        DfG_25degC_1bar=0,
        References={"https://en.wikipedia.org/wiki/Human_serum_albumin"})
        "Alb(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        Globulins_aqueous(
        MolarWeight=66.5,
        z=-4,
        DfH_25degC=0,
        DfG_25degC_1bar=0,
        References={"https://en.wikipedia.org/wiki/Urea"}) "Glb(aq)";

      constant Physiolib.Chemical.Interfaces.Incompressible.SubstanceData
        OtherUnchargedUnpermeable_aqueous(
        MolarWeight=66.5,
        z=0,
        DfH_25degC=0,
        DfG_25degC_1bar=0,
        References={"https://en.wikipedia.org/wiki/Urea"}) "Others(aq)";

        //Some organic molecules: https://www.e-education.psu.edu/drupal6/files/be497b/pdf/Bioenergetics_AppA.pdf
        //Other source: http://www.update.uu.se/~jolkkonen/pdf/CRC_TD.pdf
      model OxygenGasOnTemperature
        Real cp1,cp2;
        Real H1,H2;
        Real S1,S2;
        Real T;
      equation
        T=200+time;
        cp1 = Physiolib.Chemical.Interfaces.IdealGasShomate.molarHeatCapacityCp(
          Physiolib.Media.Substance.Oxygen_gas_Shomate_298_6000, T);
        cp2 = Physiolib.Chemical.Interfaces.IdealGasShomate.molarHeatCapacityCp(
          Physiolib.Media.Substance.Oxygen_gas_Shomate_200_5000, T);
        H1 =
          Physiolib.Chemical.Interfaces.IdealGasShomate.molarEnthalpyElectroneutral(
           Physiolib.Media.Substance.Oxygen_gas_Shomate_298_6000, T);
        H2 =
          Physiolib.Chemical.Interfaces.IdealGasShomate.molarEnthalpyElectroneutral(
           Physiolib.Media.Substance.Oxygen_gas_Shomate_200_5000, T);
        S1 = Physiolib.Chemical.Interfaces.IdealGasShomate.molarEntropyPure(
          Physiolib.Media.Substance.Oxygen_gas_Shomate_298_6000, T);
        S2 = Physiolib.Chemical.Interfaces.IdealGasShomate.molarEntropyPure(
          Physiolib.Media.Substance.Oxygen_gas_Shomate_200_5000, T);
      end OxygenGasOnTemperature;
    end Substance;

    package BaseMedium_C
      extends Modelica.Media.Water.StandardWater(
         extraPropertiesNames={"H2O","Na","Bic","K","Glu","Urea","Cl","Ca","Mg","Alb","Glb","Others"},
         singleState=true, T_default=310.15, X_default=zeros(nXi));

      constant Real C_default[nC]={51523,135,24,5,5,3,105,1.5,0.5,0.7,0.8,1e-6};

      replaceable package stateOfMatter =
                              Chemical.Interfaces.Incompressible constrainedby
        Chemical.Interfaces.StateOfMatter
      "Substance model to translate data into substance properties"
         annotation (choicesAllMatching = true);
      // Provide medium constants here
      type Substances = enumeration(
          H2O  "Water",
          Na   "Sodium",
          Bic  "Bicarbonate",
          K    "Potassium",
          Glu  "Glucose",
          Urea "Urea",
          Cl   "Chloride",
          Ca   "Calcium",
          Mg   "Magnesium",
          Alb  "Albumin",
          Glb  "Globulins",
          Others  "Unknown uncharged non-permeble substances");
      constant stateOfMatter.SubstanceData substanceData[nC] = {
        Physiolib.Media.Substance.Water_liquid,
        Physiolib.Media.Substance.Sodium_aqueous,
        Physiolib.Media.Substance.Bicarbonate_blood,
        Physiolib.Media.Substance.Potassium_aqueous,
        Physiolib.Media.Substance.Glucose_solid,
        Physiolib.Media.Substance.Urea_aqueous,
        Physiolib.Media.Substance.Chloride_aqueous,
        Physiolib.Media.Substance.Calcium_aqueous,
        Physiolib.Media.Substance.Magnesium_aqueous,
        Physiolib.Media.Substance.Albumin_aqueous,
        Physiolib.Media.Substance.Globulins_aqueous,
        Physiolib.Media.Substance.OtherUnchargedUnpermeable_aqueous}
      "Definition of the substances"
         annotation (choicesAllMatching = true);

       //constant Physiolib.Types.Density constDensity = 1024 "Constant density of fluid";
    end BaseMedium_C;
  end Media;
  annotation (
preferredView="info",
version="1.0.0",
versionBuild=1,
versionDate="2017-10-21",
dateModified = "2017-10-21 17:14:41Z",
uses(Modelica(version="3.2.2"),
  Documentation(revisions="<html>
<p>Copyright (c) 2017, Marek Matej&aacute;k </p>
<p>All rights reserved. </p>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>", info="<html>
<p>During each electro-chemical process an <a href=\"modelica://Physiolib.Components.Substance\">electro-chemical potential</a> of the substances is equilibrating and all thermodynamical properties of the homogenous chemical solutions are evaluated. </p>
<p>Processes: chemical reactions, gas dissolution, diffusion, membrane transports, osmotic fluxes, electrochemical cells, electrodes, ..</p>
<p>Please see the <a href=\"modelica://Physiolib.UsersGuide.Overview\">overview</a>.</p>
</html>"),
      Physiolib(version="2.3.2-beta"),
      Physiolib(version="2.3.2-beta")));
end Physiolib;
