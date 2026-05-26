USE ecommerce;

DELIMITER //

CREATE TRIGGER vendedor_bonus AFTER INSERT ON venda_item
FOR EACH ROW
BEGIN
    DECLARE v_vendedor_id INT;
    DECLARE v_novo_total DECIMAL(10,2);
    DECLARE v_bonus DECIMAL(10,2);

    SELECT vendedor_id INTO v_vendedor_id FROM produto WHERE id = NEW.produto_id;

    UPDATE vendedor SET total_vendido = total_vendido + (NEW.quantidade * NEW.valor_unitario) WHERE id = v_vendedor_id;
    SELECT total_vendido INTO v_novo_total FROM vendedor WHERE id = v_vendedor_id;

    IF v_novo_total > 1000.00 THEN
        SET v_bonus = v_novo_total * 0.05;

        IF EXISTS (SELECT * FROM funcionario_especial WHERE vendedor_id = v_vendedor_id) THEN
            UPDATE funcionario_especial SET bonus = v_bonus WHERE vendedor_id = v_vendedor_id;
        ELSE
            INSERT INTO funcionario_especial (vendedor_id, bonus) VALUES (v_vendedor_id, v_bonus);
        END IF;
        SELECT CONCAT('Bônus salarial necessário para o vendedor ID ', v_vendedor_id, ': R$ ', v_bonus) AS mensagem;
    END IF;
END //

CREATE TRIGGER bonus_cliente AFTER INSERT ON venda_item
FOR EACH ROW
BEGIN
    DECLARE v_cliente_id INT;
    DECLARE v_novo_total DECIMAL(10,2);
    DECLARE v_novo_cashback DECIMAL(10,2);

    SELECT cliente_id INTO v_cliente_id FROM venda WHERE id = NEW.venda_id;

    UPDATE clientes SET total_comprado = total_comprado + (NEW.quantidade * NEW.valor_unitario) WHERE id = v_cliente_id;
    SELECT total_comprado INTO v_novo_total FROM clientes WHERE id = v_cliente_id;

    IF v_novo_total > 500.00 THEN
        SET v_novo_cashback = v_novo_total * 0.02;

        IF EXISTS (SELECT * FROM cliente_especial WHERE id_cliente = v_cliente_id) THEN
            UPDATE cliente_especial SET cashback = v_novo_cashback WHERE id_cliente = v_cliente_id;
        ELSE
            INSERT INTO cliente_especial (id_cliente, cashback) VALUES (v_cliente_id, v_novo_cashback);
        END IF;
        SELECT CONCAT('Cashback necessário para o cliente ID ', v_cliente_id, ': R$ ', v_novo_cashback) AS mensagem;
    END IF;
END //

CREATE TRIGGER remover_cliente_zerado AFTER INSERT ON venda
FOR EACH ROW
BEGIN
    DECLARE v_saldo_atual DECIMAL(10,2);

    IF EXISTS (SELECT * FROM cliente_especial WHERE id_cliente = NEW.cliente_id) THEN
        
        SELECT cashback INTO v_saldo_atual 
        FROM cliente_especial 
        WHERE id_cliente = NEW.cliente_id;

        IF v_saldo_atual <= 0.00 THEN
            DELETE FROM cliente_especial WHERE id_cliente = NEW.cliente_id;
        END IF;
    END IF;
END //

DELIMITER ;