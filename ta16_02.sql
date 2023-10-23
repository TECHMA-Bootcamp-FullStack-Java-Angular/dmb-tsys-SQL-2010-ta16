/********************************
 TA16 - EJERCICIO 2 
 *********************************/

-- 2.1. Obtener los apellidos de los empleados.

SELECT APELLIDOS FROM empleados;

-- 2.2. Obtener los apellidos de los empleados sin repeticiones

SELECT DISTINCT APELLIDOS FROM empleados;

-- 2.3. Obtener todos los datos de los empleados que se apellidan 'Smitir'

SELECT * FROM empleados WHERE APELLIDOS = 'Smith';

-- 2.4. Obtener todos los datos de los empleados que se apellidan 'Smith' y los que se apellidan 'Rogers'

SELECT * FROM empleados WHERE APELLIDOS IN('Smith', 'Rogers');

-- 2.5. Obtener todos los datos de los empleados que trabajan para el departamento 14

SELECT * FROM empleados WHERE DEPARTAMENTO = 14;

-- 2.6. Obtener todos los datos de los empleados que trabajan para el departamento 37 y para el departamento 77

SELECT * FROM empleados WHERE DEPARTAMENTO IN(37, 77);

-- 2.7. Obtener todos los datos de los empleados cuyo apellido comience por 'P'.

SELECT * FROM empleados WHERE APELLIDOS like 'P%';

-- 2.8. Obtener el presupuesto total de todos los departamentos.

SELECT SUM(PRESUPUESTO) FROM departamentos;

-- 2.9. Obtener el numero de empleados en cada departamento.

SELECT d.NOMBRE, count(e.DNI)
FROM departamentos AS d
    INNER JOIN empleados AS e ON d.CODIGO = e.DEPARTAMENTO
group by d.NOMBRE;

-- 2.10. Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.

SELECT d.*, e.*
FROM departamentos AS d
    INNER JOIN empleados AS e ON d.CODIGO = e.DEPARTAMENTO;

-- 2.11. Obtener un listado completo de empleados, INcluyendo el nombre y apellidos del empleado junto el nombre y presupuesto de su departamento.

SELECT
    e.NOMBRE,
    e.APELLIDOS,
    d.NOMBRE,
    d.PRESUPUESTO
FROM empleados AS e
    INNER JOIN departamentos AS d ON d.CODIGO = e.DEPARTAMENTO;

-- 2.12. Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60.000€.

SELECT
    e.NOMBRE,
    e.APELLIDOS,
    d.PRESUPUESTO
FROM empleados AS e
    INNER JOIN departamentos AS d ON d.CODIGO = e.DEPARTAMENTO
WHERE d.PRESUPUESTO > 60000;

-- 2.13. Obtener los datos de los departamentos cuyo presupuesto es superior el presupuesto medio de todos los departamentos.

SELECT *
FROM departamentos
WHERE PRESUPUESTO > (
        SELECT AVG(PRESUPUESTO)
        FROM departamentos
    );

-- 2.14. Obtener los nombres (únicamente los nombres) de los departamentos que tienen más de dos empleados.

SELECT NOMBRE
FROM departamentos
WHERE 2 < (
        SELECT count(DNI)
        FROM empleados
        WHERE DEPARTAMENTO = CODIGO
    );

-- 2.15. Añadir un nuevo departamento: 'Calidad', con presupuesto de 40.000 € y código 11. Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI: 89267109

INSERT INTO
    departamentos (CODIGO, NOMBRE, PRESUPUESTO)
values (11, 'Calidad', 40000);

INSERT INTO
    empleados (
        DNI,
        NOMBRE,
        APELLIDOS,
        DEPARTAMENTO
    )
values (
        '89267109',
        'Esther',
        'Vázquez',
        11
    );

-- 2.16. Aplicar un recorte presupuestario del 10% a todos los departamentos.

UPDATE departamentos
SET
    PRESUPUESTO = PRESUPUESTO * 0.9
WHERE CODIGO > 0;

-- 2.17. Reasignar a los empleados del departamento de INvestigación (código 77) al departamento de informática (código 14).

UPDATE empleados SET DEPARTAMENTO = 14 WHERE DEPARTAMENTO=77;

-- 2.18. Despedir a todos los empleados que trabajan para el departamento de informática (código 14).

DELETE FROM empleados WHERE DEPARTAMENTO = 14;

-- 2.19. Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000€.

DELETE FROM empleados
WHERE DEPARTAMENTO IN (
        SELECT CODIGO
        FROM departamentos
        WHERE PRESUPUESTO > 60000
    );

-- 2.20. Despedir a todos los empleados.

DELETE FROM empleados WHERE DEPARTAMENTO > 0;