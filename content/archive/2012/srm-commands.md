+++
author = "GaryJBlake"
title = "Running Commands with SRM 5.x "
date = "2012-07-03"
description = "Running Commands with SRM 5.x "
tags = [
    "SRM"
]
categories = [
    "Site Recovery Manager"
]
series = [

]
+++


Over the last few months I’ve had the opportunity to develop various commands to be run within Site Recovery Manager (SRM) recovery plans, during this time I’ve uncovered some interesting results and gotcha’s.

## Command generated Errors

If you look around there at various blog posts and community pages which provide an insight to running commands on the SRM Server, most of these suggest using a batch (.bat) or command (.cmd) file to call the script or run the command that you desire.

The problem with this approach is that the error state reported within the SRM recovery plan relates only to the success of failure of calling the batch or command file provided within the recovery plan.

For example, the following command, will call a file called ***callout.cmd*** located in the ***c:\srm-scripts folder***, if this file exists and can be called a ***0*** is returned to SRM and the step gets a ***Success*** status, if SRM is not able to call the file a ***1*** is returned and the SRM step gets a ***Warning*** status.

```
c:\windows\system32\cmd.exe /c c:\srm-scripts\callout.cmd
```

## Calling PowerShell

If you have ever used SRM you will know that currently (5.0 or earlier) SRM is still a 32-bit application even though it can run within a 64-bit operating system. 

Most of you will realize this when you setup the environment as it requires a 32-bit ODBC system DSN to connect to database. Well this run’s true when calling PowerShell, in order to call PowerShell you must use the following syntax otherwise nothing will happen.

```
C:\Windows\SysWOW64\WindowsPowerShell\v1.0\Powershell.exe
```

## Single Quotes v Double Quotes

When running commands that have switches where you provide a value I’ve had different levels of success depending on the contents of the value being passed to the command. If you’re a programmer (which I’m not) you will know single quotes tell the command not to interpret anything inside the quotation marks whereas double quotes can be used to interpret the variables contained within.

Using double quotes created unusual behavior on some of our PowerShell commands recently for values that contained a space and passwords with strange characters. I’ve not been able to find any SRM documentation that provides guidance on this but would suggest always using single quotes.

## Calling Linux Scripts

Traditionally my clients have been 100% Windows shops, and when looking for guidance on SRM and calling scripts on Linux machines there is a distinct lack of discussions or information available. On a recent engagement this is exactly what I needed to do, but thanks to my colleague and SRM guru Lee Dilworth the answer is very simply use the following syntax:

```
/bin/sh /srm-scripts/callout.sh
```