-- IDs, prices and durations must match the catalog shipped in HomeScreen.kt.
-- Only insert missing records; preserve existing catalog and customer data.
INSERT INTO saloes (nome, descricao)
SELECT 'BeautyHub - catálogo de demonstração', 'Catálogo inicial para testes do aplicativo'
WHERE NOT EXISTS (SELECT 1 FROM saloes WHERE nome = 'BeautyHub - catálogo de demonstração');

INSERT INTO services (id, nome, descricao, duracao_minutos, preco, salao_id)
SELECT catalog.id, catalog.nome, catalog.descricao, catalog.duracao, catalog.preco,
       (SELECT MIN(id) FROM saloes WHERE nome = 'BeautyHub - catálogo de demonstração')
FROM (
 SELECT 25 AS id, 'Hidratação capilar' AS nome, 'Tratamento nutritivo para fios ressecados' AS descricao, 60 AS duracao, 120.00 AS preco
 UNION ALL SELECT 26, 'Manicure', 'Cuidado completo para suas unhas', 45, 60.00
 UNION ALL SELECT 27, 'Limpeza de pele', 'Limpeza profunda e revitalizante', 90, 150.00
 UNION ALL SELECT 28, 'Massagem relaxante', 'Massagem corporal completa', 60, 180.00
 UNION ALL SELECT 29, 'Pedicure', 'Cuidado completo para os pés', 60, 70.00
 UNION ALL SELECT 30, 'Gel nas unhas', 'Unhas em gel duradouras', 90, 150.00
 UNION ALL SELECT 31, 'Nail art', 'Decoração artística nas unhas', 60, 100.00
 UNION ALL SELECT 32, 'Corte de cabelo', 'Corte moderno e personalizado', 45, 80.00
 UNION ALL SELECT 33, 'Coloração', 'Coloração completa com tinta profissional', 120, 200.00
 UNION ALL SELECT 34, 'Escova progressiva', 'Alisamento duradouro', 180, 350.00
 UNION ALL SELECT 35, 'Peeling facial', 'Renovação celular da pele', 60, 180.00
 UNION ALL SELECT 36, 'Drenagem linfática', 'Redução de inchaço e toxinas', 60, 200.00
 UNION ALL SELECT 37, 'Design de sobrancelha', 'Modelagem perfeita das sobrancelhas', 30, 50.00
 UNION ALL SELECT 38, 'Massagem desportiva', 'Alívio de tensões musculares', 60, 200.00
 UNION ALL SELECT 39, 'Massagem pedras quentes', 'Relaxamento profundo com pedras', 90, 250.00
 UNION ALL SELECT 40, 'Reflexologia', 'Massagem nos pés para equilíbrio do corpo', 45, 150.00
 UNION ALL SELECT 41, 'Maquiagem social', 'Make completa para eventos', 60, 150.00
 UNION ALL SELECT 42, 'Maquiagem noiva', 'Make especial para noivas', 120, 400.00
 UNION ALL SELECT 43, 'Maquiagem artística', 'Make criativa e temática', 90, 250.00
) AS catalog
WHERE NOT EXISTS (SELECT 1 FROM services existing WHERE existing.id = catalog.id);
