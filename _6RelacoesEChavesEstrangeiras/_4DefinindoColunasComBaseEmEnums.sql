CREATE TYPE geral.STATUS_NFE AS ENUM 
(
	'EMITIDA',
	'RECEBIDA',
	'ERRO'
);

ALTER TABLE NFE_NOTAS_FISCAIS
ADD COLUMN NFE_STATUS geral.STATUS_NFE DEFAULT 'EMITIDA';
