INSERT INTO configuration_group VALUES (NULL, "VAT-Mod", "VAT-Mod options", 1, 1);

UPDATE configuration_group SET sort_order = last_insert_id() WHERE configuration_group_id = last_insert_id();

INSERT INTO configuration SELECT NULL, "Check the VAT number", "ENTRY_TVA_INTRACOM_CHECK", "true", "Check the Customer's VAT number by the europa.eu.int server", configuration_group.configuration_group_id, 1, "", "", NULL, "zen_cfg_select_option(array('true', 'false')," FROM configuration_group WHERE configuration_group.configuration_group_title = 'VAT-Mod';

INSERT INTO configuration SELECT NULL, "VAT number of the store", "TVA_SHOP_INTRACOM", "", "Intracom VAT number:", configuration_group.configuration_group_id, 22, "", "", NULL, NULL FROM configuration_group WHERE configuration_group.configuration_group_title = 'VAT-Mod';

INSERT INTO configuration SELECT NULL, "Minimum characters for VAT number", "ENTRY_TVA_INTRACOM_MIN_LENGTH", 10, "Required characters for VAT number (0 if you don't want checking)", configuration_group.configuration_group_id, 17, "", "", NULL, NULL FROM configuration_group WHERE configuration_group.configuration_group_title = 'VAT-Mod';

ALTER TABLE address_book ADD entry_tva_intracom VARCHAR(32) DEFAULT "" AFTER entry_company;
ALTER TABLE orders ADD billing_tva_intracom VARCHAR(32) AFTER billing_company;

INSERT INTO admin_pages (page_key,language_key,main_page,page_params,menu_key,display_on_menu,sort_order ) VALUES ('configVatMod','BOX_VAT_MOD_CONFIG','FILENAME_CONFIGURATION' ,'1','configuration','Y', '1');

UPDATE admin_pages SET sort_order = (SELECT configuration_group_id FROM configuration_group WHERE configuration_group_title = 'VAT-Mod') WHERE page_key = 'configVatMod';
UPDATE admin_pages SET page_params = CONCAT('gID=',(SELECT configuration_group_id FROM configuration_group WHERE configuration_group_title = 'VAT-Mod')) WHERE page_key = 'configVatMod';
