#!/bin/bash

#functionName="addModule"
teamName=$1
addModuleInTeam1() {
         teamName=$1
         ecrName=$2
echo "
         
module "${teamName}_ecr_${ecrName}" {
  source          = "OT-CLOUD-KIT/ec2-instance/aws"
  version         = "0.0.3"
  ecrName  = ${ecrName}
}" >> "${teamName}.tf"
         echo "Hi team, You team name is ${teamName}, and we have to create ${ecrName} ecr."
}

addModuleInTeam2() {
         teamName=$1
         ecrName=$2
         echo "
         
module "${teamName}_ecr_${ecrName}" {
  source          = "OT-CLOUD-KIT/ec2-instance/aws"
  version         = "0.0.3"
  ecrName  = ${ecrName}
}" >> "${teamName}.tf"
         echo "Hi team, You team name is ${teamName}, and we have to create ${ecrName} ecr."
}

if [[ ${teamName} == "team1" ]] 
then
    teamName=$1
    ecrName=$2
  addModuleInTeam1 ${teamName} ${ecrName}
elif
    [[ ${teamName} == "team2" ]] 
then
    teamName=$1
    ecrName=$2
  addModuleInTeam2 ${teamName} ${ecrName}
  else
   echo "Provide correct team name"
fi