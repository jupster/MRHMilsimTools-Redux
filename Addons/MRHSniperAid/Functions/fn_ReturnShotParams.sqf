//[] execVM fn_ReturnShotParams.sqf
params ["_PassedFromEH"];
[_passedFromEH] spawn {
params ["_PassedFromEH"];
////get intel from EH
_ammoIntel = _passedFromEH select 6;
_isDirectShot = _passedFromEH select 9;
_ammoDamage = _ammoIntel select 0;

_target = _passedFromEH select 0;
_speed = speed _target;
_speed = [_speed,2] call BIS_fnc_cutDecimals; 
_shooter = _PassedFromEH select 1;
if (_shooter != player) ExitWith {};
////////////
_EHindexes = player getVariable "MRH_BulletCamEHsIndexes";
if ((isNil "_EHindexes") or (_EHindexes isEqualTo [])) ExitWith {};
//////////////
_bullet = _passedFromEH select 2; //not necessary since bullets can't have variables attached to them :-(
_positionHit = _passedFromEH select 3;
_ReceivedDamage = 0;
if (_target isKindOf "Man") then {_ReceivedDamage = _target getVariable "MRH_TargetReceivedDamage";};
_bulletVelocity = _passedFromEH select 4;
_impactSpeed = vectorMagnitude _bulletVelocity;
_impactSpeed = [_impactSpeed,2] call BIS_fnc_cutDecimals;
_hitSelections = _PassedFromEH select 5;
//systemchat format ["vitesse : %1", str _impactSpeed];
[_positionHit, _hitSelections, _target] call MRH_fnc_hitZoneIndicator;
///Calculate travel time
_timeShot = _shooter getVariable "MRH_BulletFiredTime";
_bulletTravelTime = time - _timeShot;

///Calculate distance from player
_distance = _target distance _shooter;
_distance = [_distance,0] call BIS_fnc_cutDecimals;


///calculate angle
_targetAlt = (getPosASL _target) select 2;
_shooterAlt = (getPosASL _shooter) select 2;
_elevationDiff = "";
if (_targetAlt <= _shooterAlt) then {_elevationDiff = _shooterAlt - _targetAlt} else {_elevationDiff = _targetAlt - _shooterAlt};
_distance2d = _shooter distance2D _target;
_tan = _elevationDiff / _distance2d;
_angle = atan _tan;
_angle =  [_angle,0] call BIS_fnc_cutDecimals;

//get wind Intel: Direction
_windIntel = "";
_AzimutName = "";
_windDir  = [windDir,0] call BIS_fnc_cutDecimals; 
if (_windDir + 180 >= 360) then {_windDir = _windDir - 180} else { _windDir = _windDir + 180};
if ((windDir > 315 && windDir <= 360) or (windDir >=0 && windDir <= 45)) then {_AzimutName = "Sud"};
if (windDir > 45 && windDir <= 135) then {_AzimutName = "Ouest"};
if (windDir > 135 && windDir <= 255) then {_AzimutName = "Nord"};
if (windDir > 255 && windDir <= 315) then {_AzimutName = "Est"};
//_windDirection = format ["Vent de secteur %2. Azimut exact du vent: %1°", str windDir, _AzimutName];//a paser en structured text
//Get WindIntel : speed
_absoluteSpeed = vectorMagnitude wind;
_absoluteSpeed = [_absoluteSpeed,1] call BIS_fnc_cutDecimals;
//relative windspeed
_relSpeed = call ace_kestrel4500_fnc_measureWindSpeed;
_relSpeed = [_relSpeed,1] call BIS_fnc_cutDecimals;
//_windSpeed = format ["Vitesse absolue du vent:%1 m/s. Vitesse du vent relative à votre position et azimut: %2 m/s. ",str _absoluteSpeed, str _relSpeed];
//atmospheric conditions:
// pressure
_atmosphericP = (getposASL player select 2)call ace_weather_fnc_calculateBarometricPressure;
_atmosphericP = [_atmosphericP,1] call BIS_fnc_cutDecimals;
//temperature
_temperature = (getposASL player select 2) call ace_weather_fnc_calculateTemperatureAtHeight;
_temperature = [_temperature,1] call BIS_fnc_cutDecimals;
_humidity = (missionNameSpace getVariable "ace_weather_currenthumidity") *100;
_humidity = [_humidity,1] call BIS_fnc_cutDecimals;


///shooter and bullet travel timeintel
_shooterName = name _shooter;
//_shooterIntel = format ["Cible touchée par %1", _shooterName];
//_bulletTravelIntel = format ["Temps de trajet de la balle %1 secondes", str _bulletTravelTime];
//_allIntel =_shooterIntel + endl + _bulletTravelIntel + endl + _windDirection + endl + _windSpeed + endl + _targetIntel;
///give colour to all generated intel
////calculate bullet travel speed
_bulletAVGSpeed = _distance / _bulletTravelTime;
////get weapons turret adjustments
private ["_index", "_adjustment", "_height", "_lateral"];
_index = [_shooter, currentWeapon _shooter] call ace_common_fnc_getWeaponIndex;
_adjustment = _shooter getVariable "ace_scopes_adjustment";
if (isNil "_adjustment") then {_adjustment = [[0,0,0],[0,0,0],[0,0,0]];};
_adjustment = _adjustment select _index;
_height = _adjustment select 0;
_lateral = _adjustment select 1;
//systemchat str _adjustment;
////

_shooterName = "<t color = '#d3a913'>" + _shooterName + "</t>";
_bulletTravelTime = "<t color = '#d3a913'>" + str _bulletTravelTime + "</t>";
_bulletAVGSpeed = "<t color = '#d3a913'>" + str _bulletAVGSpeed + "</t>";
_distance = "<t color = '#d3a913'>" + str _distance + "</t>";
_angle = "<t color = '#d3a913'>" + str _angle + "</t>";

_windDir = "<t color = '#d3a913'>" + str _windDir + "</t>";
_AzimutName = "<t color = '#d3a913'>" + _AzimutName + "</t>";
_relSpeed = "<t color = '#d3a913'>" + str _relSpeed + "</t>";
_absoluteSpeed = "<t color = '#d3a913'>" + str _absoluteSpeed + "</t>";
_height = "<t color = '#d3a913'>" + str _height + "</t>";
_lateral = "<t color = '#d3a913'>" + str _lateral + "</t>";
_impactSpeed = "<t color = '#d3a913'>" + str (_impactSpeed*3.6) + "</t>";
_atmosphericP = "<t color = '#d3a913'>" + str _atmosphericP + "</t>";
_temperature = "<t color = '#d3a913'>" + str _temperature + "</t>";
_humidity = "<t color = '#d3a913'>" + str _humidity + "</t>";

_allIntel = 
"Cible touchée par: " + _shooterName + "<br/>" +
"<br/>" +
"La cible se trouvait à:" + " " + _distance + " " + "mètres" + "<br/>" +
"Temps de trajet de la balle: "+ " " + _bulletTravelTime+ " " + "secondes" + "<br/>" +
"Vitesse de déplacement de la balle:"+ " " + _bulletAVGSpeed+ " " + "m/s" + "<br/>" +
"Vitesse de la balle à l'impact: " + " " + _impactSpeed + " " + "km/h" + "<br/>" +
"Angle d'élévation tireur/cible"+ " " + _angle + "°" +"<br/>" + "<br/>" +
"Informations vent:" + "<br/>" +
"Vent de secteur:"+ " " + _AzimutName + "<br/>" +
"Azimut exact du vent:"+ " " + _windDir +"°" + "<br/>" +
"Vitesse du vent relative à votre position et azimut (telles que donnée par le Kestrel):"+ " " + _relSpeed+ " "+ "m/s" + "<br/>" +
"Vitesse du vent:"+ " " + _absoluteSpeed + " " + "m/s" + "<br/>" + "<br/>" +
"Informations atmosphériques :" + "<br/>" +
"Pression barométrique:"+ " " +_atmosphericP + " "+"hPa" + "<br/>" + 
"Humidité" + " " + _humidity + " " + "%" + "<br/>" + 
"Température:"+ " " +_temperature +" " + "°C"+ "<br/>" + "<br/>" +
"Réglages de l'optique:" + "<br/>" +
"Correction hauteur:" + " " + _height + " " + " mils" + "<br/>" +
"Correction latérale" + " " + _lateral + " " + "mils";
if (_target isKindOf "Man") then {
_allIntel = _allIntel + "<br/> Dommages causés: <t color = '#d3a913'>" + " " + str _ReceivedDamage + "</t> points<br/>" +
"Parties touchées:<t color = '#d3a913'>" + " " + str _hitSelections + "</t>";
};
if (_speed > 0) then {_allIntel = _allIntel + "<br/>Cible en mouvement, vitesse de déplacement: <t color = '#d3a913'>"+ " " + str _speed + " " + "</t>Km/h";};
_allIntel = parseText _allIntel;
//_allIntel = composeText [ _allIntel]; 
"Données de tir:" hintC _allIntel;
//systemchat _height;

};
