# Code Generator

 The Code Generator tool is used to create project code for both the front end and back end based on database details. 

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

## Input Command Options


| Short option | Full Option | Mandatory / Default Value | Description |
| ------------ | ----------- | ----------- |----------- |
|   -h         | --help    | -    |Print the Help message |
|   -f         | --framwork   | Yes / -     |Specify the Framework (Spring/React) |
|   -b       | --build | No / Gradle for Spring and Vite for React |Build tool option |
|   -m       | --mode | No / Minimal |Code Generation mode (Minimal / Full / Extended) |
|   -n       | --project | Yes / - | Specify the project name |
|   -g       | --package | Yes (for spring) / - | Specify the package name |
|   -o       | --output | No / Current Path | Specify the Output Path |
|   -d       | --database | Yes / - | Database Type (MariaDB / MySQL / Oracle) |
|   -t       | --host | Yes / - | Specify the Host name |
|   -p       | --port | Yes / - | Specify the port number |
|   -u       | --username | Yes / - | Specify the Database user name |
|   -c      | --password | Yes / - | Specify the Database password |
|   -s      | --schemas | Yes / - | Specify the List of schemas name. (separated by , ) |

## Framework 

 The code generator tool creates the backend project using the Spring framework and the frontend project using the React framework.

 ## Build Tool

### _Spring Framework_
Uses Gradle as the primary build tool and supports Maven in future.

### _React Framework_
Uses Vite as the current build tool and supports Rollup in future. 

## Mode
The tool operates in 3 different modes

* Minimal
* Full
* Extended

### _Minimal Mode:_
Creates Grid and Form pages along with their corresponding APIs.

### _Full Mode:_
Includes everything from Minimal Mode and adds:

* Login Page and related APIs
* User management Query and Initial Data.

### _Extended Mode:_
Encompasses everything from Full Mode and further includes:

* ACL (Access Control List) management
* Creating queries and initial data.

## Example Command

For windows,

    > codeGen.bat -f react -b vite -m extended  -n sample -g com.palmyralabs  -d mariadb -t localhost -p 3306 -u user -c pass -s sample -o /home/project

For Linux,

    > sh codeGen -f react -b vite -m extended  -n sample -g com.palmyralabs  -d mariadb -t localhost -p 3306 -u user -c pass -s sample -o /home/project

