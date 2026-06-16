BEGIN;

-- ===========================
-- COURSE: Early Elementary Math (K-2)
-- ===========================
INSERT INTO courses (course_id, title, description, track, level_num, color, glyph, total_lessons, estimated_hours, xp_reward, status) VALUES ('c-k2', 'Early Elementary Math (K-2)', 'Early Math curriculum', 'Early Math', 1, 'green', '∑', 9, '5h', 1000, 'new') ON CONFLICT DO NOTHING;

-- UNIT 1: Counting and Cardinality
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-k2-u1', 'c-k2', 'Counting and Cardinality', 'Learning to count and understand quantity.', 100, 0) ON CONFLICT DO NOTHING;

-- LESSON 1: Counting to 10
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-k2-u1-1', 'ch-k2-u1', 'Counting to 10', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-k2-u1-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-k2-u1-1', 1, '/assets/img/placeholder.png', 'Learn about Counting to 10') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-k2-u1-1', 'ch-k2-u1', 'Exercises: Counting to 10', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-98183fcd-dbbf-4ac7-8a6a-918cf44758ea', 'q-l-k2-u1-1', 'If you have 4 apples and 3 bananas, how many fruits do you have in total?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-98183fcd-dbbf-4ac7-8a6a-918cf44758ea', 'opt-6860c147-3f74-4e08-a0dc-6bcac4732c03', '5', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-98183fcd-dbbf-4ac7-8a6a-918cf44758ea', 'opt-d9f6091b-18dc-4327-9bef-2d3c8b5a42f8', '6', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-98183fcd-dbbf-4ac7-8a6a-918cf44758ea', 'opt-fd794cf2-71df-4593-8c1f-27fb56d3caea', '7', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-98183fcd-dbbf-4ac7-8a6a-918cf44758ea', 'opt-c7368548-a8d5-4218-85d3-02598f97cad4', '8', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-95f75db0-758e-45f4-906a-fa43170d24c6', 'q-l-k2-u1-1', 'True/False: 8 is greater than 10.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-95f75db0-758e-45f4-906a-fa43170d24c6', 'opt-59626c89-7bcb-46e8-a328-aee3cf6cb272', 'True - 8 comes after 10.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-95f75db0-758e-45f4-906a-fa43170d24c6', 'opt-2cc67152-85b6-4b0a-8c73-828a6eead0ca', 'False - 10 is greater than 8.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-eeb7aee8-251a-46e2-bbc0-56f5be8e7d31', 'q-l-k2-u1-1', 'Fill in the missing number: 1, 2, 3, __, 5, 6', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-eeb7aee8-251a-46e2-bbc0-56f5be8e7d31', 0, '4') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-f47a8a52-350c-4776-b631-5f988c8817de', 'q-l-k2-u1-1', 'Match the number to its word form.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-f47a8a52-350c-4776-b631-5f988c8817de', 'di-c471e7ef-e0e8-4998-bd6f-2cca170f1e39', '1') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-f47a8a52-350c-4776-b631-5f988c8817de', 'dz-76129e69-57a2-43b0-81ec-f9a44b1c462b', 'One') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-f47a8a52-350c-4776-b631-5f988c8817de', 'di-c471e7ef-e0e8-4998-bd6f-2cca170f1e39', 'dz-76129e69-57a2-43b0-81ec-f9a44b1c462b') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-f47a8a52-350c-4776-b631-5f988c8817de', 'di-be53222b-a709-46ea-81e5-b5725dd05767', '5') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-f47a8a52-350c-4776-b631-5f988c8817de', 'dz-34e08979-c272-4974-90c3-5f75e43d687c', 'Five') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-f47a8a52-350c-4776-b631-5f988c8817de', 'di-be53222b-a709-46ea-81e5-b5725dd05767', 'dz-34e08979-c272-4974-90c3-5f75e43d687c') ON CONFLICT DO NOTHING;

-- LESSON 2: Comparing Numbers
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-k2-u1-2', 'ch-k2-u1', 'Comparing Numbers', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-k2-u1-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-k2-u1-2', 1, '/assets/img/placeholder.png', 'Learn about Comparing Numbers') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-k2-u1-2', 'ch-k2-u1', 'Exercises: Comparing Numbers', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-b6d4cd22-cdef-40aa-b874-786feb66eab6', 'q-l-k2-u1-2', 'A key concept in Comparing Numbers is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-b6d4cd22-cdef-40aa-b874-786feb66eab6', 'opt-72a74083-d0ce-4a0b-8214-2cd3d5341fa8', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-b6d4cd22-cdef-40aa-b874-786feb66eab6', 'opt-45c46deb-a822-4b5a-99e1-e2eb2690e449', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-b6d4cd22-cdef-40aa-b874-786feb66eab6', 'opt-23bc1a6a-0bdf-4ec8-acf1-b15aa90c95a5', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-b6d4cd22-cdef-40aa-b874-786feb66eab6', 'opt-84d83588-9b06-4cfb-b678-5a37b61c74d1', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-005ae94f-f16c-4f3c-9382-a09626981dd3', 'q-l-k2-u1-2', 'True/False: Mastery of Comparing Numbers requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-005ae94f-f16c-4f3c-9382-a09626981dd3', 'opt-65cc5352-6a0a-48cb-907f-a0173bd226d2', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-005ae94f-f16c-4f3c-9382-a09626981dd3', 'opt-8d7a54ff-b33f-4a9e-b45b-36dd62e05712', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-4b3d6e82-4f69-435d-987e-58e9dcff834c', 'q-l-k2-u1-2', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-4b3d6e82-4f69-435d-987e-58e9dcff834c', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-a5e1484a-0b27-4b7e-b5c1-6f23fd2e0c4d', 'q-l-k2-u1-2', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-a5e1484a-0b27-4b7e-b5c1-6f23fd2e0c4d', 'di-65ddf3b1-852f-48d9-bb82-f99722cf85e9', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-a5e1484a-0b27-4b7e-b5c1-6f23fd2e0c4d', 'dz-0a65886f-7da5-477e-b9a7-fd106cf219e7', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-a5e1484a-0b27-4b7e-b5c1-6f23fd2e0c4d', 'di-65ddf3b1-852f-48d9-bb82-f99722cf85e9', 'dz-0a65886f-7da5-477e-b9a7-fd106cf219e7') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-a5e1484a-0b27-4b7e-b5c1-6f23fd2e0c4d', 'di-a167b3b6-fdf1-4a6d-841b-1a27ea7efea6', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-a5e1484a-0b27-4b7e-b5c1-6f23fd2e0c4d', 'dz-b3b51188-d1a3-4ec3-a989-8240ffa36dd3', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-a5e1484a-0b27-4b7e-b5c1-6f23fd2e0c4d', 'di-a167b3b6-fdf1-4a6d-841b-1a27ea7efea6', 'dz-b3b51188-d1a3-4ec3-a989-8240ffa36dd3') ON CONFLICT DO NOTHING;

-- LESSON 3: Counting to 100
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-k2-u1-3', 'ch-k2-u1', 'Counting to 100', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-k2-u1-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-k2-u1-3', 1, '/assets/img/placeholder.png', 'Learn about Counting to 100') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-k2-u1-3', 'ch-k2-u1', 'Exercises: Counting to 100', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-17043dbd-ea26-4179-9c3d-c1a9b5825e52', 'q-l-k2-u1-3', 'If you have 4 apples and 3 bananas, how many fruits do you have in total?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-17043dbd-ea26-4179-9c3d-c1a9b5825e52', 'opt-37b2e525-a7f8-436e-9ea2-c5d583f6058c', '5', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-17043dbd-ea26-4179-9c3d-c1a9b5825e52', 'opt-40ac2112-2c59-43f3-85c7-a3a2fe9c82d8', '6', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-17043dbd-ea26-4179-9c3d-c1a9b5825e52', 'opt-e55277df-8b1e-419f-a55e-ece00933c216', '7', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-17043dbd-ea26-4179-9c3d-c1a9b5825e52', 'opt-5e3ac669-9386-4107-a417-4249f99979a7', '8', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-3a3b2abe-78c0-4575-bf17-719829e14e47', 'q-l-k2-u1-3', 'True/False: 8 is greater than 10.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-3a3b2abe-78c0-4575-bf17-719829e14e47', 'opt-afe4893b-e1d5-4e83-8c4a-68a2ac2401d4', 'True - 8 comes after 10.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-3a3b2abe-78c0-4575-bf17-719829e14e47', 'opt-46739631-5a5e-46fd-8562-16ce03ca769f', 'False - 10 is greater than 8.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-d024e958-9a65-43b8-a40e-2af6b235cb2b', 'q-l-k2-u1-3', 'Fill in the missing number: 1, 2, 3, __, 5, 6', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-d024e958-9a65-43b8-a40e-2af6b235cb2b', 0, '4') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-658a38bf-d2d2-4356-9da8-be06775d13bf', 'q-l-k2-u1-3', 'Match the number to its word form.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-658a38bf-d2d2-4356-9da8-be06775d13bf', 'di-3722efd7-7b51-4054-a425-f2a8a749cede', '1') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-658a38bf-d2d2-4356-9da8-be06775d13bf', 'dz-c417b87b-7123-480d-88c1-2fa644ed2bf7', 'One') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-658a38bf-d2d2-4356-9da8-be06775d13bf', 'di-3722efd7-7b51-4054-a425-f2a8a749cede', 'dz-c417b87b-7123-480d-88c1-2fa644ed2bf7') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-658a38bf-d2d2-4356-9da8-be06775d13bf', 'di-97eb80fa-78d1-45c9-a976-d7b43b823871', '5') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-658a38bf-d2d2-4356-9da8-be06775d13bf', 'dz-36e50d14-85de-4bd3-b4f8-d58b90704a4e', 'Five') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-658a38bf-d2d2-4356-9da8-be06775d13bf', 'di-97eb80fa-78d1-45c9-a976-d7b43b823871', 'dz-36e50d14-85de-4bd3-b4f8-d58b90704a4e') ON CONFLICT DO NOTHING;

-- UNIT 2: Addition and Subtraction
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-k2-u2', 'c-k2', 'Addition and Subtraction', 'Adding and subtracting within 20.', 100, 1) ON CONFLICT DO NOTHING;

-- LESSON 1: Adding within 10
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-k2-u2-1', 'ch-k2-u2', 'Adding within 10', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-k2-u2-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-k2-u2-1', 1, '/assets/img/placeholder.png', 'Learn about Adding within 10') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-k2-u2-1', 'ch-k2-u2', 'Exercises: Adding within 10', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-28cee149-89c1-4b78-ab92-4ec37527c9d8', 'q-l-k2-u2-1', 'What is 14 - 5?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-28cee149-89c1-4b78-ab92-4ec37527c9d8', 'opt-b2ddfa49-af8b-478d-911d-5bf30b05ade9', '7', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-28cee149-89c1-4b78-ab92-4ec37527c9d8', 'opt-8bd74edb-ad1e-41a6-bc33-37376b778024', '8', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-28cee149-89c1-4b78-ab92-4ec37527c9d8', 'opt-9893b4f9-fc63-4d8f-9dbb-d4be8e7401d5', '9', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-28cee149-89c1-4b78-ab92-4ec37527c9d8', 'opt-7e310f3e-1cdb-479c-bf52-6623adfbe1e3', '10', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-00ac389b-ed40-41b4-9c6a-7d84072deb3d', 'q-l-k2-u2-1', 'True/False: Addition is commutative, meaning 3 + 4 is the same as 4 + 3.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-00ac389b-ed40-41b4-9c6a-7d84072deb3d', 'opt-65e10b8e-a039-482c-a2ad-a527e2b81047', 'True - order does not matter in addition.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-00ac389b-ed40-41b4-9c6a-7d84072deb3d', 'opt-67829408-47db-4f9e-a58c-c52a4208453d', 'False - order always matters.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-704ebca1-d56e-4091-b6f2-7cb74ac59435', 'q-l-k2-u2-1', 'Word Problem: You have 15 pencils. You give 6 to a friend. You have __ pencils left.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-704ebca1-d56e-4091-b6f2-7cb74ac59435', 0, '9') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-862d4e20-c43f-453c-8bbe-3e1f86e156f9', 'q-l-k2-u2-1', 'Match the equation to the correct answer.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-862d4e20-c43f-453c-8bbe-3e1f86e156f9', 'di-f5c5e978-c415-41cd-8430-69eb3770ac0d', '10 + 5') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-862d4e20-c43f-453c-8bbe-3e1f86e156f9', 'dz-833c4c32-a660-46a7-b954-98fcd4dcdd79', '15') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-862d4e20-c43f-453c-8bbe-3e1f86e156f9', 'di-f5c5e978-c415-41cd-8430-69eb3770ac0d', 'dz-833c4c32-a660-46a7-b954-98fcd4dcdd79') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-862d4e20-c43f-453c-8bbe-3e1f86e156f9', 'di-3eb5e7cc-7d78-4dff-b11f-48641dfe4f45', '20 - 5') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-862d4e20-c43f-453c-8bbe-3e1f86e156f9', 'dz-f38e570d-e031-402d-92f4-fb7d39b626f0', '15') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-862d4e20-c43f-453c-8bbe-3e1f86e156f9', 'di-3eb5e7cc-7d78-4dff-b11f-48641dfe4f45', 'dz-f38e570d-e031-402d-92f4-fb7d39b626f0') ON CONFLICT DO NOTHING;

-- LESSON 2: Subtracting within 10
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-k2-u2-2', 'ch-k2-u2', 'Subtracting within 10', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-k2-u2-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-k2-u2-2', 1, '/assets/img/placeholder.png', 'Learn about Subtracting within 10') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-k2-u2-2', 'ch-k2-u2', 'Exercises: Subtracting within 10', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-df8136db-b939-41c6-b019-dfad4b4df5ad', 'q-l-k2-u2-2', 'What is 14 - 5?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-df8136db-b939-41c6-b019-dfad4b4df5ad', 'opt-58b6e358-15d8-4770-a7d5-eec0fdbe2ac0', '7', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-df8136db-b939-41c6-b019-dfad4b4df5ad', 'opt-404bff32-a7ea-413a-b7eb-ebf53a6b727a', '8', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-df8136db-b939-41c6-b019-dfad4b4df5ad', 'opt-cff9661a-1cc9-4d37-9dcf-7f39c651f1c5', '9', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-df8136db-b939-41c6-b019-dfad4b4df5ad', 'opt-a149ebe4-4398-4dd0-befa-23f2d5c5f363', '10', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-b26cc441-eae5-4f89-a25f-e60c54c48c11', 'q-l-k2-u2-2', 'True/False: Addition is commutative, meaning 3 + 4 is the same as 4 + 3.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-b26cc441-eae5-4f89-a25f-e60c54c48c11', 'opt-b4ac0f6d-807d-4cab-93c3-58d282adef2d', 'True - order does not matter in addition.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-b26cc441-eae5-4f89-a25f-e60c54c48c11', 'opt-2a00dbbc-597e-45a2-b73f-07a525a1d887', 'False - order always matters.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-0737fb70-de68-4349-826e-f39cece421bd', 'q-l-k2-u2-2', 'Word Problem: You have 15 pencils. You give 6 to a friend. You have __ pencils left.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-0737fb70-de68-4349-826e-f39cece421bd', 0, '9') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-7a049698-c1d5-4530-b19f-c9c373c859b8', 'q-l-k2-u2-2', 'Match the equation to the correct answer.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-7a049698-c1d5-4530-b19f-c9c373c859b8', 'di-81fae025-ed73-4fc1-8554-b5578cf2bb5c', '10 + 5') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-7a049698-c1d5-4530-b19f-c9c373c859b8', 'dz-e8f2a143-688e-4bec-bcce-334c69e8cc92', '15') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-7a049698-c1d5-4530-b19f-c9c373c859b8', 'di-81fae025-ed73-4fc1-8554-b5578cf2bb5c', 'dz-e8f2a143-688e-4bec-bcce-334c69e8cc92') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-7a049698-c1d5-4530-b19f-c9c373c859b8', 'di-b8826583-8a47-4a38-b6dc-23874b610975', '20 - 5') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-7a049698-c1d5-4530-b19f-c9c373c859b8', 'dz-642e5fd7-7b9b-48f3-90f9-002c49b24c17', '15') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-7a049698-c1d5-4530-b19f-c9c373c859b8', 'di-b8826583-8a47-4a38-b6dc-23874b610975', 'dz-642e5fd7-7b9b-48f3-90f9-002c49b24c17') ON CONFLICT DO NOTHING;

-- LESSON 3: Word Problems within 20
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-k2-u2-3', 'ch-k2-u2', 'Word Problems within 20', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-k2-u2-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-k2-u2-3', 1, '/assets/img/placeholder.png', 'Learn about Word Problems within 20') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-k2-u2-3', 'ch-k2-u2', 'Exercises: Word Problems within 20', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-b51c5746-03f0-4052-abcb-ffd704944c26', 'q-l-k2-u2-3', 'A key concept in Word Problems within 20 is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-b51c5746-03f0-4052-abcb-ffd704944c26', 'opt-dc4cce25-ee81-4607-8c36-cb4c9cc8aacc', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-b51c5746-03f0-4052-abcb-ffd704944c26', 'opt-103ce41e-40a3-449c-9246-df4a64fb244d', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-b51c5746-03f0-4052-abcb-ffd704944c26', 'opt-809b6acb-e8f5-4b49-867f-39754fe838eb', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-b51c5746-03f0-4052-abcb-ffd704944c26', 'opt-4edb4a5e-1519-4e90-9f22-f308ddd7f916', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-1b216232-e84c-432a-be0b-6ca8f4b30b8e', 'q-l-k2-u2-3', 'True/False: Mastery of Word Problems within 20 requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-1b216232-e84c-432a-be0b-6ca8f4b30b8e', 'opt-d975695c-7fa3-4eb4-bd97-ad1193371212', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-1b216232-e84c-432a-be0b-6ca8f4b30b8e', 'opt-ca4e9724-5efa-43cd-be05-2409cf94f08a', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-d4636eaf-b675-4158-b4b0-42bb0c6fd72c', 'q-l-k2-u2-3', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-d4636eaf-b675-4158-b4b0-42bb0c6fd72c', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-662f3f6c-6c52-47c8-a4b6-da8ea89cbcdc', 'q-l-k2-u2-3', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-662f3f6c-6c52-47c8-a4b6-da8ea89cbcdc', 'di-67c44063-8ae3-4dcc-91d2-ab71d416f3c0', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-662f3f6c-6c52-47c8-a4b6-da8ea89cbcdc', 'dz-ba07fd0f-e42f-49fe-a56e-cb4426e733ee', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-662f3f6c-6c52-47c8-a4b6-da8ea89cbcdc', 'di-67c44063-8ae3-4dcc-91d2-ab71d416f3c0', 'dz-ba07fd0f-e42f-49fe-a56e-cb4426e733ee') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-662f3f6c-6c52-47c8-a4b6-da8ea89cbcdc', 'di-0acd079f-57bd-4cfe-8cce-c7fa4c0aa642', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-662f3f6c-6c52-47c8-a4b6-da8ea89cbcdc', 'dz-33c9cb4e-b7fc-46f8-ab78-84ffff3302c9', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-662f3f6c-6c52-47c8-a4b6-da8ea89cbcdc', 'di-0acd079f-57bd-4cfe-8cce-c7fa4c0aa642', 'dz-33c9cb4e-b7fc-46f8-ab78-84ffff3302c9') ON CONFLICT DO NOTHING;

-- UNIT 3: Shapes and Attributes
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-k2-u3', 'c-k2', 'Shapes and Attributes', 'Recognizing and categorizing 2D and 3D shapes.', 100, 2) ON CONFLICT DO NOTHING;

-- LESSON 1: 2D Shapes
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-k2-u3-1', 'ch-k2-u3', '2D Shapes', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-k2-u3-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-k2-u3-1', 1, '/assets/img/placeholder.png', 'Learn about 2D Shapes') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-k2-u3-1', 'ch-k2-u3', 'Exercises: 2D Shapes', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-18394af3-513a-4132-ae9e-9fe46e9c2ef7', 'q-l-k2-u3-1', 'What is the formula for the area of a rectangle?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-18394af3-513a-4132-ae9e-9fe46e9c2ef7', 'opt-a45b939d-13d0-4a7d-b938-dcf9ba0dfb87', 'Length + Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-18394af3-513a-4132-ae9e-9fe46e9c2ef7', 'opt-cb04bd37-3a96-4f44-af8a-0af42c59f211', '2 * (Length + Width)', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-18394af3-513a-4132-ae9e-9fe46e9c2ef7', 'opt-abc38a93-29ba-4c84-84bb-08ab78e4aebe', 'Length * Width', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-18394af3-513a-4132-ae9e-9fe46e9c2ef7', 'opt-83e2338f-fde3-4ab9-820c-644d8677c1cb', 'Length / Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-02dd2c31-082d-455b-bea4-f05c669a72a5', 'q-l-k2-u3-1', 'True/False: All squares are rectangles.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-02dd2c31-082d-455b-bea4-f05c669a72a5', 'opt-478edf72-314b-4361-92a6-d9220360bd8f', 'True - a square is a rectangle with equal sides.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-02dd2c31-082d-455b-bea4-f05c669a72a5', 'opt-3da04407-5a96-493d-8cf1-5949234f1084', 'False - squares and rectangles are mutually exclusive.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-6b3bbd6a-cdb4-4063-a17b-82b4ac9392af', 'q-l-k2-u3-1', 'A triangle has __ sides.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-6b3bbd6a-cdb4-4063-a17b-82b4ac9392af', 0, '3') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-f6411a0a-5952-4401-a2bd-60470d33dacd', 'q-l-k2-u3-1', 'Match the shape to its defining property.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-f6411a0a-5952-4401-a2bd-60470d33dacd', 'di-149ea391-73bb-40bf-8e94-151ec1d8bb37', 'Circle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-f6411a0a-5952-4401-a2bd-60470d33dacd', 'dz-19757ca8-01b8-4e68-839a-31eca230d493', 'No corners') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-f6411a0a-5952-4401-a2bd-60470d33dacd', 'di-149ea391-73bb-40bf-8e94-151ec1d8bb37', 'dz-19757ca8-01b8-4e68-839a-31eca230d493') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-f6411a0a-5952-4401-a2bd-60470d33dacd', 'di-e9bdeaa3-0e78-428f-a7c3-be4ea5f7c829', 'Triangle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-f6411a0a-5952-4401-a2bd-60470d33dacd', 'dz-9630b8f7-de95-49fd-b509-a51d48d7ad9d', 'Three sides') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-f6411a0a-5952-4401-a2bd-60470d33dacd', 'di-e9bdeaa3-0e78-428f-a7c3-be4ea5f7c829', 'dz-9630b8f7-de95-49fd-b509-a51d48d7ad9d') ON CONFLICT DO NOTHING;

-- LESSON 2: 3D Shapes
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-k2-u3-2', 'ch-k2-u3', '3D Shapes', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-k2-u3-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-k2-u3-2', 1, '/assets/img/placeholder.png', 'Learn about 3D Shapes') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-k2-u3-2', 'ch-k2-u3', 'Exercises: 3D Shapes', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-180ba299-0d1a-463c-a402-63ccb8d2f9af', 'q-l-k2-u3-2', 'What is the formula for the area of a rectangle?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-180ba299-0d1a-463c-a402-63ccb8d2f9af', 'opt-5bd4228b-7c33-42a3-a26f-9a9df56f3943', 'Length + Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-180ba299-0d1a-463c-a402-63ccb8d2f9af', 'opt-fc4f0553-8a6e-4b1b-b97b-f76d66b7b906', '2 * (Length + Width)', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-180ba299-0d1a-463c-a402-63ccb8d2f9af', 'opt-2339ec6b-8319-4b56-a703-ca33edcfd642', 'Length * Width', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-180ba299-0d1a-463c-a402-63ccb8d2f9af', 'opt-878937ec-1f8f-47aa-926d-3c20c529616f', 'Length / Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-6d8d5ecd-0da6-4bd1-8e67-14c44e886f8f', 'q-l-k2-u3-2', 'True/False: All squares are rectangles.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-6d8d5ecd-0da6-4bd1-8e67-14c44e886f8f', 'opt-7ebe381c-c428-4656-8f86-9aaa1c1d656a', 'True - a square is a rectangle with equal sides.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-6d8d5ecd-0da6-4bd1-8e67-14c44e886f8f', 'opt-7278fc2b-cc59-4afe-a2ba-d00b0d5932ff', 'False - squares and rectangles are mutually exclusive.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-31e57427-2259-432b-a7d4-9f6f9f7497fd', 'q-l-k2-u3-2', 'A triangle has __ sides.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-31e57427-2259-432b-a7d4-9f6f9f7497fd', 0, '3') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-b3180a94-2dd4-433f-9011-10c2cef03aa4', 'q-l-k2-u3-2', 'Match the shape to its defining property.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-b3180a94-2dd4-433f-9011-10c2cef03aa4', 'di-d9f17ca9-0af2-4a35-9e41-6910377f4810', 'Circle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-b3180a94-2dd4-433f-9011-10c2cef03aa4', 'dz-2d1032b8-11a5-4846-979c-4f4eb9c9ecdf', 'No corners') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-b3180a94-2dd4-433f-9011-10c2cef03aa4', 'di-d9f17ca9-0af2-4a35-9e41-6910377f4810', 'dz-2d1032b8-11a5-4846-979c-4f4eb9c9ecdf') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-b3180a94-2dd4-433f-9011-10c2cef03aa4', 'di-2cac3440-6b04-488d-a016-c36f92777805', 'Triangle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-b3180a94-2dd4-433f-9011-10c2cef03aa4', 'dz-99a90a0e-4bf7-41d6-abd6-ddc6a305f969', 'Three sides') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-b3180a94-2dd4-433f-9011-10c2cef03aa4', 'di-2cac3440-6b04-488d-a016-c36f92777805', 'dz-99a90a0e-4bf7-41d6-abd6-ddc6a305f969') ON CONFLICT DO NOTHING;

-- LESSON 3: Composing Shapes
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-k2-u3-3', 'ch-k2-u3', 'Composing Shapes', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-k2-u3-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-k2-u3-3', 1, '/assets/img/placeholder.png', 'Learn about Composing Shapes') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-k2-u3-3', 'ch-k2-u3', 'Exercises: Composing Shapes', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-a6785e74-9887-408a-95d7-be75fb239de6', 'q-l-k2-u3-3', 'What is the formula for the area of a rectangle?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a6785e74-9887-408a-95d7-be75fb239de6', 'opt-df8c1659-a282-448a-ba11-98c19eb2fdd9', 'Length + Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a6785e74-9887-408a-95d7-be75fb239de6', 'opt-6a3d26ea-5a85-4aa5-a179-ed21cec8744f', '2 * (Length + Width)', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a6785e74-9887-408a-95d7-be75fb239de6', 'opt-8e522cf8-700e-4bbd-8855-7fca4d0b3280', 'Length * Width', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a6785e74-9887-408a-95d7-be75fb239de6', 'opt-5201db65-371f-4de0-b1be-e78681618bca', 'Length / Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-6535c87b-5454-4cc0-af55-e41312b2d4f5', 'q-l-k2-u3-3', 'True/False: All squares are rectangles.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-6535c87b-5454-4cc0-af55-e41312b2d4f5', 'opt-a0096c62-235e-4129-a028-1534a759b676', 'True - a square is a rectangle with equal sides.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-6535c87b-5454-4cc0-af55-e41312b2d4f5', 'opt-bbccb599-abfc-4bc2-b82a-1a8866074530', 'False - squares and rectangles are mutually exclusive.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-9d698c6a-bcd5-401b-89a0-3af97770bf22', 'q-l-k2-u3-3', 'A triangle has __ sides.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-9d698c6a-bcd5-401b-89a0-3af97770bf22', 0, '3') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-bc2e42e7-3c32-4c06-82af-8e591689887c', 'q-l-k2-u3-3', 'Match the shape to its defining property.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-bc2e42e7-3c32-4c06-82af-8e591689887c', 'di-1174bc32-e3eb-4d6e-b6e5-58df668d22e5', 'Circle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-bc2e42e7-3c32-4c06-82af-8e591689887c', 'dz-9b8abde2-0b1b-4db7-a353-84e8de206587', 'No corners') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-bc2e42e7-3c32-4c06-82af-8e591689887c', 'di-1174bc32-e3eb-4d6e-b6e5-58df668d22e5', 'dz-9b8abde2-0b1b-4db7-a353-84e8de206587') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-bc2e42e7-3c32-4c06-82af-8e591689887c', 'di-e034c616-16d3-4195-9cb9-4757a0f83c61', 'Triangle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-bc2e42e7-3c32-4c06-82af-8e591689887c', 'dz-7fa76566-a31a-4eda-9c87-c44200771295', 'Three sides') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-bc2e42e7-3c32-4c06-82af-8e591689887c', 'di-e034c616-16d3-4195-9cb9-4757a0f83c61', 'dz-7fa76566-a31a-4eda-9c87-c44200771295') ON CONFLICT DO NOTHING;

-- ===========================
-- COURSE: Upper Elementary Math (3-5)
-- ===========================
INSERT INTO courses (course_id, title, description, track, level_num, color, glyph, total_lessons, estimated_hours, xp_reward, status) VALUES ('c-35', 'Upper Elementary Math (3-5)', 'Upper Elementary curriculum', 'Upper Elementary', 3, 'blue', '∑', 9, '5h', 1000, 'new') ON CONFLICT DO NOTHING;

-- UNIT 1: Multiplication and Division
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-35-u1', 'c-35', 'Multiplication and Division', 'Understanding equal groups and arrays.', 100, 0) ON CONFLICT DO NOTHING;

-- LESSON 1: Meaning of Multiplication
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-35-u1-1', 'ch-35-u1', 'Meaning of Multiplication', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-35-u1-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-35-u1-1', 1, '/assets/img/placeholder.png', 'Learn about Meaning of Multiplication') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-35-u1-1', 'ch-35-u1', 'Exercises: Meaning of Multiplication', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-d3886c34-4f12-4e3e-b743-72671b643ee8', 'q-l-35-u1-1', 'What is 7 multiplied by 8?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d3886c34-4f12-4e3e-b743-72671b643ee8', 'opt-a6cfa2ff-01c5-4a2f-8fc3-667a2019ba4d', '54', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d3886c34-4f12-4e3e-b743-72671b643ee8', 'opt-d09f835d-d1c3-46ac-a291-9e2e26837c76', '56', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d3886c34-4f12-4e3e-b743-72671b643ee8', 'opt-5d62a656-e4a0-4bc6-9981-0ea7ec27ff60', '64', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d3886c34-4f12-4e3e-b743-72671b643ee8', 'opt-574ccf9a-a0d5-4e95-8e52-fd66c3618dce', '49', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-1967a417-8940-418c-bf85-9e1350f9dd1a', 'q-l-35-u1-1', 'True/False: Dividing by zero is mathematically allowed.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-1967a417-8940-418c-bf85-9e1350f9dd1a', 'opt-69f43e0a-6fb7-481a-be86-791b2ee0b9cb', 'True - the answer is always 0.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-1967a417-8940-418c-bf85-9e1350f9dd1a', 'opt-867dd367-fd06-49a5-875f-ec85454fe5b4', 'False - division by zero is undefined.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-b247ee79-6da8-4eaa-b79b-97ed761d0763', 'q-l-35-u1-1', 'Word Problem: A baker makes 4 batches of cookies. Each batch has 12 cookies. The baker made __ cookies in total.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-b247ee79-6da8-4eaa-b79b-97ed761d0763', 0, '48') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-7de05fc7-6eae-42ad-854d-591b526f66ce', 'q-l-35-u1-1', 'Match the operation to its result.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-7de05fc7-6eae-42ad-854d-591b526f66ce', 'di-9c936814-fe97-4bc5-8caf-9d7f97291feb', '36 / 6') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-7de05fc7-6eae-42ad-854d-591b526f66ce', 'dz-de6d1992-6a1b-4d5b-8872-756aa340ed24', '6') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-7de05fc7-6eae-42ad-854d-591b526f66ce', 'di-9c936814-fe97-4bc5-8caf-9d7f97291feb', 'dz-de6d1992-6a1b-4d5b-8872-756aa340ed24') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-7de05fc7-6eae-42ad-854d-591b526f66ce', 'di-b91ce3c7-ec5e-4355-9751-6d319274bf72', '9 * 4') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-7de05fc7-6eae-42ad-854d-591b526f66ce', 'dz-b0ef7a8b-7969-47f1-a074-43c483eafe0c', '36') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-7de05fc7-6eae-42ad-854d-591b526f66ce', 'di-b91ce3c7-ec5e-4355-9751-6d319274bf72', 'dz-b0ef7a8b-7969-47f1-a074-43c483eafe0c') ON CONFLICT DO NOTHING;

-- LESSON 2: Meaning of Division
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-35-u1-2', 'ch-35-u1', 'Meaning of Division', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-35-u1-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-35-u1-2', 1, '/assets/img/placeholder.png', 'Learn about Meaning of Division') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-35-u1-2', 'ch-35-u1', 'Exercises: Meaning of Division', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-c924d520-977b-43f0-8b6c-54e5300b41f2', 'q-l-35-u1-2', 'What is 7 multiplied by 8?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c924d520-977b-43f0-8b6c-54e5300b41f2', 'opt-9289349e-e602-4b23-abbd-aae45a963e4b', '54', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c924d520-977b-43f0-8b6c-54e5300b41f2', 'opt-d82ff384-2b0b-4cf4-a342-3798ae37c39e', '56', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c924d520-977b-43f0-8b6c-54e5300b41f2', 'opt-19ed7cef-1a02-4a66-ab75-27855f1f0979', '64', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c924d520-977b-43f0-8b6c-54e5300b41f2', 'opt-047054ad-9662-428d-a300-b3f0ea082e0b', '49', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-fb8a8758-ebf4-47f8-8cd2-7aee3cde972c', 'q-l-35-u1-2', 'True/False: Dividing by zero is mathematically allowed.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-fb8a8758-ebf4-47f8-8cd2-7aee3cde972c', 'opt-4bdb122b-ee53-4fe2-acea-474c08ea6870', 'True - the answer is always 0.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-fb8a8758-ebf4-47f8-8cd2-7aee3cde972c', 'opt-d963b2e7-b7c9-4b31-9f21-adde3795cf62', 'False - division by zero is undefined.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-3b2bffce-f578-41a1-b123-ffe9527859dc', 'q-l-35-u1-2', 'Word Problem: A baker makes 4 batches of cookies. Each batch has 12 cookies. The baker made __ cookies in total.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-3b2bffce-f578-41a1-b123-ffe9527859dc', 0, '48') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-1df63b51-2c87-40f0-8a7f-b271d5bf4243', 'q-l-35-u1-2', 'Match the operation to its result.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-1df63b51-2c87-40f0-8a7f-b271d5bf4243', 'di-87e95d49-0df9-408b-8c99-5acc805640df', '36 / 6') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-1df63b51-2c87-40f0-8a7f-b271d5bf4243', 'dz-28c10291-4a95-4a5f-8973-f0cf0ee867bf', '6') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-1df63b51-2c87-40f0-8a7f-b271d5bf4243', 'di-87e95d49-0df9-408b-8c99-5acc805640df', 'dz-28c10291-4a95-4a5f-8973-f0cf0ee867bf') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-1df63b51-2c87-40f0-8a7f-b271d5bf4243', 'di-aa3cf100-4161-4b7e-acf3-a90123a29710', '9 * 4') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-1df63b51-2c87-40f0-8a7f-b271d5bf4243', 'dz-287aa422-a8ea-4382-bb35-f6261fd384eb', '36') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-1df63b51-2c87-40f0-8a7f-b271d5bf4243', 'di-aa3cf100-4161-4b7e-acf3-a90123a29710', 'dz-287aa422-a8ea-4382-bb35-f6261fd384eb') ON CONFLICT DO NOTHING;

-- LESSON 3: Relating Multiplication and Division
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-35-u1-3', 'ch-35-u1', 'Relating Multiplication and Division', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-35-u1-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-35-u1-3', 1, '/assets/img/placeholder.png', 'Learn about Relating Multiplication and Division') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-35-u1-3', 'ch-35-u1', 'Exercises: Relating Multiplication and Division', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-050e59f1-f24f-4bf6-8cca-e3df85652de8', 'q-l-35-u1-3', 'What is 7 multiplied by 8?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-050e59f1-f24f-4bf6-8cca-e3df85652de8', 'opt-49f62c30-f0e6-4d72-a277-d9e110519f95', '54', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-050e59f1-f24f-4bf6-8cca-e3df85652de8', 'opt-91b62e73-e89b-4b9a-928a-8d8db98cc194', '56', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-050e59f1-f24f-4bf6-8cca-e3df85652de8', 'opt-3102a4d2-fcca-4f7b-8099-56a15493814d', '64', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-050e59f1-f24f-4bf6-8cca-e3df85652de8', 'opt-6c05a4a1-2588-490a-8b12-124a677be5e5', '49', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-5c38e69c-13ee-4ed2-a5a5-d1b23cf6084d', 'q-l-35-u1-3', 'True/False: Dividing by zero is mathematically allowed.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-5c38e69c-13ee-4ed2-a5a5-d1b23cf6084d', 'opt-a3a96dc9-87ed-4a38-a7bd-38566da66109', 'True - the answer is always 0.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-5c38e69c-13ee-4ed2-a5a5-d1b23cf6084d', 'opt-46b061db-9b43-4108-be89-efaaf3e4a74c', 'False - division by zero is undefined.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-d62c960e-1e4b-467d-bf99-1ecf283722c3', 'q-l-35-u1-3', 'Word Problem: A baker makes 4 batches of cookies. Each batch has 12 cookies. The baker made __ cookies in total.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-d62c960e-1e4b-467d-bf99-1ecf283722c3', 0, '48') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-c31c4b4d-f188-498f-8d79-224ec010cb74', 'q-l-35-u1-3', 'Match the operation to its result.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-c31c4b4d-f188-498f-8d79-224ec010cb74', 'di-6e6ca6a6-0428-4184-b944-278594d3fed0', '36 / 6') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-c31c4b4d-f188-498f-8d79-224ec010cb74', 'dz-bdf4a889-5a2c-47d2-9f6e-2185f9b47dca', '6') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-c31c4b4d-f188-498f-8d79-224ec010cb74', 'di-6e6ca6a6-0428-4184-b944-278594d3fed0', 'dz-bdf4a889-5a2c-47d2-9f6e-2185f9b47dca') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-c31c4b4d-f188-498f-8d79-224ec010cb74', 'di-901f16a2-9122-4a1b-8d30-ed1e7d6dc8b3', '9 * 4') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-c31c4b4d-f188-498f-8d79-224ec010cb74', 'dz-375d3533-7257-4780-935e-9eaf84fc74a2', '36') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-c31c4b4d-f188-498f-8d79-224ec010cb74', 'di-901f16a2-9122-4a1b-8d30-ed1e7d6dc8b3', 'dz-375d3533-7257-4780-935e-9eaf84fc74a2') ON CONFLICT DO NOTHING;

-- UNIT 2: Fractions
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-35-u2', 'c-35', 'Fractions', 'Fractions as numbers and equivalence.', 100, 1) ON CONFLICT DO NOTHING;

-- LESSON 1: Understanding Fractions
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-35-u2-1', 'ch-35-u2', 'Understanding Fractions', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-35-u2-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-35-u2-1', 1, '/assets/img/placeholder.png', 'Learn about Understanding Fractions') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-35-u2-1', 'ch-35-u2', 'Exercises: Understanding Fractions', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-281e03be-ccee-4bf6-b9be-cd9f42c2378b', 'q-l-35-u2-1', 'Which fraction is equivalent to 1/2?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-281e03be-ccee-4bf6-b9be-cd9f42c2378b', 'opt-d9233267-1de5-453d-b422-53d07fd82ccf', '2/3', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-281e03be-ccee-4bf6-b9be-cd9f42c2378b', 'opt-938cea41-6cda-4900-91d0-3c9dec568b62', '3/6', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-281e03be-ccee-4bf6-b9be-cd9f42c2378b', 'opt-ecedcd4b-df30-4edd-9e7c-e972a7d2c514', '4/9', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-281e03be-ccee-4bf6-b9be-cd9f42c2378b', 'opt-33f3c027-491a-441b-bda0-4d8e81260723', '5/12', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-36f16a0e-8152-40d4-9192-598f86a4ac3b', 'q-l-35-u2-1', 'True/False: 3/4 is larger than 2/3.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-36f16a0e-8152-40d4-9192-598f86a4ac3b', 'opt-4dce6dc2-5fc7-4c14-9c4e-dfddc65505be', 'True - 3/4 (0.75) is greater than 2/3 (0.66).', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-36f16a0e-8152-40d4-9192-598f86a4ac3b', 'opt-6072363e-4874-446f-a0b0-630c9c1c0043', 'False - 2/3 is larger because 3 is smaller than 4.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-08a4bee4-7b27-494a-bd38-46d73c254ea6', 'q-l-35-u2-1', 'To add 1/4 and 2/4, you get __/4.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-08a4bee4-7b27-494a-bd38-46d73c254ea6', 0, '3') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-64e8c6d8-d8ca-4676-80c1-f487a98da22a', 'q-l-35-u2-1', 'Order the fractions from least to greatest.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-64e8c6d8-d8ca-4676-80c1-f487a98da22a', 'di-6780c09d-e4b7-47ff-811a-7d5931c4a007', 'Smallest') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-64e8c6d8-d8ca-4676-80c1-f487a98da22a', 'dz-7e97225b-7e6d-4756-b476-da04a7e80a97', '1/4') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-64e8c6d8-d8ca-4676-80c1-f487a98da22a', 'di-6780c09d-e4b7-47ff-811a-7d5931c4a007', 'dz-7e97225b-7e6d-4756-b476-da04a7e80a97') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-64e8c6d8-d8ca-4676-80c1-f487a98da22a', 'di-d395bc1e-ce62-4ade-8d8f-89902ebd3417', 'Largest') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-64e8c6d8-d8ca-4676-80c1-f487a98da22a', 'dz-74f4dc43-aed6-4bae-b059-0922c8bdbfe4', '3/4') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-64e8c6d8-d8ca-4676-80c1-f487a98da22a', 'di-d395bc1e-ce62-4ade-8d8f-89902ebd3417', 'dz-74f4dc43-aed6-4bae-b059-0922c8bdbfe4') ON CONFLICT DO NOTHING;

-- LESSON 2: Equivalent Fractions
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-35-u2-2', 'ch-35-u2', 'Equivalent Fractions', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-35-u2-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-35-u2-2', 1, '/assets/img/placeholder.png', 'Learn about Equivalent Fractions') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-35-u2-2', 'ch-35-u2', 'Exercises: Equivalent Fractions', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-a46100dd-156a-431e-a43d-f10cf9badec5', 'q-l-35-u2-2', 'Which fraction is equivalent to 1/2?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a46100dd-156a-431e-a43d-f10cf9badec5', 'opt-40323223-269b-43ea-bbf6-71acca5519dd', '2/3', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a46100dd-156a-431e-a43d-f10cf9badec5', 'opt-21491255-e733-40ce-9c63-7fa9941b328e', '3/6', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a46100dd-156a-431e-a43d-f10cf9badec5', 'opt-42e5508e-526f-473a-803c-f516b85432fe', '4/9', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a46100dd-156a-431e-a43d-f10cf9badec5', 'opt-72b93bd1-60be-416b-bea1-125e222dada0', '5/12', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-b78249ce-83e0-4abe-8533-b8a8ac31a8b1', 'q-l-35-u2-2', 'True/False: 3/4 is larger than 2/3.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-b78249ce-83e0-4abe-8533-b8a8ac31a8b1', 'opt-0f95c244-0d1c-4f62-86f6-46f7430516cf', 'True - 3/4 (0.75) is greater than 2/3 (0.66).', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-b78249ce-83e0-4abe-8533-b8a8ac31a8b1', 'opt-a518df72-6301-4841-9d73-fe8c2307d8db', 'False - 2/3 is larger because 3 is smaller than 4.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-eb457643-9afb-4878-9eed-525fc2d8f7b5', 'q-l-35-u2-2', 'To add 1/4 and 2/4, you get __/4.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-eb457643-9afb-4878-9eed-525fc2d8f7b5', 0, '3') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-d70a8410-f632-417c-8404-1be00156b8e8', 'q-l-35-u2-2', 'Order the fractions from least to greatest.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-d70a8410-f632-417c-8404-1be00156b8e8', 'di-72abaefa-7f82-46fe-a3f8-aba0b83bfab7', 'Smallest') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-d70a8410-f632-417c-8404-1be00156b8e8', 'dz-0e7e8667-d17e-465a-9378-bbd8f55c27c5', '1/4') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-d70a8410-f632-417c-8404-1be00156b8e8', 'di-72abaefa-7f82-46fe-a3f8-aba0b83bfab7', 'dz-0e7e8667-d17e-465a-9378-bbd8f55c27c5') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-d70a8410-f632-417c-8404-1be00156b8e8', 'di-035f1166-d62c-4649-a081-ce013c413c08', 'Largest') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-d70a8410-f632-417c-8404-1be00156b8e8', 'dz-0aabe092-7316-4b0a-a7f8-2a5d5254a090', '3/4') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-d70a8410-f632-417c-8404-1be00156b8e8', 'di-035f1166-d62c-4649-a081-ce013c413c08', 'dz-0aabe092-7316-4b0a-a7f8-2a5d5254a090') ON CONFLICT DO NOTHING;

-- LESSON 3: Adding and Subtracting Fractions
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-35-u2-3', 'ch-35-u2', 'Adding and Subtracting Fractions', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-35-u2-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-35-u2-3', 1, '/assets/img/placeholder.png', 'Learn about Adding and Subtracting Fractions') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-35-u2-3', 'ch-35-u2', 'Exercises: Adding and Subtracting Fractions', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-34ffbc35-d5fa-4d85-b6a2-3fb0c25edb26', 'q-l-35-u2-3', 'What is 14 - 5?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-34ffbc35-d5fa-4d85-b6a2-3fb0c25edb26', 'opt-bd1da780-8ae1-4d86-9a85-97f7469bf2ba', '7', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-34ffbc35-d5fa-4d85-b6a2-3fb0c25edb26', 'opt-f0e97d77-a291-4251-9988-8d035517a701', '8', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-34ffbc35-d5fa-4d85-b6a2-3fb0c25edb26', 'opt-8ac3999b-1ab3-4714-9692-5c0510306669', '9', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-34ffbc35-d5fa-4d85-b6a2-3fb0c25edb26', 'opt-4d516abf-81ac-4ede-9581-bbaea8b13a39', '10', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-af5bcc67-2608-40de-952c-6d096d0700b0', 'q-l-35-u2-3', 'True/False: Addition is commutative, meaning 3 + 4 is the same as 4 + 3.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-af5bcc67-2608-40de-952c-6d096d0700b0', 'opt-2ce56ed8-4217-4a87-8e41-50e8db5dc9ad', 'True - order does not matter in addition.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-af5bcc67-2608-40de-952c-6d096d0700b0', 'opt-9b3ebaca-b007-40e9-b1b8-d4e945e514b3', 'False - order always matters.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-e7c68394-c206-4c15-98a1-266415900597', 'q-l-35-u2-3', 'Word Problem: You have 15 pencils. You give 6 to a friend. You have __ pencils left.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-e7c68394-c206-4c15-98a1-266415900597', 0, '9') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-142617e2-b907-4d74-804f-71c40f15cc84', 'q-l-35-u2-3', 'Match the equation to the correct answer.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-142617e2-b907-4d74-804f-71c40f15cc84', 'di-93a2198f-c97d-4e17-b6a6-04e4d096a9e1', '10 + 5') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-142617e2-b907-4d74-804f-71c40f15cc84', 'dz-b4cd725b-5d14-4956-81f9-3e1280170c67', '15') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-142617e2-b907-4d74-804f-71c40f15cc84', 'di-93a2198f-c97d-4e17-b6a6-04e4d096a9e1', 'dz-b4cd725b-5d14-4956-81f9-3e1280170c67') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-142617e2-b907-4d74-804f-71c40f15cc84', 'di-20bcbbf7-6745-4e42-8851-9a3256449185', '20 - 5') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-142617e2-b907-4d74-804f-71c40f15cc84', 'dz-497ed0f7-3499-4fb7-a989-298b0612967c', '15') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-142617e2-b907-4d74-804f-71c40f15cc84', 'di-20bcbbf7-6745-4e42-8851-9a3256449185', 'dz-497ed0f7-3499-4fb7-a989-298b0612967c') ON CONFLICT DO NOTHING;

-- UNIT 3: Area and Perimeter
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-35-u3', 'c-35', 'Area and Perimeter', 'Measuring 2D figures.', 100, 2) ON CONFLICT DO NOTHING;

-- LESSON 1: Concept of Area
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-35-u3-1', 'ch-35-u3', 'Concept of Area', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-35-u3-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-35-u3-1', 1, '/assets/img/placeholder.png', 'Learn about Concept of Area') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-35-u3-1', 'ch-35-u3', 'Exercises: Concept of Area', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-a113cc90-1a0a-46bf-9703-d0d425f106e5', 'q-l-35-u3-1', 'What is the formula for the area of a rectangle?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a113cc90-1a0a-46bf-9703-d0d425f106e5', 'opt-cb0e8cc7-ca39-4b76-9b27-19ba7217a97a', 'Length + Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a113cc90-1a0a-46bf-9703-d0d425f106e5', 'opt-1aa6f268-be6a-498f-8c97-d925dea0e631', '2 * (Length + Width)', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a113cc90-1a0a-46bf-9703-d0d425f106e5', 'opt-8d349fc9-4714-4807-ae93-0e3c81ccf372', 'Length * Width', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a113cc90-1a0a-46bf-9703-d0d425f106e5', 'opt-8a87b1e0-8f1f-4e63-bdd9-618b87700c7a', 'Length / Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-1649d0f2-344d-42cf-a99e-42c0cac51512', 'q-l-35-u3-1', 'True/False: All squares are rectangles.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-1649d0f2-344d-42cf-a99e-42c0cac51512', 'opt-d9b0882e-23fd-4fb1-92c8-072841e04207', 'True - a square is a rectangle with equal sides.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-1649d0f2-344d-42cf-a99e-42c0cac51512', 'opt-cb9c3dd9-4634-45f1-a113-f8138b9e46ff', 'False - squares and rectangles are mutually exclusive.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-9163d6c5-14b4-4751-9493-461d0a43acaf', 'q-l-35-u3-1', 'A triangle has __ sides.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-9163d6c5-14b4-4751-9493-461d0a43acaf', 0, '3') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-28a72660-6e96-48d4-9641-f5f53b6afde6', 'q-l-35-u3-1', 'Match the shape to its defining property.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-28a72660-6e96-48d4-9641-f5f53b6afde6', 'di-a2a32723-471d-48f7-a703-a72e4876f213', 'Circle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-28a72660-6e96-48d4-9641-f5f53b6afde6', 'dz-8bad24b9-71b0-41f8-9139-7cc0effe4804', 'No corners') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-28a72660-6e96-48d4-9641-f5f53b6afde6', 'di-a2a32723-471d-48f7-a703-a72e4876f213', 'dz-8bad24b9-71b0-41f8-9139-7cc0effe4804') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-28a72660-6e96-48d4-9641-f5f53b6afde6', 'di-93a87fcb-df4f-4659-9b11-c6255d6032d3', 'Triangle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-28a72660-6e96-48d4-9641-f5f53b6afde6', 'dz-6f0efd37-cadf-4ee3-9bcf-e6239d82fbee', 'Three sides') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-28a72660-6e96-48d4-9641-f5f53b6afde6', 'di-93a87fcb-df4f-4659-9b11-c6255d6032d3', 'dz-6f0efd37-cadf-4ee3-9bcf-e6239d82fbee') ON CONFLICT DO NOTHING;

-- LESSON 2: Calculating Perimeter
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-35-u3-2', 'ch-35-u3', 'Calculating Perimeter', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-35-u3-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-35-u3-2', 1, '/assets/img/placeholder.png', 'Learn about Calculating Perimeter') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-35-u3-2', 'ch-35-u3', 'Exercises: Calculating Perimeter', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-64441221-266f-4aaf-8897-5398054c3ff6', 'q-l-35-u3-2', 'A key concept in Calculating Perimeter is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-64441221-266f-4aaf-8897-5398054c3ff6', 'opt-7df6bafb-b31b-45a0-af50-51f1f1e6d556', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-64441221-266f-4aaf-8897-5398054c3ff6', 'opt-d976133a-3947-4d94-bb6d-1f03da69a2e1', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-64441221-266f-4aaf-8897-5398054c3ff6', 'opt-58c144ec-239e-4276-a038-d198b1e194c7', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-64441221-266f-4aaf-8897-5398054c3ff6', 'opt-85f1bd25-73bf-4aba-a947-57851ac048e1', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-c9d6c425-262b-457e-9880-6619a8392240', 'q-l-35-u3-2', 'True/False: Mastery of Calculating Perimeter requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-c9d6c425-262b-457e-9880-6619a8392240', 'opt-396465c3-7a0d-4ec5-b817-290e9529d822', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-c9d6c425-262b-457e-9880-6619a8392240', 'opt-793b48df-5d1c-45b1-b168-d2e453a3d176', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-c1c056a1-0e44-4bf0-9c02-0be38bdc90ca', 'q-l-35-u3-2', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-c1c056a1-0e44-4bf0-9c02-0be38bdc90ca', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-e025af87-f9ab-4f34-a3ad-78d654c3224b', 'q-l-35-u3-2', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-e025af87-f9ab-4f34-a3ad-78d654c3224b', 'di-d20f6b0b-dd79-4a1b-867e-6d40bd495d81', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-e025af87-f9ab-4f34-a3ad-78d654c3224b', 'dz-5127734c-e4cf-468e-88fe-c910204154d2', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-e025af87-f9ab-4f34-a3ad-78d654c3224b', 'di-d20f6b0b-dd79-4a1b-867e-6d40bd495d81', 'dz-5127734c-e4cf-468e-88fe-c910204154d2') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-e025af87-f9ab-4f34-a3ad-78d654c3224b', 'di-7aa7a2d3-2754-4969-8228-b49f40f3bbc8', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-e025af87-f9ab-4f34-a3ad-78d654c3224b', 'dz-e0a39151-f741-4f47-abeb-d99ca4103fe0', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-e025af87-f9ab-4f34-a3ad-78d654c3224b', 'di-7aa7a2d3-2754-4969-8228-b49f40f3bbc8', 'dz-e0a39151-f741-4f47-abeb-d99ca4103fe0') ON CONFLICT DO NOTHING;

-- LESSON 3: Area of Rectangles
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-35-u3-3', 'ch-35-u3', 'Area of Rectangles', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-35-u3-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-35-u3-3', 1, '/assets/img/placeholder.png', 'Learn about Area of Rectangles') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-35-u3-3', 'ch-35-u3', 'Exercises: Area of Rectangles', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-c44b60c1-a257-46f2-9921-312238efcf0e', 'q-l-35-u3-3', 'What is the formula for the area of a rectangle?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c44b60c1-a257-46f2-9921-312238efcf0e', 'opt-a8c94de6-25b3-4860-b89d-25fe3aec914f', 'Length + Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c44b60c1-a257-46f2-9921-312238efcf0e', 'opt-59aed883-7098-4c9e-81e0-5c50943782ad', '2 * (Length + Width)', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c44b60c1-a257-46f2-9921-312238efcf0e', 'opt-5a23c145-eea7-4a9a-833d-c43ac7c67c9d', 'Length * Width', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c44b60c1-a257-46f2-9921-312238efcf0e', 'opt-220697b5-59cb-4d68-8bed-7993e2bc3c53', 'Length / Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-ff367ee9-9c64-4bf2-8495-f54bf1151990', 'q-l-35-u3-3', 'True/False: All squares are rectangles.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-ff367ee9-9c64-4bf2-8495-f54bf1151990', 'opt-38516cdc-7f05-4549-961c-adf625ab04cd', 'True - a square is a rectangle with equal sides.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-ff367ee9-9c64-4bf2-8495-f54bf1151990', 'opt-b1961510-326a-4318-a194-05f3b30404d1', 'False - squares and rectangles are mutually exclusive.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-c9bd2f3c-a255-4d74-845c-ddc376be94db', 'q-l-35-u3-3', 'A triangle has __ sides.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-c9bd2f3c-a255-4d74-845c-ddc376be94db', 0, '3') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-f42eb2fd-d891-4953-89e7-ddd820b912c7', 'q-l-35-u3-3', 'Match the shape to its defining property.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-f42eb2fd-d891-4953-89e7-ddd820b912c7', 'di-4abf2771-9660-4a02-9016-e8fa3dbec066', 'Circle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-f42eb2fd-d891-4953-89e7-ddd820b912c7', 'dz-bee11381-8114-4743-918b-7d4a5e922d51', 'No corners') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-f42eb2fd-d891-4953-89e7-ddd820b912c7', 'di-4abf2771-9660-4a02-9016-e8fa3dbec066', 'dz-bee11381-8114-4743-918b-7d4a5e922d51') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-f42eb2fd-d891-4953-89e7-ddd820b912c7', 'di-a9a35a8d-9452-4b83-b49f-69e7680a73f0', 'Triangle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-f42eb2fd-d891-4953-89e7-ddd820b912c7', 'dz-e39f6d64-fdd3-4c7a-9046-dc05f5180b38', 'Three sides') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-f42eb2fd-d891-4953-89e7-ddd820b912c7', 'di-a9a35a8d-9452-4b83-b49f-69e7680a73f0', 'dz-e39f6d64-fdd3-4c7a-9046-dc05f5180b38') ON CONFLICT DO NOTHING;

-- ===========================
-- COURSE: Middle School Math (6-8)
-- ===========================
INSERT INTO courses (course_id, title, description, track, level_num, color, glyph, total_lessons, estimated_hours, xp_reward, status) VALUES ('c-68', 'Middle School Math (6-8)', 'Middle School curriculum', 'Middle School', 6, 'plum', '∑', 9, '5h', 1000, 'new') ON CONFLICT DO NOTHING;

-- UNIT 1: Ratios and Proportions
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-68-u1', 'c-68', 'Ratios and Proportions', 'Understanding ratios, rates, and percentages.', 100, 0) ON CONFLICT DO NOTHING;

-- LESSON 1: Intro to Ratios
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-68-u1-1', 'ch-68-u1', 'Intro to Ratios', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-68-u1-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-68-u1-1', 1, '/assets/img/placeholder.png', 'Learn about Intro to Ratios') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-68-u1-1', 'ch-68-u1', 'Exercises: Intro to Ratios', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-80699518-e96c-45db-abc5-314bb5fb98cf', 'q-l-68-u1-1', 'If the ratio of boys to girls is 2:3 and there are 10 boys, how many girls are there?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-80699518-e96c-45db-abc5-314bb5fb98cf', 'opt-e3d343fe-c83b-454e-af1e-9b1cc5263346', '10', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-80699518-e96c-45db-abc5-314bb5fb98cf', 'opt-76a9dae2-266e-4103-bd9f-35e7c58b157c', '12', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-80699518-e96c-45db-abc5-314bb5fb98cf', 'opt-2ee51d87-e85c-4915-8589-74854ac8ad93', '15', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-80699518-e96c-45db-abc5-314bb5fb98cf', 'opt-47e5920d-41c8-4329-8e0d-27079d971d29', '20', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-3cfd522e-1c19-4414-90f3-5029eb554f7b', 'q-l-68-u1-1', 'True/False: A percentage is basically a ratio out of 100.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-3cfd522e-1c19-4414-90f3-5029eb554f7b', 'opt-d90d3496-2f0c-404b-b940-c4a230d48069', 'True - percent means per 100.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-3cfd522e-1c19-4414-90f3-5029eb554f7b', 'opt-6f0ef90d-e8da-482f-846a-6aa02bb5e8b4', 'False - percentages have no relation to ratios.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-a8600af0-68d2-4032-b1d0-23efa37f407c', 'q-l-68-u1-1', 'If a car travels 120 miles in 2 hours, its unit rate is __ mph.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-a8600af0-68d2-4032-b1d0-23efa37f407c', 0, '60') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-b66fe4a6-f305-4123-8b74-c4733cbf706c', 'q-l-68-u1-1', 'Match the fraction to its percentage.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-b66fe4a6-f305-4123-8b74-c4733cbf706c', 'di-f3bbd679-b04f-4fcf-bcb5-4621c09de00b', '1/2') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-b66fe4a6-f305-4123-8b74-c4733cbf706c', 'dz-b39d1c5a-1999-47de-843e-90901da72c9c', '50%') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-b66fe4a6-f305-4123-8b74-c4733cbf706c', 'di-f3bbd679-b04f-4fcf-bcb5-4621c09de00b', 'dz-b39d1c5a-1999-47de-843e-90901da72c9c') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-b66fe4a6-f305-4123-8b74-c4733cbf706c', 'di-b9fd7d61-bf11-4791-818e-1af248457159', '1/4') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-b66fe4a6-f305-4123-8b74-c4733cbf706c', 'dz-e010c6f7-898e-4301-a3c2-f7647ba2b25c', '25%') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-b66fe4a6-f305-4123-8b74-c4733cbf706c', 'di-b9fd7d61-bf11-4791-818e-1af248457159', 'dz-e010c6f7-898e-4301-a3c2-f7647ba2b25c') ON CONFLICT DO NOTHING;

-- LESSON 2: Unit Rates
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-68-u1-2', 'ch-68-u1', 'Unit Rates', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-68-u1-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-68-u1-2', 1, '/assets/img/placeholder.png', 'Learn about Unit Rates') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-68-u1-2', 'ch-68-u1', 'Exercises: Unit Rates', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-b03de0ed-5e10-4929-9ccc-5a34d1b86dae', 'q-l-68-u1-2', 'If the ratio of boys to girls is 2:3 and there are 10 boys, how many girls are there?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-b03de0ed-5e10-4929-9ccc-5a34d1b86dae', 'opt-a5f8c2ee-f1da-4a2b-9eac-ae78e4225414', '10', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-b03de0ed-5e10-4929-9ccc-5a34d1b86dae', 'opt-de6dee12-20dd-44dd-b93d-811edb6e2f68', '12', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-b03de0ed-5e10-4929-9ccc-5a34d1b86dae', 'opt-4857c931-6f6a-4497-9e73-d4ff3e756d2c', '15', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-b03de0ed-5e10-4929-9ccc-5a34d1b86dae', 'opt-7dec9a8f-729f-47e6-97f8-75f9943dae3b', '20', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-4ad9a020-7757-4f71-9c84-0c4aad684692', 'q-l-68-u1-2', 'True/False: A percentage is basically a ratio out of 100.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-4ad9a020-7757-4f71-9c84-0c4aad684692', 'opt-0ef72e26-4a9f-47b0-ad9c-0d61a9310a1c', 'True - percent means per 100.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-4ad9a020-7757-4f71-9c84-0c4aad684692', 'opt-d78734ff-7cfc-4495-bdf1-1580b802c965', 'False - percentages have no relation to ratios.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-2bda83e4-8945-4106-b766-d4449410acf0', 'q-l-68-u1-2', 'If a car travels 120 miles in 2 hours, its unit rate is __ mph.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-2bda83e4-8945-4106-b766-d4449410acf0', 0, '60') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-34caa7b4-c6eb-4f7d-8679-99322354e1ba', 'q-l-68-u1-2', 'Match the fraction to its percentage.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-34caa7b4-c6eb-4f7d-8679-99322354e1ba', 'di-86bacd3c-66b9-4deb-adbc-7079d34d14c5', '1/2') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-34caa7b4-c6eb-4f7d-8679-99322354e1ba', 'dz-d0642fae-f84d-45a1-b58b-813a4446a955', '50%') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-34caa7b4-c6eb-4f7d-8679-99322354e1ba', 'di-86bacd3c-66b9-4deb-adbc-7079d34d14c5', 'dz-d0642fae-f84d-45a1-b58b-813a4446a955') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-34caa7b4-c6eb-4f7d-8679-99322354e1ba', 'di-5bd43d23-6445-49c2-9517-425b47e540af', '1/4') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-34caa7b4-c6eb-4f7d-8679-99322354e1ba', 'dz-394bfc45-c5ec-472f-9f81-e91eacbe469b', '25%') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-34caa7b4-c6eb-4f7d-8679-99322354e1ba', 'di-5bd43d23-6445-49c2-9517-425b47e540af', 'dz-394bfc45-c5ec-472f-9f81-e91eacbe469b') ON CONFLICT DO NOTHING;

-- LESSON 3: Percentages
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-68-u1-3', 'ch-68-u1', 'Percentages', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-68-u1-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-68-u1-3', 1, '/assets/img/placeholder.png', 'Learn about Percentages') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-68-u1-3', 'ch-68-u1', 'Exercises: Percentages', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-126c5299-1f1d-433f-a2fa-88fec80232e1', 'q-l-68-u1-3', 'A key concept in Percentages is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-126c5299-1f1d-433f-a2fa-88fec80232e1', 'opt-2c271e89-f7bc-48f7-a80d-3c7818b29968', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-126c5299-1f1d-433f-a2fa-88fec80232e1', 'opt-5a10863e-9d6a-4c75-acf2-fe42a8717afb', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-126c5299-1f1d-433f-a2fa-88fec80232e1', 'opt-0a10e809-f21f-44aa-86f7-0db74875c69e', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-126c5299-1f1d-433f-a2fa-88fec80232e1', 'opt-fa802ba8-0c1a-4044-bf77-f512f9fe3d94', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-2a820712-afcd-48c8-950b-62ba31661969', 'q-l-68-u1-3', 'True/False: Mastery of Percentages requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-2a820712-afcd-48c8-950b-62ba31661969', 'opt-dea9d76a-1a70-4db4-a713-2693cd677ef3', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-2a820712-afcd-48c8-950b-62ba31661969', 'opt-6f2d7116-2398-4f63-bb88-e894be4e5ca3', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-ed97d2f2-6b17-4dc1-9361-00b813848ccc', 'q-l-68-u1-3', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-ed97d2f2-6b17-4dc1-9361-00b813848ccc', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-aeecba71-2a39-4801-9a22-194bfcde0d38', 'q-l-68-u1-3', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-aeecba71-2a39-4801-9a22-194bfcde0d38', 'di-ba7de3b9-e8a6-4b3f-a679-9e400a7c7c05', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-aeecba71-2a39-4801-9a22-194bfcde0d38', 'dz-477408c4-c275-4909-a361-ab7066a97b86', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-aeecba71-2a39-4801-9a22-194bfcde0d38', 'di-ba7de3b9-e8a6-4b3f-a679-9e400a7c7c05', 'dz-477408c4-c275-4909-a361-ab7066a97b86') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-aeecba71-2a39-4801-9a22-194bfcde0d38', 'di-5f0985ea-b1b4-455b-9aae-6fd5d2af91e3', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-aeecba71-2a39-4801-9a22-194bfcde0d38', 'dz-b03c9f3e-2595-4eef-bd3b-ab88e3e77c95', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-aeecba71-2a39-4801-9a22-194bfcde0d38', 'di-5f0985ea-b1b4-455b-9aae-6fd5d2af91e3', 'dz-b03c9f3e-2595-4eef-bd3b-ab88e3e77c95') ON CONFLICT DO NOTHING;

-- UNIT 2: Expressions and Equations
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-68-u2', 'c-68', 'Expressions and Equations', 'Variables, expressions, and solving equations.', 100, 1) ON CONFLICT DO NOTHING;

-- LESSON 1: Evaluating Expressions
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-68-u2-1', 'ch-68-u2', 'Evaluating Expressions', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-68-u2-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-68-u2-1', 1, '/assets/img/placeholder.png', 'Learn about Evaluating Expressions') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-68-u2-1', 'ch-68-u2', 'Exercises: Evaluating Expressions', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-3a48426f-9a4a-40ee-b263-4ef06e200455', 'q-l-68-u2-1', 'A key concept in Evaluating Expressions is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-3a48426f-9a4a-40ee-b263-4ef06e200455', 'opt-eca70c95-185d-4864-ae06-c356b559eefe', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-3a48426f-9a4a-40ee-b263-4ef06e200455', 'opt-896e64c4-fb9b-467b-bbac-157bbcfbb862', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-3a48426f-9a4a-40ee-b263-4ef06e200455', 'opt-6c99c156-ff11-4f3c-86ff-fe0696578d63', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-3a48426f-9a4a-40ee-b263-4ef06e200455', 'opt-61404649-aea0-40cb-a50a-3730ad031c58', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-93db0109-f470-4966-a933-3570dff57cd2', 'q-l-68-u2-1', 'True/False: Mastery of Evaluating Expressions requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-93db0109-f470-4966-a933-3570dff57cd2', 'opt-705e75d4-a17c-4735-a52a-9f07842b821e', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-93db0109-f470-4966-a933-3570dff57cd2', 'opt-c711cbf9-75c8-42af-b8bb-980aba67bfe3', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-0174889b-434a-4e42-aefc-088851dbddae', 'q-l-68-u2-1', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-0174889b-434a-4e42-aefc-088851dbddae', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-04c5f331-d8f2-405b-882e-e66170160a91', 'q-l-68-u2-1', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-04c5f331-d8f2-405b-882e-e66170160a91', 'di-3d5195cb-3e25-49ef-8274-9b1b73cd0c41', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-04c5f331-d8f2-405b-882e-e66170160a91', 'dz-a7299c13-4a29-438d-928c-e7a27fa82346', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-04c5f331-d8f2-405b-882e-e66170160a91', 'di-3d5195cb-3e25-49ef-8274-9b1b73cd0c41', 'dz-a7299c13-4a29-438d-928c-e7a27fa82346') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-04c5f331-d8f2-405b-882e-e66170160a91', 'di-e873f7e5-a2a8-45ad-8530-23c7c0916eeb', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-04c5f331-d8f2-405b-882e-e66170160a91', 'dz-bc22f130-720f-4d6a-87db-b3f01725cfff', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-04c5f331-d8f2-405b-882e-e66170160a91', 'di-e873f7e5-a2a8-45ad-8530-23c7c0916eeb', 'dz-bc22f130-720f-4d6a-87db-b3f01725cfff') ON CONFLICT DO NOTHING;

-- LESSON 2: Solving One-Step Equations
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-68-u2-2', 'ch-68-u2', 'Solving One-Step Equations', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-68-u2-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-68-u2-2', 1, '/assets/img/placeholder.png', 'Learn about Solving One-Step Equations') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-68-u2-2', 'ch-68-u2', 'Exercises: Solving One-Step Equations', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-f0b440cb-c949-48d2-8283-6474881212b1', 'q-l-68-u2-2', 'Solve for x: 2x + 5 = 13', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-f0b440cb-c949-48d2-8283-6474881212b1', 'opt-b99d46b5-f11f-4a7d-844e-56c922b5ba59', '3', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-f0b440cb-c949-48d2-8283-6474881212b1', 'opt-259b7bd8-3c4e-4afb-b5d5-a3028bce8f7f', '4', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-f0b440cb-c949-48d2-8283-6474881212b1', 'opt-dac1ecdc-a95d-47fd-9427-247755474112', '5', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-f0b440cb-c949-48d2-8283-6474881212b1', 'opt-32f8ae26-941a-4a7f-8d63-9691ef8fba44', '6', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-8305a3eb-6316-4793-8232-346566207883', 'q-l-68-u2-2', 'True/False: The graph of a quadratic function is a straight line.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-8305a3eb-6316-4793-8232-346566207883', 'opt-b1b128f7-1e5f-44d2-a1e2-6e613da4f6c5', 'True - quadratics are linear.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-8305a3eb-6316-4793-8232-346566207883', 'opt-4c9688a6-ef8e-45da-b533-cbeeb509a48e', 'False - the graph is a parabola.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-f9e0c2ca-9cee-424e-934c-bd40eca7fa76', 'q-l-68-u2-2', 'If f(x) = 3x - 2, then f(4) equals __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-f9e0c2ca-9cee-424e-934c-bd40eca7fa76', 0, '10') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-20064545-f6b4-462e-90ae-ce553e523383', 'q-l-68-u2-2', 'Match the equation type to its graph shape.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-20064545-f6b4-462e-90ae-ce553e523383', 'di-85821319-f933-4e12-abb1-a870684b45d3', 'y = mx + b') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-20064545-f6b4-462e-90ae-ce553e523383', 'dz-198272b3-4ae7-4ee1-a82a-573cf8351094', 'Line') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-20064545-f6b4-462e-90ae-ce553e523383', 'di-85821319-f933-4e12-abb1-a870684b45d3', 'dz-198272b3-4ae7-4ee1-a82a-573cf8351094') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-20064545-f6b4-462e-90ae-ce553e523383', 'di-fdba3d5d-9af2-433d-b43f-7b6da949ad9a', 'y = x^2') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-20064545-f6b4-462e-90ae-ce553e523383', 'dz-bc973f0e-801c-44cc-9f22-af6cef0ca244', 'Parabola') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-20064545-f6b4-462e-90ae-ce553e523383', 'di-fdba3d5d-9af2-433d-b43f-7b6da949ad9a', 'dz-bc973f0e-801c-44cc-9f22-af6cef0ca244') ON CONFLICT DO NOTHING;

-- LESSON 3: Inequalities
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-68-u2-3', 'ch-68-u2', 'Inequalities', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-68-u2-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-68-u2-3', 1, '/assets/img/placeholder.png', 'Learn about Inequalities') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-68-u2-3', 'ch-68-u2', 'Exercises: Inequalities', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-ec3de65f-e5e4-4fc6-952d-ee55a6e47fe8', 'q-l-68-u2-3', 'A key concept in Inequalities is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-ec3de65f-e5e4-4fc6-952d-ee55a6e47fe8', 'opt-cca6e7be-dd94-49bc-b5d1-c03c954cb083', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-ec3de65f-e5e4-4fc6-952d-ee55a6e47fe8', 'opt-c621d2f6-fcc0-4329-acba-163263ac92e0', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-ec3de65f-e5e4-4fc6-952d-ee55a6e47fe8', 'opt-e5723e25-6bef-4cc8-92c2-bb78948b9b71', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-ec3de65f-e5e4-4fc6-952d-ee55a6e47fe8', 'opt-3845c0e3-0db1-41df-bdbb-ecbd1a82379b', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-d9f29657-2a4a-41cd-b8d4-bf2bf7d9a3ba', 'q-l-68-u2-3', 'True/False: Mastery of Inequalities requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-d9f29657-2a4a-41cd-b8d4-bf2bf7d9a3ba', 'opt-07547fba-6942-446a-b6cb-bb4a58e155bb', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-d9f29657-2a4a-41cd-b8d4-bf2bf7d9a3ba', 'opt-9fc624bd-7c12-40be-96fb-a7de3906425b', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-416e1f57-b583-496c-8edb-6ae028104158', 'q-l-68-u2-3', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-416e1f57-b583-496c-8edb-6ae028104158', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-bd2695d0-f2df-4341-85e8-2fbfa2b51e75', 'q-l-68-u2-3', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-bd2695d0-f2df-4341-85e8-2fbfa2b51e75', 'di-216fb8fc-644e-4ec6-8edd-d6fb2caa1cad', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-bd2695d0-f2df-4341-85e8-2fbfa2b51e75', 'dz-44d0812a-ad42-4656-942a-42ac79698e0a', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-bd2695d0-f2df-4341-85e8-2fbfa2b51e75', 'di-216fb8fc-644e-4ec6-8edd-d6fb2caa1cad', 'dz-44d0812a-ad42-4656-942a-42ac79698e0a') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-bd2695d0-f2df-4341-85e8-2fbfa2b51e75', 'di-eb44de22-0f1a-4465-a5df-c75ec60895de', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-bd2695d0-f2df-4341-85e8-2fbfa2b51e75', 'dz-ec1a3d8a-7d06-454a-834e-aaaf6dc7985d', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-bd2695d0-f2df-4341-85e8-2fbfa2b51e75', 'di-eb44de22-0f1a-4465-a5df-c75ec60895de', 'dz-ec1a3d8a-7d06-454a-834e-aaaf6dc7985d') ON CONFLICT DO NOTHING;

-- UNIT 3: Geometry and Volume
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-68-u3', 'c-68', 'Geometry and Volume', 'Area of polygons, surface area, and volume.', 100, 2) ON CONFLICT DO NOTHING;

-- LESSON 1: Area of Triangles and Quadrilaterals
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-68-u3-1', 'ch-68-u3', 'Area of Triangles and Quadrilaterals', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-68-u3-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-68-u3-1', 1, '/assets/img/placeholder.png', 'Learn about Area of Triangles and Quadrilaterals') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-68-u3-1', 'ch-68-u3', 'Exercises: Area of Triangles and Quadrilaterals', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-d8a660c6-e208-40b5-8b84-a2a78df030d2', 'q-l-68-u3-1', 'What is the formula for the area of a rectangle?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d8a660c6-e208-40b5-8b84-a2a78df030d2', 'opt-5fcf3d92-99b1-4aaf-b9f1-31e741e8240f', 'Length + Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d8a660c6-e208-40b5-8b84-a2a78df030d2', 'opt-f005eb5b-f4c7-4a3f-af03-d8f360099248', '2 * (Length + Width)', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d8a660c6-e208-40b5-8b84-a2a78df030d2', 'opt-97505e6e-c946-4e9a-8b23-220dd6412af8', 'Length * Width', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d8a660c6-e208-40b5-8b84-a2a78df030d2', 'opt-79c524b4-19e1-4024-9e8c-bbe8a104bb50', 'Length / Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-bb09615b-f4d7-4ff9-a1e9-ac8fc6c1571d', 'q-l-68-u3-1', 'True/False: All squares are rectangles.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-bb09615b-f4d7-4ff9-a1e9-ac8fc6c1571d', 'opt-3f9d8fd4-d334-4ad1-a012-5aa46585d7a9', 'True - a square is a rectangle with equal sides.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-bb09615b-f4d7-4ff9-a1e9-ac8fc6c1571d', 'opt-41ff173f-e685-40b4-bc10-cffd50365bcc', 'False - squares and rectangles are mutually exclusive.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-da7d2223-d637-4395-8a4b-2f35bd76efcf', 'q-l-68-u3-1', 'A triangle has __ sides.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-da7d2223-d637-4395-8a4b-2f35bd76efcf', 0, '3') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-2b59569e-d9f2-4a16-be4f-33871606e427', 'q-l-68-u3-1', 'Match the shape to its defining property.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-2b59569e-d9f2-4a16-be4f-33871606e427', 'di-d46d7f26-1764-4151-b9a9-46efc21b7821', 'Circle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-2b59569e-d9f2-4a16-be4f-33871606e427', 'dz-81463486-5dc4-4cf9-9b96-47cbb2dffebf', 'No corners') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-2b59569e-d9f2-4a16-be4f-33871606e427', 'di-d46d7f26-1764-4151-b9a9-46efc21b7821', 'dz-81463486-5dc4-4cf9-9b96-47cbb2dffebf') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-2b59569e-d9f2-4a16-be4f-33871606e427', 'di-0bdd9b84-2b78-4c00-997a-0d0046ee2f79', 'Triangle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-2b59569e-d9f2-4a16-be4f-33871606e427', 'dz-feca5c71-b4cf-4c89-bedf-ad37f0d39480', 'Three sides') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-2b59569e-d9f2-4a16-be4f-33871606e427', 'di-0bdd9b84-2b78-4c00-997a-0d0046ee2f79', 'dz-feca5c71-b4cf-4c89-bedf-ad37f0d39480') ON CONFLICT DO NOTHING;

-- LESSON 2: Surface Area of Prisms
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-68-u3-2', 'ch-68-u3', 'Surface Area of Prisms', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-68-u3-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-68-u3-2', 1, '/assets/img/placeholder.png', 'Learn about Surface Area of Prisms') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-68-u3-2', 'ch-68-u3', 'Exercises: Surface Area of Prisms', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-0a1cd094-dac7-4ba2-8c98-fffc5c412671', 'q-l-68-u3-2', 'What is the formula for the area of a rectangle?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-0a1cd094-dac7-4ba2-8c98-fffc5c412671', 'opt-11ba3d94-0f72-4059-86cc-b54ced20fa97', 'Length + Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-0a1cd094-dac7-4ba2-8c98-fffc5c412671', 'opt-bfd7f495-06bd-458d-8641-f399764f3b7b', '2 * (Length + Width)', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-0a1cd094-dac7-4ba2-8c98-fffc5c412671', 'opt-6e86062f-868a-40ac-b226-1d1fd3b3cd5d', 'Length * Width', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-0a1cd094-dac7-4ba2-8c98-fffc5c412671', 'opt-b69fee12-6d03-4d5f-94d1-3ec41d2548b0', 'Length / Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-13e97db4-e702-4ca6-9779-d3cb6a6c39c2', 'q-l-68-u3-2', 'True/False: All squares are rectangles.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-13e97db4-e702-4ca6-9779-d3cb6a6c39c2', 'opt-c1c68731-3137-4eb6-9956-1f36ea642e0d', 'True - a square is a rectangle with equal sides.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-13e97db4-e702-4ca6-9779-d3cb6a6c39c2', 'opt-1063d616-7db5-40d5-b4e4-a6398d4defb7', 'False - squares and rectangles are mutually exclusive.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-9ebe9b0a-ac1b-4ffb-9f19-8eafe9026f64', 'q-l-68-u3-2', 'A triangle has __ sides.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-9ebe9b0a-ac1b-4ffb-9f19-8eafe9026f64', 0, '3') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-618f8870-6932-4720-9b93-bc87901f51b1', 'q-l-68-u3-2', 'Match the shape to its defining property.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-618f8870-6932-4720-9b93-bc87901f51b1', 'di-7668261a-f4ee-41f2-9acd-f4c43a009a22', 'Circle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-618f8870-6932-4720-9b93-bc87901f51b1', 'dz-4baad997-3504-42a0-8b5f-cebbcb493bd1', 'No corners') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-618f8870-6932-4720-9b93-bc87901f51b1', 'di-7668261a-f4ee-41f2-9acd-f4c43a009a22', 'dz-4baad997-3504-42a0-8b5f-cebbcb493bd1') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-618f8870-6932-4720-9b93-bc87901f51b1', 'di-8939e541-b2ac-4129-9a2e-9e6afa1e9c55', 'Triangle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-618f8870-6932-4720-9b93-bc87901f51b1', 'dz-7c4645b7-87cf-4293-93c6-26bf5aaf6c07', 'Three sides') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-618f8870-6932-4720-9b93-bc87901f51b1', 'di-8939e541-b2ac-4129-9a2e-9e6afa1e9c55', 'dz-7c4645b7-87cf-4293-93c6-26bf5aaf6c07') ON CONFLICT DO NOTHING;

-- LESSON 3: Volume of Prisms
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-68-u3-3', 'ch-68-u3', 'Volume of Prisms', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-68-u3-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-68-u3-3', 1, '/assets/img/placeholder.png', 'Learn about Volume of Prisms') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-68-u3-3', 'ch-68-u3', 'Exercises: Volume of Prisms', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-a01e3422-8af7-46cd-a2c2-635fbea152cd', 'q-l-68-u3-3', 'What is the formula for the area of a rectangle?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a01e3422-8af7-46cd-a2c2-635fbea152cd', 'opt-cf1c95d6-c646-48b4-97af-216137f3fac6', 'Length + Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a01e3422-8af7-46cd-a2c2-635fbea152cd', 'opt-b408bd8a-bfaa-46ef-8749-9f9832d6fef1', '2 * (Length + Width)', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a01e3422-8af7-46cd-a2c2-635fbea152cd', 'opt-d1f1ed1a-43f7-4534-9ecc-953084287cce', 'Length * Width', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-a01e3422-8af7-46cd-a2c2-635fbea152cd', 'opt-2a846f4f-52f9-4666-b39f-fb6fdfd7207d', 'Length / Width', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-d975bf3a-ed04-4ef8-b282-9fea0ffa0662', 'q-l-68-u3-3', 'True/False: All squares are rectangles.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-d975bf3a-ed04-4ef8-b282-9fea0ffa0662', 'opt-4e03729c-51db-46ef-88b8-5879723130fe', 'True - a square is a rectangle with equal sides.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-d975bf3a-ed04-4ef8-b282-9fea0ffa0662', 'opt-9bd6e3a3-5b89-4802-8987-145c19117cb5', 'False - squares and rectangles are mutually exclusive.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-248534e7-b861-4065-8a81-34fd03b0830a', 'q-l-68-u3-3', 'A triangle has __ sides.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-248534e7-b861-4065-8a81-34fd03b0830a', 0, '3') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-1d6ff2ae-e6e8-421a-af61-beb8d4ec1cd0', 'q-l-68-u3-3', 'Match the shape to its defining property.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-1d6ff2ae-e6e8-421a-af61-beb8d4ec1cd0', 'di-ef581060-25c0-4e98-aac0-342776e25562', 'Circle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-1d6ff2ae-e6e8-421a-af61-beb8d4ec1cd0', 'dz-40f28747-25f5-42df-bfd0-25789f880150', 'No corners') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-1d6ff2ae-e6e8-421a-af61-beb8d4ec1cd0', 'di-ef581060-25c0-4e98-aac0-342776e25562', 'dz-40f28747-25f5-42df-bfd0-25789f880150') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-1d6ff2ae-e6e8-421a-af61-beb8d4ec1cd0', 'di-1bac7378-3632-4067-bf08-d636a5462c9f', 'Triangle') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-1d6ff2ae-e6e8-421a-af61-beb8d4ec1cd0', 'dz-4fb40725-0694-439c-8391-b5afd3ae1c26', 'Three sides') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-1d6ff2ae-e6e8-421a-af61-beb8d4ec1cd0', 'di-1bac7378-3632-4067-bf08-d636a5462c9f', 'dz-4fb40725-0694-439c-8391-b5afd3ae1c26') ON CONFLICT DO NOTHING;

-- ===========================
-- COURSE: Algebra 1
-- ===========================
INSERT INTO courses (course_id, title, description, track, level_num, color, glyph, total_lessons, estimated_hours, xp_reward, status) VALUES ('c-alg1', 'Algebra 1', 'High School curriculum', 'High School', 9, 'amber', '∑', 9, '5h', 1000, 'new') ON CONFLICT DO NOTHING;

-- UNIT 1: Linear Equations
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-alg1-u1', 'c-alg1', 'Linear Equations', 'Solving and graphing linear equations.', 100, 0) ON CONFLICT DO NOTHING;

-- LESSON 1: Graphing Lines
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-alg1-u1-1', 'ch-alg1-u1', 'Graphing Lines', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-alg1-u1-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-alg1-u1-1', 1, '/assets/img/placeholder.png', 'Learn about Graphing Lines') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-alg1-u1-1', 'ch-alg1-u1', 'Exercises: Graphing Lines', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-fd0d4706-8cdf-4e5a-aabc-03c29c1aac67', 'q-l-alg1-u1-1', 'A key concept in Graphing Lines is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-fd0d4706-8cdf-4e5a-aabc-03c29c1aac67', 'opt-b7364452-5c64-4172-aee7-27a745d0338f', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-fd0d4706-8cdf-4e5a-aabc-03c29c1aac67', 'opt-ba68e3c7-ba3c-45e7-bc9b-888d4195a1f8', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-fd0d4706-8cdf-4e5a-aabc-03c29c1aac67', 'opt-2e536ab2-b9f8-4754-9978-cd51c6789829', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-fd0d4706-8cdf-4e5a-aabc-03c29c1aac67', 'opt-1c10e844-4e0c-48f6-adb8-34fe4b559c2f', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-9181c04a-07ad-42cf-8ca8-0fcea99e5334', 'q-l-alg1-u1-1', 'True/False: Mastery of Graphing Lines requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-9181c04a-07ad-42cf-8ca8-0fcea99e5334', 'opt-b3fcf5c0-88fc-474e-a240-13cc6e0eddae', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-9181c04a-07ad-42cf-8ca8-0fcea99e5334', 'opt-0367cc00-f8ba-48f4-8936-3fcd19a66e2c', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-32ff169e-39c3-4a5d-90a8-704db381ac1f', 'q-l-alg1-u1-1', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-32ff169e-39c3-4a5d-90a8-704db381ac1f', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-04415606-bf18-4e66-a81c-1af7475701ea', 'q-l-alg1-u1-1', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-04415606-bf18-4e66-a81c-1af7475701ea', 'di-a18a8bf5-429c-4caa-afcb-ebced36203dc', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-04415606-bf18-4e66-a81c-1af7475701ea', 'dz-ef06819e-e725-4354-9ddb-a96ec3dcb643', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-04415606-bf18-4e66-a81c-1af7475701ea', 'di-a18a8bf5-429c-4caa-afcb-ebced36203dc', 'dz-ef06819e-e725-4354-9ddb-a96ec3dcb643') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-04415606-bf18-4e66-a81c-1af7475701ea', 'di-f7314c0a-9f06-457c-b842-e9b5b94e464b', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-04415606-bf18-4e66-a81c-1af7475701ea', 'dz-e0ff7b94-de47-43a8-88a5-27c84ec8e871', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-04415606-bf18-4e66-a81c-1af7475701ea', 'di-f7314c0a-9f06-457c-b842-e9b5b94e464b', 'dz-e0ff7b94-de47-43a8-88a5-27c84ec8e871') ON CONFLICT DO NOTHING;

-- LESSON 2: Slope-Intercept Form
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-alg1-u1-2', 'ch-alg1-u1', 'Slope-Intercept Form', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-alg1-u1-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-alg1-u1-2', 1, '/assets/img/placeholder.png', 'Learn about Slope-Intercept Form') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-alg1-u1-2', 'ch-alg1-u1', 'Exercises: Slope-Intercept Form', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-02a57dde-9a6b-4def-abd3-3a427c57d792', 'q-l-alg1-u1-2', 'A key concept in Slope-Intercept Form is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-02a57dde-9a6b-4def-abd3-3a427c57d792', 'opt-6856e43d-f331-41be-a240-adc87077858d', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-02a57dde-9a6b-4def-abd3-3a427c57d792', 'opt-2611bae7-a242-4704-9655-f2920566a856', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-02a57dde-9a6b-4def-abd3-3a427c57d792', 'opt-277544e2-7cd7-47dc-8fa6-e857b060a04a', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-02a57dde-9a6b-4def-abd3-3a427c57d792', 'opt-45b338e1-3e62-41c0-b9e7-c6ae60eef636', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-ea4f45f7-3908-424a-80ba-5b638f795659', 'q-l-alg1-u1-2', 'True/False: Mastery of Slope-Intercept Form requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-ea4f45f7-3908-424a-80ba-5b638f795659', 'opt-a51c163e-1f19-4c9e-9091-96dd4b5bbe26', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-ea4f45f7-3908-424a-80ba-5b638f795659', 'opt-8f426fad-b0d5-4aa2-8b51-488e618293fb', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-59b64939-cffb-479f-afed-c271856d5b17', 'q-l-alg1-u1-2', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-59b64939-cffb-479f-afed-c271856d5b17', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-1d8ea839-e2b2-4bb1-8a23-9f0348fef43c', 'q-l-alg1-u1-2', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-1d8ea839-e2b2-4bb1-8a23-9f0348fef43c', 'di-fdee713a-79ad-4908-b407-ca075f359ed6', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-1d8ea839-e2b2-4bb1-8a23-9f0348fef43c', 'dz-30c51483-22c5-4287-b9b9-afbd2ffbc70a', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-1d8ea839-e2b2-4bb1-8a23-9f0348fef43c', 'di-fdee713a-79ad-4908-b407-ca075f359ed6', 'dz-30c51483-22c5-4287-b9b9-afbd2ffbc70a') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-1d8ea839-e2b2-4bb1-8a23-9f0348fef43c', 'di-03aa5d99-711b-417a-9d6c-e8f66c9eb74f', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-1d8ea839-e2b2-4bb1-8a23-9f0348fef43c', 'dz-979a6ba9-ccac-4497-b3b0-b5d1419dd214', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-1d8ea839-e2b2-4bb1-8a23-9f0348fef43c', 'di-03aa5d99-711b-417a-9d6c-e8f66c9eb74f', 'dz-979a6ba9-ccac-4497-b3b0-b5d1419dd214') ON CONFLICT DO NOTHING;

-- LESSON 3: Systems of Equations
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-alg1-u1-3', 'ch-alg1-u1', 'Systems of Equations', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-alg1-u1-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-alg1-u1-3', 1, '/assets/img/placeholder.png', 'Learn about Systems of Equations') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-alg1-u1-3', 'ch-alg1-u1', 'Exercises: Systems of Equations', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-d03f31e8-f0d9-4db5-a08e-62bc54388335', 'q-l-alg1-u1-3', 'Solve for x: 2x + 5 = 13', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d03f31e8-f0d9-4db5-a08e-62bc54388335', 'opt-6624d0f6-5735-4977-840a-8f67fd318935', '3', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d03f31e8-f0d9-4db5-a08e-62bc54388335', 'opt-145b88ea-70fa-4ebd-89bb-dfb91b08a868', '4', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d03f31e8-f0d9-4db5-a08e-62bc54388335', 'opt-9d5012bb-22d9-4ca2-b842-a237bf1d7815', '5', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d03f31e8-f0d9-4db5-a08e-62bc54388335', 'opt-962a5669-b3ed-4102-8aca-ea86c6b7f1cf', '6', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-da022e42-f56e-4a2f-a31d-231a37b4ec96', 'q-l-alg1-u1-3', 'True/False: The graph of a quadratic function is a straight line.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-da022e42-f56e-4a2f-a31d-231a37b4ec96', 'opt-385ef60d-6f12-4bbc-9c39-03a119d6d51f', 'True - quadratics are linear.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-da022e42-f56e-4a2f-a31d-231a37b4ec96', 'opt-c13041a3-721c-425c-972b-d1f92b56cd03', 'False - the graph is a parabola.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-f177b5bb-0160-440a-9a85-bf0f15f69a51', 'q-l-alg1-u1-3', 'If f(x) = 3x - 2, then f(4) equals __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-f177b5bb-0160-440a-9a85-bf0f15f69a51', 0, '10') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-cc85b979-d1a4-45f5-9ba3-3c6062cef360', 'q-l-alg1-u1-3', 'Match the equation type to its graph shape.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-cc85b979-d1a4-45f5-9ba3-3c6062cef360', 'di-1b265862-0ad8-49bf-8a20-20206b42c7af', 'y = mx + b') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-cc85b979-d1a4-45f5-9ba3-3c6062cef360', 'dz-f0f37a2a-335c-441b-80dc-470bb742d979', 'Line') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-cc85b979-d1a4-45f5-9ba3-3c6062cef360', 'di-1b265862-0ad8-49bf-8a20-20206b42c7af', 'dz-f0f37a2a-335c-441b-80dc-470bb742d979') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-cc85b979-d1a4-45f5-9ba3-3c6062cef360', 'di-4e0a1897-bde3-4ef8-86c0-701c08ce5c46', 'y = x^2') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-cc85b979-d1a4-45f5-9ba3-3c6062cef360', 'dz-2c5e2eee-57df-4e46-9920-8d00304a5ac9', 'Parabola') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-cc85b979-d1a4-45f5-9ba3-3c6062cef360', 'di-4e0a1897-bde3-4ef8-86c0-701c08ce5c46', 'dz-2c5e2eee-57df-4e46-9920-8d00304a5ac9') ON CONFLICT DO NOTHING;

-- UNIT 2: Functions
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-alg1-u2', 'c-alg1', 'Functions', 'Function notation and evaluating functions.', 100, 1) ON CONFLICT DO NOTHING;

-- LESSON 1: Intro to Functions
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-alg1-u2-1', 'ch-alg1-u2', 'Intro to Functions', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-alg1-u2-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-alg1-u2-1', 1, '/assets/img/placeholder.png', 'Learn about Intro to Functions') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-alg1-u2-1', 'ch-alg1-u2', 'Exercises: Intro to Functions', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-0781d8b4-5bf1-4f58-a679-0506fd2080e2', 'q-l-alg1-u2-1', 'Solve for x: 2x + 5 = 13', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-0781d8b4-5bf1-4f58-a679-0506fd2080e2', 'opt-78213e0e-16fb-4c0a-b650-d0d5d152129a', '3', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-0781d8b4-5bf1-4f58-a679-0506fd2080e2', 'opt-f8474530-c5ff-4b11-8530-b601d805f5a6', '4', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-0781d8b4-5bf1-4f58-a679-0506fd2080e2', 'opt-18e6f024-4969-489f-92a3-167b5e4be28e', '5', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-0781d8b4-5bf1-4f58-a679-0506fd2080e2', 'opt-0204536a-53e0-460b-b0e5-1fc8aebe110e', '6', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-88b2ae6b-420c-48e1-bfa8-7a9d65fafb87', 'q-l-alg1-u2-1', 'True/False: The graph of a quadratic function is a straight line.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-88b2ae6b-420c-48e1-bfa8-7a9d65fafb87', 'opt-c598be0f-94f5-4b7e-a791-1b115a6ff384', 'True - quadratics are linear.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-88b2ae6b-420c-48e1-bfa8-7a9d65fafb87', 'opt-697347d3-027c-4ff9-a823-8d4f23617d35', 'False - the graph is a parabola.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-2e6c3a23-e9ec-4385-9f42-533eb493c2a5', 'q-l-alg1-u2-1', 'If f(x) = 3x - 2, then f(4) equals __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-2e6c3a23-e9ec-4385-9f42-533eb493c2a5', 0, '10') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-4fbc73cc-d7a6-4f86-9690-5882038e2ac2', 'q-l-alg1-u2-1', 'Match the equation type to its graph shape.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-4fbc73cc-d7a6-4f86-9690-5882038e2ac2', 'di-590a8284-cf6a-492f-bf25-982846646ce6', 'y = mx + b') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-4fbc73cc-d7a6-4f86-9690-5882038e2ac2', 'dz-d35195e6-2002-4f20-8044-b95cafb1ae6c', 'Line') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-4fbc73cc-d7a6-4f86-9690-5882038e2ac2', 'di-590a8284-cf6a-492f-bf25-982846646ce6', 'dz-d35195e6-2002-4f20-8044-b95cafb1ae6c') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-4fbc73cc-d7a6-4f86-9690-5882038e2ac2', 'di-f87750bc-6b84-44dc-a1c1-3a13d3c9e0d5', 'y = x^2') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-4fbc73cc-d7a6-4f86-9690-5882038e2ac2', 'dz-d74b02e6-8069-4cd1-a9d0-5f9df58c52ff', 'Parabola') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-4fbc73cc-d7a6-4f86-9690-5882038e2ac2', 'di-f87750bc-6b84-44dc-a1c1-3a13d3c9e0d5', 'dz-d74b02e6-8069-4cd1-a9d0-5f9df58c52ff') ON CONFLICT DO NOTHING;

-- LESSON 2: Domain and Range
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-alg1-u2-2', 'ch-alg1-u2', 'Domain and Range', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-alg1-u2-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-alg1-u2-2', 1, '/assets/img/placeholder.png', 'Learn about Domain and Range') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-alg1-u2-2', 'ch-alg1-u2', 'Exercises: Domain and Range', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-375a7fd7-51b7-4cfe-b772-fc7d72ee3a53', 'q-l-alg1-u2-2', 'A key concept in Domain and Range is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-375a7fd7-51b7-4cfe-b772-fc7d72ee3a53', 'opt-41d13a06-0efa-47ee-8725-55614ec11053', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-375a7fd7-51b7-4cfe-b772-fc7d72ee3a53', 'opt-b7051872-d56e-44f7-bd46-b981dc41780d', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-375a7fd7-51b7-4cfe-b772-fc7d72ee3a53', 'opt-2131f8ea-5a1e-4c76-9269-611d341ef8ce', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-375a7fd7-51b7-4cfe-b772-fc7d72ee3a53', 'opt-1d708611-b7a7-498f-9daf-bceecb7eb93c', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-c629b83c-704b-4992-9d71-e7017646b6ef', 'q-l-alg1-u2-2', 'True/False: Mastery of Domain and Range requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-c629b83c-704b-4992-9d71-e7017646b6ef', 'opt-8d0d7ce1-8450-407b-81b6-27f22f514d27', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-c629b83c-704b-4992-9d71-e7017646b6ef', 'opt-c4f6e8bc-b47d-4a9f-8395-fed0b639e3c9', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-818fec3f-b938-490d-916b-6a800c5825cc', 'q-l-alg1-u2-2', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-818fec3f-b938-490d-916b-6a800c5825cc', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-46f23fab-d9b2-4526-a404-69f48697bc0e', 'q-l-alg1-u2-2', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-46f23fab-d9b2-4526-a404-69f48697bc0e', 'di-58528184-9e74-4386-8fcd-5143b98afa56', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-46f23fab-d9b2-4526-a404-69f48697bc0e', 'dz-0d0327f3-02b8-44d1-9380-b6699ce923a1', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-46f23fab-d9b2-4526-a404-69f48697bc0e', 'di-58528184-9e74-4386-8fcd-5143b98afa56', 'dz-0d0327f3-02b8-44d1-9380-b6699ce923a1') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-46f23fab-d9b2-4526-a404-69f48697bc0e', 'di-2de86b81-1506-4a8d-a2aa-b12fbad745f5', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-46f23fab-d9b2-4526-a404-69f48697bc0e', 'dz-950b3424-c0b8-4596-b743-d04c37820e55', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-46f23fab-d9b2-4526-a404-69f48697bc0e', 'di-2de86b81-1506-4a8d-a2aa-b12fbad745f5', 'dz-950b3424-c0b8-4596-b743-d04c37820e55') ON CONFLICT DO NOTHING;

-- LESSON 3: Transformations of Functions
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-alg1-u2-3', 'ch-alg1-u2', 'Transformations of Functions', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-alg1-u2-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-alg1-u2-3', 1, '/assets/img/placeholder.png', 'Learn about Transformations of Functions') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-alg1-u2-3', 'ch-alg1-u2', 'Exercises: Transformations of Functions', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-2d7c72d5-e7bc-4d9b-beaa-2a7769179212', 'q-l-alg1-u2-3', 'Solve for x: 2x + 5 = 13', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-2d7c72d5-e7bc-4d9b-beaa-2a7769179212', 'opt-20af89eb-13cc-4468-b3db-a71a8f75a064', '3', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-2d7c72d5-e7bc-4d9b-beaa-2a7769179212', 'opt-2c02ae17-2af3-492e-b988-597a48fbb8e2', '4', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-2d7c72d5-e7bc-4d9b-beaa-2a7769179212', 'opt-d7c42420-9d79-4fba-89f4-40051de575e7', '5', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-2d7c72d5-e7bc-4d9b-beaa-2a7769179212', 'opt-00570969-0bba-472a-9687-361421023b32', '6', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-940be393-36dc-46cc-8580-3998498238e5', 'q-l-alg1-u2-3', 'True/False: The graph of a quadratic function is a straight line.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-940be393-36dc-46cc-8580-3998498238e5', 'opt-96eae7e9-649b-400d-9813-4beb53247d6b', 'True - quadratics are linear.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-940be393-36dc-46cc-8580-3998498238e5', 'opt-0460d984-d742-4e3a-a3c6-08e22c43972b', 'False - the graph is a parabola.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-8a43e513-5635-4be3-8564-6086c3999324', 'q-l-alg1-u2-3', 'If f(x) = 3x - 2, then f(4) equals __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-8a43e513-5635-4be3-8564-6086c3999324', 0, '10') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-d9c88b03-9567-4cfa-be61-4c4c57182559', 'q-l-alg1-u2-3', 'Match the equation type to its graph shape.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-d9c88b03-9567-4cfa-be61-4c4c57182559', 'di-ad079ebe-e816-4dd4-a562-d70e9b0ce609', 'y = mx + b') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-d9c88b03-9567-4cfa-be61-4c4c57182559', 'dz-6c20aaef-fb53-4c01-b55a-8091fbc8bfc0', 'Line') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-d9c88b03-9567-4cfa-be61-4c4c57182559', 'di-ad079ebe-e816-4dd4-a562-d70e9b0ce609', 'dz-6c20aaef-fb53-4c01-b55a-8091fbc8bfc0') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-d9c88b03-9567-4cfa-be61-4c4c57182559', 'di-66cf8927-9152-424d-9065-012c008b9a86', 'y = x^2') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-d9c88b03-9567-4cfa-be61-4c4c57182559', 'dz-33a80ff0-8b7c-4621-ab12-9eddcde6cf5f', 'Parabola') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-d9c88b03-9567-4cfa-be61-4c4c57182559', 'di-66cf8927-9152-424d-9065-012c008b9a86', 'dz-33a80ff0-8b7c-4621-ab12-9eddcde6cf5f') ON CONFLICT DO NOTHING;

-- UNIT 3: Quadratics
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-alg1-u3', 'c-alg1', 'Quadratics', 'Quadratic equations and parabolas.', 100, 2) ON CONFLICT DO NOTHING;

-- LESSON 1: Graphing Quadratics
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-alg1-u3-1', 'ch-alg1-u3', 'Graphing Quadratics', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-alg1-u3-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-alg1-u3-1', 1, '/assets/img/placeholder.png', 'Learn about Graphing Quadratics') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-alg1-u3-1', 'ch-alg1-u3', 'Exercises: Graphing Quadratics', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-63db1213-2025-49a0-b570-29f60adbf5e8', 'q-l-alg1-u3-1', 'Solve for x: 2x + 5 = 13', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-63db1213-2025-49a0-b570-29f60adbf5e8', 'opt-948bd51d-3058-4864-af56-57cfe7351e45', '3', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-63db1213-2025-49a0-b570-29f60adbf5e8', 'opt-4b7a5ba3-1773-4a4e-9b15-2dbd8352c015', '4', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-63db1213-2025-49a0-b570-29f60adbf5e8', 'opt-cef9e783-acad-4e94-aac1-35a5a9ac68b7', '5', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-63db1213-2025-49a0-b570-29f60adbf5e8', 'opt-86fd6cd3-a524-45ec-97c1-78fa0176da8b', '6', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-5e6e39e3-9b99-46d1-a967-42c7fdf69e42', 'q-l-alg1-u3-1', 'True/False: The graph of a quadratic function is a straight line.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-5e6e39e3-9b99-46d1-a967-42c7fdf69e42', 'opt-bf1e81b0-5051-4c3d-bbb4-26b047bba4d0', 'True - quadratics are linear.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-5e6e39e3-9b99-46d1-a967-42c7fdf69e42', 'opt-662ad3d5-d953-4057-a147-dca76a606b7e', 'False - the graph is a parabola.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-7eab39e7-3a61-4162-9068-7988303bd519', 'q-l-alg1-u3-1', 'If f(x) = 3x - 2, then f(4) equals __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-7eab39e7-3a61-4162-9068-7988303bd519', 0, '10') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-e2ad5750-ce06-4a6f-b589-1468a99fd24b', 'q-l-alg1-u3-1', 'Match the equation type to its graph shape.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-e2ad5750-ce06-4a6f-b589-1468a99fd24b', 'di-83e1f5cb-024c-444f-a120-0739d8d5e9c3', 'y = mx + b') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-e2ad5750-ce06-4a6f-b589-1468a99fd24b', 'dz-2f378b56-0a93-4da4-b74a-3168d547a95c', 'Line') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-e2ad5750-ce06-4a6f-b589-1468a99fd24b', 'di-83e1f5cb-024c-444f-a120-0739d8d5e9c3', 'dz-2f378b56-0a93-4da4-b74a-3168d547a95c') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-e2ad5750-ce06-4a6f-b589-1468a99fd24b', 'di-4e8f3a99-60f4-4eb5-8efe-206f40ba327c', 'y = x^2') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-e2ad5750-ce06-4a6f-b589-1468a99fd24b', 'dz-2863c981-fe45-4be5-bbed-9a3d323935aa', 'Parabola') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-e2ad5750-ce06-4a6f-b589-1468a99fd24b', 'di-4e8f3a99-60f4-4eb5-8efe-206f40ba327c', 'dz-2863c981-fe45-4be5-bbed-9a3d323935aa') ON CONFLICT DO NOTHING;

-- LESSON 2: Factoring
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-alg1-u3-2', 'ch-alg1-u3', 'Factoring', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-alg1-u3-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-alg1-u3-2', 1, '/assets/img/placeholder.png', 'Learn about Factoring') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-alg1-u3-2', 'ch-alg1-u3', 'Exercises: Factoring', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-2b92fa56-8081-4125-956e-e388b9495581', 'q-l-alg1-u3-2', 'A key concept in Factoring is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-2b92fa56-8081-4125-956e-e388b9495581', 'opt-9d7e9501-ff6e-4c53-be26-f46a289d3557', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-2b92fa56-8081-4125-956e-e388b9495581', 'opt-cd6c2d3b-d2f8-4c2d-bea6-2ee38ae972e1', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-2b92fa56-8081-4125-956e-e388b9495581', 'opt-7fbaf4bc-72c7-413d-867c-14f8478686b5', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-2b92fa56-8081-4125-956e-e388b9495581', 'opt-75594293-1fa7-4cd7-a91b-5c4d97f9315b', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-c66be468-84e7-4099-b359-80c74c1bcdac', 'q-l-alg1-u3-2', 'True/False: Mastery of Factoring requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-c66be468-84e7-4099-b359-80c74c1bcdac', 'opt-f2d486a4-a875-4c7e-891b-e211c630c3f3', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-c66be468-84e7-4099-b359-80c74c1bcdac', 'opt-36da19ec-566f-4e32-9762-fa01b4cc2e5d', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-443f9389-5b58-48d3-947e-9132b206e856', 'q-l-alg1-u3-2', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-443f9389-5b58-48d3-947e-9132b206e856', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-e04c09dc-ea25-4e71-ad87-eb638f358f9d', 'q-l-alg1-u3-2', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-e04c09dc-ea25-4e71-ad87-eb638f358f9d', 'di-3d34cfc0-6bdd-4e40-b646-800471a289fd', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-e04c09dc-ea25-4e71-ad87-eb638f358f9d', 'dz-989d2ddc-9be4-4405-88bb-157ac1dbae77', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-e04c09dc-ea25-4e71-ad87-eb638f358f9d', 'di-3d34cfc0-6bdd-4e40-b646-800471a289fd', 'dz-989d2ddc-9be4-4405-88bb-157ac1dbae77') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-e04c09dc-ea25-4e71-ad87-eb638f358f9d', 'di-63a6aeb3-ae02-4d0a-a6e9-2e5df26698ff', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-e04c09dc-ea25-4e71-ad87-eb638f358f9d', 'dz-340cc3a0-de44-4484-b8e5-8c06d1aabe29', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-e04c09dc-ea25-4e71-ad87-eb638f358f9d', 'di-63a6aeb3-ae02-4d0a-a6e9-2e5df26698ff', 'dz-340cc3a0-de44-4484-b8e5-8c06d1aabe29') ON CONFLICT DO NOTHING;

-- LESSON 3: Quadratic Formula
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-alg1-u3-3', 'ch-alg1-u3', 'Quadratic Formula', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-alg1-u3-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-alg1-u3-3', 1, '/assets/img/placeholder.png', 'Learn about Quadratic Formula') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-alg1-u3-3', 'ch-alg1-u3', 'Exercises: Quadratic Formula', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-3d3146d0-ed14-4d6a-8aea-3b79c6fe378d', 'q-l-alg1-u3-3', 'A key concept in Quadratic Formula is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-3d3146d0-ed14-4d6a-8aea-3b79c6fe378d', 'opt-912899c8-a847-4f9e-b4a5-9511aadf137a', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-3d3146d0-ed14-4d6a-8aea-3b79c6fe378d', 'opt-9bc83cb1-ffab-4295-9c08-af890b3de4f2', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-3d3146d0-ed14-4d6a-8aea-3b79c6fe378d', 'opt-930e9483-720f-456c-b486-dbcbed0b4a9f', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-3d3146d0-ed14-4d6a-8aea-3b79c6fe378d', 'opt-0fb9b539-87d8-4c73-9e59-2d925d877340', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-7ab3b844-05b1-4bab-8d29-57f473a552a0', 'q-l-alg1-u3-3', 'True/False: Mastery of Quadratic Formula requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-7ab3b844-05b1-4bab-8d29-57f473a552a0', 'opt-c7ed1c47-5317-442c-9a88-7f90771899eb', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-7ab3b844-05b1-4bab-8d29-57f473a552a0', 'opt-0cb3669c-6b75-4290-b517-a11782db4c14', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-acb0344a-f37b-46be-b38b-08c24e89c4aa', 'q-l-alg1-u3-3', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-acb0344a-f37b-46be-b38b-08c24e89c4aa', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-a69de530-b8f8-4125-badb-e86c8c84c121', 'q-l-alg1-u3-3', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-a69de530-b8f8-4125-badb-e86c8c84c121', 'di-1e2d9dfd-200d-48b7-9250-ede5b69254ef', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-a69de530-b8f8-4125-badb-e86c8c84c121', 'dz-8e93c75f-b1fe-401f-81d1-6238cb0926ca', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-a69de530-b8f8-4125-badb-e86c8c84c121', 'di-1e2d9dfd-200d-48b7-9250-ede5b69254ef', 'dz-8e93c75f-b1fe-401f-81d1-6238cb0926ca') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-a69de530-b8f8-4125-badb-e86c8c84c121', 'di-d6ca3c6e-68d7-45b1-abcc-40bbba35f54f', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-a69de530-b8f8-4125-badb-e86c8c84c121', 'dz-afc42cd9-08c5-4980-b75b-73193869df2d', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-a69de530-b8f8-4125-badb-e86c8c84c121', 'di-d6ca3c6e-68d7-45b1-abcc-40bbba35f54f', 'dz-afc42cd9-08c5-4980-b75b-73193869df2d') ON CONFLICT DO NOTHING;

-- ===========================
-- COURSE: Geometry
-- ===========================
INSERT INTO courses (course_id, title, description, track, level_num, color, glyph, total_lessons, estimated_hours, xp_reward, status) VALUES ('c-geo', 'Geometry', 'High School curriculum', 'High School', 10, 'rose', '∑', 9, '5h', 1000, 'new') ON CONFLICT DO NOTHING;

-- UNIT 1: Congruence
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-geo-u1', 'c-geo', 'Congruence', 'Transformations and triangle congruence.', 100, 0) ON CONFLICT DO NOTHING;

-- LESSON 1: Rigid Transformations
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-geo-u1-1', 'ch-geo-u1', 'Rigid Transformations', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-geo-u1-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-geo-u1-1', 1, '/assets/img/placeholder.png', 'Learn about Rigid Transformations') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-geo-u1-1', 'ch-geo-u1', 'Exercises: Rigid Transformations', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-ce00d671-de83-4e8a-ba83-2d48af13c59b', 'q-l-geo-u1-1', 'A key concept in Rigid Transformations is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-ce00d671-de83-4e8a-ba83-2d48af13c59b', 'opt-4fd77e83-8195-4f78-899b-9853c6b0aaa4', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-ce00d671-de83-4e8a-ba83-2d48af13c59b', 'opt-ad839f98-8e38-4fc4-8654-a9bff57a1a4f', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-ce00d671-de83-4e8a-ba83-2d48af13c59b', 'opt-fc814a9d-6159-4cc0-a57d-2d6f7bb3a7e7', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-ce00d671-de83-4e8a-ba83-2d48af13c59b', 'opt-64ee7fa2-4ff2-4f5f-ba09-b6ca77fd108e', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-ff4cd036-9255-426d-b66b-af37fe5ce6df', 'q-l-geo-u1-1', 'True/False: Mastery of Rigid Transformations requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-ff4cd036-9255-426d-b66b-af37fe5ce6df', 'opt-ad115ed0-8fed-4062-b2b8-3b142e345881', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-ff4cd036-9255-426d-b66b-af37fe5ce6df', 'opt-20de5f36-d152-455f-965a-b95b8dd45899', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-fca91018-78ac-487e-acf9-90d243eac6b4', 'q-l-geo-u1-1', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-fca91018-78ac-487e-acf9-90d243eac6b4', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-07337039-52bc-4ff5-9d64-c0b850357807', 'q-l-geo-u1-1', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-07337039-52bc-4ff5-9d64-c0b850357807', 'di-a9ef5654-698e-4539-b514-d6c89c5f390d', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-07337039-52bc-4ff5-9d64-c0b850357807', 'dz-598b075d-a35f-4f2f-a224-4f49a472eba3', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-07337039-52bc-4ff5-9d64-c0b850357807', 'di-a9ef5654-698e-4539-b514-d6c89c5f390d', 'dz-598b075d-a35f-4f2f-a224-4f49a472eba3') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-07337039-52bc-4ff5-9d64-c0b850357807', 'di-fccad303-6db8-4583-bf03-5f07c9f92703', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-07337039-52bc-4ff5-9d64-c0b850357807', 'dz-2f658c5c-9cba-4ccd-9968-44acb691adcf', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-07337039-52bc-4ff5-9d64-c0b850357807', 'di-fccad303-6db8-4583-bf03-5f07c9f92703', 'dz-2f658c5c-9cba-4ccd-9968-44acb691adcf') ON CONFLICT DO NOTHING;

-- LESSON 2: Congruent Triangles
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-geo-u1-2', 'ch-geo-u1', 'Congruent Triangles', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-geo-u1-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-geo-u1-2', 1, '/assets/img/placeholder.png', 'Learn about Congruent Triangles') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-geo-u1-2', 'ch-geo-u1', 'Exercises: Congruent Triangles', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-d183f1e8-7a1d-4928-bb18-1560c23e17a4', 'q-l-geo-u1-2', 'A key concept in Congruent Triangles is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d183f1e8-7a1d-4928-bb18-1560c23e17a4', 'opt-8d8b0869-fff5-4d34-8d33-6a5deda3bd5d', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d183f1e8-7a1d-4928-bb18-1560c23e17a4', 'opt-a2f821c5-383c-4573-8d53-9eb12a119a6f', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d183f1e8-7a1d-4928-bb18-1560c23e17a4', 'opt-401e85c9-500c-4549-a64e-e8250152073d', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d183f1e8-7a1d-4928-bb18-1560c23e17a4', 'opt-e05c2f95-7d61-450d-aff0-9fc2d6cc46a3', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-bc88cd20-687d-4c11-9d62-f69c1ff2a8df', 'q-l-geo-u1-2', 'True/False: Mastery of Congruent Triangles requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-bc88cd20-687d-4c11-9d62-f69c1ff2a8df', 'opt-c52c8b74-d46b-42c6-8a34-cd46e8eab417', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-bc88cd20-687d-4c11-9d62-f69c1ff2a8df', 'opt-f6ba00b7-1d07-4322-858d-20a5acfc403b', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-7050852f-b742-4f8b-87b2-1044b59df06a', 'q-l-geo-u1-2', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-7050852f-b742-4f8b-87b2-1044b59df06a', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-aeb6b86c-c25a-40b8-a8ab-9582ef3902c5', 'q-l-geo-u1-2', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-aeb6b86c-c25a-40b8-a8ab-9582ef3902c5', 'di-54767e8b-504e-4420-9ca3-2125f5bb43a4', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-aeb6b86c-c25a-40b8-a8ab-9582ef3902c5', 'dz-2780f17b-e039-4912-80f5-c7751c25165c', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-aeb6b86c-c25a-40b8-a8ab-9582ef3902c5', 'di-54767e8b-504e-4420-9ca3-2125f5bb43a4', 'dz-2780f17b-e039-4912-80f5-c7751c25165c') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-aeb6b86c-c25a-40b8-a8ab-9582ef3902c5', 'di-d7d82909-5d7e-4bb0-bc33-5e5b90d575d1', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-aeb6b86c-c25a-40b8-a8ab-9582ef3902c5', 'dz-fc710be1-84ec-41ce-9233-907922d6433f', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-aeb6b86c-c25a-40b8-a8ab-9582ef3902c5', 'di-d7d82909-5d7e-4bb0-bc33-5e5b90d575d1', 'dz-fc710be1-84ec-41ce-9233-907922d6433f') ON CONFLICT DO NOTHING;

-- LESSON 3: Proofs
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-geo-u1-3', 'ch-geo-u1', 'Proofs', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-geo-u1-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-geo-u1-3', 1, '/assets/img/placeholder.png', 'Learn about Proofs') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-geo-u1-3', 'ch-geo-u1', 'Exercises: Proofs', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-216e021a-f239-47cb-9178-78009813ef60', 'q-l-geo-u1-3', 'A key concept in Proofs is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-216e021a-f239-47cb-9178-78009813ef60', 'opt-db4f2840-0220-4e50-9d3e-35966e0cf656', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-216e021a-f239-47cb-9178-78009813ef60', 'opt-4868b299-f614-4816-8bfb-358a72628a10', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-216e021a-f239-47cb-9178-78009813ef60', 'opt-90acb959-c4c4-4336-b42c-52a7b9ce0947', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-216e021a-f239-47cb-9178-78009813ef60', 'opt-57fa83db-11f1-45f7-843b-66a91fdfc6fb', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-af217354-fc23-49cf-ac9a-6961a1eddcac', 'q-l-geo-u1-3', 'True/False: Mastery of Proofs requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-af217354-fc23-49cf-ac9a-6961a1eddcac', 'opt-eef765d5-803b-4a20-bf4a-fb71d415f31c', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-af217354-fc23-49cf-ac9a-6961a1eddcac', 'opt-0491cbc8-e28b-4b70-a37e-d224fc0cdff7', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-3f85f767-a3f2-40c6-92c1-aa546a48f5db', 'q-l-geo-u1-3', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-3f85f767-a3f2-40c6-92c1-aa546a48f5db', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-e5c2ad11-60af-4dd4-996c-dd62945e08a0', 'q-l-geo-u1-3', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-e5c2ad11-60af-4dd4-996c-dd62945e08a0', 'di-d2155902-aced-4443-80cb-4509ab217fdd', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-e5c2ad11-60af-4dd4-996c-dd62945e08a0', 'dz-304601d1-9a06-4db6-bf95-685b8639fac4', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-e5c2ad11-60af-4dd4-996c-dd62945e08a0', 'di-d2155902-aced-4443-80cb-4509ab217fdd', 'dz-304601d1-9a06-4db6-bf95-685b8639fac4') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-e5c2ad11-60af-4dd4-996c-dd62945e08a0', 'di-9a1d4beb-0d98-4269-a9e6-53b1d8b9ea65', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-e5c2ad11-60af-4dd4-996c-dd62945e08a0', 'dz-521b335d-2002-4285-8835-fa3ab6d78fdb', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-e5c2ad11-60af-4dd4-996c-dd62945e08a0', 'di-9a1d4beb-0d98-4269-a9e6-53b1d8b9ea65', 'dz-521b335d-2002-4285-8835-fa3ab6d78fdb') ON CONFLICT DO NOTHING;

-- UNIT 2: Similarity
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-geo-u2', 'c-geo', 'Similarity', 'Dilations and similar figures.', 100, 1) ON CONFLICT DO NOTHING;

-- LESSON 1: Dilations
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-geo-u2-1', 'ch-geo-u2', 'Dilations', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-geo-u2-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-geo-u2-1', 1, '/assets/img/placeholder.png', 'Learn about Dilations') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-geo-u2-1', 'ch-geo-u2', 'Exercises: Dilations', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-63199488-6f12-427d-b903-5b0831f81283', 'q-l-geo-u2-1', 'A key concept in Dilations is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-63199488-6f12-427d-b903-5b0831f81283', 'opt-d8af8aaa-74e9-4235-b67d-2815a3415ed1', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-63199488-6f12-427d-b903-5b0831f81283', 'opt-c33fc4e5-6912-4487-adda-905e9f9bdd50', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-63199488-6f12-427d-b903-5b0831f81283', 'opt-c485856d-9192-4785-98d8-42905b1b7d0e', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-63199488-6f12-427d-b903-5b0831f81283', 'opt-cf57fb1a-a9b1-4c96-960a-d8fa706e0f62', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-90470663-168c-4d78-b971-76ac87a27117', 'q-l-geo-u2-1', 'True/False: Mastery of Dilations requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-90470663-168c-4d78-b971-76ac87a27117', 'opt-ce4871f1-7525-410e-8610-f01b2ec9584a', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-90470663-168c-4d78-b971-76ac87a27117', 'opt-a5b83429-9a5f-4394-a7de-59631e1a13b2', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-0af77a2f-0937-4244-912e-040d3d91a5fe', 'q-l-geo-u2-1', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-0af77a2f-0937-4244-912e-040d3d91a5fe', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-50fed8f2-26f5-4ee1-830a-665792729c99', 'q-l-geo-u2-1', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-50fed8f2-26f5-4ee1-830a-665792729c99', 'di-fac3ea48-5407-42f1-9156-e470242543bf', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-50fed8f2-26f5-4ee1-830a-665792729c99', 'dz-9e08c232-5df2-462d-a923-97e7f16dac7d', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-50fed8f2-26f5-4ee1-830a-665792729c99', 'di-fac3ea48-5407-42f1-9156-e470242543bf', 'dz-9e08c232-5df2-462d-a923-97e7f16dac7d') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-50fed8f2-26f5-4ee1-830a-665792729c99', 'di-ea372ac2-5796-42d6-9d33-63e55e84261b', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-50fed8f2-26f5-4ee1-830a-665792729c99', 'dz-40f548b7-de54-45a9-b668-b5af1c45a983', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-50fed8f2-26f5-4ee1-830a-665792729c99', 'di-ea372ac2-5796-42d6-9d33-63e55e84261b', 'dz-40f548b7-de54-45a9-b668-b5af1c45a983') ON CONFLICT DO NOTHING;

-- LESSON 2: Similar Triangles
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-geo-u2-2', 'ch-geo-u2', 'Similar Triangles', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-geo-u2-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-geo-u2-2', 1, '/assets/img/placeholder.png', 'Learn about Similar Triangles') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-geo-u2-2', 'ch-geo-u2', 'Exercises: Similar Triangles', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-d43b9e47-8dd3-440d-b90f-e1cba5942837', 'q-l-geo-u2-2', 'A key concept in Similar Triangles is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d43b9e47-8dd3-440d-b90f-e1cba5942837', 'opt-8c49365c-9204-47d5-8e39-258cf7417c80', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d43b9e47-8dd3-440d-b90f-e1cba5942837', 'opt-6c85f0f2-2097-4185-9379-1e6693da4d25', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d43b9e47-8dd3-440d-b90f-e1cba5942837', 'opt-8194ad61-90fc-404a-9bdc-0cabf020607d', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-d43b9e47-8dd3-440d-b90f-e1cba5942837', 'opt-71135865-7548-45b2-9d61-7dbec2b5287c', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-0450979f-8e56-41cb-96fc-650a4cf72d17', 'q-l-geo-u2-2', 'True/False: Mastery of Similar Triangles requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-0450979f-8e56-41cb-96fc-650a4cf72d17', 'opt-a61ae33c-ba26-422b-85ff-506fbbbad87a', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-0450979f-8e56-41cb-96fc-650a4cf72d17', 'opt-45be79a8-535f-4d11-8ab3-7493f272f15a', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-cd747a17-295d-4533-99b2-364c90d82dce', 'q-l-geo-u2-2', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-cd747a17-295d-4533-99b2-364c90d82dce', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-ca7a487d-f074-4c87-a55c-fbfb4371b69a', 'q-l-geo-u2-2', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-ca7a487d-f074-4c87-a55c-fbfb4371b69a', 'di-1ff2775c-49df-47e8-9013-5c4f6705ae7d', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-ca7a487d-f074-4c87-a55c-fbfb4371b69a', 'dz-ac3214d0-7a0c-409b-ab51-ed7b28372125', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-ca7a487d-f074-4c87-a55c-fbfb4371b69a', 'di-1ff2775c-49df-47e8-9013-5c4f6705ae7d', 'dz-ac3214d0-7a0c-409b-ab51-ed7b28372125') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-ca7a487d-f074-4c87-a55c-fbfb4371b69a', 'di-142eaadf-3b42-4fea-aea9-65bad51e5d65', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-ca7a487d-f074-4c87-a55c-fbfb4371b69a', 'dz-d0d7acf2-8d44-461f-89c2-71f3436ca584', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-ca7a487d-f074-4c87-a55c-fbfb4371b69a', 'di-142eaadf-3b42-4fea-aea9-65bad51e5d65', 'dz-d0d7acf2-8d44-461f-89c2-71f3436ca584') ON CONFLICT DO NOTHING;

-- LESSON 3: Proving Similarity
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-geo-u2-3', 'ch-geo-u2', 'Proving Similarity', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-geo-u2-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-geo-u2-3', 1, '/assets/img/placeholder.png', 'Learn about Proving Similarity') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-geo-u2-3', 'ch-geo-u2', 'Exercises: Proving Similarity', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-c7e4892b-9e43-4697-beb8-361d7132028a', 'q-l-geo-u2-3', 'A key concept in Proving Similarity is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c7e4892b-9e43-4697-beb8-361d7132028a', 'opt-7855b68b-e11a-43a8-b7ea-cbb1dde419fa', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c7e4892b-9e43-4697-beb8-361d7132028a', 'opt-a9780ad6-14e7-42b0-9852-c4838e24224a', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c7e4892b-9e43-4697-beb8-361d7132028a', 'opt-613fc1a3-ec7e-4bd6-a692-b3decc31d3ae', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c7e4892b-9e43-4697-beb8-361d7132028a', 'opt-ab8ae1d5-d788-4fc1-835d-c5af8573af56', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-7f1e0e56-8f8f-4422-b024-4f54416de9d0', 'q-l-geo-u2-3', 'True/False: Mastery of Proving Similarity requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-7f1e0e56-8f8f-4422-b024-4f54416de9d0', 'opt-f31abd16-f2dc-4e34-8537-003511b0d80e', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-7f1e0e56-8f8f-4422-b024-4f54416de9d0', 'opt-6624adcb-ba34-4a7b-bbbf-eac883bb52de', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-ae5ddaaf-d55d-4ebe-917b-bf2d42835dd1', 'q-l-geo-u2-3', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-ae5ddaaf-d55d-4ebe-917b-bf2d42835dd1', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-56071181-e558-4926-8e59-f5a364bfd1f3', 'q-l-geo-u2-3', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-56071181-e558-4926-8e59-f5a364bfd1f3', 'di-9b860e5f-b74a-498f-9c7a-35fd149d570b', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-56071181-e558-4926-8e59-f5a364bfd1f3', 'dz-364fc5c8-8909-4109-bbfd-0e12c357d9c4', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-56071181-e558-4926-8e59-f5a364bfd1f3', 'di-9b860e5f-b74a-498f-9c7a-35fd149d570b', 'dz-364fc5c8-8909-4109-bbfd-0e12c357d9c4') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-56071181-e558-4926-8e59-f5a364bfd1f3', 'di-482f399d-6d9a-432f-9ece-c31fff2052cf', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-56071181-e558-4926-8e59-f5a364bfd1f3', 'dz-ceb4deb5-ebc4-44d6-94b6-b3300cb7bdb6', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-56071181-e558-4926-8e59-f5a364bfd1f3', 'di-482f399d-6d9a-432f-9ece-c31fff2052cf', 'dz-ceb4deb5-ebc4-44d6-94b6-b3300cb7bdb6') ON CONFLICT DO NOTHING;

-- UNIT 3: Right Triangle Trigonometry
INSERT INTO chapters (chapter_id, course_id, title, description, xp_reward, order_index) VALUES ('ch-geo-u3', 'c-geo', 'Right Triangle Trigonometry', 'Sine, cosine, and tangent.', 100, 2) ON CONFLICT DO NOTHING;

-- LESSON 1: Pythagorean Theorem
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-geo-u3-1', 'ch-geo-u3', 'Pythagorean Theorem', 0, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-geo-u3-1', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-geo-u3-1', 1, '/assets/img/placeholder.png', 'Learn about Pythagorean Theorem') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-geo-u3-1', 'ch-geo-u3', 'Exercises: Pythagorean Theorem', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-4635208f-e010-44bc-9180-8e4c42a59229', 'q-l-geo-u3-1', 'A key concept in Pythagorean Theorem is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-4635208f-e010-44bc-9180-8e4c42a59229', 'opt-2e9e2317-cfe8-4c17-be8e-0ec7b8dc74ca', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-4635208f-e010-44bc-9180-8e4c42a59229', 'opt-82f64348-30e7-4fe2-83c9-3a14dd96ff1b', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-4635208f-e010-44bc-9180-8e4c42a59229', 'opt-153ddbfa-86d9-4423-9a3a-f27ad425fa94', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-4635208f-e010-44bc-9180-8e4c42a59229', 'opt-eb8cd759-0fc3-4c2d-8f41-9de12cf91a98', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-d0a1828b-0fcc-4a75-b102-09dddcdf2dfb', 'q-l-geo-u3-1', 'True/False: Mastery of Pythagorean Theorem requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-d0a1828b-0fcc-4a75-b102-09dddcdf2dfb', 'opt-b781382a-49ff-4976-8adf-1551797651ac', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-d0a1828b-0fcc-4a75-b102-09dddcdf2dfb', 'opt-35e94c49-7ff9-4c8a-b4f1-28b6c912fe20', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-3f250c59-8434-40d5-b297-1fa68ef39e0c', 'q-l-geo-u3-1', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-3f250c59-8434-40d5-b297-1fa68ef39e0c', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-405b16cd-83b9-4ddf-a938-ceff12d441cd', 'q-l-geo-u3-1', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-405b16cd-83b9-4ddf-a938-ceff12d441cd', 'di-7cd06ee0-04e2-4fc9-9ffb-bf14a7007e34', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-405b16cd-83b9-4ddf-a938-ceff12d441cd', 'dz-51e9e0f0-19db-460f-9ea4-bf944199e1cc', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-405b16cd-83b9-4ddf-a938-ceff12d441cd', 'di-7cd06ee0-04e2-4fc9-9ffb-bf14a7007e34', 'dz-51e9e0f0-19db-460f-9ea4-bf944199e1cc') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-405b16cd-83b9-4ddf-a938-ceff12d441cd', 'di-1e9f0bde-74a2-4afc-a495-b77ecf48f1e8', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-405b16cd-83b9-4ddf-a938-ceff12d441cd', 'dz-621decad-808c-43fa-bdae-96fc3ba60e40', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-405b16cd-83b9-4ddf-a938-ceff12d441cd', 'di-1e9f0bde-74a2-4afc-a495-b77ecf48f1e8', 'dz-621decad-808c-43fa-bdae-96fc3ba60e40') ON CONFLICT DO NOTHING;

-- LESSON 2: Sine, Cosine, Tangent
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-geo-u3-2', 'ch-geo-u3', 'Sine, Cosine, Tangent', 1, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-geo-u3-2', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-geo-u3-2', 1, '/assets/img/placeholder.png', 'Learn about Sine, Cosine, Tangent') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-geo-u3-2', 'ch-geo-u3', 'Exercises: Sine, Cosine, Tangent', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-634b86bc-bec7-41b2-8fac-cdb60dad47d4', 'q-l-geo-u3-2', 'A key concept in Sine, Cosine, Tangent is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-634b86bc-bec7-41b2-8fac-cdb60dad47d4', 'opt-a97e528a-b97a-4289-81c6-2d9328dcfa92', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-634b86bc-bec7-41b2-8fac-cdb60dad47d4', 'opt-bfbc89c5-2f87-483e-a6fd-f9031bf56fb1', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-634b86bc-bec7-41b2-8fac-cdb60dad47d4', 'opt-f63ad79a-61e8-4af8-bb89-30dfcc5ffa7b', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-634b86bc-bec7-41b2-8fac-cdb60dad47d4', 'opt-4c1b6a62-3178-4357-8935-5522c659dfb2', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-877197af-f02b-4c91-b341-ae2f561ec78c', 'q-l-geo-u3-2', 'True/False: Mastery of Sine, Cosine, Tangent requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-877197af-f02b-4c91-b341-ae2f561ec78c', 'opt-12207f52-0636-41c8-879c-a61403970a96', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-877197af-f02b-4c91-b341-ae2f561ec78c', 'opt-99926899-bbe2-49aa-8971-6e7ae88e5894', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-f2497f88-1646-486f-84b8-4ecfa5ba4ce9', 'q-l-geo-u3-2', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-f2497f88-1646-486f-84b8-4ecfa5ba4ce9', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-9cb3f4b5-9cfa-4af8-9ff8-b4b11a334d35', 'q-l-geo-u3-2', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-9cb3f4b5-9cfa-4af8-9ff8-b4b11a334d35', 'di-be6a5448-17a4-436a-b0fe-878d52150253', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-9cb3f4b5-9cfa-4af8-9ff8-b4b11a334d35', 'dz-b918554b-d1c3-4d1b-9cc7-8c29d01c5df7', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-9cb3f4b5-9cfa-4af8-9ff8-b4b11a334d35', 'di-be6a5448-17a4-436a-b0fe-878d52150253', 'dz-b918554b-d1c3-4d1b-9cc7-8c29d01c5df7') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-9cb3f4b5-9cfa-4af8-9ff8-b4b11a334d35', 'di-e5c6b50d-174e-488a-ac03-1c09ebd998ed', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-9cb3f4b5-9cfa-4af8-9ff8-b4b11a334d35', 'dz-3b9efc41-2d87-4e4c-9993-061302c53eef', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-9cb3f4b5-9cfa-4af8-9ff8-b4b11a334d35', 'di-e5c6b50d-174e-488a-ac03-1c09ebd998ed', 'dz-3b9efc41-2d87-4e4c-9993-061302c53eef') ON CONFLICT DO NOTHING;

-- LESSON 3: Solving Right Triangles
INSERT INTO learning_modules (module_id, chapter_id, title, order_index, type) VALUES ('l-geo-u3-3', 'ch-geo-u3', 'Solving Right Triangles', 2, 'SLIDE') ON CONFLICT DO NOTHING;
INSERT INTO slide_modules (module_id, seconds_per_slide) VALUES ('l-geo-u3-3', 30) ON CONFLICT DO NOTHING;
INSERT INTO slides (module_id, slide_order, image_url, caption) VALUES ('l-geo-u3-3', 1, '/assets/img/placeholder.png', 'Learn about Solving Right Triangles') ON CONFLICT DO NOTHING;

INSERT INTO quizzes (quiz_id, chapter_id, title, passing_score) VALUES ('q-l-geo-u3-3', 'ch-geo-u3', 'Exercises: Solving Right Triangles', 2) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-0-c628fbd6-afb0-45ac-b7ff-8a7a4494ce1a', 'q-l-geo-u3-3', 'A key concept in Solving Right Triangles is understanding definitions. Which is true?', 10, 'MULTIPLE_CHOICE', FALSE, 0) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c628fbd6-afb0-45ac-b7ff-8a7a4494ce1a', 'opt-08afa242-c924-462f-8992-fb4e9ce6942a', 'Math is based on axioms and logic.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c628fbd6-afb0-45ac-b7ff-8a7a4494ce1a', 'opt-264e67a5-1c51-4067-92fb-6fccdfe46b9d', 'Math is random.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c628fbd6-afb0-45ac-b7ff-8a7a4494ce1a', 'opt-9ea1352f-7ede-4499-be39-9ac7e7c60b56', 'Definitions are optional.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-0-c628fbd6-afb0-45ac-b7ff-8a7a4494ce1a', 'opt-3040c720-abc9-4f95-857a-717a217414c9', 'Calculators do all the work.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-1-469a6037-cbfc-44fb-9eac-bbfccab64915', 'q-l-geo-u3-3', 'True/False: Mastery of Solving Right Triangles requires practice.', 10, 'MULTIPLE_CHOICE', FALSE, 1) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-469a6037-cbfc-44fb-9eac-bbfccab64915', 'opt-fb04d86f-a19e-478b-b245-93354b3d727a', 'True - practice builds neural pathways.', TRUE) ON CONFLICT DO NOTHING;
INSERT INTO mc_options (question_id, option_id, option_text, is_correct) VALUES ('q-1-469a6037-cbfc-44fb-9eac-bbfccab64915', 'opt-0d0961d9-0d80-4d4a-96a3-4ef91ca2ea69', 'False - it should be instantly obvious.', FALSE) ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-2-8b0c0b0b-71d5-49bb-a458-e9dd20df8123', 'q-l-geo-u3-3', 'The number of degrees in a full circle is __.', 10, 'FILL_BLANK', FALSE, 2) ON CONFLICT DO NOTHING;
INSERT INTO fill_blank_answers (question_id, answer_order, answer_text) VALUES ('q-2-8b0c0b0b-71d5-49bb-a458-e9dd20df8123', 0, '360') ON CONFLICT DO NOTHING;
INSERT INTO questions (question_id, quiz_id, prompt, points, type, case_sensitive, order_index) VALUES ('q-3-f610e664-75cb-49a7-bb61-e8842477ea9f', 'q-l-geo-u3-3', 'Match the term to its definition.', 10, 'DRAG_AND_DROP', FALSE, 3) ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-f610e664-75cb-49a7-bb61-e8842477ea9f', 'di-21c767a4-cb31-4bf4-8d29-03eee4d16ef3', 'Sum') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-f610e664-75cb-49a7-bb61-e8842477ea9f', 'dz-7a4fa9cb-9933-4c4f-bd3b-723ec4de5487', 'Result of addition') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-f610e664-75cb-49a7-bb61-e8842477ea9f', 'di-21c767a4-cb31-4bf4-8d29-03eee4d16ef3', 'dz-7a4fa9cb-9933-4c4f-bd3b-723ec4de5487') ON CONFLICT DO NOTHING;
INSERT INTO drag_items (question_id, item_id, label) VALUES ('q-3-f610e664-75cb-49a7-bb61-e8842477ea9f', 'di-a3fad50e-7399-40bd-8043-d5e7dab87af4', 'Product') ON CONFLICT DO NOTHING;
INSERT INTO drop_zones (question_id, zone_id, label) VALUES ('q-3-f610e664-75cb-49a7-bb61-e8842477ea9f', 'dz-15bf1c3a-e85c-469b-81c9-a7148f774f5f', 'Result of multiplication') ON CONFLICT DO NOTHING;
INSERT INTO drag_drop_pairings (question_id, item_id, zone_id) VALUES ('q-3-f610e664-75cb-49a7-bb61-e8842477ea9f', 'di-a3fad50e-7399-40bd-8043-d5e7dab87af4', 'dz-15bf1c3a-e85c-469b-81c9-a7148f774f5f') ON CONFLICT DO NOTHING;

COMMIT;
