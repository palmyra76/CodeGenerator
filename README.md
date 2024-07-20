# Code Generator

 The Code Generator tool is used to create project code for both the front end and back end based on database details. 

## Input Command Options


| Short option | Full Option | Mandatory / Default Value | Description |
| ------------ | ----------- | ----------- |----------- |
|   -h         | --help    | -    |Print the Help message |
|   -f         | --framwork   | Yes / -     |Specify the Framework (Spring/React) |
|   -b       | --build | No / Gradle for Spring and Vite for React |Build tool option |
|   -m       | --mode | No / Full |Code Generation mode (Minimal / Full / Extended) |
|   -n       | --project | Yes / - | Specify the project name |
|   -g       | --package | Yes (for spring) / - | Specify the package name |
|   -o       | --output | No / Current Path | Specify the Output Path |
|   -d       | --database | Yes / - | Database Type (MariaDB / MySQL / Oracle) |
|   -t       | --host | Yes / - | Specify the Host name |
|   -p       | --port | Yes / - | Specify the port number |
|   -u       | --username | Yes / - | Specify the Database user name |
|   -c      | --password | Yes / - | Specify the Database password |
|   -s      | --schemas | Yes / - | Specify the List of schemas name. (separated by , ) |


## Download CodeGenerator
You can download or clone Code Generator from GitHub:

    https://github.com/palmyra76/CodeGenerator

## Install Dist

Open terminal in the path **_CodeGenerator/source_** and run the following command:

    > gradle installDist

## Run Command

After installation, open terminal in the path **_CodeGenerator/source/dist/bin/_** 

For windows,

    > codeGen.bat

For Linux,

    > sh codeGen

## Example Command

For windows,

    > codeGen.bat -f react -b vite -m extended  -n sample -g com.palmyralabs  -d mariadb -t localhost -p 3306 -u user -c pass -s sample -o /home/project

For Linux,

    > sh codeGen -f react -b vite -m extended  -n sample -g com.palmyralabs  -d mariadb -t localhost -p 3306 -u user -c pass -s sample -o /home/project

