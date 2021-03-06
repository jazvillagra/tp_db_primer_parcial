-- CREATE DATABASE
CREATE TABLESPACE BASEDATOS2
LOGGING
DATAFILE '/opt/oracle/oradata/BASEDATOS2.dbf'
SIZE 40M REUSE
AUTOEXTEND ON NEXT 650 K MAXSIZE 80M;
/*
DESCOMENTAR ANTES DE ENTREGAR EL TRABAJO PRACTICO A LA PROFE
--create database in windows
CREATE TABLESPACE BASEDATOS2
LOGGING
DATAFILE 'C:\oraclexe\app\oracle\oradata\BASEDATOS2.dbf'
SIZE 40M REUSE
AUTOEXTEND ON NEXT 650 K MAXSIZE 80M;
*/
--create user BASEDATOS with password BASEDATOS
CREATE USER BASEDATOS2 IDENTIFIED BY BASEDATOS2 DEFAULT TABLESPACE BASEDATOS TEMPORARY TABLESPACE TEMP;  
GRANT DBA TO BASEDATOS2 WITH ADMIN OPTION;
GRANT CREATE SESSION TO BASEDATOS2;
--alter session if necessary
ALTER SESSION set "_ORACLE_SCRIPT"=true;

-- 3)

