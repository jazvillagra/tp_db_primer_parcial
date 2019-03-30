CREATE MATERIALIZED VIEW V_SOCIOS	
BUILD IMMEDIATE
REFRESH START WITH (SYSDATE) NEXT (TRUNC(SYSDATE)+1) + 22/24
AS
SELECT 
	S.ID_SOCIO,
	S.CEDULA,
	S.NOMBRE || ' ' || S.APELLIDO "NOMBRE Y APELLIDO",
	SUM(DISTINCT CA.SALDO_DISPONIBLE) DISPONIBLE,
	SUM(CASE CP.ESTADO WHEN 'A' THEN DISTINCT CC.MONTO_CUOTA ELSE 0 end) DEUDA,
	SUM(CASE SC.TIPO_OBLIGACION WHEN 'A' THEN SC.TOTAL_A_ABONAR ELSE 0 end) APORTE
	FROM SOC_SOCIO S JOIN AHO_CUENTA_AHORRO CA ON S.ID_SOCIO = CA.ID_SOCIO
	JOIN CRE_SOLICITUD_PRESTAMOS CSP ON S.ID_SOCIO = CSP.SOCIO_DEUDOR
	JOIN CRE_PRESTAMOS CP ON CSP.ID_SOL_CRED = CP.ID_SOL_CRED
	JOIN CRE_CUOTAS CC ON CP.NRO_PRESTAMO = CC.NRO_PRESTAMO
	JOIN SOC_OBLIGACIONES SC ON SC.ID_SOCIO = S.ID_SOCIO
	GROUP BY  S.ID_SOCIO,
	S.CEDULA,
	S.NOMBRE || ' ' || S.APELLIDO;