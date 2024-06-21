--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abilities (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.abilities OWNER TO postgres;

--
-- Name: abilities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.abilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.abilities_id_seq OWNER TO postgres;

--
-- Name: abilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.abilities_id_seq OWNED BY public.abilities.id;


--
-- Name: pokemon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemon (
    id integer NOT NULL,
    name character varying NOT NULL,
    height integer NOT NULL,
    weight integer NOT NULL,
    xp integer NOT NULL
);


ALTER TABLE public.pokemon OWNER TO postgres;

--
-- Name: pokemon_abilities_abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemon_abilities_abilities (
    "pokemonId" integer NOT NULL,
    "abilitiesId" integer NOT NULL
);


ALTER TABLE public.pokemon_abilities_abilities OWNER TO postgres;

--
-- Name: pokemon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pokemon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pokemon_id_seq OWNER TO postgres;

--
-- Name: pokemon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pokemon_id_seq OWNED BY public.pokemon.id;


--
-- Name: pokemon_types_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemon_types_type (
    "pokemonId" integer NOT NULL,
    "typeId" integer NOT NULL
);


ALTER TABLE public.pokemon_types_type OWNER TO postgres;

--
-- Name: stat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stat (
    id integer NOT NULL,
    name character varying NOT NULL,
    base_stat integer NOT NULL,
    "pokemonsId" integer
);


ALTER TABLE public.stat OWNER TO postgres;

--
-- Name: stat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stat_id_seq OWNER TO postgres;

--
-- Name: stat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stat_id_seq OWNED BY public.stat.id;


--
-- Name: type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.type OWNER TO postgres;

--
-- Name: type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_id_seq OWNER TO postgres;

--
-- Name: type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_id_seq OWNED BY public.type.id;


--
-- Name: abilities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abilities ALTER COLUMN id SET DEFAULT nextval('public.abilities_id_seq'::regclass);


--
-- Name: pokemon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon ALTER COLUMN id SET DEFAULT nextval('public.pokemon_id_seq'::regclass);


--
-- Name: stat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stat ALTER COLUMN id SET DEFAULT nextval('public.stat_id_seq'::regclass);


--
-- Name: type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type ALTER COLUMN id SET DEFAULT nextval('public.type_id_seq'::regclass);


--
-- Data for Name: abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abilities (id, name) FROM stdin;
4	overgrow
5	chlorophyll
6	blaze
7	solar-power
8	torrent
9	rain-dish
10	shield-dust
11	run-away
12	shed-skin
13	compound-eyes
14	tinted-lens
15	swarm
16	sniper
17	keen-eye
18	tangled-feet
19	big-pecks
20	guts
21	hustle
22	intimidate
23	unnerve
24	static
25	lightning-rod
26	sand-veil
27	sand-rush
28	poison-point
29	rivalry
30	sheer-force
31	cute-charm
32	magic-guard
33	friend-guard
34	unaware
35	flash-fire
36	drought
37	competitive
38	frisk
39	inner-focus
40	infiltrator
41	stench
42	effect-spore
43	dry-skin
44	damp
45	wonder-skin
46	arena-trap
47	sand-force
48	pickup
49	technician
50	limber
51	cloud-nine
52	swift-swim
53	vital-spirit
54	anger-point
55	defiant
56	justified
57	water-absorb
58	synchronize
59	no-guard
60	steadfast
61	gluttony
62	clear-body
63	liquid-ooze
64	rock-head
65	sturdy
66	flame-body
67	oblivious
68	own-tempo
69	regenerator
70	magnet-pull
71	analytic
72	early-bird
73	thick-fat
74	hydration
75	ice-body
76	sticky-hold
77	poison-touch
78	shell-armor
79	skill-link
80	overcoat
81	levitate
82	cursed-body
83	weak-armor
84	insomnia
85	forewarn
86	hyper-cutter
87	soundproof
88	aftermath
89	harvest
90	battle-armor
91	reckless
92	unburden
93	iron-fist
94	natural-cure
95	serene-grace
96	healer
97	leaf-guard
98	scrappy
99	water-veil
100	illuminate
101	filter
102	mold-breaker
103	moxie
104	rattled
105	imposter
106	adaptability
107	anticipation
108	volt-absorb
109	quick-feet
110	trace
111	download
112	pressure
113	immunity
114	snow-cloak
115	marvel-scale
116	multiscale
\.


--
-- Data for Name: pokemon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokemon (id, name, height, weight, xp) FROM stdin;
1	bulbasaur	70	69	64
2	ivysaur	100	130	142
3	venusaur	200	1000	236
4	charmander	60	85	62
5	charmeleon	110	190	142
6	charizard	170	905	240
7	squirtle	50	90	63
8	wartortle	100	225	142
9	blastoise	160	855	239
10	caterpie	30	29	39
11	metapod	70	99	72
12	butterfree	110	320	178
13	weedle	30	32	39
14	kakuna	60	100	72
15	beedrill	100	295	178
16	pidgey	30	18	50
17	pidgeotto	110	300	122
18	pidgeot	150	395	216
19	rattata	30	35	51
20	raticate	70	185	145
21	spearow	30	20	52
22	fearow	120	380	155
23	ekans	200	69	58
24	arbok	350	650	157
25	pikachu	40	60	112
26	raichu	80	300	218
27	sandshrew	60	120	60
28	sandslash	100	295	158
29	nidoran-f	40	70	55
30	nidorina	80	200	128
31	nidoqueen	130	600	227
32	nidoran-m	50	90	55
33	nidorino	90	195	128
34	nidoking	140	620	227
35	clefairy	60	75	113
36	clefable	130	400	217
37	vulpix	60	99	60
38	ninetales	110	199	177
39	jigglypuff	50	55	95
40	wigglytuff	100	120	196
41	zubat	80	75	49
42	golbat	160	550	159
43	oddish	50	54	64
44	gloom	80	86	138
45	vileplume	120	186	221
46	paras	30	54	57
47	parasect	100	295	142
48	venonat	100	300	61
49	venomoth	150	125	158
50	diglett	20	8	53
51	dugtrio	70	333	149
52	meowth	40	42	58
53	persian	100	320	154
54	psyduck	80	196	64
55	golduck	170	766	175
56	mankey	50	280	61
57	primeape	100	320	159
58	growlithe	70	190	70
59	arcanine	190	1550	194
60	poliwag	60	124	60
61	poliwhirl	100	200	135
62	poliwrath	130	540	230
63	abra	90	195	62
64	kadabra	130	565	140
65	alakazam	150	480	225
66	machop	80	195	61
67	machoke	150	705	142
68	machamp	160	1300	227
69	bellsprout	70	40	60
70	weepinbell	100	64	137
71	victreebel	170	155	221
72	tentacool	90	455	67
73	tentacruel	160	550	180
74	geodude	40	200	60
75	graveler	100	1050	137
76	golem	140	3000	223
77	ponyta	100	300	82
78	rapidash	170	950	175
79	slowpoke	120	360	63
80	slowbro	160	785	172
81	magnemite	30	60	65
82	magneton	100	600	163
83	farfetchd	80	150	132
84	doduo	140	392	62
85	dodrio	180	852	165
86	seel	110	900	65
87	dewgong	170	1200	166
88	grimer	90	300	65
89	muk	120	300	175
90	shellder	30	40	61
91	cloyster	150	1325	184
92	gastly	130	1	62
93	haunter	160	1	142
94	gengar	150	405	225
95	onix	880	2100	77
96	drowzee	100	324	66
97	hypno	160	756	169
98	krabby	40	65	65
99	kingler	130	600	166
100	voltorb	50	104	66
101	electrode	120	666	172
102	exeggcute	40	25	65
103	exeggutor	200	1200	186
104	cubone	40	65	64
105	marowak	100	450	149
106	hitmonlee	150	498	159
107	hitmonchan	140	502	159
108	lickitung	120	655	77
109	koffing	60	10	68
110	weezing	120	95	172
111	rhyhorn	100	1150	69
112	rhydon	190	1200	170
113	chansey	110	346	395
114	tangela	100	350	87
115	kangaskhan	220	800	172
116	horsea	40	80	59
117	seadra	120	250	154
118	goldeen	60	150	64
119	seaking	130	390	158
120	staryu	80	345	68
121	starmie	110	800	182
122	mr-mime	130	545	161
123	scyther	150	560	100
124	jynx	140	406	159
125	electabuzz	110	300	172
126	magmar	130	445	173
127	pinsir	150	550	175
128	tauros	140	884	172
129	magikarp	90	100	40
130	gyarados	650	2350	189
131	lapras	250	2200	187
132	ditto	30	40	101
133	eevee	30	65	65
134	vaporeon	100	290	184
135	jolteon	80	245	184
136	flareon	90	250	184
137	porygon	80	365	79
138	omanyte	40	75	71
139	omastar	100	350	173
140	kabuto	50	115	71
141	kabutops	130	405	173
142	aerodactyl	180	590	180
143	snorlax	210	4600	189
144	articuno	170	554	261
145	zapdos	160	526	261
146	moltres	200	600	261
147	dratini	180	33	60
148	dragonair	400	165	147
149	dragonite	220	2100	270
150	mewtwo	200	1220	306
151	mew	40	40	270
\.


--
-- Data for Name: pokemon_abilities_abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokemon_abilities_abilities ("pokemonId", "abilitiesId") FROM stdin;
1	4
1	5
2	4
2	5
3	4
3	5
4	6
4	7
5	6
5	7
6	6
6	7
7	8
7	9
8	8
8	9
9	8
9	9
10	10
10	11
11	12
12	13
12	14
13	10
13	11
14	12
15	15
15	16
16	17
16	18
16	19
17	17
17	18
17	19
18	17
18	18
18	19
19	11
19	20
19	21
20	11
20	20
20	21
21	17
21	16
22	17
22	16
23	22
23	12
23	23
24	22
24	12
24	23
25	24
25	25
26	24
26	25
27	26
27	27
28	26
28	27
29	28
29	29
29	21
30	28
30	29
30	21
31	28
31	29
31	30
32	28
32	29
32	21
33	28
33	29
33	21
34	28
34	29
34	30
35	31
35	32
35	33
36	31
36	32
36	34
37	35
37	36
38	35
38	36
39	31
39	37
39	33
40	31
40	37
40	38
41	39
41	40
42	39
42	40
43	5
43	11
44	5
44	41
45	5
45	42
46	42
46	43
46	44
47	42
47	43
47	44
48	13
48	14
48	11
49	10
49	14
49	45
50	26
50	46
50	47
51	26
51	46
51	47
52	48
52	49
52	23
53	50
53	49
53	23
54	44
54	51
54	52
55	44
55	51
55	52
56	53
56	54
56	55
57	53
57	54
57	55
58	22
58	35
58	56
59	22
59	35
59	56
60	57
60	44
60	52
61	57
61	44
61	52
62	57
62	44
62	52
63	58
63	39
63	32
64	58
64	39
64	32
65	58
65	39
65	32
66	20
66	59
66	60
67	20
67	59
67	60
68	20
68	59
68	60
69	5
69	61
70	5
70	61
71	5
71	61
72	62
72	63
72	9
73	62
73	63
73	9
74	64
74	65
74	26
75	64
75	65
75	26
76	64
76	65
76	26
77	11
77	35
77	66
78	11
78	35
78	66
79	67
79	68
79	69
80	67
80	68
80	69
81	70
81	65
81	71
82	70
82	65
82	71
83	17
83	39
83	55
84	11
84	72
84	18
85	11
85	72
85	18
86	73
86	74
86	75
87	73
87	74
87	75
88	41
88	76
88	77
89	41
89	76
89	77
90	78
90	79
90	80
91	78
91	79
91	80
92	81
93	81
94	82
95	64
95	65
95	83
96	84
96	85
96	39
97	84
97	85
97	39
98	86
98	78
98	30
99	86
99	78
99	30
100	87
100	24
100	88
101	87
101	24
101	88
102	5
102	89
103	5
103	89
104	64
104	25
104	90
105	64
105	25
105	90
106	50
106	91
106	92
107	17
107	93
107	39
108	68
108	67
108	51
109	81
110	81
111	25
111	64
111	91
112	25
112	64
112	91
113	94
113	95
113	96
114	5
114	97
114	69
115	72
115	98
115	39
116	52
116	16
116	44
117	28
117	16
117	44
118	52
118	99
118	25
119	52
119	99
119	25
120	100
120	94
120	71
121	100
121	94
121	71
122	87
122	101
122	49
123	15
123	49
123	60
124	67
124	85
124	43
125	24
125	53
126	66
126	53
127	86
127	102
127	103
128	22
128	54
128	30
129	52
129	104
130	22
130	103
131	57
131	78
131	74
132	50
132	105
133	11
133	106
133	107
134	57
134	74
135	108
135	109
136	35
136	20
137	110
137	111
137	71
138	52
138	78
138	83
139	52
139	78
139	83
140	52
140	90
140	83
141	52
141	90
141	83
142	64
142	112
142	23
143	113
143	73
143	61
144	112
144	114
145	112
145	24
146	112
146	66
147	12
147	115
148	12
148	115
149	39
149	116
150	112
150	23
151	58
\.


--
-- Data for Name: pokemon_types_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokemon_types_type ("pokemonId", "typeId") FROM stdin;
1	1
1	2
2	1
2	2
3	1
3	2
4	3
5	3
6	3
6	4
7	5
8	5
9	5
10	6
11	6
12	6
12	4
13	6
13	2
14	6
14	2
15	6
15	2
16	7
16	4
17	7
17	4
18	7
18	4
19	7
20	7
21	7
21	4
22	7
22	4
23	2
24	2
25	8
26	8
27	9
28	9
29	2
30	2
31	2
31	9
32	2
33	2
34	2
34	9
35	10
36	10
37	3
38	3
39	7
39	10
40	7
40	10
41	2
41	4
42	2
42	4
43	1
43	2
44	1
44	2
45	1
45	2
46	6
46	1
47	6
47	1
48	6
48	2
49	6
49	2
50	9
51	9
52	7
53	7
54	5
55	5
56	11
57	11
58	3
59	3
60	5
61	5
62	5
62	11
63	12
64	12
65	12
66	11
67	11
68	11
69	1
69	2
70	1
70	2
71	1
71	2
72	5
72	2
73	5
73	2
74	13
74	9
75	13
75	9
76	13
76	9
77	3
78	3
79	5
79	12
80	5
80	12
81	8
81	14
82	8
82	14
83	7
83	4
84	7
84	4
85	7
85	4
86	5
87	5
87	15
88	2
89	2
90	5
91	5
91	15
92	16
92	2
93	16
93	2
94	16
94	2
95	13
95	9
96	12
97	12
98	5
99	5
100	8
101	8
102	1
102	12
103	1
103	12
104	9
105	9
106	11
107	11
108	7
109	2
110	2
111	9
111	13
112	9
112	13
113	7
114	1
115	7
116	5
117	5
118	5
119	5
120	5
121	5
121	12
122	12
122	10
123	6
123	4
124	15
124	12
125	8
126	3
127	6
128	7
129	5
130	5
130	4
131	5
131	15
132	7
133	7
134	5
135	8
136	3
137	7
138	13
138	5
139	13
139	5
140	13
140	5
141	13
141	5
142	13
142	4
143	7
144	15
144	4
145	8
145	4
146	3
146	4
147	17
148	17
149	17
149	4
150	12
151	12
\.


--
-- Data for Name: stat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stat (id, name, base_stat, "pokemonsId") FROM stdin;
2	hp	45	1
3	attack	49	1
4	defense	49	1
5	special-attack	65	1
6	special-defense	65	1
7	speed	45	1
8	hp	60	2
9	attack	62	2
10	defense	63	2
11	special-attack	80	2
12	special-defense	80	2
13	speed	60	2
14	hp	80	3
15	attack	82	3
16	defense	83	3
17	special-attack	100	3
18	special-defense	100	3
19	speed	80	3
20	hp	39	4
21	attack	52	4
22	defense	43	4
23	special-attack	60	4
24	special-defense	50	4
25	speed	65	4
26	hp	58	5
27	attack	64	5
28	defense	58	5
29	special-attack	80	5
30	special-defense	65	5
31	speed	80	5
32	hp	78	6
33	attack	84	6
34	defense	78	6
35	special-attack	109	6
36	special-defense	85	6
37	speed	100	6
38	hp	44	7
39	attack	48	7
40	defense	65	7
41	special-attack	50	7
42	special-defense	64	7
43	speed	43	7
44	hp	59	8
45	attack	63	8
46	defense	80	8
47	special-attack	65	8
48	special-defense	80	8
49	speed	58	8
50	hp	79	9
51	attack	83	9
52	defense	100	9
53	special-attack	85	9
54	special-defense	105	9
55	speed	78	9
56	hp	45	10
57	attack	30	10
58	defense	35	10
59	special-attack	20	10
60	special-defense	20	10
61	speed	45	10
62	hp	50	11
63	attack	20	11
64	defense	55	11
65	special-attack	25	11
66	special-defense	25	11
67	speed	30	11
68	hp	60	12
69	attack	45	12
70	defense	50	12
71	special-attack	90	12
72	special-defense	80	12
73	speed	70	12
74	hp	40	13
75	attack	35	13
76	defense	30	13
77	special-attack	20	13
78	special-defense	20	13
79	speed	50	13
80	hp	45	14
81	attack	25	14
82	defense	50	14
83	special-attack	25	14
84	special-defense	25	14
85	speed	35	14
86	hp	65	15
87	attack	90	15
88	defense	40	15
89	special-attack	45	15
90	special-defense	80	15
91	speed	75	15
92	hp	40	16
93	attack	45	16
94	defense	40	16
95	special-attack	35	16
96	special-defense	35	16
97	speed	56	16
98	hp	63	17
99	attack	60	17
100	defense	55	17
101	special-attack	50	17
102	special-defense	50	17
103	speed	71	17
104	hp	83	18
105	attack	80	18
106	defense	75	18
107	special-attack	70	18
108	special-defense	70	18
109	speed	101	18
110	hp	30	19
111	attack	56	19
112	defense	35	19
113	special-attack	25	19
114	special-defense	35	19
115	speed	72	19
116	hp	55	20
117	attack	81	20
118	defense	60	20
119	special-attack	50	20
120	special-defense	70	20
121	speed	97	20
122	hp	40	21
123	attack	60	21
124	defense	30	21
125	special-attack	31	21
126	special-defense	31	21
127	speed	70	21
128	hp	65	22
129	attack	90	22
130	defense	65	22
131	special-attack	61	22
132	special-defense	61	22
133	speed	100	22
134	hp	35	23
135	attack	60	23
136	defense	44	23
137	special-attack	40	23
138	special-defense	54	23
139	speed	55	23
140	hp	60	24
141	attack	95	24
142	defense	69	24
143	special-attack	65	24
144	special-defense	79	24
145	speed	80	24
146	hp	35	25
147	attack	55	25
148	defense	40	25
149	special-attack	50	25
150	special-defense	50	25
151	speed	90	25
152	hp	60	26
153	attack	90	26
154	defense	55	26
155	special-attack	90	26
156	special-defense	80	26
157	speed	110	26
158	hp	50	27
159	attack	75	27
160	defense	85	27
161	special-attack	20	27
162	special-defense	30	27
163	speed	40	27
164	hp	75	28
165	attack	100	28
166	defense	110	28
167	special-attack	45	28
168	special-defense	55	28
169	speed	65	28
170	hp	55	29
171	attack	47	29
172	defense	52	29
173	special-attack	40	29
174	special-defense	40	29
175	speed	41	29
176	hp	70	30
177	attack	62	30
178	defense	67	30
179	special-attack	55	30
180	special-defense	55	30
181	speed	56	30
182	hp	90	31
183	attack	92	31
184	defense	87	31
185	special-attack	75	31
186	special-defense	85	31
187	speed	76	31
188	hp	46	32
189	attack	57	32
190	defense	40	32
191	special-attack	40	32
192	special-defense	40	32
193	speed	50	32
194	hp	61	33
195	attack	72	33
196	defense	57	33
197	special-attack	55	33
198	special-defense	55	33
199	speed	65	33
200	hp	81	34
201	attack	102	34
202	defense	77	34
203	special-attack	85	34
204	special-defense	75	34
205	speed	85	34
206	hp	70	35
207	attack	45	35
208	defense	48	35
209	special-attack	60	35
210	special-defense	65	35
211	speed	35	35
212	hp	95	36
213	attack	70	36
214	defense	73	36
215	special-attack	95	36
216	special-defense	90	36
217	speed	60	36
218	hp	38	37
219	attack	41	37
220	defense	40	37
221	special-attack	50	37
222	special-defense	65	37
223	speed	65	37
224	hp	73	38
225	attack	76	38
226	defense	75	38
227	special-attack	81	38
228	special-defense	100	38
229	speed	100	38
230	hp	115	39
231	attack	45	39
232	defense	20	39
233	special-attack	45	39
234	special-defense	25	39
235	speed	20	39
236	hp	140	40
237	attack	70	40
238	defense	45	40
239	special-attack	85	40
240	special-defense	50	40
241	speed	45	40
242	hp	40	41
243	attack	45	41
244	defense	35	41
245	special-attack	30	41
246	special-defense	40	41
247	speed	55	41
248	hp	75	42
249	attack	80	42
250	defense	70	42
251	special-attack	65	42
252	special-defense	75	42
253	speed	90	42
254	hp	45	43
255	attack	50	43
256	defense	55	43
257	special-attack	75	43
258	special-defense	65	43
259	speed	30	43
260	hp	60	44
261	attack	65	44
262	defense	70	44
263	special-attack	85	44
264	special-defense	75	44
265	speed	40	44
266	hp	75	45
267	attack	80	45
268	defense	85	45
269	special-attack	110	45
270	special-defense	90	45
271	speed	50	45
272	hp	35	46
273	attack	70	46
274	defense	55	46
275	special-attack	45	46
276	special-defense	55	46
277	speed	25	46
278	hp	60	47
279	attack	95	47
280	defense	80	47
281	special-attack	60	47
282	special-defense	80	47
283	speed	30	47
284	hp	60	48
285	attack	55	48
286	defense	50	48
287	special-attack	40	48
288	special-defense	55	48
289	speed	45	48
290	hp	70	49
291	attack	65	49
292	defense	60	49
293	special-attack	90	49
294	special-defense	75	49
295	speed	90	49
296	hp	10	50
297	attack	55	50
298	defense	25	50
299	special-attack	35	50
300	special-defense	45	50
301	speed	95	50
302	hp	35	51
303	attack	100	51
304	defense	50	51
305	special-attack	50	51
306	special-defense	70	51
307	speed	120	51
308	hp	40	52
309	attack	45	52
310	defense	35	52
311	special-attack	40	52
312	special-defense	40	52
313	speed	90	52
314	hp	65	53
315	attack	70	53
316	defense	60	53
317	special-attack	65	53
318	special-defense	65	53
319	speed	115	53
320	hp	50	54
321	attack	52	54
322	defense	48	54
323	special-attack	65	54
324	special-defense	50	54
325	speed	55	54
326	hp	80	55
327	attack	82	55
328	defense	78	55
329	special-attack	95	55
330	special-defense	80	55
331	speed	85	55
332	hp	40	56
333	attack	80	56
334	defense	35	56
335	special-attack	35	56
336	special-defense	45	56
337	speed	70	56
338	hp	65	57
339	attack	105	57
340	defense	60	57
341	special-attack	60	57
342	special-defense	70	57
343	speed	95	57
344	hp	55	58
345	attack	70	58
346	defense	45	58
347	special-attack	70	58
348	special-defense	50	58
349	speed	60	58
350	hp	90	59
351	attack	110	59
352	defense	80	59
353	special-attack	100	59
354	special-defense	80	59
355	speed	95	59
356	hp	40	60
357	attack	50	60
358	defense	40	60
359	special-attack	40	60
360	special-defense	40	60
361	speed	90	60
362	hp	65	61
363	attack	65	61
364	defense	65	61
365	special-attack	50	61
366	special-defense	50	61
367	speed	90	61
368	hp	90	62
369	attack	95	62
370	defense	95	62
371	special-attack	70	62
372	special-defense	90	62
373	speed	70	62
374	hp	25	63
375	attack	20	63
376	defense	15	63
377	special-attack	105	63
378	special-defense	55	63
379	speed	90	63
380	hp	40	64
381	attack	35	64
382	defense	30	64
383	special-attack	120	64
384	special-defense	70	64
385	speed	105	64
386	hp	55	65
387	attack	50	65
388	defense	45	65
389	special-attack	135	65
390	special-defense	95	65
391	speed	120	65
392	hp	70	66
393	attack	80	66
394	defense	50	66
395	special-attack	35	66
396	special-defense	35	66
397	speed	35	66
398	hp	80	67
399	attack	100	67
400	defense	70	67
401	special-attack	50	67
402	special-defense	60	67
403	speed	45	67
404	hp	90	68
405	attack	130	68
406	defense	80	68
407	special-attack	65	68
408	special-defense	85	68
409	speed	55	68
410	hp	50	69
411	attack	75	69
412	defense	35	69
413	special-attack	70	69
414	special-defense	30	69
415	speed	40	69
416	hp	65	70
417	attack	90	70
418	defense	50	70
419	special-attack	85	70
420	special-defense	45	70
421	speed	55	70
422	hp	80	71
423	attack	105	71
424	defense	65	71
425	special-attack	100	71
426	special-defense	70	71
427	speed	70	71
428	hp	40	72
429	attack	40	72
430	defense	35	72
431	special-attack	50	72
432	special-defense	100	72
433	speed	70	72
434	hp	80	73
435	attack	70	73
436	defense	65	73
437	special-attack	80	73
438	special-defense	120	73
439	speed	100	73
440	hp	40	74
441	attack	80	74
442	defense	100	74
443	special-attack	30	74
444	special-defense	30	74
445	speed	20	74
446	hp	55	75
447	attack	95	75
448	defense	115	75
449	special-attack	45	75
450	special-defense	45	75
451	speed	35	75
452	hp	80	76
453	attack	120	76
454	defense	130	76
455	special-attack	55	76
456	special-defense	65	76
457	speed	45	76
458	hp	50	77
459	attack	85	77
460	defense	55	77
461	special-attack	65	77
462	special-defense	65	77
463	speed	90	77
464	hp	65	78
465	attack	100	78
466	defense	70	78
467	special-attack	80	78
468	special-defense	80	78
469	speed	105	78
470	hp	90	79
471	attack	65	79
472	defense	65	79
473	special-attack	40	79
474	special-defense	40	79
475	speed	15	79
476	hp	95	80
477	attack	75	80
478	defense	110	80
479	special-attack	100	80
480	special-defense	80	80
481	speed	30	80
482	hp	25	81
483	attack	35	81
484	defense	70	81
485	special-attack	95	81
486	special-defense	55	81
487	speed	45	81
488	hp	50	82
489	attack	60	82
490	defense	95	82
491	special-attack	120	82
492	special-defense	70	82
493	speed	70	82
494	hp	52	83
495	attack	90	83
496	defense	55	83
497	special-attack	58	83
498	special-defense	62	83
499	speed	60	83
500	hp	35	84
501	attack	85	84
502	defense	45	84
503	special-attack	35	84
504	special-defense	35	84
505	speed	75	84
506	hp	60	85
507	attack	110	85
508	defense	70	85
509	special-attack	60	85
510	special-defense	60	85
511	speed	110	85
512	hp	65	86
513	attack	45	86
514	defense	55	86
515	special-attack	45	86
516	special-defense	70	86
517	speed	45	86
518	hp	90	87
519	attack	70	87
520	defense	80	87
521	special-attack	70	87
522	special-defense	95	87
523	speed	70	87
524	hp	80	88
525	attack	80	88
526	defense	50	88
527	special-attack	40	88
528	special-defense	50	88
529	speed	25	88
530	hp	105	89
531	attack	105	89
532	defense	75	89
533	special-attack	65	89
534	special-defense	100	89
535	speed	50	89
536	hp	30	90
537	attack	65	90
538	defense	100	90
539	special-attack	45	90
540	special-defense	25	90
541	speed	40	90
542	hp	50	91
543	attack	95	91
544	defense	180	91
545	special-attack	85	91
546	special-defense	45	91
547	speed	70	91
548	hp	30	92
549	attack	35	92
550	defense	30	92
551	special-attack	100	92
552	special-defense	35	92
553	speed	80	92
554	hp	45	93
555	attack	50	93
556	defense	45	93
557	special-attack	115	93
558	special-defense	55	93
559	speed	95	93
560	hp	60	94
561	attack	65	94
562	defense	60	94
563	special-attack	130	94
564	special-defense	75	94
565	speed	110	94
566	hp	35	95
567	attack	45	95
568	defense	160	95
569	special-attack	30	95
570	special-defense	45	95
571	speed	70	95
572	hp	60	96
573	attack	48	96
574	defense	45	96
575	special-attack	43	96
576	special-defense	90	96
577	speed	42	96
578	hp	85	97
579	attack	73	97
580	defense	70	97
581	special-attack	73	97
582	special-defense	115	97
583	speed	67	97
584	hp	30	98
585	attack	105	98
586	defense	90	98
587	special-attack	25	98
588	special-defense	25	98
589	speed	50	98
590	hp	55	99
591	attack	130	99
592	defense	115	99
593	special-attack	50	99
594	special-defense	50	99
595	speed	75	99
596	hp	40	100
597	attack	30	100
598	defense	50	100
599	special-attack	55	100
600	special-defense	55	100
601	speed	100	100
602	hp	60	101
603	attack	50	101
604	defense	70	101
605	special-attack	80	101
606	special-defense	80	101
607	speed	150	101
608	hp	60	102
609	attack	40	102
610	defense	80	102
611	special-attack	60	102
612	special-defense	45	102
613	speed	40	102
614	hp	95	103
615	attack	95	103
616	defense	85	103
617	special-attack	125	103
618	special-defense	75	103
619	speed	55	103
620	hp	50	104
621	attack	50	104
622	defense	95	104
623	special-attack	40	104
624	special-defense	50	104
625	speed	35	104
626	hp	60	105
627	attack	80	105
628	defense	110	105
629	special-attack	50	105
630	special-defense	80	105
631	speed	45	105
632	hp	50	106
633	attack	120	106
634	defense	53	106
635	special-attack	35	106
636	special-defense	110	106
637	speed	87	106
638	hp	50	107
639	attack	105	107
640	defense	79	107
641	special-attack	35	107
642	special-defense	110	107
643	speed	76	107
644	hp	90	108
645	attack	55	108
646	defense	75	108
647	special-attack	60	108
648	special-defense	75	108
649	speed	30	108
650	hp	40	109
651	attack	65	109
652	defense	95	109
653	special-attack	60	109
654	special-defense	45	109
655	speed	35	109
656	hp	65	110
657	attack	90	110
658	defense	120	110
659	special-attack	85	110
660	special-defense	70	110
661	speed	60	110
662	hp	80	111
663	attack	85	111
664	defense	95	111
665	special-attack	30	111
666	special-defense	30	111
667	speed	25	111
668	hp	105	112
669	attack	130	112
670	defense	120	112
671	special-attack	45	112
672	special-defense	45	112
673	speed	40	112
674	hp	250	113
675	attack	5	113
676	defense	5	113
677	special-attack	35	113
678	special-defense	105	113
679	speed	50	113
680	hp	65	114
681	attack	55	114
682	defense	115	114
683	special-attack	100	114
684	special-defense	40	114
685	speed	60	114
686	hp	105	115
687	attack	95	115
688	defense	80	115
689	special-attack	40	115
690	special-defense	80	115
691	speed	90	115
692	hp	30	116
693	attack	40	116
694	defense	70	116
695	special-attack	70	116
696	special-defense	25	116
697	speed	60	116
698	hp	55	117
699	attack	65	117
700	defense	95	117
701	special-attack	95	117
702	special-defense	45	117
703	speed	85	117
704	hp	45	118
705	attack	67	118
706	defense	60	118
707	special-attack	35	118
708	special-defense	50	118
709	speed	63	118
710	hp	80	119
711	attack	92	119
712	defense	65	119
713	special-attack	65	119
714	special-defense	80	119
715	speed	68	119
716	hp	30	120
717	attack	45	120
718	defense	55	120
719	special-attack	70	120
720	special-defense	55	120
721	speed	85	120
722	hp	60	121
723	attack	75	121
724	defense	85	121
725	special-attack	100	121
726	special-defense	85	121
727	speed	115	121
728	hp	40	122
729	attack	45	122
730	defense	65	122
731	special-attack	100	122
732	special-defense	120	122
733	speed	90	122
734	hp	70	123
735	attack	110	123
736	defense	80	123
737	special-attack	55	123
738	special-defense	80	123
739	speed	105	123
740	hp	65	124
741	attack	50	124
742	defense	35	124
743	special-attack	115	124
744	special-defense	95	124
745	speed	95	124
746	hp	65	125
747	attack	83	125
748	defense	57	125
749	special-attack	95	125
750	special-defense	85	125
751	speed	105	125
752	hp	65	126
753	attack	95	126
754	defense	57	126
755	special-attack	100	126
756	special-defense	85	126
757	speed	93	126
758	hp	65	127
759	attack	125	127
760	defense	100	127
761	special-attack	55	127
762	special-defense	70	127
763	speed	85	127
764	hp	75	128
765	attack	100	128
766	defense	95	128
767	special-attack	40	128
768	special-defense	70	128
769	speed	110	128
770	hp	20	129
771	attack	10	129
772	defense	55	129
773	special-attack	15	129
774	special-defense	20	129
775	speed	80	129
776	hp	95	130
777	attack	125	130
778	defense	79	130
779	special-attack	60	130
780	special-defense	100	130
781	speed	81	130
782	hp	130	131
783	attack	85	131
784	defense	80	131
785	special-attack	85	131
786	special-defense	95	131
787	speed	60	131
788	hp	48	132
789	attack	48	132
790	defense	48	132
791	special-attack	48	132
792	special-defense	48	132
793	speed	48	132
794	hp	55	133
795	attack	55	133
796	defense	50	133
797	special-attack	45	133
798	special-defense	65	133
799	speed	55	133
800	hp	130	134
801	attack	65	134
802	defense	60	134
803	special-attack	110	134
804	special-defense	95	134
805	speed	65	134
806	hp	65	135
807	attack	65	135
808	defense	60	135
809	special-attack	110	135
810	special-defense	95	135
811	speed	130	135
812	hp	65	136
813	attack	130	136
814	defense	60	136
815	special-attack	95	136
816	special-defense	110	136
817	speed	65	136
818	hp	65	137
819	attack	60	137
820	defense	70	137
821	special-attack	85	137
822	special-defense	75	137
823	speed	40	137
824	hp	35	138
825	attack	40	138
826	defense	100	138
827	special-attack	90	138
828	special-defense	55	138
829	speed	35	138
830	hp	70	139
831	attack	60	139
832	defense	125	139
833	special-attack	115	139
834	special-defense	70	139
835	speed	55	139
836	hp	30	140
837	attack	80	140
838	defense	90	140
839	special-attack	55	140
840	special-defense	45	140
841	speed	55	140
842	hp	60	141
843	attack	115	141
844	defense	105	141
845	special-attack	65	141
846	special-defense	70	141
847	speed	80	141
848	hp	80	142
849	attack	105	142
850	defense	65	142
851	special-attack	60	142
852	special-defense	75	142
853	speed	130	142
854	hp	160	143
855	attack	110	143
856	defense	65	143
857	special-attack	65	143
858	special-defense	110	143
859	speed	30	143
860	hp	90	144
861	attack	85	144
862	defense	100	144
863	special-attack	95	144
864	special-defense	125	144
865	speed	85	144
866	hp	90	145
867	attack	90	145
868	defense	85	145
869	special-attack	125	145
870	special-defense	90	145
871	speed	100	145
872	hp	90	146
873	attack	100	146
874	defense	90	146
875	special-attack	125	146
876	special-defense	85	146
877	speed	90	146
878	hp	41	147
879	attack	64	147
880	defense	45	147
881	special-attack	50	147
882	special-defense	50	147
883	speed	50	147
884	hp	61	148
885	attack	84	148
886	defense	65	148
887	special-attack	70	148
888	special-defense	70	148
889	speed	70	148
890	hp	91	149
891	attack	134	149
892	defense	95	149
893	special-attack	100	149
894	special-defense	100	149
895	speed	80	149
896	hp	106	150
897	attack	110	150
898	defense	90	150
899	special-attack	154	150
900	special-defense	90	150
901	speed	130	150
902	hp	100	151
903	attack	100	151
904	defense	100	151
905	special-attack	100	151
906	special-defense	100	151
907	speed	100	151
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type (id, name) FROM stdin;
1	grass
2	poison
3	fire
4	flying
5	water
6	bug
7	normal
8	electric
9	ground
10	fairy
11	fighting
12	psychic
13	rock
14	steel
15	ice
16	ghost
17	dragon
\.


--
-- Name: abilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.abilities_id_seq', 116, true);


--
-- Name: pokemon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pokemon_id_seq', 1, false);


--
-- Name: stat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stat_id_seq', 907, true);


--
-- Name: type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_id_seq', 17, true);


--
-- Name: pokemon_abilities_abilities PK_001168f224b5568bd64fef12bde; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon_abilities_abilities
    ADD CONSTRAINT "PK_001168f224b5568bd64fef12bde" PRIMARY KEY ("pokemonId", "abilitiesId");


--
-- Name: pokemon PK_0b503db1369f46c43f8da0a6a0a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT "PK_0b503db1369f46c43f8da0a6a0a" PRIMARY KEY (id);


--
-- Name: stat PK_132de903d366f4c06cd586c43c0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stat
    ADD CONSTRAINT "PK_132de903d366f4c06cd586c43c0" PRIMARY KEY (id);


--
-- Name: type PK_40410d6bf0bedb43f9cadae6fef; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT "PK_40410d6bf0bedb43f9cadae6fef" PRIMARY KEY (id);


--
-- Name: abilities PK_8cd72b52f6374bf02333abf365a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT "PK_8cd72b52f6374bf02333abf365a" PRIMARY KEY (id);


--
-- Name: pokemon_types_type PK_a8afd7b7d3aece1bd6769654151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon_types_type
    ADD CONSTRAINT "PK_a8afd7b7d3aece1bd6769654151" PRIMARY KEY ("pokemonId", "typeId");


--
-- Name: IDX_5e88787f10d14c8eeea650e17e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_5e88787f10d14c8eeea650e17e" ON public.pokemon_abilities_abilities USING btree ("pokemonId");


--
-- Name: IDX_619160e91e3bd092a91a43402e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_619160e91e3bd092a91a43402e" ON public.pokemon_abilities_abilities USING btree ("abilitiesId");


--
-- Name: IDX_788d754ccb53a6313e2e5728ac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_788d754ccb53a6313e2e5728ac" ON public.pokemon_types_type USING btree ("pokemonId");


--
-- Name: IDX_d0000de9d0f384f22fd75983bb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d0000de9d0f384f22fd75983bb" ON public.pokemon_types_type USING btree ("typeId");


--
-- Name: stat FK_4764c2f85db921fcc401fc8dcc1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stat
    ADD CONSTRAINT "FK_4764c2f85db921fcc401fc8dcc1" FOREIGN KEY ("pokemonsId") REFERENCES public.pokemon(id);


--
-- Name: pokemon_abilities_abilities FK_5e88787f10d14c8eeea650e17ee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon_abilities_abilities
    ADD CONSTRAINT "FK_5e88787f10d14c8eeea650e17ee" FOREIGN KEY ("pokemonId") REFERENCES public.pokemon(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pokemon_abilities_abilities FK_619160e91e3bd092a91a43402eb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon_abilities_abilities
    ADD CONSTRAINT "FK_619160e91e3bd092a91a43402eb" FOREIGN KEY ("abilitiesId") REFERENCES public.abilities(id);


--
-- Name: pokemon_types_type FK_788d754ccb53a6313e2e5728ac2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon_types_type
    ADD CONSTRAINT "FK_788d754ccb53a6313e2e5728ac2" FOREIGN KEY ("pokemonId") REFERENCES public.pokemon(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pokemon_types_type FK_d0000de9d0f384f22fd75983bbe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemon_types_type
    ADD CONSTRAINT "FK_d0000de9d0f384f22fd75983bbe" FOREIGN KEY ("typeId") REFERENCES public.type(id);


--
-- PostgreSQL database dump complete
--

