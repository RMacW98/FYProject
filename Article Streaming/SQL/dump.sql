--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15
-- Dumped by pg_dump version 10.15

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: CryptoCaller; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "CryptoCaller";


ALTER SCHEMA "CryptoCaller" OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: article_fact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article_fact (
    dateid integer,
    timeid integer,
    title character varying(500),
    url character varying(100),
    comp_sentiment numeric(5,4)
);


ALTER TABLE public.article_fact OWNER TO postgres;

--
-- Name: article_fact1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article_fact1 (
    dateid integer,
    timeid integer,
    title character varying(500),
    url character varying(100),
    comp_sentiment numeric(5,4)
);


ALTER TABLE public.article_fact1 OWNER TO postgres;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: date_dim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.date_dim (
    dateid integer NOT NULL,
    full_date character varying(20),
    dd integer,
    mm integer,
    yy integer
);


ALTER TABLE public.date_dim OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: polls_choice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polls_choice (
    id integer NOT NULL,
    choice_text character varying(200) NOT NULL,
    votes integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE public.polls_choice OWNER TO postgres;

--
-- Name: polls_choice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.polls_choice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polls_choice_id_seq OWNER TO postgres;

--
-- Name: polls_choice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.polls_choice_id_seq OWNED BY public.polls_choice.id;


--
-- Name: polls_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polls_profile (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.polls_profile OWNER TO postgres;

--
-- Name: polls_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.polls_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polls_profile_id_seq OWNER TO postgres;

--
-- Name: polls_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.polls_profile_id_seq OWNED BY public.polls_profile.id;


--
-- Name: polls_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polls_question (
    id integer NOT NULL,
    question_text character varying(200) NOT NULL,
    pub_date timestamp with time zone NOT NULL
);


ALTER TABLE public.polls_question OWNER TO postgres;

--
-- Name: polls_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.polls_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polls_question_id_seq OWNER TO postgres;

--
-- Name: polls_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.polls_question_id_seq OWNED BY public.polls_question.id;


--
-- Name: sentiment_dim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sentiment_dim (
    dateid integer,
    timeid integer,
    trading_symbol character varying(10),
    comp_sentiment numeric(5,4)
);


ALTER TABLE public.sentiment_dim OWNER TO postgres;

--
-- Name: time_dim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_dim (
    timeid integer NOT NULL,
    "time" character varying,
    hour integer,
    minute integer
);


ALTER TABLE public.time_dim OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: polls_choice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_choice ALTER COLUMN id SET DEFAULT nextval('public.polls_choice_id_seq'::regclass);


--
-- Name: polls_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_profile ALTER COLUMN id SET DEFAULT nextval('public.polls_profile_id_seq'::regclass);


--
-- Name: polls_question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_question ALTER COLUMN id SET DEFAULT nextval('public.polls_question_id_seq'::regclass);


--
-- Data for Name: article_fact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article_fact (dateid, timeid, title, url, comp_sentiment) FROM stdin;
25	747	Big Investors Stacked Up Ether as Price Rose to Record High	null	0.9818
25	927	Bitcoin price rises as second biggest cryptocurrency ether hits all time high	null	0.9682
25	747	ETH breaks out vs Bitcoin What s next for Ethereum after 100 gain in January	null	0.9818
25	927	Grayscale donates 1M to Coin Center pledges up to 1M more in matched contributions	null	0.7906
25	807	Here s Why Ethereum Could Beat Bitcoin As Best Asset Of 2021	null	0.7717
25	1227	All risk no gain The vague definition of stablecoins is causing problems	null	0.9705
25	927	First Mover Bitcoin Flushes Weak Hands as Ethereum Hits New All Time High	null	0.9590
25	747	Big Investors Stacked up Ether as Price Rose to Record High CoinDesk	null	0.9818
25	1047	I ve been convinced to buy Bitcoin the odds are in my favour	null	0.6808
25	987	Crypto Markets Show More Signs of Excess Amid Bitcoin Rebound	null	0.9818
25	1347	Crypto Hedge Funds Underperformed Bitcoin During Rally Last Year	null	0.9682
25	1167	Marathon Patent Is Not a Wise Play Even for Crypto Bulls	null	0.8862
25	507	FOREX Dollar gains as stimulus nerves nudge investors to safety	null	0.9840
25	1347	45B DeFi market cap and soaring TVL suggest the best is yet to come	null	0.9986
25	147	Warning Signal the messaging app s new features are causing internal turmoil	null	-0.5994
25	867	Two Arrested for Orchestrating Escape of Wirecard Exec Accused of Fraud CoinDesk	null	-0.8126
25	387	FOREX Dollar gains as stimulus nerves nudge investors to safety By Reuters	null	0.9840
25	1287	Substack Newsletters Are Being Used to Spread Crypto Scams	null	-0.5859
25	627	Global Markets Start Week On Positive Note Ethereum Rally In Focus	null	0.9766
25	987	Crypto Markets Show More Signs of Excess Amid Bitcoin Rebound	null	0.9818
26	1372	Is GBTC Stock A Good Buy After Bitcoin Tumbles From Highs	null	-0.9968
26	1432	Bitcoin Warren Buffett won t touch it and here s why	null	0.5719
26	1252	Bitcoin Falls as Miners Sell Institutions Watch Yellen	null	-0.9993
26	1372	DeFi tokens bag double digit gains as bears pin Bitcoin price below 33K	null	0.9325
26	1312	How scammers siphoned 36B in fraudulent unemployment payments from US	null	-0.7269
26	1432	SkyBridge s Anthony Scaramucci Talks Up New Bitcoin Fund Crypto s Exponential Liftoff	null	0.7906
26	1432	SkyBridge s Scaramucci Talks Up New Bitcoin Fund Crypto s Exponential Liftoff	null	0.7906
26	428	Signal is drama free for now but it should prepare for the worst	null	-0.9944
26	1185	Maybe Having A Crypto Expert At SEC s Helm Isn t So Great For Crypto Company Being Sued By SEC	null	0.6590
26	1372	Is GBTC Stock A Good Buy After Bitcoin Tumbles From Highs	null	-0.9968
26	1432	Bitcoin Warren Buffett won t touch it and here s why	null	0.5719
26	1252	Bitcoin Falls as Miners Sell Institutions Watch Yellen	null	-0.9993
26	1372	DeFi tokens bag double digit gains as bears pin Bitcoin price below 33K	null	0.9325
26	1312	How scammers siphoned 36B in fraudulent unemployment payments from US	null	-0.7269
26	1432	SkyBridge s Anthony Scaramucci Talks Up New Bitcoin Fund Crypto s Exponential Liftoff	null	0.7906
26	1432	SkyBridge s Scaramucci Talks Up New Bitcoin Fund Crypto s Exponential Liftoff	null	0.7906
26	428	Signal is drama free for now but it should prepare for the worst	null	-0.9944
26	1185	Maybe Having A Crypto Expert At SEC s Helm Isn t So Great For Crypto Company Being Sued By SEC	null	0.6590
26	147	Bearish Divergence Hints At First Major Chainlink Corrective Phase	null	-0.9970
26	1347	Harvard Yale Brown Endowments Have Been Buying Bitcoin for at Least a Year Sources	null	0.9325
26	1167	The Soul Killing Wallet Emptying Struggle to Buy a Video Card During a Pandemic	null	-0.8074
26	1407	More Institutional Investors Are Buying Ether Seeing It as a Store of Value CoinDesk	null	0.9468
26	387	FOREX Dollar gains as stimulus nerves nudge investors to safety	null	0.9840
27	652	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	1168	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	1012	Bitcoin Bounces Off 30 000 as Record Momentum Fades	null	0.9818
27	652	American Cancer Society Launches 1M Cryptocurrency Fund CoinDesk	null	-0.6597
27	652	3 Unstoppable Stocks That ll Crush Bitcoin in 2021 The Motley Fool	null	-0.6486
27	892	American Cancer Society To Use Cryptocurrency To Fight Cancer	null	-0.9081
27	532	US Man Sentenced to Prison for Embezzling 20M of ICO Investors Funds CoinDesk	null	-0.5267
27	952	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin	null	-0.5829
27	292	Litecoin Falls 10 In Rout By Investing com	null	-0.9993
27	292	Litecoin Falls 10 20 In Selloff By Investing com	null	-0.9997
27	292	Cardano Falls 10 17 In Selloff By Investing com	null	-0.9997
27	292	Litecoin Falls 10 20 In Rout	null	-0.9993
27	292	Cardano Falls 10 17 In Rout	null	-0.9993
27	532	US Man Sentenced to Prison for Embezzling 20M of ICO Investors Funds	null	-0.5267
27	1072	Polkadot Price Prediction DOT poised to rise higher as ecosystem continues to grow rapidly	null	0.9834
27	952	Stock trading platforms suffer tech problems amid market mayhem	null	-0.7351
27	292	Shorts Now Paying the Longs Funding Rates on BTC ETH Perps Going Negative Across the Board	null	-0.5719
27	592	Scams are driving South African authorities to regulate crypto trading	null	-0.5859
27	952	Big Name Ivy League Endowments Are Now Buying Bitcoin ETF Trends	null	0.9325
27	892	TronGo s Launch A New Era of Decentralized Reward Systems Begins	null	0.5719
27	892	Scaramucci Says the GameStop Saga Is Positive for Bitcoin	null	0.5574
27	712	Lawsuit Against Israeli Crypto Entrepreneur Moshe Hegog Fails in US Court CoinDesk	null	-0.5719
27	712	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com CA	null	-0.9978
27	652	3 Unstoppable Stocks at All Time Highs That You Can Still Buy The Motley Fool	null	-0.5719
27	292	Crypterium to crowdfund on Seedrs monthly profits rise 10X during Coronavirus pandemic By BTC Peers	null	0.9847
27	352	GameStop Is Rage Against the Financial Machine	null	-0.5574
27	292	Scaramucci Says the GameStop Phenomenon Is Positive for Bitcoin	null	0.5574
27	1072	National Crime Agency warns novice and veteran traders alike of rise in clone company scams ZDNet	null	0.9652
27	952	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin CoinDesk	null	-0.5829
27	712	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com	null	-0.9978
27	292	Bitcoin Nearing 50 Day Moving Average Whales Are Back to Buying	null	0.9325
27	1165	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	676	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	652	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	1168	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	1012	Bitcoin Bounces Off 30 000 as Record Momentum Fades	null	0.9818
27	652	American Cancer Society Launches 1M Cryptocurrency Fund CoinDesk	null	-0.6597
27	652	3 Unstoppable Stocks That ll Crush Bitcoin in 2021 The Motley Fool	null	-0.6486
27	892	American Cancer Society To Use Cryptocurrency To Fight Cancer	null	-0.9081
27	532	US Man Sentenced to Prison for Embezzling 20M of ICO Investors Funds CoinDesk	null	-0.5267
27	952	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin	null	-0.5829
27	292	Litecoin Falls 10 In Rout By Investing com	null	-0.9993
27	292	Litecoin Falls 10 20 In Selloff By Investing com	null	-0.9997
27	292	Cardano Falls 10 17 In Selloff By Investing com	null	-0.9997
27	292	Litecoin Falls 10 20 In Rout	null	-0.9993
27	292	Cardano Falls 10 17 In Rout	null	-0.9993
27	532	US Man Sentenced to Prison for Embezzling 20M of ICO Investors Funds	null	-0.5267
27	1072	Polkadot Price Prediction DOT poised to rise higher as ecosystem continues to grow rapidly	null	0.9834
27	952	Stock trading platforms suffer tech problems amid market mayhem	null	-0.7351
27	292	Shorts Now Paying the Longs Funding Rates on BTC ETH Perps Going Negative Across the Board	null	-0.5719
27	592	Scams are driving South African authorities to regulate crypto trading	null	-0.5859
27	952	Big Name Ivy League Endowments Are Now Buying Bitcoin ETF Trends	null	0.9325
27	892	TronGo s Launch A New Era of Decentralized Reward Systems Begins	null	0.5719
27	892	Scaramucci Says the GameStop Saga Is Positive for Bitcoin	null	0.5574
27	712	Lawsuit Against Israeli Crypto Entrepreneur Moshe Hegog Fails in US Court CoinDesk	null	-0.5719
27	712	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com CA	null	-0.9978
27	652	3 Unstoppable Stocks at All Time Highs That You Can Still Buy The Motley Fool	null	-0.5719
27	292	Crypterium to crowdfund on Seedrs monthly profits rise 10X during Coronavirus pandemic By BTC Peers	null	0.9847
27	352	GameStop Is Rage Against the Financial Machine	null	-0.5574
27	292	Scaramucci Says the GameStop Phenomenon Is Positive for Bitcoin	null	0.5574
27	1072	National Crime Agency warns novice and veteran traders alike of rise in clone company scams ZDNet	null	0.9652
27	952	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin CoinDesk	null	-0.5829
27	712	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com	null	-0.9978
27	292	Bitcoin Nearing 50 Day Moving Average Whales Are Back to Buying	null	0.9325
27	1165	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	676	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	1045	Bitcoin Bounces Off 30 000 as Record Momentum Fades	null	0.9818
27	685	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	1165	Bitcoin s Best Days Lie Ahead	null	0.6369
27	685	3 Unstoppable Stocks That ll Crush Bitcoin in 2021 The Motley Fool	null	-0.6486
27	805	5 Hard to Believe Bitcoin Facts The Motley Fool	null	-0.5106
27	685	American Cancer Society Launches 1M Cryptocurrency Fund CoinDesk	null	-0.6597
27	925	American Cancer Society To Use Cryptocurrency To Fight Cancer	null	-0.9081
27	925	Bitcoin Bounces Off 30 000 as Record Momentum Fades	null	0.9818
27	1165	Reddit teams up with the Ethereum Foundation to bring the value and independence to millions of	null	0.8555
27	1405	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	985	Bitcoin crashes below 30 000 as slump continues	null	-0.9993
27	1105	Polkadot Price Prediction DOT poised to rise higher as ecosystem continues to grow rapidly	null	0.9834
27	925	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin	null	-0.5829
27	1405	Cybercops derail malware botnet FBI makes ransomware arrest Times Leader	null	-0.5574
27	925	Stock trading platforms suffer tech problems amid market mayhem	null	-0.7351
27	805	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	805	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	805	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	805	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	1405	3 reasons why Uniswap UNI token hit a new all time high above 15	null	0.9682
27	1225	International operation derails malware botnet FBI makes ransomware arrest	null	-0.5719
27	1285	Capitol riots Who has the FBI arrested so far	null	-0.7506
27	1225	Fed React Don t trigger a tantrum GameStop still rising Apple on deck Oil can t hold EIA gains	null	0.9781
27	1165	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	745	Bitcoin Briefly Dips Below 30K Dollar Bounces Ahead of Fed Reserve Rate Announcement	null	0.9818
27	1165	Bitcoin BTC Bulls Bid Support Refuse to Surrender	null	0.9382
27	1105	National Crime Agency warns novice and veteran traders alike of rise in clone company scams ZDNet	null	0.9652
27	1045	U S Opening Bell Earnings Virus Concerns Spur Tech Shares Gold Slumps Investing com UK	null	-0.9978
27	925	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin CoinDesk	null	-0.5829
29	1264	What is Dogecoin and Why Are People Buying It	null	0.9325
27	745	Lawsuit Against Israeli Crypto Entrepreneur Moshe Hegog Fails in US Court CoinDesk	null	-0.5719
27	745	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com CA	null	-0.9978
27	745	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com	null	-0.9978
27	805	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	1165	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	676	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	557	US Man Sentenced to Prison for Embezzling 20M of ICO Investors Funds	null	-0.5267
27	1174	These are the best ways to invest 20 000	null	0.6369
27	1046	Bitcoin Bounces Off 30 000 as Record Momentum Fades	null	0.9818
27	686	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	1166	Bitcoin s Best Days Lie Ahead	null	0.6369
27	686	3 Unstoppable Stocks That ll Crush Bitcoin in 2021 The Motley Fool	null	-0.6486
27	806	5 Hard to Believe Bitcoin Facts The Motley Fool	null	-0.5106
27	686	American Cancer Society Launches 1M Cryptocurrency Fund CoinDesk	null	-0.6597
27	926	American Cancer Society To Use Cryptocurrency To Fight Cancer	null	-0.9081
27	926	Bitcoin Bounces Off 30 000 as Record Momentum Fades	null	0.9818
27	1166	Reddit teams up with the Ethereum Foundation to bring the value and independence to millions of	null	0.8555
27	1406	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	986	Bitcoin crashes below 30 000 as slump continues	null	-0.9993
27	1106	Polkadot Price Prediction DOT poised to rise higher as ecosystem continues to grow rapidly	null	0.9834
27	926	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin	null	-0.5829
27	1406	Cybercops derail malware botnet FBI makes ransomware arrest Times Leader	null	-0.5574
27	926	Stock trading platforms suffer tech problems amid market mayhem	null	-0.7351
27	806	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	806	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	806	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	806	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	1406	3 reasons why Uniswap UNI token hit a new all time high above 15	null	0.9682
27	1226	International operation derails malware botnet FBI makes ransomware arrest	null	-0.5719
27	1286	Capitol riots Who has the FBI arrested so far	null	-0.7506
27	1226	Fed React Don t trigger a tantrum GameStop still rising Apple on deck Oil can t hold EIA gains	null	0.9781
27	1166	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	746	Bitcoin Briefly Dips Below 30K Dollar Bounces Ahead of Fed Reserve Rate Announcement	null	0.9818
27	1166	Bitcoin BTC Bulls Bid Support Refuse to Surrender	null	0.9382
27	1106	National Crime Agency warns novice and veteran traders alike of rise in clone company scams ZDNet	null	0.9652
27	1046	U S Opening Bell Earnings Virus Concerns Spur Tech Shares Gold Slumps Investing com UK	null	-0.9978
27	926	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin CoinDesk	null	-0.5829
27	746	Lawsuit Against Israeli Crypto Entrepreneur Moshe Hegog Fails in US Court CoinDesk	null	-0.5719
27	746	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com CA	null	-0.9978
27	746	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com	null	-0.9978
27	806	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	1165	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	676	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	557	US Man Sentenced to Prison for Embezzling 20M of ICO Investors Funds	null	-0.5267
27	1174	These are the best ways to invest 20 000	null	0.6369
28	445	Reddit Ties Up With Ethereum Foundation To Hasten Bringing Community Points On Blockchain	null	0.7906
28	445	Reddit Ties Up With Ethereum Foundation To Hasten Bringing Community Points On Blockchain	null	0.7906
28	385	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
28	265	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
28	265	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
28	265	Ethereum Price Forecast ETH on chain metrics remain strongly bullish upswing to 1 500 eyed	null	0.9971
28	505	The US Department of Justice unveils worldwide action against NetWalker ransomware seizes 450	null	0.5267
28	352	Dogecoin Shoots Up 62 As SatoshiStreetBets Looks To Emulate WallStreetBets Success With GameStop	null	0.8934
28	446	Reddit Ties Up With Ethereum Foundation To Hasten Bringing Community Points On Blockchain	null	0.7906
28	446	Reddit Ties Up With Ethereum Foundation To Hasten Bringing Community Points On Blockchain	null	0.7906
28	386	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
28	266	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
28	266	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
28	266	Ethereum Price Forecast ETH on chain metrics remain strongly bullish upswing to 1 500 eyed	null	0.9971
28	506	The US Department of Justice unveils worldwide action against NetWalker ransomware seizes 450	null	0.5267
28	352	Dogecoin Shoots Up 62 As SatoshiStreetBets Looks To Emulate WallStreetBets Success With GameStop	null	0.8934
28	644	WallStreetBets Fever Hits Dogecoin Price Soars 142	null	0.9985
28	1364	Bitcoin soars 11 after Elon Musk namecheck on Twitter	null	0.9985
29	224	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
28	1004	Hot DOGE Meme Based Cryptocurrency Soars More Than 800 to Record High	null	0.9990
28	1004	Bitcoin Jumps Above 35 000 as Musk Tweets About Crypto	null	0.9970
29	104	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
28	1004	Silvergate Capital s Common Stock Issuance Is Another Sign of Confidence for the Company	null	0.5106
38	515	Green hackers around the world let s destroy Bitcoin	null	-0.5423
29	224	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
28	824	Cryptocurrency Crime Drops in 2020 but DeFi Breaches Rise Study Finds	null	0.9910
28	1424	Dogecoin DOGE shoots 270 higher as WallStreetBets starts to pick up on crypto CryptoSlate	null	0.7906
29	284	XRP Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
29	284	XRP Climbs 10 45 In Bullish Trade	null	0.9970
28	1364	Altcoins soar after 10 Bitcoin price breakout flips 33K back to support	null	0.9493
28	1124	Bitcoin What is the Death Cross That Heralds the Sharp Fall of This Cryptocurrency	null	-0.5994
29	44	Litecoin Climbs 10 11 In Rally	null	0.9682
29	44	Bitcoin Climbs 10 18 In Rally	null	0.9682
29	44	Litecoin Climbs 10 In Bullish Trade By Investing com	null	0.9970
28	1424	Bitcoin Climbs 10 In Bullish Trade By Investing com	null	0.9970
28	884	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds	null	0.9910
28	824	Grayscale prepares for DeFi future with new cryptocurrency trust filings	null	0.5106
28	884	Cryptocurrency crime drops in 2020 but DeFi breaches rise CyberNews	null	0.9910
29	164	Ray Dalio Clears His Stance On Bitcoin Calls Is Amazing Accomplishment	null	0.6249
28	1424	Bitcoin s Rebound Accelerates With Push Back Above 34 000	null	0.9818
29	164	Ray Dalio Clears His Stance On Bitcoin Calls Is Amazing Accomplishment	null	0.6249
28	944	Dogecoin hits new all time high amid Wall Street Bets mania	null	0.9682
28	944	Dalio Expects to Soon Offer Alt Cash Fund Says Bitcoin Won t Escape Our Scrutiny CoinDesk	null	0.6597
29	560	Australian Crypto Exchange to Delist BSV Over Bullying Threat to Bitcoin Developers	null	-0.8074
28	704	Digital Asset Manager Grayscale Eyes DeFi Space With New Trust Filings	null	0.7003
28	644	WallStreetBets Fever Hits Dogecoin Price Soars 142 After Twitter Mention CoinDesk	null	0.9985
28	1424	Bitcoin Climbs 10 18 In Rally By Investing com	null	0.9682
28	644	Analyst Chinese New Year could drive Bitcoin selling pressure	null	-0.9451
28	824	DOJ charges suspect in NetWalker ransomware attacks	null	-0.7351
28	884	Europol Spanish Police Bust Alleged Scam Posing as Crypto Investment Training Firm	null	-0.5719
29	464	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
28	1124	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1124	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1124	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1004	Value of holding bitcoin surpassing trading value	null	0.5859
28	1004	Bitcoin Rebounds From Early Losses Markets Still Distracted by GameStop CoinDesk	null	-0.6249
28	944	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	944	Robinhood Slammed After Halting Users From Buying Surging Stocks	null	0.9325
28	944	Robinhood Slammed After Halting Users From Buying Surging Stocks	null	0.9325
28	944	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
28	884	Robinhood suspends buying for GameStop following stonks going to the moon	null	0.9325
28	764	It s never been more important to safeguard your data These ads might make you actually care	null	0.6434
28	704	OTC Markets Group Announces the 2021 OTCQX Best 50	null	0.6369
28	1364	DOGE tweet volume up 1800 becomes first altcoin to surpass Bitcoin ever The Tie	null	0.7906
28	1244	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
28	824	ALPHA surges 152 in one week What s behind its meteoric rally	null	0.9682
29	224	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	464	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
28	1004	Grimes Wrote A Poem About GameStop s Stock Market Chaos	null	-0.6908
28	944	Robinhood Slammed After Halting Users From Buying Surging Stocks	null	0.9325
28	944	American Airlines shares surge 80 thanks to Reddit after forum s revolution	null	0.6249
28	1304	Short Squeeze Volatility With GME AMC O Neil Portfolio Manager On Navigating Risk In Crazy	null	-0.5423
28	1184	New Grayscale trust filings spin rumour mill into overdrive for Cardano Polkadot Cosmos and more	null	0.5106
28	1124	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	884	Square Stock Is a Great Pick in a Toxic Environment	null	0.6249
28	704	OTC Markets Group Announces the 2021 OTCQX Best 50	null	0.6369
28	1064	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
29	560	MicroStrategy Bond Buyers Rewarded With Win Tie Bitcoin Play	null	0.8555
28	944	Prime Trust tZERO Partner on Digital Asset Custody Trading	null	0.7003
29	560	How Do We Regain Trust in Institutions	null	0.5106
28	704	Wall Street s fear gauge just logged its biggest rise in two years as the battle between Reddit	null	0.9726
29	131	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
28	848	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1126	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
28	1095	Here are the best investing app alternatives to Robinhood	null	0.6369
28	665	3 Popular Robinhood Stocks That Could Be Better Than Bitcoin in 2021	null	0.6908
28	1170	How much does H R Block cost Here s how much you ll pay to prepare and file your tax return	null	-0.5106
28	1291	After Robinhood Restricts GameStop Bitcoin And Crypto Market Suddenly Soars Toward 1 Trillion Dogecoin Price Rockets 200	null	0.9984
28	1068	Huge demand for Nvidia RTX 3000 cards led scalpers to 15 2 million in profit	null	0.5719
28	654	WallStreetBets Fever Hits Dogecoin Price Soars 142	null	0.9985
28	1374	Bitcoin soars 11 after Elon Musk namecheck on Twitter	null	0.9985
29	234	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
28	1014	Hot DOGE Meme Based Cryptocurrency Soars More Than 800 to Record High	null	0.9990
28	1014	Bitcoin Jumps Above 35 000 as Musk Tweets About Crypto	null	0.9970
29	114	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
28	1014	Silvergate Capital s Common Stock Issuance Is Another Sign of Confidence for the Company	null	0.5106
29	234	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
28	834	Cryptocurrency Crime Drops in 2020 but DeFi Breaches Rise Study Finds	null	0.9910
28	1434	Dogecoin DOGE shoots 270 higher as WallStreetBets starts to pick up on crypto CryptoSlate	null	0.7906
29	294	XRP Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
29	294	XRP Climbs 10 45 In Bullish Trade	null	0.9970
28	1374	Altcoins soar after 10 Bitcoin price breakout flips 33K back to support	null	0.9493
28	1134	Bitcoin What is the Death Cross That Heralds the Sharp Fall of This Cryptocurrency	null	-0.5994
29	54	Litecoin Climbs 10 11 In Rally	null	0.9682
29	54	Bitcoin Climbs 10 18 In Rally	null	0.9682
29	54	Litecoin Climbs 10 In Bullish Trade By Investing com	null	0.9970
28	1434	Bitcoin Climbs 10 In Bullish Trade By Investing com	null	0.9970
28	894	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds	null	0.9910
28	834	Grayscale prepares for DeFi future with new cryptocurrency trust filings	null	0.5106
28	894	Cryptocurrency crime drops in 2020 but DeFi breaches rise CyberNews	null	0.9910
29	174	Ray Dalio Clears His Stance On Bitcoin Calls Is Amazing Accomplishment	null	0.6249
28	1434	Bitcoin s Rebound Accelerates With Push Back Above 34 000	null	0.9818
29	174	Ray Dalio Clears His Stance On Bitcoin Calls Is Amazing Accomplishment	null	0.6249
28	954	Dogecoin hits new all time high amid Wall Street Bets mania	null	0.9682
28	954	Dalio Expects to Soon Offer Alt Cash Fund Says Bitcoin Won t Escape Our Scrutiny CoinDesk	null	0.6597
29	570	Australian Crypto Exchange to Delist BSV Over Bullying Threat to Bitcoin Developers	null	-0.8074
28	714	Digital Asset Manager Grayscale Eyes DeFi Space With New Trust Filings	null	0.7003
28	654	WallStreetBets Fever Hits Dogecoin Price Soars 142 After Twitter Mention CoinDesk	null	0.9985
28	1434	Bitcoin Climbs 10 18 In Rally By Investing com	null	0.9682
28	654	Analyst Chinese New Year could drive Bitcoin selling pressure	null	-0.9451
28	834	DOJ charges suspect in NetWalker ransomware attacks	null	-0.7351
28	894	Europol Spanish Police Bust Alleged Scam Posing as Crypto Investment Training Firm	null	-0.5719
29	474	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
28	1134	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1134	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1134	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1014	Value of holding bitcoin surpassing trading value	null	0.5859
28	1014	Bitcoin Rebounds From Early Losses Markets Still Distracted by GameStop CoinDesk	null	-0.6249
28	954	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	954	Robinhood Slammed After Halting Users From Buying Surging Stocks	null	0.9325
28	954	Robinhood Slammed After Halting Users From Buying Surging Stocks	null	0.9325
28	954	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
28	894	Robinhood suspends buying for GameStop following stonks going to the moon	null	0.9325
28	774	It s never been more important to safeguard your data These ads might make you actually care	null	0.6434
28	714	OTC Markets Group Announces the 2021 OTCQX Best 50	null	0.6369
28	1374	DOGE tweet volume up 1800 becomes first altcoin to surpass Bitcoin ever The Tie	null	0.7906
28	1254	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
28	834	ALPHA surges 152 in one week What s behind its meteoric rally	null	0.9682
29	234	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	474	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
28	1014	Grimes Wrote A Poem About GameStop s Stock Market Chaos	null	-0.6908
28	954	Robinhood Slammed After Halting Users From Buying Surging Stocks	null	0.9325
28	954	American Airlines shares surge 80 thanks to Reddit after forum s revolution	null	0.6249
28	1314	Short Squeeze Volatility With GME AMC O Neil Portfolio Manager On Navigating Risk In Crazy	null	-0.5423
28	1194	New Grayscale trust filings spin rumour mill into overdrive for Cardano Polkadot Cosmos and more	null	0.5106
28	1134	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	894	Square Stock Is a Great Pick in a Toxic Environment	null	0.6249
28	714	OTC Markets Group Announces the 2021 OTCQX Best 50	null	0.6369
28	1074	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
29	570	MicroStrategy Bond Buyers Rewarded With Win Tie Bitcoin Play	null	0.8555
28	954	Prime Trust tZERO Partner on Digital Asset Custody Trading	null	0.7003
29	570	How Do We Regain Trust in Institutions	null	0.5106
28	714	Wall Street s fear gauge just logged its biggest rise in two years as the battle between Reddit	null	0.9726
29	131	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
28	848	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1126	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
28	1095	Here are the best investing app alternatives to Robinhood	null	0.6369
28	665	3 Popular Robinhood Stocks That Could Be Better Than Bitcoin in 2021	null	0.6908
28	1170	How much does H R Block cost Here s how much you ll pay to prepare and file your tax return	null	-0.5106
28	1291	After Robinhood Restricts GameStop Bitcoin And Crypto Market Suddenly Soars Toward 1 Trillion Dogecoin Price Rockets 200	null	0.9984
28	1068	Huge demand for Nvidia RTX 3000 cards led scalpers to 15 2 million in profit	null	0.5719
29	1000	Robinhood blocks cryptocurrency trading blames extraordinary market conditions	null	-0.5574
29	820	Dogecoin Price Up 975 After Elon Musk s Tweet WallStreetBets Pump	null	0.7906
29	400	Reddit frenzy pumps up Dogecoin a cryptocurrency started as a joke by over 800	null	0.7845
28	1360	Will the SEC s Lawsuit Lead to Ripple Failing to Reach Its Potential	null	-0.6249
29	640	Stablecoin holdings on crypto exchanges hit a new all time high	null	0.9682
29	760	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	1060	What s Next For Bitcoin In An Era Of Helicopter Money Negative	null	-0.5719
29	580	Price of worthless cryptocurrency skyrockets by 1 000 thanks to GameStop stock fiasco	null	-0.5106
29	280	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	880	Dogecoin Jumps 600 as Meme Crypto Rides GameStop Retail Wave	null	0.9970
29	820	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	580	Elon Musk sends Bitcoin soaring 20pc live updates	null	0.9985
28	1240	Bitcoin What is the Death Cross That Heralds the Sharp Fall of This Cryptocurrency	null	-0.5994
29	520	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1060	Cryptocurrency Crime Drops in 2020 but Decentralized Finance Losses Rise Study	null	0.9892
29	760	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	940	Robinhood restricts crypto trading as Dogecoin soars 300 percent	null	0.9984
29	760	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	880	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	760	Dogecoin Becomes Most Mentioned Crypto on Twitter Ever as Price Soars	null	0.9985
29	340	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
29	100	Bitcoin Jumps Above 38 000 as Musk Adds It to Twitter Profile	null	0.9970
29	700	Bitcoin Soars 14 After Elon Musk Namecheck on Twitter	null	0.9985
29	760	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	340	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
29	640	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	640	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	460	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	460	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	460	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	460	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	460	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	460	XRP Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
29	100	Dogecoin DOGE shoots 270 higher as WallStreetBets starts to pick up on crypto CryptoSlate	null	0.7906
29	460	Wall Street Just Made the Best Case for Bitcoin Ethereum DeFi Get Ready for Mass Adoption	null	0.7717
29	700	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	460	XRP Climbs 10 45 In Rally By Investing com	null	0.9682
29	820	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	460	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	1122	Kraken Coinbase Suffer Outages Amid Market Volatility	null	-0.5423
29	940	How A Little Bird Is Delivering Trust	null	0.5106
29	1120	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1060	Who s getting rich off GameStop s stock The market makers and middlemen including Robinhood	null	0.5574
29	1060	Dow Jones Today Stocks Drop To Test Support Caterpillar Climbs Bitcoin Rallies Short Squeeze	null	-0.9968
29	1000	Ray Dalio Bitcoin is gold like but governments won t let it win	null	0.9186
29	940	Here s why Elon Musk s simple Twitter bio change rocketed Bitcoin up 18 CryptoSlate	null	0.7906
29	1000	Zombies not welcome Original altcoins lose ground to DeFi newcomers	null	-0.7304
29	880	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	820	Billionaire Leon Cooperman says GameStop surge will end very badly for the public and decries	null	-0.5256
29	580	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
29	760	Join Us in Miami Love Masters of the Universe	null	0.7506
29	460	Google reportedly scraps thousands of negative Robinhood reviews By Cointelegraph	null	-0.5719
29	460	Robinhood Raises Over 1 Billion In Emergency Funds As Platform Struggles With Reddit Fuelled	null	-0.6249
29	460	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	460	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	460	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	460	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	1060	Opinion Who s getting rich off GameStop s stock The market makers and middlemen including	null	0.5574
29	1000	U S Stocks Open Lower as GameStop Frenzy Builds	null	-0.5423
29	1000	Dow slides 200 points on concerns of retail investors speculative trading	null	-0.9970
29	1000	World s richest man Elon Musk boosts Bitcoin price by 20 Is 40K back in play	null	0.7964
29	820	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	700	Bitcoin soars by 5K in minutes BTC hits 38K after Elon Musk s Dogecoin treatment	null	0.9985
28	1240	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	1240	The 8 best investing app alternatives to Robinhood	null	0.6369
28	1240	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1240	The 8 best investing app alternatives to Robinhood	null	0.6369
29	1156	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
29	1156	The biggest investors in space are cheering on the GameStop trade	null	0.5106
29	460	GameStop back on the rise as Robinhood eases trading ban	null	0.9792
29	400	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	40	DOGE tweet volume up 1800 becomes first altcoin to surpass Bitcoin ever The Tie	null	0.7906
29	460	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
28	1420	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
29	1140	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	220	SEC issues warning as GameStop short selling war resumes	null	-0.9652
29	1156	Tim Cook says companies are misleading users and exploiting data as public feud with Facebook	null	-0.7906
29	100	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	100	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	100	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	100	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	820	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	940	Jon Stewart gets a warm welcome on Twitter after joining to defend Reddit traders	null	0.5994
29	640	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
29	520	FTSE 100 falls expected as GameStop Reddit fallout blows through global markets	null	-0.9993
28	1420	Short Squeeze Volatility With GME AMC O Neil Portfolio Manager On Navigating Risk In Crazy	null	-0.5423
28	1240	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1240	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1240	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
29	131	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	660	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	586	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	569	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
28	848	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1126	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
28	1095	Here are the best investing app alternatives to Robinhood	null	0.6369
28	665	3 Popular Robinhood Stocks That Could Be Better Than Bitcoin in 2021	null	0.6908
29	1001	Robinhood blocks cryptocurrency trading blames extraordinary market conditions	null	-0.5574
29	821	Dogecoin Price Up 975 After Elon Musk s Tweet WallStreetBets Pump	null	0.7906
29	401	Reddit frenzy pumps up Dogecoin a cryptocurrency started as a joke by over 800	null	0.7845
28	1361	Will the SEC s Lawsuit Lead to Ripple Failing to Reach Its Potential	null	-0.6249
29	641	Stablecoin holdings on crypto exchanges hit a new all time high	null	0.9682
29	761	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	1061	What s Next For Bitcoin In An Era Of Helicopter Money Negative	null	-0.5719
29	581	Price of worthless cryptocurrency skyrockets by 1 000 thanks to GameStop stock fiasco	null	-0.5106
29	281	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	881	Dogecoin Jumps 600 as Meme Crypto Rides GameStop Retail Wave	null	0.9970
29	821	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	581	Elon Musk sends Bitcoin soaring 20pc live updates	null	0.9985
28	1241	Bitcoin What is the Death Cross That Heralds the Sharp Fall of This Cryptocurrency	null	-0.5994
29	521	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1061	Cryptocurrency Crime Drops in 2020 but Decentralized Finance Losses Rise Study	null	0.9892
29	761	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	941	Robinhood restricts crypto trading as Dogecoin soars 300 percent	null	0.9984
29	761	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	881	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	761	Dogecoin Becomes Most Mentioned Crypto on Twitter Ever as Price Soars	null	0.9985
29	341	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
29	101	Bitcoin Jumps Above 38 000 as Musk Adds It to Twitter Profile	null	0.9970
29	701	Bitcoin Soars 14 After Elon Musk Namecheck on Twitter	null	0.9985
29	761	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	341	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
29	641	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	641	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	461	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	461	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	461	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	461	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	461	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	461	XRP Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
29	101	Dogecoin DOGE shoots 270 higher as WallStreetBets starts to pick up on crypto CryptoSlate	null	0.7906
29	461	Wall Street Just Made the Best Case for Bitcoin Ethereum DeFi Get Ready for Mass Adoption	null	0.7717
29	701	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	461	XRP Climbs 10 45 In Rally By Investing com	null	0.9682
29	821	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	461	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	1123	Kraken Coinbase Suffer Outages Amid Market Volatility	null	-0.5423
29	941	How A Little Bird Is Delivering Trust	null	0.5106
29	1121	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1061	Who s getting rich off GameStop s stock The market makers and middlemen including Robinhood	null	0.5574
29	1061	Dow Jones Today Stocks Drop To Test Support Caterpillar Climbs Bitcoin Rallies Short Squeeze	null	-0.9968
29	1001	Ray Dalio Bitcoin is gold like but governments won t let it win	null	0.9186
29	941	Here s why Elon Musk s simple Twitter bio change rocketed Bitcoin up 18 CryptoSlate	null	0.7906
29	1001	Zombies not welcome Original altcoins lose ground to DeFi newcomers	null	-0.7304
29	881	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	821	Billionaire Leon Cooperman says GameStop surge will end very badly for the public and decries	null	-0.5256
29	581	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
29	761	Join Us in Miami Love Masters of the Universe	null	0.7506
29	461	Google reportedly scraps thousands of negative Robinhood reviews By Cointelegraph	null	-0.5719
29	461	Robinhood Raises Over 1 Billion In Emergency Funds As Platform Struggles With Reddit Fuelled	null	-0.6249
29	461	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	461	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	461	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	461	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	1061	Opinion Who s getting rich off GameStop s stock The market makers and middlemen including	null	0.5574
29	1001	U S Stocks Open Lower as GameStop Frenzy Builds	null	-0.5423
29	1001	Dow slides 200 points on concerns of retail investors speculative trading	null	-0.9970
29	1001	World s richest man Elon Musk boosts Bitcoin price by 20 Is 40K back in play	null	0.7964
29	821	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	701	Bitcoin soars by 5K in minutes BTC hits 38K after Elon Musk s Dogecoin treatment	null	0.9985
28	1241	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	1241	The 8 best investing app alternatives to Robinhood	null	0.6369
28	1241	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1241	The 8 best investing app alternatives to Robinhood	null	0.6369
29	1157	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
29	1157	The biggest investors in space are cheering on the GameStop trade	null	0.5106
29	461	GameStop back on the rise as Robinhood eases trading ban	null	0.9792
29	401	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	41	DOGE tweet volume up 1800 becomes first altcoin to surpass Bitcoin ever The Tie	null	0.7906
29	461	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
28	1421	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
29	1141	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	221	SEC issues warning as GameStop short selling war resumes	null	-0.9652
29	1157	Tim Cook says companies are misleading users and exploiting data as public feud with Facebook	null	-0.7906
29	101	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	101	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	101	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	101	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	821	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	941	Jon Stewart gets a warm welcome on Twitter after joining to defend Reddit traders	null	0.5994
29	641	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
29	521	FTSE 100 falls expected as GameStop Reddit fallout blows through global markets	null	-0.9993
28	1421	Short Squeeze Volatility With GME AMC O Neil Portfolio Manager On Navigating Risk In Crazy	null	-0.5423
28	1241	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1241	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1241	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
29	131	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	660	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	586	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	569	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
28	848	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1126	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
28	1095	Here are the best investing app alternatives to Robinhood	null	0.6369
28	665	3 Popular Robinhood Stocks That Could Be Better Than Bitcoin in 2021	null	0.6908
29	1007	Robinhood blocks cryptocurrency trading blames extraordinary market conditions	null	-0.5574
29	827	Dogecoin Price Up 975 After Elon Musk s Tweet WallStreetBets Pump	null	0.7906
29	407	Reddit frenzy pumps up Dogecoin a cryptocurrency started as a joke by over 800	null	0.7845
28	1367	Will the SEC s Lawsuit Lead to Ripple Failing to Reach Its Potential	null	-0.6249
29	647	Stablecoin holdings on crypto exchanges hit a new all time high	null	0.9682
29	767	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	1067	What s Next For Bitcoin In An Era Of Helicopter Money Negative	null	-0.5719
29	587	Price of worthless cryptocurrency skyrockets by 1 000 thanks to GameStop stock fiasco	null	-0.5106
29	287	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	887	Dogecoin Jumps 600 as Meme Crypto Rides GameStop Retail Wave	null	0.9970
29	827	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	587	Elon Musk sends Bitcoin soaring 20pc live updates	null	0.9985
28	1247	Bitcoin What is the Death Cross That Heralds the Sharp Fall of This Cryptocurrency	null	-0.5994
29	527	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1067	Cryptocurrency Crime Drops in 2020 but Decentralized Finance Losses Rise Study	null	0.9892
29	767	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	947	Robinhood restricts crypto trading as Dogecoin soars 300 percent	null	0.9984
29	767	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	887	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	767	Dogecoin Becomes Most Mentioned Crypto on Twitter Ever as Price Soars	null	0.9985
29	347	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
29	107	Bitcoin Jumps Above 38 000 as Musk Adds It to Twitter Profile	null	0.9970
29	707	Bitcoin Soars 14 After Elon Musk Namecheck on Twitter	null	0.9985
29	767	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	347	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
29	647	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	647	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	467	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	467	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	467	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	467	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	467	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	467	XRP Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
29	107	Dogecoin DOGE shoots 270 higher as WallStreetBets starts to pick up on crypto CryptoSlate	null	0.7906
29	467	Wall Street Just Made the Best Case for Bitcoin Ethereum DeFi Get Ready for Mass Adoption	null	0.7717
29	707	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	467	XRP Climbs 10 45 In Rally By Investing com	null	0.9682
29	827	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	467	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	1129	Kraken Coinbase Suffer Outages Amid Market Volatility	null	-0.5423
29	947	How A Little Bird Is Delivering Trust	null	0.5106
29	1127	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1067	Who s getting rich off GameStop s stock The market makers and middlemen including Robinhood	null	0.5574
29	1067	Dow Jones Today Stocks Drop To Test Support Caterpillar Climbs Bitcoin Rallies Short Squeeze	null	-0.9968
29	1007	Ray Dalio Bitcoin is gold like but governments won t let it win	null	0.9186
29	947	Here s why Elon Musk s simple Twitter bio change rocketed Bitcoin up 18 CryptoSlate	null	0.7906
29	1007	Zombies not welcome Original altcoins lose ground to DeFi newcomers	null	-0.7304
29	887	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	827	Billionaire Leon Cooperman says GameStop surge will end very badly for the public and decries	null	-0.5256
29	587	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
29	767	Join Us in Miami Love Masters of the Universe	null	0.7506
29	467	Google reportedly scraps thousands of negative Robinhood reviews By Cointelegraph	null	-0.5719
29	467	Robinhood Raises Over 1 Billion In Emergency Funds As Platform Struggles With Reddit Fuelled	null	-0.6249
29	467	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	467	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	467	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	467	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	1067	Opinion Who s getting rich off GameStop s stock The market makers and middlemen including	null	0.5574
29	1007	U S Stocks Open Lower as GameStop Frenzy Builds	null	-0.5423
29	1007	Dow slides 200 points on concerns of retail investors speculative trading	null	-0.9970
29	1007	World s richest man Elon Musk boosts Bitcoin price by 20 Is 40K back in play	null	0.7964
29	827	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	707	Bitcoin soars by 5K in minutes BTC hits 38K after Elon Musk s Dogecoin treatment	null	0.9985
28	1247	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	1247	The 8 best investing app alternatives to Robinhood	null	0.6369
28	1247	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1247	The 8 best investing app alternatives to Robinhood	null	0.6369
29	1163	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
29	1163	The biggest investors in space are cheering on the GameStop trade	null	0.5106
29	467	GameStop back on the rise as Robinhood eases trading ban	null	0.9792
29	407	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	47	DOGE tweet volume up 1800 becomes first altcoin to surpass Bitcoin ever The Tie	null	0.7906
29	467	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
28	1427	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
29	1147	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	227	SEC issues warning as GameStop short selling war resumes	null	-0.9652
29	1163	Tim Cook says companies are misleading users and exploiting data as public feud with Facebook	null	-0.7906
29	107	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	107	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	107	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	107	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	827	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	947	Jon Stewart gets a warm welcome on Twitter after joining to defend Reddit traders	null	0.5994
29	647	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
40	1081	Bitcoin Miner Riot Blockchain Names Jason Les CEO	null	-0.5574
29	527	FTSE 100 falls expected as GameStop Reddit fallout blows through global markets	null	-0.9993
28	1427	Short Squeeze Volatility With GME AMC O Neil Portfolio Manager On Navigating Risk In Crazy	null	-0.5423
28	1247	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1247	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1247	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
29	131	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	660	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	586	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	569	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
28	848	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1126	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
28	1095	Here are the best investing app alternatives to Robinhood	null	0.6369
28	665	3 Popular Robinhood Stocks That Could Be Better Than Bitcoin in 2021	null	0.6908
29	1118	Robinhood blocks cryptocurrency trading blames extraordinary market conditions	null	-0.5574
29	938	Dogecoin Price Up 975 After Elon Musk s Tweet WallStreetBets Pump	null	0.7906
29	518	Reddit frenzy pumps up Dogecoin a cryptocurrency started as a joke by over 800	null	0.7845
29	38	Will the SEC s Lawsuit Lead to Ripple Failing to Reach Its Potential	null	-0.6249
29	758	Stablecoin holdings on crypto exchanges hit a new all time high	null	0.9682
29	878	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	1178	What s Next For Bitcoin In An Era Of Helicopter Money Negative	null	-0.5719
29	698	Price of worthless cryptocurrency skyrockets by 1 000 thanks to GameStop stock fiasco	null	-0.5106
29	398	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	998	Dogecoin Jumps 600 as Meme Crypto Rides GameStop Retail Wave	null	0.9970
29	938	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	698	Elon Musk sends Bitcoin soaring 20pc live updates	null	0.9985
28	1358	Bitcoin What is the Death Cross That Heralds the Sharp Fall of This Cryptocurrency	null	-0.5994
29	638	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1178	Cryptocurrency Crime Drops in 2020 but Decentralized Finance Losses Rise Study	null	0.9892
29	878	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1058	Robinhood restricts crypto trading as Dogecoin soars 300 percent	null	0.9984
29	878	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	998	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	878	Dogecoin Becomes Most Mentioned Crypto on Twitter Ever as Price Soars	null	0.9985
29	458	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
29	218	Bitcoin Jumps Above 38 000 as Musk Adds It to Twitter Profile	null	0.9970
29	818	Bitcoin Soars 14 After Elon Musk Namecheck on Twitter	null	0.9985
29	878	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	458	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
29	758	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	758	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	578	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	578	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	578	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	578	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	578	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	578	XRP Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
29	218	Dogecoin DOGE shoots 270 higher as WallStreetBets starts to pick up on crypto CryptoSlate	null	0.7906
29	578	Wall Street Just Made the Best Case for Bitcoin Ethereum DeFi Get Ready for Mass Adoption	null	0.7717
29	818	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	578	XRP Climbs 10 45 In Rally By Investing com	null	0.9682
29	938	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	578	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	1240	Kraken Coinbase Suffer Outages Amid Market Volatility	null	-0.5423
29	1058	How A Little Bird Is Delivering Trust	null	0.5106
29	1238	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1178	Who s getting rich off GameStop s stock The market makers and middlemen including Robinhood	null	0.5574
29	1178	Dow Jones Today Stocks Drop To Test Support Caterpillar Climbs Bitcoin Rallies Short Squeeze	null	-0.9968
29	1118	Ray Dalio Bitcoin is gold like but governments won t let it win	null	0.9186
29	1058	Here s why Elon Musk s simple Twitter bio change rocketed Bitcoin up 18 CryptoSlate	null	0.7906
29	1118	Zombies not welcome Original altcoins lose ground to DeFi newcomers	null	-0.7304
29	998	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	938	Billionaire Leon Cooperman says GameStop surge will end very badly for the public and decries	null	-0.5256
29	698	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
29	878	Join Us in Miami Love Masters of the Universe	null	0.7506
29	578	Google reportedly scraps thousands of negative Robinhood reviews By Cointelegraph	null	-0.5719
29	578	Robinhood Raises Over 1 Billion In Emergency Funds As Platform Struggles With Reddit Fuelled	null	-0.6249
29	578	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	578	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	578	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	578	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	1178	Opinion Who s getting rich off GameStop s stock The market makers and middlemen including	null	0.5574
29	1118	U S Stocks Open Lower as GameStop Frenzy Builds	null	-0.5423
29	1118	Dow slides 200 points on concerns of retail investors speculative trading	null	-0.9970
29	1118	World s richest man Elon Musk boosts Bitcoin price by 20 Is 40K back in play	null	0.7964
29	938	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	818	Bitcoin soars by 5K in minutes BTC hits 38K after Elon Musk s Dogecoin treatment	null	0.9985
28	1358	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	1358	The 8 best investing app alternatives to Robinhood	null	0.6369
28	1358	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1358	The 8 best investing app alternatives to Robinhood	null	0.6369
29	1274	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
29	1274	The biggest investors in space are cheering on the GameStop trade	null	0.5106
29	578	GameStop back on the rise as Robinhood eases trading ban	null	0.9792
29	518	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	158	DOGE tweet volume up 1800 becomes first altcoin to surpass Bitcoin ever The Tie	null	0.7906
29	578	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	98	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
29	1258	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	338	SEC issues warning as GameStop short selling war resumes	null	-0.9652
29	1274	Tim Cook says companies are misleading users and exploiting data as public feud with Facebook	null	-0.7906
29	218	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	218	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	218	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	218	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	938	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	1058	Jon Stewart gets a warm welcome on Twitter after joining to defend Reddit traders	null	0.5994
29	758	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
29	638	FTSE 100 falls expected as GameStop Reddit fallout blows through global markets	null	-0.9993
29	98	Short Squeeze Volatility With GME AMC O Neil Portfolio Manager On Navigating Risk In Crazy	null	-0.5423
28	1358	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1358	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1358	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
29	131	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	660	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	586	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	569	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
28	848	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1126	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
28	1095	Here are the best investing app alternatives to Robinhood	null	0.6369
28	665	3 Popular Robinhood Stocks That Could Be Better Than Bitcoin in 2021	null	0.6908
29	1118	Robinhood blocks cryptocurrency trading blames extraordinary market conditions	null	-0.5574
29	938	Dogecoin Price Up 975 After Elon Musk s Tweet WallStreetBets Pump	null	0.7906
29	518	Reddit frenzy pumps up Dogecoin a cryptocurrency started as a joke by over 800	null	0.7845
29	38	Will the SEC s Lawsuit Lead to Ripple Failing to Reach Its Potential	null	-0.6249
29	758	Stablecoin holdings on crypto exchanges hit a new all time high	null	0.9682
29	878	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	1178	What s Next For Bitcoin In An Era Of Helicopter Money Negative	null	-0.5719
29	698	Price of worthless cryptocurrency skyrockets by 1 000 thanks to GameStop stock fiasco	null	-0.5106
29	398	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	998	Dogecoin Jumps 600 as Meme Crypto Rides GameStop Retail Wave	null	0.9970
29	938	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	698	Elon Musk sends Bitcoin soaring 20pc live updates	null	0.9985
28	1358	Bitcoin What is the Death Cross That Heralds the Sharp Fall of This Cryptocurrency	null	-0.5994
29	638	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1178	Cryptocurrency Crime Drops in 2020 but Decentralized Finance Losses Rise Study	null	0.9892
29	878	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1058	Robinhood restricts crypto trading as Dogecoin soars 300 percent	null	0.9984
29	878	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	998	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	878	Dogecoin Becomes Most Mentioned Crypto on Twitter Ever as Price Soars	null	0.9985
29	458	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
29	218	Bitcoin Jumps Above 38 000 as Musk Adds It to Twitter Profile	null	0.9970
29	818	Bitcoin Soars 14 After Elon Musk Namecheck on Twitter	null	0.9985
29	878	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	458	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
29	758	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	758	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	578	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	578	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	578	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	578	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	578	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	578	XRP Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
29	218	Dogecoin DOGE shoots 270 higher as WallStreetBets starts to pick up on crypto CryptoSlate	null	0.7906
29	578	Wall Street Just Made the Best Case for Bitcoin Ethereum DeFi Get Ready for Mass Adoption	null	0.7717
29	818	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	578	XRP Climbs 10 45 In Rally By Investing com	null	0.9682
29	938	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	578	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	1240	Kraken Coinbase Suffer Outages Amid Market Volatility	null	-0.5423
29	1058	How A Little Bird Is Delivering Trust	null	0.5106
29	1238	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1178	Who s getting rich off GameStop s stock The market makers and middlemen including Robinhood	null	0.5574
29	1178	Dow Jones Today Stocks Drop To Test Support Caterpillar Climbs Bitcoin Rallies Short Squeeze	null	-0.9968
29	1118	Ray Dalio Bitcoin is gold like but governments won t let it win	null	0.9186
29	1058	Here s why Elon Musk s simple Twitter bio change rocketed Bitcoin up 18 CryptoSlate	null	0.7906
29	1118	Zombies not welcome Original altcoins lose ground to DeFi newcomers	null	-0.7304
29	998	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	938	Billionaire Leon Cooperman says GameStop surge will end very badly for the public and decries	null	-0.5256
29	698	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
29	878	Join Us in Miami Love Masters of the Universe	null	0.7506
29	578	Google reportedly scraps thousands of negative Robinhood reviews By Cointelegraph	null	-0.5719
29	578	Robinhood Raises Over 1 Billion In Emergency Funds As Platform Struggles With Reddit Fuelled	null	-0.6249
29	578	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	578	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	578	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	578	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	1178	Opinion Who s getting rich off GameStop s stock The market makers and middlemen including	null	0.5574
29	1118	U S Stocks Open Lower as GameStop Frenzy Builds	null	-0.5423
29	1118	Dow slides 200 points on concerns of retail investors speculative trading	null	-0.9970
29	1118	World s richest man Elon Musk boosts Bitcoin price by 20 Is 40K back in play	null	0.7964
29	938	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	818	Bitcoin soars by 5K in minutes BTC hits 38K after Elon Musk s Dogecoin treatment	null	0.9985
28	1358	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	1358	The 8 best investing app alternatives to Robinhood	null	0.6369
28	1358	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1358	The 8 best investing app alternatives to Robinhood	null	0.6369
29	1274	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
29	1274	The biggest investors in space are cheering on the GameStop trade	null	0.5106
29	578	GameStop back on the rise as Robinhood eases trading ban	null	0.9792
29	518	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	158	DOGE tweet volume up 1800 becomes first altcoin to surpass Bitcoin ever The Tie	null	0.7906
29	578	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	98	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
29	1258	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	338	SEC issues warning as GameStop short selling war resumes	null	-0.9652
29	1274	Tim Cook says companies are misleading users and exploiting data as public feud with Facebook	null	-0.7906
29	218	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	218	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	218	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	218	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	938	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	1058	Jon Stewart gets a warm welcome on Twitter after joining to defend Reddit traders	null	0.5994
29	758	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
29	638	FTSE 100 falls expected as GameStop Reddit fallout blows through global markets	null	-0.9993
29	98	Short Squeeze Volatility With GME AMC O Neil Portfolio Manager On Navigating Risk In Crazy	null	-0.5423
28	1358	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1358	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1358	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
29	131	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	660	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	586	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	569	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
28	848	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1126	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
28	1095	Here are the best investing app alternatives to Robinhood	null	0.6369
28	665	3 Popular Robinhood Stocks That Could Be Better Than Bitcoin in 2021	null	0.6908
29	1089	India Would Ban Private Cryptocurrencies Under Proposed Legislation CoinDesk	null	-0.5574
29	1149	Two Bars for Bitcoins Owner in New York s Hell s Kitchen Selling Out for Cryptocurrency	null	-0.9618
29	1089	Robinhood Halts Instant Buying Power For Crypto	null	0.9325
29	249	Reddit frenzy pumps up Dogecoin a cryptocurrency started as a joke by over 800	null	0.7845
29	849	Robinhood blocks cryptocurrency trading blames extraordinary market conditions	null	-0.5574
29	1209	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street	null	0.9970
29	669	Dogecoin Price Up 975 After Elon Musk s Tweet WallStreetBets Pump	null	0.7906
29	969	Bitcoin s spike drives rebound in hard hit crypto mining stocks	null	0.9810
29	549	Stablecoin holdings on crypto exchanges hit a new all time high	null	0.9682
29	129	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	429	Price of worthless cryptocurrency skyrockets by 1 000 thanks to GameStop stock fiasco	null	-0.5106
29	909	What s Next For Bitcoin In An Era Of Helicopter Money Negative	null	-0.5719
29	309	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency By Reuters	null	-0.9618
29	669	Dogecoin Becomes Most Mentioned Crypto on Twitter Ever as Price Soars CoinDesk	null	0.9985
29	429	Elon Musk sends Bitcoin soaring 20pc	null	0.9985
29	909	Cryptocurrency Crime Drops in 2020 but Decentralized Finance Losses Rise Study	null	0.9892
29	609	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	609	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1149	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	789	Robinhood restricts crypto trading as Dogecoin soars 300 percent	null	0.9984
29	669	Dogecoin Becomes Most Mentioned Crypto on Twitter Ever as Price Soars	null	0.9985
29	1149	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1149	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	969	Kraken Coinbase Suffer Outages Amid Market Volatility CoinDesk	null	-0.5423
29	1149	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	789	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	729	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	609	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon NewsChannel	null	0.9985
29	189	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
29	669	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	729	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1089	India Would Ban Private Cryptocurrencies Under Proposed Legislation	null	-0.5574
29	729	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon KION546	null	0.9985
29	609	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	1029	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	489	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	489	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1029	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	309	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	549	Bitcoin Soars 14 After Elon Musk Namecheck on Twitter	null	0.9985
29	609	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	1209	Everything we know about the GameStop stock insanity	null	-0.5719
29	729	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	729	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	729	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	729	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	669	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	309	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	309	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	309	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	189	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
29	309	XRP Climbs 10 45 In Rally By Investing com	null	0.9682
29	69	Litecoin Climbs 10 11 In Rally	null	0.9682
29	189	Ray Dalio Clears His Stance On Bitcoin Calls It Amazing Accomplishment	null	0.6249
29	69	Bitcoin Climbs 10 18 In Rally	null	0.9682
29	9	Litecoin Climbs 10 11 In Rally By Investing com	null	0.9682
29	9	Bitcoin Climbs 10 In Bullish Trade By Investing com	null	0.9970
29	9	Litecoin Climbs 10 In Bullish Trade By Investing com	null	0.9970
29	9	Bitcoin Climbs 10 18 In Rally By Investing com	null	0.9682
29	189	Ray Dalio Clears His Stance On Bitcoin Calls Is Amazing Accomplishment	null	0.6249
29	849	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1209	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring	null	0.9985
29	1209	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring The Motley Fool	null	0.9984
29	1329	Analysis GameStop s Reddit Rally Puts Scrutiny on Social Media Forums	null	0.9682
29	1209	Bitcoin Soars After Tesla CEO Elon Musk Says This 1 Word on Twitter	null	0.9985
29	789	How A Little Bird Is Delivering Trust	null	0.5106
29	1209	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1149	Short selling What it is why it s risky and how the squeeze happens	null	-0.9413
29	1089	Downtown Weatherford building damaged after man crashes into it officials say	null	-0.9993
29	1029	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	1329	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1329	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	969	5 best stock trading apps for iPhone 9to5Mac	null	0.6369
29	909	U S Stocks Open Lower as GameStop Frenzy Builds	null	-0.5423
29	909	Dow slides 200 points on concerns of retail investors speculative trading	null	-0.9970
29	909	World s richest man Elon Musk boosts Bitcoin price by 20 Is 40K back in play	null	0.7964
29	1360	Dogecoin soars another 600 as Reddit frenzy pushes the token into the top 10 cryptocurrencies by	null	0.9985
29	669	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	729	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	669	Billionaire Leon Cooperman says GameStop surge will end very badly for the public and decries	null	-0.5256
29	429	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
29	609	Join Us in Miami Love Masters of the Universe	null	0.7506
29	549	Bitcoin soars by 5K in minutes BTC hits 38K after Elon Musk s Dogecoin treatment	null	0.9985
29	309	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment By Reuters	null	-0.9970
29	309	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	309	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	309	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	309	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	309	GameStop back on the rise as Robinhood eases trading ban	null	0.9792
29	489	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
29	309	Google reportedly scraps thousands of negative Robinhood reviews By Cointelegraph	null	-0.5719
29	909	Who s getting rich off GameStop s stock The market makers and middlemen including Robinhood	null	0.5574
29	909	Dow Jones Today Stocks Drop To Test Support Caterpillar Climbs Bitcoin Rallies Short Squeeze	null	-0.9968
29	789	Here s why Elon Musk s simple Twitter bio change rocketed Bitcoin up 18 CryptoSlate	null	0.7906
29	309	Bitcoin to Win From Short Squeeze Financial Rebellion Experts Say	null	0.5106
29	309	Bitcoin to Win From Short Squeeze Financial Rebellion Experts By Investing com	null	0.5106
29	309	Robinhood Raises Over 1 Billion In Emergency Funds As Platform Struggles With Reddit Fuelled	null	-0.6249
29	309	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	309	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	309	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	249	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	189	Alleged dog fighting ring busted 11 people arrested also face drug charges	null	-0.7717
29	1269	US stocks suffer worst week since October amid Reddit fueled trading craze	null	-0.9906
29	309	Bitcoin to Win From Short Squeeze Financial Rebellion Experts Say	null	0.5106
29	309	Bitcoin to Win From Short Squeeze Financial Rebellion Experts Say By Investing com	null	0.5106
29	309	Bitcoin to Win From Short Squeeze Financial Rebellion Experts Say By Investing com	null	0.5106
29	309	Bitcoin to Win From Short Squeeze Financial Rebellion Experts Say By Investing com	null	0.5106
29	309	Bitcoin to Win From Short Squeeze Financial Rebellion Experts Say By Investing com	null	0.5106
29	309	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	309	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment By Reuters	null	-0.9970
29	969	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	909	Zombies not welcome Original altcoins lose ground to DeFi newcomers	null	-0.7304
29	69	SEC issues warning as GameStop short selling war resumes	null	-0.9652
29	129	Global Markets Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	131	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	660	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	586	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1095	Bitcoin soars 14 on Musk namecheck on Twitter Reuters	null	0.9985
29	569	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
28	848	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1126	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
29	1223	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street CNET	null	0.9970
29	1147	Two Bars for Bitcoins Owner in New York s Hell s Kitchen Selling Out for Cryptocurrency	null	-0.9618
29	1327	Bitcoin s spike drives rebound in hard hit crypto mining stocks	null	0.9810
29	1087	India Would Ban Private Cryptocurrencies Under Proposed Legislation CoinDesk	null	-0.5574
29	847	Robinhood blocks cryptocurrency trading blames extraordinary market conditions	null	-0.5574
30	67	GMI Model Estimates Bitcoin Fair Value At 300K By October 2021	null	0.5719
30	643	Dogecoin Price Up 975 After Elon Musk s Tweet WallStreetBets Pump	null	0.7906
29	1087	Robinhood Halts Instant Buying Power For Crypto	null	0.9325
29	1267	What is Dogecoin and Why Are People Buying It	null	0.9325
29	907	What s Next For Bitcoin In An Era Of Helicopter Money Negative	null	-0.5719
29	727	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon KION546	null	0.9985
29	907	Cryptocurrency Crime Drops in 2020 but Decentralized Finance Losses Rise Study	null	0.9892
29	1147	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1147	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1147	CORRECTED Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1207	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1147	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1147	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	727	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
30	427	India Plans to Introduce Legislation to Ban Cryptocurrencies	null	-0.5574
29	1027	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1087	Bitcoin soars 14 on Musk namecheck on Twitter	null	0.9985
30	7	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
29	1087	Ray Dalio clarifies his position on Bitcoin saying he greatly admires it CryptoSlate	null	0.5709
29	1327	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1087	India Would Ban Private Cryptocurrencies Under Proposed Legislation	null	-0.5574
29	787	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
30	7	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
29	787	Robinhood restricts crypto trading as Dogecoin soars 300 percent	null	0.9984
29	727	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	727	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	727	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	727	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1027	Tron Ticker Confusion Would Be TRX Crypto Investors Mistakenly Buy Tanzanian Gold TRX Stock	null	-0.5267
29	1207	KDKA Investigates Financial Advisors Explain Dangers Of Treating Buying Stocks Like Sports Gambling	null	0.9231
29	1207	Everything we know about the GameStop stock insanity	null	-0.5719
29	847	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1327	Analysis GameStop s Reddit Rally Puts Scrutiny on Social Media Forums	null	0.9682
29	1267	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
30	7	After a tumultuous week some fear Robinhood s actions set a horrible precedent	null	-0.7717
30	7	After a tumultuous week some fear Robinhood s actions set a horrible precedent	null	-0.7717
29	1207	Bitcoin Soars After Tesla CEO Elon Musk Says This 1 Word on Twitter	null	0.9985
29	1207	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring The Motley Fool	null	0.9984
29	1327	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1327	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1207	Bitcoin Soars After Tesla CEO Elon Musk Says This 1 Word on Twitter The Motley Fool	null	0.9984
29	1387	Dogecoin soars another 600 as Reddit frenzy pushes the token into the top 10 cryptocurrencies by	null	0.9985
29	1087	Downtown Weatherford building damaged after man crashes into it officials say	null	-0.9993
29	907	World s richest man Elon Musk boosts Bitcoin price by 20 Is 40K back in play	null	0.7964
29	907	Ray Dalio Bitcoin is gold like but governments won t let it win	null	0.9186
29	907	Zombies not welcome Original altcoins lose ground to DeFi newcomers	null	-0.7304
29	907	Opinion Who s getting rich off GameStop s stock The market makers and middlemen including	null	0.5574
29	907	U S Stocks Open Lower as GameStop Frenzy Builds	null	-0.5423
29	907	Dow slides 200 points on concerns of retail investors speculative trading	null	-0.9970
29	907	Who s getting rich off GameStop s stock The market makers and middlemen including Robinhood	null	0.5574
29	907	Dow Jones Today Stocks Drop To Test Support Caterpillar Climbs Bitcoin Rallies Short Squeeze	null	-0.9968
29	727	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
30	643	Billionaire Leon Cooperman says GameStop surge will end very badly for the public and decries	null	-0.5256
29	967	Kraken Coinbase Suffer Outages Amid Market Volatility	null	-0.5423
29	787	How A Little Bird Is Delivering Trust	null	0.5106
30	307	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right	null	-0.9988
30	127	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
30	307	Fun and GameStop National Review	null	0.5106
29	1207	Govt may introduce bill to ban control and regulate cryptocurrencies	null	-0.5574
30	307	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right The Motley Fool	null	-0.9989
29	1327	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1207	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring	null	0.9985
29	1147	Short selling What it is why it s risky and how the squeeze happens	null	-0.9413
29	1267	US stocks suffer worst week since October amid Reddit fueled trading craze	null	-0.9906
29	1207	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	967	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	967	5 best stock trading apps for iPhone 9to5Mac	null	0.6369
29	1027	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	847	Here s why Elon Musk s simple Twitter bio change rocketed Bitcoin up 18 CryptoSlate	null	0.7906
29	787	Jon Stewart gets a warm welcome on Twitter after joining to defend Reddit traders	null	0.5994
29	727	Far right extremists use GameStop chaos to radicalize and recruit on Telegram	null	-0.5719
29	131	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	660	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	586	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1095	Bitcoin soars 14 on Musk namecheck on Twitter Reuters	null	0.9985
29	569	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1223	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street CNET	null	0.9970
30	247	Meme Based Cryptocurrency Dogecoin Surges 822 to Record High	null	0.9682
29	1309	Analysis GameStop s Reddit rally puts scrutiny on social media forums Reuters	null	0.9682
30	704	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
29	1184	Two Bars for Bitcoins Owner in New York s Hell s Kitchen Selling Out for Cryptocurrency	null	-0.9618
29	1244	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street	null	0.9970
29	1124	India Would Ban Private Cryptocurrencies Under Proposed Legislation CoinDesk	null	-0.5574
29	1124	Robinhood Halts Instant Buying Power For Crypto	null	0.9325
29	1304	Bitcoin s spike drives rebound in hard hit crypto mining stocks	null	0.9810
30	44	GMI Model Estimates Bitcoin Fair Value At 300K By October 2021	null	0.5719
29	1304	What is Dogecoin and Why Are People Buying It	null	0.9325
29	1124	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1424	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
29	1184	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1124	CORRECTED Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
30	284	Litecoin Falls 11 39 In Selloff	null	-0.9997
30	284	XRP Soars 30 63 In Rally By Investing com	null	0.9990
30	284	Litecoin Falls 11 39 In Selloff By Investing com	null	-0.9997
30	284	XRP Climbs 10 65 In Rally By Investing com	null	0.9682
30	404	India Plans to Introduce Legislation to Ban Cryptocurrencies	null	-0.5574
30	284	XRP Climbs 10 65 In Bullish Trade	null	0.9970
29	1124	Ray Dalio clarifies his position on Bitcoin saying he greatly admires it CryptoSlate	null	0.5709
29	1304	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1184	KDKA Investigates Financial Advisors Explain Dangers Of Treating Buying Stocks Like Sports Gambling	null	0.9231
29	1124	India Would Ban Private Cryptocurrencies Under Proposed Legislation	null	-0.5574
29	1184	Everything we know about the GameStop stock insanity	null	-0.5719
30	284	Bitcoin Falls 10 22 In Rout	null	-0.9993
30	980	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1424	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
30	764	9 great reads from CNET this week	null	0.6249
30	644	5 Awful Stocks Robinhood Investors Can t Stop Buying	null	0.8689
30	344	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right	null	-0.9988
30	344	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right The Motley Fool	null	-0.9989
30	344	Fun and GameStop National Review	null	0.5106
30	344	Fun and GameStop	null	0.5106
29	1244	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1424	After a tumultuous week some fear Robinhood s actions set a horrible precedent	null	-0.7717
29	1424	After a tumultuous week some fear Robinhood s actions set a horrible precedent	null	-0.7717
29	1244	Bitcoin Soars After Tesla CEO Elon Musk Says This 1 Word on Twitter	null	0.9985
29	1304	US stocks suffer worst week since October amid Reddit fueled trading craze	null	-0.9906
29	1244	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1064	Downtown Weatherford building damaged after man crashes into it officials say	null	-0.9993
30	980	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	1184	Govt may introduce bill to ban control and regulate cryptocurrencies	null	-0.5574
30	164	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1184	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring	null	0.9985
29	1184	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring The Motley Fool	null	0.9984
29	1304	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1304	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1304	Analysis GameStop s Reddit Rally Puts Scrutiny on Social Media Forums	null	0.9682
29	1364	Dogecoin soars another 600 as Reddit frenzy pushes the token into the top 10 cryptocurrencies by	null	0.9985
29	1304	Ethereum Price Prediction ETH on the verge of a 30 breakout towards 1 900	null	0.9325
29	1184	Short selling What it is why it s risky and how the squeeze happens	null	-0.9413
30	692	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
29	131	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	660	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	586	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1095	Bitcoin soars 14 on Musk namecheck on Twitter Reuters	null	0.9985
29	569	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1223	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street CNET	null	0.9970
30	247	Meme Based Cryptocurrency Dogecoin Surges 822 to Record High	null	0.9682
29	1309	Analysis GameStop s Reddit rally puts scrutiny on social media forums Reuters	null	0.9682
30	724	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
29	1144	Two Bars for Bitcoins Owner in New York s Hell s Kitchen Selling Out for Cryptocurrency	null	-0.9618
29	1204	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street	null	0.9970
29	1144	India Would Ban Private Cryptocurrencies Under Proposed Legislation CoinDesk	null	-0.5574
29	1324	Bitcoin s spike drives rebound in hard hit crypto mining stocks	null	0.9810
30	64	GMI Model Estimates Bitcoin Fair Value At 300K By October 2021	null	0.5719
29	1204	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1144	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1144	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1084	Robinhood Halts Instant Buying Power For Crypto	null	0.9325
29	1144	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1144	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
30	304	XRP Jumps 20 32 In Rally By Investing com	null	0.9982
30	304	XRP Climbs 10 65 In Rally By Investing com	null	0.9682
30	304	Litecoin Falls 11 39 In Selloff By Investing com	null	-0.9997
30	1000	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1084	Bitcoin soars 14 on Musk namecheck on Twitter	null	0.9985
30	304	XRP Soars 30 63 In Rally By Investing com	null	0.9990
30	1000	Tron Ticker Confusion Would Be TRX Crypto Investors Mistakenly Buy Tanzanian Gold TRX Stock	null	-0.5267
29	1384	180M Bitcoin Trust Completes Canadian IPO Fully Invested on First Day CoinDesk	null	0.5106
30	4	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
29	1384	180M Bitcoin Trust Completes Canadian IPO Fully Invested on First Day	null	0.5106
29	1324	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1084	India Would Ban Private Cryptocurrencies Under Proposed Legislation	null	-0.5574
30	4	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
30	304	Litecoin Falls 11 39 In Selloff	null	-0.9997
30	304	XRP Climbs 10 65 In Bullish Trade	null	0.9970
30	424	India Plans to Introduce Legislation to Ban Cryptocurrencies	null	-0.5574
30	304	Bitcoin Falls 10 22 In Rout	null	-0.9993
30	1000	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1084	Ray Dalio clarifies his position on Bitcoin saying he greatly admires it CryptoSlate	null	0.5709
29	1204	KDKA Investigates Financial Advisors Explain Dangers Of Treating Buying Stocks Like Sports Gambling	null	0.9231
29	1204	Everything we know about the GameStop stock insanity	null	-0.5719
30	784	9 great reads from CNET this week	null	0.6249
30	664	5 Awful Stocks Robinhood Investors Can t Stop Buying	null	0.8689
30	304	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right The Motley Fool	null	-0.9989
29	1204	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring	null	0.9985
30	304	Fun and GameStop	null	0.5106
29	1204	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring The Motley Fool	null	0.9984
29	1324	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1264	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
30	4	After a tumultuous week some fear Robinhood s actions set a horrible precedent	null	-0.7717
29	1264	Bitcoin Soars After Tesla CEO Elon Musk Says This 1 Word on Twitter The Motley Fool	null	0.9984
29	1264	US stocks suffer worst week since October amid Reddit fueled trading craze	null	-0.9906
29	1204	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1084	Downtown Weatherford building damaged after man crashes into it officials say	null	-0.9993
29	1204	Govt may introduce bill to ban control and regulate cryptocurrencies	null	-0.5574
30	664	5 Awful Stocks Robinhood Investors Can t Stop Buying The Motley Fool	null	0.7845
30	304	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right	null	-0.9988
30	124	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
30	304	Fun and GameStop National Review	null	0.5106
29	1324	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1324	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1384	Dogecoin soars another 600 as Reddit frenzy pushes the token into the top 10 cryptocurrencies by	null	0.9985
29	1264	Ethereum Price Prediction ETH on the verge of a 30 breakout towards 1 900	null	0.9325
30	692	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
29	131	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	660	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	586	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1095	Bitcoin soars 14 on Musk namecheck on Twitter Reuters	null	0.9985
29	569	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1223	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street CNET	null	0.9970
30	247	Meme Based Cryptocurrency Dogecoin Surges 822 to Record High	null	0.9682
29	1309	Analysis GameStop s Reddit rally puts scrutiny on social media forums Reuters	null	0.9682
30	724	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
29	1144	Two Bars for Bitcoins Owner in New York s Hell s Kitchen Selling Out for Cryptocurrency	null	-0.9618
29	1204	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street	null	0.9970
29	1144	India Would Ban Private Cryptocurrencies Under Proposed Legislation CoinDesk	null	-0.5574
29	1324	Bitcoin s spike drives rebound in hard hit crypto mining stocks	null	0.9810
30	64	GMI Model Estimates Bitcoin Fair Value At 300K By October 2021	null	0.5719
29	1204	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1264	What is Dogecoin and Why Are People Buying It	null	0.9325
29	1144	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1144	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1084	Robinhood Halts Instant Buying Power For Crypto	null	0.9325
29	1144	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1144	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
30	304	XRP Jumps 20 32 In Rally By Investing com	null	0.9982
30	304	XRP Climbs 10 65 In Rally By Investing com	null	0.9682
30	304	Litecoin Falls 11 39 In Selloff By Investing com	null	-0.9997
30	1000	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1084	Bitcoin soars 14 on Musk namecheck on Twitter	null	0.9985
30	304	XRP Soars 30 63 In Rally By Investing com	null	0.9990
30	1000	Tron Ticker Confusion Would Be TRX Crypto Investors Mistakenly Buy Tanzanian Gold TRX Stock	null	-0.5267
29	1384	180M Bitcoin Trust Completes Canadian IPO Fully Invested on First Day CoinDesk	null	0.5106
30	4	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
29	1384	180M Bitcoin Trust Completes Canadian IPO Fully Invested on First Day	null	0.5106
29	1324	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1084	India Would Ban Private Cryptocurrencies Under Proposed Legislation	null	-0.5574
30	4	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
30	304	Litecoin Falls 11 39 In Selloff	null	-0.9997
30	304	XRP Climbs 10 65 In Bullish Trade	null	0.9970
30	424	India Plans to Introduce Legislation to Ban Cryptocurrencies	null	-0.5574
30	304	Bitcoin Falls 10 22 In Rout	null	-0.9993
30	1000	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1084	Ray Dalio clarifies his position on Bitcoin saying he greatly admires it CryptoSlate	null	0.5709
29	1204	KDKA Investigates Financial Advisors Explain Dangers Of Treating Buying Stocks Like Sports Gambling	null	0.9231
29	1204	Everything we know about the GameStop stock insanity	null	-0.5719
30	784	9 great reads from CNET this week	null	0.6249
30	664	5 Awful Stocks Robinhood Investors Can t Stop Buying	null	0.8689
30	304	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right The Motley Fool	null	-0.9989
29	1204	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring	null	0.9985
30	304	Fun and GameStop	null	0.5106
29	1204	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring The Motley Fool	null	0.9984
29	1324	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1264	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
30	4	After a tumultuous week some fear Robinhood s actions set a horrible precedent	null	-0.7717
29	1264	Bitcoin Soars After Tesla CEO Elon Musk Says This 1 Word on Twitter The Motley Fool	null	0.9984
29	1264	US stocks suffer worst week since October amid Reddit fueled trading craze	null	-0.9906
29	1204	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1084	Downtown Weatherford building damaged after man crashes into it officials say	null	-0.9993
29	1204	Govt may introduce bill to ban control and regulate cryptocurrencies	null	-0.5574
30	664	5 Awful Stocks Robinhood Investors Can t Stop Buying The Motley Fool	null	0.7845
30	304	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right	null	-0.9988
30	124	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
30	304	Fun and GameStop National Review	null	0.5106
29	1324	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1324	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1384	Dogecoin soars another 600 as Reddit frenzy pushes the token into the top 10 cryptocurrencies by	null	0.9985
29	1264	Ethereum Price Prediction ETH on the verge of a 30 breakout towards 1 900	null	0.9325
30	692	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
29	131	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	660	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	586	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1095	Bitcoin soars 14 on Musk namecheck on Twitter Reuters	null	0.9985
29	569	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1223	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street CNET	null	0.9970
30	247	Meme Based Cryptocurrency Dogecoin Surges 822 to Record High	null	0.9682
29	1309	Analysis GameStop s Reddit rally puts scrutiny on social media forums Reuters	null	0.9682
30	974	Dogecoin crashes as Reddit fuelled cryptocurrency joke falls flat	null	-0.9998
30	674	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
30	1094	India s Proposed Crypto Ban Has Investors Nervous May Feed Anti Bitcoin Narrative	null	-0.7906
30	74	GMI Model Estimates Bitcoin Fair Value At 300K By October 2021	null	0.5719
30	314	Litecoin Falls 11 39 In Selloff	null	-0.9997
30	314	XRP Soars 30 63 In Rally By Investing com	null	0.9990
30	314	XRP Jumps 20 32 In Rally By Investing com	null	0.9982
30	314	XRP Climbs 10 65 In Rally By Investing com	null	0.9682
30	314	Litecoin Falls 11 39 In Selloff By Investing com	null	-0.9997
30	434	India Plans to Introduce Legislation to Ban Cryptocurrencies	null	-0.5574
30	314	XRP Soars 31 In Rally By Investing com	null	0.9990
29	1394	180M Bitcoin Trust Completes Canadian IPO Fully Invested on First Day CoinDesk	null	0.5106
30	14	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
29	1394	180M Bitcoin Trust Completes Canadian IPO Fully Invested on First Day	null	0.5106
30	314	XRP Jumps 20 32 In Rally	null	0.9982
30	314	Bitcoin Falls 10 22 In Rout	null	-0.9993
30	314	XRP Climbs 10 65 In Bullish Trade	null	0.9970
30	1034	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
30	794	9 great reads from CNET this week	null	0.6249
30	674	5 Awful Stocks Robinhood Investors Can t Stop Buying The Motley Fool	null	0.7845
30	314	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right The Motley Fool	null	-0.9989
30	314	Fun and GameStop	null	0.5106
30	14	After a tumultuous week some fear Robinhood s actions set a horrible precedent	null	-0.7717
30	1310	Dogecoin soars another 600 as Reddit frenzy pushes the token into the top 10 cryptocurrencies by	null	0.9985
30	674	5 Awful Stocks Robinhood Investors Can t Stop Buying	null	0.8689
30	314	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right	null	-0.9988
30	134	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
30	314	Fun and GameStop National Review	null	0.5106
30	314	Bitcoin Market Looking for New Lows After Elon Musk s Pump Dump	null	-0.5267
30	692	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
29	131	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	660	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	586	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1095	Bitcoin soars 14 on Musk namecheck on Twitter Reuters	null	0.9985
29	569	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1223	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street CNET	null	0.9970
30	247	Meme Based Cryptocurrency Dogecoin Surges 822 to Record High	null	0.9682
30	1271	Reddit Frenzy Pumps Up Dogecoin A Cryptocurrency Started As A Joke	null	0.7845
29	1309	Analysis GameStop s Reddit rally puts scrutiny on social media forums Reuters	null	0.9682
30	980	Dogecoin crashes as Reddit fuelled cryptocurrency joke falls flat	null	-0.9998
30	1100	India s Proposed Crypto Ban Has Investors Nervous May Feed Anti Bitcoin Narrative	null	-0.7906
30	1160	Dogecoin crashes as Reddit fuelled cryptocurrency joke falls flat	null	-0.9998
30	1100	India s Proposed Crypto Ban Has Investors Nervous May Feed Anti Bitcoin Narrative CoinDesk	null	-0.7906
31	740	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency amNewYork	null	-0.9618
31	320	XRP Climbs 52 49 In Bullish Trade By Investing com	null	0.9970
31	80	EOS Climbs 10 In Bullish Trade By Investing com	null	0.9970
30	1160	XRP price gains 86 after Wall Street Bets crypto wing says pump it	null	0.9786
30	1280	Judge Rejects Virgil Griffith s Motion to Dismiss Charges of Aiding North Korea	null	-0.6486
31	320	EOS Climbs 10 07 In Bullish Trade	null	0.9970
31	80	EOS Climbs 10 07 In Rally By Investing com	null	0.9682
31	800	Robinhood Is a Perfect Example of Fintech s Insidious Power	null	0.5719
31	560	What you need to know on the markets this week Eat the rich Robinhood s reckoning after	null	0.5574
31	200	Analysts say Bitcoin could pop back up after accumulation CryptoSlate	null	0.7906
30	1040	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
31	800	What shares were hot in the last week GameStop AMC Entertainment and more Investing com UK	null	0.6124
30	692	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
30	247	Meme Based Cryptocurrency Dogecoin Surges 822 to Record High	null	0.9682
30	1271	Reddit Frenzy Pumps Up Dogecoin A Cryptocurrency Started As A Joke	null	0.7845
30	351	FAA is Investigating SpaceX Over Launch License Violations During the Explosive Starship Test	null	-0.5267
31	651	After Massive Dogecoin Crash Ripple s XRP Has Suddenly Rocketed Higher In WallStreetBets Price Surge	null	-0.9993
30	751	Government plans to introduce legislation to ban cryptocurrencies	null	-0.5574
30	357	Government to introduce bills to set up DFI Digital Currency	null	0.7906
31	784	iPhone taken in crime spree and more Capitol rioters arrested in the Apple Crime Blotter	null	-0.8850
30	332	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right	null	-0.9988
30	1091	India s Proposed Ban of Private Cryptos Has Many of the Nation s Investors Nervous	null	-0.6908
30	994	Dogecoin crashes as Reddit fuelled cryptocurrency joke falls flat	null	-0.9998
30	1293	Judge Rejects Virgil Griffith s Motion to Dismiss Charges of Aiding North Korea	null	-0.6486
32	608	XRP Erases SEC Led Drop as Supporters Pump Price Over 0 60	null	-0.9968
31	1195	XRP Posted Biggest Single Day Gain in 3 Years in a Coordinated Buying Attack	null	0.9905
32	535	A Good Thing Elon Musk Says He s a Supporter of Bitcoin	null	0.6124
31	1015	Dogecoin Caught Up In Reddit Frenzy Remains Low After Rally	null	0.6908
31	715	The 4 Most Dangerous Bitcoin Stocks	null	-0.5256
32	535	A Good Thing Elon Musk Says He s a Supporter of Bitcoin CoinDesk	null	0.6124
32	475	India proposes law to ban cryptocurrencies CyberNews	null	-0.5574
32	295	EOS Climbs 10 27 In Bullish Trade	null	0.9970
32	295	XRP Soars 30 09 In Rally By Investing com	null	0.9990
32	295	EOS Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
31	1075	Indian government looking to crack down on crypto scams with proposed ban Cashaa CEO	null	-0.8126
31	715	Stellar Lumens Is Worth Keeping An Eye On As Scarcity Should Drive Value	null	0.5106
32	295	XRP Soars 30 In Rally By Investing com	null	0.9990
32	295	XRP Soars 30 09 In Rally	null	0.9990
31	955	Redditors rally as Dogecoin halves in value following a sevenfold surge last week	null	0.9732
31	715	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency amNewYork	null	-0.9618
31	1255	Bitcoin Bears Erase the Elon Musk Candle as Sellers Take Control	null	-0.9325
32	475	Robinhood boss promises Elon Musk he ll relax GameStop limits live updates	null	0.6705
31	1135	Bitcoin Falls Back to 32K as Elon Musk s Bio Change Fades Into Memory	null	-0.9993
32	115	85 Dogecoin rally shows Wall Street Bets aren t done with DOGE yet	null	0.9682
31	715	The 4 Most Dangerous Bitcoin Stocks The Motley Fool	null	-0.7425
31	1195	XRP Posted Biggest Single Day Gain in 3 Years in a Coordinated Buying Attack CoinDesk	null	0.9905
31	1015	Dogecoin Caught Up In Reddit Frenzy Remains Low After Rally	null	0.6908
32	535	UK Research and Innovation suffers ransomware attack ZDNet	null	-0.5574
32	295	Will GameStop and Reddit Hurt My 401 k	null	-0.5267
32	115	Hedge fund Melvin Capital loses 7bn on GameStop frenzy	null	-0.5574
32	115	Hedge fund Melvin Capital loses 7bn on GameStop frenzy	null	-0.5574
31	775	MARK TO MARKET Hold on tight Bitcoin rally 2 0	null	0.9682
31	1195	Why Did Twitch Ban the Pogchamp Emote	null	-0.5574
31	1195	Robinhood boss shuts down Elon Musk s GameStop conspiracy theories live updates	null	-0.5267
31	1075	Robinhood Is a Perfect Example of Fintech s Insidious Power	null	0.5719
32	295	Switzerland s Crypto Broker AG Wins Securities House License From FINMA	null	0.7096
32	295	Switzerland s Crypto Broker AG Wins Securities House License From FINMA CoinDesk	null	0.7096
31	955	Mets owner Steve Cohen deletes Twitter after family receives threats amid stock market turmoil	null	-0.6486
31	955	Mets owner Steve Cohen deletes Twitter after family receives threats amid stock market turmoil	null	-0.6486
31	955	Mets owner Steve Cohen deletes Twitter after family receives threats amid stock market turmoil	null	-0.6486
32	295	A Rally in Bitcoin Sparked by Elon Musk Has Almost Evaporated	null	0.9682
31	1135	Bitcoin Falls Back to 32K as Elon Musk s Bio Change Fades Into Memory CoinDesk	null	-0.9993
31	1015	Fed s Powell just talked up a classic Buffett market bogeyman Inflation	null	0.7906
31	955	What you need to know on the markets this week Eat the rich Robinhood s reckoning after	null	0.5574
31	895	What shares were hot in the last week GameStop AMC Entertainment and more Investing com UK	null	0.6124
30	692	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
30	247	Meme Based Cryptocurrency Dogecoin Surges 822 to Record High	null	0.9682
30	1271	Reddit Frenzy Pumps Up Dogecoin A Cryptocurrency Started As A Joke	null	0.7845
30	351	FAA is Investigating SpaceX Over Launch License Violations During the Explosive Starship Test	null	-0.5267
31	651	After Massive Dogecoin Crash Ripple s XRP Has Suddenly Rocketed Higher In WallStreetBets Price Surge	null	-0.9993
30	751	Government plans to introduce legislation to ban cryptocurrencies	null	-0.5574
30	357	Government to introduce bills to set up DFI Digital Currency	null	0.7906
31	784	iPhone taken in crime spree and more Capitol rioters arrested in the Apple Crime Blotter	null	-0.8850
30	332	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right	null	-0.9988
30	1091	India s Proposed Ban of Private Cryptos Has Many of the Nation s Investors Nervous	null	-0.6908
30	994	Dogecoin crashes as Reddit fuelled cryptocurrency joke falls flat	null	-0.9998
32	844	XRP Pump Fails to Materialize as Price Crashes 40 From Day s High	null	-0.9990
33	4	Steven Seagal a Missing Private Eye and an Alleged Crypto Fraud	null	-0.7184
33	580	XRP Erases SEC Led Drop as Supporters Pump Price Over 0 60	null	-0.9968
32	784	XRP soars as much as 50 and Dogecoin jumps as day traders flex their muscles and Elon Musk adds to	null	0.9995
33	4	Sham crypto exec who partnered with Steven Seagal busted for investor fraud	null	-0.5859
33	304	XRP Plunges 30 91 In Bearish Trade By Investing com	null	-0.9997
32	1264	Here s What The World s Richest Person Thinks About Bitcoin	null	0.5267
33	304	XRP Plunges 30 91 In Bearish Trade	null	-0.9997
33	304	XRP Plunges 31 In Bearish Trade By Investing com	null	-0.9997
32	1324	Feds arrest crypto fraudster accusing of bilking investors out of millions	null	-0.7650
33	124	Santa Ana man accused of connection to 11 million securities fraud	null	-0.5859
33	580	XRP Erases SEC Led Drop as Supporters Pump Price Over 0 60 CoinDesk	null	-0.9968
33	184	Santa Ana Man Charged in NY With Cryptocurrency Scam MyNewsLA com	null	-0.6705
32	1084	How risky is Ripple s XRP The dangers of buying the cryptocurrency explained	null	0.8750
32	664	Bitcoin Posts Comeback Rally on Elon Musk Comment Analyst Sees ATH	null	0.9682
33	580	Cryptocurrencies Like Bitcoin Are Far From Safe Investments	null	0.6597
32	844	Reddit rage as XRP price crashes 50 hours after hitting two week highs	null	-0.9993
32	1324	Feds arrest crypto fraudster accusing of bilking investors out of millions	null	-0.7650
32	1324	Feds arrest crypto fraudster accusing of bilking investors out of millions	null	-0.7650
33	64	California man charged in 11 million cryptocurrency fraud that bilked New Yorkers sources and	null	-0.6808
32	784	Dogecoin Price Up 37 After Weekend Plunge Bullish Push From Reddit Group Expected	null	-0.9882
32	1024	Two Main Reasons for HSBT Hits a Record High	null	0.9682
32	724	Top 3 Price Prediction Bitcoin Ethereum Ripple XRP pumps towards 1 as the Bitcoin rally cools	null	0.9712
32	844	XRP Pump Fails to Materialize as Price Crashes 40 From Day s High CoinDesk	null	-0.9990
32	664	US Man Pleads Guilty to Money Laundering Charges Involving 13M in Bitcoin	null	-0.5994
32	664	US Man Pleads Guilty to Money Laundering Charges Involving 13M in Bitcoin CoinDesk	null	-0.5994
32	1324	Bitcoin price is sideways silver hits a 7 year high and XRP s rally pops	null	0.9918
33	4	CryptoQuant CEO says Coinbase Bitcoin outflows are a bullish signal	null	0.9970
32	904	Grayscale Reopens Its Ethereum Trust to Investors	null	0.5106
32	664	Elon Musk says he s a supporter of bitcoin and thinks it will get broad acceptance in finance	null	0.6249
33	364	Man wanted in Carlos Ghosn s escape accuses US of betrayal WTOP	null	-0.6705
33	544	Former Green Beret wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
33	424	On chain metrics reveal buying power ready to flow into Bitcoin for the ultimate push to 50 000	null	0.9477
33	304	Former Green Beret wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
33	64	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
33	64	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1204	WhatsApp Assures Users of Its Commitment to Your Privacy	null	0.5994
32	1144	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1084	Mark Cuban How selling stamps as a kid helped me see why digital assets are the future of business	null	-0.9231
32	964	Shares of audio technology company Agora soar as investors try to jump on Clubhouse app s growth	null	0.5859
32	964	Leaving Robinhood Here s Are 5 Robinhood Alternatives for Frustrated Reddit Investors	null	-0.5267
32	904	Bitcoin bounces back as main street invades Wall Street	null	0.9818
32	904	Grayscale Reopens Its Ethereum Trust to Investors CoinDesk	null	0.5106
33	184	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
33	184	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
33	64	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
33	64	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
33	64	Man Wanted in Carlos Ghosn s Escape Accuses US of Betrayal	null	-0.6705
33	4	MONEY MONDAY The Gamestop stock fiasco explained	null	-0.5106
33	4	Former Green Beret accuses US of betrayal for OK ing extradition to Japan in smuggling case	null	-0.7482
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	724	Why the Bitcoin price dropped immediately after Musk s positive comments CryptoSlate	null	0.5574
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1324	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	974	How a Series of Elon Musk Tweets Helped Lead Investors to Dogecoin a Meme Inspired Cryptocurrency Worth 4 Cents	null	0.6249
32	384	Indian gov t proposes to ban private cryptocurrency	null	-0.5574
32	120	India plans national digital currency plus a ban on private crypto cash	null	-0.5574
32	363	India Wants to Ban Bitcoin and Other Private Cryptocurrencies	null	-0.5574
32	867	XRP Pump Fails to Materialize as Price Crashes 40 From Day s High	null	-0.9990
32	605	XRP Erases SEC Led Drop as Supporters Pump Price Over 0 60	null	-0.9968
32	550	A Good Thing Elon Musk Says He s a Supporter of Bitcoin	null	0.6124
35	1310	Market Wrap Bitcoin Drops to 36 3K as DeFi Jumps to 32B on Ether FOMO	null	0.9970
35	950	Cryptocurrency live Latest as Dogecoin rockets up on Elon Musk Twitter endorsement	null	0.8519
35	1010	What is dogecoin Elon Musk has sent the meme cryptocurrency soaring	null	0.9985
36	590	Twitter s Jack Dorsey has fired up a full Bitcoin node	null	0.5267
36	50	Bitcoin Price Closing Above This Hurdle Sends Bulls Off To The Races	null	0.9325
35	950	Bitcoin Buying Will Rise This Year Says Survey ETF Trends	null	0.9918
36	290	It s the perfect time to own Bitcoin says City fund manager	null	0.5719
35	1070	Blockchain Bites The Rise of the Bitcoin Investment Fund CoinDesk	null	0.9818
35	890	Sweet Launches Broad Scale NFT Solution For Leading Entertainment And Consumer Brands In Partnership	null	0.7964
35	1250	Institutional Buyers the Likely Suspect Behind Latest Bitcoin Rally What s Next	null	0.9628
35	1310	Market Wrap Bitcoin Drops to 36 3K as DeFi Jumps to 32B on Ether FOMO CoinDesk	null	0.9970
36	650	Twitter CEO Jack Dorsey Has Set up His Own Bitcoin Node	null	0.7906
35	830	Top 3 Price Prediction Bitcoin Ethereum Ripple Bitcoin on the launchpad to 40 000 as ETH rally	null	0.9712
36	746	Dogecoin soars 50 after Elon Musk praises Bitcoin rival as the people s crypto	null	0.9986
35	1010	Tom Lee gives the long term bullish case for bitcoin and why it s better than gold	null	0.9972
35	890	Sweet Launches Broad Scale NFT Solution for Leading Entertainment and Consumer Brands in Partnership	null	0.7964
35	950	Sweet launches broad scale NFT solution in partnership with Bitcoin com	null	0.6486
36	746	Forget Bitcoin Inside the insane world of altcoin cryptocurrency trading	null	-0.5574
35	830	Bitcoin Rally Continues But Lacks Confirmation	null	0.9682
35	1130	Discord servers targeted in cryptocurrency exchange scam wave ZDNet	null	-0.7506
36	650	3 Catalysts That Propelled Cardano ADA to Its Three Year High	null	0.9682
36	590	Elon Musk s Dogecoin Tweets Worry Crypto Community Situation Seriously Damaging	null	-0.7845
35	1130	The Rise and Fall of Bitcoin Billionaire Arthur Hayes	null	0.9818
36	746	Is ether or elon musk pulling the crypto market up	null	0.7906
35	890	Ethereum catapults to new all time high past 1 600 as investors pile in ahead of next week s launch	null	0.9682
35	1010	What is dogecoin Elon Musk has sent the meme cryptocurrency soaring	null	0.9985
35	950	Croatia s Tifon Gas Stations Hope to Tap Tourist Trade With Crypto Payment Support	null	0.6808
36	746	Musk backs dogecoin Apple car euro slide continues BOE oil rises gold falls on strong dollar	null	-0.9997
35	1130	Book publishers scramble to sign Reddit rally authors	null	0.9682
35	1070	Elon Musk gets back on Twitter sends Dogecoin soaring	null	0.9985
35	830	Musk backs dogecoin Apple car euro slide continues BOE oil rises gold falls on strong dollar	null	-0.9997
36	290	Musk Helps Crypto Market Value Climb to Record in Volatile Week	null	0.9001
35	1070	Super Bowl LV HODL Or Bet	null	0.9619
36	350	Crypto escrow agent dodges jail after lying over stolen millions	null	-0.7650
36	530	Crypto Hedge Fund Founder Pleads Guilty to 90M Fraud CoinDesk	null	-0.7650
35	1430	PayPal is aiming to become a financial super app Silicon Valley Business Journal	null	0.5994
36	590	Robinhood lifts trading restrictions on Reddit darlings GameStop and AMC days after relaxing limits	null	0.7506
36	530	Online Casino with The Best Reward Program EconoTimes	null	0.8360
35	1370	Yearn Finance DAI Vault Has Suffered an Exploit 13 8M Drained CoinDesk	null	-0.7269
35	1370	Online Super Bowl Bets Expected to Increase 63 This Year	null	0.7351
35	1070	Instagram Unmasks High Profile OG Account Stealers Threatens to Sue	null	0.9451
35	1070	Dogecoin goes up over 40 after Elon Musk Mark Cuban tweet about it	null	0.7906
35	1010	Elon Musk Sent The Price Of Dogecoin Soaring With One Word Tweet	null	0.9985
35	950	Crypto Is the Libertarian Cheat Code in the Final Battle Over State Coercion	null	-0.5719
35	890	Sandstorm Gold briefly spikes 55 after Elon Musk praises a techno song with a similar name on	null	0.5267
35	1070	Dogecoin goes up over 40 after Elon Musk Mark Cuban tweet about it	null	0.7906
35	830	PayPal PYPL Soars 6 After Profit Triples Firms Raise Numbers and PTs Amid Super App	null	0.9987
35	830	Ethereum Triangle Breakout Shifts Price Target to Over 2 000	null	0.9325
35	830	Elon Musk s Twitter Comeback Sends Dogecoin Up Over 0 05	null	0.7906
35	766	Learn About Bitcoin So You Can Intelligently Invest in Cryptocurrency	null	0.5046
35	781	Forget Bitcoin Inside the insane world of altcoin cryptocurrency trading CNET	null	-0.5574
35	1061	Dogecoin goes up over 40 after Elon Musk Mark Cuban tweet about it	null	0.7906
37	1018	Bitcoin Rally Takes Crypto Market Value to New Record	null	0.9732
37	958	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	778	Bitcoin mining is horrible for the environment Here s what we can do about it	null	-0.5423
37	958	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	658	A bitcoin stash worth 68 million was seized by German police but the owner won t give up his	null	0.9517
36	1318	Market Wrap Bitcoin Rises to 38 3K While Ether s New High Takes Spotlight	null	0.9682
36	1438	Twitter CEO Jack Dorsey is setting up a bitcoin node	null	0.7906
37	298	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
36	1318	Market Wrap Bitcoin Rises to 38 3K While Ether s New High Takes Spotlight CoinDesk	null	0.9682
36	1378	Women make up only 15 of bitcoin traders highlighting the crypto world s glaring gender imbalance	null	0.7906
37	898	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9886
37	1078	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
37	1078	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
37	598	The institutionalization of BTC Mining may be more profitable than buying	null	0.9549
37	418	600M iGaming Platform Integrates FUN Token	null	0.6166
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1378	MoneyLine Podcast The Chance to Profit From This 1 6T Industry Is Just Beginning	null	0.5994
37	1078	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud CoinDesk	null	-0.5859
37	58	Altcoin Market Cap On The Verge Of Life Changing Breakout	null	0.9325
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1258	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
37	658	Elon Musk sent Dogecoin soaring last week Here are 6 times the Tesla boss has moved markets from	null	0.9985
36	1378	The IRS says teachers can deduct hand sanitizer costs and how Dolly Parton s Super Bowl ad glosses	null	0.7964
37	838	Thinking of Selling Stock Ask Yourself These Questions First The Motley Fool	null	-0.9509
37	838	Thinking of Selling Stock Ask Yourself These Questions First	null	-0.9325
37	778	New York Is Calling the Up and Comers	null	0.7906
37	298	Cardano Climbs 11 31 In Rally	null	0.9682
37	298	Cardano Climbs 11 As Investors Gain Confidence By Investing com	null	0.9853
37	298	Cardano Climbs 11 31 In Rally By Investing com	null	0.9682
37	238	It seems like a lifeline but it s not COVID 19 relief scams targeting Carolinians who are	null	-0.8308
37	178	Litecoin Climbs 10 14 In Bullish Trade By Investing com	null	0.9970
37	1078	Serbian Man Extradited to US After Being Indicted in 70M Crypto Fraud	null	-0.5859
37	958	Ethereum Price Prediction ETH ready to rise to new highs following crucial rebound	null	0.9957
37	778	9 great reads from CNET this week	null	0.6249
37	778	Cybersecurity An Attackers Perspective Model Portfolio Channel	null	-0.5719
36	1378	The IRS says teachers can deduct hand sanitizer costs and how Dolly Parton s Super Bowl ad glosses	null	0.7964
37	238	It seems like a lifeline but it s not COVID 19 relief scams targeting Carolinians who are	null	-0.8308
36	1438	Crypto exchange Bitfinex says it repaid 550 million Tether loan central to fraud probe	null	-0.5859
36	1378	The IRS says teachers can deduct hand sanitizer costs and how Dolly Parton s Super Bowl ad glosses	null	0.7964
35	766	Learn About Bitcoin So You Can Intelligently Invest in Cryptocurrency	null	0.5046
36	781	Is earning Bitcoin with each swipe the credit card reward of the future These cards think so	null	0.7430
36	841	NewsWatch U S gains just 49 000 jobs in January Labor market still under acute stress	null	0.9781
35	781	Forget Bitcoin Inside the insane world of altcoin cryptocurrency trading CNET	null	-0.5574
38	612	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a	null	0.9682
37	1032	Bitcoin Rally Takes Crypto Market Value to New Record	null	0.9732
37	1272	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	732	Bitcoin eyes 50K less than a month after BTC price broke its 2017 all time high	null	0.9595
37	792	Bitcoin mining is horrible for the environment Here s what we can do about it	null	-0.5423
37	972	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	972	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	1272	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	912	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9886
37	912	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15 CoinDesk	null	0.9886
38	552	Bitcoin rally takes market cap of over 6 000 cryptocurrencies to whopping new high of 1 24 trillion	null	0.9918
37	1032	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud CoinDesk	null	-0.5859
37	1032	Serbian Man Extradited to US After Being Indicted in 70M Crypto Fraud	null	-0.5859
37	972	Ethereum Price Prediction ETH ready to rise to new highs following crucial rebound	null	0.9957
37	852	Thinking of Selling Stock Ask Yourself These Questions First The Motley Fool	null	-0.9509
37	792	9 great reads from CNET this week	null	0.6249
37	732	Cybersecurity An Attackers Perspective Model Portfolio Channel	null	-0.5719
37	792	New York Is Calling the Up and Comers	null	0.7906
37	732	These are the top 10 US states where Dogecoin s popularity shot up after a group of Redditors	null	0.8979
35	766	Learn About Bitcoin So You Can Intelligently Invest in Cryptocurrency	null	0.5046
36	781	Is earning Bitcoin with each swipe the credit card reward of the future These cards think so	null	0.7430
36	841	NewsWatch U S gains just 49 000 jobs in January Labor market still under acute stress	null	0.9781
35	781	Forget Bitcoin Inside the insane world of altcoin cryptocurrency trading CNET	null	-0.5574
38	702	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a	null	0.9682
37	1122	Bitcoin Rally Takes Crypto Market Value to New Record	null	0.9732
37	1362	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	822	Bitcoin eyes 50K less than a month after BTC price broke its 2017 all time high	null	0.9595
37	882	Bitcoin mining is horrible for the environment Here s what we can do about it	null	-0.5423
37	1062	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	1062	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	1362	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	1002	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9886
37	1002	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15 CoinDesk	null	0.9886
38	642	Bitcoin rally takes market cap of over 6 000 cryptocurrencies to whopping new high of 1 24 trillion	null	0.9918
37	1122	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud CoinDesk	null	-0.5859
37	1122	Serbian Man Extradited to US After Being Indicted in 70M Crypto Fraud	null	-0.5859
37	1062	Ethereum Price Prediction ETH ready to rise to new highs following crucial rebound	null	0.9957
37	942	Thinking of Selling Stock Ask Yourself These Questions First The Motley Fool	null	-0.9509
37	882	9 great reads from CNET this week	null	0.6249
37	822	Cybersecurity An Attackers Perspective Model Portfolio Channel	null	-0.5719
37	882	New York Is Calling the Up and Comers	null	0.7906
37	822	These are the top 10 US states where Dogecoin s popularity shot up after a group of Redditors	null	0.8979
35	766	Learn About Bitcoin So You Can Intelligently Invest in Cryptocurrency	null	0.5046
35	781	Forget Bitcoin Inside the insane world of altcoin cryptocurrency trading CNET	null	-0.5574
36	781	Is earning Bitcoin with each swipe the credit card reward of the future These cards think so	null	0.7430
36	841	NewsWatch U S gains just 49 000 jobs in January Labor market still under acute stress	null	0.9781
37	1006	Bitcoin Rally Takes Crypto Market Value to New Record	null	0.9732
37	1126	Bitcoin breaks 40 000 and sets its sights on a new all time high ETH fees spike as a new price	null	0.9682
37	1306	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	1006	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	1006	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	1306	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	886	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15 CoinDesk	null	0.9886
37	886	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9886
37	1066	Why DeFi blue chips SUSHI and AAVE severely pulled back after Bitcoin rally CryptoSlate	null	0.9584
37	1246	The best business finance and retirement accounts to follow on Twitter in 2021	null	0.6369
37	886	Is PayPal Stock A Buy Right Now After Strong Q4 Earnings Here s What Earnings Charts Show	null	0.5106
37	826	Thinking of Selling Stock Ask Yourself These Questions First The Motley Fool	null	-0.9509
37	826	Thinking of Selling Stock Ask Yourself These Questions First	null	-0.9325
38	742	New York Is Calling the Up and Comers	null	0.7906
37	11	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	593	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	892	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1056	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1286	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	515	Green hackers around the world let s destroy Bitcoin	null	-0.5423
38	606	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
37	1012	Bitcoin Rally Takes Crypto Market Value to New Record	null	0.9732
37	1132	Bitcoin breaks 40 000 and sets its sights on a new all time high ETH fees spike as a new price	null	0.9682
37	1072	Why DeFi blue chips SUSHI and AAVE severely pulled back after Bitcoin rally CryptoSlate	null	0.9584
37	1312	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	952	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	952	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	1312	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	892	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15 CoinDesk	null	0.9886
37	892	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9886
37	1072	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
37	1072	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
38	592	Bitcoin rally takes market cap of over 6 000 cryptocurrencies to whopping new high of 1 24 trillion	null	0.9918
37	1072	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud CoinDesk	null	-0.5859
37	11	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	593	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	892	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1056	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1286	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	515	Green hackers around the world let s destroy Bitcoin	null	-0.5423
38	606	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
37	11	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	593	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	892	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1056	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1286	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	515	Green hackers around the world let s destroy Bitcoin	null	-0.5423
38	606	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
37	11	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	593	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	892	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1056	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1286	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	515	Green hackers around the world let s destroy Bitcoin	null	-0.5423
38	606	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
37	11	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	593	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	892	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1056	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1286	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	606	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
38	850	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
38	934	Forbes Blockchain 50 Meet The Bitcoin Lovers In Corporate America	null	0.5267
38	669	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a	null	0.9682
37	1149	Bitcoin breaks 40 000 and sets its sights on a new all time high ETH fees spike as a new price	null	0.9682
38	909	German Fraudster Refuses to Give Police Passwords to 60M Bitcoin Wallet	null	-0.5423
37	1329	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	1089	Why DeFi blue chips SUSHI and AAVE severely pulled back after Bitcoin rally CryptoSlate	null	0.9584
37	1089	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
37	1089	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
38	609	Bitcoin rally takes market cap of over 6 000 cryptocurrencies to whopping new high of 1 24 trillion	null	0.9918
38	909	DOGE and XRP rally as pump and dumps sneak back into crypto markets	null	0.9601
38	309	EOS Climbs 10 08 In Bullish Trade By Investing com	null	0.9970
37	1089	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud CoinDesk	null	-0.5859
38	309	Cardano Climbs 19 82 In Rally	null	0.9682
38	309	Cardano Climbs 19 82 In Rally By Investing com	null	0.9682
38	309	Cardano Climbs 19 82 In Rally By Investing com	null	0.9682
38	309	Precious Metals Energy Weekly Review and Calendar Ahead	null	0.7003
38	309	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
38	309	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
38	309	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
37	11	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	593	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	892	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1056	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1286	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	515	Green hackers around the world let s destroy Bitcoin	null	-0.5423
38	606	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
38	850	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
38	934	Forbes Blockchain 50 Meet The Bitcoin Lovers In Corporate America	null	0.5267
38	1006	Bitcoin Rally Takes Crypto Market Value to New Record	null	0.9732
38	670	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a	null	0.9682
37	1150	Bitcoin breaks 40 000 and sets its sights on a new all time high ETH fees spike as a new price	null	0.9682
38	910	German Fraudster Refuses to Give Police Passwords to 60M Bitcoin Wallet	null	-0.5423
37	1330	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	1090	Why DeFi blue chips SUSHI and AAVE severely pulled back after Bitcoin rally CryptoSlate	null	0.9584
37	1090	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
37	1090	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
38	610	Bitcoin rally takes market cap of over 6 000 cryptocurrencies to whopping new high of 1 24 trillion	null	0.9918
38	910	DOGE and XRP rally as pump and dumps sneak back into crypto markets	null	0.9601
38	310	EOS Climbs 10 08 In Bullish Trade By Investing com	null	0.9970
37	1090	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud CoinDesk	null	-0.5859
38	310	Cardano Climbs 19 82 In Rally	null	0.9682
38	310	Cardano Climbs 19 82 In Rally By Investing com	null	0.9682
38	310	Cardano Climbs 19 82 In Rally By Investing com	null	0.9682
38	310	Precious Metals Energy Weekly Review and Calendar Ahead	null	0.7003
38	310	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
38	310	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
38	310	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
37	11	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	593	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	892	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1056	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1286	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	515	Green hackers around the world let s destroy Bitcoin	null	-0.5423
38	606	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
38	850	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
38	934	Forbes Blockchain 50 Meet The Bitcoin Lovers In Corporate America	null	0.5267
38	1006	Bitcoin Rally Takes Crypto Market Value to New Record	null	0.9732
38	674	Bitcoin rally incoming MicroStrategy Playbook Seminar a Smash Hit	null	0.9682
37	1094	Bitcoin breaks 40 000 and sets its sights on a new all time high ETH fees spike as a new price	null	0.9682
37	1094	Why DeFi blue chips SUSHI and AAVE severely pulled back after Bitcoin rally CryptoSlate	null	0.9584
38	854	German Fraudster Refuses to Give Police Passwords to 60M Bitcoin Wallet	null	-0.5423
37	1274	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	1274	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	1094	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
37	1094	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
38	554	Bitcoin rally takes market cap of over 6 000 cryptocurrencies to whopping new high of 1 24 trillion	null	0.9918
38	314	EOS Climbs 10 08 In Bullish Trade	null	0.9970
38	314	EOS Climbs 10 08 In Bullish Trade By Investing com	null	0.9970
38	1010	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud CoinDesk	null	-0.5859
38	314	EOS Climbs 10 In Rally By Investing com	null	0.9682
38	314	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
38	134	Success of digital financial services rests on rural India s shift from cash to digital payments	null	0.5719
38	614	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a	null	0.9682
38	314	Cardano Climbs 19 82 In Rally	null	0.9682
38	314	Cardano Climbs 19 82 In Rally By Investing com	null	0.9682
38	314	Cardano Climbs 19 82 In Rally By Investing com	null	0.9682
38	314	Ethereum Falls 10 In Selloff By Investing com	null	-0.9997
38	314	Precious Metals Energy Weekly Review and Calendar Ahead	null	0.7003
38	314	Precious Metals Energy Weekly Review and Calendar Ahead	null	0.7003
38	314	Precious Metals Energy Weekly Review and Calendar Ahead	null	0.7003
38	314	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
38	314	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
38	554	Janet Yellen Re Cryptocurrencies and Terrorists	null	-0.6249
37	11	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	593	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	892	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1056	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1286	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	515	Green hackers around the world let s destroy Bitcoin	null	-0.5423
38	606	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
38	850	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
38	934	Forbes Blockchain 50 Meet The Bitcoin Lovers In Corporate America	null	0.5267
38	319	Cardano Climbs 19 82 In Rally	null	0.9682
38	319	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
37	1099	Why DeFi blue chips SUSHI and AAVE severely pulled back after Bitcoin rally CryptoSlate	null	0.9584
37	1397	Growing list of billion dollar crypto unicorns suggest the best is yet to come	null	0.7096
38	850	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
38	321	Cardano Climbs 19 82 In Rally	null	0.9682
38	321	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
37	1101	Why DeFi blue chips SUSHI and AAVE severely pulled back after Bitcoin rally CryptoSlate	null	0.9584
37	1397	Growing list of billion dollar crypto unicorns suggest the best is yet to come	null	0.7096
38	850	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
39	1239	FOREX Dollar steady after Friday s U S jobs related losses bitcoin soars	null	0.9984
39	985	Bitcoin price soars How much 100 would be worth today if you had invested earlier	null	0.9985
39	1165	What is Dogecoin the joke crypto loved by Elon Musk and growing faster than Bitcoin	null	0.7783
39	1105	Explainer Elon Musk loves it So what s all the buzz about bitcoin	null	0.5719
39	1045	Bitcoin Price Predictions Where Will BTC Go After Tesla Fueled Rally	null	0.9682
39	1045	Bitcoin jumps to record high after Tesla invests 1 5B accepts cryptocurrency	null	0.9983
39	865	Bitcoin Jumps 10 to Record High on Tesla Investment News	null	0.9982
39	805	Bitcoin Hits New Record High Over 43K on Tesla News	null	0.9682
39	985	Bitcoin surges to all time high as Tesla invests 1 5B	null	0.9682
39	565	CME Ethereum futures go live Bitcoin caps its best week ever 5 things to watch this week	null	0.6369
39	925	Bitcoin jumps to record 44 000 as Tesla invests 1 5 billion	null	0.9970
39	865	Bitcoin Price Alert Tesla s 1 5B Purchase and Payment Promise Send the Crypto Soaring	null	0.9986
39	805	Bitcoin hits 43K all time high as Tesla invests 1 5 billion in BTC	null	0.9682
39	1165	Bitcoin surges to record high as Tesla announces it has invested 1 5bn and will take it as payment	null	0.9682
39	685	Bitcoin Gets Support From Mexico s Third Richest Person Billionaire Follows Elon Musk s Move	null	0.7269
39	865	Cryptocurrency live Latest as bitcoin hits new all time high after massive Tesla investment	null	0.9682
39	805	Bitcoin Soars After Elon Musk Says Tesla Invested 1 5billion in BTC	null	0.9985
39	925	Bitcoin jumps to record 44 000 as Tesla invests 1 5 billion	null	0.9970
39	1045	Bitcoin soars to all time high as Musk s Tesla says it bought 1 5 billion	null	0.9990
39	925	Bitcoin soars to all time high as Musk s Tesla says it bought 1 5 billion	null	0.9990
39	805	Bitcoin soars 15 after Tesla says will accept it as payment	null	0.9985
39	865	Bitcoin retests 40 000 as active addresses hit new all time high	null	0.9741
39	325	Tesla s Bitcoin Buy Is a Reckless Destructive Troll	null	-0.7717
39	925	Bitcoin reaches all time high after Tesla discloses 1 5 billion purchase	null	0.9690
39	1165	Tesla s Buying of Bitcoin Briefly Made Bitcoin More Valuable Than Tesla	null	0.9545
39	325	Bitcoin Has Rallied More Than 50 This Year After Hitting A Fresh High	null	0.9729
39	325	Bitcoin Soars To New High After Tesla Says It Invested 1 5 Billion	null	0.9990
39	865	Bitcoin hits record high after Tesla invests 1 5bn live updates	null	0.9682
39	805	Bitcoin spikes 13 to record high after Tesla says it invested 1 5 billion in the cryptocurrency	null	0.9682
39	325	Bitcoin Climbs 11 In Rally By Investing com	null	0.9682
39	325	As Bitcoin Hits Record High Experts Say Others Will Follow Tesla s Bitcoin Bet By Investing com	null	0.9682
39	1105	EXPLAINER Elon Musk loves it So what s all the buzz about bitcoin	null	0.5719
39	865	Bitcoin jumps 10 to record high on Tesla investment news	null	0.9982
39	1045	Bitcoin reaches all time high of 44 000 following Tesla s 1 5 billion investment	null	0.9690
39	925	Bitcoin reaches all time high after Tesla discloses 1 5 billion purchase	null	0.9690
39	325	Bitcoin Climbs 11 42 In Bullish Trade	null	0.9970
39	805	UPDATE 1 Bitcoin jumps 10 to record high on Tesla investment news	null	0.9982
39	805	Bitcoin jumps 10 to record high on Tesla investment news	null	0.9982
39	1105	EXPLAINER Elon Musk loves it So what s all the buzz about bitcoin	null	0.5719
39	1045	Tesla buys 1 5 billion in bitcoin sending its price soaring	null	0.9985
39	805	Tesla buys 1 5 billion in bitcoin as Elon Musk jumps on board with cryptocurrency	null	0.9970
39	1045	Legendary investor Bill Miller has set up his flagship fund to buy into Grayscale Bitcoin Trust	null	0.8934
39	925	Tesla Buys 1 5 Billion in Bitcoin Sending Its Price Soaring	null	0.9985
39	925	Tesla Buys 1 5 Billion in Bitcoin Sending Its Price Soaring	null	0.9985
39	805	Tesla TSLA buys 1 5B in bitcoin pushing the crypto to all time high plans to accept as payment	null	0.9738
39	865	Tesla Sends Bitcoin Mooning Past 44K as Snoop Wins dogebowl CoinDesk	null	0.5719
39	1045	Tesla buys 1 5 billion in bitcoin sending its price soaring	null	0.9985
39	325	Tesla invests 1 5 billion in Bitcoin as Elon Musk praises cryptocurrencies	null	0.5267
39	1105	Elon Musk s big Bitcoin buy may have been to distract from bad Tesla news	null	-0.6908
39	1045	Dow Jones Rises To Record High As Tesla Buys Bitcoin Market Rally Warning Signs	null	0.9910
39	925	Elon Musk s Latest Move Sends Bitcoin Soaring	null	0.9985
39	685	GameStop s Plunge Could Spill Over Into Bitcoin	null	-0.9988
39	925	Tesla Buys 1 5 Billion in Bitcoin Sending Its Price Soaring	null	0.9985
39	925	Tesla Buys 1 5 Billion in Bitcoin Sending Its Price Soaring	null	0.9985
39	1105	Tesla Buying Bitcoin Is Bullish for Both TSLA Stock BTC	null	0.9979
39	565	Children s Charity Creates Bitcoin Superhero to Attract Crypto Donations CoinDesk	null	0.7506
39	745	Stock market news live updates Stocks rise to reach record highs Bitcoin prices spike	null	0.9819
39	985	Tesla invests 1 5 billion in bitcoin sending the price soaring to new heights	null	0.9985
39	1105	Square Stock Hits All Time High As Tesla Purchase Sends Bitcoin Price Soaring	null	0.9990
39	1225	Dow Jones Rises For Sixth Straight Session As Disney Stock Breaks Out Tesla Bullish On Bitcoin	null	0.9971
39	805	Tesla Buys 1 5 Billion Worth of Bitcoin May Accept the Cryptocurrency as Payment in the Future	null	0.5423
39	325	Tesla sends bitcoin soaring with 1 5 billion investment payment promise By Reuters	null	0.9985
39	1251	Square gains 10 as the payments company rides bitcoin s record breaking rise	null	0.9953
39	1105	Tesla buying 1 5 billion in bitcoin opens the company up to further scrutiny	null	0.9682
39	445	Bill Miller to Allow Opportunity Fund to Buy Into Bitcoin Trust	null	0.7906
39	325	Wall Street Opens Higher Tesla Bitcoin Buzz Helps Dow up By Investing com	null	0.8625
39	325	Wall Street Opens Higher Tesla Bitcoin Buzz Helps Dow up By Investing com	null	0.8625
39	805	Tesla buys 1 5 billion worth of bitcoin says may accept it for payment for products in the near	null	0.5423
39	805	Tesla buys 1 5 billion worth of bitcoin says may accept it for payment for products in the near	null	0.5423
39	385	Elon Musk Says Dogecoin s High Supply Relative To Bitcoin Can Actually Be An Advantage	null	0.9719
39	865	India Mulls Ordinance Route To Ban Cryptocurrencies	null	-0.5574
39	685	US stocks close at record highs as stimulus optimism continues	null	0.5423
39	925	Wall Street opens higher continuing win streak	null	0.5859
39	325	Indian parliament fast tracks bill to ban bitcoin and other cryptocurrencies By BTC Peers	null	-0.5574
39	445	Stocks open higher on Wall Street continuing strong streak	null	0.5106
39	925	Stocks open higher on Wall Street continuing strong streak	null	0.5106
39	745	Wall Street hits all time closing highs on stimulus euphoria vaccine rollout	null	0.6486
39	745	Wall Street hits all time closing highs on stimulus euphoria vaccine rollout	null	0.6486
39	445	Stocks push to more gains and record highs on Wall Street	null	0.9823
38	515	Green hackers around the world let s destroy Bitcoin	null	-0.5423
39	843	Bitcoin jumps 10 to record high on Tesla investment news Reuters	null	0.9982
39	912	Bitcoin hits record highs as Tesla jumps in but it s also great news for gold price Kitco NEWS	null	0.9916
39	919	Bitcoin Spikes 16 To Record High After Tesla Says It Invested 1 5 Billion in the Cryptocurrency and Will Begin Accepting It as Payment	null	0.9738
39	1079	EXPLAINER Elon Musk loves it So what s all the buzz about bitcoin Reuters	null	0.5719
39	1264	US STOCKS Wall Street hits all time closing highs on stimulus euphoria vaccine rollout Reuters	null	0.6486
40	578	Bitcoin price hits new all time high taking market cap value above Facebook and Tesla	null	0.9732
40	592	BREAKING Bitcoin pushes past 48 000 to new record high	null	0.9682
40	586	A Tesla for a bitcoin Musk drives up cryptocurrency price with 1 5 billion purchase	null	0.7906
40	1141	Bitcoin investors From buying a Bentley to losing it all	null	0.9081
40	1201	Here s Why Bitcoin Stocks Are Soaring Today	null	0.9985
41	421	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
41	361	Bitcoin soars 15 after Tesla says will accept it as payment	null	0.9985
40	1201	Legit Way to Play the Bitcoin Rally	null	0.9732
40	901	Bitcoin hits another record high after Tesla s 1 5 billion buy in	null	0.9682
41	181	Bitcoin Late January Breakout Held Now On Its Way To 50K Investing com	null	0.9325
40	1201	Bitcoin Driven Higher by TWAP Buying as Price Stabilizes at All Time Highs	null	0.9325
40	721	Bitcoin rockets to record high of 48 000 after Elon Musk s Tesla buys up 1 5 billion with one	null	0.9818
40	721	Bitcoin Could Rally Further as Tesla Leads Corporates on Treasury Investments CoinDesk	null	0.9712
40	841	Bitcoin s Tesla Driven Rally Fizzles After Prices Hit 48 000	null	0.9682
40	961	Bitcoin soars to new highs and oil jumps as outlook brightens with US stocks set to slip as markets	null	0.9995
40	721	Bitcoin Could Rally Further as Tesla Leads Corporates on Treasury Investments	null	0.9712
40	1201	Bitcoin Can t Be Stopped Nigerians Look to P2P Exchanges After Crypto Ban	null	-0.6705
40	1021	Bitcoin Miner Riot Blockchain Names Jason Les CEO	null	-0.5574
40	1381	Bitcoin soars above 48 000 to new record after Tesla s 1 5 billion investment CNBC After Hours	null	0.9985
40	1321	With Elon Musk at the wheel Bitcoin hits 95 on the 100 point extreme fear to extreme greed index	null	-0.7096
40	1381	The Bitcoin rally isn t enough to dethrone the mighty dollar NewsChannel 3 12	null	0.9682
40	1201	Here s Why Bitcoin Stocks Are Soaring Today The Motley Fool	null	0.9984
41	301	Musk s bitcoin bet fuels gains in companies already invested By Reuters	null	0.9818
41	301	Musk s bitcoin bet fuels gains in companies already invested By Reuters	null	0.9818
40	1321	The Bitcoin rally isn t enough to dethrone the mighty dollar	null	0.9682
40	781	Elon Musk s 1 5bn Bitcoin investment triggers record high as Dogecoin rockets	null	0.9682
40	1261	Tesla Will Accept Bitcoin for Cars Buys 1 5 Billion Worth of the Cryptocurrency	null	0.5423
40	841	How Long Will the Tesla Driven Bitcoin Rally Last	null	0.9682
40	1381	The Bitcoin rally isn t enough to dethrone the mighty dollar KION546	null	0.9682
40	1081	BlockFi s Bitcoin Trust Takes Aim at GBTC CoinDesk	null	0.5106
41	181	Former MP Central Banks Should Ban Bitcoin	null	-0.5574
41	121	Dollar wallows at two week low bitcoin steadies after surge past 48 000	null	-0.9682
40	1081	BlockFi s Bitcoin Trust Takes Aim at GBTC	null	0.5106
40	1261	ETFs to Ride the Tesla Driven Bitcoin Rally	null	0.9682
40	901	Cryptocurrency Related Stocks Soar as Bitcoin Hits Record High	null	0.9682
40	1021	Forget Bitcoin Buy PayPal and Square Instead The Motley Fool	null	-0.5859
40	1261	FOREX U S dollar drops to two week low bitcoin eyes 50 000	null	-0.9682
41	361	Musk s Bitcoin Bet Fuels Gains in Companies Already Invested	null	0.9818
41	181	Reddit User Who Leaked Tesla s Bitcoin Investment News Was Just High	null	0.9623
40	1381	Ethereum Surpasses Bitcoin To Become Largest Network For Trustless Money Settlement	null	-0.5106
40	1081	GLOBAL MARKETS Stocks mostly ease off record highs bitcoin rise again	null	0.9842
41	181	Reddit User Who Leaked Tesla s Bitcoin Investment News Was Just High	null	0.9623
40	1261	Former British MP says central banks should ban Bitcoin	null	-0.5574
41	301	Musk s bitcoin bet fuels gains in companies already invested By Reuters	null	0.9818
41	361	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
40	1381	Ethereum Surpasses Bitcoin To Become Largest Network For Trustless Money Settlement	null	-0.5106
40	1081	Woman Charged In Failed Murder For Hire Plot Using Bitcoin	null	-0.8689
41	301	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
41	301	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
40	1021	Wisconsin woman allegedly paid in bitcoin for murder for hire on dark web	null	-0.6908
41	361	Why This Tesla Bitcoin Marriage Won t Live Up To The Hype Investing com	null	0.8934
41	301	Dollar wallows at two week low bitcoin steadies after surge past 48 000 By Reuters	null	-0.9682
40	841	Before Tesla s bitcoin play this company bought first and may have inspired Elon Musk	null	0.6808
40	1081	Woman Charged In Failed Murder For Hire Plot Using Bitcoin	null	-0.8689
40	1081	Woman Charged In Failed Murder For Hire Plot Using Bitcoin	null	-0.8689
40	841	Will other companies follow Tesla s lead and load up on Bitcoin	null	0.7906
40	721	Tesla s 1 5 billion bitcoin investment is already up 37 as regulatory scrutiny ratchets up	null	0.9325
40	721	Tesla s 1 5 billion bitcoin investment is already up 37 as regulatory scrutiny ratchets up	null	0.9325
41	361	Business Report GTA 1M homes Bitcoin tops 48K overnight thanks to Elon Twitter earnings	null	0.7351
40	1021	Tesla insider leaked huge bitcoin investment on Reddit over a month ago but was laughed at	null	0.6124
40	1	Bitcoin extends gains above 47 000 in Asia Reuters	null	0.9826
40	1	Bitcoin extends gains above 47 000 in Asia Reuters	null	0.9826
40	361	GLOBAL MARKETS Stocks oil rise in Asia after U S records dollar weakens Reuters	null	0.9792
40	661	Tesla s 1 5 billion bitcoin investment is already up 37 as regulatory scrutiny ratchets up Yahoo Canada Finance	null	0.9325
40	661	FOREX Dollar struggles as U S yields soften Bitcoin soars Reuters	null	0.9984
41	361	Musk s bitcoin bet fuels gains in companies already invested Reuters	null	0.9818
41	361	Musk s bitcoin bet fuels gains in companies already invested Reuters	null	0.9818
40	1201	Bitcoin investors From buying a Bentley to losing it all	null	0.9081
40	1261	Here s Why Bitcoin Stocks Are Soaring Today	null	0.9985
41	481	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
41	421	Bitcoin soars 15 after Tesla says will accept it as payment	null	0.9985
40	1261	Legit Way to Play the Bitcoin Rally	null	0.9732
40	961	Bitcoin hits another record high after Tesla s 1 5 billion buy in	null	0.9682
41	241	Bitcoin Late January Breakout Held Now On Its Way To 50K Investing com	null	0.9325
40	1261	Bitcoin Driven Higher by TWAP Buying as Price Stabilizes at All Time Highs	null	0.9325
40	781	Bitcoin rockets to record high of 48 000 after Elon Musk s Tesla buys up 1 5 billion with one	null	0.9818
40	781	Bitcoin Could Rally Further as Tesla Leads Corporates on Treasury Investments CoinDesk	null	0.9712
40	901	Bitcoin s Tesla Driven Rally Fizzles After Prices Hit 48 000	null	0.9682
40	1021	Bitcoin soars to new highs and oil jumps as outlook brightens with US stocks set to slip as markets	null	0.9995
40	781	Bitcoin Could Rally Further as Tesla Leads Corporates on Treasury Investments	null	0.9712
40	1261	Bitcoin Can t Be Stopped Nigerians Look to P2P Exchanges After Crypto Ban	null	-0.6705
41	1	Bitcoin soars above 48 000 to new record after Tesla s 1 5 billion investment CNBC After Hours	null	0.9985
40	1381	With Elon Musk at the wheel Bitcoin hits 95 on the 100 point extreme fear to extreme greed index	null	-0.7096
41	1	The Bitcoin rally isn t enough to dethrone the mighty dollar NewsChannel 3 12	null	0.9682
40	1261	Here s Why Bitcoin Stocks Are Soaring Today The Motley Fool	null	0.9984
41	361	Musk s bitcoin bet fuels gains in companies already invested By Reuters	null	0.9818
41	361	Musk s bitcoin bet fuels gains in companies already invested By Reuters	null	0.9818
40	1381	The Bitcoin rally isn t enough to dethrone the mighty dollar	null	0.9682
40	841	Elon Musk s 1 5bn Bitcoin investment triggers record high as Dogecoin rockets	null	0.9682
40	1321	Tesla Will Accept Bitcoin for Cars Buys 1 5 Billion Worth of the Cryptocurrency	null	0.5423
40	901	How Long Will the Tesla Driven Bitcoin Rally Last	null	0.9682
41	1	The Bitcoin rally isn t enough to dethrone the mighty dollar KION546	null	0.9682
40	1141	BlockFi s Bitcoin Trust Takes Aim at GBTC CoinDesk	null	0.5106
41	241	Former MP Central Banks Should Ban Bitcoin	null	-0.5574
41	181	Dollar wallows at two week low bitcoin steadies after surge past 48 000	null	-0.9682
40	1141	BlockFi s Bitcoin Trust Takes Aim at GBTC	null	0.5106
40	1321	ETFs to Ride the Tesla Driven Bitcoin Rally	null	0.9682
40	961	Cryptocurrency Related Stocks Soar as Bitcoin Hits Record High	null	0.9682
40	1081	Forget Bitcoin Buy PayPal and Square Instead The Motley Fool	null	-0.5859
40	1321	FOREX U S dollar drops to two week low bitcoin eyes 50 000	null	-0.9682
41	421	Musk s Bitcoin Bet Fuels Gains in Companies Already Invested	null	0.9818
41	241	Reddit User Who Leaked Tesla s Bitcoin Investment News Was Just High	null	0.9623
41	1	Ethereum Surpasses Bitcoin To Become Largest Network For Trustless Money Settlement	null	-0.5106
40	1141	GLOBAL MARKETS Stocks mostly ease off record highs bitcoin rise again	null	0.9842
41	241	Reddit User Who Leaked Tesla s Bitcoin Investment News Was Just High	null	0.9623
40	1321	Former British MP says central banks should ban Bitcoin	null	-0.5574
41	361	Musk s bitcoin bet fuels gains in companies already invested By Reuters	null	0.9818
41	421	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
41	1	Ethereum Surpasses Bitcoin To Become Largest Network For Trustless Money Settlement	null	-0.5106
40	1141	Woman Charged In Failed Murder For Hire Plot Using Bitcoin	null	-0.8689
41	361	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
41	361	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
40	1081	Wisconsin woman allegedly paid in bitcoin for murder for hire on dark web	null	-0.6908
41	421	Why This Tesla Bitcoin Marriage Won t Live Up To The Hype Investing com	null	0.8934
41	361	Dollar wallows at two week low bitcoin steadies after surge past 48 000 By Reuters	null	-0.9682
40	901	Before Tesla s bitcoin play this company bought first and may have inspired Elon Musk	null	0.6808
40	1141	Woman Charged In Failed Murder For Hire Plot Using Bitcoin	null	-0.8689
40	1141	Woman Charged In Failed Murder For Hire Plot Using Bitcoin	null	-0.8689
40	901	Will other companies follow Tesla s lead and load up on Bitcoin	null	0.7906
40	781	Tesla s 1 5 billion bitcoin investment is already up 37 as regulatory scrutiny ratchets up	null	0.9325
40	781	Tesla s 1 5 billion bitcoin investment is already up 37 as regulatory scrutiny ratchets up	null	0.9325
41	421	Business Report GTA 1M homes Bitcoin tops 48K overnight thanks to Elon Twitter earnings	null	0.7351
40	1081	Tesla insider leaked huge bitcoin investment on Reddit over a month ago but was laughed at	null	0.6124
40	1	Bitcoin extends gains above 47 000 in Asia Reuters	null	0.9826
40	1	Bitcoin extends gains above 47 000 in Asia Reuters	null	0.9826
40	361	GLOBAL MARKETS Stocks oil rise in Asia after U S records dollar weakens Reuters	null	0.9792
40	661	Tesla s 1 5 billion bitcoin investment is already up 37 as regulatory scrutiny ratchets up Yahoo Canada Finance	null	0.9325
40	661	FOREX Dollar struggles as U S yields soften Bitcoin soars Reuters	null	0.9984
41	361	Musk s bitcoin bet fuels gains in companies already invested Reuters	null	0.9818
41	361	Musk s bitcoin bet fuels gains in companies already invested Reuters	null	0.9818
41	601	Tesla s decision to accept Bitcoin opens it up to currency of thieves	null	0.7430
40	1081	Bitcoin investors From buying a Bentley to losing it all	null	0.9081
40	1141	Here s Why Bitcoin Stocks Are Soaring Today	null	0.9985
40	1141	Legit Way to Play the Bitcoin Rally	null	0.9732
41	301	Bitcoin soars 15 after Tesla says will accept it as payment	null	0.9985
40	841	Bitcoin hits another record high after Tesla s 1 5 billion buy in	null	0.9682
41	121	Bitcoin Late January Breakout Held Now On Its Way To 50K Investing com	null	0.9325
40	1141	Bitcoin Driven Higher by TWAP Buying as Price Stabilizes at All Time Highs	null	0.9325
40	781	Bitcoin s Tesla Driven Rally Fizzles After Prices Hit 48 000	null	0.9682
40	901	Bitcoin soars to new highs and oil jumps as outlook brightens with US stocks set to slip as markets	null	0.9995
40	961	Bitcoin Miner Riot Blockchain Names Jason Les CEO	null	-0.5574
40	1261	With Elon Musk at the wheel Bitcoin hits 95 on the 100 point extreme fear to extreme greed index	null	-0.7096
40	1321	Bitcoin soars above 48 000 to new record after Tesla s 1 5 billion investment CNBC After Hours	null	0.9985
40	1261	The Bitcoin rally isn t enough to dethrone the mighty dollar NewsChannel 3 12	null	0.9682
40	1141	Here s Why Bitcoin Stocks Are Soaring Today The Motley Fool	null	0.9984
41	241	Musk s bitcoin bet fuels gains in companies already invested By Reuters	null	0.9818
41	241	Musk s bitcoin bet fuels gains in companies already invested By Reuters	null	0.9818
41	301	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
41	361	Elrond Cryptocurrency Has Soared 723 This Year Dwarfing Bitcoin Dogecoin Gains Here s Why	null	0.9818
40	1201	The Bitcoin rally isn t enough to dethrone the mighty dollar	null	0.9682
40	1201	The Bitcoin rally isn t enough to dethrone the mighty dollar	null	0.9682
41	301	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
41	301	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
40	1201	The Bitcoin rally isn t enough to dethrone the mighty dollar KVIA	null	0.9682
41	61	Dollar wallows at two week low bitcoin steadies after surge past 48 000	null	-0.9682
41	121	Dollar wallows at two week low bitcoin steadies after surge past 48 000	null	-0.9682
40	961	Forget Bitcoin Buy PayPal and Square Instead The Motley Fool	null	-0.5859
41	241	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
41	241	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
41	121	Former MP Central Banks Should Ban Bitcoin	null	-0.5574
40	1201	FOREX U S dollar drops to two week low bitcoin eyes 50 000	null	-0.9682
40	1201	ETFs to Ride the Tesla Driven Bitcoin Rally	null	0.9682
40	961	Wisconsin woman allegedly paid in bitcoin for murder for hire on dark web	null	-0.6908
41	121	Reddit User Who Leaked Tesla s Bitcoin Investment News Was Just High	null	0.9623
40	961	GLOBAL MARKETS Stocks mostly ease off record highs bitcoin rise again	null	0.9842
41	121	Reddit User Who Leaked Tesla s Bitcoin Investment News Was Just High	null	0.9623
41	301	Musk s Bitcoin Bet Fuels Gains in Companies Already Invested	null	0.9818
40	1321	Ethereum Surpasses Bitcoin To Become Largest Network For Trustless Money Settlement	null	-0.5106
40	901	Opening Bell Economic Rebound Hopes Lift Futures Global Stocks Oil Bitcoin Investing com	null	0.9846
40	1201	Tesla Will Accept Bitcoin for Cars Buys 1 5 Billion Worth of the Cryptocurrency	null	0.5423
40	1021	Woman Charged In Failed Murder For Hire Plot Using Bitcoin	null	-0.8689
40	1021	Woman Charged In Failed Murder For Hire Plot Using Bitcoin	null	-0.8689
40	1201	The Bitcoin rally isn t enough to dethrone the mighty dollar	null	0.9682
41	541	Why This Tesla Bitcoin Marriage Won t Live Up To The Hype Investing com	null	0.8934
41	241	Dollar wallows at two week low bitcoin steadies after surge past 48 000 By Reuters	null	-0.9682
40	1201	Former British MP says central banks should ban Bitcoin	null	-0.5574
41	61	Opening Bell Economic Rebound Hopes Lift Futures Global Stocks Oil Bitcoin Investing com CA	null	0.9846
40	841	First Mover Elon Musk s bitcoin Bet Pays Off With 270M Gain on First Day	null	0.9818
40	781	Will other companies follow Tesla s lead and load up on Bitcoin	null	0.7906
41	301	Business Report GTA 1M homes Bitcoin tops 48K overnight thanks to Elon Twitter earnings	null	0.7351
40	1	Bitcoin extends gains above 47 000 in Asia Reuters	null	0.9826
40	1	Bitcoin extends gains above 47 000 in Asia Reuters	null	0.9826
40	661	FOREX Dollar struggles as U S yields soften Bitcoin soars Reuters	null	0.9984
40	661	Tesla s 1 5 billion bitcoin investment is already up 37 as regulatory scrutiny ratchets up Yahoo Canada Finance	null	0.9325
41	361	Musk s bitcoin bet fuels gains in companies already invested Reuters	null	0.9818
41	361	Musk s bitcoin bet fuels gains in companies already invested Reuters	null	0.9818
42	1141	Bitcoin donations surge to jailed Kremlin critic Navalny s cause data	null	-0.6486
42	1261	Price Of Bitcoin Hits High As Two More Financial Giants Add Crypto Support	null	0.9741
42	1141	Bitcoin donations surge to jailed Kremlin critic Navalny s cause data	null	-0.6486
42	961	Bitcoin s big moment Mastercard jumps on the bandwagon NewsChannel 3 12	null	0.9970
42	781	Bitcoin Options Market Sees Low Odds of Sky High Rally in 2021 CoinDesk	null	0.9682
42	961	Bitcoin s big moment Mastercard jumps on the bandwagon	null	0.9970
42	1021	Bitcoin surges 7 to a record high amid new adoption from Mastercard and BNY Mellon	null	0.9682
42	841	Bitcoin Surges to All Time High After BNY Mellon Embraces Cryptocurrencies	null	0.9682
42	841	Bitcoin blows past 48 000 to hit another record high as major financial firms warm to crypto	null	0.9716
42	661	Bitcoin price rally to record highs might resemble a bubble but on chain metrics disapprove	null	0.8885
42	841	Bitcoin soars to all time high after BNY Mellon announces crypto venture	null	0.9990
42	841	Bitcoin at Center Stage and Record High as Mastercard BNY Go Crypto CoinDesk	null	0.9682
42	781	Bitcoin Options Market Sees Low Odds of Sky High Rally in 2021	null	0.9682
42	961	Bitcoin price hits new all time high as Mastercard and America s oldest bank welcome cryptocurrency	null	0.9750
42	841	Bitcoin surges to all time high after BNY Mellon embraces cryptocurrencies	null	0.9682
42	181	Bitcoin s pullback slashes 23 from crypto evangelist Michael Saylor s MicroStrategy	null	-0.9955
42	841	Bitcoin surges to all time high after BNY Mellon embraces cryptocurrencies	null	0.9682
42	841	Bitcoin surges to all time high after BNY Mellon embraces cryptocurrencies	null	0.9682
42	301	Bitcoin Pop Pot Stock Drop Bumble Debut 3 Things to Watch	null	-0.9970
42	841	Bitcoin soars to all time high after BNY Mellon announces crypto venture	null	0.9990
42	841	Bitcoin Hits New All Time High as BNY Mellon Announces Crypto Custody	null	0.9682
42	1081	Bitcoin soars on crypto love from Mastercard and BNY Mellon	null	0.9986
42	841	Bitcoin surges to all time high after BNY Mellon embraces cryptocurrencies	null	0.9682
42	301	Bitcoin Pop Pot Stock Drop Bumble Debut 3 Things to Watch By Investing com	null	-0.9970
42	1081	Bitcoin donations surge to jailed Kremlin critic Navalny s cause data	null	-0.6486
42	1141	Bitcoin donations to jailed Kremlin critic Navalny s cause surge data	null	-0.6486
42	1	Bitcoin Litecoin Ripple Outlook Mastercard to Embrace Certain Cryptocurrencies	null	0.5267
42	301	Bitcoin Pop Pot Stock Drop Bumble Debut 3 Things to Watch By Investing com	null	-0.9970
42	301	Bitcoin donations surge to jailed Kremlin critic Navalny s cause data By Reuters	null	-0.6486
42	1141	Bitcoin Donations Surge to Jailed Kremlin Critic Navalny s Cause Data	null	-0.6486
42	1021	Wall Street player BNY Mellon jumps on bitcoin bandwagon	null	0.9970
42	1081	Bitcoin donations surge to jailed Kremlin critic Navalny s cause data	null	-0.6486
42	61	Avalanche AVAX Matic and Celo rally while Bitcoin price pulls back	null	0.9682
42	1021	Wall Street Player BNY Mellon Jumps On Bitcoin Bandwagon	null	0.9970
42	241	Why Ethereum Killers Cardano Polkadot Avalanche Are Surging Despite Bitcoin Slump	null	-0.6486
42	1081	Market digest Bitcoin rallies to new record high after big dip what s behind it	null	0.9682
42	841	First Mover Bitcoin at Center Stage and Record High as Mastercard BNY Go Crypto	null	0.9682
42	1201	UPDATE 1 Bitcoin soars to all time high after BNY Mellon announces crypto venture	null	0.9990
42	961	FOREX U S dollar dips for 4th day after weak data bitcoin hits record high	null	0.9590
42	1261	FOREX U S dollar falls vs some currencies bitcoin climbs to record peak	null	-0.9993
42	1021	Reddit User Who Predicted Elon Musk Bitcoin Buy Was High On Acid	null	0.9682
42	1021	Riot Blockchain jumps 24 as bitcoin momentum continues and the company notches new mining milestone	null	0.9967
42	901	RIOT Stock News Why Bitcoin Mining Company Riot Blockchain Is Climbing Today	null	-0.8374
42	1081	Ethereum is struggling again vs Bitcoin Why is ETH BTC showing weakness	null	-0.6808
42	901	Uber won t buy bitcoin with its cash but would consider accepting it as payment CEO says	null	0.7092
42	61	U S dollar dips for 4th day after weak data bitcoin hits record high	null	0.9590
41	61	Dollar wallows at two week low bitcoin steadies after surge past 48 000 Reuters	null	-0.9682
41	361	Musk s bitcoin bet fuels gains in companies already invested Reuters	null	0.9818
41	361	Musk s bitcoin bet fuels gains in companies already invested Reuters	null	0.9818
42	781	UPDATE 1 BNY Mellon joins cryptocurrency party with new Digital Assets division Reuters	null	0.5267
42	841	Bitcoin surges to all time high after BNY Mellon embraces cryptocurrencies Reuters	null	0.9682
42	841	BNY Mellon joins cryptocurrency party with new Digital Assets division Reuters	null	0.5267
42	1141	Bitcoin donations surge to jailed Kremlin critic Navalny s cause data Reuters	null	-0.6486
42	1141	UPDATE 1 Bitcoin soars to all time high after BNY Mellon announces crypto venture Reuters	null	0.9990
43	1	First North American Bitcoin ETF Approved by Canadian Securities Regulator	null	0.6124
42	961	Bitcoin price hits new all time high as Mastercard and America s oldest bank welcome cryptocurrency	null	0.9750
42	1261	Bitcoin surges to record high as Mastercard and Uber show cryptocurrency interest	null	0.9757
42	721	Bitcoin jumps by 2 000 after Elon Musk posts an image of a crypto themed ring and makes a vague	null	0.9970
42	961	Bitcoin s big moment Mastercard jumps on the bandwagon	null	0.9970
42	1321	Bitcoin surges 7 to a record high amid new adoption from Mastercard and BNY Mellon	null	0.9682
42	1261	Bitcoin Just Set a New All Time High Here Are What Analysts Are Saying	null	0.9682
42	961	Bitcoin s big moment Mastercard jumps on the bandwagon NewsChannel 3 12	null	0.9970
42	781	Bitcoin Options Market Sees Low Odds of Sky High Rally in 2021 CoinDesk	null	0.9682
42	841	Bitcoin blows past 48 000 to hit another record high as major financial firms warm to crypto	null	0.9716
42	661	Bitcoin price rally to record highs might resemble a bubble but on chain metrics disapprove	null	0.8885
42	1141	Bitcoin donations surge to jailed Kremlin critic Navalny s cause data	null	-0.6486
42	841	Bitcoin at Center Stage and Record High as Mastercard BNY Go Crypto CoinDesk	null	0.9682
42	1261	Bitcoin surges to record high as Mastercard and Uber show cryptocurrency interest	null	0.9757
42	781	Bitcoin Options Market Sees Low Odds of Sky High Rally in 2021	null	0.9682
42	841	Bitcoin surges to all time high after BNY Mellon embraces cryptocurrencies	null	0.9682
42	841	Bitcoin surges to all time high after BNY Mellon embraces cryptocurrencies	null	0.9682
42	841	Bitcoin surges to all time high after BNY Mellon embraces cryptocurrencies	null	0.9682
42	841	Bitcoin soars to all time high after BNY Mellon announces crypto venture	null	0.9990
42	1141	Bitcoin donations to jailed Kremlin critic Navalny s cause surge data	null	-0.6486
42	841	Bitcoin soars to all time high after BNY Mellon announces crypto venture	null	0.9990
42	841	Bitcoin soars to all time high after BNY Mellon announces crypto venture	null	0.9990
42	1021	Bitcoin soars on crypto love from Mastercard and BNY Mellon	null	0.9986
42	841	Bitcoin Hits New All Time High as BNY Mellon Announces Crypto Custody	null	0.9682
42	841	Bitcoin surges to all time high after BNY Mellon embraces cryptocurrencies	null	0.9682
43	1	Bitcoin clings to Tesla gains dollar set for weekly loss	null	0.7906
42	1141	Bitcoin donations surge to jailed Kremlin critic Navalny s cause data	null	-0.6486
42	1141	Bitcoin donations surge to jailed Kremlin critic Navalny s cause data	null	-0.6486
42	1141	Bitcoin donations surge to jailed Kremlin critic Navalny s cause data	null	-0.6486
42	1081	Bitcoin donations surge to jailed Kremlin critic Navalny s cause data	null	-0.6486
42	1021	Wall Street player BNY Mellon jumps on bitcoin bandwagon	null	0.9970
42	1021	Wall Street Player BNY Mellon Jumps On Bitcoin Bandwagon	null	0.9970
42	1141	Bitcoin Donations Surge to Jailed Kremlin Critic Navalny s Cause Data	null	-0.6486
43	61	Forget 2021 Here s How High Bitcoin Price Can Go By 2026	null	0.9643
43	121	European shares dip Bitcoin hits record high	null	0.9726
42	841	First Mover Bitcoin at Center Stage and Record High as Mastercard BNY Go Crypto	null	0.9682
42	1261	UPDATE 1 Bitcoin donations surge to jailed Kremlin critic Navalny s cause data	null	-0.6486
43	301	FOREX Dollar headed for weekly loss bitcoin hits record 49 000	null	-0.9682
42	1201	UPDATE 1 Bitcoin soars to all time high after BNY Mellon announces crypto venture	null	0.9990
43	361	Markets Oil Drop In Asia But Bitcoin Edges Towards 50 000	null	-0.9970
43	1	European shares dip Bitcoin hits record high	null	0.9726
43	1	European shares dip Bitcoin hits record high	null	0.9726
43	1	European shares dip Bitcoin hits record high	null	0.9726
42	1261	Price Of Bitcoin Hits High As Two More Financial Giants Add Crypto Support	null	0.9741
43	121	Markets Oil Drop In Asia But Bitcoin Targets 50 000	null	-0.9970
43	541	Jack Dorsey and Jay Z to set up 500 BTC blind Bitcoin trust in India Africa	null	0.8225
43	1	European shares dip Bitcoin hits record high	null	0.9726
42	1261	Key financial crisis regulator Sheila Bair says stay away frombitcoin while it is at nosebleed	null	-0.6249
42	901	Uber won t buy bitcoin with its cash but would consider accepting it as payment CEO says	null	0.7092
42	1381	Dollar headed for weekly loss bitcoin renews record above 48 000	null	-0.9682
43	301	FOREX Dollar headed for weekly loss bitcoin hits record 49 000	null	-0.9682
43	1	Dollar headed for weekly loss bitcoin renews record above 48 000	null	-0.9682
43	301	GLOBAL MARKETS European shares dip Bitcoin hits record high	null	0.9726
43	241	Can the fast growth of Bitcoin BTC affect the rise of Ethereum ETH or XRP	null	0.9843
42	1381	Forget Bitcoin Inside the insane world of altcoin cryptocurrency trading	null	-0.5574
43	121	Markets oil drop in Asia but bitcoin edges towards 50 000	null	-0.9882
43	241	Miami passes resolution to allow paying city workers in Bitcoin in attempt to woo big tech	null	0.6124
42	1021	Reddit User Who Predicted Elon Musk Bitcoin Buy Was High On Acid	null	0.9682
42	1261	FOREX U S dollar falls vs some currencies bitcoin climbs to record peak	null	-0.9993
43	61	Black investors view Bitcoin other cryptocurrencies as way to fix economic injustice	null	-0.5719
43	1	Dollar Headed for Weekly Loss Bitcoin Renews Record Above 48 000	null	-0.9682
43	1	Dollar headed for weekly loss bitcoin renews record above 48 000	null	-0.9682
42	481	S P 500 to rise another 10 despite high valuations Pictet Asset Mgmt Reuters	null	0.9371
42	481	S P 500 to rise another 10 despite high valuations Pictet Asset Mgmt Reuters UK	null	0.9371
42	781	UPDATE 1 BNY Mellon joins cryptocurrency party with new Digital Assets division Reuters	null	0.5267
42	841	Bitcoin surges to all time high after BNY Mellon embraces cryptocurrencies Reuters	null	0.9682
42	841	BNY Mellon joins cryptocurrency party with new Digital Assets division Reuters	null	0.5267
42	1141	Bitcoin donations surge to jailed Kremlin critic Navalny s cause data Reuters	null	-0.6486
42	1141	UPDATE 1 Bitcoin soars to all time high after BNY Mellon announces crypto venture Reuters	null	0.9990
43	1	Dollar headed for weekly loss bitcoin renews record above 48 000 Reuters	null	-0.9682
43	1141	Bitcoin price enters consolidation but is a rally past 50K now inevitable	null	0.9855
43	1021	Bitcoin climbs 4 to a new high before paring gains as the cryptocurrency s record breaking surge	null	0.9939
43	841	Bitcoin aiming high MarketPulse	null	0.9682
43	1261	Can Bitcoin Surge Above 50 000 Amid Flurry Of Positive News Investing com	null	0.5574
43	1261	Traders say there aren t many reasons to be bearish on Bitcoin	null	-0.9970
43	781	Regulator gears up for Bitcoin crackdown amid digital coin frenzy	null	0.6908
43	841	How bad is bitcoin for the environment really	null	-0.5423
43	781	More Bullish Tailwinds for Bitcoin as US Committee Approves 593B in Benefits	null	0.9974
43	1261	Banks Might Treat Bitcoin Like Real Money These Experts Weigh the Pros and Cons	null	0.6369
43	1381	Canada approves first bitcoin ETF raising hopes that the US SEC will soon follow	null	0.6705
44	601	Jack Dorsey Jay Z to set up Bitcoin development fund as internet currency goes mainstream	null	0.7906
43	1021	XRP jumps 15 while bitcoin and ether trade near record highs as Tesla BNY Mellon and Mastercard	null	0.9970
43	841	Beyond Bitcoin Little known project jumps 116 on 2 75M EU new money grant	null	0.9972
43	1261	Canada approves first bitcoin ETF raising hopes that the US SEC will soon follow	null	0.6705
43	1201	Major companies and banks are now buying into bitcoin If you want exposure here s how	null	0.9360
43	1321	Stocks Still Buoyant As Bitcoin Retreats From All time High	null	0.9716
44	601	A senator has urged Elon Musk to move to Wyoming as it has the best laws for bitcoin and is the	null	0.6369
43	1141	Black Swan Author Calls Bitcoin a Failure at Least for Now	null	-0.5106
43	1021	Jay Z Jack Dorsey Link Up For New Bitcoin Venture	null	0.7906
43	1261	Banks Might Treat Bitcoin Like Real Money These Experts Weigh the Pros and Cons	null	0.6369
43	1021	Seems like a good price Video of 1m bitcoin pizza order from 2011 resurfaces as value hits	null	0.7783
43	841	A Bullish 1 Million Bitcoin Forecast as Year of Ox Begins CoinDesk	null	0.9970
43	841	First Mover Bullish 1 Million Bitcoin Forecast as Year of Ox Begins	null	0.9970
44	601	A senator has urged Elon Musk to move to Wyoming as it has the best laws for bitcoin and is the	null	0.6369
43	1	Dollar headed for weekly loss bitcoin renews record above 48 000 Reuters	null	-0.9682
43	721	Bitcoin clings to Tesla gains dollar set for weekly loss Reuters	null	0.7906
43	1021	Top Ten Weekend reads a marijuana friendly retirement location	null	0.6124
46	121	Bitcoin Retreats After Weekend Rally to Record of Nearly 50 000	null	0.9682
46	121	Bitcoin rally falters just short of 50 000 as investors take profit	null	0.9747
45	1081	Bitcoin approaches 50 000 wider adoption fuels record rally	null	0.9682
46	121	Bitcoin rally falters just short of 50 000 as investors take profit	null	0.9747
45	1261	Bitcoin soars nearing 50 000 for the first time KION546	null	0.9985
45	781	Bitcoin Sets New All Time High of 49 7K Putting 50K Within Striking Distance CoinDesk	null	0.9682
45	901	Bitcoin soars nearing 50 000 for the first time	null	0.9985
45	1141	Bitcoin s Epic Run Is Winning More Attention From Wall Street	null	0.5267
45	781	Bitcoin Sets New All Time High of 49 7K Putting 50K Within Striking Distance	null	0.9682
45	781	Bitcoin nears 50 000 wider adoption fuels record rally	null	0.9682
45	841	Bitcoin nears 50 000 wider adoption fuels record rally	null	0.9682
45	841	Bitcoin nears 50 000 wider adoption fuels record rally	null	0.9682
45	841	Bitcoin approaches 50 000 wider adoption fuels record rally	null	0.9682
45	781	Bitcoin nears 50 000 wider adoption fuels record rally	null	0.9682
45	841	Bitcoin nears 50 000 wider adoption fuels record rally amNewYork	null	0.9682
45	841	Bitcoin approaches 50 000 wider adoption fuels record rally	null	0.9682
45	841	Bitcoin approaches 50 000 wider adoption fuels record rally	null	0.9682
45	841	Bitcoin approaches 50 000 wider adoption fuels record rally	null	0.9682
45	901	Bitcoin soars nearing 50 000 for the first time	null	0.9985
45	841	Bitcoin nears 50 000 wider adoption fuels record rally Reuters	null	0.9682
45	841	Bitcoin nears 50 000 wider adoption fuels record rally Reuters	null	0.9682
45	841	Bitcoin nears 50 000 wider adoption fuels record rally Reuters	null	0.9682
45	961	UPDATE 1 Bitcoin approaches 50 000 wider adoption fuels record rally Reuters	null	0.9682
46	1	Elon Musk says he supports top dogecoin holders selling most of their coins Reuters	null	-0.8934
46	301	Dollar held down by doubts over pace of U S recovery bitcoin retreats from record high Reuters	null	0.9628
47	1261	Evolve Becomes Second Canadian Issuer to Win Approval for Bitcoin ETF	null	0.7845
47	841	Osprey Fund s Bitcoin Trust Is Now Available to Retail Investors via OTC	null	0.5106
48	481	Bitcoin Hits New All Time High Above 51 000 Squeezing Altcoins	null	0.9682
47	901	Bitcoin jumps to within 2 of 50 000 as currency hits new high thanks to Wall Street interest	null	0.9984
47	841	Bitcoin tops 50 000 for the first time ever in dizzying rally	null	0.9758
48	421	Bitcoin Jumps to All Time High as Cryptocurrency Fever Continues	null	0.9982
47	1021	Bitcoin Hit All Time High at Over 50 000 Leaving Us in Dire Need of Sound Financial Advice	null	0.9584
47	781	Bitcoin soars past 50 000 for the first time	null	0.9985
48	481	Bitcoin Hits New High Above 51K Shrugging Off Rising Bond Yields	null	0.9682
48	481	Bitcoin hits a new high of 51 3K as analyst declares historic parabolic advance	null	0.9682
47	1381	Bitcoin Price Tops 50K for the First Time	null	0.5106
47	781	Bitcoin hits 50 000 milestone as world s No 1 cryptocurrency extends gain in 2021	null	0.9805
47	841	Bitcoin tops 50 000 for the first time	null	0.5106
47	781	Bitcoin soars past 50 000 for the first time	null	0.9985
47	781	Bitcoin soars past 50 000 for the first time	null	0.9985
48	481	JPMorgan Says Bitcoin Rally Unsustainable Unless Volatility Ebbs	null	0.9682
47	841	Bitcoin Jumps to 50 000 as Record Breaking Rally Accelerates	null	0.9982
47	781	Instant View Bitcoin Tops 50 000 for the First Time	null	0.5106
47	1081	Bitcoin s Growth Will Continue to Boost Square Stock	null	0.6486
47	1021	After Breaching 50K Bitcoin Gives Up Earlier Gains	null	0.9882
47	781	Here s what 5 experts said about bitcoin s momentous record setting rally above 50 000	null	0.9682
47	781	Instant View Bitcoin tops 50 000 for the first time	null	0.5106
48	481	JPMorgan Says Bitcoin Rally Unsustainable Unless Volatility Ebbs	null	0.9682
47	841	NYDIG Files for Bitcoin ETF Adding to Firms Hoping 2021 Is When SEC Finally Says Yes	null	0.6705
47	1081	Why I still need some convincing over the prospects for Bitcoin	null	0.5994
47	1201	FOREX Dollar gains as Treasury yields rise bitcoin breaches 50 000	null	0.9955
47	1021	Tesla Helps Push Bitcoin Price to New High	null	0.9738
47	1261	Fed s Bullard says bitcoin s meteoric rise will have little effect on the dollar global economy	null	0.9818
47	1261	Evolve wins second Canadian Bitcoin ETF as Ontario regulator approves application	null	0.7506
47	781	JP Morgan hints it could join party as Bitcoin continues to flirt with 50k	null	0.7531
47	1081	Nasdaq Gives Up Early Gains but Crypto Stocks Are Getting a 50 000 Bitcoin Boost The Motley Fool	null	0.9531
48	361	Banks seek advice on Bitcoin compliance as digital coin hits record high	null	0.9682
47	1141	Markets respond after Bitcoin pierces 50 000 to reach new all time high	null	0.9686
47	1141	5 Easy Methods to Maintain Your Bitcoin Investment Safely Cascade Business News	null	0.7269
47	841	MicroStrategy to borrow 600 million to fund bitcoin buying	null	0.9325
47	1201	FOREX Dollar gains as Treasury yields rise bitcoin breaches 50 000	null	0.9955
47	1201	Dow Rallies As Bulls Battle Bears Boeing Stock Makes Key Move Bitcoin Play Pares Gains	null	0.9814
47	841	Mining Machine Maker Canaan Rises 20 as Bitcoin Reaches a New All Time High	null	0.9690
47	901	Dow Jones Today Stocks Rise Amid Stimulus Pandemic Optimism Bitcoin Hits 50 000	null	0.9855
47	121	If Bitcoin Creator Satoshi Nakamoto Is Alive He s Sitting On One Of The Largest Personal Fortunes On The Planet Celebrity Net Worth	null	0.5423
47	241	Bitcoin Extends Its Rally to an All Time High Close to 50 000 Bloomberg	null	0.9920
47	781	Instant View Bitcoin tops 50 000 for the first time Reuters	null	0.5106
47	781	Bitcoin Tops 50K and Crypto s Nouveau Riche Move In CoinDesk CoinDesk	null	0.5106
47	841	INSTANT VIEW Bitcoin tops 50 000 for the first time Reuters	null	0.5106
47	901	Bitcoin Jumps To 50 000 as Record Breaking Rally Accelerates	null	0.9982
47	1021	Bitcoin Breaks 50 000 for the First Time as Record Shattering 2021 Rally Extends to 74 Amid Wall Street Adoption	null	0.9702
47	1021	Bitcoin Hit All Time High at Over 50 000 Leaving Us in Dire Need of Sound Financial Advice	null	0.9584
49	181	Dow Falls As Bitcoin Tops 52 000 Tesla Cuts Prices While Walmart Dives On Earnings	null	-0.9992
48	1141	Bitcoin soars to over 51 000 What s going on We answer your questions	null	0.9985
48	1381	Bitcoin Surges Past 52k Verizon Stock Up	null	0.7906
48	1201	Bitcoin Punches Above 51 700 Is This Rally Different	null	0.9682
49	781	Bitcoin is eating Gold GOLD BTC ratio falls to an all time low	null	-0.9994
48	1201	Bitcoin ATMs ripe for fraud without more oversight N J watchdog says	null	-0.5859
49	1	CleanSpark Bitcoin Surge Merits a Price Target Boost	null	0.6597
49	1	Bitcoin at 1 million Some analysts are bullish but others warn of risks ahead	null	0.9858
49	841	First Mover Who ISN T Dabbling as Bitcoin Passes 52K Ether Tops 1 900	null	0.5106
49	841	Opinion Why buying a Tesla with bitcoin would be environmentally unfriendly	null	0.9100
48	1021	Dow Falls As Bitcoin Jumps Toward 52 000 Apple Tesla Hit Key Support Level While Shopify Tumbles	null	-0.9992
49	721	Forget Bitcoin Buy These Dominant Tech Stocks Instead The Motley Fool	null	-0.5859
49	661	Kia Motors America Victim of Ransomware Attack Demanding 20M in Bitcoin Report Claims	null	-0.8834
49	301	FOREX Dollar buoyed by strong U S data Bitcoin near record 52 640 By Reuters	null	0.5106
49	541	FOREX Dollar buoyed by strong U S data Bitcoin near record 52 640	null	0.5106
48	721	Bitcoin jumps to a new high above 51 700 but JPMorgan says the cryptocurrency s rise could be unsustainable BTC	null	0.9981
48	1321	U S Charges Members of North Korean Hacker Group of Allegedly Stealing Over 1 Billion in Bitcoin	null	-0.7003
49	541	PRECIOUS Gold rebounds as rally in U S Treasury yields abate Reuters	null	0.9803
49	841	FOREX Dollar snaps two day winning streak bitcoin hovers near record highs Reuters	null	0.5267
49	901	CANADA STOCKS TSX falls on dour jobless data vaccine rollout delays Reuters	null	-0.9993
\.


--
-- Data for Name: article_fact1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article_fact1 (dateid, timeid, title, url, comp_sentiment) FROM stdin;
25	721	Big Investors Stacked Up Ether as Price Rose to Record High	null	0.9818
25	901	Bitcoin price rises as second biggest cryptocurrency ether hits all time high	null	0.9682
25	721	ETH breaks out vs Bitcoin What s next for Ethereum after 100 gain in January	null	0.9818
25	901	Grayscale donates 1M to Coin Center pledges up to 1M more in matched contributions	null	0.7906
25	781	Here s Why Ethereum Could Beat Bitcoin As Best Asset Of 2021	null	0.7717
25	1201	All risk no gain The vague definition of stablecoins is causing problems	null	0.9705
25	901	First Mover Bitcoin Flushes Weak Hands as Ethereum Hits New All Time High	null	0.9590
25	721	Big Investors Stacked up Ether as Price Rose to Record High CoinDesk	null	0.9818
25	1021	I ve been convinced to buy Bitcoin the odds are in my favour	null	0.6808
25	961	Crypto Markets Show More Signs of Excess Amid Bitcoin Rebound	null	0.9818
25	1321	Crypto Hedge Funds Underperformed Bitcoin During Rally Last Year	null	0.9682
25	1141	Marathon Patent Is Not a Wise Play Even for Crypto Bulls	null	0.8862
25	481	FOREX Dollar gains as stimulus nerves nudge investors to safety	null	0.9840
25	1321	45B DeFi market cap and soaring TVL suggest the best is yet to come	null	0.9986
25	121	Warning Signal the messaging app s new features are causing internal turmoil	null	-0.5994
25	841	Two Arrested for Orchestrating Escape of Wirecard Exec Accused of Fraud CoinDesk	null	-0.8126
25	361	FOREX Dollar gains as stimulus nerves nudge investors to safety By Reuters	null	0.9840
25	1261	Substack Newsletters Are Being Used to Spread Crypto Scams	null	-0.5859
25	601	Global Markets Start Week On Positive Note Ethereum Rally In Focus	null	0.9766
25	961	Crypto Markets Show More Signs of Excess Amid Bitcoin Rebound	null	0.9818
26	1321	Is GBTC Stock A Good Buy After Bitcoin Tumbles From Highs	null	-0.9968
26	1381	Bitcoin Warren Buffett won t touch it and here s why	null	0.5719
26	1201	Bitcoin Falls as Miners Sell Institutions Watch Yellen	null	-0.9993
26	1321	DeFi tokens bag double digit gains as bears pin Bitcoin price below 33K	null	0.9325
26	1261	How scammers siphoned 36B in fraudulent unemployment payments from US	null	-0.7269
26	1381	SkyBridge s Anthony Scaramucci Talks Up New Bitcoin Fund Crypto s Exponential Liftoff	null	0.7906
26	1381	SkyBridge s Scaramucci Talks Up New Bitcoin Fund Crypto s Exponential Liftoff	null	0.7906
26	421	Signal is drama free for now but it should prepare for the worst	null	-0.9944
26	1141	Maybe Having A Crypto Expert At SEC s Helm Isn t So Great For Crypto Company Being Sued By SEC	null	0.6590
26	1321	Is GBTC Stock A Good Buy After Bitcoin Tumbles From Highs	null	-0.9968
26	1381	Bitcoin Warren Buffett won t touch it and here s why	null	0.5719
26	1201	Bitcoin Falls as Miners Sell Institutions Watch Yellen	null	-0.9993
26	1321	DeFi tokens bag double digit gains as bears pin Bitcoin price below 33K	null	0.9325
26	1261	How scammers siphoned 36B in fraudulent unemployment payments from US	null	-0.7269
26	1381	SkyBridge s Anthony Scaramucci Talks Up New Bitcoin Fund Crypto s Exponential Liftoff	null	0.7906
26	1381	SkyBridge s Scaramucci Talks Up New Bitcoin Fund Crypto s Exponential Liftoff	null	0.7906
26	421	Signal is drama free for now but it should prepare for the worst	null	-0.9944
26	1141	Maybe Having A Crypto Expert At SEC s Helm Isn t So Great For Crypto Company Being Sued By SEC	null	0.6590
26	121	Bearish Divergence Hints At First Major Chainlink Corrective Phase	null	-0.9970
26	1321	Harvard Yale Brown Endowments Have Been Buying Bitcoin for at Least a Year Sources	null	0.9325
26	1141	The Soul Killing Wallet Emptying Struggle to Buy a Video Card During a Pandemic	null	-0.8074
26	1381	More Institutional Investors Are Buying Ether Seeing It as a Store of Value CoinDesk	null	0.9468
26	361	FOREX Dollar gains as stimulus nerves nudge investors to safety	null	0.9840
27	601	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	1141	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	961	Bitcoin Bounces Off 30 000 as Record Momentum Fades	null	0.9818
27	601	American Cancer Society Launches 1M Cryptocurrency Fund CoinDesk	null	-0.6597
27	601	3 Unstoppable Stocks That ll Crush Bitcoin in 2021 The Motley Fool	null	-0.6486
27	841	American Cancer Society To Use Cryptocurrency To Fight Cancer	null	-0.9081
27	481	US Man Sentenced to Prison for Embezzling 20M of ICO Investors Funds CoinDesk	null	-0.5267
27	901	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin	null	-0.5829
27	241	Litecoin Falls 10 In Rout By Investing com	null	-0.9993
27	241	Litecoin Falls 10 20 In Selloff By Investing com	null	-0.9997
27	241	Cardano Falls 10 17 In Selloff By Investing com	null	-0.9997
27	241	Litecoin Falls 10 20 In Rout	null	-0.9993
27	241	Cardano Falls 10 17 In Rout	null	-0.9993
27	481	US Man Sentenced to Prison for Embezzling 20M of ICO Investors Funds	null	-0.5267
27	1021	Polkadot Price Prediction DOT poised to rise higher as ecosystem continues to grow rapidly	null	0.9834
27	901	Stock trading platforms suffer tech problems amid market mayhem	null	-0.7351
27	241	Shorts Now Paying the Longs Funding Rates on BTC ETH Perps Going Negative Across the Board	null	-0.5719
27	541	Scams are driving South African authorities to regulate crypto trading	null	-0.5859
27	901	Big Name Ivy League Endowments Are Now Buying Bitcoin ETF Trends	null	0.9325
27	841	TronGo s Launch A New Era of Decentralized Reward Systems Begins	null	0.5719
27	841	Scaramucci Says the GameStop Saga Is Positive for Bitcoin	null	0.5574
27	661	Lawsuit Against Israeli Crypto Entrepreneur Moshe Hegog Fails in US Court CoinDesk	null	-0.5719
27	661	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com CA	null	-0.9978
27	601	3 Unstoppable Stocks at All Time Highs That You Can Still Buy The Motley Fool	null	-0.5719
27	241	Crypterium to crowdfund on Seedrs monthly profits rise 10X during Coronavirus pandemic By BTC Peers	null	0.9847
27	301	GameStop Is Rage Against the Financial Machine	null	-0.5574
27	241	Scaramucci Says the GameStop Phenomenon Is Positive for Bitcoin	null	0.5574
27	1021	National Crime Agency warns novice and veteran traders alike of rise in clone company scams ZDNet	null	0.9652
27	901	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin CoinDesk	null	-0.5829
27	661	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com	null	-0.9978
27	241	Bitcoin Nearing 50 Day Moving Average Whales Are Back to Buying	null	0.9325
27	1141	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	661	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	601	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	1141	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	961	Bitcoin Bounces Off 30 000 as Record Momentum Fades	null	0.9818
27	601	American Cancer Society Launches 1M Cryptocurrency Fund CoinDesk	null	-0.6597
27	601	3 Unstoppable Stocks That ll Crush Bitcoin in 2021 The Motley Fool	null	-0.6486
27	841	American Cancer Society To Use Cryptocurrency To Fight Cancer	null	-0.9081
27	481	US Man Sentenced to Prison for Embezzling 20M of ICO Investors Funds CoinDesk	null	-0.5267
27	901	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin	null	-0.5829
27	241	Litecoin Falls 10 In Rout By Investing com	null	-0.9993
27	241	Litecoin Falls 10 20 In Selloff By Investing com	null	-0.9997
27	241	Cardano Falls 10 17 In Selloff By Investing com	null	-0.9997
27	241	Litecoin Falls 10 20 In Rout	null	-0.9993
27	241	Cardano Falls 10 17 In Rout	null	-0.9993
27	481	US Man Sentenced to Prison for Embezzling 20M of ICO Investors Funds	null	-0.5267
27	1021	Polkadot Price Prediction DOT poised to rise higher as ecosystem continues to grow rapidly	null	0.9834
27	901	Stock trading platforms suffer tech problems amid market mayhem	null	-0.7351
27	241	Shorts Now Paying the Longs Funding Rates on BTC ETH Perps Going Negative Across the Board	null	-0.5719
27	541	Scams are driving South African authorities to regulate crypto trading	null	-0.5859
27	901	Big Name Ivy League Endowments Are Now Buying Bitcoin ETF Trends	null	0.9325
27	841	TronGo s Launch A New Era of Decentralized Reward Systems Begins	null	0.5719
27	841	Scaramucci Says the GameStop Saga Is Positive for Bitcoin	null	0.5574
27	661	Lawsuit Against Israeli Crypto Entrepreneur Moshe Hegog Fails in US Court CoinDesk	null	-0.5719
27	661	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com CA	null	-0.9978
27	601	3 Unstoppable Stocks at All Time Highs That You Can Still Buy The Motley Fool	null	-0.5719
27	241	Crypterium to crowdfund on Seedrs monthly profits rise 10X during Coronavirus pandemic By BTC Peers	null	0.9847
27	301	GameStop Is Rage Against the Financial Machine	null	-0.5574
27	241	Scaramucci Says the GameStop Phenomenon Is Positive for Bitcoin	null	0.5574
27	1021	National Crime Agency warns novice and veteran traders alike of rise in clone company scams ZDNet	null	0.9652
27	901	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin CoinDesk	null	-0.5829
27	661	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com	null	-0.9978
27	241	Bitcoin Nearing 50 Day Moving Average Whales Are Back to Buying	null	0.9325
27	1141	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	661	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	1021	Bitcoin Bounces Off 30 000 as Record Momentum Fades	null	0.9818
27	661	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	1141	Bitcoin s Best Days Lie Ahead	null	0.6369
27	661	3 Unstoppable Stocks That ll Crush Bitcoin in 2021 The Motley Fool	null	-0.6486
27	781	5 Hard to Believe Bitcoin Facts The Motley Fool	null	-0.5106
27	661	American Cancer Society Launches 1M Cryptocurrency Fund CoinDesk	null	-0.6597
27	901	American Cancer Society To Use Cryptocurrency To Fight Cancer	null	-0.9081
27	901	Bitcoin Bounces Off 30 000 as Record Momentum Fades	null	0.9818
27	1141	Reddit teams up with the Ethereum Foundation to bring the value and independence to millions of	null	0.8555
27	1381	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	961	Bitcoin crashes below 30 000 as slump continues	null	-0.9993
27	1081	Polkadot Price Prediction DOT poised to rise higher as ecosystem continues to grow rapidly	null	0.9834
27	901	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin	null	-0.5829
27	1381	Cybercops derail malware botnet FBI makes ransomware arrest Times Leader	null	-0.5574
27	901	Stock trading platforms suffer tech problems amid market mayhem	null	-0.7351
27	781	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	781	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	781	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	781	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	1381	3 reasons why Uniswap UNI token hit a new all time high above 15	null	0.9682
27	1201	International operation derails malware botnet FBI makes ransomware arrest	null	-0.5719
27	1261	Capitol riots Who has the FBI arrested so far	null	-0.7506
27	1201	Fed React Don t trigger a tantrum GameStop still rising Apple on deck Oil can t hold EIA gains	null	0.9781
27	1141	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	721	Bitcoin Briefly Dips Below 30K Dollar Bounces Ahead of Fed Reserve Rate Announcement	null	0.9818
27	1141	Bitcoin BTC Bulls Bid Support Refuse to Surrender	null	0.9382
27	1081	National Crime Agency warns novice and veteran traders alike of rise in clone company scams ZDNet	null	0.9652
27	1021	U S Opening Bell Earnings Virus Concerns Spur Tech Shares Gold Slumps Investing com UK	null	-0.9978
27	901	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin CoinDesk	null	-0.5829
29	1261	What is Dogecoin and Why Are People Buying It	null	0.9325
27	721	Lawsuit Against Israeli Crypto Entrepreneur Moshe Hegog Fails in US Court CoinDesk	null	-0.5719
27	721	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com CA	null	-0.9978
27	721	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com	null	-0.9978
27	781	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	1141	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	661	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	541	US Man Sentenced to Prison for Embezzling 20M of ICO Investors Funds	null	-0.5267
27	1141	These are the best ways to invest 20 000	null	0.6369
27	1021	Bitcoin Bounces Off 30 000 as Record Momentum Fades	null	0.9818
27	661	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	1141	Bitcoin s Best Days Lie Ahead	null	0.6369
27	661	3 Unstoppable Stocks That ll Crush Bitcoin in 2021 The Motley Fool	null	-0.6486
27	781	5 Hard to Believe Bitcoin Facts The Motley Fool	null	-0.5106
27	661	American Cancer Society Launches 1M Cryptocurrency Fund CoinDesk	null	-0.6597
27	901	American Cancer Society To Use Cryptocurrency To Fight Cancer	null	-0.9081
27	901	Bitcoin Bounces Off 30 000 as Record Momentum Fades	null	0.9818
27	1141	Reddit teams up with the Ethereum Foundation to bring the value and independence to millions of	null	0.8555
27	1381	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	961	Bitcoin crashes below 30 000 as slump continues	null	-0.9993
27	1081	Polkadot Price Prediction DOT poised to rise higher as ecosystem continues to grow rapidly	null	0.9834
27	901	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin	null	-0.5829
27	1381	Cybercops derail malware botnet FBI makes ransomware arrest Times Leader	null	-0.5574
27	901	Stock trading platforms suffer tech problems amid market mayhem	null	-0.7351
27	781	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	781	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	781	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	781	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	1381	3 reasons why Uniswap UNI token hit a new all time high above 15	null	0.9682
27	1201	International operation derails malware botnet FBI makes ransomware arrest	null	-0.5719
27	1261	Capitol riots Who has the FBI arrested so far	null	-0.7506
27	1201	Fed React Don t trigger a tantrum GameStop still rising Apple on deck Oil can t hold EIA gains	null	0.9781
27	1141	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	721	Bitcoin Briefly Dips Below 30K Dollar Bounces Ahead of Fed Reserve Rate Announcement	null	0.9818
27	1141	Bitcoin BTC Bulls Bid Support Refuse to Surrender	null	0.9382
27	1081	National Crime Agency warns novice and veteran traders alike of rise in clone company scams ZDNet	null	0.9652
27	1021	U S Opening Bell Earnings Virus Concerns Spur Tech Shares Gold Slumps Investing com UK	null	-0.9978
27	901	Silver Lake Co Founder Tells Davos Cash Is Used Far More in Crime Than Bitcoin CoinDesk	null	-0.5829
27	721	Lawsuit Against Israeli Crypto Entrepreneur Moshe Hegog Fails in US Court CoinDesk	null	-0.5719
27	721	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com CA	null	-0.9978
27	721	Opening Bell Earnings Virus Concerns Spur U S Tech Shares Gold Slumps Investing com	null	-0.9978
27	781	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
27	1141	Could meme stocks like GameStop kill bitcoin s rise	null	0.9771
27	661	American Cancer Society Launches 1M Cryptocurrency Fund	null	-0.6597
27	541	US Man Sentenced to Prison for Embezzling 20M of ICO Investors Funds	null	-0.5267
27	1141	These are the best ways to invest 20 000	null	0.6369
28	421	Reddit Ties Up With Ethereum Foundation To Hasten Bringing Community Points On Blockchain	null	0.7906
28	421	Reddit Ties Up With Ethereum Foundation To Hasten Bringing Community Points On Blockchain	null	0.7906
28	361	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
28	241	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
28	241	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
28	241	Ethereum Price Forecast ETH on chain metrics remain strongly bullish upswing to 1 500 eyed	null	0.9971
28	481	The US Department of Justice unveils worldwide action against NetWalker ransomware seizes 450	null	0.5267
28	301	Dogecoin Shoots Up 62 As SatoshiStreetBets Looks To Emulate WallStreetBets Success With GameStop	null	0.8934
28	421	Reddit Ties Up With Ethereum Foundation To Hasten Bringing Community Points On Blockchain	null	0.7906
28	421	Reddit Ties Up With Ethereum Foundation To Hasten Bringing Community Points On Blockchain	null	0.7906
28	361	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
28	241	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
28	241	Cybercops derail malware botnet FBI makes ransomware arrest	null	-0.5574
28	241	Ethereum Price Forecast ETH on chain metrics remain strongly bullish upswing to 1 500 eyed	null	0.9971
28	481	The US Department of Justice unveils worldwide action against NetWalker ransomware seizes 450	null	0.5267
28	301	Dogecoin Shoots Up 62 As SatoshiStreetBets Looks To Emulate WallStreetBets Success With GameStop	null	0.8934
28	601	WallStreetBets Fever Hits Dogecoin Price Soars 142	null	0.9985
28	1321	Bitcoin soars 11 after Elon Musk namecheck on Twitter	null	0.9985
29	181	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
28	961	Hot DOGE Meme Based Cryptocurrency Soars More Than 800 to Record High	null	0.9990
28	961	Bitcoin Jumps Above 35 000 as Musk Tweets About Crypto	null	0.9970
29	61	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
28	961	Silvergate Capital s Common Stock Issuance Is Another Sign of Confidence for the Company	null	0.5106
38	481	Green hackers around the world let s destroy Bitcoin	null	-0.5423
29	181	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
28	781	Cryptocurrency Crime Drops in 2020 but DeFi Breaches Rise Study Finds	null	0.9910
28	1381	Dogecoin DOGE shoots 270 higher as WallStreetBets starts to pick up on crypto CryptoSlate	null	0.7906
29	241	XRP Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
29	241	XRP Climbs 10 45 In Bullish Trade	null	0.9970
28	1321	Altcoins soar after 10 Bitcoin price breakout flips 33K back to support	null	0.9493
28	1081	Bitcoin What is the Death Cross That Heralds the Sharp Fall of This Cryptocurrency	null	-0.5994
29	1	Litecoin Climbs 10 11 In Rally	null	0.9682
29	1	Bitcoin Climbs 10 18 In Rally	null	0.9682
29	1	Litecoin Climbs 10 In Bullish Trade By Investing com	null	0.9970
28	1381	Bitcoin Climbs 10 In Bullish Trade By Investing com	null	0.9970
28	841	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds	null	0.9910
28	781	Grayscale prepares for DeFi future with new cryptocurrency trust filings	null	0.5106
28	841	Cryptocurrency crime drops in 2020 but DeFi breaches rise CyberNews	null	0.9910
29	121	Ray Dalio Clears His Stance On Bitcoin Calls Is Amazing Accomplishment	null	0.6249
28	1381	Bitcoin s Rebound Accelerates With Push Back Above 34 000	null	0.9818
29	121	Ray Dalio Clears His Stance On Bitcoin Calls Is Amazing Accomplishment	null	0.6249
28	901	Dogecoin hits new all time high amid Wall Street Bets mania	null	0.9682
28	901	Dalio Expects to Soon Offer Alt Cash Fund Says Bitcoin Won t Escape Our Scrutiny CoinDesk	null	0.6597
29	541	Australian Crypto Exchange to Delist BSV Over Bullying Threat to Bitcoin Developers	null	-0.8074
28	661	Digital Asset Manager Grayscale Eyes DeFi Space With New Trust Filings	null	0.7003
28	601	WallStreetBets Fever Hits Dogecoin Price Soars 142 After Twitter Mention CoinDesk	null	0.9985
28	1381	Bitcoin Climbs 10 18 In Rally By Investing com	null	0.9682
28	601	Analyst Chinese New Year could drive Bitcoin selling pressure	null	-0.9451
28	781	DOJ charges suspect in NetWalker ransomware attacks	null	-0.7351
28	841	Europol Spanish Police Bust Alleged Scam Posing as Crypto Investment Training Firm	null	-0.5719
29	421	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
28	1081	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1081	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1081	Here are the best investing app alternatives to Robinhood	null	0.6369
28	961	Value of holding bitcoin surpassing trading value	null	0.5859
28	961	Bitcoin Rebounds From Early Losses Markets Still Distracted by GameStop CoinDesk	null	-0.6249
28	901	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	901	Robinhood Slammed After Halting Users From Buying Surging Stocks	null	0.9325
28	901	Robinhood Slammed After Halting Users From Buying Surging Stocks	null	0.9325
28	901	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
28	841	Robinhood suspends buying for GameStop following stonks going to the moon	null	0.9325
28	721	It s never been more important to safeguard your data These ads might make you actually care	null	0.6434
28	661	OTC Markets Group Announces the 2021 OTCQX Best 50	null	0.6369
28	1321	DOGE tweet volume up 1800 becomes first altcoin to surpass Bitcoin ever The Tie	null	0.7906
28	1201	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
28	781	ALPHA surges 152 in one week What s behind its meteoric rally	null	0.9682
29	181	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	421	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
28	961	Grimes Wrote A Poem About GameStop s Stock Market Chaos	null	-0.6908
28	901	Robinhood Slammed After Halting Users From Buying Surging Stocks	null	0.9325
28	901	American Airlines shares surge 80 thanks to Reddit after forum s revolution	null	0.6249
28	1261	Short Squeeze Volatility With GME AMC O Neil Portfolio Manager On Navigating Risk In Crazy	null	-0.5423
28	1141	New Grayscale trust filings spin rumour mill into overdrive for Cardano Polkadot Cosmos and more	null	0.5106
28	1081	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	841	Square Stock Is a Great Pick in a Toxic Environment	null	0.6249
28	661	OTC Markets Group Announces the 2021 OTCQX Best 50	null	0.6369
28	1021	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
29	541	MicroStrategy Bond Buyers Rewarded With Win Tie Bitcoin Play	null	0.8555
28	901	Prime Trust tZERO Partner on Digital Asset Custody Trading	null	0.7003
29	541	How Do We Regain Trust in Institutions	null	0.5106
28	661	Wall Street s fear gauge just logged its biggest rise in two years as the battle between Reddit	null	0.9726
29	121	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
28	841	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1081	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
28	1081	Here are the best investing app alternatives to Robinhood	null	0.6369
28	661	3 Popular Robinhood Stocks That Could Be Better Than Bitcoin in 2021	null	0.6908
28	1141	How much does H R Block cost Here s how much you ll pay to prepare and file your tax return	null	-0.5106
28	1261	After Robinhood Restricts GameStop Bitcoin And Crypto Market Suddenly Soars Toward 1 Trillion Dogecoin Price Rockets 200	null	0.9984
28	1021	Huge demand for Nvidia RTX 3000 cards led scalpers to 15 2 million in profit	null	0.5719
28	601	WallStreetBets Fever Hits Dogecoin Price Soars 142	null	0.9985
28	1321	Bitcoin soars 11 after Elon Musk namecheck on Twitter	null	0.9985
29	181	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
28	961	Hot DOGE Meme Based Cryptocurrency Soars More Than 800 to Record High	null	0.9990
28	961	Bitcoin Jumps Above 35 000 as Musk Tweets About Crypto	null	0.9970
29	61	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
28	961	Silvergate Capital s Common Stock Issuance Is Another Sign of Confidence for the Company	null	0.5106
29	181	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
28	781	Cryptocurrency Crime Drops in 2020 but DeFi Breaches Rise Study Finds	null	0.9910
28	1381	Dogecoin DOGE shoots 270 higher as WallStreetBets starts to pick up on crypto CryptoSlate	null	0.7906
29	241	XRP Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
29	241	XRP Climbs 10 45 In Bullish Trade	null	0.9970
28	1321	Altcoins soar after 10 Bitcoin price breakout flips 33K back to support	null	0.9493
28	1081	Bitcoin What is the Death Cross That Heralds the Sharp Fall of This Cryptocurrency	null	-0.5994
29	1	Litecoin Climbs 10 11 In Rally	null	0.9682
29	1	Bitcoin Climbs 10 18 In Rally	null	0.9682
29	1	Litecoin Climbs 10 In Bullish Trade By Investing com	null	0.9970
28	1381	Bitcoin Climbs 10 In Bullish Trade By Investing com	null	0.9970
28	841	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds	null	0.9910
28	781	Grayscale prepares for DeFi future with new cryptocurrency trust filings	null	0.5106
28	841	Cryptocurrency crime drops in 2020 but DeFi breaches rise CyberNews	null	0.9910
29	121	Ray Dalio Clears His Stance On Bitcoin Calls Is Amazing Accomplishment	null	0.6249
28	1381	Bitcoin s Rebound Accelerates With Push Back Above 34 000	null	0.9818
29	121	Ray Dalio Clears His Stance On Bitcoin Calls Is Amazing Accomplishment	null	0.6249
28	901	Dogecoin hits new all time high amid Wall Street Bets mania	null	0.9682
28	901	Dalio Expects to Soon Offer Alt Cash Fund Says Bitcoin Won t Escape Our Scrutiny CoinDesk	null	0.6597
29	541	Australian Crypto Exchange to Delist BSV Over Bullying Threat to Bitcoin Developers	null	-0.8074
28	661	Digital Asset Manager Grayscale Eyes DeFi Space With New Trust Filings	null	0.7003
28	601	WallStreetBets Fever Hits Dogecoin Price Soars 142 After Twitter Mention CoinDesk	null	0.9985
28	1381	Bitcoin Climbs 10 18 In Rally By Investing com	null	0.9682
28	601	Analyst Chinese New Year could drive Bitcoin selling pressure	null	-0.9451
28	781	DOJ charges suspect in NetWalker ransomware attacks	null	-0.7351
28	841	Europol Spanish Police Bust Alleged Scam Posing as Crypto Investment Training Firm	null	-0.5719
29	421	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
28	1081	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1081	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1081	Here are the best investing app alternatives to Robinhood	null	0.6369
28	961	Value of holding bitcoin surpassing trading value	null	0.5859
28	961	Bitcoin Rebounds From Early Losses Markets Still Distracted by GameStop CoinDesk	null	-0.6249
28	901	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	901	Robinhood Slammed After Halting Users From Buying Surging Stocks	null	0.9325
28	901	Robinhood Slammed After Halting Users From Buying Surging Stocks	null	0.9325
28	901	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
28	841	Robinhood suspends buying for GameStop following stonks going to the moon	null	0.9325
28	721	It s never been more important to safeguard your data These ads might make you actually care	null	0.6434
28	661	OTC Markets Group Announces the 2021 OTCQX Best 50	null	0.6369
28	1321	DOGE tweet volume up 1800 becomes first altcoin to surpass Bitcoin ever The Tie	null	0.7906
28	1201	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
28	781	ALPHA surges 152 in one week What s behind its meteoric rally	null	0.9682
29	181	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	421	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
28	961	Grimes Wrote A Poem About GameStop s Stock Market Chaos	null	-0.6908
28	901	Robinhood Slammed After Halting Users From Buying Surging Stocks	null	0.9325
28	901	American Airlines shares surge 80 thanks to Reddit after forum s revolution	null	0.6249
28	1261	Short Squeeze Volatility With GME AMC O Neil Portfolio Manager On Navigating Risk In Crazy	null	-0.5423
28	1141	New Grayscale trust filings spin rumour mill into overdrive for Cardano Polkadot Cosmos and more	null	0.5106
28	1081	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	841	Square Stock Is a Great Pick in a Toxic Environment	null	0.6249
28	661	OTC Markets Group Announces the 2021 OTCQX Best 50	null	0.6369
28	1021	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
29	541	MicroStrategy Bond Buyers Rewarded With Win Tie Bitcoin Play	null	0.8555
28	901	Prime Trust tZERO Partner on Digital Asset Custody Trading	null	0.7003
29	541	How Do We Regain Trust in Institutions	null	0.5106
28	661	Wall Street s fear gauge just logged its biggest rise in two years as the battle between Reddit	null	0.9726
29	121	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
28	841	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1081	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
28	1081	Here are the best investing app alternatives to Robinhood	null	0.6369
28	661	3 Popular Robinhood Stocks That Could Be Better Than Bitcoin in 2021	null	0.6908
28	1141	How much does H R Block cost Here s how much you ll pay to prepare and file your tax return	null	-0.5106
28	1261	After Robinhood Restricts GameStop Bitcoin And Crypto Market Suddenly Soars Toward 1 Trillion Dogecoin Price Rockets 200	null	0.9984
28	1021	Huge demand for Nvidia RTX 3000 cards led scalpers to 15 2 million in profit	null	0.5719
29	961	Robinhood blocks cryptocurrency trading blames extraordinary market conditions	null	-0.5574
29	781	Dogecoin Price Up 975 After Elon Musk s Tweet WallStreetBets Pump	null	0.7906
29	361	Reddit frenzy pumps up Dogecoin a cryptocurrency started as a joke by over 800	null	0.7845
28	1321	Will the SEC s Lawsuit Lead to Ripple Failing to Reach Its Potential	null	-0.6249
29	601	Stablecoin holdings on crypto exchanges hit a new all time high	null	0.9682
29	721	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	1021	What s Next For Bitcoin In An Era Of Helicopter Money Negative	null	-0.5719
29	541	Price of worthless cryptocurrency skyrockets by 1 000 thanks to GameStop stock fiasco	null	-0.5106
29	241	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	841	Dogecoin Jumps 600 as Meme Crypto Rides GameStop Retail Wave	null	0.9970
29	781	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	541	Elon Musk sends Bitcoin soaring 20pc live updates	null	0.9985
28	1201	Bitcoin What is the Death Cross That Heralds the Sharp Fall of This Cryptocurrency	null	-0.5994
29	481	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1021	Cryptocurrency Crime Drops in 2020 but Decentralized Finance Losses Rise Study	null	0.9892
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	901	Robinhood restricts crypto trading as Dogecoin soars 300 percent	null	0.9984
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	841	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	721	Dogecoin Becomes Most Mentioned Crypto on Twitter Ever as Price Soars	null	0.9985
29	301	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
29	61	Bitcoin Jumps Above 38 000 as Musk Adds It to Twitter Profile	null	0.9970
29	661	Bitcoin Soars 14 After Elon Musk Namecheck on Twitter	null	0.9985
29	721	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	301	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
29	601	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	601	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	421	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	421	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	421	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	421	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	421	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	421	XRP Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
29	61	Dogecoin DOGE shoots 270 higher as WallStreetBets starts to pick up on crypto CryptoSlate	null	0.7906
29	421	Wall Street Just Made the Best Case for Bitcoin Ethereum DeFi Get Ready for Mass Adoption	null	0.7717
29	661	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	421	XRP Climbs 10 45 In Rally By Investing com	null	0.9682
29	781	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	421	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	1081	Kraken Coinbase Suffer Outages Amid Market Volatility	null	-0.5423
29	901	How A Little Bird Is Delivering Trust	null	0.5106
29	1081	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1021	Who s getting rich off GameStop s stock The market makers and middlemen including Robinhood	null	0.5574
29	1021	Dow Jones Today Stocks Drop To Test Support Caterpillar Climbs Bitcoin Rallies Short Squeeze	null	-0.9968
29	961	Ray Dalio Bitcoin is gold like but governments won t let it win	null	0.9186
29	901	Here s why Elon Musk s simple Twitter bio change rocketed Bitcoin up 18 CryptoSlate	null	0.7906
29	961	Zombies not welcome Original altcoins lose ground to DeFi newcomers	null	-0.7304
29	841	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	781	Billionaire Leon Cooperman says GameStop surge will end very badly for the public and decries	null	-0.5256
29	541	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
29	721	Join Us in Miami Love Masters of the Universe	null	0.7506
29	421	Google reportedly scraps thousands of negative Robinhood reviews By Cointelegraph	null	-0.5719
29	421	Robinhood Raises Over 1 Billion In Emergency Funds As Platform Struggles With Reddit Fuelled	null	-0.6249
29	421	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	421	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	421	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	421	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	1021	Opinion Who s getting rich off GameStop s stock The market makers and middlemen including	null	0.5574
29	961	U S Stocks Open Lower as GameStop Frenzy Builds	null	-0.5423
29	961	Dow slides 200 points on concerns of retail investors speculative trading	null	-0.9970
29	961	World s richest man Elon Musk boosts Bitcoin price by 20 Is 40K back in play	null	0.7964
29	781	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	661	Bitcoin soars by 5K in minutes BTC hits 38K after Elon Musk s Dogecoin treatment	null	0.9985
28	1201	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	1201	The 8 best investing app alternatives to Robinhood	null	0.6369
28	1201	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1201	The 8 best investing app alternatives to Robinhood	null	0.6369
29	1141	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
29	1141	The biggest investors in space are cheering on the GameStop trade	null	0.5106
29	421	GameStop back on the rise as Robinhood eases trading ban	null	0.9792
29	361	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	1	DOGE tweet volume up 1800 becomes first altcoin to surpass Bitcoin ever The Tie	null	0.7906
29	421	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
28	1381	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
29	1081	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	181	SEC issues warning as GameStop short selling war resumes	null	-0.9652
29	1141	Tim Cook says companies are misleading users and exploiting data as public feud with Facebook	null	-0.7906
29	61	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	61	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	61	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	61	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	781	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	901	Jon Stewart gets a warm welcome on Twitter after joining to defend Reddit traders	null	0.5994
29	601	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
29	481	FTSE 100 falls expected as GameStop Reddit fallout blows through global markets	null	-0.9993
28	1381	Short Squeeze Volatility With GME AMC O Neil Portfolio Manager On Navigating Risk In Crazy	null	-0.5423
28	1201	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1201	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1201	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
29	121	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	601	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
28	841	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1081	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
28	1081	Here are the best investing app alternatives to Robinhood	null	0.6369
28	661	3 Popular Robinhood Stocks That Could Be Better Than Bitcoin in 2021	null	0.6908
29	961	Robinhood blocks cryptocurrency trading blames extraordinary market conditions	null	-0.5574
29	781	Dogecoin Price Up 975 After Elon Musk s Tweet WallStreetBets Pump	null	0.7906
29	361	Reddit frenzy pumps up Dogecoin a cryptocurrency started as a joke by over 800	null	0.7845
28	1321	Will the SEC s Lawsuit Lead to Ripple Failing to Reach Its Potential	null	-0.6249
29	601	Stablecoin holdings on crypto exchanges hit a new all time high	null	0.9682
29	721	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	1021	What s Next For Bitcoin In An Era Of Helicopter Money Negative	null	-0.5719
29	541	Price of worthless cryptocurrency skyrockets by 1 000 thanks to GameStop stock fiasco	null	-0.5106
29	241	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	841	Dogecoin Jumps 600 as Meme Crypto Rides GameStop Retail Wave	null	0.9970
29	781	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	541	Elon Musk sends Bitcoin soaring 20pc live updates	null	0.9985
28	1201	Bitcoin What is the Death Cross That Heralds the Sharp Fall of This Cryptocurrency	null	-0.5994
29	481	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1021	Cryptocurrency Crime Drops in 2020 but Decentralized Finance Losses Rise Study	null	0.9892
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	901	Robinhood restricts crypto trading as Dogecoin soars 300 percent	null	0.9984
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	841	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	721	Dogecoin Becomes Most Mentioned Crypto on Twitter Ever as Price Soars	null	0.9985
29	301	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
29	61	Bitcoin Jumps Above 38 000 as Musk Adds It to Twitter Profile	null	0.9970
29	661	Bitcoin Soars 14 After Elon Musk Namecheck on Twitter	null	0.9985
29	721	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	301	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
29	601	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	601	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	421	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	421	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	421	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	421	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	421	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	421	XRP Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
29	61	Dogecoin DOGE shoots 270 higher as WallStreetBets starts to pick up on crypto CryptoSlate	null	0.7906
29	421	Wall Street Just Made the Best Case for Bitcoin Ethereum DeFi Get Ready for Mass Adoption	null	0.7717
29	661	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	421	XRP Climbs 10 45 In Rally By Investing com	null	0.9682
29	781	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	421	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	1081	Kraken Coinbase Suffer Outages Amid Market Volatility	null	-0.5423
29	901	How A Little Bird Is Delivering Trust	null	0.5106
29	1081	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1021	Who s getting rich off GameStop s stock The market makers and middlemen including Robinhood	null	0.5574
29	1021	Dow Jones Today Stocks Drop To Test Support Caterpillar Climbs Bitcoin Rallies Short Squeeze	null	-0.9968
29	961	Ray Dalio Bitcoin is gold like but governments won t let it win	null	0.9186
29	901	Here s why Elon Musk s simple Twitter bio change rocketed Bitcoin up 18 CryptoSlate	null	0.7906
29	961	Zombies not welcome Original altcoins lose ground to DeFi newcomers	null	-0.7304
29	841	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	781	Billionaire Leon Cooperman says GameStop surge will end very badly for the public and decries	null	-0.5256
29	541	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
29	721	Join Us in Miami Love Masters of the Universe	null	0.7506
29	421	Google reportedly scraps thousands of negative Robinhood reviews By Cointelegraph	null	-0.5719
29	421	Robinhood Raises Over 1 Billion In Emergency Funds As Platform Struggles With Reddit Fuelled	null	-0.6249
29	421	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	421	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	421	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	421	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	1021	Opinion Who s getting rich off GameStop s stock The market makers and middlemen including	null	0.5574
29	961	U S Stocks Open Lower as GameStop Frenzy Builds	null	-0.5423
29	961	Dow slides 200 points on concerns of retail investors speculative trading	null	-0.9970
29	961	World s richest man Elon Musk boosts Bitcoin price by 20 Is 40K back in play	null	0.7964
29	781	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	661	Bitcoin soars by 5K in minutes BTC hits 38K after Elon Musk s Dogecoin treatment	null	0.9985
28	1201	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	1201	The 8 best investing app alternatives to Robinhood	null	0.6369
28	1201	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1201	The 8 best investing app alternatives to Robinhood	null	0.6369
29	1141	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
29	1141	The biggest investors in space are cheering on the GameStop trade	null	0.5106
29	421	GameStop back on the rise as Robinhood eases trading ban	null	0.9792
29	361	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	1	DOGE tweet volume up 1800 becomes first altcoin to surpass Bitcoin ever The Tie	null	0.7906
29	421	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
28	1381	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
29	1141	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	181	SEC issues warning as GameStop short selling war resumes	null	-0.9652
29	1141	Tim Cook says companies are misleading users and exploiting data as public feud with Facebook	null	-0.7906
29	61	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	61	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	61	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	61	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	781	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	901	Jon Stewart gets a warm welcome on Twitter after joining to defend Reddit traders	null	0.5994
29	601	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
29	481	FTSE 100 falls expected as GameStop Reddit fallout blows through global markets	null	-0.9993
28	1381	Short Squeeze Volatility With GME AMC O Neil Portfolio Manager On Navigating Risk In Crazy	null	-0.5423
28	1201	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1201	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1201	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
29	121	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	601	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
28	841	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1081	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
28	1081	Here are the best investing app alternatives to Robinhood	null	0.6369
28	661	3 Popular Robinhood Stocks That Could Be Better Than Bitcoin in 2021	null	0.6908
29	961	Robinhood blocks cryptocurrency trading blames extraordinary market conditions	null	-0.5574
29	781	Dogecoin Price Up 975 After Elon Musk s Tweet WallStreetBets Pump	null	0.7906
29	361	Reddit frenzy pumps up Dogecoin a cryptocurrency started as a joke by over 800	null	0.7845
28	1321	Will the SEC s Lawsuit Lead to Ripple Failing to Reach Its Potential	null	-0.6249
29	601	Stablecoin holdings on crypto exchanges hit a new all time high	null	0.9682
29	721	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	1021	What s Next For Bitcoin In An Era Of Helicopter Money Negative	null	-0.5719
29	541	Price of worthless cryptocurrency skyrockets by 1 000 thanks to GameStop stock fiasco	null	-0.5106
29	241	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	841	Dogecoin Jumps 600 as Meme Crypto Rides GameStop Retail Wave	null	0.9970
29	781	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	541	Elon Musk sends Bitcoin soaring 20pc live updates	null	0.9985
28	1201	Bitcoin What is the Death Cross That Heralds the Sharp Fall of This Cryptocurrency	null	-0.5994
29	481	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1021	Cryptocurrency Crime Drops in 2020 but Decentralized Finance Losses Rise Study	null	0.9892
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	901	Robinhood restricts crypto trading as Dogecoin soars 300 percent	null	0.9984
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	841	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	721	Dogecoin Becomes Most Mentioned Crypto on Twitter Ever as Price Soars	null	0.9985
29	301	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
29	61	Bitcoin Jumps Above 38 000 as Musk Adds It to Twitter Profile	null	0.9970
29	661	Bitcoin Soars 14 After Elon Musk Namecheck on Twitter	null	0.9985
29	721	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	301	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
29	601	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	601	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	421	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	421	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	421	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	421	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	421	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	421	XRP Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
29	61	Dogecoin DOGE shoots 270 higher as WallStreetBets starts to pick up on crypto CryptoSlate	null	0.7906
29	421	Wall Street Just Made the Best Case for Bitcoin Ethereum DeFi Get Ready for Mass Adoption	null	0.7717
29	661	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	421	XRP Climbs 10 45 In Rally By Investing com	null	0.9682
29	781	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	421	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	1081	Kraken Coinbase Suffer Outages Amid Market Volatility	null	-0.5423
29	901	How A Little Bird Is Delivering Trust	null	0.5106
29	1081	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1021	Who s getting rich off GameStop s stock The market makers and middlemen including Robinhood	null	0.5574
29	1021	Dow Jones Today Stocks Drop To Test Support Caterpillar Climbs Bitcoin Rallies Short Squeeze	null	-0.9968
29	961	Ray Dalio Bitcoin is gold like but governments won t let it win	null	0.9186
29	901	Here s why Elon Musk s simple Twitter bio change rocketed Bitcoin up 18 CryptoSlate	null	0.7906
29	961	Zombies not welcome Original altcoins lose ground to DeFi newcomers	null	-0.7304
29	841	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	781	Billionaire Leon Cooperman says GameStop surge will end very badly for the public and decries	null	-0.5256
29	541	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
29	721	Join Us in Miami Love Masters of the Universe	null	0.7506
29	421	Google reportedly scraps thousands of negative Robinhood reviews By Cointelegraph	null	-0.5719
29	421	Robinhood Raises Over 1 Billion In Emergency Funds As Platform Struggles With Reddit Fuelled	null	-0.6249
29	421	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	421	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	421	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	421	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	1021	Opinion Who s getting rich off GameStop s stock The market makers and middlemen including	null	0.5574
29	961	U S Stocks Open Lower as GameStop Frenzy Builds	null	-0.5423
29	961	Dow slides 200 points on concerns of retail investors speculative trading	null	-0.9970
29	961	World s richest man Elon Musk boosts Bitcoin price by 20 Is 40K back in play	null	0.7964
29	781	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	661	Bitcoin soars by 5K in minutes BTC hits 38K after Elon Musk s Dogecoin treatment	null	0.9985
28	1201	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	1201	The 8 best investing app alternatives to Robinhood	null	0.6369
28	1201	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1201	The 8 best investing app alternatives to Robinhood	null	0.6369
29	1141	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
29	1141	The biggest investors in space are cheering on the GameStop trade	null	0.5106
29	421	GameStop back on the rise as Robinhood eases trading ban	null	0.9792
29	361	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	1	DOGE tweet volume up 1800 becomes first altcoin to surpass Bitcoin ever The Tie	null	0.7906
29	421	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
28	1381	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
29	1141	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	181	SEC issues warning as GameStop short selling war resumes	null	-0.9652
29	1141	Tim Cook says companies are misleading users and exploiting data as public feud with Facebook	null	-0.7906
29	61	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	61	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	61	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	61	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	781	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	901	Jon Stewart gets a warm welcome on Twitter after joining to defend Reddit traders	null	0.5994
29	601	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
29	481	FTSE 100 falls expected as GameStop Reddit fallout blows through global markets	null	-0.9993
28	1381	Short Squeeze Volatility With GME AMC O Neil Portfolio Manager On Navigating Risk In Crazy	null	-0.5423
28	1201	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1201	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1201	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
29	121	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	601	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
28	841	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1081	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
28	1081	Here are the best investing app alternatives to Robinhood	null	0.6369
28	661	3 Popular Robinhood Stocks That Could Be Better Than Bitcoin in 2021	null	0.6908
29	1081	Robinhood blocks cryptocurrency trading blames extraordinary market conditions	null	-0.5574
29	901	Dogecoin Price Up 975 After Elon Musk s Tweet WallStreetBets Pump	null	0.7906
29	481	Reddit frenzy pumps up Dogecoin a cryptocurrency started as a joke by over 800	null	0.7845
29	1	Will the SEC s Lawsuit Lead to Ripple Failing to Reach Its Potential	null	-0.6249
29	721	Stablecoin holdings on crypto exchanges hit a new all time high	null	0.9682
29	841	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	1141	What s Next For Bitcoin In An Era Of Helicopter Money Negative	null	-0.5719
29	661	Price of worthless cryptocurrency skyrockets by 1 000 thanks to GameStop stock fiasco	null	-0.5106
29	361	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	961	Dogecoin Jumps 600 as Meme Crypto Rides GameStop Retail Wave	null	0.9970
29	901	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	661	Elon Musk sends Bitcoin soaring 20pc live updates	null	0.9985
28	1321	Bitcoin What is the Death Cross That Heralds the Sharp Fall of This Cryptocurrency	null	-0.5994
29	601	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1141	Cryptocurrency Crime Drops in 2020 but Decentralized Finance Losses Rise Study	null	0.9892
29	841	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1021	Robinhood restricts crypto trading as Dogecoin soars 300 percent	null	0.9984
29	841	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	961	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	841	Dogecoin Becomes Most Mentioned Crypto on Twitter Ever as Price Soars	null	0.9985
29	421	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
29	181	Bitcoin Jumps Above 38 000 as Musk Adds It to Twitter Profile	null	0.9970
29	781	Bitcoin Soars 14 After Elon Musk Namecheck on Twitter	null	0.9985
29	841	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	421	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
29	721	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	721	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	541	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	541	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	541	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	541	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	541	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	541	XRP Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
29	181	Dogecoin DOGE shoots 270 higher as WallStreetBets starts to pick up on crypto CryptoSlate	null	0.7906
29	541	Wall Street Just Made the Best Case for Bitcoin Ethereum DeFi Get Ready for Mass Adoption	null	0.7717
29	781	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	541	XRP Climbs 10 45 In Rally By Investing com	null	0.9682
29	901	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	541	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	1201	Kraken Coinbase Suffer Outages Amid Market Volatility	null	-0.5423
29	1021	How A Little Bird Is Delivering Trust	null	0.5106
29	1201	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1141	Who s getting rich off GameStop s stock The market makers and middlemen including Robinhood	null	0.5574
29	1141	Dow Jones Today Stocks Drop To Test Support Caterpillar Climbs Bitcoin Rallies Short Squeeze	null	-0.9968
29	1081	Ray Dalio Bitcoin is gold like but governments won t let it win	null	0.9186
29	1021	Here s why Elon Musk s simple Twitter bio change rocketed Bitcoin up 18 CryptoSlate	null	0.7906
29	1081	Zombies not welcome Original altcoins lose ground to DeFi newcomers	null	-0.7304
29	961	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	901	Billionaire Leon Cooperman says GameStop surge will end very badly for the public and decries	null	-0.5256
29	661	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
29	841	Join Us in Miami Love Masters of the Universe	null	0.7506
29	541	Google reportedly scraps thousands of negative Robinhood reviews By Cointelegraph	null	-0.5719
29	541	Robinhood Raises Over 1 Billion In Emergency Funds As Platform Struggles With Reddit Fuelled	null	-0.6249
29	541	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	541	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	541	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	541	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	1141	Opinion Who s getting rich off GameStop s stock The market makers and middlemen including	null	0.5574
29	1081	U S Stocks Open Lower as GameStop Frenzy Builds	null	-0.5423
29	1081	Dow slides 200 points on concerns of retail investors speculative trading	null	-0.9970
29	1081	World s richest man Elon Musk boosts Bitcoin price by 20 Is 40K back in play	null	0.7964
29	901	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	781	Bitcoin soars by 5K in minutes BTC hits 38K after Elon Musk s Dogecoin treatment	null	0.9985
28	1321	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	1321	The 8 best investing app alternatives to Robinhood	null	0.6369
28	1321	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1321	The 8 best investing app alternatives to Robinhood	null	0.6369
29	1261	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
29	1261	The biggest investors in space are cheering on the GameStop trade	null	0.5106
29	541	GameStop back on the rise as Robinhood eases trading ban	null	0.9792
29	481	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	121	DOGE tweet volume up 1800 becomes first altcoin to surpass Bitcoin ever The Tie	null	0.7906
29	541	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	61	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
29	1201	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	301	SEC issues warning as GameStop short selling war resumes	null	-0.9652
29	1261	Tim Cook says companies are misleading users and exploiting data as public feud with Facebook	null	-0.7906
29	181	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	181	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	181	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	181	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	901	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	1021	Jon Stewart gets a warm welcome on Twitter after joining to defend Reddit traders	null	0.5994
29	721	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
29	601	FTSE 100 falls expected as GameStop Reddit fallout blows through global markets	null	-0.9993
29	61	Short Squeeze Volatility With GME AMC O Neil Portfolio Manager On Navigating Risk In Crazy	null	-0.5423
28	1321	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1321	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1321	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
29	121	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	601	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
28	841	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1081	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
28	1081	Here are the best investing app alternatives to Robinhood	null	0.6369
28	661	3 Popular Robinhood Stocks That Could Be Better Than Bitcoin in 2021	null	0.6908
29	1081	Robinhood blocks cryptocurrency trading blames extraordinary market conditions	null	-0.5574
29	901	Dogecoin Price Up 975 After Elon Musk s Tweet WallStreetBets Pump	null	0.7906
29	481	Reddit frenzy pumps up Dogecoin a cryptocurrency started as a joke by over 800	null	0.7845
29	1	Will the SEC s Lawsuit Lead to Ripple Failing to Reach Its Potential	null	-0.6249
29	721	Stablecoin holdings on crypto exchanges hit a new all time high	null	0.9682
29	841	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	1141	What s Next For Bitcoin In An Era Of Helicopter Money Negative	null	-0.5719
29	661	Price of worthless cryptocurrency skyrockets by 1 000 thanks to GameStop stock fiasco	null	-0.5106
29	361	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	961	Dogecoin Jumps 600 as Meme Crypto Rides GameStop Retail Wave	null	0.9970
29	901	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	661	Elon Musk sends Bitcoin soaring 20pc live updates	null	0.9985
28	1321	Bitcoin What is the Death Cross That Heralds the Sharp Fall of This Cryptocurrency	null	-0.5994
29	601	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1141	Cryptocurrency Crime Drops in 2020 but Decentralized Finance Losses Rise Study	null	0.9892
29	841	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1021	Robinhood restricts crypto trading as Dogecoin soars 300 percent	null	0.9984
29	841	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	961	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	841	Dogecoin Becomes Most Mentioned Crypto on Twitter Ever as Price Soars	null	0.9985
29	421	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
29	181	Bitcoin Jumps Above 38 000 as Musk Adds It to Twitter Profile	null	0.9970
29	781	Bitcoin Soars 14 After Elon Musk Namecheck on Twitter	null	0.9985
29	841	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	421	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
29	721	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	721	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	541	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	541	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	541	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	541	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	541	XRP Climbs 10 45 In Bullish Trade	null	0.9970
29	541	XRP Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
29	181	Dogecoin DOGE shoots 270 higher as WallStreetBets starts to pick up on crypto CryptoSlate	null	0.7906
29	541	Wall Street Just Made the Best Case for Bitcoin Ethereum DeFi Get Ready for Mass Adoption	null	0.7717
29	781	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	541	XRP Climbs 10 45 In Rally By Investing com	null	0.9682
29	901	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	541	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	1201	Kraken Coinbase Suffer Outages Amid Market Volatility	null	-0.5423
29	1021	How A Little Bird Is Delivering Trust	null	0.5106
29	1201	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1141	Who s getting rich off GameStop s stock The market makers and middlemen including Robinhood	null	0.5574
29	1141	Dow Jones Today Stocks Drop To Test Support Caterpillar Climbs Bitcoin Rallies Short Squeeze	null	-0.9968
29	1081	Ray Dalio Bitcoin is gold like but governments won t let it win	null	0.9186
29	1021	Here s why Elon Musk s simple Twitter bio change rocketed Bitcoin up 18 CryptoSlate	null	0.7906
29	1081	Zombies not welcome Original altcoins lose ground to DeFi newcomers	null	-0.7304
29	961	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	901	Billionaire Leon Cooperman says GameStop surge will end very badly for the public and decries	null	-0.5256
29	661	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
29	841	Join Us in Miami Love Masters of the Universe	null	0.7506
29	541	Google reportedly scraps thousands of negative Robinhood reviews By Cointelegraph	null	-0.5719
29	541	Robinhood Raises Over 1 Billion In Emergency Funds As Platform Struggles With Reddit Fuelled	null	-0.6249
29	541	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	541	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	541	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	541	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	1141	Opinion Who s getting rich off GameStop s stock The market makers and middlemen including	null	0.5574
29	1081	U S Stocks Open Lower as GameStop Frenzy Builds	null	-0.5423
29	1081	Dow slides 200 points on concerns of retail investors speculative trading	null	-0.9970
29	1081	World s richest man Elon Musk boosts Bitcoin price by 20 Is 40K back in play	null	0.7964
29	901	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	781	Bitcoin soars by 5K in minutes BTC hits 38K after Elon Musk s Dogecoin treatment	null	0.9985
28	1321	Ray Dalio Calls Bitcoin One Hell of an Invention Considers It for New Funds	null	-0.6808
28	1321	The 8 best investing app alternatives to Robinhood	null	0.6369
28	1321	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1321	The 8 best investing app alternatives to Robinhood	null	0.6369
29	1261	Crypto Whale One River Says Volatility to Ease as Prices Rise	null	0.9842
29	1261	The biggest investors in space are cheering on the GameStop trade	null	0.5106
29	541	GameStop back on the rise as Robinhood eases trading ban	null	0.9792
29	481	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	121	DOGE tweet volume up 1800 becomes first altcoin to surpass Bitcoin ever The Tie	null	0.7906
29	541	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	61	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
29	1201	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	301	SEC issues warning as GameStop short selling war resumes	null	-0.9652
29	1261	Tim Cook says companies are misleading users and exploiting data as public feud with Facebook	null	-0.7906
29	181	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	181	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	181	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	181	Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	901	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	1021	Jon Stewart gets a warm welcome on Twitter after joining to defend Reddit traders	null	0.5994
29	721	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
29	601	FTSE 100 falls expected as GameStop Reddit fallout blows through global markets	null	-0.9993
29	61	Short Squeeze Volatility With GME AMC O Neil Portfolio Manager On Navigating Risk In Crazy	null	-0.5423
28	1321	Here are the best investing app alternatives to Robinhood	null	0.6369
28	1321	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
28	1321	How the far right harnessed tech in the lead up to the Capitol riot	null	0.5267
29	121	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	601	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
28	841	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1081	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
28	1081	Here are the best investing app alternatives to Robinhood	null	0.6369
28	661	3 Popular Robinhood Stocks That Could Be Better Than Bitcoin in 2021	null	0.6908
29	1081	India Would Ban Private Cryptocurrencies Under Proposed Legislation CoinDesk	null	-0.5574
29	1141	Two Bars for Bitcoins Owner in New York s Hell s Kitchen Selling Out for Cryptocurrency	null	-0.9618
29	1081	Robinhood Halts Instant Buying Power For Crypto	null	0.9325
29	241	Reddit frenzy pumps up Dogecoin a cryptocurrency started as a joke by over 800	null	0.7845
29	841	Robinhood blocks cryptocurrency trading blames extraordinary market conditions	null	-0.5574
29	1201	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street	null	0.9970
29	661	Dogecoin Price Up 975 After Elon Musk s Tweet WallStreetBets Pump	null	0.7906
29	961	Bitcoin s spike drives rebound in hard hit crypto mining stocks	null	0.9810
29	541	Stablecoin holdings on crypto exchanges hit a new all time high	null	0.9682
29	121	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	421	Price of worthless cryptocurrency skyrockets by 1 000 thanks to GameStop stock fiasco	null	-0.5106
29	901	What s Next For Bitcoin In An Era Of Helicopter Money Negative	null	-0.5719
29	301	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency By Reuters	null	-0.9618
29	661	Dogecoin Becomes Most Mentioned Crypto on Twitter Ever as Price Soars CoinDesk	null	0.9985
29	421	Elon Musk sends Bitcoin soaring 20pc	null	0.9985
29	901	Cryptocurrency Crime Drops in 2020 but Decentralized Finance Losses Rise Study	null	0.9892
29	601	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	601	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	781	Robinhood restricts crypto trading as Dogecoin soars 300 percent	null	0.9984
29	661	Dogecoin Becomes Most Mentioned Crypto on Twitter Ever as Price Soars	null	0.9985
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	961	Kraken Coinbase Suffer Outages Amid Market Volatility CoinDesk	null	-0.5423
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	781	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	601	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon NewsChannel	null	0.9985
29	181	Bitcoin Shoots Up 11 Did Elon Musk DogeCoin Boost Help	null	0.9081
29	661	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1081	India Would Ban Private Cryptocurrencies Under Proposed Legislation	null	-0.5574
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon KION546	null	0.9985
29	601	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	1021	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	481	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	481	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1021	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	301	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	541	Bitcoin Soars 14 After Elon Musk Namecheck on Twitter	null	0.9985
29	601	Bitcoin soars 14 after Elon Musk namecheck on Twitter	null	0.9985
29	1201	Everything we know about the GameStop stock insanity	null	-0.5719
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	661	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	301	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	301	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	301	Bitcoin soars 14 after Elon Musk namecheck on Twitter By Reuters	null	0.9985
29	181	Bitcoin Shoots Up 11 Did Elon Musk Dogecoin Boost Help	null	0.9081
29	301	XRP Climbs 10 45 In Rally By Investing com	null	0.9682
29	61	Litecoin Climbs 10 11 In Rally	null	0.9682
29	181	Ray Dalio Clears His Stance On Bitcoin Calls It Amazing Accomplishment	null	0.6249
29	61	Bitcoin Climbs 10 18 In Rally	null	0.9682
29	1	Litecoin Climbs 10 11 In Rally By Investing com	null	0.9682
29	1	Bitcoin Climbs 10 In Bullish Trade By Investing com	null	0.9970
29	1	Litecoin Climbs 10 In Bullish Trade By Investing com	null	0.9970
29	1	Bitcoin Climbs 10 18 In Rally By Investing com	null	0.9682
29	181	Ray Dalio Clears His Stance On Bitcoin Calls Is Amazing Accomplishment	null	0.6249
29	841	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1201	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring	null	0.9985
29	1201	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring The Motley Fool	null	0.9984
29	1321	Analysis GameStop s Reddit Rally Puts Scrutiny on Social Media Forums	null	0.9682
29	1201	Bitcoin Soars After Tesla CEO Elon Musk Says This 1 Word on Twitter	null	0.9985
29	781	How A Little Bird Is Delivering Trust	null	0.5106
29	1201	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1141	Short selling What it is why it s risky and how the squeeze happens	null	-0.9413
29	1081	Downtown Weatherford building damaged after man crashes into it officials say	null	-0.9993
29	1021	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	1321	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1321	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	961	5 best stock trading apps for iPhone 9to5Mac	null	0.6369
29	901	U S Stocks Open Lower as GameStop Frenzy Builds	null	-0.5423
29	901	Dow slides 200 points on concerns of retail investors speculative trading	null	-0.9970
29	901	World s richest man Elon Musk boosts Bitcoin price by 20 Is 40K back in play	null	0.7964
29	1321	Dogecoin soars another 600 as Reddit frenzy pushes the token into the top 10 cryptocurrencies by	null	0.9985
29	661	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	721	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	661	Billionaire Leon Cooperman says GameStop surge will end very badly for the public and decries	null	-0.5256
29	421	Dogecoin s 600 rally could jumpstart the next altseason	null	0.9682
29	601	Join Us in Miami Love Masters of the Universe	null	0.7506
29	541	Bitcoin soars by 5K in minutes BTC hits 38K after Elon Musk s Dogecoin treatment	null	0.9985
29	301	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment By Reuters	null	-0.9970
29	301	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	301	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
29	301	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	301	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	301	GameStop back on the rise as Robinhood eases trading ban	null	0.9792
29	481	FinTech Blockchain Market to Gain from Increasing Adoption in Financial Industry Worldwide says	null	0.9818
29	301	Google reportedly scraps thousands of negative Robinhood reviews By Cointelegraph	null	-0.5719
29	901	Who s getting rich off GameStop s stock The market makers and middlemen including Robinhood	null	0.5574
29	901	Dow Jones Today Stocks Drop To Test Support Caterpillar Climbs Bitcoin Rallies Short Squeeze	null	-0.9968
29	781	Here s why Elon Musk s simple Twitter bio change rocketed Bitcoin up 18 CryptoSlate	null	0.7906
29	301	Bitcoin to Win From Short Squeeze Financial Rebellion Experts Say	null	0.5106
29	301	Bitcoin to Win From Short Squeeze Financial Rebellion Experts By Investing com	null	0.5106
29	301	Robinhood Raises Over 1 Billion In Emergency Funds As Platform Struggles With Reddit Fuelled	null	-0.6249
29	301	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	301	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	301	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle By Reuters	null	-0.6705
29	241	DeFi bulls continue to roar as Gamestop GME saga continues CryptoSlate	null	0.9325
29	181	Alleged dog fighting ring busted 11 people arrested also face drug charges	null	-0.7717
29	1261	US stocks suffer worst week since October amid Reddit fueled trading craze	null	-0.9906
29	301	Bitcoin to Win From Short Squeeze Financial Rebellion Experts Say	null	0.5106
29	301	Bitcoin to Win From Short Squeeze Financial Rebellion Experts Say By Investing com	null	0.5106
29	301	Bitcoin to Win From Short Squeeze Financial Rebellion Experts Say By Investing com	null	0.5106
29	301	Bitcoin to Win From Short Squeeze Financial Rebellion Experts Say By Investing com	null	0.5106
29	301	Bitcoin to Win From Short Squeeze Financial Rebellion Experts Say By Investing com	null	0.5106
29	301	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	301	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment By Reuters	null	-0.9970
29	961	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	901	Zombies not welcome Original altcoins lose ground to DeFi newcomers	null	-0.7304
29	61	SEC issues warning as GameStop short selling war resumes	null	-0.9652
29	121	Global Markets Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	121	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	601	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1081	Bitcoin soars 14 on Musk namecheck on Twitter Reuters	null	0.9985
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
28	841	Cryptocurrency crime drops in 2020 but DeFi breaches rise study finds Reuters	null	0.9910
28	1081	Bitcoin What is the death cross that heralds the sharp fall of this cryptocurrency	null	-0.5994
29	1201	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street CNET	null	0.9970
29	1141	Two Bars for Bitcoins Owner in New York s Hell s Kitchen Selling Out for Cryptocurrency	null	-0.9618
29	1321	Bitcoin s spike drives rebound in hard hit crypto mining stocks	null	0.9810
29	1081	India Would Ban Private Cryptocurrencies Under Proposed Legislation CoinDesk	null	-0.5574
29	841	Robinhood blocks cryptocurrency trading blames extraordinary market conditions	null	-0.5574
30	61	GMI Model Estimates Bitcoin Fair Value At 300K By October 2021	null	0.5719
30	601	Dogecoin Price Up 975 After Elon Musk s Tweet WallStreetBets Pump	null	0.7906
29	1081	Robinhood Halts Instant Buying Power For Crypto	null	0.9325
29	1261	What is Dogecoin and Why Are People Buying It	null	0.9325
29	901	What s Next For Bitcoin In An Era Of Helicopter Money Negative	null	-0.5719
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon KION546	null	0.9985
29	901	Cryptocurrency Crime Drops in 2020 but Decentralized Finance Losses Rise Study	null	0.9892
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1141	CORRECTED Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1201	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
30	421	India Plans to Introduce Legislation to Ban Cryptocurrencies	null	-0.5574
29	1021	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1081	Bitcoin soars 14 on Musk namecheck on Twitter	null	0.9985
30	1	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
29	1081	Ray Dalio clarifies his position on Bitcoin saying he greatly admires it CryptoSlate	null	0.5709
29	1321	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1081	India Would Ban Private Cryptocurrencies Under Proposed Legislation	null	-0.5574
29	781	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
30	1	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
29	781	Robinhood restricts crypto trading as Dogecoin soars 300 percent	null	0.9984
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	721	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1021	Tron Ticker Confusion Would Be TRX Crypto Investors Mistakenly Buy Tanzanian Gold TRX Stock	null	-0.5267
29	1201	KDKA Investigates Financial Advisors Explain Dangers Of Treating Buying Stocks Like Sports Gambling	null	0.9231
29	1201	Everything we know about the GameStop stock insanity	null	-0.5719
29	841	Dogecoin soars 370 as Reddit group works to send the cryptocurrency to the moon	null	0.9985
29	1321	Analysis GameStop s Reddit Rally Puts Scrutiny on Social Media Forums	null	0.9682
29	1261	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
30	1	After a tumultuous week some fear Robinhood s actions set a horrible precedent	null	-0.7717
30	1	After a tumultuous week some fear Robinhood s actions set a horrible precedent	null	-0.7717
29	1201	Bitcoin Soars After Tesla CEO Elon Musk Says This 1 Word on Twitter	null	0.9985
29	1201	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring The Motley Fool	null	0.9984
29	1321	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1321	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1201	Bitcoin Soars After Tesla CEO Elon Musk Says This 1 Word on Twitter The Motley Fool	null	0.9984
29	1381	Dogecoin soars another 600 as Reddit frenzy pushes the token into the top 10 cryptocurrencies by	null	0.9985
29	1081	Downtown Weatherford building damaged after man crashes into it officials say	null	-0.9993
29	901	World s richest man Elon Musk boosts Bitcoin price by 20 Is 40K back in play	null	0.7964
29	901	Ray Dalio Bitcoin is gold like but governments won t let it win	null	0.9186
29	901	Zombies not welcome Original altcoins lose ground to DeFi newcomers	null	-0.7304
29	901	Opinion Who s getting rich off GameStop s stock The market makers and middlemen including	null	0.5574
29	901	U S Stocks Open Lower as GameStop Frenzy Builds	null	-0.5423
29	901	Dow slides 200 points on concerns of retail investors speculative trading	null	-0.9970
29	901	Who s getting rich off GameStop s stock The market makers and middlemen including Robinhood	null	0.5574
29	901	Dow Jones Today Stocks Drop To Test Support Caterpillar Climbs Bitcoin Rallies Short Squeeze	null	-0.9968
29	721	GLOBAL MARKETS Wall Street set for weak open on hedge fund retail battle	null	-0.6705
30	601	Billionaire Leon Cooperman says GameStop surge will end very badly for the public and decries	null	-0.5256
29	961	Kraken Coinbase Suffer Outages Amid Market Volatility	null	-0.5423
29	781	How A Little Bird Is Delivering Trust	null	0.5106
30	301	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right	null	-0.9988
30	121	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
30	301	Fun and GameStop National Review	null	0.5106
29	1201	Govt may introduce bill to ban control and regulate cryptocurrencies	null	-0.5574
30	301	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right The Motley Fool	null	-0.9989
29	1321	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1201	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring	null	0.9985
29	1141	Short selling What it is why it s risky and how the squeeze happens	null	-0.9413
29	1261	US stocks suffer worst week since October amid Reddit fueled trading craze	null	-0.9906
29	1201	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	961	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	961	5 best stock trading apps for iPhone 9to5Mac	null	0.6369
29	1021	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	841	Here s why Elon Musk s simple Twitter bio change rocketed Bitcoin up 18 CryptoSlate	null	0.7906
29	781	Jon Stewart gets a warm welcome on Twitter after joining to defend Reddit traders	null	0.5994
29	721	Far right extremists use GameStop chaos to radicalize and recruit on Telegram	null	-0.5719
29	121	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	601	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1081	Bitcoin soars 14 on Musk namecheck on Twitter Reuters	null	0.9985
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1201	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street CNET	null	0.9970
30	241	Meme Based Cryptocurrency Dogecoin Surges 822 to Record High	null	0.9682
29	1261	Analysis GameStop s Reddit rally puts scrutiny on social media forums Reuters	null	0.9682
30	661	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
29	1141	Two Bars for Bitcoins Owner in New York s Hell s Kitchen Selling Out for Cryptocurrency	null	-0.9618
29	1201	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street	null	0.9970
29	1081	India Would Ban Private Cryptocurrencies Under Proposed Legislation CoinDesk	null	-0.5574
29	1081	Robinhood Halts Instant Buying Power For Crypto	null	0.9325
29	1261	Bitcoin s spike drives rebound in hard hit crypto mining stocks	null	0.9810
30	1	GMI Model Estimates Bitcoin Fair Value At 300K By October 2021	null	0.5719
29	1261	What is Dogecoin and Why Are People Buying It	null	0.9325
29	1081	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1381	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1081	CORRECTED Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
30	241	Litecoin Falls 11 39 In Selloff	null	-0.9997
30	241	XRP Soars 30 63 In Rally By Investing com	null	0.9990
30	241	Litecoin Falls 11 39 In Selloff By Investing com	null	-0.9997
30	241	XRP Climbs 10 65 In Rally By Investing com	null	0.9682
30	361	India Plans to Introduce Legislation to Ban Cryptocurrencies	null	-0.5574
30	241	XRP Climbs 10 65 In Bullish Trade	null	0.9970
29	1081	Ray Dalio clarifies his position on Bitcoin saying he greatly admires it CryptoSlate	null	0.5709
29	1261	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1141	KDKA Investigates Financial Advisors Explain Dangers Of Treating Buying Stocks Like Sports Gambling	null	0.9231
29	1081	India Would Ban Private Cryptocurrencies Under Proposed Legislation	null	-0.5574
29	1141	Everything we know about the GameStop stock insanity	null	-0.5719
30	241	Bitcoin Falls 10 22 In Rout	null	-0.9993
30	961	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1381	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
30	721	9 great reads from CNET this week	null	0.6249
30	601	5 Awful Stocks Robinhood Investors Can t Stop Buying	null	0.8689
30	301	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right	null	-0.9988
30	301	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right The Motley Fool	null	-0.9989
30	301	Fun and GameStop National Review	null	0.5106
30	301	Fun and GameStop	null	0.5106
29	1201	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1381	After a tumultuous week some fear Robinhood s actions set a horrible precedent	null	-0.7717
29	1381	After a tumultuous week some fear Robinhood s actions set a horrible precedent	null	-0.7717
29	1201	Bitcoin Soars After Tesla CEO Elon Musk Says This 1 Word on Twitter	null	0.9985
29	1261	US stocks suffer worst week since October amid Reddit fueled trading craze	null	-0.9906
29	1201	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1021	Downtown Weatherford building damaged after man crashes into it officials say	null	-0.9993
30	961	Robinhood restricts instant buying of crypto citing extraordinary market conditions	null	0.9136
29	1141	Govt may introduce bill to ban control and regulate cryptocurrencies	null	-0.5574
30	121	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1141	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring	null	0.9985
29	1141	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring The Motley Fool	null	0.9984
29	1261	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1261	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1261	Analysis GameStop s Reddit Rally Puts Scrutiny on Social Media Forums	null	0.9682
29	1321	Dogecoin soars another 600 as Reddit frenzy pushes the token into the top 10 cryptocurrencies by	null	0.9985
29	1261	Ethereum Price Prediction ETH on the verge of a 30 breakout towards 1 900	null	0.9325
29	1141	Short selling What it is why it s risky and how the squeeze happens	null	-0.9413
30	661	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
29	121	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	601	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1081	Bitcoin soars 14 on Musk namecheck on Twitter Reuters	null	0.9985
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1201	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street CNET	null	0.9970
30	241	Meme Based Cryptocurrency Dogecoin Surges 822 to Record High	null	0.9682
29	1261	Analysis GameStop s Reddit rally puts scrutiny on social media forums Reuters	null	0.9682
30	721	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
29	1141	Two Bars for Bitcoins Owner in New York s Hell s Kitchen Selling Out for Cryptocurrency	null	-0.9618
29	1201	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street	null	0.9970
29	1141	India Would Ban Private Cryptocurrencies Under Proposed Legislation CoinDesk	null	-0.5574
29	1321	Bitcoin s spike drives rebound in hard hit crypto mining stocks	null	0.9810
30	61	GMI Model Estimates Bitcoin Fair Value At 300K By October 2021	null	0.5719
29	1201	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1081	Robinhood Halts Instant Buying Power For Crypto	null	0.9325
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
30	301	XRP Jumps 20 32 In Rally By Investing com	null	0.9982
30	301	XRP Climbs 10 65 In Rally By Investing com	null	0.9682
30	301	Litecoin Falls 11 39 In Selloff By Investing com	null	-0.9997
30	961	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1081	Bitcoin soars 14 on Musk namecheck on Twitter	null	0.9985
30	301	XRP Soars 30 63 In Rally By Investing com	null	0.9990
30	961	Tron Ticker Confusion Would Be TRX Crypto Investors Mistakenly Buy Tanzanian Gold TRX Stock	null	-0.5267
29	1381	180M Bitcoin Trust Completes Canadian IPO Fully Invested on First Day CoinDesk	null	0.5106
30	1	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
29	1381	180M Bitcoin Trust Completes Canadian IPO Fully Invested on First Day	null	0.5106
29	1321	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1081	India Would Ban Private Cryptocurrencies Under Proposed Legislation	null	-0.5574
30	1	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
30	301	Litecoin Falls 11 39 In Selloff	null	-0.9997
30	301	XRP Climbs 10 65 In Bullish Trade	null	0.9970
30	421	India Plans to Introduce Legislation to Ban Cryptocurrencies	null	-0.5574
30	301	Bitcoin Falls 10 22 In Rout	null	-0.9993
30	961	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1081	Ray Dalio clarifies his position on Bitcoin saying he greatly admires it CryptoSlate	null	0.5709
29	1201	KDKA Investigates Financial Advisors Explain Dangers Of Treating Buying Stocks Like Sports Gambling	null	0.9231
29	1201	Everything we know about the GameStop stock insanity	null	-0.5719
30	781	9 great reads from CNET this week	null	0.6249
30	661	5 Awful Stocks Robinhood Investors Can t Stop Buying	null	0.8689
30	301	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right The Motley Fool	null	-0.9989
29	1201	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring	null	0.9985
30	301	Fun and GameStop	null	0.5106
29	1201	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring The Motley Fool	null	0.9984
29	1321	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1261	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
30	1	After a tumultuous week some fear Robinhood s actions set a horrible precedent	null	-0.7717
29	1261	Bitcoin Soars After Tesla CEO Elon Musk Says This 1 Word on Twitter The Motley Fool	null	0.9984
29	1261	US stocks suffer worst week since October amid Reddit fueled trading craze	null	-0.9906
29	1201	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1081	Downtown Weatherford building damaged after man crashes into it officials say	null	-0.9993
29	1201	Govt may introduce bill to ban control and regulate cryptocurrencies	null	-0.5574
30	661	5 Awful Stocks Robinhood Investors Can t Stop Buying The Motley Fool	null	0.7845
30	301	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right	null	-0.9988
30	121	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
30	301	Fun and GameStop National Review	null	0.5106
29	1321	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1321	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1381	Dogecoin soars another 600 as Reddit frenzy pushes the token into the top 10 cryptocurrencies by	null	0.9985
29	1261	Ethereum Price Prediction ETH on the verge of a 30 breakout towards 1 900	null	0.9325
30	661	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
29	121	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	601	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1081	Bitcoin soars 14 on Musk namecheck on Twitter Reuters	null	0.9985
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1201	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street CNET	null	0.9970
30	241	Meme Based Cryptocurrency Dogecoin Surges 822 to Record High	null	0.9682
29	1261	Analysis GameStop s Reddit rally puts scrutiny on social media forums Reuters	null	0.9682
30	721	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
29	1141	Two Bars for Bitcoins Owner in New York s Hell s Kitchen Selling Out for Cryptocurrency	null	-0.9618
29	1201	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street	null	0.9970
29	1141	India Would Ban Private Cryptocurrencies Under Proposed Legislation CoinDesk	null	-0.5574
29	1321	Bitcoin s spike drives rebound in hard hit crypto mining stocks	null	0.9810
30	61	GMI Model Estimates Bitcoin Fair Value At 300K By October 2021	null	0.5719
29	1201	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1261	What is Dogecoin and Why Are People Buying It	null	0.9325
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1081	Robinhood Halts Instant Buying Power For Crypto	null	0.9325
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
29	1141	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency	null	-0.9618
30	301	XRP Jumps 20 32 In Rally By Investing com	null	0.9982
30	301	XRP Climbs 10 65 In Rally By Investing com	null	0.9682
30	301	Litecoin Falls 11 39 In Selloff By Investing com	null	-0.9997
30	961	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1081	Bitcoin soars 14 on Musk namecheck on Twitter	null	0.9985
30	301	XRP Soars 30 63 In Rally By Investing com	null	0.9990
30	961	Tron Ticker Confusion Would Be TRX Crypto Investors Mistakenly Buy Tanzanian Gold TRX Stock	null	-0.5267
29	1381	180M Bitcoin Trust Completes Canadian IPO Fully Invested on First Day CoinDesk	null	0.5106
30	1	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
29	1381	180M Bitcoin Trust Completes Canadian IPO Fully Invested on First Day	null	0.5106
29	1321	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1081	India Would Ban Private Cryptocurrencies Under Proposed Legislation	null	-0.5574
30	1	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
30	301	Litecoin Falls 11 39 In Selloff	null	-0.9997
30	301	XRP Climbs 10 65 In Bullish Trade	null	0.9970
30	421	India Plans to Introduce Legislation to Ban Cryptocurrencies	null	-0.5574
30	301	Bitcoin Falls 10 22 In Rout	null	-0.9993
30	961	Robinhood restricts Instant Buying of crypto citing extraordinary market conditions	null	0.9136
29	1081	Ray Dalio clarifies his position on Bitcoin saying he greatly admires it CryptoSlate	null	0.5709
29	1201	KDKA Investigates Financial Advisors Explain Dangers Of Treating Buying Stocks Like Sports Gambling	null	0.9231
29	1201	Everything we know about the GameStop stock insanity	null	-0.5719
30	781	9 great reads from CNET this week	null	0.6249
30	661	5 Awful Stocks Robinhood Investors Can t Stop Buying	null	0.8689
30	301	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right The Motley Fool	null	-0.9989
29	1201	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring	null	0.9985
30	301	Fun and GameStop	null	0.5106
29	1201	Elon Musk and Ray Dalio Send Bitcoin Stocks Soaring The Motley Fool	null	0.9984
29	1321	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1261	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
30	1	After a tumultuous week some fear Robinhood s actions set a horrible precedent	null	-0.7717
29	1261	Bitcoin Soars After Tesla CEO Elon Musk Says This 1 Word on Twitter The Motley Fool	null	0.9984
29	1261	US stocks suffer worst week since October amid Reddit fueled trading craze	null	-0.9906
29	1201	GLOBAL MARKETS Dollar stocks slide as virus social trading cools sentiment	null	-0.9970
29	1081	Downtown Weatherford building damaged after man crashes into it officials say	null	-0.9993
29	1201	Govt may introduce bill to ban control and regulate cryptocurrencies	null	-0.5574
30	661	5 Awful Stocks Robinhood Investors Can t Stop Buying The Motley Fool	null	0.7845
30	301	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right	null	-0.9988
30	121	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
30	301	Fun and GameStop National Review	null	0.5106
29	1321	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1321	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
29	1381	Dogecoin soars another 600 as Reddit frenzy pushes the token into the top 10 cryptocurrencies by	null	0.9985
29	1261	Ethereum Price Prediction ETH on the verge of a 30 breakout towards 1 900	null	0.9325
30	661	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
29	121	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	601	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1081	Bitcoin soars 14 on Musk namecheck on Twitter Reuters	null	0.9985
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1201	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street CNET	null	0.9970
30	241	Meme Based Cryptocurrency Dogecoin Surges 822 to Record High	null	0.9682
29	1261	Analysis GameStop s Reddit rally puts scrutiny on social media forums Reuters	null	0.9682
30	961	Dogecoin crashes as Reddit fuelled cryptocurrency joke falls flat	null	-0.9998
30	661	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
30	1081	India s Proposed Crypto Ban Has Investors Nervous May Feed Anti Bitcoin Narrative	null	-0.7906
30	61	GMI Model Estimates Bitcoin Fair Value At 300K By October 2021	null	0.5719
30	301	Litecoin Falls 11 39 In Selloff	null	-0.9997
30	301	XRP Soars 30 63 In Rally By Investing com	null	0.9990
30	301	XRP Jumps 20 32 In Rally By Investing com	null	0.9982
30	301	XRP Climbs 10 65 In Rally By Investing com	null	0.9682
30	301	Litecoin Falls 11 39 In Selloff By Investing com	null	-0.9997
30	421	India Plans to Introduce Legislation to Ban Cryptocurrencies	null	-0.5574
30	301	XRP Soars 31 In Rally By Investing com	null	0.9990
29	1381	180M Bitcoin Trust Completes Canadian IPO Fully Invested on First Day CoinDesk	null	0.5106
30	1	Robinhood users are furious that it intervened in GameStop trading This map reveals where they are	null	-0.5719
29	1381	180M Bitcoin Trust Completes Canadian IPO Fully Invested on First Day	null	0.5106
30	301	XRP Jumps 20 32 In Rally	null	0.9982
30	301	Bitcoin Falls 10 22 In Rout	null	-0.9993
30	301	XRP Climbs 10 65 In Bullish Trade	null	0.9970
30	1021	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
30	781	9 great reads from CNET this week	null	0.6249
30	661	5 Awful Stocks Robinhood Investors Can t Stop Buying The Motley Fool	null	0.7845
30	301	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right The Motley Fool	null	-0.9989
30	301	Fun and GameStop	null	0.5106
30	1	After a tumultuous week some fear Robinhood s actions set a horrible precedent	null	-0.7717
30	1261	Dogecoin soars another 600 as Reddit frenzy pushes the token into the top 10 cryptocurrencies by	null	0.9985
30	661	5 Awful Stocks Robinhood Investors Can t Stop Buying	null	0.8689
30	301	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right	null	-0.9988
30	121	Analysis GameStop s Reddit rally puts scrutiny on social media forums	null	0.9682
30	301	Fun and GameStop National Review	null	0.5106
30	301	Bitcoin Market Looking for New Lows After Elon Musk s Pump Dump	null	-0.5267
30	661	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
29	121	WallStreetsBets craze pushes dogecoin up 5x in 24 hours	null	0.7506
29	601	Elon Musk changes Twitter bio to bitcoin chaos ensues	null	-0.5719
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1081	Bitcoin soars 14 on Musk namecheck on Twitter Reuters	null	0.9985
29	541	Bitcoin soars 11 after Elon Musk namecheck on Twitter Reuters	null	0.9985
29	1201	Dogecoin jumps more than 300 as Reddit tries to take on Wall Street CNET	null	0.9970
30	241	Meme Based Cryptocurrency Dogecoin Surges 822 to Record High	null	0.9682
30	1261	Reddit Frenzy Pumps Up Dogecoin A Cryptocurrency Started As A Joke	null	0.7845
29	1261	Analysis GameStop s Reddit rally puts scrutiny on social media forums Reuters	null	0.9682
30	961	Dogecoin crashes as Reddit fuelled cryptocurrency joke falls flat	null	-0.9998
30	1081	India s Proposed Crypto Ban Has Investors Nervous May Feed Anti Bitcoin Narrative	null	-0.7906
30	1141	Dogecoin crashes as Reddit fuelled cryptocurrency joke falls flat	null	-0.9998
30	1081	India s Proposed Crypto Ban Has Investors Nervous May Feed Anti Bitcoin Narrative CoinDesk	null	-0.7906
31	721	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency amNewYork	null	-0.9618
31	301	XRP Climbs 52 49 In Bullish Trade By Investing com	null	0.9970
31	61	EOS Climbs 10 In Bullish Trade By Investing com	null	0.9970
30	1141	XRP price gains 86 after Wall Street Bets crypto wing says pump it	null	0.9786
30	1261	Judge Rejects Virgil Griffith s Motion to Dismiss Charges of Aiding North Korea	null	-0.6486
31	301	EOS Climbs 10 07 In Bullish Trade	null	0.9970
31	61	EOS Climbs 10 07 In Rally By Investing com	null	0.9682
31	781	Robinhood Is a Perfect Example of Fintech s Insidious Power	null	0.5719
31	541	What you need to know on the markets this week Eat the rich Robinhood s reckoning after	null	0.5574
31	181	Analysts say Bitcoin could pop back up after accumulation CryptoSlate	null	0.7906
30	1021	FB Stock A Buy Facebook Crushes Q4 Earnings But Predicts High Opt Out Rates	null	0.9882
31	781	What shares were hot in the last week GameStop AMC Entertainment and more Investing com UK	null	0.6124
30	661	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
30	241	Meme Based Cryptocurrency Dogecoin Surges 822 to Record High	null	0.9682
30	1261	Reddit Frenzy Pumps Up Dogecoin A Cryptocurrency Started As A Joke	null	0.7845
30	301	FAA is Investigating SpaceX Over Launch License Violations During the Explosive Starship Test	null	-0.5267
31	601	After Massive Dogecoin Crash Ripple s XRP Has Suddenly Rocketed Higher In WallStreetBets Price Surge	null	-0.9993
30	721	Government plans to introduce legislation to ban cryptocurrencies	null	-0.5574
30	301	Government to introduce bills to set up DFI Digital Currency	null	0.7906
31	781	iPhone taken in crime spree and more Capitol rioters arrested in the Apple Crime Blotter	null	-0.8850
30	301	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right	null	-0.9988
30	1081	India s Proposed Ban of Private Cryptos Has Many of the Nation s Investors Nervous	null	-0.6908
30	961	Dogecoin crashes as Reddit fuelled cryptocurrency joke falls flat	null	-0.9998
30	1261	Judge Rejects Virgil Griffith s Motion to Dismiss Charges of Aiding North Korea	null	-0.6486
32	601	XRP Erases SEC Led Drop as Supporters Pump Price Over 0 60	null	-0.9968
31	1141	XRP Posted Biggest Single Day Gain in 3 Years in a Coordinated Buying Attack	null	0.9905
32	481	A Good Thing Elon Musk Says He s a Supporter of Bitcoin	null	0.6124
31	961	Dogecoin Caught Up In Reddit Frenzy Remains Low After Rally	null	0.6908
31	661	The 4 Most Dangerous Bitcoin Stocks	null	-0.5256
32	481	A Good Thing Elon Musk Says He s a Supporter of Bitcoin CoinDesk	null	0.6124
32	421	India proposes law to ban cryptocurrencies CyberNews	null	-0.5574
32	241	EOS Climbs 10 27 In Bullish Trade	null	0.9970
32	241	XRP Soars 30 09 In Rally By Investing com	null	0.9990
32	241	EOS Climbs 10 As Investors Gain Confidence By Investing com	null	0.9853
31	1021	Indian government looking to crack down on crypto scams with proposed ban Cashaa CEO	null	-0.8126
31	661	Stellar Lumens Is Worth Keeping An Eye On As Scarcity Should Drive Value	null	0.5106
32	241	XRP Soars 30 In Rally By Investing com	null	0.9990
32	241	XRP Soars 30 09 In Rally	null	0.9990
31	901	Redditors rally as Dogecoin halves in value following a sevenfold surge last week	null	0.9732
31	661	Two bars for bitcoins owner in New York s Hell s Kitchen selling out for cryptocurrency amNewYork	null	-0.9618
31	1201	Bitcoin Bears Erase the Elon Musk Candle as Sellers Take Control	null	-0.9325
32	421	Robinhood boss promises Elon Musk he ll relax GameStop limits live updates	null	0.6705
31	1081	Bitcoin Falls Back to 32K as Elon Musk s Bio Change Fades Into Memory	null	-0.9993
32	61	85 Dogecoin rally shows Wall Street Bets aren t done with DOGE yet	null	0.9682
31	661	The 4 Most Dangerous Bitcoin Stocks The Motley Fool	null	-0.7425
31	1141	XRP Posted Biggest Single Day Gain in 3 Years in a Coordinated Buying Attack CoinDesk	null	0.9905
31	961	Dogecoin Caught Up In Reddit Frenzy Remains Low After Rally	null	0.6908
32	481	UK Research and Innovation suffers ransomware attack ZDNet	null	-0.5574
32	241	Will GameStop and Reddit Hurt My 401 k	null	-0.5267
32	61	Hedge fund Melvin Capital loses 7bn on GameStop frenzy	null	-0.5574
32	61	Hedge fund Melvin Capital loses 7bn on GameStop frenzy	null	-0.5574
31	721	MARK TO MARKET Hold on tight Bitcoin rally 2 0	null	0.9682
31	1141	Why Did Twitch Ban the Pogchamp Emote	null	-0.5574
31	1141	Robinhood boss shuts down Elon Musk s GameStop conspiracy theories live updates	null	-0.5267
31	1021	Robinhood Is a Perfect Example of Fintech s Insidious Power	null	0.5719
32	241	Switzerland s Crypto Broker AG Wins Securities House License From FINMA	null	0.7096
32	241	Switzerland s Crypto Broker AG Wins Securities House License From FINMA CoinDesk	null	0.7096
31	901	Mets owner Steve Cohen deletes Twitter after family receives threats amid stock market turmoil	null	-0.6486
31	901	Mets owner Steve Cohen deletes Twitter after family receives threats amid stock market turmoil	null	-0.6486
31	901	Mets owner Steve Cohen deletes Twitter after family receives threats amid stock market turmoil	null	-0.6486
32	241	A Rally in Bitcoin Sparked by Elon Musk Has Almost Evaporated	null	0.9682
31	1081	Bitcoin Falls Back to 32K as Elon Musk s Bio Change Fades Into Memory CoinDesk	null	-0.9993
31	961	Fed s Powell just talked up a classic Buffett market bogeyman Inflation	null	0.7906
31	901	What you need to know on the markets this week Eat the rich Robinhood s reckoning after	null	0.5574
31	841	What shares were hot in the last week GameStop AMC Entertainment and more Investing com UK	null	0.6124
30	661	India plans to introduce law to ban Bitcoin other private cryptocurrencies	null	-0.5574
30	241	Meme Based Cryptocurrency Dogecoin Surges 822 to Record High	null	0.9682
30	1261	Reddit Frenzy Pumps Up Dogecoin A Cryptocurrency Started As A Joke	null	0.7845
30	301	FAA is Investigating SpaceX Over Launch License Violations During the Explosive Starship Test	null	-0.5267
31	601	After Massive Dogecoin Crash Ripple s XRP Has Suddenly Rocketed Higher In WallStreetBets Price Surge	null	-0.9993
30	721	Government plans to introduce legislation to ban cryptocurrencies	null	-0.5574
30	301	Government to introduce bills to set up DFI Digital Currency	null	0.7906
31	781	iPhone taken in crime spree and more Capitol rioters arrested in the Apple Crime Blotter	null	-0.8850
30	301	These 3 Red Hot Stocks Could Plunge More than 50 If Wall Street s Right	null	-0.9988
30	1081	India s Proposed Ban of Private Cryptos Has Many of the Nation s Investors Nervous	null	-0.6908
30	961	Dogecoin crashes as Reddit fuelled cryptocurrency joke falls flat	null	-0.9998
32	841	XRP Pump Fails to Materialize as Price Crashes 40 From Day s High	null	-0.9990
33	1	Steven Seagal a Missing Private Eye and an Alleged Crypto Fraud	null	-0.7184
33	541	XRP Erases SEC Led Drop as Supporters Pump Price Over 0 60	null	-0.9968
32	781	XRP soars as much as 50 and Dogecoin jumps as day traders flex their muscles and Elon Musk adds to	null	0.9995
33	1	Sham crypto exec who partnered with Steven Seagal busted for investor fraud	null	-0.5859
33	301	XRP Plunges 30 91 In Bearish Trade By Investing com	null	-0.9997
32	1261	Here s What The World s Richest Person Thinks About Bitcoin	null	0.5267
33	301	XRP Plunges 30 91 In Bearish Trade	null	-0.9997
33	301	XRP Plunges 31 In Bearish Trade By Investing com	null	-0.9997
32	1321	Feds arrest crypto fraudster accusing of bilking investors out of millions	null	-0.7650
33	121	Santa Ana man accused of connection to 11 million securities fraud	null	-0.5859
33	541	XRP Erases SEC Led Drop as Supporters Pump Price Over 0 60 CoinDesk	null	-0.9968
33	181	Santa Ana Man Charged in NY With Cryptocurrency Scam MyNewsLA com	null	-0.6705
32	1081	How risky is Ripple s XRP The dangers of buying the cryptocurrency explained	null	0.8750
32	661	Bitcoin Posts Comeback Rally on Elon Musk Comment Analyst Sees ATH	null	0.9682
33	541	Cryptocurrencies Like Bitcoin Are Far From Safe Investments	null	0.6597
32	841	Reddit rage as XRP price crashes 50 hours after hitting two week highs	null	-0.9993
32	1321	Feds arrest crypto fraudster accusing of bilking investors out of millions	null	-0.7650
32	1321	Feds arrest crypto fraudster accusing of bilking investors out of millions	null	-0.7650
33	61	California man charged in 11 million cryptocurrency fraud that bilked New Yorkers sources and	null	-0.6808
32	781	Dogecoin Price Up 37 After Weekend Plunge Bullish Push From Reddit Group Expected	null	-0.9882
32	1021	Two Main Reasons for HSBT Hits a Record High	null	0.9682
32	721	Top 3 Price Prediction Bitcoin Ethereum Ripple XRP pumps towards 1 as the Bitcoin rally cools	null	0.9712
32	841	XRP Pump Fails to Materialize as Price Crashes 40 From Day s High CoinDesk	null	-0.9990
32	661	US Man Pleads Guilty to Money Laundering Charges Involving 13M in Bitcoin	null	-0.5994
32	661	US Man Pleads Guilty to Money Laundering Charges Involving 13M in Bitcoin CoinDesk	null	-0.5994
32	1321	Bitcoin price is sideways silver hits a 7 year high and XRP s rally pops	null	0.9918
33	1	CryptoQuant CEO says Coinbase Bitcoin outflows are a bullish signal	null	0.9970
32	901	Grayscale Reopens Its Ethereum Trust to Investors	null	0.5106
32	661	Elon Musk says he s a supporter of bitcoin and thinks it will get broad acceptance in finance	null	0.6249
33	361	Man wanted in Carlos Ghosn s escape accuses US of betrayal WTOP	null	-0.6705
33	541	Former Green Beret wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
33	421	On chain metrics reveal buying power ready to flow into Bitcoin for the ultimate push to 50 000	null	0.9477
33	301	Former Green Beret wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
33	61	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
33	61	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1201	WhatsApp Assures Users of Its Commitment to Your Privacy	null	0.5994
32	1141	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1081	Mark Cuban How selling stamps as a kid helped me see why digital assets are the future of business	null	-0.9231
32	961	Shares of audio technology company Agora soar as investors try to jump on Clubhouse app s growth	null	0.5859
32	961	Leaving Robinhood Here s Are 5 Robinhood Alternatives for Frustrated Reddit Investors	null	-0.5267
32	901	Bitcoin bounces back as main street invades Wall Street	null	0.9818
32	901	Grayscale Reopens Its Ethereum Trust to Investors CoinDesk	null	0.5106
33	181	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
33	181	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
33	61	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
33	61	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
33	61	Man Wanted in Carlos Ghosn s Escape Accuses US of Betrayal	null	-0.6705
33	1	MONEY MONDAY The Gamestop stock fiasco explained	null	-0.5106
33	1	Former Green Beret accuses US of betrayal for OK ing extradition to Japan in smuggling case	null	-0.7482
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	721	Why the Bitcoin price dropped immediately after Musk s positive comments CryptoSlate	null	0.5574
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	1321	Man wanted in Carlos Ghosn s escape accuses US of betrayal	null	-0.6705
32	961	How a Series of Elon Musk Tweets Helped Lead Investors to Dogecoin a Meme Inspired Cryptocurrency Worth 4 Cents	null	0.6249
32	361	Indian gov t proposes to ban private cryptocurrency	null	-0.5574
32	61	India plans national digital currency plus a ban on private crypto cash	null	-0.5574
32	361	India Wants to Ban Bitcoin and Other Private Cryptocurrencies	null	-0.5574
32	841	XRP Pump Fails to Materialize as Price Crashes 40 From Day s High	null	-0.9990
32	601	XRP Erases SEC Led Drop as Supporters Pump Price Over 0 60	null	-0.9968
32	541	A Good Thing Elon Musk Says He s a Supporter of Bitcoin	null	0.6124
35	1261	Market Wrap Bitcoin Drops to 36 3K as DeFi Jumps to 32B on Ether FOMO	null	0.9970
35	901	Cryptocurrency live Latest as Dogecoin rockets up on Elon Musk Twitter endorsement	null	0.8519
35	961	What is dogecoin Elon Musk has sent the meme cryptocurrency soaring	null	0.9985
36	541	Twitter s Jack Dorsey has fired up a full Bitcoin node	null	0.5267
36	1	Bitcoin Price Closing Above This Hurdle Sends Bulls Off To The Races	null	0.9325
35	901	Bitcoin Buying Will Rise This Year Says Survey ETF Trends	null	0.9918
36	241	It s the perfect time to own Bitcoin says City fund manager	null	0.5719
35	1021	Blockchain Bites The Rise of the Bitcoin Investment Fund CoinDesk	null	0.9818
35	841	Sweet Launches Broad Scale NFT Solution For Leading Entertainment And Consumer Brands In Partnership	null	0.7964
35	1201	Institutional Buyers the Likely Suspect Behind Latest Bitcoin Rally What s Next	null	0.9628
35	1261	Market Wrap Bitcoin Drops to 36 3K as DeFi Jumps to 32B on Ether FOMO CoinDesk	null	0.9970
36	601	Twitter CEO Jack Dorsey Has Set up His Own Bitcoin Node	null	0.7906
35	781	Top 3 Price Prediction Bitcoin Ethereum Ripple Bitcoin on the launchpad to 40 000 as ETH rally	null	0.9712
36	721	Dogecoin soars 50 after Elon Musk praises Bitcoin rival as the people s crypto	null	0.9986
35	961	Tom Lee gives the long term bullish case for bitcoin and why it s better than gold	null	0.9972
35	841	Sweet Launches Broad Scale NFT Solution for Leading Entertainment and Consumer Brands in Partnership	null	0.7964
35	901	Sweet launches broad scale NFT solution in partnership with Bitcoin com	null	0.6486
36	721	Forget Bitcoin Inside the insane world of altcoin cryptocurrency trading	null	-0.5574
35	781	Bitcoin Rally Continues But Lacks Confirmation	null	0.9682
35	1081	Discord servers targeted in cryptocurrency exchange scam wave ZDNet	null	-0.7506
36	601	3 Catalysts That Propelled Cardano ADA to Its Three Year High	null	0.9682
36	541	Elon Musk s Dogecoin Tweets Worry Crypto Community Situation Seriously Damaging	null	-0.7845
35	1081	The Rise and Fall of Bitcoin Billionaire Arthur Hayes	null	0.9818
36	721	Is ether or elon musk pulling the crypto market up	null	0.7906
35	841	Ethereum catapults to new all time high past 1 600 as investors pile in ahead of next week s launch	null	0.9682
35	961	What is dogecoin Elon Musk has sent the meme cryptocurrency soaring	null	0.9985
35	901	Croatia s Tifon Gas Stations Hope to Tap Tourist Trade With Crypto Payment Support	null	0.6808
36	721	Musk backs dogecoin Apple car euro slide continues BOE oil rises gold falls on strong dollar	null	-0.9997
35	1081	Book publishers scramble to sign Reddit rally authors	null	0.9682
35	1021	Elon Musk gets back on Twitter sends Dogecoin soaring	null	0.9985
35	781	Musk backs dogecoin Apple car euro slide continues BOE oil rises gold falls on strong dollar	null	-0.9997
36	241	Musk Helps Crypto Market Value Climb to Record in Volatile Week	null	0.9001
35	1021	Super Bowl LV HODL Or Bet	null	0.9619
36	301	Crypto escrow agent dodges jail after lying over stolen millions	null	-0.7650
36	481	Crypto Hedge Fund Founder Pleads Guilty to 90M Fraud CoinDesk	null	-0.7650
35	1381	PayPal is aiming to become a financial super app Silicon Valley Business Journal	null	0.5994
36	541	Robinhood lifts trading restrictions on Reddit darlings GameStop and AMC days after relaxing limits	null	0.7506
36	481	Online Casino with The Best Reward Program EconoTimes	null	0.8360
35	1321	Yearn Finance DAI Vault Has Suffered an Exploit 13 8M Drained CoinDesk	null	-0.7269
35	1321	Online Super Bowl Bets Expected to Increase 63 This Year	null	0.7351
35	1021	Instagram Unmasks High Profile OG Account Stealers Threatens to Sue	null	0.9451
35	1021	Dogecoin goes up over 40 after Elon Musk Mark Cuban tweet about it	null	0.7906
35	961	Elon Musk Sent The Price Of Dogecoin Soaring With One Word Tweet	null	0.9985
35	901	Crypto Is the Libertarian Cheat Code in the Final Battle Over State Coercion	null	-0.5719
35	841	Sandstorm Gold briefly spikes 55 after Elon Musk praises a techno song with a similar name on	null	0.5267
35	1021	Dogecoin goes up over 40 after Elon Musk Mark Cuban tweet about it	null	0.7906
35	781	PayPal PYPL Soars 6 After Profit Triples Firms Raise Numbers and PTs Amid Super App	null	0.9987
35	781	Ethereum Triangle Breakout Shifts Price Target to Over 2 000	null	0.9325
35	781	Elon Musk s Twitter Comeback Sends Dogecoin Up Over 0 05	null	0.7906
35	721	Learn About Bitcoin So You Can Intelligently Invest in Cryptocurrency	null	0.5046
35	781	Forget Bitcoin Inside the insane world of altcoin cryptocurrency trading CNET	null	-0.5574
35	1021	Dogecoin goes up over 40 after Elon Musk Mark Cuban tweet about it	null	0.7906
37	961	Bitcoin Rally Takes Crypto Market Value to New Record	null	0.9732
37	901	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	721	Bitcoin mining is horrible for the environment Here s what we can do about it	null	-0.5423
37	901	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	601	A bitcoin stash worth 68 million was seized by German police but the owner won t give up his	null	0.9517
36	1261	Market Wrap Bitcoin Rises to 38 3K While Ether s New High Takes Spotlight	null	0.9682
36	1381	Twitter CEO Jack Dorsey is setting up a bitcoin node	null	0.7906
37	241	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
36	1261	Market Wrap Bitcoin Rises to 38 3K While Ether s New High Takes Spotlight CoinDesk	null	0.9682
36	1321	Women make up only 15 of bitcoin traders highlighting the crypto world s glaring gender imbalance	null	0.7906
37	841	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9886
37	1021	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
37	1021	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
37	541	The institutionalization of BTC Mining may be more profitable than buying	null	0.9549
37	361	600M iGaming Platform Integrates FUN Token	null	0.6166
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1321	MoneyLine Podcast The Chance to Profit From This 1 6T Industry Is Just Beginning	null	0.5994
37	1021	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud CoinDesk	null	-0.5859
37	1	Altcoin Market Cap On The Verge Of Life Changing Breakout	null	0.9325
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
36	1201	German court can t cash 60M in bitcoin from man who won t give up passwords	null	0.8934
37	601	Elon Musk sent Dogecoin soaring last week Here are 6 times the Tesla boss has moved markets from	null	0.9985
36	1321	The IRS says teachers can deduct hand sanitizer costs and how Dolly Parton s Super Bowl ad glosses	null	0.7964
37	781	Thinking of Selling Stock Ask Yourself These Questions First The Motley Fool	null	-0.9509
37	781	Thinking of Selling Stock Ask Yourself These Questions First	null	-0.9325
37	721	New York Is Calling the Up and Comers	null	0.7906
37	241	Cardano Climbs 11 31 In Rally	null	0.9682
37	241	Cardano Climbs 11 As Investors Gain Confidence By Investing com	null	0.9853
37	241	Cardano Climbs 11 31 In Rally By Investing com	null	0.9682
37	181	It seems like a lifeline but it s not COVID 19 relief scams targeting Carolinians who are	null	-0.8308
37	121	Litecoin Climbs 10 14 In Bullish Trade By Investing com	null	0.9970
37	1021	Serbian Man Extradited to US After Being Indicted in 70M Crypto Fraud	null	-0.5859
37	901	Ethereum Price Prediction ETH ready to rise to new highs following crucial rebound	null	0.9957
37	721	9 great reads from CNET this week	null	0.6249
37	721	Cybersecurity An Attackers Perspective Model Portfolio Channel	null	-0.5719
36	1321	The IRS says teachers can deduct hand sanitizer costs and how Dolly Parton s Super Bowl ad glosses	null	0.7964
37	181	It seems like a lifeline but it s not COVID 19 relief scams targeting Carolinians who are	null	-0.8308
36	1381	Crypto exchange Bitfinex says it repaid 550 million Tether loan central to fraud probe	null	-0.5859
36	1321	The IRS says teachers can deduct hand sanitizer costs and how Dolly Parton s Super Bowl ad glosses	null	0.7964
35	721	Learn About Bitcoin So You Can Intelligently Invest in Cryptocurrency	null	0.5046
36	781	Is earning Bitcoin with each swipe the credit card reward of the future These cards think so	null	0.7430
36	841	NewsWatch U S gains just 49 000 jobs in January Labor market still under acute stress	null	0.9781
35	781	Forget Bitcoin Inside the insane world of altcoin cryptocurrency trading CNET	null	-0.5574
38	601	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a	null	0.9682
37	1021	Bitcoin Rally Takes Crypto Market Value to New Record	null	0.9732
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	721	Bitcoin eyes 50K less than a month after BTC price broke its 2017 all time high	null	0.9595
37	781	Bitcoin mining is horrible for the environment Here s what we can do about it	null	-0.5423
37	961	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	961	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	901	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9886
37	901	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15 CoinDesk	null	0.9886
38	541	Bitcoin rally takes market cap of over 6 000 cryptocurrencies to whopping new high of 1 24 trillion	null	0.9918
37	1021	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud CoinDesk	null	-0.5859
37	1021	Serbian Man Extradited to US After Being Indicted in 70M Crypto Fraud	null	-0.5859
37	961	Ethereum Price Prediction ETH ready to rise to new highs following crucial rebound	null	0.9957
37	841	Thinking of Selling Stock Ask Yourself These Questions First The Motley Fool	null	-0.9509
37	781	9 great reads from CNET this week	null	0.6249
37	721	Cybersecurity An Attackers Perspective Model Portfolio Channel	null	-0.5719
37	781	New York Is Calling the Up and Comers	null	0.7906
37	721	These are the top 10 US states where Dogecoin s popularity shot up after a group of Redditors	null	0.8979
35	721	Learn About Bitcoin So You Can Intelligently Invest in Cryptocurrency	null	0.5046
36	781	Is earning Bitcoin with each swipe the credit card reward of the future These cards think so	null	0.7430
36	841	NewsWatch U S gains just 49 000 jobs in January Labor market still under acute stress	null	0.9781
35	781	Forget Bitcoin Inside the insane world of altcoin cryptocurrency trading CNET	null	-0.5574
38	661	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a	null	0.9682
37	1081	Bitcoin Rally Takes Crypto Market Value to New Record	null	0.9732
37	1321	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	781	Bitcoin eyes 50K less than a month after BTC price broke its 2017 all time high	null	0.9595
37	841	Bitcoin mining is horrible for the environment Here s what we can do about it	null	-0.5423
37	1021	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	1021	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	1321	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	961	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9886
37	961	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15 CoinDesk	null	0.9886
38	601	Bitcoin rally takes market cap of over 6 000 cryptocurrencies to whopping new high of 1 24 trillion	null	0.9918
37	1081	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud CoinDesk	null	-0.5859
37	1081	Serbian Man Extradited to US After Being Indicted in 70M Crypto Fraud	null	-0.5859
37	1021	Ethereum Price Prediction ETH ready to rise to new highs following crucial rebound	null	0.9957
37	901	Thinking of Selling Stock Ask Yourself These Questions First The Motley Fool	null	-0.9509
37	841	9 great reads from CNET this week	null	0.6249
37	781	Cybersecurity An Attackers Perspective Model Portfolio Channel	null	-0.5719
37	841	New York Is Calling the Up and Comers	null	0.7906
37	781	These are the top 10 US states where Dogecoin s popularity shot up after a group of Redditors	null	0.8979
35	721	Learn About Bitcoin So You Can Intelligently Invest in Cryptocurrency	null	0.5046
35	781	Forget Bitcoin Inside the insane world of altcoin cryptocurrency trading CNET	null	-0.5574
36	781	Is earning Bitcoin with each swipe the credit card reward of the future These cards think so	null	0.7430
36	841	NewsWatch U S gains just 49 000 jobs in January Labor market still under acute stress	null	0.9781
37	961	Bitcoin Rally Takes Crypto Market Value to New Record	null	0.9732
37	1081	Bitcoin breaks 40 000 and sets its sights on a new all time high ETH fees spike as a new price	null	0.9682
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	961	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	961	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	841	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15 CoinDesk	null	0.9886
37	841	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9886
37	1021	Why DeFi blue chips SUSHI and AAVE severely pulled back after Bitcoin rally CryptoSlate	null	0.9584
37	1201	The best business finance and retirement accounts to follow on Twitter in 2021	null	0.6369
37	841	Is PayPal Stock A Buy Right Now After Strong Q4 Earnings Here s What Earnings Charts Show	null	0.5106
37	781	Thinking of Selling Stock Ask Yourself These Questions First The Motley Fool	null	-0.9509
37	781	Thinking of Selling Stock Ask Yourself These Questions First	null	-0.9325
38	721	New York Is Calling the Up and Comers	null	0.7906
37	1	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	541	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	841	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1021	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	481	Green hackers around the world let s destroy Bitcoin	null	-0.5423
38	601	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
37	961	Bitcoin Rally Takes Crypto Market Value to New Record	null	0.9732
37	1081	Bitcoin breaks 40 000 and sets its sights on a new all time high ETH fees spike as a new price	null	0.9682
37	1021	Why DeFi blue chips SUSHI and AAVE severely pulled back after Bitcoin rally CryptoSlate	null	0.9584
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	901	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	901	Bitcoin Reclaims 40K Mark Moving Closer To All Time High	null	0.9682
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	841	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15 CoinDesk	null	0.9886
37	841	Bill Miller s Flagship Fund May Now Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9886
37	1021	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
37	1021	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
38	541	Bitcoin rally takes market cap of over 6 000 cryptocurrencies to whopping new high of 1 24 trillion	null	0.9918
37	1021	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud CoinDesk	null	-0.5859
37	1	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	541	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	841	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1021	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	481	Green hackers around the world let s destroy Bitcoin	null	-0.5423
38	601	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
37	1	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	541	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	841	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1021	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	481	Green hackers around the world let s destroy Bitcoin	null	-0.5423
38	601	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
37	1	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	541	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	841	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1021	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	481	Green hackers around the world let s destroy Bitcoin	null	-0.5423
38	601	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
37	1	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	541	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	841	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1021	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	601	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
38	841	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
38	901	Forbes Blockchain 50 Meet The Bitcoin Lovers In Corporate America	null	0.5267
38	661	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a	null	0.9682
37	1141	Bitcoin breaks 40 000 and sets its sights on a new all time high ETH fees spike as a new price	null	0.9682
38	901	German Fraudster Refuses to Give Police Passwords to 60M Bitcoin Wallet	null	-0.5423
37	1321	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	1081	Why DeFi blue chips SUSHI and AAVE severely pulled back after Bitcoin rally CryptoSlate	null	0.9584
37	1081	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
37	1081	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
38	601	Bitcoin rally takes market cap of over 6 000 cryptocurrencies to whopping new high of 1 24 trillion	null	0.9918
38	901	DOGE and XRP rally as pump and dumps sneak back into crypto markets	null	0.9601
38	301	EOS Climbs 10 08 In Bullish Trade By Investing com	null	0.9970
37	1081	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud CoinDesk	null	-0.5859
38	301	Cardano Climbs 19 82 In Rally	null	0.9682
38	301	Cardano Climbs 19 82 In Rally By Investing com	null	0.9682
38	301	Cardano Climbs 19 82 In Rally By Investing com	null	0.9682
38	301	Precious Metals Energy Weekly Review and Calendar Ahead	null	0.7003
38	301	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
38	301	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
38	301	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
37	1	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	541	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	841	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1021	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	481	Green hackers around the world let s destroy Bitcoin	null	-0.5423
38	601	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
38	841	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
38	901	Forbes Blockchain 50 Meet The Bitcoin Lovers In Corporate America	null	0.5267
38	961	Bitcoin Rally Takes Crypto Market Value to New Record	null	0.9732
38	661	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a	null	0.9682
37	1141	Bitcoin breaks 40 000 and sets its sights on a new all time high ETH fees spike as a new price	null	0.9682
38	901	German Fraudster Refuses to Give Police Passwords to 60M Bitcoin Wallet	null	-0.5423
37	1321	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	1081	Why DeFi blue chips SUSHI and AAVE severely pulled back after Bitcoin rally CryptoSlate	null	0.9584
37	1081	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
37	1081	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
38	601	Bitcoin rally takes market cap of over 6 000 cryptocurrencies to whopping new high of 1 24 trillion	null	0.9918
38	901	DOGE and XRP rally as pump and dumps sneak back into crypto markets	null	0.9601
38	301	EOS Climbs 10 08 In Bullish Trade By Investing com	null	0.9970
37	1081	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud CoinDesk	null	-0.5859
38	301	Cardano Climbs 19 82 In Rally	null	0.9682
38	301	Cardano Climbs 19 82 In Rally By Investing com	null	0.9682
38	301	Cardano Climbs 19 82 In Rally By Investing com	null	0.9682
38	301	Precious Metals Energy Weekly Review and Calendar Ahead	null	0.7003
38	301	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
38	301	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
38	301	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
37	1	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	541	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	841	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1021	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	481	Green hackers around the world let s destroy Bitcoin	null	-0.5423
38	601	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
38	841	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
38	901	Forbes Blockchain 50 Meet The Bitcoin Lovers In Corporate America	null	0.5267
38	961	Bitcoin Rally Takes Crypto Market Value to New Record	null	0.9732
38	661	Bitcoin rally incoming MicroStrategy Playbook Seminar a Smash Hit	null	0.9682
37	1081	Bitcoin breaks 40 000 and sets its sights on a new all time high ETH fees spike as a new price	null	0.9682
37	1081	Why DeFi blue chips SUSHI and AAVE severely pulled back after Bitcoin rally CryptoSlate	null	0.9584
38	841	German Fraudster Refuses to Give Police Passwords to 60M Bitcoin Wallet	null	-0.5423
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
37	1081	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
37	1081	Combined value of digital coins tops 1 2trn as Bitcoin hits 40 000 again	null	0.6908
38	541	Bitcoin rally takes market cap of over 6 000 cryptocurrencies to whopping new high of 1 24 trillion	null	0.9918
38	301	EOS Climbs 10 08 In Bullish Trade	null	0.9970
38	301	EOS Climbs 10 08 In Bullish Trade By Investing com	null	0.9970
38	961	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud CoinDesk	null	-0.5859
38	301	EOS Climbs 10 In Rally By Investing com	null	0.9682
38	301	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
38	121	Success of digital financial services rests on rural India s shift from cash to digital payments	null	0.5719
38	601	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a	null	0.9682
38	301	Cardano Climbs 19 82 In Rally	null	0.9682
38	301	Cardano Climbs 19 82 In Rally By Investing com	null	0.9682
38	301	Cardano Climbs 19 82 In Rally By Investing com	null	0.9682
38	301	Ethereum Falls 10 In Selloff By Investing com	null	-0.9997
38	301	Precious Metals Energy Weekly Review and Calendar Ahead	null	0.7003
38	301	Precious Metals Energy Weekly Review and Calendar Ahead	null	0.7003
38	301	Precious Metals Energy Weekly Review and Calendar Ahead	null	0.7003
38	301	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
38	301	Precious Metals Energy Weekly Review and Calendar Ahead By Investing com	null	0.7003
38	541	Janet Yellen Re Cryptocurrencies and Terrorists	null	-0.6249
37	1	Twitter CEO Jack Dorsey is setting up a bitcoin node CNET	null	0.7906
37	541	God Of Dogecoin It s Not Just Tesla CEO Elon Musk Pumping The Joke Bitcoin Rival s Price	null	0.5106
37	841	Bill Miller Run 2 25B Fund May Buy GBTC to Gain Bitcoin Exposure of Up to 15	null	0.9882
37	1021	Serbian Man Extradited to US After Being Indicted In 70 Million Crypto Fraud	null	-0.5859
37	1261	Bitcoin Tops 40k Mark Ether At All Time High Amid Crypto Markets Boom	null	0.9758
38	481	Green hackers around the world let s destroy Bitcoin	null	-0.5423
38	601	Dogecoin s price jumped as high as 35 after Elon Musk tweeted Dogecoin to the Moooonn in a Twitter poll on the future of crypto	null	0.9682
38	841	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
38	901	Forbes Blockchain 50 Meet The Bitcoin Lovers In Corporate America	null	0.5267
38	301	Cardano Climbs 19 82 In Rally	null	0.9682
38	301	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
37	1081	Why DeFi blue chips SUSHI and AAVE severely pulled back after Bitcoin rally CryptoSlate	null	0.9584
37	1381	Growing list of billion dollar crypto unicorns suggest the best is yet to come	null	0.7096
38	841	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
38	301	Cardano Climbs 19 82 In Rally	null	0.9682
38	301	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
37	1081	Why DeFi blue chips SUSHI and AAVE severely pulled back after Bitcoin rally CryptoSlate	null	0.9584
37	1381	Growing list of billion dollar crypto unicorns suggest the best is yet to come	null	0.7096
38	841	Beyond Doge Coin What Crypto s Are Worth Buying Besides Bitcoin	null	0.9423
39	1201	FOREX Dollar steady after Friday s U S jobs related losses bitcoin soars	null	0.9984
39	961	Bitcoin price soars How much 100 would be worth today if you had invested earlier	null	0.9985
39	1141	What is Dogecoin the joke crypto loved by Elon Musk and growing faster than Bitcoin	null	0.7783
39	1081	Explainer Elon Musk loves it So what s all the buzz about bitcoin	null	0.5719
39	1021	Bitcoin Price Predictions Where Will BTC Go After Tesla Fueled Rally	null	0.9682
39	1021	Bitcoin jumps to record high after Tesla invests 1 5B accepts cryptocurrency	null	0.9983
39	841	Bitcoin Jumps 10 to Record High on Tesla Investment News	null	0.9982
39	781	Bitcoin Hits New Record High Over 43K on Tesla News	null	0.9682
39	961	Bitcoin surges to all time high as Tesla invests 1 5B	null	0.9682
39	541	CME Ethereum futures go live Bitcoin caps its best week ever 5 things to watch this week	null	0.6369
39	901	Bitcoin jumps to record 44 000 as Tesla invests 1 5 billion	null	0.9970
39	841	Bitcoin Price Alert Tesla s 1 5B Purchase and Payment Promise Send the Crypto Soaring	null	0.9986
39	781	Bitcoin hits 43K all time high as Tesla invests 1 5 billion in BTC	null	0.9682
39	1141	Bitcoin surges to record high as Tesla announces it has invested 1 5bn and will take it as payment	null	0.9682
39	661	Bitcoin Gets Support From Mexico s Third Richest Person Billionaire Follows Elon Musk s Move	null	0.7269
39	841	Cryptocurrency live Latest as bitcoin hits new all time high after massive Tesla investment	null	0.9682
39	781	Bitcoin Soars After Elon Musk Says Tesla Invested 1 5billion in BTC	null	0.9985
39	901	Bitcoin jumps to record 44 000 as Tesla invests 1 5 billion	null	0.9970
39	1021	Bitcoin soars to all time high as Musk s Tesla says it bought 1 5 billion	null	0.9990
39	901	Bitcoin soars to all time high as Musk s Tesla says it bought 1 5 billion	null	0.9990
39	781	Bitcoin soars 15 after Tesla says will accept it as payment	null	0.9985
39	841	Bitcoin retests 40 000 as active addresses hit new all time high	null	0.9741
39	301	Tesla s Bitcoin Buy Is a Reckless Destructive Troll	null	-0.7717
39	901	Bitcoin reaches all time high after Tesla discloses 1 5 billion purchase	null	0.9690
39	1141	Tesla s Buying of Bitcoin Briefly Made Bitcoin More Valuable Than Tesla	null	0.9545
39	301	Bitcoin Has Rallied More Than 50 This Year After Hitting A Fresh High	null	0.9729
39	301	Bitcoin Soars To New High After Tesla Says It Invested 1 5 Billion	null	0.9990
39	841	Bitcoin hits record high after Tesla invests 1 5bn live updates	null	0.9682
39	781	Bitcoin spikes 13 to record high after Tesla says it invested 1 5 billion in the cryptocurrency	null	0.9682
39	301	Bitcoin Climbs 11 In Rally By Investing com	null	0.9682
39	301	As Bitcoin Hits Record High Experts Say Others Will Follow Tesla s Bitcoin Bet By Investing com	null	0.9682
39	1081	EXPLAINER Elon Musk loves it So what s all the buzz about bitcoin	null	0.5719
39	841	Bitcoin jumps 10 to record high on Tesla investment news	null	0.9982
39	1021	Bitcoin reaches all time high of 44 000 following Tesla s 1 5 billion investment	null	0.9690
39	901	Bitcoin reaches all time high after Tesla discloses 1 5 billion purchase	null	0.9690
39	301	Bitcoin Climbs 11 42 In Bullish Trade	null	0.9970
39	781	UPDATE 1 Bitcoin jumps 10 to record high on Tesla investment news	null	0.9982
39	781	Bitcoin jumps 10 to record high on Tesla investment news	null	0.9982
39	1081	EXPLAINER Elon Musk loves it So what s all the buzz about bitcoin	null	0.5719
39	1021	Tesla buys 1 5 billion in bitcoin sending its price soaring	null	0.9985
39	781	Tesla buys 1 5 billion in bitcoin as Elon Musk jumps on board with cryptocurrency	null	0.9970
39	1021	Legendary investor Bill Miller has set up his flagship fund to buy into Grayscale Bitcoin Trust	null	0.8934
39	901	Tesla Buys 1 5 Billion in Bitcoin Sending Its Price Soaring	null	0.9985
39	901	Tesla Buys 1 5 Billion in Bitcoin Sending Its Price Soaring	null	0.9985
39	781	Tesla TSLA buys 1 5B in bitcoin pushing the crypto to all time high plans to accept as payment	null	0.9738
39	841	Tesla Sends Bitcoin Mooning Past 44K as Snoop Wins dogebowl CoinDesk	null	0.5719
39	1021	Tesla buys 1 5 billion in bitcoin sending its price soaring	null	0.9985
39	301	Tesla invests 1 5 billion in Bitcoin as Elon Musk praises cryptocurrencies	null	0.5267
39	1081	Elon Musk s big Bitcoin buy may have been to distract from bad Tesla news	null	-0.6908
39	1021	Dow Jones Rises To Record High As Tesla Buys Bitcoin Market Rally Warning Signs	null	0.9910
39	901	Elon Musk s Latest Move Sends Bitcoin Soaring	null	0.9985
39	661	GameStop s Plunge Could Spill Over Into Bitcoin	null	-0.9988
39	901	Tesla Buys 1 5 Billion in Bitcoin Sending Its Price Soaring	null	0.9985
39	901	Tesla Buys 1 5 Billion in Bitcoin Sending Its Price Soaring	null	0.9985
39	1081	Tesla Buying Bitcoin Is Bullish for Both TSLA Stock BTC	null	0.9979
39	541	Children s Charity Creates Bitcoin Superhero to Attract Crypto Donations CoinDesk	null	0.7506
39	721	Stock market news live updates Stocks rise to reach record highs Bitcoin prices spike	null	0.9819
39	961	Tesla invests 1 5 billion in bitcoin sending the price soaring to new heights	null	0.9985
39	1081	Square Stock Hits All Time High As Tesla Purchase Sends Bitcoin Price Soaring	null	0.9990
39	1201	Dow Jones Rises For Sixth Straight Session As Disney Stock Breaks Out Tesla Bullish On Bitcoin	null	0.9971
39	781	Tesla Buys 1 5 Billion Worth of Bitcoin May Accept the Cryptocurrency as Payment in the Future	null	0.5423
39	301	Tesla sends bitcoin soaring with 1 5 billion investment payment promise By Reuters	null	0.9985
39	1201	Square gains 10 as the payments company rides bitcoin s record breaking rise	null	0.9953
39	1081	Tesla buying 1 5 billion in bitcoin opens the company up to further scrutiny	null	0.9682
39	421	Bill Miller to Allow Opportunity Fund to Buy Into Bitcoin Trust	null	0.7906
39	301	Wall Street Opens Higher Tesla Bitcoin Buzz Helps Dow up By Investing com	null	0.8625
39	301	Wall Street Opens Higher Tesla Bitcoin Buzz Helps Dow up By Investing com	null	0.8625
39	781	Tesla buys 1 5 billion worth of bitcoin says may accept it for payment for products in the near	null	0.5423
39	781	Tesla buys 1 5 billion worth of bitcoin says may accept it for payment for products in the near	null	0.5423
39	361	Elon Musk Says Dogecoin s High Supply Relative To Bitcoin Can Actually Be An Advantage	null	0.9719
39	841	India Mulls Ordinance Route To Ban Cryptocurrencies	null	-0.5574
39	661	US stocks close at record highs as stimulus optimism continues	null	0.5423
39	901	Wall Street opens higher continuing win streak	null	0.5859
39	301	Indian parliament fast tracks bill to ban bitcoin and other cryptocurrencies By BTC Peers	null	-0.5574
39	421	Stocks open higher on Wall Street continuing strong streak	null	0.5106
39	901	Stocks open higher on Wall Street continuing strong streak	null	0.5106
39	721	Wall Street hits all time closing highs on stimulus euphoria vaccine rollout	null	0.6486
39	721	Wall Street hits all time closing highs on stimulus euphoria vaccine rollout	null	0.6486
39	421	Stocks push to more gains and record highs on Wall Street	null	0.9823
38	481	Green hackers around the world let s destroy Bitcoin	null	-0.5423
39	841	Bitcoin jumps 10 to record high on Tesla investment news Reuters	null	0.9982
39	901	Bitcoin hits record highs as Tesla jumps in but it s also great news for gold price Kitco NEWS	null	0.9916
39	901	Bitcoin Spikes 16 To Record High After Tesla Says It Invested 1 5 Billion in the Cryptocurrency and Will Begin Accepting It as Payment	null	0.9738
39	1021	EXPLAINER Elon Musk loves it So what s all the buzz about bitcoin Reuters	null	0.5719
39	1261	US STOCKS Wall Street hits all time closing highs on stimulus euphoria vaccine rollout Reuters	null	0.6486
40	541	Bitcoin price hits new all time high taking market cap value above Facebook and Tesla	null	0.9732
40	541	BREAKING Bitcoin pushes past 48 000 to new record high	null	0.9682
40	541	A Tesla for a bitcoin Musk drives up cryptocurrency price with 1 5 billion purchase	null	0.7906
40	1141	Bitcoin investors From buying a Bentley to losing it all	null	0.9081
40	1201	Here s Why Bitcoin Stocks Are Soaring Today	null	0.9985
41	421	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
41	361	Bitcoin soars 15 after Tesla says will accept it as payment	null	0.9985
40	1201	Legit Way to Play the Bitcoin Rally	null	0.9732
40	901	Bitcoin hits another record high after Tesla s 1 5 billion buy in	null	0.9682
41	181	Bitcoin Late January Breakout Held Now On Its Way To 50K Investing com	null	0.9325
40	1201	Bitcoin Driven Higher by TWAP Buying as Price Stabilizes at All Time Highs	null	0.9325
40	721	Bitcoin rockets to record high of 48 000 after Elon Musk s Tesla buys up 1 5 billion with one	null	0.9818
40	721	Bitcoin Could Rally Further as Tesla Leads Corporates on Treasury Investments CoinDesk	null	0.9712
40	841	Bitcoin s Tesla Driven Rally Fizzles After Prices Hit 48 000	null	0.9682
40	961	Bitcoin soars to new highs and oil jumps as outlook brightens with US stocks set to slip as markets	null	0.9995
40	721	Bitcoin Could Rally Further as Tesla Leads Corporates on Treasury Investments	null	0.9712
40	1201	Bitcoin Can t Be Stopped Nigerians Look to P2P Exchanges After Crypto Ban	null	-0.6705
40	1021	Bitcoin Miner Riot Blockchain Names Jason Les CEO	null	-0.5574
40	1381	Bitcoin soars above 48 000 to new record after Tesla s 1 5 billion investment CNBC After Hours	null	0.9985
40	1321	With Elon Musk at the wheel Bitcoin hits 95 on the 100 point extreme fear to extreme greed index	null	-0.7096
40	1381	The Bitcoin rally isn t enough to dethrone the mighty dollar NewsChannel 3 12	null	0.9682
40	1201	Here s Why Bitcoin Stocks Are Soaring Today The Motley Fool	null	0.9984
41	301	Musk s bitcoin bet fuels gains in companies already invested By Reuters	null	0.9818
41	301	Musk s bitcoin bet fuels gains in companies already invested By Reuters	null	0.9818
40	1321	The Bitcoin rally isn t enough to dethrone the mighty dollar	null	0.9682
40	781	Elon Musk s 1 5bn Bitcoin investment triggers record high as Dogecoin rockets	null	0.9682
40	1261	Tesla Will Accept Bitcoin for Cars Buys 1 5 Billion Worth of the Cryptocurrency	null	0.5423
40	841	How Long Will the Tesla Driven Bitcoin Rally Last	null	0.9682
40	1381	The Bitcoin rally isn t enough to dethrone the mighty dollar KION546	null	0.9682
40	1081	BlockFi s Bitcoin Trust Takes Aim at GBTC CoinDesk	null	0.5106
41	181	Former MP Central Banks Should Ban Bitcoin	null	-0.5574
41	121	Dollar wallows at two week low bitcoin steadies after surge past 48 000	null	-0.9682
40	1081	BlockFi s Bitcoin Trust Takes Aim at GBTC	null	0.5106
40	1261	ETFs to Ride the Tesla Driven Bitcoin Rally	null	0.9682
40	901	Cryptocurrency Related Stocks Soar as Bitcoin Hits Record High	null	0.9682
40	1021	Forget Bitcoin Buy PayPal and Square Instead The Motley Fool	null	-0.5859
40	1261	FOREX U S dollar drops to two week low bitcoin eyes 50 000	null	-0.9682
41	361	Musk s Bitcoin Bet Fuels Gains in Companies Already Invested	null	0.9818
41	181	Reddit User Who Leaked Tesla s Bitcoin Investment News Was Just High	null	0.9623
40	1381	Ethereum Surpasses Bitcoin To Become Largest Network For Trustless Money Settlement	null	-0.5106
40	1081	GLOBAL MARKETS Stocks mostly ease off record highs bitcoin rise again	null	0.9842
41	181	Reddit User Who Leaked Tesla s Bitcoin Investment News Was Just High	null	0.9623
40	1261	Former British MP says central banks should ban Bitcoin	null	-0.5574
41	301	Musk s bitcoin bet fuels gains in companies already invested By Reuters	null	0.9818
41	361	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
40	1381	Ethereum Surpasses Bitcoin To Become Largest Network For Trustless Money Settlement	null	-0.5106
40	1081	Woman Charged In Failed Murder For Hire Plot Using Bitcoin	null	-0.8689
41	301	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
41	301	Musk s bitcoin bet fuels gains in companies already invested	null	0.9818
40	1021	Wisconsin woman allegedly paid in bitcoin for murder for hire on dark web	null	-0.6908
41	361	Why This Tesla Bitcoin Marriage Won t Live Up To The Hype Investing com	null	0.8934
41	301	Dollar wallows at two week low bitcoin steadies after surge past 48 000 By Reuters	null	-0.9682
40	841	Before Tesla s bitcoin play this company bought first and may have inspired Elon Musk	null	0.6808
40	1081	Woman Charged In Failed Murder For Hire Plot Using Bitcoin	null	-0.8689
40	1081	Woman Charged In Failed Murder For Hire Plot Using Bitcoin	null	-0.8689
40	841	Will other companies follow Tesla s lead and load up on Bitcoin	null	0.7906
40	721	Tesla s 1 5 billion bitcoin investment is already up 37 as regulatory scrutiny ratchets up	null	0.9325
40	721	Tesla s 1 5 billion bitcoin investment is already up 37 as regulatory scrutiny ratchets up	null	0.9325
41	361	Business Report GTA 1M homes Bitcoin tops 48K overnight thanks to Elon Twitter earnings	null	0.7351
40	1021	Tesla insider leaked huge bitcoin investment on Reddit over a month ago but was laughed at	null	0.6124
40	1	Bitcoin extends gains above 47 000 in Asia Reuters	null	0.9826
40	1	Bitcoin extends gains above 47 000 in Asia Reuters	null	0.9826
40	361	GLOBAL MARKETS Stocks oil rise in Asia after U S records dollar weakens Reuters	null	0.9792
40	661	Tesla s 1 5 billion bitcoin investment is already up 37 as regulatory scrutiny ratchets up Yahoo Canada Finance	null	0.9325
40	661	FOREX Dollar struggles as U S yields soften Bitcoin soars Reuters	null	0.9984
41	361	Musk s bitcoin bet fuels gains in companies already invested Reuters	null	0.9818
41	361	Musk s bitcoin bet fuels gains in companies already invested Reuters	null	0.9818
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add question	1	add_question
2	Can change question	1	change_question
3	Can delete question	1	delete_question
4	Can view question	1	view_question
5	Can add choice	2	add_choice
6	Can change choice	2	change_choice
7	Can delete choice	2	delete_choice
8	Can view choice	2	view_choice
9	Can add log entry	3	add_logentry
10	Can change log entry	3	change_logentry
11	Can delete log entry	3	delete_logentry
12	Can view log entry	3	view_logentry
13	Can add permission	4	add_permission
14	Can change permission	4	change_permission
15	Can delete permission	4	delete_permission
16	Can view permission	4	view_permission
17	Can add group	5	add_group
18	Can change group	5	change_group
19	Can delete group	5	delete_group
20	Can view group	5	view_group
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add content type	7	add_contenttype
26	Can change content type	7	change_contenttype
27	Can delete content type	7	delete_contenttype
28	Can view content type	7	view_contenttype
29	Can add session	8	add_session
30	Can change session	8	change_session
31	Can delete session	8	delete_session
32	Can view session	8	view_session
33	Can add profile	9	add_profile
34	Can change profile	9	change_profile
35	Can delete profile	9	delete_profile
36	Can view profile	9	view_profile
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$Y4epOnJrQeKo$Q1m7j3ZvfIa6M7liIi9XQT727J82unAmzHQuNJ/LBQw=	2021-02-16 12:34:25.919796+00	t	rmacw				t	t	2021-02-16 12:27:34.534149+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: date_dim; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.date_dim (dateid, full_date, dd, mm, yy) FROM stdin;
1	01/01/2021	1	1	2021
2	02/01/2021	2	1	2021
3	03/01/2021	3	1	2021
4	04/01/2021	4	1	2021
5	05/01/2021	5	1	2021
6	06/01/2021	6	1	2021
7	07/01/2021	7	1	2021
8	08/01/2021	8	1	2021
9	09/01/2021	9	1	2021
10	10/01/2021	10	1	2021
11	11/01/2021	11	1	2021
12	12/01/2021	12	1	2021
13	13/01/2021	13	1	2021
14	14/01/2021	14	1	2021
15	15/01/2021	15	1	2021
16	16/01/2021	16	1	2021
17	17/01/2021	17	1	2021
18	18/01/2021	18	1	2021
19	19/01/2021	19	1	2021
20	20/01/2021	20	1	2021
21	21/01/2021	21	1	2021
22	22/01/2021	22	1	2021
23	23/01/2021	23	1	2021
24	24/01/2021	24	1	2021
25	25/01/2021	25	1	2021
26	26/01/2021	26	1	2021
27	27/01/2021	27	1	2021
28	28/01/2021	28	1	2021
29	29/01/2021	29	1	2021
30	30/01/2021	30	1	2021
31	31/01/2021	31	1	2021
32	01/02/2021	1	2	2021
33	02/02/2021	2	2	2021
34	03/02/2021	3	2	2021
35	04/02/2021	4	2	2021
36	05/02/2021	5	2	2021
37	06/02/2021	6	2	2021
38	07/02/2021	7	2	2021
39	08/02/2021	8	2	2021
40	09/02/2021	9	2	2021
41	10/02/2021	10	2	2021
42	11/02/2021	11	2	2021
43	12/02/2021	12	2	2021
44	13/02/2021	13	2	2021
45	14/02/2021	14	2	2021
46	15/02/2021	15	2	2021
47	16/02/2021	16	2	2021
48	17/02/2021	17	2	2021
49	18/02/2021	18	2	2021
50	19/02/2021	19	2	2021
51	20/02/2021	20	2	2021
52	21/02/2021	21	2	2021
53	22/02/2021	22	2	2021
54	23/02/2021	23	2	2021
55	24/02/2021	24	2	2021
56	25/02/2021	25	2	2021
57	26/02/2021	26	2	2021
58	27/02/2021	27	2	2021
59	28/02/2021	28	2	2021
60	01/03/2021	1	3	2021
61	02/03/2021	2	3	2021
62	03/03/2021	3	3	2021
63	04/03/2021	4	3	2021
64	05/03/2021	5	3	2021
65	06/03/2021	6	3	2021
66	07/03/2021	7	3	2021
67	08/03/2021	8	3	2021
68	09/03/2021	9	3	2021
69	10/03/2021	10	3	2021
70	11/03/2021	11	3	2021
71	12/03/2021	12	3	2021
72	13/03/2021	13	3	2021
73	14/03/2021	14	3	2021
74	15/03/2021	15	3	2021
75	16/03/2021	16	3	2021
76	17/03/2021	17	3	2021
77	18/03/2021	18	3	2021
78	19/03/2021	19	3	2021
79	20/03/2021	20	3	2021
80	21/03/2021	21	3	2021
81	22/03/2021	22	3	2021
82	23/03/2021	23	3	2021
83	24/03/2021	24	3	2021
84	25/03/2021	25	3	2021
85	26/03/2021	26	3	2021
86	27/03/2021	27	3	2021
87	28/03/2021	28	3	2021
88	29/03/2021	29	3	2021
89	30/03/2021	30	3	2021
90	31/03/2021	31	3	2021
91	01/04/2021	1	4	2021
92	02/04/2021	2	4	2021
93	03/04/2021	3	4	2021
94	04/04/2021	4	4	2021
95	05/04/2021	5	4	2021
96	06/04/2021	6	4	2021
97	07/04/2021	7	4	2021
98	08/04/2021	8	4	2021
99	09/04/2021	9	4	2021
100	10/04/2021	10	4	2021
101	11/04/2021	11	4	2021
102	12/04/2021	12	4	2021
103	13/04/2021	13	4	2021
104	14/04/2021	14	4	2021
105	15/04/2021	15	4	2021
106	16/04/2021	16	4	2021
107	17/04/2021	17	4	2021
108	18/04/2021	18	4	2021
109	19/04/2021	19	4	2021
110	20/04/2021	20	4	2021
111	21/04/2021	21	4	2021
112	22/04/2021	22	4	2021
113	23/04/2021	23	4	2021
114	24/04/2021	24	4	2021
115	25/04/2021	25	4	2021
116	26/04/2021	26	4	2021
117	27/04/2021	27	4	2021
118	28/04/2021	28	4	2021
119	29/04/2021	29	4	2021
120	30/04/2021	30	4	2021
121	01/05/2021	1	5	2021
122	02/05/2021	2	5	2021
123	03/05/2021	3	5	2021
124	04/05/2021	4	5	2021
125	05/05/2021	5	5	2021
126	06/05/2021	6	5	2021
127	07/05/2021	7	5	2021
128	08/05/2021	8	5	2021
129	09/05/2021	9	5	2021
130	10/05/2021	10	5	2021
131	11/05/2021	11	5	2021
132	12/05/2021	12	5	2021
133	13/05/2021	13	5	2021
134	14/05/2021	14	5	2021
135	15/05/2021	15	5	2021
136	16/05/2021	16	5	2021
137	17/05/2021	17	5	2021
138	18/05/2021	18	5	2021
139	19/05/2021	19	5	2021
140	20/05/2021	20	5	2021
141	21/05/2021	21	5	2021
142	22/05/2021	22	5	2021
143	23/05/2021	23	5	2021
144	24/05/2021	24	5	2021
145	25/05/2021	25	5	2021
146	26/05/2021	26	5	2021
147	27/05/2021	27	5	2021
148	28/05/2021	28	5	2021
149	29/05/2021	29	5	2021
150	30/05/2021	30	5	2021
151	31/05/2021	31	5	2021
152	01/06/2021	1	6	2021
153	02/06/2021	2	6	2021
154	03/06/2021	3	6	2021
155	04/06/2021	4	6	2021
156	05/06/2021	5	6	2021
157	06/06/2021	6	6	2021
158	07/06/2021	7	6	2021
159	08/06/2021	8	6	2021
160	09/06/2021	9	6	2021
161	10/06/2021	10	6	2021
162	11/06/2021	11	6	2021
163	12/06/2021	12	6	2021
164	13/06/2021	13	6	2021
165	14/06/2021	14	6	2021
166	15/06/2021	15	6	2021
167	16/06/2021	16	6	2021
168	17/06/2021	17	6	2021
169	18/06/2021	18	6	2021
170	19/06/2021	19	6	2021
171	20/06/2021	20	6	2021
172	21/06/2021	21	6	2021
173	22/06/2021	22	6	2021
174	23/06/2021	23	6	2021
175	24/06/2021	24	6	2021
176	25/06/2021	25	6	2021
177	26/06/2021	26	6	2021
178	27/06/2021	27	6	2021
179	28/06/2021	28	6	2021
180	29/06/2021	29	6	2021
181	30/06/2021	30	6	2021
182	01/07/2021	1	7	2021
183	02/07/2021	2	7	2021
184	03/07/2021	3	7	2021
185	04/07/2021	4	7	2021
186	05/07/2021	5	7	2021
187	06/07/2021	6	7	2021
188	07/07/2021	7	7	2021
189	08/07/2021	8	7	2021
190	09/07/2021	9	7	2021
191	10/07/2021	10	7	2021
192	11/07/2021	11	7	2021
193	12/07/2021	12	7	2021
194	13/07/2021	13	7	2021
195	14/07/2021	14	7	2021
196	15/07/2021	15	7	2021
197	16/07/2021	16	7	2021
198	17/07/2021	17	7	2021
199	18/07/2021	18	7	2021
200	19/07/2021	19	7	2021
201	20/07/2021	20	7	2021
202	21/07/2021	21	7	2021
203	22/07/2021	22	7	2021
204	23/07/2021	23	7	2021
205	24/07/2021	24	7	2021
206	25/07/2021	25	7	2021
207	26/07/2021	26	7	2021
208	27/07/2021	27	7	2021
209	28/07/2021	28	7	2021
210	29/07/2021	29	7	2021
211	30/07/2021	30	7	2021
212	31/07/2021	31	7	2021
213	01/08/2021	1	8	2021
214	02/08/2021	2	8	2021
215	03/08/2021	3	8	2021
216	04/08/2021	4	8	2021
217	05/08/2021	5	8	2021
218	06/08/2021	6	8	2021
219	07/08/2021	7	8	2021
220	08/08/2021	8	8	2021
221	09/08/2021	9	8	2021
222	10/08/2021	10	8	2021
223	11/08/2021	11	8	2021
224	12/08/2021	12	8	2021
225	13/08/2021	13	8	2021
226	14/08/2021	14	8	2021
227	15/08/2021	15	8	2021
228	16/08/2021	16	8	2021
229	17/08/2021	17	8	2021
230	18/08/2021	18	8	2021
231	19/08/2021	19	8	2021
232	20/08/2021	20	8	2021
233	21/08/2021	21	8	2021
234	22/08/2021	22	8	2021
235	23/08/2021	23	8	2021
236	24/08/2021	24	8	2021
237	25/08/2021	25	8	2021
238	26/08/2021	26	8	2021
239	27/08/2021	27	8	2021
240	28/08/2021	28	8	2021
241	29/08/2021	29	8	2021
242	30/08/2021	30	8	2021
243	31/08/2021	31	8	2021
244	01/09/2021	1	9	2021
245	02/09/2021	2	9	2021
246	03/09/2021	3	9	2021
247	04/09/2021	4	9	2021
248	05/09/2021	5	9	2021
249	06/09/2021	6	9	2021
250	07/09/2021	7	9	2021
251	08/09/2021	8	9	2021
252	09/09/2021	9	9	2021
253	10/09/2021	10	9	2021
254	11/09/2021	11	9	2021
255	12/09/2021	12	9	2021
256	13/09/2021	13	9	2021
257	14/09/2021	14	9	2021
258	15/09/2021	15	9	2021
259	16/09/2021	16	9	2021
260	17/09/2021	17	9	2021
261	18/09/2021	18	9	2021
262	19/09/2021	19	9	2021
263	20/09/2021	20	9	2021
264	21/09/2021	21	9	2021
265	22/09/2021	22	9	2021
266	23/09/2021	23	9	2021
267	24/09/2021	24	9	2021
268	25/09/2021	25	9	2021
269	26/09/2021	26	9	2021
270	27/09/2021	27	9	2021
271	28/09/2021	28	9	2021
272	29/09/2021	29	9	2021
273	30/09/2021	30	9	2021
274	01/10/2021	1	10	2021
275	02/10/2021	2	10	2021
276	03/10/2021	3	10	2021
277	04/10/2021	4	10	2021
278	05/10/2021	5	10	2021
279	06/10/2021	6	10	2021
280	07/10/2021	7	10	2021
281	08/10/2021	8	10	2021
282	09/10/2021	9	10	2021
283	10/10/2021	10	10	2021
284	11/10/2021	11	10	2021
285	12/10/2021	12	10	2021
286	13/10/2021	13	10	2021
287	14/10/2021	14	10	2021
288	15/10/2021	15	10	2021
289	16/10/2021	16	10	2021
290	17/10/2021	17	10	2021
291	18/10/2021	18	10	2021
292	19/10/2021	19	10	2021
293	20/10/2021	20	10	2021
294	21/10/2021	21	10	2021
295	22/10/2021	22	10	2021
296	23/10/2021	23	10	2021
297	24/10/2021	24	10	2021
298	25/10/2021	25	10	2021
299	26/10/2021	26	10	2021
300	27/10/2021	27	10	2021
301	28/10/2021	28	10	2021
302	29/10/2021	29	10	2021
303	30/10/2021	30	10	2021
304	31/10/2021	31	10	2021
305	01/11/2021	1	11	2021
306	02/11/2021	2	11	2021
307	03/11/2021	3	11	2021
308	04/11/2021	4	11	2021
309	05/11/2021	5	11	2021
310	06/11/2021	6	11	2021
311	07/11/2021	7	11	2021
312	08/11/2021	8	11	2021
313	09/11/2021	9	11	2021
314	10/11/2021	10	11	2021
315	11/11/2021	11	11	2021
316	12/11/2021	12	11	2021
317	13/11/2021	13	11	2021
318	14/11/2021	14	11	2021
319	15/11/2021	15	11	2021
320	16/11/2021	16	11	2021
321	17/11/2021	17	11	2021
322	18/11/2021	18	11	2021
323	19/11/2021	19	11	2021
324	20/11/2021	20	11	2021
325	21/11/2021	21	11	2021
326	22/11/2021	22	11	2021
327	23/11/2021	23	11	2021
328	24/11/2021	24	11	2021
329	25/11/2021	25	11	2021
330	26/11/2021	26	11	2021
331	27/11/2021	27	11	2021
332	28/11/2021	28	11	2021
333	29/11/2021	29	11	2021
334	30/11/2021	30	11	2021
335	01/12/2021	1	12	2021
336	02/12/2021	2	12	2021
337	03/12/2021	3	12	2021
338	04/12/2021	4	12	2021
339	05/12/2021	5	12	2021
340	06/12/2021	6	12	2021
341	07/12/2021	7	12	2021
342	08/12/2021	8	12	2021
343	09/12/2021	9	12	2021
344	10/12/2021	10	12	2021
345	11/12/2021	11	12	2021
346	12/12/2021	12	12	2021
347	13/12/2021	13	12	2021
348	14/12/2021	14	12	2021
349	15/12/2021	15	12	2021
350	16/12/2021	16	12	2021
351	17/12/2021	17	12	2021
352	18/12/2021	18	12	2021
353	19/12/2021	19	12	2021
354	20/12/2021	20	12	2021
355	21/12/2021	21	12	2021
356	22/12/2021	22	12	2021
357	23/12/2021	23	12	2021
358	24/12/2021	24	12	2021
359	25/12/2021	25	12	2021
360	26/12/2021	26	12	2021
361	27/12/2021	27	12	2021
362	28/12/2021	28	12	2021
363	29/12/2021	29	12	2021
364	30/12/2021	30	12	2021
365	31/12/2021	31	12	2021
366	01/01/2022	1	1	2022
367	02/01/2022	2	1	2022
368	03/01/2022	3	1	2022
369	04/01/2022	4	1	2022
370	05/01/2022	5	1	2022
371	06/01/2022	6	1	2022
372	07/01/2022	7	1	2022
373	08/01/2022	8	1	2022
374	09/01/2022	9	1	2022
375	10/01/2022	10	1	2022
376	11/01/2022	11	1	2022
377	12/01/2022	12	1	2022
378	13/01/2022	13	1	2022
379	14/01/2022	14	1	2022
380	15/01/2022	15	1	2022
381	16/01/2022	16	1	2022
382	17/01/2022	17	1	2022
383	18/01/2022	18	1	2022
384	19/01/2022	19	1	2022
385	20/01/2022	20	1	2022
386	21/01/2022	21	1	2022
387	22/01/2022	22	1	2022
388	23/01/2022	23	1	2022
389	24/01/2022	24	1	2022
390	25/01/2022	25	1	2022
391	26/01/2022	26	1	2022
392	27/01/2022	27	1	2022
393	28/01/2022	28	1	2022
394	29/01/2022	29	1	2022
395	30/01/2022	30	1	2022
396	31/01/2022	31	1	2022
397	01/02/2022	1	2	2022
398	02/02/2022	2	2	2022
399	03/02/2022	3	2	2022
400	04/02/2022	4	2	2022
401	05/02/2022	5	2	2022
402	06/02/2022	6	2	2022
403	07/02/2022	7	2	2022
404	08/02/2022	8	2	2022
405	09/02/2022	9	2	2022
406	10/02/2022	10	2	2022
407	11/02/2022	11	2	2022
408	12/02/2022	12	2	2022
409	13/02/2022	13	2	2022
410	14/02/2022	14	2	2022
411	15/02/2022	15	2	2022
412	16/02/2022	16	2	2022
413	17/02/2022	17	2	2022
414	18/02/2022	18	2	2022
415	19/02/2022	19	2	2022
416	20/02/2022	20	2	2022
417	21/02/2022	21	2	2022
418	22/02/2022	22	2	2022
419	23/02/2022	23	2	2022
420	24/02/2022	24	2	2022
421	25/02/2022	25	2	2022
422	26/02/2022	26	2	2022
423	27/02/2022	27	2	2022
424	28/02/2022	28	2	2022
425	01/03/2022	1	3	2022
426	02/03/2022	2	3	2022
427	03/03/2022	3	3	2022
428	04/03/2022	4	3	2022
429	05/03/2022	5	3	2022
430	06/03/2022	6	3	2022
431	07/03/2022	7	3	2022
432	08/03/2022	8	3	2022
433	09/03/2022	9	3	2022
434	10/03/2022	10	3	2022
435	11/03/2022	11	3	2022
436	12/03/2022	12	3	2022
437	13/03/2022	13	3	2022
438	14/03/2022	14	3	2022
439	15/03/2022	15	3	2022
440	16/03/2022	16	3	2022
441	17/03/2022	17	3	2022
442	18/03/2022	18	3	2022
443	19/03/2022	19	3	2022
444	20/03/2022	20	3	2022
445	21/03/2022	21	3	2022
446	22/03/2022	22	3	2022
447	23/03/2022	23	3	2022
448	24/03/2022	24	3	2022
449	25/03/2022	25	3	2022
450	26/03/2022	26	3	2022
451	27/03/2022	27	3	2022
452	28/03/2022	28	3	2022
453	29/03/2022	29	3	2022
454	30/03/2022	30	3	2022
455	31/03/2022	31	3	2022
456	01/04/2022	1	4	2022
457	02/04/2022	2	4	2022
458	03/04/2022	3	4	2022
459	04/04/2022	4	4	2022
460	05/04/2022	5	4	2022
461	06/04/2022	6	4	2022
462	07/04/2022	7	4	2022
463	08/04/2022	8	4	2022
464	09/04/2022	9	4	2022
465	10/04/2022	10	4	2022
466	11/04/2022	11	4	2022
467	12/04/2022	12	4	2022
468	13/04/2022	13	4	2022
469	14/04/2022	14	4	2022
470	15/04/2022	15	4	2022
471	16/04/2022	16	4	2022
472	17/04/2022	17	4	2022
473	18/04/2022	18	4	2022
474	19/04/2022	19	4	2022
475	20/04/2022	20	4	2022
476	21/04/2022	21	4	2022
477	22/04/2022	22	4	2022
478	23/04/2022	23	4	2022
479	24/04/2022	24	4	2022
480	25/04/2022	25	4	2022
481	26/04/2022	26	4	2022
482	27/04/2022	27	4	2022
483	28/04/2022	28	4	2022
484	29/04/2022	29	4	2022
485	30/04/2022	30	4	2022
486	01/05/2022	1	5	2022
487	02/05/2022	2	5	2022
488	03/05/2022	3	5	2022
489	04/05/2022	4	5	2022
490	05/05/2022	5	5	2022
491	06/05/2022	6	5	2022
492	07/05/2022	7	5	2022
493	08/05/2022	8	5	2022
494	09/05/2022	9	5	2022
495	10/05/2022	10	5	2022
496	11/05/2022	11	5	2022
497	12/05/2022	12	5	2022
498	13/05/2022	13	5	2022
499	14/05/2022	14	5	2022
500	15/05/2022	15	5	2022
501	16/05/2022	16	5	2022
502	17/05/2022	17	5	2022
503	18/05/2022	18	5	2022
504	19/05/2022	19	5	2022
505	20/05/2022	20	5	2022
506	21/05/2022	21	5	2022
507	22/05/2022	22	5	2022
508	23/05/2022	23	5	2022
509	24/05/2022	24	5	2022
510	25/05/2022	25	5	2022
511	26/05/2022	26	5	2022
512	27/05/2022	27	5	2022
513	28/05/2022	28	5	2022
514	29/05/2022	29	5	2022
515	30/05/2022	30	5	2022
516	31/05/2022	31	5	2022
517	01/06/2022	1	6	2022
518	02/06/2022	2	6	2022
519	03/06/2022	3	6	2022
520	04/06/2022	4	6	2022
521	05/06/2022	5	6	2022
522	06/06/2022	6	6	2022
523	07/06/2022	7	6	2022
524	08/06/2022	8	6	2022
525	09/06/2022	9	6	2022
526	10/06/2022	10	6	2022
527	11/06/2022	11	6	2022
528	12/06/2022	12	6	2022
529	13/06/2022	13	6	2022
530	14/06/2022	14	6	2022
531	15/06/2022	15	6	2022
532	16/06/2022	16	6	2022
533	17/06/2022	17	6	2022
534	18/06/2022	18	6	2022
535	19/06/2022	19	6	2022
536	20/06/2022	20	6	2022
537	21/06/2022	21	6	2022
538	22/06/2022	22	6	2022
539	23/06/2022	23	6	2022
540	24/06/2022	24	6	2022
541	25/06/2022	25	6	2022
542	26/06/2022	26	6	2022
543	27/06/2022	27	6	2022
544	28/06/2022	28	6	2022
545	29/06/2022	29	6	2022
546	30/06/2022	30	6	2022
547	01/07/2022	1	7	2022
548	02/07/2022	2	7	2022
549	03/07/2022	3	7	2022
550	04/07/2022	4	7	2022
551	05/07/2022	5	7	2022
552	06/07/2022	6	7	2022
553	07/07/2022	7	7	2022
554	08/07/2022	8	7	2022
555	09/07/2022	9	7	2022
556	10/07/2022	10	7	2022
557	11/07/2022	11	7	2022
558	12/07/2022	12	7	2022
559	13/07/2022	13	7	2022
560	14/07/2022	14	7	2022
561	15/07/2022	15	7	2022
562	16/07/2022	16	7	2022
563	17/07/2022	17	7	2022
564	18/07/2022	18	7	2022
565	19/07/2022	19	7	2022
566	20/07/2022	20	7	2022
567	21/07/2022	21	7	2022
568	22/07/2022	22	7	2022
569	23/07/2022	23	7	2022
570	24/07/2022	24	7	2022
571	25/07/2022	25	7	2022
572	26/07/2022	26	7	2022
573	27/07/2022	27	7	2022
574	28/07/2022	28	7	2022
575	29/07/2022	29	7	2022
576	30/07/2022	30	7	2022
577	31/07/2022	31	7	2022
578	01/08/2022	1	8	2022
579	02/08/2022	2	8	2022
580	03/08/2022	3	8	2022
581	04/08/2022	4	8	2022
582	05/08/2022	5	8	2022
583	06/08/2022	6	8	2022
584	07/08/2022	7	8	2022
585	08/08/2022	8	8	2022
586	09/08/2022	9	8	2022
587	10/08/2022	10	8	2022
588	11/08/2022	11	8	2022
589	12/08/2022	12	8	2022
590	13/08/2022	13	8	2022
591	14/08/2022	14	8	2022
592	15/08/2022	15	8	2022
593	16/08/2022	16	8	2022
594	17/08/2022	17	8	2022
595	18/08/2022	18	8	2022
596	19/08/2022	19	8	2022
597	20/08/2022	20	8	2022
598	21/08/2022	21	8	2022
599	22/08/2022	22	8	2022
600	23/08/2022	23	8	2022
601	24/08/2022	24	8	2022
602	25/08/2022	25	8	2022
603	26/08/2022	26	8	2022
604	27/08/2022	27	8	2022
605	28/08/2022	28	8	2022
606	29/08/2022	29	8	2022
607	30/08/2022	30	8	2022
608	31/08/2022	31	8	2022
609	01/09/2022	1	9	2022
610	02/09/2022	2	9	2022
611	03/09/2022	3	9	2022
612	04/09/2022	4	9	2022
613	05/09/2022	5	9	2022
614	06/09/2022	6	9	2022
615	07/09/2022	7	9	2022
616	08/09/2022	8	9	2022
617	09/09/2022	9	9	2022
618	10/09/2022	10	9	2022
619	11/09/2022	11	9	2022
620	12/09/2022	12	9	2022
621	13/09/2022	13	9	2022
622	14/09/2022	14	9	2022
623	15/09/2022	15	9	2022
624	16/09/2022	16	9	2022
625	17/09/2022	17	9	2022
626	18/09/2022	18	9	2022
627	19/09/2022	19	9	2022
628	20/09/2022	20	9	2022
629	21/09/2022	21	9	2022
630	22/09/2022	22	9	2022
631	23/09/2022	23	9	2022
632	24/09/2022	24	9	2022
633	25/09/2022	25	9	2022
634	26/09/2022	26	9	2022
635	27/09/2022	27	9	2022
636	28/09/2022	28	9	2022
637	29/09/2022	29	9	2022
638	30/09/2022	30	9	2022
639	01/10/2022	1	10	2022
640	02/10/2022	2	10	2022
641	03/10/2022	3	10	2022
642	04/10/2022	4	10	2022
643	05/10/2022	5	10	2022
644	06/10/2022	6	10	2022
645	07/10/2022	7	10	2022
646	08/10/2022	8	10	2022
647	09/10/2022	9	10	2022
648	10/10/2022	10	10	2022
649	11/10/2022	11	10	2022
650	12/10/2022	12	10	2022
651	13/10/2022	13	10	2022
652	14/10/2022	14	10	2022
653	15/10/2022	15	10	2022
654	16/10/2022	16	10	2022
655	17/10/2022	17	10	2022
656	18/10/2022	18	10	2022
657	19/10/2022	19	10	2022
658	20/10/2022	20	10	2022
659	21/10/2022	21	10	2022
660	22/10/2022	22	10	2022
661	23/10/2022	23	10	2022
662	24/10/2022	24	10	2022
663	25/10/2022	25	10	2022
664	26/10/2022	26	10	2022
665	27/10/2022	27	10	2022
666	28/10/2022	28	10	2022
667	29/10/2022	29	10	2022
668	30/10/2022	30	10	2022
669	31/10/2022	31	10	2022
670	01/11/2022	1	11	2022
671	02/11/2022	2	11	2022
672	03/11/2022	3	11	2022
673	04/11/2022	4	11	2022
674	05/11/2022	5	11	2022
675	06/11/2022	6	11	2022
676	07/11/2022	7	11	2022
677	08/11/2022	8	11	2022
678	09/11/2022	9	11	2022
679	10/11/2022	10	11	2022
680	11/11/2022	11	11	2022
681	12/11/2022	12	11	2022
682	13/11/2022	13	11	2022
683	14/11/2022	14	11	2022
684	15/11/2022	15	11	2022
685	16/11/2022	16	11	2022
686	17/11/2022	17	11	2022
687	18/11/2022	18	11	2022
688	19/11/2022	19	11	2022
689	20/11/2022	20	11	2022
690	21/11/2022	21	11	2022
691	22/11/2022	22	11	2022
692	23/11/2022	23	11	2022
693	24/11/2022	24	11	2022
694	25/11/2022	25	11	2022
695	26/11/2022	26	11	2022
696	27/11/2022	27	11	2022
697	28/11/2022	28	11	2022
698	29/11/2022	29	11	2022
699	30/11/2022	30	11	2022
700	01/12/2022	1	12	2022
701	02/12/2022	2	12	2022
702	03/12/2022	3	12	2022
703	04/12/2022	4	12	2022
704	05/12/2022	5	12	2022
705	06/12/2022	6	12	2022
706	07/12/2022	7	12	2022
707	08/12/2022	8	12	2022
708	09/12/2022	9	12	2022
709	10/12/2022	10	12	2022
710	11/12/2022	11	12	2022
711	12/12/2022	12	12	2022
712	13/12/2022	13	12	2022
713	14/12/2022	14	12	2022
714	15/12/2022	15	12	2022
715	16/12/2022	16	12	2022
716	17/12/2022	17	12	2022
717	18/12/2022	18	12	2022
718	19/12/2022	19	12	2022
719	20/12/2022	20	12	2022
720	21/12/2022	21	12	2022
721	22/12/2022	22	12	2022
722	23/12/2022	23	12	2022
723	24/12/2022	24	12	2022
724	25/12/2022	25	12	2022
725	26/12/2022	26	12	2022
726	27/12/2022	27	12	2022
727	28/12/2022	28	12	2022
728	29/12/2022	29	12	2022
729	30/12/2022	30	12	2022
730	31/12/2022	31	12	2022
731	01/01/2023	1	1	2023
732	02/01/2023	2	1	2023
733	03/01/2023	3	1	2023
734	04/01/2023	4	1	2023
735	05/01/2023	5	1	2023
736	06/01/2023	6	1	2023
737	07/01/2023	7	1	2023
738	08/01/2023	8	1	2023
739	09/01/2023	9	1	2023
740	10/01/2023	10	1	2023
741	11/01/2023	11	1	2023
742	12/01/2023	12	1	2023
743	13/01/2023	13	1	2023
744	14/01/2023	14	1	2023
745	15/01/2023	15	1	2023
746	16/01/2023	16	1	2023
747	17/01/2023	17	1	2023
748	18/01/2023	18	1	2023
749	19/01/2023	19	1	2023
750	20/01/2023	20	1	2023
751	21/01/2023	21	1	2023
752	22/01/2023	22	1	2023
753	23/01/2023	23	1	2023
754	24/01/2023	24	1	2023
755	25/01/2023	25	1	2023
756	26/01/2023	26	1	2023
757	27/01/2023	27	1	2023
758	28/01/2023	28	1	2023
759	29/01/2023	29	1	2023
760	30/01/2023	30	1	2023
761	31/01/2023	31	1	2023
762	01/02/2023	1	2	2023
763	02/02/2023	2	2	2023
764	03/02/2023	3	2	2023
765	04/02/2023	4	2	2023
766	05/02/2023	5	2	2023
767	06/02/2023	6	2	2023
768	07/02/2023	7	2	2023
769	08/02/2023	8	2	2023
770	09/02/2023	9	2	2023
771	10/02/2023	10	2	2023
772	11/02/2023	11	2	2023
773	12/02/2023	12	2	2023
774	13/02/2023	13	2	2023
775	14/02/2023	14	2	2023
776	15/02/2023	15	2	2023
777	16/02/2023	16	2	2023
778	17/02/2023	17	2	2023
779	18/02/2023	18	2	2023
780	19/02/2023	19	2	2023
781	20/02/2023	20	2	2023
782	21/02/2023	21	2	2023
783	22/02/2023	22	2	2023
784	23/02/2023	23	2	2023
785	24/02/2023	24	2	2023
786	25/02/2023	25	2	2023
787	26/02/2023	26	2	2023
788	27/02/2023	27	2	2023
789	28/02/2023	28	2	2023
790	01/03/2023	1	3	2023
791	02/03/2023	2	3	2023
792	03/03/2023	3	3	2023
793	04/03/2023	4	3	2023
794	05/03/2023	5	3	2023
795	06/03/2023	6	3	2023
796	07/03/2023	7	3	2023
797	08/03/2023	8	3	2023
798	09/03/2023	9	3	2023
799	10/03/2023	10	3	2023
800	11/03/2023	11	3	2023
801	12/03/2023	12	3	2023
802	13/03/2023	13	3	2023
803	14/03/2023	14	3	2023
804	15/03/2023	15	3	2023
805	16/03/2023	16	3	2023
806	17/03/2023	17	3	2023
807	18/03/2023	18	3	2023
808	19/03/2023	19	3	2023
809	20/03/2023	20	3	2023
810	21/03/2023	21	3	2023
811	22/03/2023	22	3	2023
812	23/03/2023	23	3	2023
813	24/03/2023	24	3	2023
814	25/03/2023	25	3	2023
815	26/03/2023	26	3	2023
816	27/03/2023	27	3	2023
817	28/03/2023	28	3	2023
818	29/03/2023	29	3	2023
819	30/03/2023	30	3	2023
820	31/03/2023	31	3	2023
821	01/04/2023	1	4	2023
822	02/04/2023	2	4	2023
823	03/04/2023	3	4	2023
824	04/04/2023	4	4	2023
825	05/04/2023	5	4	2023
826	06/04/2023	6	4	2023
827	07/04/2023	7	4	2023
828	08/04/2023	8	4	2023
829	09/04/2023	9	4	2023
830	10/04/2023	10	4	2023
831	11/04/2023	11	4	2023
832	12/04/2023	12	4	2023
833	13/04/2023	13	4	2023
834	14/04/2023	14	4	2023
835	15/04/2023	15	4	2023
836	16/04/2023	16	4	2023
837	17/04/2023	17	4	2023
838	18/04/2023	18	4	2023
839	19/04/2023	19	4	2023
840	20/04/2023	20	4	2023
841	21/04/2023	21	4	2023
842	22/04/2023	22	4	2023
843	23/04/2023	23	4	2023
844	24/04/2023	24	4	2023
845	25/04/2023	25	4	2023
846	26/04/2023	26	4	2023
847	27/04/2023	27	4	2023
848	28/04/2023	28	4	2023
849	29/04/2023	29	4	2023
850	30/04/2023	30	4	2023
851	01/05/2023	1	5	2023
852	02/05/2023	2	5	2023
853	03/05/2023	3	5	2023
854	04/05/2023	4	5	2023
855	05/05/2023	5	5	2023
856	06/05/2023	6	5	2023
857	07/05/2023	7	5	2023
858	08/05/2023	8	5	2023
859	09/05/2023	9	5	2023
860	10/05/2023	10	5	2023
861	11/05/2023	11	5	2023
862	12/05/2023	12	5	2023
863	13/05/2023	13	5	2023
864	14/05/2023	14	5	2023
865	15/05/2023	15	5	2023
866	16/05/2023	16	5	2023
867	17/05/2023	17	5	2023
868	18/05/2023	18	5	2023
869	19/05/2023	19	5	2023
870	20/05/2023	20	5	2023
871	21/05/2023	21	5	2023
872	22/05/2023	22	5	2023
873	23/05/2023	23	5	2023
874	24/05/2023	24	5	2023
875	25/05/2023	25	5	2023
876	26/05/2023	26	5	2023
877	27/05/2023	27	5	2023
878	28/05/2023	28	5	2023
879	29/05/2023	29	5	2023
880	30/05/2023	30	5	2023
881	31/05/2023	31	5	2023
882	01/06/2023	1	6	2023
883	02/06/2023	2	6	2023
884	03/06/2023	3	6	2023
885	04/06/2023	4	6	2023
886	05/06/2023	5	6	2023
887	06/06/2023	6	6	2023
888	07/06/2023	7	6	2023
889	08/06/2023	8	6	2023
890	09/06/2023	9	6	2023
891	10/06/2023	10	6	2023
892	11/06/2023	11	6	2023
893	12/06/2023	12	6	2023
894	13/06/2023	13	6	2023
895	14/06/2023	14	6	2023
896	15/06/2023	15	6	2023
897	16/06/2023	16	6	2023
898	17/06/2023	17	6	2023
899	18/06/2023	18	6	2023
900	19/06/2023	19	6	2023
901	20/06/2023	20	6	2023
902	21/06/2023	21	6	2023
903	22/06/2023	22	6	2023
904	23/06/2023	23	6	2023
905	24/06/2023	24	6	2023
906	25/06/2023	25	6	2023
907	26/06/2023	26	6	2023
908	27/06/2023	27	6	2023
909	28/06/2023	28	6	2023
910	29/06/2023	29	6	2023
911	30/06/2023	30	6	2023
912	01/07/2023	1	7	2023
913	02/07/2023	2	7	2023
914	03/07/2023	3	7	2023
915	04/07/2023	4	7	2023
916	05/07/2023	5	7	2023
917	06/07/2023	6	7	2023
918	07/07/2023	7	7	2023
919	08/07/2023	8	7	2023
920	09/07/2023	9	7	2023
921	10/07/2023	10	7	2023
922	11/07/2023	11	7	2023
923	12/07/2023	12	7	2023
924	13/07/2023	13	7	2023
925	14/07/2023	14	7	2023
926	15/07/2023	15	7	2023
927	16/07/2023	16	7	2023
928	17/07/2023	17	7	2023
929	18/07/2023	18	7	2023
930	19/07/2023	19	7	2023
931	20/07/2023	20	7	2023
932	21/07/2023	21	7	2023
933	22/07/2023	22	7	2023
934	23/07/2023	23	7	2023
935	24/07/2023	24	7	2023
936	25/07/2023	25	7	2023
937	26/07/2023	26	7	2023
938	27/07/2023	27	7	2023
939	28/07/2023	28	7	2023
940	29/07/2023	29	7	2023
941	30/07/2023	30	7	2023
942	31/07/2023	31	7	2023
943	01/08/2023	1	8	2023
944	02/08/2023	2	8	2023
945	03/08/2023	3	8	2023
946	04/08/2023	4	8	2023
947	05/08/2023	5	8	2023
948	06/08/2023	6	8	2023
949	07/08/2023	7	8	2023
950	08/08/2023	8	8	2023
951	09/08/2023	9	8	2023
952	10/08/2023	10	8	2023
953	11/08/2023	11	8	2023
954	12/08/2023	12	8	2023
955	13/08/2023	13	8	2023
956	14/08/2023	14	8	2023
957	15/08/2023	15	8	2023
958	16/08/2023	16	8	2023
959	17/08/2023	17	8	2023
960	18/08/2023	18	8	2023
961	19/08/2023	19	8	2023
962	20/08/2023	20	8	2023
963	21/08/2023	21	8	2023
964	22/08/2023	22	8	2023
965	23/08/2023	23	8	2023
966	24/08/2023	24	8	2023
967	25/08/2023	25	8	2023
968	26/08/2023	26	8	2023
969	27/08/2023	27	8	2023
970	28/08/2023	28	8	2023
971	29/08/2023	29	8	2023
972	30/08/2023	30	8	2023
973	31/08/2023	31	8	2023
974	01/09/2023	1	9	2023
975	02/09/2023	2	9	2023
976	03/09/2023	3	9	2023
977	04/09/2023	4	9	2023
978	05/09/2023	5	9	2023
979	06/09/2023	6	9	2023
980	07/09/2023	7	9	2023
981	08/09/2023	8	9	2023
982	09/09/2023	9	9	2023
983	10/09/2023	10	9	2023
984	11/09/2023	11	9	2023
985	12/09/2023	12	9	2023
986	13/09/2023	13	9	2023
987	14/09/2023	14	9	2023
988	15/09/2023	15	9	2023
989	16/09/2023	16	9	2023
990	17/09/2023	17	9	2023
991	18/09/2023	18	9	2023
992	19/09/2023	19	9	2023
993	20/09/2023	20	9	2023
994	21/09/2023	21	9	2023
995	22/09/2023	22	9	2023
996	23/09/2023	23	9	2023
997	24/09/2023	24	9	2023
998	25/09/2023	25	9	2023
999	26/09/2023	26	9	2023
1000	27/09/2023	27	9	2023
1001	28/09/2023	28	9	2023
1002	29/09/2023	29	9	2023
1003	30/09/2023	30	9	2023
1004	01/10/2023	1	10	2023
1005	02/10/2023	2	10	2023
1006	03/10/2023	3	10	2023
1007	04/10/2023	4	10	2023
1008	05/10/2023	5	10	2023
1009	06/10/2023	6	10	2023
1010	07/10/2023	7	10	2023
1011	08/10/2023	8	10	2023
1012	09/10/2023	9	10	2023
1013	10/10/2023	10	10	2023
1014	11/10/2023	11	10	2023
1015	12/10/2023	12	10	2023
1016	13/10/2023	13	10	2023
1017	14/10/2023	14	10	2023
1018	15/10/2023	15	10	2023
1019	16/10/2023	16	10	2023
1020	17/10/2023	17	10	2023
1021	18/10/2023	18	10	2023
1022	19/10/2023	19	10	2023
1023	20/10/2023	20	10	2023
1024	21/10/2023	21	10	2023
1025	22/10/2023	22	10	2023
1026	23/10/2023	23	10	2023
1027	24/10/2023	24	10	2023
1028	25/10/2023	25	10	2023
1029	26/10/2023	26	10	2023
1030	27/10/2023	27	10	2023
1031	28/10/2023	28	10	2023
1032	29/10/2023	29	10	2023
1033	30/10/2023	30	10	2023
1034	31/10/2023	31	10	2023
1035	01/11/2023	1	11	2023
1036	02/11/2023	2	11	2023
1037	03/11/2023	3	11	2023
1038	04/11/2023	4	11	2023
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-02-16 12:33:32.008216+00	1	What is your sentiment towards the CryptoCurrency Market currently?	1	[{"added": {}}]	1	1
2	2021-02-16 12:33:39.344405+00	1	Bullish	1	[{"added": {}}]	2	1
3	2021-02-16 12:33:43.255309+00	2	Bearish	1	[{"added": {}}]	2	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	polls	question
2	polls	choice
3	admin	logentry
4	auth	permission
5	auth	group
6	auth	user
7	contenttypes	contenttype
8	sessions	session
9	polls	profile
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-02-16 10:21:39.922452+00
2	auth	0001_initial	2021-02-16 10:21:40.046541+00
3	admin	0001_initial	2021-02-16 10:21:40.105538+00
4	admin	0002_logentry_remove_auto_add	2021-02-16 10:21:40.119538+00
5	admin	0003_logentry_add_action_flag_choices	2021-02-16 10:21:40.125541+00
6	contenttypes	0002_remove_content_type_name	2021-02-16 10:21:40.141537+00
7	auth	0002_alter_permission_name_max_length	2021-02-16 10:21:40.226539+00
8	auth	0003_alter_user_email_max_length	2021-02-16 10:21:40.233547+00
9	auth	0004_alter_user_username_opts	2021-02-16 10:21:40.239539+00
10	auth	0005_alter_user_last_login_null	2021-02-16 10:21:40.247547+00
11	auth	0006_require_contenttypes_0002	2021-02-16 10:21:40.249547+00
12	auth	0007_alter_validators_add_error_messages	2021-02-16 10:21:40.25654+00
13	auth	0008_alter_user_username_max_length	2021-02-16 10:21:40.269537+00
14	auth	0009_alter_user_last_name_max_length	2021-02-16 10:21:40.276537+00
15	auth	0010_alter_group_name_max_length	2021-02-16 10:21:40.287538+00
16	auth	0011_update_proxy_permissions	2021-02-16 10:21:40.293537+00
17	auth	0012_alter_user_first_name_max_length	2021-02-16 10:21:40.300537+00
18	polls	0001_initial	2021-02-16 10:21:40.313539+00
19	sessions	0001_initial	2021-02-16 12:32:05.407317+00
20	polls	0002_profile	2021-02-16 12:33:04.651354+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
f55pu1s7qnvdw7yv9ae3s0av34l09f3e	e30:1lBzWh:WOPS8MwflgH7rudrDxGKtHvYkZBH8ZLLm_Elsx14zz4	2021-03-02 12:32:23.515538+00
c3xax73j5sg6ctuhehfkom23n13kemws	e30:1lBzWv:xIGg8x5ujbgrMCe3z5OpLvtdqBL0XprlW_R6HjtMqfo	2021-03-02 12:32:37.228932+00
n0oq9919nz75atqsrj32cmq6orl5q4x7	.eJxVjDkOwjAUBe_iGln5P8YLJX3OYD1vOIAcKUuFuDtESgHtm5n3Eh7bWv225NmPSVwEidPvFhAfue0g3dFuk4xTW-cxyF2RB13kMKX8vB7u30HFUr917zpyio1lUpSUIQsCI_dBR0PKKKtQuCDmLrGzBaSz47Nj3UUATrw_sI03Ng:1lBzYf:UeO_r4zyyHW_lH2wzgthpVTOpwc-M0H3mcNTnKY4GO0	2021-03-02 12:34:25.923792+00
\.


--
-- Data for Name: polls_choice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.polls_choice (id, choice_text, votes, question_id) FROM stdin;
1	Bullish	0	1
2	Bearish	0	1
\.


--
-- Data for Name: polls_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.polls_profile (id, created, modified, user_id) FROM stdin;
1	2021-02-16 12:33:21.273029+00	2021-02-16 12:34:25.922792+00	1
\.


--
-- Data for Name: polls_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.polls_question (id, question_text, pub_date) FROM stdin;
1	What is your sentiment towards the CryptoCurrency Market currently?	2021-02-16 12:33:30+00
\.


--
-- Data for Name: sentiment_dim; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sentiment_dim (dateid, timeid, trading_symbol, comp_sentiment) FROM stdin;
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9682
40	841	BTC	0.9682
40	901	BTC	0.9682
40	961	BTC	0.9995
40	1021	BTC	-0.0784
40	1081	BTC	0.1153
40	1141	BTC	0.9081
40	1201	BTC	0.3280
40	1261	BTC	0.0000
40	1321	BTC	0.2586
40	1381	BTC	0.4879
40	361	BTC	0.9792
40	541	BTC	0.9732
41	121	BTC	-0.9682
41	181	BTC	0.4049
41	301	BTC	0.0136
41	361	BTC	0.9985
41	421	BTC	0.9818
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9682
40	841	BTC	0.9682
40	901	BTC	0.9682
40	961	BTC	0.9995
40	1021	BTC	-0.0784
40	1081	BTC	0.1153
40	1141	BTC	0.9081
40	1201	BTC	0.3280
40	1261	BTC	0.0000
40	1321	BTC	0.2586
40	1381	BTC	0.4879
40	361	BTC	0.9792
40	541	BTC	0.9732
41	121	BTC	-0.9682
41	181	BTC	0.4049
41	301	BTC	0.0136
41	361	BTC	0.9985
41	421	BTC	0.9818
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9682
40	841	BTC	0.9682
40	901	BTC	0.9682
40	961	BTC	0.9995
40	1021	BTC	-0.0784
40	1081	BTC	0.1153
40	1141	BTC	0.9081
40	1201	BTC	0.3280
40	1261	BTC	0.0000
40	1321	BTC	0.2586
40	1381	BTC	0.4879
40	361	BTC	0.9792
40	541	BTC	0.9732
41	121	BTC	-0.9682
41	181	BTC	0.4049
41	301	BTC	0.0136
41	361	BTC	0.9985
41	421	BTC	0.9818
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9682
40	841	BTC	0.9682
40	901	BTC	0.9682
40	961	BTC	0.9995
40	1021	BTC	-0.0784
40	1081	BTC	0.1153
40	1141	BTC	0.9081
40	1201	BTC	0.3280
40	1261	BTC	0.0000
40	1321	BTC	0.2586
40	1381	BTC	0.4879
40	361	BTC	0.9792
40	541	BTC	0.9732
41	121	BTC	-0.9682
41	181	BTC	0.4049
41	301	BTC	0.0136
41	361	BTC	0.9985
41	421	BTC	0.9818
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9682
40	841	BTC	0.9682
40	901	BTC	0.9682
40	961	BTC	0.9995
40	1021	BTC	-0.0784
40	1081	BTC	0.1153
40	1141	BTC	0.9081
40	1201	BTC	0.3280
40	1261	BTC	0.0000
40	1321	BTC	0.2586
40	1381	BTC	0.4879
40	361	BTC	0.9792
40	541	BTC	0.9732
41	121	BTC	-0.9682
41	181	BTC	0.4049
41	301	BTC	0.0136
41	361	BTC	0.9985
41	421	BTC	0.9818
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9818
40	841	BTC	0.9818
40	901	BTC	0.9995
40	961	BTC	0.3087
40	1021	BTC	0.1306
40	1081	BTC	0.1153
40	1141	BTC	0.1296
40	1201	BTC	0.0303
40	1261	BTC	0.0303
40	1321	BTC	0.0303
40	1381	BTC	0.2889
40	361	BTC	0.9792
40	541	BTC	0.9732
41	1	BTC	0.4879
41	601	BTC	0.7430
41	61	BTC	0.0164
41	121	BTC	-0.0059
41	181	BTC	-0.0059
41	241	BTC	0.0136
41	301	BTC	0.0303
41	361	BTC	0.0303
41	421	BTC	0.9985
41	481	BTC	0.9818
41	541	BTC	0.8934
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9818
40	841	BTC	0.9818
40	901	BTC	0.9995
40	961	BTC	0.3087
40	1021	BTC	0.1306
40	1081	BTC	0.1153
40	1141	BTC	0.1296
40	1201	BTC	0.0303
40	1261	BTC	0.0303
40	1321	BTC	0.0303
40	1381	BTC	0.2889
40	361	BTC	0.9792
40	541	BTC	0.9732
41	1	BTC	0.4879
41	601	BTC	0.7430
41	61	BTC	0.0164
41	121	BTC	-0.0059
41	181	BTC	-0.0059
41	241	BTC	0.0136
41	301	BTC	0.0303
41	361	BTC	0.0303
41	421	BTC	0.9985
41	481	BTC	0.9818
41	541	BTC	0.8934
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9818
40	841	BTC	0.9818
40	901	BTC	0.9995
40	961	BTC	0.3087
40	1021	BTC	0.1306
40	1081	BTC	0.1153
40	1141	BTC	0.1296
40	1201	BTC	0.0303
40	1261	BTC	0.0303
40	1321	BTC	0.0303
40	1381	BTC	0.2889
40	361	BTC	0.9792
40	541	BTC	0.9732
41	1	BTC	0.4879
41	601	BTC	0.7430
41	61	BTC	0.0164
41	121	BTC	-0.0059
41	181	BTC	-0.0059
41	241	BTC	0.0136
41	301	BTC	0.0303
41	361	BTC	0.0303
41	421	BTC	0.9985
41	481	BTC	0.9818
41	541	BTC	0.8934
42	1	BTC	0.5267
42	661	BTC	0.8885
42	781	BTC	0.9682
42	841	BTC	0.9990
42	901	BTC	-0.1282
42	961	BTC	0.9970
42	1021	BTC	0.9970
42	1081	BTC	0.3178
42	1141	BTC	0.3504
42	61	BTC	0.9682
42	1201	BTC	0.9990
42	1261	BTC	-0.0252
42	181	BTC	-0.9955
42	241	BTC	-0.6486
42	301	BTC	-0.9970
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9818
40	841	BTC	0.9818
40	901	BTC	0.9995
40	961	BTC	0.3087
40	1021	BTC	0.1306
40	1081	BTC	0.1153
40	1141	BTC	0.1296
40	1201	BTC	0.0303
40	1261	BTC	0.0303
40	1321	BTC	0.0303
40	1381	BTC	0.2889
40	361	BTC	0.9792
40	541	BTC	0.9732
41	1	BTC	0.4879
41	601	BTC	0.7430
41	61	BTC	0.0164
41	121	BTC	-0.0059
41	181	BTC	-0.0059
41	241	BTC	0.0136
41	301	BTC	0.0303
41	361	BTC	0.0303
41	421	BTC	0.9985
41	481	BTC	0.9818
41	541	BTC	0.8934
42	1	BTC	0.5267
42	661	BTC	0.8885
42	781	BTC	0.9682
42	841	BTC	0.9990
42	901	BTC	-0.1282
42	961	BTC	0.9970
42	1021	BTC	0.9970
42	1081	BTC	0.3178
42	1141	BTC	0.3504
42	61	BTC	0.9682
42	1201	BTC	0.9990
42	1261	BTC	-0.0252
42	181	BTC	-0.9955
42	241	BTC	-0.6486
42	301	BTC	-0.9970
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9818
40	841	BTC	0.9818
40	901	BTC	0.9995
40	961	BTC	0.3087
40	1021	BTC	0.1306
40	1081	BTC	0.1153
40	1141	BTC	0.1296
40	1201	BTC	0.0303
40	1261	BTC	0.0303
40	1321	BTC	0.0303
40	1381	BTC	0.2889
40	361	BTC	0.9792
40	541	BTC	0.9732
41	1	BTC	0.4879
41	601	BTC	0.7430
41	61	BTC	0.0164
41	121	BTC	-0.0059
41	181	BTC	-0.0059
41	241	BTC	0.0136
41	301	BTC	0.0303
41	361	BTC	0.0303
41	421	BTC	0.9985
41	481	BTC	0.9818
41	541	BTC	0.8934
42	1	BTC	0.5267
42	661	BTC	0.8885
42	781	BTC	0.9682
42	841	BTC	0.9990
42	901	BTC	-0.1282
42	961	BTC	0.9970
42	1021	BTC	0.9970
42	1081	BTC	0.3178
42	1141	BTC	0.3504
42	61	BTC	0.9682
42	1201	BTC	0.9990
42	1261	BTC	-0.0252
42	181	BTC	-0.9955
42	241	BTC	-0.6486
42	301	BTC	-0.9970
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9818
40	841	BTC	0.9818
40	901	BTC	0.9995
40	961	BTC	0.3087
40	1021	BTC	0.1306
40	1081	BTC	0.1153
40	1141	BTC	0.1296
40	1201	BTC	0.0303
40	1261	BTC	0.0303
40	1321	BTC	0.0303
40	1381	BTC	0.2889
40	361	BTC	0.9792
40	541	BTC	0.9732
41	1	BTC	0.4879
41	601	BTC	0.7430
41	61	BTC	0.0164
41	121	BTC	-0.0059
41	181	BTC	-0.0059
41	241	BTC	0.0136
41	301	BTC	0.0303
41	361	BTC	0.0303
41	421	BTC	0.9985
41	481	BTC	0.9818
41	541	BTC	0.8934
42	1	BTC	0.5267
42	661	BTC	0.8885
42	781	BTC	0.9682
42	841	BTC	0.9990
42	901	BTC	-0.1282
42	961	BTC	0.9970
42	1021	BTC	0.9970
42	1081	BTC	0.3178
42	1141	BTC	0.3504
42	61	BTC	0.9682
42	1201	BTC	0.9990
42	1261	BTC	-0.0252
42	181	BTC	-0.9955
42	241	BTC	-0.6486
42	301	BTC	-0.9970
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9818
40	841	BTC	0.9818
40	901	BTC	0.9995
40	961	BTC	0.3087
40	1021	BTC	0.1306
40	1081	BTC	0.1153
40	1141	BTC	0.1296
40	1201	BTC	0.0303
40	1261	BTC	0.0303
40	1321	BTC	0.0303
40	1381	BTC	0.2889
40	361	BTC	0.9792
40	541	BTC	0.9732
41	1	BTC	0.4879
41	601	BTC	0.7430
41	61	BTC	0.0164
41	121	BTC	-0.0059
41	181	BTC	-0.0059
41	241	BTC	0.0136
41	301	BTC	0.0303
41	361	BTC	0.0303
41	421	BTC	0.9985
41	481	BTC	0.9818
41	541	BTC	0.8934
42	1	BTC	0.5267
42	661	BTC	0.8885
42	721	BTC	0.9970
42	781	BTC	0.9682
42	841	BTC	0.9990
42	901	BTC	-0.1282
42	961	BTC	0.9970
42	1021	BTC	0.9986
42	1081	BTC	0.3178
42	1141	BTC	0.3504
42	61	BTC	0.9682
42	1201	BTC	0.9990
42	1261	BTC	-0.0236
42	1321	BTC	0.9682
42	1381	BTC	-0.9682
42	181	BTC	-0.9955
42	241	BTC	-0.6486
42	301	BTC	-0.9970
42	481	BTC	0.9371
43	1	BTC	0.0044
43	61	BTC	0.3924
43	121	BTC	-0.0244
43	241	BTC	0.9843
43	301	BTC	0.0044
43	361	BTC	-0.9970
43	541	BTC	0.8225
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9818
40	841	BTC	0.9818
40	901	BTC	0.9995
40	961	BTC	0.3087
40	1021	BTC	0.1306
40	1081	BTC	0.1153
40	1141	BTC	0.1296
40	1201	BTC	0.0303
40	1261	BTC	0.0303
40	1321	BTC	0.0303
40	1381	BTC	0.2889
40	361	BTC	0.9792
40	541	BTC	0.9732
41	1	BTC	0.4879
41	601	BTC	0.7430
41	61	BTC	0.0164
41	121	BTC	-0.0059
41	181	BTC	-0.0059
41	241	BTC	0.0136
41	301	BTC	0.0303
41	361	BTC	0.0303
41	421	BTC	0.9985
41	481	BTC	0.9818
41	541	BTC	0.8934
42	1	BTC	0.5267
42	661	BTC	0.8885
42	721	BTC	0.9970
42	781	BTC	0.9682
42	841	BTC	0.9990
42	901	BTC	-0.1282
42	961	BTC	0.9970
42	1021	BTC	0.9986
42	1081	BTC	0.3178
42	1141	BTC	0.3504
42	61	BTC	0.9682
42	1201	BTC	0.9990
42	1261	BTC	-0.0236
42	1321	BTC	0.9682
42	1381	BTC	-0.9682
42	181	BTC	-0.9955
42	241	BTC	-0.6486
42	301	BTC	-0.9970
42	481	BTC	0.9371
43	1	BTC	0.0044
43	721	BTC	0.7906
43	781	BTC	0.9974
43	841	BTC	0.4549
43	1021	BTC	0.9970
43	1141	BTC	0.4749
43	61	BTC	0.3924
43	1201	BTC	0.9360
43	1261	BTC	-0.3265
43	1321	BTC	0.9716
43	1381	BTC	0.6705
43	121	BTC	-0.0244
43	241	BTC	0.9843
43	301	BTC	0.0044
43	361	BTC	-0.9970
43	541	BTC	0.8225
44	601	BTC	0.7906
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9818
40	841	BTC	0.9818
40	901	BTC	0.9995
40	961	BTC	0.3087
40	1021	BTC	0.1306
40	1081	BTC	0.1153
40	1141	BTC	0.1296
40	1201	BTC	0.0303
40	1261	BTC	0.0303
40	1321	BTC	0.0303
40	1381	BTC	0.2889
40	361	BTC	0.9792
40	541	BTC	0.9732
41	1	BTC	0.4879
41	601	BTC	0.7430
41	61	BTC	0.0164
41	121	BTC	-0.0059
41	181	BTC	-0.0059
41	241	BTC	0.0136
41	301	BTC	0.0303
41	361	BTC	0.0303
41	421	BTC	0.9985
41	481	BTC	0.9818
41	541	BTC	0.8934
42	1	BTC	0.5267
42	661	BTC	0.8885
42	721	BTC	0.9970
42	781	BTC	0.9682
42	841	BTC	0.9990
42	901	BTC	-0.1282
42	961	BTC	0.9970
42	1021	BTC	0.9986
42	1081	BTC	0.3178
42	1141	BTC	0.3504
42	61	BTC	0.9682
42	1201	BTC	0.9990
42	1261	BTC	-0.0236
42	1321	BTC	0.9682
42	1381	BTC	-0.9682
42	181	BTC	-0.9955
42	241	BTC	-0.6486
42	301	BTC	-0.9970
42	481	BTC	0.9371
43	1	BTC	0.0044
43	721	BTC	0.7906
43	781	BTC	0.9974
43	841	BTC	0.4549
43	1021	BTC	0.9970
43	1141	BTC	0.4749
43	61	BTC	0.3924
43	1201	BTC	0.9360
43	1261	BTC	-0.3265
43	1321	BTC	0.9716
43	1381	BTC	0.6705
43	121	BTC	-0.0244
43	241	BTC	0.9843
43	301	BTC	0.0044
43	361	BTC	-0.9970
43	541	BTC	0.8225
44	601	BTC	0.7906
45	781	BTC	0.9682
45	841	BTC	0.9682
45	901	BTC	0.9985
45	961	BTC	0.9682
45	1081	BTC	0.9682
45	1141	BTC	0.5267
45	1261	BTC	0.9985
46	1	BTC	-0.8934
46	121	BTC	0.9747
46	301	BTC	0.9628
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9818
40	841	BTC	0.9818
40	901	BTC	0.9995
40	961	BTC	0.3087
40	1021	BTC	0.1306
40	1081	BTC	0.1153
40	1141	BTC	0.1296
40	1201	BTC	0.0303
40	1261	BTC	0.0303
40	1321	BTC	0.0303
40	1381	BTC	0.2889
40	361	BTC	0.9792
40	541	BTC	0.9732
41	1	BTC	0.4879
41	601	BTC	0.7430
41	61	BTC	0.0164
41	121	BTC	-0.0059
41	181	BTC	-0.0059
41	241	BTC	0.0136
41	301	BTC	0.0303
41	361	BTC	0.0303
41	421	BTC	0.9985
41	481	BTC	0.9818
41	541	BTC	0.8934
42	1	BTC	0.5267
42	661	BTC	0.8885
42	721	BTC	0.9970
42	781	BTC	0.9682
42	841	BTC	0.9990
42	901	BTC	-0.1282
42	961	BTC	0.9970
42	1021	BTC	0.9986
42	1081	BTC	0.3178
42	1141	BTC	0.3504
42	61	BTC	0.9682
42	1201	BTC	0.9990
42	1261	BTC	-0.0236
42	1321	BTC	0.9682
42	1381	BTC	-0.9682
42	181	BTC	-0.9955
42	241	BTC	-0.6486
42	301	BTC	-0.9970
42	481	BTC	0.9371
43	1	BTC	0.0044
43	721	BTC	0.7906
43	781	BTC	0.9974
43	841	BTC	0.4549
43	1021	BTC	0.9970
43	1141	BTC	0.4749
43	61	BTC	0.3924
43	1201	BTC	0.9360
43	1261	BTC	-0.3265
43	1321	BTC	0.9716
43	1381	BTC	0.6705
43	121	BTC	-0.0244
43	241	BTC	0.9843
43	301	BTC	0.0044
43	361	BTC	-0.9970
43	541	BTC	0.8225
44	601	BTC	0.7906
45	781	BTC	0.9682
45	841	BTC	0.9682
45	901	BTC	0.9985
45	961	BTC	0.9682
45	1081	BTC	0.9682
45	1141	BTC	0.5267
45	1261	BTC	0.9985
46	1	BTC	-0.8934
46	121	BTC	0.9747
46	301	BTC	0.9628
47	781	BTC	0.9985
47	841	BTC	0.9982
47	901	BTC	0.9984
47	1021	BTC	0.9882
47	1081	BTC	0.9531
47	1141	BTC	0.9686
47	1201	BTC	0.9955
47	1261	BTC	0.9818
47	1381	BTC	0.5106
47	121	BTC	0.5423
47	241	BTC	0.9920
48	361	BTC	0.9682
48	421	BTC	0.9982
48	481	BTC	0.9682
25	601	BTC	0.9766
25	721	BTC	0.9818
25	781	BTC	0.7717
25	841	BTC	-0.8126
25	901	BTC	0.9682
25	961	BTC	0.9818
25	1021	BTC	0.6808
25	1141	BTC	0.8862
25	1201	BTC	0.9705
25	1261	BTC	-0.5859
25	1321	BTC	0.9986
25	121	BTC	-0.5994
25	361	BTC	0.9840
25	481	BTC	0.9840
26	1141	BTC	-0.1484
26	1201	BTC	-0.9993
26	1261	BTC	-0.7269
26	1321	BTC	-0.0643
26	1381	BTC	0.9468
26	121	BTC	-0.9970
26	361	BTC	0.9840
26	421	BTC	-0.9944
27	601	BTC	-0.6597
27	661	BTC	-0.9978
27	721	BTC	-0.0160
27	781	BTC	-0.5574
27	841	BTC	-0.3362
27	901	BTC	0.0737
27	961	BTC	-0.0175
27	1021	BTC	-0.0144
27	1081	BTC	0.9834
27	1141	BTC	0.9771
27	1201	BTC	0.4062
27	1261	BTC	-0.7506
27	1381	BTC	0.4108
27	241	BTC	-0.0150
27	301	BTC	-0.5574
27	481	BTC	-0.5267
27	541	BTC	-0.5859
28	601	BTC	0.0534
28	661	BTC	0.9726
28	721	BTC	0.6434
28	781	BTC	0.2559
28	841	BTC	0.4191
28	901	BTC	0.3034
28	961	BTC	0.3082
28	1021	BTC	0.9842
28	1081	BTC	-0.0439
28	1141	BTC	0.0000
28	1201	BTC	0.3074
28	1261	BTC	0.4561
28	1321	BTC	0.3177
28	1381	BTC	0.4547
28	241	BTC	0.4397
28	301	BTC	0.8934
28	361	BTC	-0.5574
28	421	BTC	0.7906
28	481	BTC	0.5267
29	1	BTC	0.3721
29	601	BTC	-0.0008
29	661	BTC	0.4266
29	721	BTC	0.3280
29	781	BTC	0.4266
29	841	BTC	0.3280
29	901	BTC	0.0015
29	961	BTC	0.0015
29	1021	BTC	-0.0009
29	1081	BTC	-0.0008
29	1141	BTC	0.0017
29	61	BTC	0.0000
29	1201	BTC	0.0015
29	1261	BTC	0.0078
29	1321	BTC	0.9985
29	1381	BTC	0.2268
29	121	BTC	-0.2064
29	181	BTC	0.0000
29	241	BTC	0.9970
29	301	BTC	0.0015
29	361	BTC	0.9325
29	421	BTC	0.0015
29	481	BTC	-0.0008
29	541	BTC	0.0015
30	1	BTC	-0.1998
30	601	BTC	0.3433
30	661	BTC	0.3115
30	721	BTC	0.0675
30	781	BTC	0.6249
30	961	BTC	-0.0862
30	1021	BTC	0.9882
30	1081	BTC	-0.7906
30	1141	BTC	-0.0212
30	61	BTC	0.5719
30	1261	BTC	0.3499
30	121	BTC	0.9682
30	241	BTC	-0.0007
30	301	BTC	-0.0007
30	361	BTC	-0.5574
30	421	BTC	-0.5574
31	601	BTC	-0.9993
31	661	BTC	-0.4512
31	721	BTC	0.0064
31	781	BTC	-0.2726
31	841	BTC	0.6124
31	901	BTC	0.3246
31	961	BTC	0.7906
31	1021	BTC	-0.2407
31	1081	BTC	-0.9993
31	1141	BTC	0.4331
31	61	BTC	0.9970
31	1201	BTC	-0.9325
31	181	BTC	0.7906
31	301	BTC	0.9970
31	541	BTC	0.5574
32	601	BTC	-0.9968
32	661	BTC	0.3688
32	721	BTC	0.9712
32	781	BTC	0.0113
32	841	BTC	-0.9993
32	901	BTC	0.9818
32	961	BTC	0.0982
32	1021	BTC	0.9682
32	1081	BTC	-0.0481
32	1141	BTC	-0.6705
32	61	BTC	0.4108
32	1201	BTC	0.5994
32	1261	BTC	0.5267
32	1321	BTC	0.2268
32	241	BTC	0.4723
32	361	BTC	-0.5574
32	421	BTC	0.1131
32	481	BTC	0.0550
32	541	BTC	0.6124
33	1	BTC	0.2488
33	61	BTC	-0.6808
33	121	BTC	-0.5859
33	181	BTC	-0.6705
33	301	BTC	-0.9997
33	361	BTC	-0.6705
33	421	BTC	0.9477
33	541	BTC	-0.3371
35	721	BTC	0.5046
35	781	BTC	-0.0010
35	841	BTC	0.9682
35	901	BTC	0.4199
35	961	BTC	0.9985
35	1021	BTC	0.9985
35	1081	BTC	0.2312
35	1201	BTC	0.9628
35	1261	BTC	0.9970
35	1321	BTC	0.0082
35	1381	BTC	0.5994
36	1	BTC	0.9325
36	601	BTC	0.9682
36	721	BTC	-0.0011
36	781	BTC	0.7430
36	841	BTC	0.9781
36	1201	BTC	0.8934
36	1261	BTC	0.9682
36	1321	BTC	0.7964
36	1381	BTC	0.2047
36	241	BTC	0.9001
36	301	BTC	-0.7650
36	481	BTC	0.0710
36	541	BTC	-0.0339
37	1	BTC	0.9325
37	601	BTC	0.9985
37	721	BTC	0.3876
37	781	BTC	0.0086
37	841	BTC	0.0377
37	901	BTC	0.0448
37	961	BTC	0.9957
37	1021	BTC	0.4098
37	1081	BTC	0.3873
37	1141	BTC	0.9682
37	1201	BTC	0.6369
37	1261	BTC	0.9758
37	1321	BTC	0.9758
37	1381	BTC	0.7096
37	121	BTC	0.9970
37	181	BTC	-0.8308
37	241	BTC	0.9853
37	361	BTC	0.6166
37	541	BTC	0.9549
38	601	BTC	0.9918
38	661	BTC	0.9682
38	721	BTC	0.7906
38	841	BTC	0.4000
38	901	BTC	0.4178
38	961	BTC	0.3873
38	121	BTC	0.5719
38	301	BTC	-0.0027
38	481	BTC	-0.5423
38	541	BTC	0.3669
39	661	BTC	-0.2719
39	721	BTC	0.9819
39	781	BTC	0.9985
39	841	BTC	0.4412
39	901	BTC	0.9990
39	961	BTC	0.9985
39	1021	BTC	0.9990
39	1081	BTC	0.3082
39	1141	BTC	0.9682
39	1201	BTC	0.9984
39	1261	BTC	0.6486
39	301	BTC	0.2273
39	361	BTC	0.9719
39	421	BTC	0.9823
39	541	BTC	0.7506
40	1	BTC	0.9826
40	661	BTC	0.9984
40	721	BTC	0.9818
40	781	BTC	0.9818
40	841	BTC	0.9818
40	901	BTC	0.9995
40	961	BTC	0.3087
40	1021	BTC	0.1306
40	1081	BTC	0.1153
40	1141	BTC	0.1296
40	1201	BTC	0.0303
40	1261	BTC	0.0303
40	1321	BTC	0.0303
40	1381	BTC	0.2889
40	361	BTC	0.9792
40	541	BTC	0.9732
41	1	BTC	0.4879
41	601	BTC	0.7430
41	61	BTC	0.0164
41	121	BTC	-0.0059
41	181	BTC	-0.0059
41	241	BTC	0.0136
41	301	BTC	0.0303
41	361	BTC	0.0303
41	421	BTC	0.9985
41	481	BTC	0.9818
41	541	BTC	0.8934
42	1	BTC	0.5267
42	661	BTC	0.8885
42	721	BTC	0.9970
42	781	BTC	0.9682
42	841	BTC	0.9990
42	901	BTC	-0.1282
42	961	BTC	0.9970
42	1021	BTC	0.9986
42	1081	BTC	0.3178
42	1141	BTC	0.3504
42	61	BTC	0.9682
42	1201	BTC	0.9990
42	1261	BTC	-0.0236
42	1321	BTC	0.9682
42	1381	BTC	-0.9682
42	181	BTC	-0.9955
42	241	BTC	-0.6486
42	301	BTC	-0.9970
42	481	BTC	0.9371
43	1	BTC	0.0044
43	721	BTC	0.7906
43	781	BTC	0.9974
43	841	BTC	0.4549
43	1021	BTC	0.9970
43	1141	BTC	0.4749
43	61	BTC	0.3924
43	1201	BTC	0.9360
43	1261	BTC	-0.3265
43	1321	BTC	0.9716
43	1381	BTC	0.6705
43	121	BTC	-0.0244
43	241	BTC	0.9843
43	301	BTC	0.0044
43	361	BTC	-0.9970
43	541	BTC	0.8225
44	601	BTC	0.7906
45	781	BTC	0.9682
45	841	BTC	0.9682
45	901	BTC	0.9985
45	961	BTC	0.9682
45	1081	BTC	0.9682
45	1141	BTC	0.5267
45	1261	BTC	0.9985
46	1	BTC	-0.8934
46	121	BTC	0.9747
46	301	BTC	0.9628
47	781	BTC	0.9985
47	841	BTC	0.9982
47	901	BTC	0.9984
47	1021	BTC	0.9882
47	1081	BTC	0.9531
47	1141	BTC	0.9686
47	1201	BTC	0.9955
47	1261	BTC	0.9818
47	1381	BTC	0.5106
47	121	BTC	0.5423
47	241	BTC	0.9920
48	721	BTC	0.9981
48	1021	BTC	-0.9992
48	1141	BTC	0.9985
48	1201	BTC	0.3823
48	1321	BTC	-0.7003
48	1381	BTC	0.7906
48	361	BTC	0.9682
48	421	BTC	0.9982
48	481	BTC	0.9682
49	1	BTC	0.9858
49	661	BTC	-0.8834
49	721	BTC	-0.5859
49	781	BTC	-0.9994
49	841	BTC	0.9100
49	901	BTC	-0.9993
49	181	BTC	-0.9992
49	301	BTC	0.5106
49	541	BTC	0.9803
\.


--
-- Data for Name: time_dim; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_dim (timeid, "time", hour, minute) FROM stdin;
1	00:00	0	0
2	00:01	0	1
3	00:02	0	2
4	00:03	0	3
5	00:04	0	4
6	00:05	0	5
7	00:06	0	6
8	00:07	0	7
9	00:08	0	8
10	00:09	0	9
11	00:10	0	10
12	00:11	0	11
13	00:12	0	12
14	00:13	0	13
15	00:14	0	14
16	00:15	0	15
17	00:16	0	16
18	00:17	0	17
19	00:18	0	18
20	00:19	0	19
21	00:20	0	20
22	00:21	0	21
23	00:22	0	22
24	00:23	0	23
25	00:24	0	24
26	00:25	0	25
27	00:26	0	26
28	00:27	0	27
29	00:28	0	28
30	00:29	0	29
31	00:30	0	30
32	00:31	0	31
33	00:32	0	32
34	00:33	0	33
35	00:34	0	34
36	00:35	0	35
37	00:36	0	36
38	00:37	0	37
39	00:38	0	38
40	00:39	0	39
41	00:40	0	40
42	00:41	0	41
43	00:42	0	42
44	00:43	0	43
45	00:44	0	44
46	00:45	0	45
47	00:46	0	46
48	00:47	0	47
49	00:48	0	48
50	00:49	0	49
51	00:50	0	50
52	00:51	0	51
53	00:52	0	52
54	00:53	0	53
55	00:54	0	54
56	00:55	0	55
57	00:56	0	56
58	00:57	0	57
59	00:58	0	58
60	00:59	0	59
61	01:00	1	0
62	01:01	1	1
63	01:02	1	2
64	01:03	1	3
65	01:04	1	4
66	01:05	1	5
67	01:06	1	6
68	01:07	1	7
69	01:08	1	8
70	01:09	1	9
71	01:10	1	10
72	01:11	1	11
73	01:12	1	12
74	01:13	1	13
75	01:14	1	14
76	01:15	1	15
77	01:16	1	16
78	01:17	1	17
79	01:18	1	18
80	01:19	1	19
81	01:20	1	20
82	01:21	1	21
83	01:22	1	22
84	01:23	1	23
85	01:24	1	24
86	01:25	1	25
87	01:26	1	26
88	01:27	1	27
89	01:28	1	28
90	01:29	1	29
91	01:30	1	30
92	01:31	1	31
93	01:32	1	32
94	01:33	1	33
95	01:34	1	34
96	01:35	1	35
97	01:36	1	36
98	01:37	1	37
99	01:38	1	38
100	01:39	1	39
101	01:40	1	40
102	01:41	1	41
103	01:42	1	42
104	01:43	1	43
105	01:44	1	44
106	01:45	1	45
107	01:46	1	46
108	01:47	1	47
109	01:48	1	48
110	01:49	1	49
111	01:50	1	50
112	01:51	1	51
113	01:52	1	52
114	01:53	1	53
115	01:54	1	54
116	01:55	1	55
117	01:56	1	56
118	01:57	1	57
119	01:58	1	58
120	01:59	1	59
121	02:00	2	0
122	02:01	2	1
123	02:02	2	2
124	02:03	2	3
125	02:04	2	4
126	02:05	2	5
127	02:06	2	6
128	02:07	2	7
129	02:08	2	8
130	02:09	2	9
131	02:10	2	10
132	02:11	2	11
133	02:12	2	12
134	02:13	2	13
135	02:14	2	14
136	02:15	2	15
137	02:16	2	16
138	02:17	2	17
139	02:18	2	18
140	02:19	2	19
141	02:20	2	20
142	02:21	2	21
143	02:22	2	22
144	02:23	2	23
145	02:24	2	24
146	02:25	2	25
147	02:26	2	26
148	02:27	2	27
149	02:28	2	28
150	02:29	2	29
151	02:30	2	30
152	02:31	2	31
153	02:32	2	32
154	02:33	2	33
155	02:34	2	34
156	02:35	2	35
157	02:36	2	36
158	02:37	2	37
159	02:38	2	38
160	02:39	2	39
161	02:40	2	40
162	02:41	2	41
163	02:42	2	42
164	02:43	2	43
165	02:44	2	44
166	02:45	2	45
167	02:46	2	46
168	02:47	2	47
169	02:48	2	48
170	02:49	2	49
171	02:50	2	50
172	02:51	2	51
173	02:52	2	52
174	02:53	2	53
175	02:54	2	54
176	02:55	2	55
177	02:56	2	56
178	02:57	2	57
179	02:58	2	58
180	02:59	2	59
181	03:00	3	0
182	03:01	3	1
183	03:02	3	2
184	03:03	3	3
185	03:04	3	4
186	03:05	3	5
187	03:06	3	6
188	03:07	3	7
189	03:08	3	8
190	03:09	3	9
191	03:10	3	10
192	03:11	3	11
193	03:12	3	12
194	03:13	3	13
195	03:14	3	14
196	03:15	3	15
197	03:16	3	16
198	03:17	3	17
199	03:18	3	18
200	03:19	3	19
201	03:20	3	20
202	03:21	3	21
203	03:22	3	22
204	03:23	3	23
205	03:24	3	24
206	03:25	3	25
207	03:26	3	26
208	03:27	3	27
209	03:28	3	28
210	03:29	3	29
211	03:30	3	30
212	03:31	3	31
213	03:32	3	32
214	03:33	3	33
215	03:34	3	34
216	03:35	3	35
217	03:36	3	36
218	03:37	3	37
219	03:38	3	38
220	03:39	3	39
221	03:40	3	40
222	03:41	3	41
223	03:42	3	42
224	03:43	3	43
225	03:44	3	44
226	03:45	3	45
227	03:46	3	46
228	03:47	3	47
229	03:48	3	48
230	03:49	3	49
231	03:50	3	50
232	03:51	3	51
233	03:52	3	52
234	03:53	3	53
235	03:54	3	54
236	03:55	3	55
237	03:56	3	56
238	03:57	3	57
239	03:58	3	58
240	03:59	3	59
241	04:00	4	0
242	04:01	4	1
243	04:02	4	2
244	04:03	4	3
245	04:04	4	4
246	04:05	4	5
247	04:06	4	6
248	04:07	4	7
249	04:08	4	8
250	04:09	4	9
251	04:10	4	10
252	04:11	4	11
253	04:12	4	12
254	04:13	4	13
255	04:14	4	14
256	04:15	4	15
257	04:16	4	16
258	04:17	4	17
259	04:18	4	18
260	04:19	4	19
261	04:20	4	20
262	04:21	4	21
263	04:22	4	22
264	04:23	4	23
265	04:24	4	24
266	04:25	4	25
267	04:26	4	26
268	04:27	4	27
269	04:28	4	28
270	04:29	4	29
271	04:30	4	30
272	04:31	4	31
273	04:32	4	32
274	04:33	4	33
275	04:34	4	34
276	04:35	4	35
277	04:36	4	36
278	04:37	4	37
279	04:38	4	38
280	04:39	4	39
281	04:40	4	40
282	04:41	4	41
283	04:42	4	42
284	04:43	4	43
285	04:44	4	44
286	04:45	4	45
287	04:46	4	46
288	04:47	4	47
289	04:48	4	48
290	04:49	4	49
291	04:50	4	50
292	04:51	4	51
293	04:52	4	52
294	04:53	4	53
295	04:54	4	54
296	04:55	4	55
297	04:56	4	56
298	04:57	4	57
299	04:58	4	58
300	04:59	4	59
301	05:00	5	0
302	05:01	5	1
303	05:02	5	2
304	05:03	5	3
305	05:04	5	4
306	05:05	5	5
307	05:06	5	6
308	05:07	5	7
309	05:08	5	8
310	05:09	5	9
311	05:10	5	10
312	05:11	5	11
313	05:12	5	12
314	05:13	5	13
315	05:14	5	14
316	05:15	5	15
317	05:16	5	16
318	05:17	5	17
319	05:18	5	18
320	05:19	5	19
321	05:20	5	20
322	05:21	5	21
323	05:22	5	22
324	05:23	5	23
325	05:24	5	24
326	05:25	5	25
327	05:26	5	26
328	05:27	5	27
329	05:28	5	28
330	05:29	5	29
331	05:30	5	30
332	05:31	5	31
333	05:32	5	32
334	05:33	5	33
335	05:34	5	34
336	05:35	5	35
337	05:36	5	36
338	05:37	5	37
339	05:38	5	38
340	05:39	5	39
341	05:40	5	40
342	05:41	5	41
343	05:42	5	42
344	05:43	5	43
345	05:44	5	44
346	05:45	5	45
347	05:46	5	46
348	05:47	5	47
349	05:48	5	48
350	05:49	5	49
351	05:50	5	50
352	05:51	5	51
353	05:52	5	52
354	05:53	5	53
355	05:54	5	54
356	05:55	5	55
357	05:56	5	56
358	05:57	5	57
359	05:58	5	58
360	05:59	5	59
361	06:00	6	0
362	06:01	6	1
363	06:02	6	2
364	06:03	6	3
365	06:04	6	4
366	06:05	6	5
367	06:06	6	6
368	06:07	6	7
369	06:08	6	8
370	06:09	6	9
371	06:10	6	10
372	06:11	6	11
373	06:12	6	12
374	06:13	6	13
375	06:14	6	14
376	06:15	6	15
377	06:16	6	16
378	06:17	6	17
379	06:18	6	18
380	06:19	6	19
381	06:20	6	20
382	06:21	6	21
383	06:22	6	22
384	06:23	6	23
385	06:24	6	24
386	06:25	6	25
387	06:26	6	26
388	06:27	6	27
389	06:28	6	28
390	06:29	6	29
391	06:30	6	30
392	06:31	6	31
393	06:32	6	32
394	06:33	6	33
395	06:34	6	34
396	06:35	6	35
397	06:36	6	36
398	06:37	6	37
399	06:38	6	38
400	06:39	6	39
401	06:40	6	40
402	06:41	6	41
403	06:42	6	42
404	06:43	6	43
405	06:44	6	44
406	06:45	6	45
407	06:46	6	46
408	06:47	6	47
409	06:48	6	48
410	06:49	6	49
411	06:50	6	50
412	06:51	6	51
413	06:52	6	52
414	06:53	6	53
415	06:54	6	54
416	06:55	6	55
417	06:56	6	56
418	06:57	6	57
419	06:58	6	58
420	06:59	6	59
421	07:00	7	0
422	07:01	7	1
423	07:02	7	2
424	07:03	7	3
425	07:04	7	4
426	07:05	7	5
427	07:06	7	6
428	07:07	7	7
429	07:08	7	8
430	07:09	7	9
431	07:10	7	10
432	07:11	7	11
433	07:12	7	12
434	07:13	7	13
435	07:14	7	14
436	07:15	7	15
437	07:16	7	16
438	07:17	7	17
439	07:18	7	18
440	07:19	7	19
441	07:20	7	20
442	07:21	7	21
443	07:22	7	22
444	07:23	7	23
445	07:24	7	24
446	07:25	7	25
447	07:26	7	26
448	07:27	7	27
449	07:28	7	28
450	07:29	7	29
451	07:30	7	30
452	07:31	7	31
453	07:32	7	32
454	07:33	7	33
455	07:34	7	34
456	07:35	7	35
457	07:36	7	36
458	07:37	7	37
459	07:38	7	38
460	07:39	7	39
461	07:40	7	40
462	07:41	7	41
463	07:42	7	42
464	07:43	7	43
465	07:44	7	44
466	07:45	7	45
467	07:46	7	46
468	07:47	7	47
469	07:48	7	48
470	07:49	7	49
471	07:50	7	50
472	07:51	7	51
473	07:52	7	52
474	07:53	7	53
475	07:54	7	54
476	07:55	7	55
477	07:56	7	56
478	07:57	7	57
479	07:58	7	58
480	07:59	7	59
481	08:00	8	0
482	08:01	8	1
483	08:02	8	2
484	08:03	8	3
485	08:04	8	4
486	08:05	8	5
487	08:06	8	6
488	08:07	8	7
489	08:08	8	8
490	08:09	8	9
491	08:10	8	10
492	08:11	8	11
493	08:12	8	12
494	08:13	8	13
495	08:14	8	14
496	08:15	8	15
497	08:16	8	16
498	08:17	8	17
499	08:18	8	18
500	08:19	8	19
501	08:20	8	20
502	08:21	8	21
503	08:22	8	22
504	08:23	8	23
505	08:24	8	24
506	08:25	8	25
507	08:26	8	26
508	08:27	8	27
509	08:28	8	28
510	08:29	8	29
511	08:30	8	30
512	08:31	8	31
513	08:32	8	32
514	08:33	8	33
515	08:34	8	34
516	08:35	8	35
517	08:36	8	36
518	08:37	8	37
519	08:38	8	38
520	08:39	8	39
521	08:40	8	40
522	08:41	8	41
523	08:42	8	42
524	08:43	8	43
525	08:44	8	44
526	08:45	8	45
527	08:46	8	46
528	08:47	8	47
529	08:48	8	48
530	08:49	8	49
531	08:50	8	50
532	08:51	8	51
533	08:52	8	52
534	08:53	8	53
535	08:54	8	54
536	08:55	8	55
537	08:56	8	56
538	08:57	8	57
539	08:58	8	58
540	08:59	8	59
541	09:00	9	0
542	09:01	9	1
543	09:02	9	2
544	09:03	9	3
545	09:04	9	4
546	09:05	9	5
547	09:06	9	6
548	09:07	9	7
549	09:08	9	8
550	09:09	9	9
551	09:10	9	10
552	09:11	9	11
553	09:12	9	12
554	09:13	9	13
555	09:14	9	14
556	09:15	9	15
557	09:16	9	16
558	09:17	9	17
559	09:18	9	18
560	09:19	9	19
561	09:20	9	20
562	09:21	9	21
563	09:22	9	22
564	09:23	9	23
565	09:24	9	24
566	09:25	9	25
567	09:26	9	26
568	09:27	9	27
569	09:28	9	28
570	09:29	9	29
571	09:30	9	30
572	09:31	9	31
573	09:32	9	32
574	09:33	9	33
575	09:34	9	34
576	09:35	9	35
577	09:36	9	36
578	09:37	9	37
579	09:38	9	38
580	09:39	9	39
581	09:40	9	40
582	09:41	9	41
583	09:42	9	42
584	09:43	9	43
585	09:44	9	44
586	09:45	9	45
587	09:46	9	46
588	09:47	9	47
589	09:48	9	48
590	09:49	9	49
591	09:50	9	50
592	09:51	9	51
593	09:52	9	52
594	09:53	9	53
595	09:54	9	54
596	09:55	9	55
597	09:56	9	56
598	09:57	9	57
599	09:58	9	58
600	09:59	9	59
601	10:00	10	0
602	10:01	10	1
603	10:02	10	2
604	10:03	10	3
605	10:04	10	4
606	10:05	10	5
607	10:06	10	6
608	10:07	10	7
609	10:08	10	8
610	10:09	10	9
611	10:10	10	10
612	10:11	10	11
613	10:12	10	12
614	10:13	10	13
615	10:14	10	14
616	10:15	10	15
617	10:16	10	16
618	10:17	10	17
619	10:18	10	18
620	10:19	10	19
621	10:20	10	20
622	10:21	10	21
623	10:22	10	22
624	10:23	10	23
625	10:24	10	24
626	10:25	10	25
627	10:26	10	26
628	10:27	10	27
629	10:28	10	28
630	10:29	10	29
631	10:30	10	30
632	10:31	10	31
633	10:32	10	32
634	10:33	10	33
635	10:34	10	34
636	10:35	10	35
637	10:36	10	36
638	10:37	10	37
639	10:38	10	38
640	10:39	10	39
641	10:40	10	40
642	10:41	10	41
643	10:42	10	42
644	10:43	10	43
645	10:44	10	44
646	10:45	10	45
647	10:46	10	46
648	10:47	10	47
649	10:48	10	48
650	10:49	10	49
651	10:50	10	50
652	10:51	10	51
653	10:52	10	52
654	10:53	10	53
655	10:54	10	54
656	10:55	10	55
657	10:56	10	56
658	10:57	10	57
659	10:58	10	58
660	10:59	10	59
661	11:00	11	0
662	11:01	11	1
663	11:02	11	2
664	11:03	11	3
665	11:04	11	4
666	11:05	11	5
667	11:06	11	6
668	11:07	11	7
669	11:08	11	8
670	11:09	11	9
671	11:10	11	10
672	11:11	11	11
673	11:12	11	12
674	11:13	11	13
675	11:14	11	14
676	11:15	11	15
677	11:16	11	16
678	11:17	11	17
679	11:18	11	18
680	11:19	11	19
681	11:20	11	20
682	11:21	11	21
683	11:22	11	22
684	11:23	11	23
685	11:24	11	24
686	11:25	11	25
687	11:26	11	26
688	11:27	11	27
689	11:28	11	28
690	11:29	11	29
691	11:30	11	30
692	11:31	11	31
693	11:32	11	32
694	11:33	11	33
695	11:34	11	34
696	11:35	11	35
697	11:36	11	36
698	11:37	11	37
699	11:38	11	38
700	11:39	11	39
701	11:40	11	40
702	11:41	11	41
703	11:42	11	42
704	11:43	11	43
705	11:44	11	44
706	11:45	11	45
707	11:46	11	46
708	11:47	11	47
709	11:48	11	48
710	11:49	11	49
711	11:50	11	50
712	11:51	11	51
713	11:52	11	52
714	11:53	11	53
715	11:54	11	54
716	11:55	11	55
717	11:56	11	56
718	11:57	11	57
719	11:58	11	58
720	11:59	11	59
721	12:00	12	0
722	12:01	12	1
723	12:02	12	2
724	12:03	12	3
725	12:04	12	4
726	12:05	12	5
727	12:06	12	6
728	12:07	12	7
729	12:08	12	8
730	12:09	12	9
731	12:10	12	10
732	12:11	12	11
733	12:12	12	12
734	12:13	12	13
735	12:14	12	14
736	12:15	12	15
737	12:16	12	16
738	12:17	12	17
739	12:18	12	18
740	12:19	12	19
741	12:20	12	20
742	12:21	12	21
743	12:22	12	22
744	12:23	12	23
745	12:24	12	24
746	12:25	12	25
747	12:26	12	26
748	12:27	12	27
749	12:28	12	28
750	12:29	12	29
751	12:30	12	30
752	12:31	12	31
753	12:32	12	32
754	12:33	12	33
755	12:34	12	34
756	12:35	12	35
757	12:36	12	36
758	12:37	12	37
759	12:38	12	38
760	12:39	12	39
761	12:40	12	40
762	12:41	12	41
763	12:42	12	42
764	12:43	12	43
765	12:44	12	44
766	12:45	12	45
767	12:46	12	46
768	12:47	12	47
769	12:48	12	48
770	12:49	12	49
771	12:50	12	50
772	12:51	12	51
773	12:52	12	52
774	12:53	12	53
775	12:54	12	54
776	12:55	12	55
777	12:56	12	56
778	12:57	12	57
779	12:58	12	58
780	12:59	12	59
781	13:00	13	0
782	13:01	13	1
783	13:02	13	2
784	13:03	13	3
785	13:04	13	4
786	13:05	13	5
787	13:06	13	6
788	13:07	13	7
789	13:08	13	8
790	13:09	13	9
791	13:10	13	10
792	13:11	13	11
793	13:12	13	12
794	13:13	13	13
795	13:14	13	14
796	13:15	13	15
797	13:16	13	16
798	13:17	13	17
799	13:18	13	18
800	13:19	13	19
801	13:20	13	20
802	13:21	13	21
803	13:22	13	22
804	13:23	13	23
805	13:24	13	24
806	13:25	13	25
807	13:26	13	26
808	13:27	13	27
809	13:28	13	28
810	13:29	13	29
811	13:30	13	30
812	13:31	13	31
813	13:32	13	32
814	13:33	13	33
815	13:34	13	34
816	13:35	13	35
817	13:36	13	36
818	13:37	13	37
819	13:38	13	38
820	13:39	13	39
821	13:40	13	40
822	13:41	13	41
823	13:42	13	42
824	13:43	13	43
825	13:44	13	44
826	13:45	13	45
827	13:46	13	46
828	13:47	13	47
829	13:48	13	48
830	13:49	13	49
831	13:50	13	50
832	13:51	13	51
833	13:52	13	52
834	13:53	13	53
835	13:54	13	54
836	13:55	13	55
837	13:56	13	56
838	13:57	13	57
839	13:58	13	58
840	13:59	13	59
841	14:00	14	0
842	14:01	14	1
843	14:02	14	2
844	14:03	14	3
845	14:04	14	4
846	14:05	14	5
847	14:06	14	6
848	14:07	14	7
849	14:08	14	8
850	14:09	14	9
851	14:10	14	10
852	14:11	14	11
853	14:12	14	12
854	14:13	14	13
855	14:14	14	14
856	14:15	14	15
857	14:16	14	16
858	14:17	14	17
859	14:18	14	18
860	14:19	14	19
861	14:20	14	20
862	14:21	14	21
863	14:22	14	22
864	14:23	14	23
865	14:24	14	24
866	14:25	14	25
867	14:26	14	26
868	14:27	14	27
869	14:28	14	28
870	14:29	14	29
871	14:30	14	30
872	14:31	14	31
873	14:32	14	32
874	14:33	14	33
875	14:34	14	34
876	14:35	14	35
877	14:36	14	36
878	14:37	14	37
879	14:38	14	38
880	14:39	14	39
881	14:40	14	40
882	14:41	14	41
883	14:42	14	42
884	14:43	14	43
885	14:44	14	44
886	14:45	14	45
887	14:46	14	46
888	14:47	14	47
889	14:48	14	48
890	14:49	14	49
891	14:50	14	50
892	14:51	14	51
893	14:52	14	52
894	14:53	14	53
895	14:54	14	54
896	14:55	14	55
897	14:56	14	56
898	14:57	14	57
899	14:58	14	58
900	14:59	14	59
901	15:00	15	0
902	15:01	15	1
903	15:02	15	2
904	15:03	15	3
905	15:04	15	4
906	15:05	15	5
907	15:06	15	6
908	15:07	15	7
909	15:08	15	8
910	15:09	15	9
911	15:10	15	10
912	15:11	15	11
913	15:12	15	12
914	15:13	15	13
915	15:14	15	14
916	15:15	15	15
917	15:16	15	16
918	15:17	15	17
919	15:18	15	18
920	15:19	15	19
921	15:20	15	20
922	15:21	15	21
923	15:22	15	22
924	15:23	15	23
925	15:24	15	24
926	15:25	15	25
927	15:26	15	26
928	15:27	15	27
929	15:28	15	28
930	15:29	15	29
931	15:30	15	30
932	15:31	15	31
933	15:32	15	32
934	15:33	15	33
935	15:34	15	34
936	15:35	15	35
937	15:36	15	36
938	15:37	15	37
939	15:38	15	38
940	15:39	15	39
941	15:40	15	40
942	15:41	15	41
943	15:42	15	42
944	15:43	15	43
945	15:44	15	44
946	15:45	15	45
947	15:46	15	46
948	15:47	15	47
949	15:48	15	48
950	15:49	15	49
951	15:50	15	50
952	15:51	15	51
953	15:52	15	52
954	15:53	15	53
955	15:54	15	54
956	15:55	15	55
957	15:56	15	56
958	15:57	15	57
959	15:58	15	58
960	15:59	15	59
961	16:00	16	0
962	16:01	16	1
963	16:02	16	2
964	16:03	16	3
965	16:04	16	4
966	16:05	16	5
967	16:06	16	6
968	16:07	16	7
969	16:08	16	8
970	16:09	16	9
971	16:10	16	10
972	16:11	16	11
973	16:12	16	12
974	16:13	16	13
975	16:14	16	14
976	16:15	16	15
977	16:16	16	16
978	16:17	16	17
979	16:18	16	18
980	16:19	16	19
981	16:20	16	20
982	16:21	16	21
983	16:22	16	22
984	16:23	16	23
985	16:24	16	24
986	16:25	16	25
987	16:26	16	26
988	16:27	16	27
989	16:28	16	28
990	16:29	16	29
991	16:30	16	30
992	16:31	16	31
993	16:32	16	32
994	16:33	16	33
995	16:34	16	34
996	16:35	16	35
997	16:36	16	36
998	16:37	16	37
999	16:38	16	38
1000	16:39	16	39
1001	16:40	16	40
1002	16:41	16	41
1003	16:42	16	42
1004	16:43	16	43
1005	16:44	16	44
1006	16:45	16	45
1007	16:46	16	46
1008	16:47	16	47
1009	16:48	16	48
1010	16:49	16	49
1011	16:50	16	50
1012	16:51	16	51
1013	16:52	16	52
1014	16:53	16	53
1015	16:54	16	54
1016	16:55	16	55
1017	16:56	16	56
1018	16:57	16	57
1019	16:58	16	58
1020	16:59	16	59
1021	17:00	17	0
1022	17:01	17	1
1023	17:02	17	2
1024	17:03	17	3
1025	17:04	17	4
1026	17:05	17	5
1027	17:06	17	6
1028	17:07	17	7
1029	17:08	17	8
1030	17:09	17	9
1031	17:10	17	10
1032	17:11	17	11
1033	17:12	17	12
1034	17:13	17	13
1035	17:14	17	14
1036	17:15	17	15
1037	17:16	17	16
1038	17:17	17	17
1039	17:18	17	18
1040	17:19	17	19
1041	17:20	17	20
1042	17:21	17	21
1043	17:22	17	22
1044	17:23	17	23
1045	17:24	17	24
1046	17:25	17	25
1047	17:26	17	26
1048	17:27	17	27
1049	17:28	17	28
1050	17:29	17	29
1051	17:30	17	30
1052	17:31	17	31
1053	17:32	17	32
1054	17:33	17	33
1055	17:34	17	34
1056	17:35	17	35
1057	17:36	17	36
1058	17:37	17	37
1059	17:38	17	38
1060	17:39	17	39
1061	17:40	17	40
1062	17:41	17	41
1063	17:42	17	42
1064	17:43	17	43
1065	17:44	17	44
1066	17:45	17	45
1067	17:46	17	46
1068	17:47	17	47
1069	17:48	17	48
1070	17:49	17	49
1071	17:50	17	50
1072	17:51	17	51
1073	17:52	17	52
1074	17:53	17	53
1075	17:54	17	54
1076	17:55	17	55
1077	17:56	17	56
1078	17:57	17	57
1079	17:58	17	58
1080	17:59	17	59
1081	18:00	18	0
1082	18:01	18	1
1083	18:02	18	2
1084	18:03	18	3
1085	18:04	18	4
1086	18:05	18	5
1087	18:06	18	6
1088	18:07	18	7
1089	18:08	18	8
1090	18:09	18	9
1091	18:10	18	10
1092	18:11	18	11
1093	18:12	18	12
1094	18:13	18	13
1095	18:14	18	14
1096	18:15	18	15
1097	18:16	18	16
1098	18:17	18	17
1099	18:18	18	18
1100	18:19	18	19
1101	18:20	18	20
1102	18:21	18	21
1103	18:22	18	22
1104	18:23	18	23
1105	18:24	18	24
1106	18:25	18	25
1107	18:26	18	26
1108	18:27	18	27
1109	18:28	18	28
1110	18:29	18	29
1111	18:30	18	30
1112	18:31	18	31
1113	18:32	18	32
1114	18:33	18	33
1115	18:34	18	34
1116	18:35	18	35
1117	18:36	18	36
1118	18:37	18	37
1119	18:38	18	38
1120	18:39	18	39
1121	18:40	18	40
1122	18:41	18	41
1123	18:42	18	42
1124	18:43	18	43
1125	18:44	18	44
1126	18:45	18	45
1127	18:46	18	46
1128	18:47	18	47
1129	18:48	18	48
1130	18:49	18	49
1131	18:50	18	50
1132	18:51	18	51
1133	18:52	18	52
1134	18:53	18	53
1135	18:54	18	54
1136	18:55	18	55
1137	18:56	18	56
1138	18:57	18	57
1139	18:58	18	58
1140	18:59	18	59
1141	19:00	19	0
1142	19:01	19	1
1143	19:02	19	2
1144	19:03	19	3
1145	19:04	19	4
1146	19:05	19	5
1147	19:06	19	6
1148	19:07	19	7
1149	19:08	19	8
1150	19:09	19	9
1151	19:10	19	10
1152	19:11	19	11
1153	19:12	19	12
1154	19:13	19	13
1155	19:14	19	14
1156	19:15	19	15
1157	19:16	19	16
1158	19:17	19	17
1159	19:18	19	18
1160	19:19	19	19
1161	19:20	19	20
1162	19:21	19	21
1163	19:22	19	22
1164	19:23	19	23
1165	19:24	19	24
1166	19:25	19	25
1167	19:26	19	26
1168	19:27	19	27
1169	19:28	19	28
1170	19:29	19	29
1171	19:30	19	30
1172	19:31	19	31
1173	19:32	19	32
1174	19:33	19	33
1175	19:34	19	34
1176	19:35	19	35
1177	19:36	19	36
1178	19:37	19	37
1179	19:38	19	38
1180	19:39	19	39
1181	19:40	19	40
1182	19:41	19	41
1183	19:42	19	42
1184	19:43	19	43
1185	19:44	19	44
1186	19:45	19	45
1187	19:46	19	46
1188	19:47	19	47
1189	19:48	19	48
1190	19:49	19	49
1191	19:50	19	50
1192	19:51	19	51
1193	19:52	19	52
1194	19:53	19	53
1195	19:54	19	54
1196	19:55	19	55
1197	19:56	19	56
1198	19:57	19	57
1199	19:58	19	58
1200	19:59	19	59
1201	20:00	20	0
1202	20:01	20	1
1203	20:02	20	2
1204	20:03	20	3
1205	20:04	20	4
1206	20:05	20	5
1207	20:06	20	6
1208	20:07	20	7
1209	20:08	20	8
1210	20:09	20	9
1211	20:10	20	10
1212	20:11	20	11
1213	20:12	20	12
1214	20:13	20	13
1215	20:14	20	14
1216	20:15	20	15
1217	20:16	20	16
1218	20:17	20	17
1219	20:18	20	18
1220	20:19	20	19
1221	20:20	20	20
1222	20:21	20	21
1223	20:22	20	22
1224	20:23	20	23
1225	20:24	20	24
1226	20:25	20	25
1227	20:26	20	26
1228	20:27	20	27
1229	20:28	20	28
1230	20:29	20	29
1231	20:30	20	30
1232	20:31	20	31
1233	20:32	20	32
1234	20:33	20	33
1235	20:34	20	34
1236	20:35	20	35
1237	20:36	20	36
1238	20:37	20	37
1239	20:38	20	38
1240	20:39	20	39
1241	20:40	20	40
1242	20:41	20	41
1243	20:42	20	42
1244	20:43	20	43
1245	20:44	20	44
1246	20:45	20	45
1247	20:46	20	46
1248	20:47	20	47
1249	20:48	20	48
1250	20:49	20	49
1251	20:50	20	50
1252	20:51	20	51
1253	20:52	20	52
1254	20:53	20	53
1255	20:54	20	54
1256	20:55	20	55
1257	20:56	20	56
1258	20:57	20	57
1259	20:58	20	58
1260	20:59	20	59
1261	21:00	21	0
1262	21:01	21	1
1263	21:02	21	2
1264	21:03	21	3
1265	21:04	21	4
1266	21:05	21	5
1267	21:06	21	6
1268	21:07	21	7
1269	21:08	21	8
1270	21:09	21	9
1271	21:10	21	10
1272	21:11	21	11
1273	21:12	21	12
1274	21:13	21	13
1275	21:14	21	14
1276	21:15	21	15
1277	21:16	21	16
1278	21:17	21	17
1279	21:18	21	18
1280	21:19	21	19
1281	21:20	21	20
1282	21:21	21	21
1283	21:22	21	22
1284	21:23	21	23
1285	21:24	21	24
1286	21:25	21	25
1287	21:26	21	26
1288	21:27	21	27
1289	21:28	21	28
1290	21:29	21	29
1291	21:30	21	30
1292	21:31	21	31
1293	21:32	21	32
1294	21:33	21	33
1295	21:34	21	34
1296	21:35	21	35
1297	21:36	21	36
1298	21:37	21	37
1299	21:38	21	38
1300	21:39	21	39
1301	21:40	21	40
1302	21:41	21	41
1303	21:42	21	42
1304	21:43	21	43
1305	21:44	21	44
1306	21:45	21	45
1307	21:46	21	46
1308	21:47	21	47
1309	21:48	21	48
1310	21:49	21	49
1311	21:50	21	50
1312	21:51	21	51
1313	21:52	21	52
1314	21:53	21	53
1315	21:54	21	54
1316	21:55	21	55
1317	21:56	21	56
1318	21:57	21	57
1319	21:58	21	58
1320	21:59	21	59
1321	22:00	22	0
1322	22:01	22	1
1323	22:02	22	2
1324	22:03	22	3
1325	22:04	22	4
1326	22:05	22	5
1327	22:06	22	6
1328	22:07	22	7
1329	22:08	22	8
1330	22:09	22	9
1331	22:10	22	10
1332	22:11	22	11
1333	22:12	22	12
1334	22:13	22	13
1335	22:14	22	14
1336	22:15	22	15
1337	22:16	22	16
1338	22:17	22	17
1339	22:18	22	18
1340	22:19	22	19
1341	22:20	22	20
1342	22:21	22	21
1343	22:22	22	22
1344	22:23	22	23
1345	22:24	22	24
1346	22:25	22	25
1347	22:26	22	26
1348	22:27	22	27
1349	22:28	22	28
1350	22:29	22	29
1351	22:30	22	30
1352	22:31	22	31
1353	22:32	22	32
1354	22:33	22	33
1355	22:34	22	34
1356	22:35	22	35
1357	22:36	22	36
1358	22:37	22	37
1359	22:38	22	38
1360	22:39	22	39
1361	22:40	22	40
1362	22:41	22	41
1363	22:42	22	42
1364	22:43	22	43
1365	22:44	22	44
1366	22:45	22	45
1367	22:46	22	46
1368	22:47	22	47
1369	22:48	22	48
1370	22:49	22	49
1371	22:50	22	50
1372	22:51	22	51
1373	22:52	22	52
1374	22:53	22	53
1375	22:54	22	54
1376	22:55	22	55
1377	22:56	22	56
1378	22:57	22	57
1379	22:58	22	58
1380	22:59	22	59
1381	23:00	23	0
1382	23:01	23	1
1383	23:02	23	2
1384	23:03	23	3
1385	23:04	23	4
1386	23:05	23	5
1387	23:06	23	6
1388	23:07	23	7
1389	23:08	23	8
1390	23:09	23	9
1391	23:10	23	10
1392	23:11	23	11
1393	23:12	23	12
1394	23:13	23	13
1395	23:14	23	14
1396	23:15	23	15
1397	23:16	23	16
1398	23:17	23	17
1399	23:18	23	18
1400	23:19	23	19
1401	23:20	23	20
1402	23:21	23	21
1403	23:22	23	22
1404	23:23	23	23
1405	23:24	23	24
1406	23:25	23	25
1407	23:26	23	26
1408	23:27	23	27
1409	23:28	23	28
1410	23:29	23	29
1411	23:30	23	30
1412	23:31	23	31
1413	23:32	23	32
1414	23:33	23	33
1415	23:34	23	34
1416	23:35	23	35
1417	23:36	23	36
1418	23:37	23	37
1419	23:38	23	38
1420	23:39	23	39
1421	23:40	23	40
1422	23:41	23	41
1423	23:42	23	42
1424	23:43	23	43
1425	23:44	23	44
1426	23:45	23	45
1427	23:46	23	46
1428	23:47	23	47
1429	23:48	23	48
1430	23:49	23	49
1431	23:50	23	50
1432	23:51	23	51
1433	23:52	23	52
1434	23:53	23	53
1435	23:54	23	54
1436	23:55	23	55
1437	23:56	23	56
1438	23:57	23	57
1439	23:58	23	58
1440	23:59	23	59
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: polls_choice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polls_choice_id_seq', 2, true);


--
-- Name: polls_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polls_profile_id_seq', 1, true);


--
-- Name: polls_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polls_question_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: date_dim date_dim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.date_dim
    ADD CONSTRAINT date_dim_pkey PRIMARY KEY (dateid);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: polls_choice polls_choice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_choice
    ADD CONSTRAINT polls_choice_pkey PRIMARY KEY (id);


--
-- Name: polls_profile polls_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_profile
    ADD CONSTRAINT polls_profile_pkey PRIMARY KEY (id);


--
-- Name: polls_profile polls_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_profile
    ADD CONSTRAINT polls_profile_user_id_key UNIQUE (user_id);


--
-- Name: polls_question polls_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_question
    ADD CONSTRAINT polls_question_pkey PRIMARY KEY (id);


--
-- Name: time_dim time_dim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_dim
    ADD CONSTRAINT time_dim_pkey PRIMARY KEY (timeid);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: polls_choice_question_id_c5b4b260; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX polls_choice_question_id_c5b4b260 ON public.polls_choice USING btree (question_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: article_fact fk_dimdate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_fact
    ADD CONSTRAINT fk_dimdate FOREIGN KEY (dateid) REFERENCES public.date_dim(dateid);


--
-- Name: article_fact1 fk_dimdate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_fact1
    ADD CONSTRAINT fk_dimdate FOREIGN KEY (dateid) REFERENCES public.date_dim(dateid);


--
-- Name: sentiment_dim fk_dimdate_sent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sentiment_dim
    ADD CONSTRAINT fk_dimdate_sent FOREIGN KEY (dateid) REFERENCES public.date_dim(dateid);


--
-- Name: article_fact fk_dimtime; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_fact
    ADD CONSTRAINT fk_dimtime FOREIGN KEY (timeid) REFERENCES public.time_dim(timeid);


--
-- Name: article_fact1 fk_dimtime; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_fact1
    ADD CONSTRAINT fk_dimtime FOREIGN KEY (timeid) REFERENCES public.time_dim(timeid);


--
-- Name: sentiment_dim fk_dimtime_sent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sentiment_dim
    ADD CONSTRAINT fk_dimtime_sent FOREIGN KEY (timeid) REFERENCES public.time_dim(timeid);


--
-- Name: polls_choice polls_choice_question_id_c5b4b260_fk_polls_question_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_choice
    ADD CONSTRAINT polls_choice_question_id_c5b4b260_fk_polls_question_id FOREIGN KEY (question_id) REFERENCES public.polls_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polls_profile polls_profile_user_id_093c2fb0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_profile
    ADD CONSTRAINT polls_profile_user_id_093c2fb0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

