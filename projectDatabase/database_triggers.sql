USE ecommerce;

CREATE TABLE IF NOT EXISTS log_sistema (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mensagem VARCHAR(255) NOT NULL,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER vendedor_bonus AFTER INSERT ON venda_item
FOR EACH ROW
BEGIN
    DECLARE v_vendedor_id INT;
    DECLARE v_valor_total DECIMAL(10,2);
    DECLARE v_bonus DECIMAL(10,2);
    DECLARE v_bonus_total DECIMAL(10,2);

    SELECT vendedor_id INTO v_vendedor_id
    FROM produto
    WHERE id = NEW.produto_id;

    SELECT SUM(vi.quantidade * vi.valor_unitario) INTO v_valor_total
    FROM venda_item vi
    INNER JOIN produto p ON vi.produto_id = p.id
    WHERE p.vendedor_id = v_vendedor_id;

    IF v_valor_total > 1000.00 THEN
        SET v_bonus = v_valor_total * 0.05;

        IF EXISTS (SELECT * FROM funcionario_especial WHERE vendedor_id = v_vendedor_id) THEN
            UPDATE funcionario_especial 
            SET bonus = v_bonus 
            WHERE vendedor_id = v_vendedor_id;
        ELSE
            INSERT INTO funcionario_especial (vendedor_id, bonus) 
            VALUES (v_vendedor_id, v_bonus);
        END IF;
        SELECT SUM(bonus) INTO v_bonus_total FROM funcionario_especial
        INSERT INTO log_sistema(mensagem)
        VALUES (CONCAT('Bonus Total necessario pra custear: R$ ',COALESCE(v_bonus_total,0)));
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER bonus_cliente AFTER INSERT ON venda_item
FOR EACH ROW
BEGIN
    DECLARE v_id_cliente INT;
    DECLARE v_total_gasto DECIMAL(10,2);
    DECLARE v_novo_cashback DECIMAL(10,2);

    SELECT id_cliente INTO v_id_cliente
    FROM venda 
    WHERE id = NEW.venda_id;

    SELECT SUM(vi.quantidade * vi.valor_unitario) INTO v_total_gasto
    FROM venda_item vi
    INNER JOIN venda v ON vi.venda_id = v.id
    WHERE v.id_cliente = v_id_cliente;

    IF v_total_gasto > 500.00 THEN
        SET v_novo_cashback = v_total_gasto * 0.02;

        IF EXISTS (SELECT * FROM cliente_especial WHERE cliente_id = v_cliente_id) THEN
            UPDATE cliente_especial 
            SET cashback = v_novo_cashback 
            WHERE id_cliente = v_id_cliente;
        ELSE
            INSERT INTO cliente_especial (cliente_id, cashback) 
            VALUES (v_cliente_id, v_novo_cashback);
        END IF;
        SELECT SUM(cashback) INTO v_cashback_total FROM cliente_especial;
        INSERT INTO log_sistema (mensagem) 
        VALUES (CONCAT('Alerta: Valor total necessário para lidar com todo cashback: R$ ', COALESCE(v_cashback_total, 0)));
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER remover_cliente_zerado AFTER INSERT ON venda
FOR EACH ROW
BEGIN
    DECLARE v_saldo_atual DECIMAL(10,2);

    IF EXISTS (SELECT * FROM cliente_especial WHERE cliente_id = NEW.cliente_id) THEN
        
        SELECT cashback INTO v_saldo_atual 
        FROM cliente_especial 
        WHERE cliente_id = NEW.cliente_id;

        IF v_saldo_atual <= 0.00 THEN
            DELETE FROM cliente_especial WHERE cliente_id = NEW.cliente_id;
        END IF;
    END IF;
END //
DELIMITER ;