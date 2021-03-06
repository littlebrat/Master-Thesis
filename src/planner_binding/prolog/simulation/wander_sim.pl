%%% -*- Mode: Prolog; -*-


:- include('../domain/communication_mdp.pl').

t1 :-
    executedplan_start,
    executedplan_step(BA,false,
    [observation(heard) ~= none,
    observation(camera_tracker(mbot)) ~= sofa,
    observation(camera_tracker(robert)) ~= bed,
    observation(camera_tracker(lynda)) ~= kitchen_table,
    observation(camera_tracker(melanie)) ~= sofa,
    observation(recognized(robert)) ~= false,
    observation(recognized(lynda)) ~= false,
    observation(recognized(melanie)) ~= false,
    observation(status) ~= idle,
    observation(recv) ~= (none, none),
    observation(have_goal) ~= none],
    300,10,TotalR,T,10,STOP),
    write('Action chosen: '), writeln(BA),
    write('Timestep: '), writeln(T),
    write('Reward: '), writeln(TotalR).

t2 :-
    executedplan_start,
    executedplan_step(BA,false,
    [observation(heard) ~= robert,
    observation(camera_tracker(mbot)) ~= sofa,
    observation(camera_tracker(robert)) ~= bed,
    observation(camera_tracker(lynda)) ~= kitchen_table,
    observation(camera_tracker(melanie)) ~= sofa,
    observation(recognized(robert)) ~= false,
    observation(recognized(lynda)) ~= false,
    observation(recognized(melanie)) ~= false,
    observation(status) ~= idle,
    observation(recv) ~= (none, none),
    observation(have_goal) ~= none],
    300,10,TotalR,T,10,STOP),
    write('Action chosen: '), writeln(BA),
    write('Timestep: '), writeln(T),
    write('Reward: '), writeln(TotalR).

t3 :-
    executedplan_start,
    executedplan_step(BA,false,
    [observation(heard) ~= robert,
    observation(camera_tracker(mbot)) ~= bed,
    observation(camera_tracker(robert)) ~= bed,
    observation(camera_tracker(lynda)) ~= kitchen_table,
    observation(camera_tracker(melanie)) ~= sofa,
    observation(recognized(robert)) ~= true,
    observation(recognized(lynda)) ~= false,
    observation(recognized(melanie)) ~= false,
    observation(status) ~= idle,
    observation(recv) ~= (none, none),
    observation(have_goal) ~= none],
    300,10,TotalR,T,10,STOP),
    write('Action chosen: '), writeln(BA),
    write('Timestep: '), writeln(T),
    write('Reward: '), writeln(TotalR).

t4 :-
    executedplan_start,
    executedplan_step(BA,false,
    [observation(heard) ~= none,
    observation(camera_tracker(mbot)) ~= bed,
    observation(camera_tracker(robert)) ~= bed,
    observation(camera_tracker(lynda)) ~= kitchen_table,
    observation(camera_tracker(melanie)) ~= sofa,
    observation(recognized(robert)) ~= true,
    observation(recognized(lynda)) ~= false,
    observation(recognized(melanie)) ~= false,
    observation(status) ~= conversation(robert),
    observation(recv) ~= (robert, want(robert, coke)),
    observation(have_goal) ~= none],
    300,10,TotalR,T,10,STOP),
    write('Action chosen: '), writeln(BA),
    write('Timestep: '), writeln(T),
    write('Reward: '), writeln(TotalR).

t5 :-
    executedplan_start,
    executedplan_step(BA,false,
    [observation(heard) ~= none,
    observation(camera_tracker(mbot)) ~= bed,
    observation(camera_tracker(robert)) ~= bed,
    observation(camera_tracker(lynda)) ~= kitchen_table,
    observation(camera_tracker(melanie)) ~= sofa,
    observation(recognized(robert)) ~= true,
    observation(recognized(lynda)) ~= false,
    observation(recognized(melanie)) ~= false,
    observation(status) ~= idle,
    observation(recv) ~= (none, none),
    observation(have_goal) ~= want(robert, coke)],
    300,10,TotalR,T,10,STOP),
    write('Action chosen: '), writeln(BA),
    write('Timestep: '), writeln(T),
    write('Reward: '), writeln(TotalR).

initdom1 :-
	init_particle(1000),
	step_particle([action(wait)],
    [observation(status) ~= idle,
		observation(camera_tracker(mbot)) ~= kitchen_table,
    observation(camera_tracker(robert)) ~= bed,
    observation(camera_tracker(lynda)) ~= kitchen_table,
    observation(camera_tracker(melanie)) ~= sofa,
		observation(recv) ~= (none, none),
		observation(heard) ~= none,
    observation(have_goal) ~= none,
    observation(recognized(robert)) ~= false,
    observation(recognized(lynda)) ~= true,
    observation(recognized(melanie)) ~= false],1000,1),
    log.

initdom2 :-
	init_particle(1000),
	step_particle([action(wait)],
    [observation(status) ~= idle,
		observation(camera_tracker(mbot)) ~= kitchen_table,
    observation(camera_tracker(robert)) ~= bed,
    observation(camera_tracker(lynda)) ~= kitchen_table,
    observation(camera_tracker(melanie)) ~= sofa,
		observation(recv) ~= (none, none),
		observation(heard) ~= lynda,
    observation(have_goal) ~= none,
    observation(recognized(robert)) ~= false,
    observation(recognized(lynda)) ~= true,
    observation(recognized(melanie)) ~= false],1000,1),
    log.

initdom3 :-
	init_particle(1000),
	step_particle([action(wait)],
    [observation(status) ~= conversation(Name),
		observation(camera_tracker(mbot)) ~= kitchen_table,
    observation(camera_tracker(robert)) ~= bed,
    observation(camera_tracker(lynda)) ~= kitchen_table,
    observation(camera_tracker(melanie)) ~= sofa,
		observation(recv) ~= (none, none),
		observation(heard) ~= none,
    observation(have_goal) ~= none,
    observation(recognized(robert)) ~= false,
    observation(recognized(lynda)) ~= true,
    observation(recognized(melanie)) ~= false],1000,1),
    log.

initdom4 :-
	init_particle(1000),
	step_particle([action(wait)],
    [observation(status) ~= idle,
		observation(camera_tracker(mbot)) ~= kitchen_table,
    observation(camera_tracker(robert)) ~= bed,
    observation(camera_tracker(lynda)) ~= kitchen_table,
    observation(camera_tracker(melanie)) ~= sofa,
		observation(recv) ~= (none, none),
		observation(heard) ~= robert,
    observation(have_goal) ~= none,
    observation(recognized(robert)) ~= false,
    observation(recognized(lynda)) ~= true,
    observation(recognized(melanie)) ~= false],1000,1),
    log.

step_move(Place) :-
    write('[Executed Action]: navigate('), write(Place), writeln(')'),
    step_particle([action(navigate(Place))],O1,1000,1),
    log.

step_wait :-
    writeln('[Executed Action]: wait'),
    step_particle([action(wait)],O1,1000,1),
    log.

step_initiate(Other) :-
    write('[Executed Action]: respond('), write(Other),
		writeln(',ready_to_help)'),
    step_particle([action(respond(Other, ready_to_help))],O1,1000,1),
    log.

step_confirm(Other) :-
    write('[Executed Action]: respond('), write(Other),
		write(',confirm_mission,want('),write(Other),writeln(',coke))'),
    step_particle([action(respond(Other, confirm_mission, want(Other, coke)))],
		O1,1000,1),
    log.

log :-
    writeln(' ----------------------------------- '),
		eval_query_particle(current(dynamic_state)~=idle, 1000, P1),
		eval_query_particle(current(dynamic_state)~=conversation(robert), 1000, P2),
		eval_query_particle(current(dynamic_state)~=conversation(lynda), 1000, P3),
		eval_query_particle(current(dynamic_state)~=conversation(melanie), 1000, P4),
		eval_query_particle(current(called)~=none, 1000, P5),
		eval_query_particle(current(called)~=robert, 1000, P6),
		eval_query_particle(current(called)~=lynda, 1000, P7),
		eval_query_particle(current(called)~=melanie, 1000, P8),
		eval_query_particle(current(mission)~=none, 1000, P9),
		eval_query_particle(current(mission)~=want(robert,coke), 1000, P10),
		eval_query_particle(current(mission)~=want(melanie,coke), 1000, P11),
		eval_query_particle(current(mission)~=want(lynda,coke), 1000, P12),
		eval_query_particle(current(listened)~=(robert,want(robert,coke)), 1000, P13),
		eval_query_particle(current(listened)~=(lynda,want(lynda,coke)), 1000, P14),
		eval_query_particle(current(listened)~=(melanie,want(melanie,coke)), 1000, P15),
		eval_query_particle(current(listened)~=(none,none), 1000, P16),
    eval_query_particle(current(located(mbot))~=bed, 1000, P17),
    eval_query_particle(current(located(mbot))~=kitchen_table, 1000, P18),
    eval_query_particle(current(located(mbot))~=sofa, 1000, P19),
    eval_query_particle(current(located(robert))~=bed, 1000, P20),
    eval_query_particle(current(located(robert))~=kitchen_table, 1000, P21),
    eval_query_particle(current(located(robert))~=sofa, 1000, P22),
    eval_query_particle(current(located(lynda))~=bed, 1000, P23),
    eval_query_particle(current(located(lynda))~=kitchen_table, 1000, P24),
    eval_query_particle(current(located(lynda))~=sofa, 1000, P25),
    eval_query_particle(current(located(melanie))~=bed, 1000, P26),
    eval_query_particle(current(located(melanie))~=kitchen_table, 1000, P27),
    eval_query_particle(current(located(melanie))~=sofa, 1000, P28),
    eval_query_particle(current(near(robert))~=true, 1000, P29),
    eval_query_particle(current(near(robert))~=false, 1000, P30),
    eval_query_particle(current(near(lynda))~=true, 1000, P31),
    eval_query_particle(current(near(lynda))~=false, 1000, P32),
		eval_query_particle(current(near(melanie))~=true, 1000, P33),
    eval_query_particle(current(near(melanie))~=false, 1000, P34),
		write('mbot state is: \t '), write('idle: '), write(P1),
    write('\t conversation(robert): '), write(P2), write('\t conversation(lynda): '),
		write(P3), write('\t conversation(melanie): '), writeln(P4),
		write('mbot was called by: \t '), write('none: '), write(P5),
		write('\t robert: '), write(P6), write('\t lynda: '),
		write(P7), write('\t melanie: '), writeln(P8),
		write('mbot has mission: \t '), write('none: '), write(P9),
		write('\t want(robert,coke): '), write(P10), write('\t want(lynda,coke): '),
		write(P11), write('\t want(melanie,coke): '), writeln(P12),
		write('mbot listened: \t '), write('(none,none): '), write(P16),
		write('\t (robert,want(robert,coke)): '), write(P13), write('\t (lynda,want(lynda,coke)): '),
		write(P14), write('\t (melanie,want(melanie,coke)): '), writeln(P15),
    write('mbot is in the: \t '), write('bed: '), write(P17),
    write('\t kitchen_table: '), write(P18), write('\t sofa: '), writeln(P19),
    write('robert is in the: \t '), write('bed: '), write(P20),
    write('\t kitchen_table: '), write(P21), write('\t sofa: '), writeln(P22),
    write('lynda is in the: \t '), write('bed: '), write(P23),
    write('\t kitchen_table: '), write(P24), write('\t sofa: '), writeln(P25),
    write('melanie is in the: \t '), write('bed: '), write(P26),
    write('\t kitchen_table: '), write(P27), write('\t sofa: '), writeln(P28),
    write('mbot is near robert: \t '), write('true: '), write(P29),
    write('\t false: '), writeln(P30),
		write('mbot is near lynda: \t '), write('true: '), write(P31),
    write('\t false: '), writeln(P32),
    write('mbot is near melanie: \t '), write('true: '), write(P33),
    write('\t false: '), writeln(P34).
