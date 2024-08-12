SELECT w.id,w.idempresa,
w.`name`,
w.address,
u.usuario_nombre,
w.remarks,
w.usuario_id,
w.`status`,
w.created_at,
w.updated_at
 FROM warehouse w
 INNER JOIN usuario u ON w.usuario_id = u.usuario_id
 WHERE w.idempresa = 1