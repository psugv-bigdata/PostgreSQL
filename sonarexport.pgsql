--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: action_plans; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE action_plans (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(200),
    description character varying(1000),
    deadline timestamp without time zone,
    user_login character varying(255),
    project_id integer,
    status character varying(10),
    kee character varying(100)
);


ALTER TABLE public.action_plans OWNER TO sonar;

--
-- Name: action_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE action_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_plans_id_seq OWNER TO sonar;

--
-- Name: action_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE action_plans_id_seq OWNED BY action_plans.id;


--
-- Name: active_dashboards; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE active_dashboards (
    id integer NOT NULL,
    dashboard_id integer NOT NULL,
    user_id integer,
    order_index integer
);


ALTER TABLE public.active_dashboards OWNER TO sonar;

--
-- Name: active_dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE active_dashboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_dashboards_id_seq OWNER TO sonar;

--
-- Name: active_dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE active_dashboards_id_seq OWNED BY active_dashboards.id;


--
-- Name: active_rule_parameters; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE active_rule_parameters (
    id integer NOT NULL,
    active_rule_id integer NOT NULL,
    rules_parameter_id integer NOT NULL,
    value character varying(4000),
    rules_parameter_key character varying(128)
);


ALTER TABLE public.active_rule_parameters OWNER TO sonar;

--
-- Name: active_rule_parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE active_rule_parameters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_rule_parameters_id_seq OWNER TO sonar;

--
-- Name: active_rule_parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE active_rule_parameters_id_seq OWNED BY active_rule_parameters.id;


--
-- Name: active_rules; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE active_rules (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    rule_id integer NOT NULL,
    failure_level integer NOT NULL,
    inheritance character varying(10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.active_rules OWNER TO sonar;

--
-- Name: active_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE active_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_rules_id_seq OWNER TO sonar;

--
-- Name: active_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE active_rules_id_seq OWNED BY active_rules.id;


--
-- Name: activities; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    user_login character varying(255),
    data_field text,
    log_type character varying(50),
    log_action character varying(50),
    log_message character varying(4000),
    log_key character varying(10485760)
);


ALTER TABLE public.activities OWNER TO sonar;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO sonar;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: analysis_reports; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE analysis_reports (
    id integer NOT NULL,
    project_key character varying(400) NOT NULL,
    report_status character varying(20) NOT NULL,
    project_name character varying(256),
    created_at bigint,
    updated_at bigint,
    started_at bigint,
    finished_at bigint,
    uuid character varying(50) NOT NULL
);


ALTER TABLE public.analysis_reports OWNER TO sonar;

--
-- Name: analysis_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE analysis_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analysis_reports_id_seq OWNER TO sonar;

--
-- Name: analysis_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE analysis_reports_id_seq OWNED BY analysis_reports.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE authors (
    id integer NOT NULL,
    person_id integer NOT NULL,
    login character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.authors OWNER TO sonar;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO sonar;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE authors_id_seq OWNED BY authors.id;


--
-- Name: characteristics; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE characteristics (
    id integer NOT NULL,
    kee character varying(100),
    name character varying(100),
    rule_id integer,
    characteristic_order integer,
    enabled boolean,
    parent_id integer,
    root_id integer,
    function_key character varying(100),
    factor_value numeric(30,20),
    factor_unit character varying(100),
    offset_value numeric(30,20),
    offset_unit character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.characteristics OWNER TO sonar;

--
-- Name: characteristics_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE characteristics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characteristics_id_seq OWNER TO sonar;

--
-- Name: characteristics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE characteristics_id_seq OWNED BY characteristics.id;


--
-- Name: dashboards; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE dashboards (
    id integer NOT NULL,
    user_id integer,
    name character varying(256),
    description character varying(1000),
    column_layout character varying(20),
    shared boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_global boolean
);


ALTER TABLE public.dashboards OWNER TO sonar;

--
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE dashboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboards_id_seq OWNER TO sonar;

--
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE dashboards_id_seq OWNED BY dashboards.id;


--
-- Name: dependencies; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE dependencies (
    id bigint NOT NULL,
    from_snapshot_id integer,
    from_resource_id integer,
    to_snapshot_id integer,
    to_resource_id integer,
    dep_usage character varying(30),
    dep_weight integer,
    project_snapshot_id integer,
    parent_dependency_id bigint,
    from_scope character varying(3),
    to_scope character varying(3)
);


ALTER TABLE public.dependencies OWNER TO sonar;

--
-- Name: dependencies_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE dependencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dependencies_id_seq OWNER TO sonar;

--
-- Name: dependencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE dependencies_id_seq OWNED BY dependencies.id;


--
-- Name: duplications_index; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE duplications_index (
    project_snapshot_id integer NOT NULL,
    snapshot_id integer NOT NULL,
    hash character varying(50) NOT NULL,
    index_in_file integer NOT NULL,
    start_line integer NOT NULL,
    end_line integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.duplications_index OWNER TO sonar;

--
-- Name: duplications_index_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE duplications_index_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.duplications_index_id_seq OWNER TO sonar;

--
-- Name: duplications_index_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE duplications_index_id_seq OWNED BY duplications_index.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    name character varying(400),
    resource_id integer,
    snapshot_id integer,
    category character varying(50),
    description character varying(4000),
    event_data character varying(4000),
    event_date bigint NOT NULL,
    created_at bigint NOT NULL
);


ALTER TABLE public.events OWNER TO sonar;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO sonar;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: file_sources; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE file_sources (
    id integer NOT NULL,
    project_uuid character varying(50) NOT NULL,
    file_uuid character varying(50) NOT NULL,
    line_hashes text,
    data_hash character varying(50),
    created_at bigint NOT NULL,
    updated_at bigint NOT NULL,
    src_hash character varying(50),
    binary_data bytea
);


ALTER TABLE public.file_sources OWNER TO sonar;

--
-- Name: file_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE file_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.file_sources_id_seq OWNER TO sonar;

--
-- Name: file_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE file_sources_id_seq OWNED BY file_sources.id;


--
-- Name: graphs; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE graphs (
    id integer NOT NULL,
    snapshot_id integer NOT NULL,
    resource_id integer NOT NULL,
    format character varying(20),
    perspective character varying(30),
    version character varying(20),
    root_vertex_id character varying(30),
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.graphs OWNER TO sonar;

--
-- Name: graphs_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE graphs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.graphs_id_seq OWNER TO sonar;

--
-- Name: graphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE graphs_id_seq OWNED BY graphs.id;


--
-- Name: group_roles; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE group_roles (
    id integer NOT NULL,
    group_id integer,
    resource_id integer,
    role character varying(64) NOT NULL
);


ALTER TABLE public.group_roles OWNER TO sonar;

--
-- Name: group_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE group_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_roles_id_seq OWNER TO sonar;

--
-- Name: group_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE group_roles_id_seq OWNED BY group_roles.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying(500),
    description character varying(200),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.groups OWNER TO sonar;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO sonar;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: groups_users; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE groups_users (
    user_id integer,
    group_id integer
);


ALTER TABLE public.groups_users OWNER TO sonar;

--
-- Name: issue_changes; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE issue_changes (
    id bigint NOT NULL,
    kee character varying(50),
    issue_key character varying(50) NOT NULL,
    user_login character varying(40),
    change_type character varying(20),
    change_data text,
    created_at bigint,
    updated_at bigint,
    issue_change_creation_date bigint
);


ALTER TABLE public.issue_changes OWNER TO sonar;

--
-- Name: issue_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE issue_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_changes_id_seq OWNER TO sonar;

--
-- Name: issue_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE issue_changes_id_seq OWNED BY issue_changes.id;


--
-- Name: issue_filter_favourites; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE issue_filter_favourites (
    id integer NOT NULL,
    user_login character varying(255) NOT NULL,
    issue_filter_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.issue_filter_favourites OWNER TO sonar;

--
-- Name: issue_filter_favourites_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE issue_filter_favourites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_filter_favourites_id_seq OWNER TO sonar;

--
-- Name: issue_filter_favourites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE issue_filter_favourites_id_seq OWNED BY issue_filter_favourites.id;


--
-- Name: issue_filters; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE issue_filters (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    user_login character varying(255),
    shared boolean DEFAULT false NOT NULL,
    description character varying(4000),
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.issue_filters OWNER TO sonar;

--
-- Name: issue_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE issue_filters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_filters_id_seq OWNER TO sonar;

--
-- Name: issue_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE issue_filters_id_seq OWNED BY issue_filters.id;


--
-- Name: issues; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE issues (
    id bigint NOT NULL,
    kee character varying(50) NOT NULL,
    rule_id integer,
    severity character varying(10),
    manual_severity boolean NOT NULL,
    message character varying(4000),
    line integer,
    effort_to_fix numeric(30,20),
    status character varying(20),
    resolution character varying(20),
    checksum character varying(1000),
    reporter character varying(255),
    assignee character varying(255),
    author_login character varying(255),
    action_plan_key character varying(50),
    issue_attributes character varying(4000),
    technical_debt integer,
    created_at bigint,
    updated_at bigint,
    issue_creation_date bigint,
    issue_update_date bigint,
    issue_close_date bigint,
    tags character varying(4000),
    component_uuid character varying(50),
    project_uuid character varying(50)
);


ALTER TABLE public.issues OWNER TO sonar;

--
-- Name: issues_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issues_id_seq OWNER TO sonar;

--
-- Name: issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE issues_id_seq OWNED BY issues.id;


--
-- Name: loaded_templates; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE loaded_templates (
    id integer NOT NULL,
    kee character varying(200),
    template_type character varying(15)
);


ALTER TABLE public.loaded_templates OWNER TO sonar;

--
-- Name: loaded_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE loaded_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loaded_templates_id_seq OWNER TO sonar;

--
-- Name: loaded_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE loaded_templates_id_seq OWNED BY loaded_templates.id;


--
-- Name: manual_measures; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE manual_measures (
    id bigint NOT NULL,
    metric_id integer NOT NULL,
    resource_id integer,
    value numeric(30,20),
    text_value character varying(4000),
    user_login character varying(255),
    description character varying(4000),
    created_at bigint,
    updated_at bigint
);


ALTER TABLE public.manual_measures OWNER TO sonar;

--
-- Name: manual_measures_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE manual_measures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manual_measures_id_seq OWNER TO sonar;

--
-- Name: manual_measures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE manual_measures_id_seq OWNED BY manual_measures.id;


--
-- Name: measure_filter_favourites; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE measure_filter_favourites (
    id integer NOT NULL,
    user_id integer NOT NULL,
    measure_filter_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.measure_filter_favourites OWNER TO sonar;

--
-- Name: measure_filter_favourites_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE measure_filter_favourites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.measure_filter_favourites_id_seq OWNER TO sonar;

--
-- Name: measure_filter_favourites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE measure_filter_favourites_id_seq OWNED BY measure_filter_favourites.id;


--
-- Name: measure_filters; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE measure_filters (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    user_id integer,
    shared boolean DEFAULT false NOT NULL,
    description character varying(4000),
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.measure_filters OWNER TO sonar;

--
-- Name: measure_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE measure_filters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.measure_filters_id_seq OWNER TO sonar;

--
-- Name: measure_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE measure_filters_id_seq OWNED BY measure_filters.id;


--
-- Name: metrics; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE metrics (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(255),
    direction integer DEFAULT 0 NOT NULL,
    domain character varying(64),
    short_name character varying(64),
    qualitative boolean DEFAULT false NOT NULL,
    val_type character varying(8),
    user_managed boolean DEFAULT false,
    enabled boolean DEFAULT true,
    origin character varying(3),
    worst_value numeric(30,20),
    best_value numeric(30,20),
    optimized_best_value boolean,
    hidden boolean,
    delete_historical_data boolean
);


ALTER TABLE public.metrics OWNER TO sonar;

--
-- Name: metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metrics_id_seq OWNER TO sonar;

--
-- Name: metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE metrics_id_seq OWNED BY metrics.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE notifications (
    id integer NOT NULL,
    data bytea
);


ALTER TABLE public.notifications OWNER TO sonar;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO sonar;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE notifications_id_seq OWNED BY notifications.id;


--
-- Name: perm_templates_groups; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE perm_templates_groups (
    id integer NOT NULL,
    group_id integer,
    template_id integer NOT NULL,
    permission_reference character varying(64) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.perm_templates_groups OWNER TO sonar;

--
-- Name: perm_templates_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE perm_templates_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perm_templates_groups_id_seq OWNER TO sonar;

--
-- Name: perm_templates_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE perm_templates_groups_id_seq OWNED BY perm_templates_groups.id;


--
-- Name: perm_templates_users; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE perm_templates_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    template_id integer NOT NULL,
    permission_reference character varying(64) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.perm_templates_users OWNER TO sonar;

--
-- Name: perm_templates_users_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE perm_templates_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perm_templates_users_id_seq OWNER TO sonar;

--
-- Name: perm_templates_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE perm_templates_users_id_seq OWNED BY perm_templates_users.id;


--
-- Name: permission_templates; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE permission_templates (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    kee character varying(100) NOT NULL,
    description character varying(4000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    key_pattern character varying(500)
);


ALTER TABLE public.permission_templates OWNER TO sonar;

--
-- Name: permission_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE permission_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_templates_id_seq OWNER TO sonar;

--
-- Name: permission_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE permission_templates_id_seq OWNED BY permission_templates.id;


--
-- Name: project_links; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE project_links (
    id integer NOT NULL,
    project_id integer NOT NULL,
    link_type character varying(20),
    name character varying(128),
    href character varying(2048) NOT NULL
);


ALTER TABLE public.project_links OWNER TO sonar;

--
-- Name: project_links_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE project_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_links_id_seq OWNER TO sonar;

--
-- Name: project_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE project_links_id_seq OWNED BY project_links.id;


--
-- Name: project_measures; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE project_measures (
    id bigint NOT NULL,
    value numeric(30,20),
    metric_id integer NOT NULL,
    snapshot_id integer,
    rule_id integer,
    rules_category_id integer,
    text_value character varying(4000),
    tendency integer,
    measure_date timestamp without time zone,
    project_id integer,
    alert_status character varying(5),
    alert_text character varying(4000),
    url character varying(2000),
    description character varying(4000),
    rule_priority integer,
    characteristic_id integer,
    variation_value_1 numeric(30,20),
    variation_value_2 numeric(30,20),
    variation_value_3 numeric(30,20),
    variation_value_4 numeric(30,20),
    variation_value_5 numeric(30,20),
    person_id integer,
    measure_data bytea
);


ALTER TABLE public.project_measures OWNER TO sonar;

--
-- Name: project_measures_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE project_measures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_measures_id_seq OWNER TO sonar;

--
-- Name: project_measures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE project_measures_id_seq OWNED BY project_measures.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE projects (
    id integer NOT NULL,
    name character varying(256),
    description character varying(2000),
    enabled boolean DEFAULT true NOT NULL,
    scope character varying(3),
    qualifier character varying(10),
    kee character varying(400),
    root_id integer,
    language character varying(20),
    copy_resource_id integer,
    long_name character varying(256),
    person_id integer,
    created_at timestamp without time zone,
    path character varying(2000),
    deprecated_kee character varying(400),
    uuid character varying(50),
    project_uuid character varying(50),
    module_uuid character varying(50),
    module_uuid_path character varying(4000),
    authorization_updated_at bigint
);


ALTER TABLE public.projects OWNER TO sonar;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO sonar;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE properties (
    id integer NOT NULL,
    prop_key character varying(512),
    resource_id integer,
    text_value text,
    user_id integer
);


ALTER TABLE public.properties OWNER TO sonar;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_id_seq OWNER TO sonar;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE properties_id_seq OWNED BY properties.id;


--
-- Name: quality_gate_conditions; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE quality_gate_conditions (
    id integer NOT NULL,
    qgate_id integer,
    metric_id integer,
    period integer,
    operator character varying(3),
    value_error character varying(64),
    value_warning character varying(64),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.quality_gate_conditions OWNER TO sonar;

--
-- Name: quality_gate_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE quality_gate_conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quality_gate_conditions_id_seq OWNER TO sonar;

--
-- Name: quality_gate_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE quality_gate_conditions_id_seq OWNED BY quality_gate_conditions.id;


--
-- Name: quality_gates; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE quality_gates (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.quality_gates OWNER TO sonar;

--
-- Name: quality_gates_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE quality_gates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quality_gates_id_seq OWNER TO sonar;

--
-- Name: quality_gates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE quality_gates_id_seq OWNED BY quality_gates.id;


--
-- Name: resource_index; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE resource_index (
    id integer NOT NULL,
    kee character varying(400) NOT NULL,
    "position" integer NOT NULL,
    name_size integer NOT NULL,
    resource_id integer NOT NULL,
    root_project_id integer NOT NULL,
    qualifier character varying(10) NOT NULL
);


ALTER TABLE public.resource_index OWNER TO sonar;

--
-- Name: resource_index_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE resource_index_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_index_id_seq OWNER TO sonar;

--
-- Name: resource_index_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE resource_index_id_seq OWNED BY resource_index.id;


--
-- Name: rules; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE rules (
    id integer NOT NULL,
    plugin_rule_key character varying(200) NOT NULL,
    plugin_config_key character varying(200),
    plugin_name character varying(255) NOT NULL,
    description text,
    priority integer,
    template_id integer,
    name character varying(200),
    status character varying(40),
    language character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    note_created_at timestamp without time zone,
    note_updated_at timestamp without time zone,
    note_user_login character varying(255),
    note_data text,
    characteristic_id integer,
    default_characteristic_id integer,
    remediation_function character varying(20),
    default_remediation_function character varying(20),
    remediation_coeff character varying(20),
    default_remediation_coeff character varying(20),
    remediation_offset character varying(20),
    default_remediation_offset character varying(20),
    effort_to_fix_description character varying(4000),
    tags character varying(4000),
    system_tags character varying(4000),
    is_template boolean DEFAULT false NOT NULL,
    description_format character varying(20)
);


ALTER TABLE public.rules OWNER TO sonar;

--
-- Name: rules_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rules_id_seq OWNER TO sonar;

--
-- Name: rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE rules_id_seq OWNED BY rules.id;


--
-- Name: rules_parameters; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE rules_parameters (
    id integer NOT NULL,
    rule_id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(4000),
    param_type character varying(512) NOT NULL,
    default_value character varying(4000)
);


ALTER TABLE public.rules_parameters OWNER TO sonar;

--
-- Name: rules_parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE rules_parameters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rules_parameters_id_seq OWNER TO sonar;

--
-- Name: rules_parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE rules_parameters_id_seq OWNED BY rules_parameters.id;


--
-- Name: rules_profiles; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE rules_profiles (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    language character varying(20),
    kee character varying(255) NOT NULL,
    parent_kee character varying(255),
    rules_updated_at character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.rules_profiles OWNER TO sonar;

--
-- Name: rules_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE rules_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rules_profiles_id_seq OWNER TO sonar;

--
-- Name: rules_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE rules_profiles_id_seq OWNED BY rules_profiles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(10485760) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO sonar;

--
-- Name: semaphores; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE semaphores (
    id integer NOT NULL,
    name character varying(4000) NOT NULL,
    checksum character varying(200) NOT NULL,
    created_at bigint,
    updated_at bigint,
    locked_at bigint
);


ALTER TABLE public.semaphores OWNER TO sonar;

--
-- Name: semaphores_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE semaphores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.semaphores_id_seq OWNER TO sonar;

--
-- Name: semaphores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE semaphores_id_seq OWNED BY semaphores.id;


--
-- Name: snapshots; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE snapshots (
    id integer NOT NULL,
    project_id integer NOT NULL,
    parent_snapshot_id integer,
    status character varying(4) DEFAULT 'U'::character varying NOT NULL,
    islast boolean DEFAULT false NOT NULL,
    scope character varying(3),
    qualifier character varying(10),
    root_snapshot_id integer,
    version character varying(500),
    path character varying(500),
    depth integer,
    root_project_id integer,
    period1_mode character varying(100),
    period1_param character varying(100),
    period2_mode character varying(100),
    period2_param character varying(100),
    period3_mode character varying(100),
    period3_param character varying(100),
    period4_mode character varying(100),
    period4_param character varying(100),
    period5_mode character varying(100),
    period5_param character varying(100),
    purge_status integer,
    created_at bigint,
    build_date bigint,
    period1_date bigint,
    period2_date bigint,
    period3_date bigint,
    period4_date bigint,
    period5_date bigint
);


ALTER TABLE public.snapshots OWNER TO sonar;

--
-- Name: snapshots_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.snapshots_id_seq OWNER TO sonar;

--
-- Name: snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE snapshots_id_seq OWNED BY snapshots.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE user_roles (
    id integer NOT NULL,
    user_id integer,
    resource_id integer,
    role character varying(64) NOT NULL
);


ALTER TABLE public.user_roles OWNER TO sonar;

--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_roles_id_seq OWNER TO sonar;

--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE user_roles_id_seq OWNED BY user_roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    login character varying(255),
    name character varying(200),
    email character varying(100),
    crypted_password character varying(40),
    salt character varying(40),
    remember_token character varying(500),
    remember_token_expires_at timestamp without time zone,
    active boolean DEFAULT true,
    created_at bigint,
    updated_at bigint,
    scm_accounts character varying(4000)
);


ALTER TABLE public.users OWNER TO sonar;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO sonar;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: widget_properties; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE widget_properties (
    id integer NOT NULL,
    widget_id integer NOT NULL,
    kee character varying(100),
    text_value character varying(4000)
);


ALTER TABLE public.widget_properties OWNER TO sonar;

--
-- Name: widget_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE widget_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.widget_properties_id_seq OWNER TO sonar;

--
-- Name: widget_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE widget_properties_id_seq OWNED BY widget_properties.id;


--
-- Name: widgets; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE widgets (
    id integer NOT NULL,
    dashboard_id integer NOT NULL,
    widget_key character varying(256) NOT NULL,
    name character varying(256),
    description character varying(1000),
    column_index integer,
    row_index integer,
    configured boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    resource_id integer
);


ALTER TABLE public.widgets OWNER TO sonar;

--
-- Name: widgets_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE widgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.widgets_id_seq OWNER TO sonar;

--
-- Name: widgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE widgets_id_seq OWNED BY widgets.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY action_plans ALTER COLUMN id SET DEFAULT nextval('action_plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY active_dashboards ALTER COLUMN id SET DEFAULT nextval('active_dashboards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY active_rule_parameters ALTER COLUMN id SET DEFAULT nextval('active_rule_parameters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY active_rules ALTER COLUMN id SET DEFAULT nextval('active_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY analysis_reports ALTER COLUMN id SET DEFAULT nextval('analysis_reports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY characteristics ALTER COLUMN id SET DEFAULT nextval('characteristics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY dashboards ALTER COLUMN id SET DEFAULT nextval('dashboards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY dependencies ALTER COLUMN id SET DEFAULT nextval('dependencies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY duplications_index ALTER COLUMN id SET DEFAULT nextval('duplications_index_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY file_sources ALTER COLUMN id SET DEFAULT nextval('file_sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY graphs ALTER COLUMN id SET DEFAULT nextval('graphs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY group_roles ALTER COLUMN id SET DEFAULT nextval('group_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY issue_changes ALTER COLUMN id SET DEFAULT nextval('issue_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY issue_filter_favourites ALTER COLUMN id SET DEFAULT nextval('issue_filter_favourites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY issue_filters ALTER COLUMN id SET DEFAULT nextval('issue_filters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY issues ALTER COLUMN id SET DEFAULT nextval('issues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY loaded_templates ALTER COLUMN id SET DEFAULT nextval('loaded_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY manual_measures ALTER COLUMN id SET DEFAULT nextval('manual_measures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY measure_filter_favourites ALTER COLUMN id SET DEFAULT nextval('measure_filter_favourites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY measure_filters ALTER COLUMN id SET DEFAULT nextval('measure_filters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY metrics ALTER COLUMN id SET DEFAULT nextval('metrics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY notifications ALTER COLUMN id SET DEFAULT nextval('notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY perm_templates_groups ALTER COLUMN id SET DEFAULT nextval('perm_templates_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY perm_templates_users ALTER COLUMN id SET DEFAULT nextval('perm_templates_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY permission_templates ALTER COLUMN id SET DEFAULT nextval('permission_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY project_links ALTER COLUMN id SET DEFAULT nextval('project_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY project_measures ALTER COLUMN id SET DEFAULT nextval('project_measures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY properties ALTER COLUMN id SET DEFAULT nextval('properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY quality_gate_conditions ALTER COLUMN id SET DEFAULT nextval('quality_gate_conditions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY quality_gates ALTER COLUMN id SET DEFAULT nextval('quality_gates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY resource_index ALTER COLUMN id SET DEFAULT nextval('resource_index_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY rules ALTER COLUMN id SET DEFAULT nextval('rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY rules_parameters ALTER COLUMN id SET DEFAULT nextval('rules_parameters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY rules_profiles ALTER COLUMN id SET DEFAULT nextval('rules_profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY semaphores ALTER COLUMN id SET DEFAULT nextval('semaphores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY snapshots ALTER COLUMN id SET DEFAULT nextval('snapshots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY user_roles ALTER COLUMN id SET DEFAULT nextval('user_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY widget_properties ALTER COLUMN id SET DEFAULT nextval('widget_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY widgets ALTER COLUMN id SET DEFAULT nextval('widgets_id_seq'::regclass);


--
-- Data for Name: action_plans; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY action_plans (id, created_at, updated_at, name, description, deadline, user_login, project_id, status, kee) FROM stdin;
\.


--
-- Name: action_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('action_plans_id_seq', 1, false);


--
-- Data for Name: active_dashboards; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY active_dashboards (id, dashboard_id, user_id, order_index) FROM stdin;
1	1	\N	1
2	4	\N	2
3	2	\N	3
4	3	\N	4
\.


--
-- Name: active_dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('active_dashboards_id_seq', 4, true);


--
-- Data for Name: active_rule_parameters; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY active_rule_parameters (id, active_rule_id, rules_parameter_id, value, rules_parameter_key) FROM stdin;
1	2	1	65.0	minimumBranchCoverageRatio
2	4	22	10	Threshold
3	5	28	200	max
4	8	30	7	max
5	10	21	^[a-z][a-zA-Z0-9]*$	format
6	11	20	^[A-Z][a-zA-Z0-9]*$	format
7	12	38	^[A-Z][a-zA-Z0-9]*$	format
8	13	40	^[A-Z][A-Z0-9]*(_[A-Z0-9]+)*$	format
9	14	39	^[a-z][a-zA-Z0-9]*$	format
10	15	36	^[a-z][a-zA-Z0-9]*$	format
11	16	37	^[A-Z]$	format
12	17	34	^[a-z]+(\\.[a-z][a-z0-9]*)*$	format
13	42	26	3	max
14	57	24	3	max
15	61	23	5	max
16	63	19	java.lang.InterruptedException, java.lang.NumberFormatException, java.text.ParseException, java.net.MalformedURLException	exceptions
17	65	27	20	Max
18	77	13	3	threshold
19	93	7	LOG(?:GER)?	format
20	118	29	30	maximum
\.


--
-- Name: active_rule_parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('active_rule_parameters_id_seq', 20, true);


--
-- Data for Name: active_rules; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY active_rules (id, profile_id, rule_id, failure_level, inheritance, created_at, updated_at) FROM stdin;
1	1	4	2	\N	2016-10-11 14:21:02.926	2016-10-11 14:21:02.926
2	1	1	2	\N	2016-10-11 14:21:02.964	2016-10-11 14:21:02.964
3	1	249	1	\N	2016-10-11 14:21:03.009	2016-10-11 14:21:03.009
4	1	142	2	\N	2016-10-11 14:21:03.058	2016-10-11 14:21:03.058
5	1	187	2	\N	2016-10-11 14:21:03.109	2016-10-11 14:21:03.109
6	1	74	2	\N	2016-10-11 14:21:03.158	2016-10-11 14:21:03.158
7	1	241	2	\N	2016-10-11 14:21:03.208	2016-10-11 14:21:03.208
8	1	234	2	\N	2016-10-11 14:21:03.273	2016-10-11 14:21:03.273
9	1	227	2	\N	2016-10-11 14:21:03.322	2016-10-11 14:21:03.322
10	1	141	1	\N	2016-10-11 14:21:03.371	2016-10-11 14:21:03.371
11	1	139	1	\N	2016-10-11 14:21:03.421	2016-10-11 14:21:03.421
12	1	264	1	\N	2016-10-11 14:21:03.47	2016-10-11 14:21:03.47
13	1	270	1	\N	2016-10-11 14:21:03.52	2016-10-11 14:21:03.52
14	1	268	1	\N	2016-10-11 14:21:03.57	2016-10-11 14:21:03.57
15	1	260	1	\N	2016-10-11 14:21:03.621	2016-10-11 14:21:03.621
16	1	262	1	\N	2016-10-11 14:21:03.735	2016-10-11 14:21:03.735
17	1	256	1	\N	2016-10-11 14:21:03.759	2016-10-11 14:21:03.759
18	1	257	1	\N	2016-10-11 14:21:03.776	2016-10-11 14:21:03.776
19	1	245	1	\N	2016-10-11 14:21:03.792	2016-10-11 14:21:03.792
20	1	206	2	\N	2016-10-11 14:21:03.808	2016-10-11 14:21:03.808
21	1	104	3	\N	2016-10-11 14:21:03.825	2016-10-11 14:21:03.825
22	1	29	3	\N	2016-10-11 14:21:03.842	2016-10-11 14:21:03.842
23	1	56	4	\N	2016-10-11 14:21:03.858	2016-10-11 14:21:03.858
24	1	58	2	\N	2016-10-11 14:21:03.897	2016-10-11 14:21:03.897
25	1	30	2	\N	2016-10-11 14:21:03.963	2016-10-11 14:21:03.963
26	1	149	2	\N	2016-10-11 14:21:03.991	2016-10-11 14:21:03.991
27	1	197	2	\N	2016-10-11 14:21:03.999	2016-10-11 14:21:03.999
28	1	89	1	\N	2016-10-11 14:21:04.008	2016-10-11 14:21:04.008
29	1	16	1	\N	2016-10-11 14:21:04.016	2016-10-11 14:21:04.016
30	1	108	2	\N	2016-10-11 14:21:04.024	2016-10-11 14:21:04.024
31	1	209	1	\N	2016-10-11 14:21:04.032	2016-10-11 14:21:04.032
32	1	118	1	\N	2016-10-11 14:21:04.041	2016-10-11 14:21:04.041
33	1	119	2	\N	2016-10-11 14:21:04.08	2016-10-11 14:21:04.08
34	1	161	2	\N	2016-10-11 14:21:04.138	2016-10-11 14:21:04.138
35	1	263	0	\N	2016-10-11 14:21:04.167	2016-10-11 14:21:04.167
36	1	265	2	\N	2016-10-11 14:21:04.183	2016-10-11 14:21:04.183
37	1	267	0	\N	2016-10-11 14:21:04.2	2016-10-11 14:21:04.2
38	1	214	2	\N	2016-10-11 14:21:04.217	2016-10-11 14:21:04.217
39	1	261	2	\N	2016-10-11 14:21:04.233	2016-10-11 14:21:04.233
40	1	205	1	\N	2016-10-11 14:21:04.241	2016-10-11 14:21:04.241
41	1	203	1	\N	2016-10-11 14:21:04.249	2016-10-11 14:21:04.249
42	1	173	2	\N	2016-10-11 14:21:04.289	2016-10-11 14:21:04.289
43	1	235	2	\N	2016-10-11 14:21:04.347	2016-10-11 14:21:04.347
44	1	250	3	\N	2016-10-11 14:21:04.375	2016-10-11 14:21:04.375
45	1	240	4	\N	2016-10-11 14:21:04.392	2016-10-11 14:21:04.392
46	1	246	2	\N	2016-10-11 14:21:04.4	2016-10-11 14:21:04.4
47	1	152	2	\N	2016-10-11 14:21:04.407	2016-10-11 14:21:04.407
48	1	150	2	\N	2016-10-11 14:21:04.416	2016-10-11 14:21:04.416
49	1	228	2	\N	2016-10-11 14:21:04.424	2016-10-11 14:21:04.424
50	1	183	2	\N	2016-10-11 14:21:04.432	2016-10-11 14:21:04.432
51	1	137	2	\N	2016-10-11 14:21:04.472	2016-10-11 14:21:04.472
52	1	182	1	\N	2016-10-11 14:21:04.53	2016-10-11 14:21:04.53
53	1	127	2	\N	2016-10-11 14:21:04.559	2016-10-11 14:21:04.559
54	1	97	2	\N	2016-10-11 14:21:04.575	2016-10-11 14:21:04.575
55	1	131	2	\N	2016-10-11 14:21:04.583	2016-10-11 14:21:04.583
56	1	170	2	\N	2016-10-11 14:21:04.591	2016-10-11 14:21:04.591
57	1	146	2	\N	2016-10-11 14:21:04.6	2016-10-11 14:21:04.6
58	1	156	4	\N	2016-10-11 14:21:04.616	2016-10-11 14:21:04.616
59	1	143	2	\N	2016-10-11 14:21:04.625	2016-10-11 14:21:04.625
60	1	157	2	\N	2016-10-11 14:21:04.664	2016-10-11 14:21:04.664
61	1	144	2	\N	2016-10-11 14:21:04.721	2016-10-11 14:21:04.721
62	1	140	3	\N	2016-10-11 14:21:04.751	2016-10-11 14:21:04.751
63	1	133	3	\N	2016-10-11 14:21:04.767	2016-10-11 14:21:04.767
64	1	68	2	\N	2016-10-11 14:21:04.783	2016-10-11 14:21:04.783
65	1	174	2	\N	2016-10-11 14:21:04.791	2016-10-11 14:21:04.791
66	1	69	2	\N	2016-10-11 14:21:04.808	2016-10-11 14:21:04.808
67	1	112	2	\N	2016-10-11 14:21:04.824	2016-10-11 14:21:04.824
68	1	166	2	\N	2016-10-11 14:21:04.864	2016-10-11 14:21:04.864
69	1	163	1	\N	2016-10-11 14:21:04.921	2016-10-11 14:21:04.921
70	1	190	2	\N	2016-10-11 14:21:04.95	2016-10-11 14:21:04.95
71	1	191	2	\N	2016-10-11 14:21:04.967	2016-10-11 14:21:04.967
72	1	147	1	\N	2016-10-11 14:21:04.983	2016-10-11 14:21:04.983
73	1	253	3	\N	2016-10-11 14:21:04.991	2016-10-11 14:21:04.991
74	1	75	1	\N	2016-10-11 14:21:04.999	2016-10-11 14:21:04.999
75	1	73	2	\N	2016-10-11 14:21:05.008	2016-10-11 14:21:05.008
76	1	71	2	\N	2016-10-11 14:21:05.016	2016-10-11 14:21:05.016
77	1	70	1	\N	2016-10-11 14:21:05.055	2016-10-11 14:21:05.055
78	1	154	2	\N	2016-10-11 14:21:05.112	2016-10-11 14:21:05.112
79	1	39	3	\N	2016-10-11 14:21:05.142	2016-10-11 14:21:05.142
80	1	79	1	\N	2016-10-11 14:21:05.158	2016-10-11 14:21:05.158
81	1	35	1	\N	2016-10-11 14:21:05.175	2016-10-11 14:21:05.175
82	1	36	3	\N	2016-10-11 14:21:05.183	2016-10-11 14:21:05.183
83	1	82	2	\N	2016-10-11 14:21:05.191	2016-10-11 14:21:05.191
84	1	52	1	\N	2016-10-11 14:21:05.199	2016-10-11 14:21:05.199
85	1	13	3	\N	2016-10-11 14:21:05.208	2016-10-11 14:21:05.208
86	1	44	3	\N	2016-10-11 14:21:05.247	2016-10-11 14:21:05.247
87	1	10	4	\N	2016-10-11 14:21:05.304	2016-10-11 14:21:05.304
88	1	42	3	\N	2016-10-11 14:21:05.334	2016-10-11 14:21:05.334
89	1	95	1	\N	2016-10-11 14:21:05.35	2016-10-11 14:21:05.35
90	1	19	2	\N	2016-10-11 14:21:05.358	2016-10-11 14:21:05.358
91	1	31	2	\N	2016-10-11 14:21:05.366	2016-10-11 14:21:05.366
92	1	27	2	\N	2016-10-11 14:21:05.383	2016-10-11 14:21:05.383
93	1	26	1	\N	2016-10-11 14:21:05.391	2016-10-11 14:21:05.391
94	1	22	3	\N	2016-10-11 14:21:05.408	2016-10-11 14:21:05.408
95	1	37	2	\N	2016-10-11 14:21:05.447	2016-10-11 14:21:05.447
96	1	23	2	\N	2016-10-11 14:21:05.488	2016-10-11 14:21:05.488
97	1	50	1	\N	2016-10-11 14:21:05.53	2016-10-11 14:21:05.53
98	1	14	3	\N	2016-10-11 14:21:05.571	2016-10-11 14:21:05.571
99	1	45	2	\N	2016-10-11 14:21:05.613	2016-10-11 14:21:05.613
100	1	196	2	\N	2016-10-11 14:21:05.654	2016-10-11 14:21:05.654
101	1	176	2	\N	2016-10-11 14:21:05.697	2016-10-11 14:21:05.697
102	1	21	2	\N	2016-10-11 14:21:05.738	2016-10-11 14:21:05.738
103	1	220	2	\N	2016-10-11 14:21:05.789	2016-10-11 14:21:05.789
104	1	207	2	\N	2016-10-11 14:21:05.845	2016-10-11 14:21:05.845
105	1	55	1	\N	2016-10-11 14:21:05.875	2016-10-11 14:21:05.875
106	1	111	2	\N	2016-10-11 14:21:05.892	2016-10-11 14:21:05.892
107	1	41	3	\N	2016-10-11 14:21:05.908	2016-10-11 14:21:05.908
108	1	180	3	\N	2016-10-11 14:21:05.916	2016-10-11 14:21:05.916
109	1	204	1	\N	2016-10-11 14:21:05.924	2016-10-11 14:21:05.924
110	1	120	2	\N	2016-10-11 14:21:05.933	2016-10-11 14:21:05.933
111	1	188	1	\N	2016-10-11 14:21:05.941	2016-10-11 14:21:05.941
112	1	230	2	\N	2016-10-11 14:21:05.95	2016-10-11 14:21:05.95
113	1	184	2	\N	2016-10-11 14:21:05.988	2016-10-11 14:21:05.988
114	1	185	3	\N	2016-10-11 14:21:06.03	2016-10-11 14:21:06.03
115	1	223	2	\N	2016-10-11 14:21:06.072	2016-10-11 14:21:06.072
116	1	86	3	\N	2016-10-11 14:21:06.113	2016-10-11 14:21:06.113
117	1	233	3	\N	2016-10-11 14:21:06.155	2016-10-11 14:21:06.155
118	1	211	2	\N	2016-10-11 14:21:06.196	2016-10-11 14:21:06.196
119	1	67	3	\N	2016-10-11 14:21:06.238	2016-10-11 14:21:06.238
120	1	200	3	\N	2016-10-11 14:21:06.279	2016-10-11 14:21:06.279
121	1	91	3	\N	2016-10-11 14:21:06.322	2016-10-11 14:21:06.322
122	1	113	2	\N	2016-10-11 14:21:06.373	2016-10-11 14:21:06.373
123	1	87	3	\N	2016-10-11 14:21:06.429	2016-10-11 14:21:06.429
124	1	8	2	\N	2016-10-11 14:21:06.458	2016-10-11 14:21:06.458
125	1	193	2	\N	2016-10-11 14:21:06.475	2016-10-11 14:21:06.475
126	1	208	1	\N	2016-10-11 14:21:06.491	2016-10-11 14:21:06.491
127	1	247	3	\N	2016-10-11 14:21:06.499	2016-10-11 14:21:06.499
128	1	167	2	\N	2016-10-11 14:21:06.508	2016-10-11 14:21:06.508
129	1	100	2	\N	2016-10-11 14:21:06.525	2016-10-11 14:21:06.525
130	1	271	3	\N	2016-10-11 14:21:06.541	2016-10-11 14:21:06.541
131	1	239	3	\N	2016-10-11 14:21:06.579	2016-10-11 14:21:06.579
132	1	217	2	\N	2016-10-11 14:21:06.621	2016-10-11 14:21:06.621
133	1	7	3	\N	2016-10-11 14:21:06.663	2016-10-11 14:21:06.663
134	1	124	3	\N	2016-10-11 14:21:06.704	2016-10-11 14:21:06.704
135	1	248	3	\N	2016-10-11 14:21:06.746	2016-10-11 14:21:06.746
136	1	17	3	\N	2016-10-11 14:21:06.788	2016-10-11 14:21:06.788
137	1	107	3	\N	2016-10-11 14:21:06.83	2016-10-11 14:21:06.83
138	1	242	3	\N	2016-10-11 14:21:06.871	2016-10-11 14:21:06.871
139	1	125	4	\N	2016-10-11 14:21:06.922	2016-10-11 14:21:06.922
140	1	254	4	\N	2016-10-11 14:21:06.97	2016-10-11 14:21:06.97
141	1	121	4	\N	2016-10-11 14:21:07	2016-10-11 14:21:07
142	1	114	4	\N	2016-10-11 14:21:07.017	2016-10-11 14:21:07.017
143	1	129	3	\N	2016-10-11 14:21:07.033	2016-10-11 14:21:07.033
144	1	134	3	\N	2016-10-11 14:21:07.05	2016-10-11 14:21:07.05
145	1	117	3	\N	2016-10-11 14:21:07.367	2016-10-11 14:21:07.367
146	1	269	3	\N	2016-10-11 14:21:07.383	2016-10-11 14:21:07.383
147	1	243	3	\N	2016-10-11 14:21:07.399	2016-10-11 14:21:07.399
148	1	258	4	\N	2016-10-11 14:21:07.438	2016-10-11 14:21:07.438
149	1	158	3	\N	2016-10-11 14:21:07.487	2016-10-11 14:21:07.487
150	1	175	3	\N	2016-10-11 14:21:07.537	2016-10-11 14:21:07.537
151	1	168	3	\N	2016-10-11 14:21:07.587	2016-10-11 14:21:07.587
152	1	159	2	\N	2016-10-11 14:21:07.637	2016-10-11 14:21:07.637
153	1	171	3	\N	2016-10-11 14:21:07.687	2016-10-11 14:21:07.687
154	1	224	4	\N	2016-10-11 14:21:07.737	2016-10-11 14:21:07.737
155	1	63	3	\N	2016-10-11 14:21:07.788	2016-10-11 14:21:07.788
156	1	251	3	\N	2016-10-11 14:21:07.837	2016-10-11 14:21:07.837
157	1	179	3	\N	2016-10-11 14:21:07.887	2016-10-11 14:21:07.887
158	1	164	3	\N	2016-10-11 14:21:07.947	2016-10-11 14:21:07.947
159	1	160	4	\N	2016-10-11 14:21:08.003	2016-10-11 14:21:08.003
160	1	155	4	\N	2016-10-11 14:21:08.034	2016-10-11 14:21:08.034
161	1	177	4	\N	2016-10-11 14:21:08.051	2016-10-11 14:21:08.051
162	1	60	3	\N	2016-10-11 14:21:08.067	2016-10-11 14:21:08.067
163	1	229	3	\N	2016-10-11 14:21:08.084	2016-10-11 14:21:08.084
164	1	105	3	\N	2016-10-11 14:21:08.101	2016-10-11 14:21:08.101
165	1	106	1	\N	2016-10-11 14:21:08.109	2016-10-11 14:21:08.109
166	1	99	3	\N	2016-10-11 14:21:08.145	2016-10-11 14:21:08.145
167	1	61	2	\N	2016-10-11 14:21:08.187	2016-10-11 14:21:08.187
168	1	115	2	\N	2016-10-11 14:21:08.229	2016-10-11 14:21:08.229
169	1	83	2	\N	2016-10-11 14:21:08.276	2016-10-11 14:21:08.276
170	1	169	2	\N	2016-10-11 14:21:08.326	2016-10-11 14:21:08.326
171	1	212	2	\N	2016-10-11 14:21:08.376	2016-10-11 14:21:08.376
172	1	192	3	\N	2016-10-11 14:21:08.423	2016-10-11 14:21:08.423
173	1	98	3	\N	2016-10-11 14:21:08.464	2016-10-11 14:21:08.464
174	1	81	3	\N	2016-10-11 14:21:08.516	2016-10-11 14:21:08.516
175	1	78	2	\N	2016-10-11 14:21:08.565	2016-10-11 14:21:08.565
176	1	151	4	\N	2016-10-11 14:21:08.615	2016-10-11 14:21:08.615
177	1	132	2	\N	2016-10-11 14:21:08.665	2016-10-11 14:21:08.665
178	1	62	3	\N	2016-10-11 14:21:08.715	2016-10-11 14:21:08.715
179	1	213	3	\N	2016-10-11 14:21:08.771	2016-10-11 14:21:08.771
180	1	130	2	\N	2016-10-11 14:21:08.813	2016-10-11 14:21:08.813
181	1	32	2	\N	2016-10-11 14:21:08.855	2016-10-11 14:21:08.855
182	1	237	3	\N	2016-10-11 14:21:08.896	2016-10-11 14:21:08.896
183	1	72	2	\N	2016-10-11 14:21:08.937	2016-10-11 14:21:08.937
184	1	85	3	\N	2016-10-11 14:21:08.979	2016-10-11 14:21:08.979
185	1	216	2	\N	2016-10-11 14:21:09.021	2016-10-11 14:21:09.021
186	1	219	3	\N	2016-10-11 14:21:09.063	2016-10-11 14:21:09.063
187	1	148	3	\N	2016-10-11 14:21:09.104	2016-10-11 14:21:09.104
188	1	135	2	\N	2016-10-11 14:21:09.155	2016-10-11 14:21:09.155
189	1	165	3	\N	2016-10-11 14:21:09.197	2016-10-11 14:21:09.197
190	1	218	4	\N	2016-10-11 14:21:09.238	2016-10-11 14:21:09.238
191	1	194	2	\N	2016-10-11 14:21:09.28	2016-10-11 14:21:09.28
192	1	34	3	\N	2016-10-11 14:21:09.321	2016-10-11 14:21:09.321
\.


--
-- Name: active_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('active_rules_id_seq', 192, true);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY activities (id, created_at, user_login, data_field, log_type, log_action, log_message, log_key) FROM stdin;
1	2016-10-11 14:21:02.932	\N	key=java-sonar-way-09275:common-java:DuplicatedBlocks;ruleKey=common-java:DuplicatedBlocks;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	444df948-fa7b-4c61-a881-64e8d8a238da
2	2016-10-11 14:21:02.969	\N	key=java-sonar-way-09275:common-java:InsufficientBranchCoverage;ruleKey=common-java:InsufficientBranchCoverage;profileKey=java-sonar-way-09275;param_minimumBranchCoverageRatio=65.0;severity=MAJOR	QPROFILE	ACTIVATED	\N	3e18a146-c7f2-49eb-b2ba-14bb8e13d57d
3	2016-10-11 14:21:03.01	\N	key=java-sonar-way-09275:squid:S00105;ruleKey=squid:S00105;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	65fd105e-018a-4a51-a3cc-03b5005bda22
4	2016-10-11 14:21:03.06	\N	key=java-sonar-way-09275:squid:MethodCyclomaticComplexity;ruleKey=squid:MethodCyclomaticComplexity;profileKey=java-sonar-way-09275;param_Threshold=10;severity=MAJOR	QPROFILE	ACTIVATED	\N	7007b94b-f25a-4dfb-82ca-64601960e639
5	2016-10-11 14:21:03.111	\N	key=java-sonar-way-09275:squid:ClassCyclomaticComplexity;ruleKey=squid:ClassCyclomaticComplexity;profileKey=java-sonar-way-09275;param_max=200;severity=MAJOR	QPROFILE	ACTIVATED	\N	4daac228-fa5c-470f-9aa7-6da0b1b09ddf
6	2016-10-11 14:21:03.158	\N	key=java-sonar-way-09275:squid:CommentedOutCodeLine;ruleKey=squid:CommentedOutCodeLine;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	41c97f6f-122f-4b13-8d4d-46e595020261
7	2016-10-11 14:21:03.209	\N	key=java-sonar-way-09275:squid:S00108;ruleKey=squid:S00108;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	ffd55da7-77bb-433f-8da1-8fb1fe3c5aa6
8	2016-10-11 14:21:03.275	\N	key=java-sonar-way-09275:squid:S00107;ruleKey=squid:S00107;profileKey=java-sonar-way-09275;param_max=7;severity=MAJOR	QPROFILE	ACTIVATED	\N	fbce08bc-794f-46d7-b736-c79eab12c36c
9	2016-10-11 14:21:03.323	\N	key=java-sonar-way-09275:squid:S00112;ruleKey=squid:S00112;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	82aa544e-9c87-4149-abe7-e29ae6fdeb09
10	2016-10-11 14:21:03.373	\N	key=java-sonar-way-09275:squid:S00100;ruleKey=squid:S00100;profileKey=java-sonar-way-09275;param_format=^[a-z][a-zA-Z0-9]*$;severity=MINOR	QPROFILE	ACTIVATED	\N	8eef5d66-2e25-4d4c-88aa-6dc01228c255
11	2016-10-11 14:21:03.422	\N	key=java-sonar-way-09275:squid:S00101;ruleKey=squid:S00101;profileKey=java-sonar-way-09275;param_format=^[A-Z][a-zA-Z0-9]*$;severity=MINOR	QPROFILE	ACTIVATED	\N	04765632-bf5a-4ac6-a460-473848b8917e
12	2016-10-11 14:21:03.471	\N	key=java-sonar-way-09275:squid:S00114;ruleKey=squid:S00114;profileKey=java-sonar-way-09275;param_format=^[A-Z][a-zA-Z0-9]*$;severity=MINOR	QPROFILE	ACTIVATED	\N	84a89912-e324-4532-b48d-6ab5782689cf
13	2016-10-11 14:21:03.521	\N	key=java-sonar-way-09275:squid:S00115;ruleKey=squid:S00115;profileKey=java-sonar-way-09275;param_format=^[A-Z][A-Z0-9]*(_[A-Z0-9]+)*$;severity=MINOR	QPROFILE	ACTIVATED	\N	5d6a9329-8ad2-4533-8ebd-9a3a9f0ddf65
14	2016-10-11 14:21:03.572	\N	key=java-sonar-way-09275:squid:S00116;ruleKey=squid:S00116;profileKey=java-sonar-way-09275;param_format=^[a-z][a-zA-Z0-9]*$;severity=MINOR	QPROFILE	ACTIVATED	\N	a824fa14-2d6b-4b81-85cd-0d9c3b921551
15	2016-10-11 14:21:03.622	\N	key=java-sonar-way-09275:squid:S00117;ruleKey=squid:S00117;profileKey=java-sonar-way-09275;param_format=^[a-z][a-zA-Z0-9]*$;severity=MINOR	QPROFILE	ACTIVATED	\N	d5a3c0bf-79e6-4e78-8248-11a2dcd8d74a
16	2016-10-11 14:21:03.737	\N	key=java-sonar-way-09275:squid:S00119;ruleKey=squid:S00119;profileKey=java-sonar-way-09275;param_format=^[A-Z]$;severity=MINOR	QPROFILE	ACTIVATED	\N	e9832fb3-ea7a-49b7-918d-756381319de7
17	2016-10-11 14:21:03.76	\N	key=java-sonar-way-09275:squid:S00120;ruleKey=squid:S00120;profileKey=java-sonar-way-09275;param_format=^[a-z]+(\\.[a-z][a-z0-9]*)*$;severity=MINOR	QPROFILE	ACTIVATED	\N	d6db63d4-6019-4e0e-bb77-845878d1cf09
18	2016-10-11 14:21:03.777	\N	key=java-sonar-way-09275:squid:S00122;ruleKey=squid:S00122;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	9aabe234-08d0-42c1-870d-bd13100b68bc
19	2016-10-11 14:21:03.792	\N	key=java-sonar-way-09275:squid:RightCurlyBraceStartLineCheck;ruleKey=squid:RightCurlyBraceStartLineCheck;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	f33af70d-016c-44c3-ae50-4b9384180181
20	2016-10-11 14:21:03.809	\N	key=java-sonar-way-09275:squid:UselessParenthesesCheck;ruleKey=squid:UselessParenthesesCheck;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	4248ef32-d3cf-4367-99e8-8c55cf3e0c3f
21	2016-10-11 14:21:03.826	\N	key=java-sonar-way-09275:squid:ObjectFinalizeCheck;ruleKey=squid:ObjectFinalizeCheck;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	60e69ab3-d7ff-45d2-a37e-948492d6bfb0
22	2016-10-11 14:21:03.843	\N	key=java-sonar-way-09275:squid:ObjectFinalizeOverridenCheck;ruleKey=squid:ObjectFinalizeOverridenCheck;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	4089e2a4-b73b-4dff-9d1a-fc474812baf3
23	2016-10-11 14:21:03.859	\N	key=java-sonar-way-09275:squid:ObjectFinalizeOverridenCallsSuperFinalizeCheck;ruleKey=squid:ObjectFinalizeOverridenCallsSuperFinalizeCheck;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	36f8eee7-fda1-46b0-bafb-922844fb2e92
24	2016-10-11 14:21:03.898	\N	key=java-sonar-way-09275:squid:ClassVariableVisibilityCheck;ruleKey=squid:ClassVariableVisibilityCheck;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	4e48ee3d-8eb2-4c30-a4e0-d8cefe3ff07b
25	2016-10-11 14:21:03.964	\N	key=java-sonar-way-09275:squid:ForLoopCounterChangedCheck;ruleKey=squid:ForLoopCounterChangedCheck;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	392e1719-a582-45d0-a55a-edae1f12d61e
26	2016-10-11 14:21:03.992	\N	key=java-sonar-way-09275:squid:LabelsShouldNotBeUsedCheck;ruleKey=squid:LabelsShouldNotBeUsedCheck;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	698ce422-96f6-4c0d-8267-f0dcdf80a2ab
27	2016-10-11 14:21:04	\N	key=java-sonar-way-09275:squid:SwitchLastCaseIsDefaultCheck;ruleKey=squid:SwitchLastCaseIsDefaultCheck;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	8dab5c84-3bfd-4a21-8015-0d141bc34327
28	2016-10-11 14:21:04.009	\N	key=java-sonar-way-09275:squid:EmptyStatementUsageCheck;ruleKey=squid:EmptyStatementUsageCheck;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	3a948a5e-86d4-46ec-8f58-3015f2790b56
29	2016-10-11 14:21:04.017	\N	key=java-sonar-way-09275:squid:ModifiersOrderCheck;ruleKey=squid:ModifiersOrderCheck;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	10773545-10d6-4409-acdb-4b9541c94d3d
30	2016-10-11 14:21:04.025	\N	key=java-sonar-way-09275:squid:AssignmentInSubExpressionCheck;ruleKey=squid:AssignmentInSubExpressionCheck;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	d96747e7-46d7-4ee7-8211-14e5583e14c7
31	2016-10-11 14:21:04.033	\N	key=java-sonar-way-09275:squid:UselessImportCheck;ruleKey=squid:UselessImportCheck;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	1ffda653-025a-46dc-a75d-dbda37c9c3b9
32	2016-10-11 14:21:04.042	\N	key=java-sonar-way-09275:squid:LowerCaseLongSuffixCheck;ruleKey=squid:LowerCaseLongSuffixCheck;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	3567375c-edaf-4841-a387-c33f4dfcf8df
33	2016-10-11 14:21:04.081	\N	key=java-sonar-way-09275:squid:MissingDeprecatedCheck;ruleKey=squid:MissingDeprecatedCheck;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	b5f7cbdc-4272-4fe1-978a-ae69039ae68b
34	2016-10-11 14:21:04.139	\N	key=java-sonar-way-09275:squid:HiddenFieldCheck;ruleKey=squid:HiddenFieldCheck;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	77b131d6-3b46-46e0-9ff6-b0d857b74a7f
35	2016-10-11 14:21:04.167	\N	key=java-sonar-way-09275:squid:S1133;ruleKey=squid:S1133;profileKey=java-sonar-way-09275;severity=INFO	QPROFILE	ACTIVATED	\N	94905090-1262-455f-a6c7-0f6287e5737b
36	2016-10-11 14:21:04.184	\N	key=java-sonar-way-09275:squid:S1134;ruleKey=squid:S1134;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	b417c677-110c-4f12-aa40-feca8d48e48f
37	2016-10-11 14:21:04.201	\N	key=java-sonar-way-09275:squid:S1135;ruleKey=squid:S1135;profileKey=java-sonar-way-09275;severity=INFO	QPROFILE	ACTIVATED	\N	41025f70-a832-4cb1-baf1-fcedf6e14b36
38	2016-10-11 14:21:04.217	\N	key=java-sonar-way-09275:squid:S1118;ruleKey=squid:S1118;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	582f4522-b733-4c5f-9e57-6d362e41858c
39	2016-10-11 14:21:04.233	\N	key=java-sonar-way-09275:squid:S1132;ruleKey=squid:S1132;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	ba2bd6db-32cd-4262-a6aa-b84e2f006d8e
40	2016-10-11 14:21:04.242	\N	key=java-sonar-way-09275:squid:S1126;ruleKey=squid:S1126;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	1a73b8e3-b5a1-46fc-a638-6c52a239a0d1
41	2016-10-11 14:21:04.25	\N	key=java-sonar-way-09275:squid:S1125;ruleKey=squid:S1125;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	fd90526c-731b-4e1e-8e0c-f402d53a18b1
42	2016-10-11 14:21:04.29	\N	key=java-sonar-way-09275:squid:S1067;ruleKey=squid:S1067;profileKey=java-sonar-way-09275;param_max=3;severity=MAJOR	QPROFILE	ACTIVATED	\N	03bf4c21-7776-40c3-83f3-0a207130ffa0
43	2016-10-11 14:21:04.347	\N	key=java-sonar-way-09275:squid:S1141;ruleKey=squid:S1141;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	a1d292b5-9860-4753-9dfb-207f0d84abb6
44	2016-10-11 14:21:04.376	\N	key=java-sonar-way-09275:squid:S1147;ruleKey=squid:S1147;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	5b0ba415-9b2b-4321-a153-8b69baea36ed
45	2016-10-11 14:21:04.392	\N	key=java-sonar-way-09275:squid:S1143;ruleKey=squid:S1143;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	88082a60-a52d-4684-92d2-3550a7bb8a6e
46	2016-10-11 14:21:04.401	\N	key=java-sonar-way-09275:squid:S1145;ruleKey=squid:S1145;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	65c5517f-1fd6-4a80-ba98-0cdadd24169a
47	2016-10-11 14:21:04.408	\N	key=java-sonar-way-09275:squid:S1157;ruleKey=squid:S1157;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	42889604-f4de-4c52-8975-4e45f540742d
48	2016-10-11 14:21:04.417	\N	key=java-sonar-way-09275:squid:S1155;ruleKey=squid:S1155;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	1855c3c1-bcdf-4f50-8894-0dc3fc644b5d
49	2016-10-11 14:21:04.425	\N	key=java-sonar-way-09275:squid:S1149;ruleKey=squid:S1149;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	8cd00580-b9ff-4377-ad21-8e2d4ed5cf63
50	2016-10-11 14:21:04.433	\N	key=java-sonar-way-09275:squid:S1171;ruleKey=squid:S1171;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	7f886298-260a-403b-94c0-ccbf887a44f1
51	2016-10-11 14:21:04.473	\N	key=java-sonar-way-09275:squid:S1168;ruleKey=squid:S1168;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	55c10052-d948-48f0-97da-f528d12490b4
52	2016-10-11 14:21:04.531	\N	key=java-sonar-way-09275:squid:S1170;ruleKey=squid:S1170;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	7498f600-d4f3-4760-98db-032ef4c31f8f
53	2016-10-11 14:21:04.559	\N	key=java-sonar-way-09275:squid:S1163;ruleKey=squid:S1163;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	601e7918-76b9-47ba-8d04-e3bdc85d5218
54	2016-10-11 14:21:04.575	\N	key=java-sonar-way-09275:squid:S106;ruleKey=squid:S106;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	b650d0fb-ed8d-47cd-a17a-5ae3a08b9097
55	2016-10-11 14:21:04.584	\N	key=java-sonar-way-09275:squid:S1165;ruleKey=squid:S1165;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	98df14cf-c636-4432-b72b-16accd677785
56	2016-10-11 14:21:04.592	\N	key=java-sonar-way-09275:squid:S1066;ruleKey=squid:S1066;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	55c1ac15-5f8e-48bb-8dff-ab8fbb109444
57	2016-10-11 14:21:04.601	\N	key=java-sonar-way-09275:squid:S134;ruleKey=squid:S134;profileKey=java-sonar-way-09275;param_max=3;severity=MAJOR	QPROFILE	ACTIVATED	\N	e37e05ca-f8b8-45a8-9150-15e31bc946a0
58	2016-10-11 14:21:04.617	\N	key=java-sonar-way-09275:squid:S1181;ruleKey=squid:S1181;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	f9adb83f-431a-4059-a8ea-a88b94bb83e0
59	2016-10-11 14:21:04.625	\N	key=java-sonar-way-09275:squid:S1150;ruleKey=squid:S1150;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	91b1bae5-b5f4-4df5-8ef2-2b0de4487291
60	2016-10-11 14:21:04.665	\N	key=java-sonar-way-09275:squid:S1182;ruleKey=squid:S1182;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	e393fcf7-f240-48e0-b60f-2f218f7fec1d
61	2016-10-11 14:21:04.722	\N	key=java-sonar-way-09275:squid:S1151;ruleKey=squid:S1151;profileKey=java-sonar-way-09275;param_max=5;severity=MAJOR	QPROFILE	ACTIVATED	\N	9fce3a45-fdb1-4372-8498-d123b0db3b3b
62	2016-10-11 14:21:04.751	\N	key=java-sonar-way-09275:squid:S128;ruleKey=squid:S128;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	6f145d83-9b27-488d-9dc4-64253dd55a11
63	2016-10-11 14:21:04.77	\N	key=java-sonar-way-09275:squid:S1166;ruleKey=squid:S1166;profileKey=java-sonar-way-09275;param_exceptions=java.lang.InterruptedException, java.lang.NumberFormatException, java.text.ParseException, java.net.MalformedURLException;severity=CRITICAL	QPROFILE	ACTIVATED	\N	be45422d-b2e1-4449-b837-2ce839096537
64	2016-10-11 14:21:04.784	\N	key=java-sonar-way-09275:squid:S1190;ruleKey=squid:S1190;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	ffb43fd7-819b-4538-b711-7987000dca0d
65	2016-10-11 14:21:04.792	\N	key=java-sonar-way-09275:squid:S1188;ruleKey=squid:S1188;profileKey=java-sonar-way-09275;param_Max=20;severity=MAJOR	QPROFILE	ACTIVATED	\N	106418cc-1e6b-4d78-9ee8-7000f204ac6a
66	2016-10-11 14:21:04.809	\N	key=java-sonar-way-09275:squid:S1191;ruleKey=squid:S1191;profileKey=java-sonar-way-09275;param_Exclude=;severity=MAJOR	QPROFILE	ACTIVATED	\N	57206ac8-43b3-4f26-a843-76b0199d4901
67	2016-10-11 14:21:04.825	\N	key=java-sonar-way-09275:squid:S135;ruleKey=squid:S135;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	06bf4e41-ed19-4782-81ab-6a6e51b48e82
68	2016-10-11 14:21:04.865	\N	key=java-sonar-way-09275:squid:S1186;ruleKey=squid:S1186;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	b7d745bf-0c09-4cf4-abf2-27c47b4271b0
69	2016-10-11 14:21:04.922	\N	key=java-sonar-way-09275:squid:S1185;ruleKey=squid:S1185;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	1c14190b-124d-4a44-8e44-b77206434503
70	2016-10-11 14:21:04.951	\N	key=java-sonar-way-09275:squid:S1174;ruleKey=squid:S1174;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	7a9bbae3-a8a2-46e4-a5ab-d26368cd1f76
71	2016-10-11 14:21:04.967	\N	key=java-sonar-way-09275:squid:S1175;ruleKey=squid:S1175;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	666df2ec-fa7f-4e2b-b939-6dd260609184
72	2016-10-11 14:21:04.984	\N	key=java-sonar-way-09275:squid:S1153;ruleKey=squid:S1153;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	96cafb25-4fe1-489d-b3d0-7301ec1ad819
73	2016-10-11 14:21:04.992	\N	key=java-sonar-way-09275:squid:S1148;ruleKey=squid:S1148;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	5e1f47c5-7029-4d97-acd2-469758b93fa5
74	2016-10-11 14:21:05	\N	key=java-sonar-way-09275:squid:S1195;ruleKey=squid:S1195;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	046c6366-fa87-497a-ba48-df5bbd357dde
75	2016-10-11 14:21:05.008	\N	key=java-sonar-way-09275:squid:S1194;ruleKey=squid:S1194;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	742f0f1a-91df-49c7-8783-fd4ab9ba6bac
76	2016-10-11 14:21:05.017	\N	key=java-sonar-way-09275:squid:S1193;ruleKey=squid:S1193;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	c8e08f7b-ea21-420d-8dd1-1212173ea644
77	2016-10-11 14:21:05.056	\N	key=java-sonar-way-09275:squid:S1192;ruleKey=squid:S1192;profileKey=java-sonar-way-09275;param_threshold=3;severity=MINOR	QPROFILE	ACTIVATED	\N	f51db879-26ae-410d-81c0-376f620b62cc
78	2016-10-11 14:21:05.113	\N	key=java-sonar-way-09275:squid:S1158;ruleKey=squid:S1158;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	e59e903e-6c2a-4e48-bd6e-ee79bb82f236
79	2016-10-11 14:21:05.142	\N	key=java-sonar-way-09275:squid:S1215;ruleKey=squid:S1215;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	5cf7fd1d-38b7-44e4-9eab-aa73912561ff
80	2016-10-11 14:21:05.159	\N	key=java-sonar-way-09275:squid:S1197;ruleKey=squid:S1197;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	71eac0de-fb23-40e4-a415-e820f0be6169
81	2016-10-11 14:21:05.175	\N	key=java-sonar-way-09275:squid:S1220;ruleKey=squid:S1220;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	d5b6ab47-2df7-48ed-9461-db21b8650eb4
82	2016-10-11 14:21:05.183	\N	key=java-sonar-way-09275:squid:S1221;ruleKey=squid:S1221;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	f6adfc2b-f9f9-4152-bada-216204f3bb92
83	2016-10-11 14:21:05.192	\N	key=java-sonar-way-09275:squid:S1199;ruleKey=squid:S1199;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	13915f68-325e-4107-8779-39bb75165885
84	2016-10-11 14:21:05.2	\N	key=java-sonar-way-09275:squid:S1214;ruleKey=squid:S1214;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	ebf44a5f-9371-4266-a422-1282c7060d51
85	2016-10-11 14:21:05.208	\N	key=java-sonar-way-09275:squid:S1201;ruleKey=squid:S1201;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	cc4dc508-5dd8-4467-ad76-ea298c4f32e9
86	2016-10-11 14:21:05.247	\N	key=java-sonar-way-09275:squid:S1210;ruleKey=squid:S1210;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	111f2364-8d35-4d02-955d-337b59c7f89c
87	2016-10-11 14:21:05.304	\N	key=java-sonar-way-09275:squid:S1206;ruleKey=squid:S1206;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	4ebdcee6-fcd6-459c-a3d9-1fb5565adf0f
88	2016-10-11 14:21:05.334	\N	key=java-sonar-way-09275:squid:S1219;ruleKey=squid:S1219;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	c064d6ee-ad1f-4eda-8d4b-6e3f2adcb792
89	2016-10-11 14:21:05.35	\N	key=java-sonar-way-09275:squid:S1301;ruleKey=squid:S1301;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	4297d3c2-161c-4371-aab8-5853a50202ec
90	2016-10-11 14:21:05.359	\N	key=java-sonar-way-09275:squid:S1314;ruleKey=squid:S1314;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	dbae7309-cfaf-4518-972b-c17de7af848f
91	2016-10-11 14:21:05.367	\N	key=java-sonar-way-09275:squid:S1226;ruleKey=squid:S1226;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	e0d162af-7944-44bc-bfbc-c5c3170a9b37
92	2016-10-11 14:21:05.384	\N	key=java-sonar-way-09275:squid:S1313;ruleKey=squid:S1313;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	ff3bae52-6320-4a50-8066-d40f18db36cc
93	2016-10-11 14:21:05.392	\N	key=java-sonar-way-09275:squid:S1312;ruleKey=squid:S1312;profileKey=java-sonar-way-09275;param_format=LOG(?:GER)?;severity=MINOR	QPROFILE	ACTIVATED	\N	c6750595-f06b-45e1-a75b-423c321ef898
94	2016-10-11 14:21:05.409	\N	key=java-sonar-way-09275:squid:S1318;ruleKey=squid:S1318;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	d73ba838-5889-4a9f-bd91-23ee676cb4a6
95	2016-10-11 14:21:05.448	\N	key=java-sonar-way-09275:squid:S1223;ruleKey=squid:S1223;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	ced87294-faec-40a1-8ed7-4eff013af996
96	2016-10-11 14:21:05.489	\N	key=java-sonar-way-09275:squid:S1319;ruleKey=squid:S1319;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	c1f0932d-f6fa-41af-86b5-bf17db610d63
97	2016-10-11 14:21:05.53	\N	key=java-sonar-way-09275:squid:S1213;ruleKey=squid:S1213;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	e8fbb3cc-faf2-47dd-8337-a6a152c73e29
98	2016-10-11 14:21:05.572	\N	key=java-sonar-way-09275:squid:S1444;ruleKey=squid:S1444;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	ab5aab49-d3ac-4000-99a1-8abf46936938
99	2016-10-11 14:21:05.614	\N	key=java-sonar-way-09275:squid:S1452;ruleKey=squid:S1452;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	c7136173-7f7c-4601-8b4f-ef9a446774d0
100	2016-10-11 14:21:05.655	\N	key=java-sonar-way-09275:squid:S1481;ruleKey=squid:S1481;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	a810ca4e-4fd0-48a2-b87e-ff44facd23d5
101	2016-10-11 14:21:05.697	\N	key=java-sonar-way-09275:squid:S1068;ruleKey=squid:S1068;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	51a912fb-b4f1-4882-af4f-31a3a81b6dee
102	2016-10-11 14:21:05.739	\N	key=java-sonar-way-09275:squid:S1317;ruleKey=squid:S1317;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	b9b4df33-62cd-46dd-b734-ec942483f0cd
103	2016-10-11 14:21:05.79	\N	key=java-sonar-way-09275:squid:S1596;ruleKey=squid:S1596;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	293a8adc-02d2-40b1-a3e4-1ac309f1a863
104	2016-10-11 14:21:05.846	\N	key=java-sonar-way-09275:squid:UnusedPrivateMethod;ruleKey=squid:UnusedPrivateMethod;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	1f07e812-cb64-49bd-8b09-7c9f2593eb91
105	2016-10-11 14:21:05.876	\N	key=java-sonar-way-09275:squid:RedundantThrowsDeclarationCheck;ruleKey=squid:RedundantThrowsDeclarationCheck;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	782696fe-19d7-4992-bae6-05a606365482
106	2016-10-11 14:21:05.893	\N	key=java-sonar-way-09275:squid:S1160;ruleKey=squid:S1160;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	4e34d9e0-1e50-48a3-8d52-745114b0e9a4
107	2016-10-11 14:21:05.909	\N	key=java-sonar-way-09275:squid:S1217;ruleKey=squid:S1217;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	5908d28b-dffa-492a-8738-9058333a0d97
108	2016-10-11 14:21:05.917	\N	key=java-sonar-way-09275:squid:S1862;ruleKey=squid:S1862;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	a3b30b97-946e-49fb-9787-653411003467
109	2016-10-11 14:21:05.925	\N	key=java-sonar-way-09275:squid:S1488;ruleKey=squid:S1488;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	75124bcf-7912-4290-8c69-0befde14ef34
110	2016-10-11 14:21:05.934	\N	key=java-sonar-way-09275:squid:S1602;ruleKey=squid:S1602;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	670e8cbc-1a7d-4012-aace-3b104ed1953a
111	2016-10-11 14:21:05.942	\N	key=java-sonar-way-09275:squid:S1611;ruleKey=squid:S1611;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	ef752f0d-8e52-4a8c-9a03-dac959cea0d2
112	2016-10-11 14:21:05.95	\N	key=java-sonar-way-09275:squid:S1700;ruleKey=squid:S1700;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	302c1a8d-8b8e-4b46-a839-288748d58466
113	2016-10-11 14:21:05.988	\N	key=java-sonar-way-09275:squid:S1172;ruleKey=squid:S1172;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	b0ff84d0-4709-4dc9-9414-88cb69f0905d
114	2016-10-11 14:21:06.03	\N	key=java-sonar-way-09275:squid:S1294;ruleKey=squid:S1294;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	8f671ad5-42a2-4702-a222-0a87dcd2a0b5
115	2016-10-11 14:21:06.072	\N	key=java-sonar-way-09275:squid:S1598;ruleKey=squid:S1598;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	20ca71c6-d590-4f38-b083-59f0b1f80d29
116	2016-10-11 14:21:06.113	\N	key=java-sonar-way-09275:squid:S1873;ruleKey=squid:S1873;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	272bb2d2-99b4-455c-a45a-5553b318755d
117	2016-10-11 14:21:06.156	\N	key=java-sonar-way-09275:squid:S1948;ruleKey=squid:S1948;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	dc3eddf5-d5dc-4c30-b1e6-c19efa21f510
118	2016-10-11 14:21:06.198	\N	key=java-sonar-way-09275:squid:S1479;ruleKey=squid:S1479;profileKey=java-sonar-way-09275;param_maximum=30;severity=MAJOR	QPROFILE	ACTIVATED	\N	19662ea9-f410-4cb2-aba5-e8a74907454f
119	2016-10-11 14:21:06.239	\N	key=java-sonar-way-09275:squid:S1764;ruleKey=squid:S1764;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	a89b4781-0d8d-4cfa-86f1-7d3140ba3bc6
120	2016-10-11 14:21:06.28	\N	key=java-sonar-way-09275:squid:S1244;ruleKey=squid:S1244;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	2d46a419-8816-403c-ab56-c7577c91095a
121	2016-10-11 14:21:06.323	\N	key=java-sonar-way-09275:squid:S2077;ruleKey=squid:S2077;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	83bd0b8e-f996-467d-ae63-d2c8345b0da5
122	2016-10-11 14:21:06.374	\N	key=java-sonar-way-09275:squid:S1161;ruleKey=squid:S1161;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	07d7d1ee-e956-4a97-95e6-fbbe25df259f
123	2016-10-11 14:21:06.429	\N	key=java-sonar-way-09275:squid:S1994;ruleKey=squid:S1994;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	22656cb2-668d-455b-8d4f-cdc0a709d7bd
124	2016-10-11 14:21:06.459	\N	key=java-sonar-way-09275:squid:S2094;ruleKey=squid:S2094;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	7136f6aa-e963-456c-a989-32dff24dbd93
125	2016-10-11 14:21:06.476	\N	key=java-sonar-way-09275:squid:S1850;ruleKey=squid:S1850;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	a5d587b7-c594-433e-bd0e-b01e777e3bc3
126	2016-10-11 14:21:06.492	\N	key=java-sonar-way-09275:squid:S1905;ruleKey=squid:S1905;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	7039ad96-08f8-419b-a5e0-30fc14619e64
127	2016-10-11 14:21:06.5	\N	key=java-sonar-way-09275:squid:S2114;ruleKey=squid:S2114;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	dc0a68f1-6f1a-4a1e-8d9f-cef3df710b03
128	2016-10-11 14:21:06.509	\N	key=java-sonar-way-09275:squid:S1065;ruleKey=squid:S1065;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	1b21bf34-e13d-40c5-91c1-14fa4c2fcdcb
129	2016-10-11 14:21:06.526	\N	key=java-sonar-way-09275:squid:S2184;ruleKey=squid:S2184;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	0fc4c020-ed46-4582-acac-8dac63db2a77
130	2016-10-11 14:21:06.542	\N	key=java-sonar-way-09275:squid:S2225;ruleKey=squid:S2225;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	28061718-da48-44e7-8b11-c0624fceb462
131	2016-10-11 14:21:06.58	\N	key=java-sonar-way-09275:squid:S2230;ruleKey=squid:S2230;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	d53dbeb7-6266-4376-8604-ff53a3d1e9d7
132	2016-10-11 14:21:06.621	\N	key=java-sonar-way-09275:squid:S2200;ruleKey=squid:S2200;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	b6320930-bd7c-4a87-bb28-1ea1f4e0d1af
133	2016-10-11 14:21:06.664	\N	key=java-sonar-way-09275:squid:S2092;ruleKey=squid:S2092;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	9bba4571-7b73-4e01-addd-ea5a94760461
134	2016-10-11 14:21:06.705	\N	key=java-sonar-way-09275:squid:S1848;ruleKey=squid:S1848;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	ce1e13af-9edb-4975-a36b-fa98e2667a46
135	2016-10-11 14:21:06.747	\N	key=java-sonar-way-09275:squid:S2235;ruleKey=squid:S2235;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	94b3d1e3-432f-4f8f-9b98-d92cb882e121
136	2016-10-11 14:21:06.789	\N	key=java-sonar-way-09275:squid:S888;ruleKey=squid:S888;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	a61b84ff-d2d4-4deb-aee8-957485003e8f
137	2016-10-11 14:21:06.83	\N	key=java-sonar-way-09275:squid:S2068;ruleKey=squid:S2068;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	12cd63c1-e04e-4dff-b922-e357d7179a82
138	2016-10-11 14:21:06.872	\N	key=java-sonar-way-09275:squid:S2232;ruleKey=squid:S2232;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	13008e7f-4231-404d-98a6-51c4133d6444
139	2016-10-11 14:21:06.923	\N	key=java-sonar-way-09275:squid:S1849;ruleKey=squid:S1849;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	9bb2ffee-467e-4713-9923-541922dd8f79
140	2016-10-11 14:21:06.971	\N	key=java-sonar-way-09275:squid:S2236;ruleKey=squid:S2236;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	dddc13a7-f214-419a-8c06-f5faa6a96872
141	2016-10-11 14:21:07.001	\N	key=java-sonar-way-09275:squid:S1844;ruleKey=squid:S1844;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	6b64ac61-f7e5-4548-873b-a97a93ec6aef
142	2016-10-11 14:21:07.017	\N	key=java-sonar-way-09275:squid:S2251;ruleKey=squid:S2251;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	a1d7c8a4-d7fc-4a3d-a6ae-f08ec5cba663
143	2016-10-11 14:21:07.034	\N	key=java-sonar-way-09275:squid:S2252;ruleKey=squid:S2252;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	5550d4f9-9439-457a-9062-c985ebf032f9
144	2016-10-11 14:21:07.051	\N	key=java-sonar-way-09275:squid:S2254;ruleKey=squid:S2254;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	70b2f8af-6752-4512-aea8-ab87e9a235c6
145	2016-10-11 14:21:07.368	\N	key=java-sonar-way-09275:squid:S2250;ruleKey=squid:S2250;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	6e02b713-7f0b-4357-9bf8-38f10426dcc3
146	2016-10-11 14:21:07.384	\N	key=java-sonar-way-09275:squid:S2226;ruleKey=squid:S2226;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	49d53f66-31d5-4227-9e8d-1a4431deefde
147	2016-10-11 14:21:07.4	\N	key=java-sonar-way-09275:squid:S2111;ruleKey=squid:S2111;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	7edb9d87-7117-43d8-b81f-d0947ac5e98b
148	2016-10-11 14:21:07.438	\N	key=java-sonar-way-09275:squid:S2109;ruleKey=squid:S2109;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	d67e4c83-04a6-403f-9c97-aa68b099ef04
149	2016-10-11 14:21:07.488	\N	key=java-sonar-way-09275:squid:S2273;ruleKey=squid:S2273;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	4c2c8c68-4ed8-44f0-80ed-8b8466fd3d50
150	2016-10-11 14:21:07.538	\N	key=java-sonar-way-09275:squid:S2276;ruleKey=squid:S2276;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	52c6fcf6-dcc9-496d-997d-27814bdce58c
151	2016-10-11 14:21:07.588	\N	key=java-sonar-way-09275:squid:S2274;ruleKey=squid:S2274;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	21d172d6-c7f5-4245-b222-d297326d225b
152	2016-10-11 14:21:07.637	\N	key=java-sonar-way-09275:squid:S2272;ruleKey=squid:S2272;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	860bb485-e349-4437-889c-cc91eef976a6
153	2016-10-11 14:21:07.688	\N	key=java-sonar-way-09275:squid:S2277;ruleKey=squid:S2277;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	e8f378f6-6fe2-4d33-be9d-212c0a59fb5e
154	2016-10-11 14:21:07.738	\N	key=java-sonar-way-09275:squid:S2204;ruleKey=squid:S2204;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	f46f9f3e-8735-47db-b57e-b29d2897ffd9
155	2016-10-11 14:21:07.789	\N	key=java-sonar-way-09275:squid:S2178;ruleKey=squid:S2178;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	440ebb6d-c5be-4182-b1c9-5096b55343c9
156	2016-10-11 14:21:07.838	\N	key=java-sonar-way-09275:squid:S2116;ruleKey=squid:S2116;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	2a0dd154-69bf-455a-bf83-9e438c93bee1
157	2016-10-11 14:21:07.887	\N	key=java-sonar-way-09275:squid:S2157;ruleKey=squid:S2157;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	1b04ca68-0c51-4cba-87ae-e72df0ba9fad
158	2016-10-11 14:21:07.948	\N	key=java-sonar-way-09275:squid:S2275;ruleKey=squid:S2275;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	62d188fc-cf73-4a7c-bd27-93a336e600eb
159	2016-10-11 14:21:08.004	\N	key=java-sonar-way-09275:squid:S2151;ruleKey=squid:S2151;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	7f33cd6e-f7a8-4cb2-b8f9-690615c2d19b
160	2016-10-11 14:21:08.035	\N	key=java-sonar-way-09275:squid:S2127;ruleKey=squid:S2127;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	3b34cf28-8935-4e45-957e-b83c8f2b7fbd
161	2016-10-11 14:21:08.052	\N	key=java-sonar-way-09275:squid:S1860;ruleKey=squid:S1860;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	54dce46e-df3d-4366-9679-71ef6197d575
162	2016-10-11 14:21:08.068	\N	key=java-sonar-way-09275:squid:S2055;ruleKey=squid:S2055;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	0b9792ec-dcc7-4b40-9bef-bf859af954c9
163	2016-10-11 14:21:08.085	\N	key=java-sonar-way-09275:squid:S2118;ruleKey=squid:S2118;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	70e9d7b1-efb8-40e1-8934-c6f0be4d46b2
164	2016-10-11 14:21:08.101	\N	key=java-sonar-way-09275:squid:S2066;ruleKey=squid:S2066;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	65ec53f2-3ddc-450f-b61b-88e5ef855208
165	2016-10-11 14:21:08.109	\N	key=java-sonar-way-09275:squid:S2065;ruleKey=squid:S2065;profileKey=java-sonar-way-09275;severity=MINOR	QPROFILE	ACTIVATED	\N	582e198a-b2b8-4fa7-9065-bdd79d0d9daf
166	2016-10-11 14:21:08.146	\N	key=java-sonar-way-09275:squid:S2061;ruleKey=squid:S2061;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	a6a3c110-4b56-485b-8c1d-2aceb2b68a66
167	2016-10-11 14:21:08.187	\N	key=java-sonar-way-09275:squid:S2176;ruleKey=squid:S2176;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	8fe4249f-468d-489f-8bc9-64ef089069d3
168	2016-10-11 14:21:08.229	\N	key=java-sonar-way-09275:squid:S2130;ruleKey=squid:S2130;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	447f2da6-d7ca-45a0-9e42-86866b022e44
169	2016-10-11 14:21:08.277	\N	key=java-sonar-way-09275:squid:S2166;ruleKey=squid:S2166;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	69abd954-e25b-4265-858a-bea304e1ba45
170	2016-10-11 14:21:08.327	\N	key=java-sonar-way-09275:squid:S2153;ruleKey=squid:S2153;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	996641d6-b760-4585-a291-e5ecd7d798c5
171	2016-10-11 14:21:08.377	\N	key=java-sonar-way-09275:squid:S2326;ruleKey=squid:S2326;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	c95ad962-0451-491d-9836-e1a0504690a9
172	2016-10-11 14:21:08.424	\N	key=java-sonar-way-09275:squid:S2386;ruleKey=squid:S2386;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	9aab7e2a-eafd-4499-96d6-e58cbf97a5ff
173	2016-10-11 14:21:08.465	\N	key=java-sonar-way-09275:squid:S2183;ruleKey=squid:S2183;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	bd4e0a26-ff90-4829-b44f-aab4e14d1c66
174	2016-10-11 14:21:08.516	\N	key=java-sonar-way-09275:squid:S2167;ruleKey=squid:S2167;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	d2f44240-f28f-4b72-a5b6-3ffe53535424
175	2016-10-11 14:21:08.566	\N	key=java-sonar-way-09275:squid:S2165;ruleKey=squid:S2165;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	cdf052e7-a185-4e39-a408-e7ec441cc780
176	2016-10-11 14:21:08.616	\N	key=java-sonar-way-09275:squid:S2122;ruleKey=squid:S2122;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	fa4cd889-2cc6-4f18-97ea-e0db565b417f
177	2016-10-11 14:21:08.666	\N	key=java-sonar-way-09275:squid:S2134;ruleKey=squid:S2134;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	6d4d0217-447f-4eb0-a372-4b4353d9c331
178	2016-10-11 14:21:08.716	\N	key=java-sonar-way-09275:squid:S2175;ruleKey=squid:S2175;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	f9eed8e2-f6e9-4643-8533-fb093af4a75f
179	2016-10-11 14:21:08.772	\N	key=java-sonar-way-09275:squid:S2447;ruleKey=squid:S2447;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	1b82b33b-33ec-4fa5-8265-d8269646b6fb
180	2016-10-11 14:21:08.813	\N	key=java-sonar-way-09275:squid:S2131;ruleKey=squid:S2131;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	7a2925e5-1e51-4f20-a09e-220276850ca1
181	2016-10-11 14:21:08.855	\N	key=java-sonar-way-09275:squid:S2437;ruleKey=squid:S2437;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	ec65f8a2-59ac-49ec-ab5a-fe829badaca6
182	2016-10-11 14:21:08.897	\N	key=java-sonar-way-09275:squid:S2110;ruleKey=squid:S2110;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	7eec37ad-aa2d-4d3d-b454-7454eefdca66
183	2016-10-11 14:21:08.938	\N	key=java-sonar-way-09275:squid:S2160;ruleKey=squid:S2160;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	744fe440-500e-4b37-a425-ce1acb99df7f
184	2016-10-11 14:21:08.98	\N	key=java-sonar-way-09275:squid:S1872;ruleKey=squid:S1872;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	e31169a1-c539-4fd9-99bc-beb46d9ca774
185	2016-10-11 14:21:09.022	\N	key=java-sonar-way-09275:squid:S2440;ruleKey=squid:S2440;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	1a511140-12aa-42cb-964f-7207f06230b9
186	2016-10-11 14:21:09.063	\N	key=java-sonar-way-09275:squid:S2441;ruleKey=squid:S2441;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	ac5d442f-7441-493f-9db3-177a4f39ff90
187	2016-10-11 14:21:09.105	\N	key=java-sonar-way-09275:squid:S2123;ruleKey=squid:S2123;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	28644bbf-fd8f-4bc9-9cfc-c504d30d807d
188	2016-10-11 14:21:09.156	\N	key=java-sonar-way-09275:squid:S2133;ruleKey=squid:S2133;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	a4567d5d-2b42-4ecf-8dd0-1982f1e18ebc
189	2016-10-11 14:21:09.197	\N	key=java-sonar-way-09275:squid:S2154;ruleKey=squid:S2154;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	0e5eb2c6-ff57-4d7d-8f98-4dd2bcf2c73a
190	2016-10-11 14:21:09.239	\N	key=java-sonar-way-09275:squid:S2442;ruleKey=squid:S2442;profileKey=java-sonar-way-09275;severity=BLOCKER	QPROFILE	ACTIVATED	\N	38632d4f-eb98-4fdc-ad8c-b41e7a457907
191	2016-10-11 14:21:09.281	\N	key=java-sonar-way-09275:squid:S2388;ruleKey=squid:S2388;profileKey=java-sonar-way-09275;severity=MAJOR	QPROFILE	ACTIVATED	\N	a30ad017-aad2-4c21-9ae7-2610cf968311
192	2016-10-11 14:21:09.322	\N	key=java-sonar-way-09275:squid:S2438;ruleKey=squid:S2438;profileKey=java-sonar-way-09275;severity=CRITICAL	QPROFILE	ACTIVATED	\N	c1ad5949-1c20-4ede-bd5c-d856dc5fe42a
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('activities_id_seq', 192, true);


--
-- Data for Name: analysis_reports; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY analysis_reports (id, project_key, report_status, project_name, created_at, updated_at, started_at, finished_at, uuid) FROM stdin;
\.


--
-- Name: analysis_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('analysis_reports_id_seq', 1, false);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY authors (id, person_id, login, created_at, updated_at) FROM stdin;
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('authors_id_seq', 1, false);


--
-- Data for Name: characteristics; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY characteristics (id, kee, name, rule_id, characteristic_order, enabled, parent_id, root_id, function_key, factor_value, factor_unit, offset_value, offset_unit, created_at, updated_at) FROM stdin;
1	REUSABILITY	Reusability	\N	1	t	\N	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
2	MODULARITY	Modularity	\N	\N	t	1	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
3	REUSABILITY_COMPLIANCE	Reusability Compliance	\N	\N	t	1	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
4	TRANSPORTABILITY	Transportability	\N	\N	t	1	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
5	PORTABILITY	Portability	\N	2	t	\N	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
6	COMPILER_RELATED_PORTABILITY	Compiler	\N	\N	t	5	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
7	HARDWARE_RELATED_PORTABILITY	Hardware	\N	\N	t	5	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
8	LANGUAGE_RELATED_PORTABILITY	Language	\N	\N	t	5	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
9	OS_RELATED_PORTABILITY	OS	\N	\N	t	5	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
10	PORTABILITY_COMPLIANCE	Portability Compliance	\N	\N	t	5	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
11	SOFTWARE_RELATED_PORTABILITY	Software	\N	\N	t	5	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
12	TIME_ZONE_RELATED_PORTABILITY	Time zone	\N	\N	t	5	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
13	MAINTAINABILITY	Maintainability	\N	3	t	\N	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
14	MAINTAINABILITY_COMPLIANCE	Maintainability Compliance	\N	\N	t	13	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
15	READABILITY	Readability	\N	\N	t	13	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
16	UNDERSTANDABILITY	Understandability	\N	\N	t	13	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
17	SECURITY	Security	\N	4	t	\N	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
18	API_ABUSE	API abuse	\N	\N	t	17	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
19	ERRORS	Errors	\N	\N	t	17	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
20	INPUT_VALIDATION_AND_REPRESENTATION	Input validation and representation	\N	\N	t	17	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
21	SECURITY_COMPLIANCE	Security Compliance	\N	\N	t	17	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
22	SECURITY_FEATURES	Security features	\N	\N	t	17	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
23	USABILITY	Usability	\N	5	t	\N	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
24	USABILITY_ACCESSIBILITY	Accessibility	\N	\N	t	23	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
25	USABILITY_EASE_OF_USE	Ease of Use	\N	\N	t	23	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
26	USABILITY_COMPLIANCE	Usability Compliance	\N	\N	t	23	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
27	EFFICIENCY	Efficiency	\N	6	t	\N	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
28	EFFICIENCY_COMPLIANCE	Efficiency Compliance	\N	\N	t	27	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
29	MEMORY_EFFICIENCY	Memory use	\N	\N	t	27	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
30	NETWORK_USE	Network use	\N	\N	t	27	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
31	CPU_EFFICIENCY	Processor use	\N	\N	t	27	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
32	CHANGEABILITY	Changeability	\N	7	t	\N	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
33	ARCHITECTURE_CHANGEABILITY	Architecture	\N	\N	t	32	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
34	CHANGEABILITY_COMPLIANCE	Changeability Compliance	\N	\N	t	32	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
35	DATA_CHANGEABILITY	Data	\N	\N	t	32	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
36	LOGIC_CHANGEABILITY	Logic	\N	\N	t	32	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
37	RELIABILITY	Reliability	\N	8	t	\N	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
38	ARCHITECTURE_RELIABILITY	Architecture	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
39	DATA_RELIABILITY	Data	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
40	EXCEPTION_HANDLING	Exception handling	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
41	FAULT_TOLERANCE	Fault tolerance	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
42	INSTRUCTION_RELIABILITY	Instruction	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
43	LOGIC_RELIABILITY	Logic	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
44	RELIABILITY_COMPLIANCE	Reliability Compliance	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
45	RESOURCE_RELIABILITY	Resource	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
46	SYNCHRONIZATION_RELIABILITY	Synchronization	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
47	UNIT_TESTS	Unit tests coverage	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
48	TESTABILITY	Testability	\N	9	t	\N	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
49	INTEGRATION_TESTABILITY	Integration level	\N	\N	t	48	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
50	TESTABILITY_COMPLIANCE	Testability Compliance	\N	\N	t	48	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
51	UNIT_TESTABILITY	Unit level	\N	\N	t	48	\N	\N	\N	\N	\N	\N	2016-10-11 14:20:56.937	\N
\.


--
-- Name: characteristics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('characteristics_id_seq', 51, true);


--
-- Data for Name: dashboards; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY dashboards (id, user_id, name, description, column_layout, shared, created_at, updated_at, is_global) FROM stdin;
1	\N	Dashboard	\N	50%-50%	t	2016-10-11 14:21:10.429	2016-10-11 14:21:10.429	f
2	\N	Issues	\N	50%-50%	t	2016-10-11 14:21:10.485	2016-10-11 14:21:10.485	f
3	\N	TimeMachine	\N	50%-50%	t	2016-10-11 14:21:10.535	2016-10-11 14:21:10.535	f
4	\N	Home	\N	50%-50%	t	2016-10-11 14:21:10.613	2016-10-11 14:21:10.613	t
\.


--
-- Name: dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('dashboards_id_seq', 4, true);


--
-- Data for Name: dependencies; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY dependencies (id, from_snapshot_id, from_resource_id, to_snapshot_id, to_resource_id, dep_usage, dep_weight, project_snapshot_id, parent_dependency_id, from_scope, to_scope) FROM stdin;
\.


--
-- Name: dependencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('dependencies_id_seq', 1, false);


--
-- Data for Name: duplications_index; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY duplications_index (project_snapshot_id, snapshot_id, hash, index_in_file, start_line, end_line, id) FROM stdin;
\.


--
-- Name: duplications_index_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('duplications_index_id_seq', 1, false);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY events (id, name, resource_id, snapshot_id, category, description, event_data, event_date, created_at) FROM stdin;
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('events_id_seq', 1, false);


--
-- Data for Name: file_sources; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY file_sources (id, project_uuid, file_uuid, line_hashes, data_hash, created_at, updated_at, src_hash, binary_data) FROM stdin;
\.


--
-- Name: file_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('file_sources_id_seq', 1, false);


--
-- Data for Name: graphs; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY graphs (id, snapshot_id, resource_id, format, perspective, version, root_vertex_id, data, created_at, updated_at) FROM stdin;
\.


--
-- Name: graphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('graphs_id_seq', 1, false);


--
-- Data for Name: group_roles; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY group_roles (id, group_id, resource_id, role) FROM stdin;
1	1	\N	admin
2	1	\N	profileadmin
3	1	\N	shareDashboard
4	\N	\N	scan
5	\N	\N	dryRunScan
6	1	\N	provisioning
\.


--
-- Name: group_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('group_roles_id_seq', 6, true);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY groups (id, name, description, created_at, updated_at) FROM stdin;
1	sonar-administrators	System administrators	2016-10-11 14:20:18.355	2016-10-11 14:20:18.355
2	sonar-users	Any new users created will automatically join this group	2016-10-11 14:20:18.579	2016-10-11 14:20:18.579
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('groups_id_seq', 2, true);


--
-- Data for Name: groups_users; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY groups_users (user_id, group_id) FROM stdin;
1	1
1	2
\.


--
-- Data for Name: issue_changes; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY issue_changes (id, kee, issue_key, user_login, change_type, change_data, created_at, updated_at, issue_change_creation_date) FROM stdin;
\.


--
-- Name: issue_changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('issue_changes_id_seq', 1, false);


--
-- Data for Name: issue_filter_favourites; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY issue_filter_favourites (id, user_login, issue_filter_id, created_at) FROM stdin;
\.


--
-- Name: issue_filter_favourites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('issue_filter_favourites_id_seq', 1, false);


--
-- Data for Name: issue_filters; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY issue_filters (id, name, user_login, shared, description, data, created_at, updated_at) FROM stdin;
\.


--
-- Name: issue_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('issue_filters_id_seq', 1, false);


--
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY issues (id, kee, rule_id, severity, manual_severity, message, line, effort_to_fix, status, resolution, checksum, reporter, assignee, author_login, action_plan_key, issue_attributes, technical_debt, created_at, updated_at, issue_creation_date, issue_update_date, issue_close_date, tags, component_uuid, project_uuid) FROM stdin;
\.


--
-- Name: issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('issues_id_seq', 1, false);


--
-- Data for Name: loaded_templates; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY loaded_templates (id, kee, template_type) FROM stdin;
1	SonarQube way	QUALITY_GATE
2	java:Sonar way	QUALITY_PROFILE
3	Projects	FILTER
4	My favourites	FILTER
5	Dashboard	DASHBOARD
6	Issues	DASHBOARD
7	TimeMachine	DASHBOARD
8	Home	DASHBOARD
9	default_template	PERM_TEMPLATE
10	CopyRequirementsFromCharacteristicsToRules	ONE_SHOT_TASK
\.


--
-- Name: loaded_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('loaded_templates_id_seq', 10, true);


--
-- Data for Name: manual_measures; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY manual_measures (id, metric_id, resource_id, value, text_value, user_login, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: manual_measures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('manual_measures_id_seq', 1, false);


--
-- Data for Name: measure_filter_favourites; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY measure_filter_favourites (id, user_id, measure_filter_id, created_at) FROM stdin;
\.


--
-- Name: measure_filter_favourites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('measure_filter_favourites_id_seq', 1, false);


--
-- Data for Name: measure_filters; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY measure_filters (id, name, user_id, shared, description, data, created_at, updated_at) FROM stdin;
1	Projects	\N	t	\N	display=list|qualifiers=TRK|cols=metric:alert_status,name,version,metric:ncloc,metric:sqale_index,date	2016-10-11 14:21:10.382	2016-10-11 14:21:10.382
2	My favourites	\N	t	\N	display=list|onFavourites=true|cols=metric:alert_status,name,date	2016-10-11 14:21:10.408	2016-10-11 14:21:10.408
\.


--
-- Name: measure_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('measure_filters_id_seq', 2, true);


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY metrics (id, name, description, direction, domain, short_name, qualitative, val_type, user_managed, enabled, origin, worst_value, best_value, optimized_best_value, hidden, delete_historical_data) FROM stdin;
1	lines	Lines	-1	Size	Lines	f	INT	f	t	JAV	\N	\N	f	f	f
33	test_failures	Number of unit test failures	-1	Tests	Unit test failures	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
34	test_success_density	Density of successful unit tests	1	Tests	Unit test success (%)	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	t	f	f
35	test_data	Unit tests details	-1	Tests	Unit tests details	f	DATA	f	t	JAV	\N	\N	f	f	f
36	coverage	Coverage by unit tests	1	Tests	Coverage	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	f
37	new_coverage	Coverage of new/changed code	1	Tests	Coverage on new code	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	t
38	lines_to_cover	Lines to cover	1	Tests	Lines to cover	f	INT	f	t	JAV	\N	\N	f	f	f
39	new_lines_to_cover	Lines to cover on new code	-1	Tests	Lines to cover on new code	f	INT	f	t	JAV	\N	\N	f	f	t
40	uncovered_lines	Uncovered lines	-1	Tests	Uncovered lines	f	INT	f	t	JAV	\N	0.00000000000000000000	f	f	f
41	new_uncovered_lines	Uncovered lines on new code	-1	Tests	Uncovered lines on new code	f	INT	f	t	JAV	\N	0.00000000000000000000	f	f	t
143	burned_budget	\N	0	Management	Burned budget	f	FLOAT	t	t	JAV	\N	\N	f	f	f
144	business_value	\N	1	Management	Business value	t	FLOAT	t	t	JAV	\N	\N	f	f	f
145	team_size	\N	0	Management	Team size	f	INT	t	t	JAV	\N	\N	f	f	f
42	line_coverage	Line coverage	1	Tests	Line coverage	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	f
43	new_line_coverage	Line coverage of added/changed code	1	Tests	Line coverage on new code	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	t
44	coverage_line_hits_data	\N	0	Tests	Coverage hits by line	f	DATA	f	t	JAV	\N	\N	f	f	t
45	conditions_to_cover	Branches to cover	0	Tests	Branches to cover	f	INT	f	t	JAV	\N	\N	f	t	f
46	new_conditions_to_cover	Branches to cover on new code	0	Tests	Branches to cover on new code	f	INT	f	t	JAV	\N	\N	f	t	t
47	uncovered_conditions	Uncovered branches	-1	Tests	Uncovered branches	f	INT	f	t	JAV	\N	0.00000000000000000000	f	f	f
48	new_uncovered_conditions	Uncovered branches on new code	-1	Tests	Uncovered branches on new code	f	INT	f	t	JAV	\N	0.00000000000000000000	f	f	t
49	branch_coverage	Condition coverage	1	Tests	Condition coverage	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	f
50	new_branch_coverage	Condition coverage of new/changed code	1	Tests	Condition coverage on new code	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	t
51	conditions_by_line	\N	0	Tests	Conditions by line	f	DATA	f	t	JAV	\N	\N	f	f	t
52	covered_conditions_by_line	\N	0	Tests	Covered conditions by line	f	DATA	f	t	JAV	\N	\N	f	f	t
53	it_coverage	Coverage by integration tests	1	Tests (Integration)	IT coverage	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	f
54	new_it_coverage	Integration Tests Coverage of new/changed code	1	Tests (Integration)	Coverage by IT on new code	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	t
55	it_lines_to_cover	Lines to cover by Integration Tests	1	Tests (Integration)	IT lines to cover	f	INT	f	t	JAV	\N	\N	f	t	f
56	new_it_lines_to_cover	Lines to cover by Integration Tests on new code	-1	Tests (Integration)	Lines to cover by IT on new code	f	INT	f	t	JAV	\N	\N	f	f	t
57	it_uncovered_lines	IT uncovered lines	-1	Tests (Integration)	IT uncovered lines	f	INT	f	t	JAV	\N	\N	f	f	f
58	new_it_uncovered_lines	Uncovered lines by IT on new code	-1	Tests (Integration)	Uncovered lines by IT on new code	f	INT	f	t	JAV	\N	0.00000000000000000000	f	f	t
59	it_line_coverage	IT line coverage	1	Tests (Integration)	IT line coverage	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	f
60	new_it_line_coverage	Line Coverage by Integration Tests of added/changed code	1	Tests (Integration)	Line coverage by IT on new code	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	t
61	it_coverage_line_hits_data	Integration Tests Code coverage line hits data	0	Tests (Integration)	IT coverage hits data	f	DATA	f	t	JAV	\N	\N	f	f	t
62	it_conditions_to_cover	Integration Tests conditions to cover	1	Tests (Integration)	IT branches to cover	f	INT	f	t	JAV	\N	\N	f	t	f
63	new_it_conditions_to_cover	Branches to cover by Integration Tests on new code	0	Tests (Integration)	Branches to cover by IT on new code	f	INT	f	t	JAV	\N	\N	f	t	t
64	it_uncovered_conditions	Integration Tests uncovered conditions	-1	Tests (Integration)	IT uncovered branches	f	INT	f	t	JAV	\N	\N	f	f	f
65	new_it_uncovered_conditions	Uncovered branches by Integration Tests on new code	-1	Tests (Integration)	Uncovered branches by IT on new code	f	INT	f	t	JAV	\N	0.00000000000000000000	f	f	t
66	it_branch_coverage	IT condition coverage	1	Tests (Integration)	IT condition coverage	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	f
2	generated_lines	Number of generated lines	-1	Size	Generated Lines	f	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
67	new_it_branch_coverage	Condition coverage by Integration Tests of new/changed code	1	Tests (Integration)	Condition coverage by IT on new code	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	t
68	it_conditions_by_line	\N	0	Tests (Integration)	IT conditions by line	f	DATA	f	t	JAV	\N	\N	f	f	t
69	it_covered_conditions_by_line	\N	0	Tests (Integration)	IT covered conditions by line	f	DATA	f	t	JAV	\N	\N	f	f	t
70	overall_coverage	Overall test coverage	1	Tests (Overall)	Overall coverage	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	f
71	new_overall_coverage	Overall coverage of new/changed code	1	Tests (Overall)	Overall coverage on new code	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	t
72	overall_lines_to_cover	Overall lines to cover by all tests	1	Tests (Overall)	Overall lines to cover	f	INT	f	t	JAV	\N	\N	f	t	f
73	new_overall_lines_to_cover	New lines to cover by all tests	-1	Tests (Overall)	Overall lines to cover on new code	f	INT	f	t	JAV	\N	\N	f	f	t
74	overall_uncovered_lines	Uncovered lines by all tests	-1	Tests (Overall)	Overall uncovered lines	f	INT	f	t	JAV	\N	\N	f	f	f
75	new_overall_uncovered_lines	New lines that are not covered by any tests	-1	Tests (Overall)	Overall uncovered lines on new code	f	INT	f	t	JAV	\N	0.00000000000000000000	f	f	t
76	overall_line_coverage	Line coverage by all tests	1	Tests (Overall)	Overall line coverage	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	f
77	new_overall_line_coverage	Line coverage of added/changed code by all tests	1	Tests (Overall)	Overall line coverage on new code	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	t
78	overall_coverage_line_hits_data	Coverage hits by all tests and by line	0	Tests (Overall)	Overall coverage hits by line	f	DATA	f	t	JAV	\N	\N	f	f	t
79	overall_conditions_to_cover	Branches to cover by all tests	1	Tests (Overall)	Overall branches to cover	f	INT	f	t	JAV	\N	\N	f	t	f
80	new_overall_conditions_to_cover	New branches to cover by all tests	0	Tests (Overall)	Overall branches to cover on new code	f	INT	f	t	JAV	\N	\N	f	t	t
81	overall_uncovered_conditions	Uncovered branches by all tests	-1	Tests (Overall)	Overall uncovered branches	f	INT	f	t	JAV	\N	\N	f	f	f
82	new_overall_uncovered_conditions	New branches that are not covered by any test	-1	Tests (Overall)	Overall uncovered branches on new code	f	INT	f	t	JAV	\N	0.00000000000000000000	f	f	t
83	overall_branch_coverage	Condition coverage by all tests	1	Tests (Overall)	Overall condition coverage	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	f
84	new_overall_branch_coverage	Condition coverage of new/changed code by all tests	1	Tests (Overall)	Overall condition coverage on new code	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	t
89	duplicated_files	Duplicated files	-1	Duplication	Duplicated files	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
90	duplicated_lines_density	Duplicated lines balanced by statements	-1	Duplication	Duplicated lines (%)	t	PERCENT	f	t	JAV	100.00000000000000000000	0.00000000000000000000	t	f	f
91	duplications_data	Duplications details	0	Duplication	Duplications details	f	DATA	f	t	JAV	\N	\N	f	f	t
92	duplication_lines_data	\N	0	Duplication	duplication_lines_data	f	DATA	f	t	JAV	\N	\N	f	t	f
93	violations	Issues	-1	Issues	Issues	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
94	blocker_violations	Blocker issues	-1	Issues	Blocker issues	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
95	critical_violations	Critical issues	-1	Issues	Critical issues	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
96	major_violations	Major issues	-1	Issues	Major issues	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
97	minor_violations	Minor issues	-1	Issues	Minor issues	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
98	info_violations	Info issues	-1	Issues	Info issues	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
99	new_violations	New Issues	-1	Issues	New issues	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	t
100	new_blocker_violations	New Blocker issues	-1	Issues	New Blocker issues	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	t
101	new_critical_violations	New Critical issues	-1	Issues	New Critical issues	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	t
102	new_major_violations	New Major issues	-1	Issues	New Major issues	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	t
103	new_minor_violations	New Minor issues	-1	Issues	New Minor issues	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	t
104	new_info_violations	New Info issues	-1	Issues	New Info issues	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	t
105	false_positive_issues	False positive issues	-1	Issues	False positive issues	f	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
106	open_issues	Open issues	-1	Issues	Open issues	f	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
107	reopened_issues	Reopened issues	-1	Issues	Reopened issues	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
108	confirmed_issues	Confirmed issues	-1	Issues	Confirmed issues	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
109	dit	Depth in Inheritance Tree	0	Design	Depth in Tree	f	INT	f	t	JAV	\N	\N	f	t	f
110	noc	Number of Children	0	Design	Number of Children	f	INT	f	t	JAV	\N	\N	f	t	f
111	rfc	Response for Class	-1	Design	RFC	f	INT	f	t	JAV	\N	\N	f	t	f
112	rfc_distribution	Class distribution /RFC	0	Design	Class distribution /RFC	t	DISTRIB	f	t	JAV	\N	\N	f	t	f
113	lcom4	Lack of Cohesion of Functions	-1	Design	LCOM4	t	FLOAT	f	t	JAV	\N	1.00000000000000000000	f	t	f
114	lcom4_blocks	LCOM4 blocks	0	Design	LCOM4 blocks	f	DATA	f	t	JAV	\N	\N	f	t	t
115	lcom4_distribution	Class distribution /LCOM4	0	Design	Class distribution /LCOM4	t	DISTRIB	f	t	JAV	\N	\N	f	t	f
116	suspect_lcom4_density	Density of classes having LCOM4>1	-1	Design	Suspect LCOM4 density	t	PERCENT	f	t	JAV	100.00000000000000000000	0.00000000000000000000	f	t	f
117	dsm	Dependency Matrix	0	Design	Dependency Matrix	f	DATA	f	t	JAV	\N	\N	f	f	t
118	package_cycles	Directory cycles	-1	Design	Directory cycles	t	INT	f	t	JAV	\N	0.00000000000000000000	f	f	f
119	package_tangle_index	Directory tangle index	-1	Design	Directory tangle index	t	PERCENT	f	t	JAV	100.00000000000000000000	0.00000000000000000000	f	f	f
120	package_tangles	File dependencies to cut	-1	Design	File dependencies to cut	f	INT	f	t	JAV	\N	\N	f	f	f
121	package_feedback_edges	Package dependencies to cut	-1	Design	Package dependencies to cut	f	INT	f	t	JAV	\N	0.00000000000000000000	f	f	f
122	package_edges_weight	Directory edges weight	1	Design	Directory edges weight	f	INT	f	t	JAV	\N	\N	f	t	t
123	file_cycles	File cycles	-1	Design	File cycles	t	INT	f	t	JAV	\N	0.00000000000000000000	f	t	t
124	file_tangle_index	File tangle index	-1	Design	File tangle index	t	PERCENT	f	t	JAV	100.00000000000000000000	0.00000000000000000000	f	t	t
125	file_tangles	Files tangles	-1	Design	File tangles	f	INT	f	t	JAV	\N	\N	f	t	t
126	file_feedback_edges	Suspect file dependencies	-1	Design	Suspect file dependencies	f	INT	f	t	JAV	\N	0.00000000000000000000	f	t	t
127	file_edges_weight	File edges weight	1	Design	File edges weight	f	INT	f	t	JAV	\N	\N	f	t	t
128	authors_by_line	\N	0	SCM	Authors by line	f	DATA	f	t	JAV	\N	\N	f	f	f
129	revisions_by_line	\N	0	SCM	Revisions by line	f	DATA	f	t	JAV	\N	\N	f	f	f
130	last_commit_datetimes_by_line	\N	0	SCM	Last commit dates by line	f	DATA	f	t	JAV	\N	\N	f	f	f
131	sqale_index	\N	-1	Technical Debt	Technical Debt	t	WORK_DUR	f	t	JAV	\N	0.00000000000000000000	t	f	f
132	new_technical_debt	Technical Debt of new code	-1	Technical Debt	Technical Debt on new code	t	WORK_DUR	f	t	JAV	\N	0.00000000000000000000	t	f	t
133	sqale_rating	\N	-1	Technical Debt	SQALE Rating	t	RATING	f	t	JAV	5.00000000000000000000	1.00000000000000000000	f	f	f
134	development_cost	\N	-1	Technical Debt	SQALE Development Cost	t	STRING	f	t	JAV	\N	0.00000000000000000000	t	t	f
135	sqale_debt_ratio	Ratio of the technical debt compared to what it would cost to develop the whole source code from scratch.	-1	Technical Debt	SQALE Technical Debt Ratio	t	PERCENT	f	t	JAV	100.00000000000000000000	0.00000000000000000000	t	f	f
136	ncloc_data	\N	0	Size	ncloc_data	f	DATA	f	t	JAV	\N	\N	f	t	f
137	comment_lines_data	\N	0	Documentation	comment_lines_data	f	DATA	f	t	JAV	\N	\N	f	t	f
138	alert_status	The project status with regard to its quality gate.	1	General	Quality Gate Status	t	LEVEL	f	t	JAV	\N	\N	f	f	f
139	quality_gate_details	The project detailed status with regard to its quality gate.	0	General	Quality Gate Details	f	DATA	f	t	JAV	\N	\N	f	f	f
140	profile	Selected quality profile	0	General	Profile	f	DATA	f	t	JAV	\N	\N	f	f	f
141	profile_version	Selected quality profile version	0	General	Profile version	f	INT	f	t	JAV	\N	\N	f	t	f
142	quality_profiles	Details of quality profiles used during analysis	0	General	Profiles	f	DATA	f	t	JAV	\N	\N	f	t	f
3	ncloc	Non Commenting Lines of Code	-1	Size	Lines of code	f	INT	f	t	JAV	\N	\N	f	f	f
4	ncloc_language_distribution	Non Commenting Lines of Code Distributed By Language	-1	Size	Lines of code per language	f	DATA	f	t	JAV	\N	\N	f	f	f
5	generated_ncloc	Generated non Commenting Lines of Code	-1	Size	Generated lines of code	f	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
6	classes	Classes	-1	Size	Classes	f	INT	f	t	JAV	\N	\N	f	f	f
7	files	Number of files	-1	Size	Files	f	INT	f	t	JAV	\N	\N	f	f	f
8	directories	Directories	-1	Size	Directories	f	INT	f	t	JAV	\N	\N	f	f	f
9	packages	Packages	-1	Size	Packages	f	INT	f	t	JAV	\N	\N	f	t	f
10	functions	Functions	-1	Size	Functions	f	INT	f	t	JAV	\N	\N	f	f	f
11	accessors	Accessors	-1	Size	Accessors	f	INT	f	t	JAV	\N	\N	f	t	f
12	statements	Number of statements	-1	Size	Statements	f	INT	f	t	JAV	\N	\N	f	f	f
13	public_api	Public API	-1	Size	Public API	f	INT	f	t	JAV	\N	\N	f	f	f
14	projects	Number of projects	-1	Size	Projects	f	INT	f	t	JAV	\N	\N	f	f	f
15	comment_lines	Number of comment lines	1	Documentation	Comment lines	f	INT	f	t	JAV	\N	\N	f	f	f
16	comment_lines_density	Comments balanced by ncloc + comment lines	1	Documentation	Comments (%)	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	f	f	f
17	public_documented_api_density	Public documented classes and functions balanced by ncloc	1	Documentation	Public documented API (%)	t	PERCENT	f	t	JAV	0.00000000000000000000	100.00000000000000000000	t	f	f
18	public_undocumented_api	Public undocumented classes, functions and variables	-1	Documentation	Public undocumented API	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
19	commented_out_code_lines	Commented lines of code	-1	Documentation	Commented-out LOC	t	INT	f	t	JAV	\N	0.00000000000000000000	t	t	f
20	complexity	Cyclomatic complexity	-1	Complexity	Complexity	f	INT	f	t	JAV	\N	\N	f	f	f
21	file_complexity	Complexity average by file	-1	Complexity	Complexity /file	t	FLOAT	f	t	JAV	\N	\N	f	f	f
22	complexity_in_classes	Cyclomatic complexity in classes	-1	Complexity	Complexity in classes	f	INT	f	t	JAV	\N	\N	f	t	t
23	class_complexity	Complexity average by class	-1	Complexity	Complexity /class	t	FLOAT	f	t	JAV	\N	\N	f	f	f
24	complexity_in_functions	Cyclomatic complexity in functions	-1	Complexity	Complexity in functions	f	INT	f	t	JAV	\N	\N	f	t	t
25	function_complexity	Complexity average by function	-1	Complexity	Complexity /function	t	FLOAT	f	t	JAV	\N	\N	f	f	f
26	class_complexity_distribution	Classes distribution /complexity	0	Complexity	Classes distribution /complexity	t	DISTRIB	f	t	JAV	\N	\N	f	t	f
27	function_complexity_distribution	Functions distribution /complexity	0	Complexity	Functions distribution /complexity	t	DISTRIB	f	t	JAV	\N	\N	f	f	f
29	tests	Number of unit tests	-1	Tests	Unit tests	f	INT	f	t	JAV	\N	\N	f	f	f
28	file_complexity_distribution	Files distribution /complexity	0	Complexity	Files distribution /complexity	t	DISTRIB	f	t	JAV	\N	\N	f	f	f
30	test_execution_time	Execution duration of unit tests	-1	Tests	Unit tests duration	f	MILLISEC	f	t	JAV	\N	\N	f	f	f
31	test_errors	Number of unit test errors	-1	Tests	Unit test errors	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
32	skipped_tests	Number of skipped unit tests	-1	Tests	Skipped unit tests	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
85	overall_conditions_by_line	Overall conditions by all tests and by line	0	Tests (Overall)	Overall conditions by line	f	DATA	f	t	JAV	\N	\N	f	f	t
86	overall_covered_conditions_by_line	Overall covered branches by all tests and by line	0	Tests (Overall)	Overall covered branches by line	f	DATA	f	t	JAV	\N	\N	f	f	t
87	duplicated_lines	Duplicated lines	-1	Duplication	Duplicated lines	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
88	duplicated_blocks	Duplicated blocks	-1	Duplication	Duplicated blocks	t	INT	f	t	JAV	\N	0.00000000000000000000	t	f	f
\.


--
-- Name: metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('metrics_id_seq', 145, true);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY notifications (id, data) FROM stdin;
\.


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('notifications_id_seq', 1, false);


--
-- Data for Name: perm_templates_groups; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY perm_templates_groups (id, group_id, template_id, permission_reference, created_at, updated_at) FROM stdin;
1	1	1	admin	2016-10-11 14:21:10.78	2016-10-11 14:21:10.78
2	1	1	issueadmin	2016-10-11 14:21:10.817	2016-10-11 14:21:10.817
3	\N	1	user	2016-10-11 14:21:10.857	2016-10-11 14:21:10.857
4	\N	1	codeviewer	2016-10-11 14:21:10.865	2016-10-11 14:21:10.865
\.


--
-- Name: perm_templates_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('perm_templates_groups_id_seq', 4, true);


--
-- Data for Name: perm_templates_users; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY perm_templates_users (id, user_id, template_id, permission_reference, created_at, updated_at) FROM stdin;
\.


--
-- Name: perm_templates_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('perm_templates_users_id_seq', 1, false);


--
-- Data for Name: permission_templates; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY permission_templates (id, name, kee, description, created_at, updated_at, key_pattern) FROM stdin;
1	Default template	default_template	This permission template will be used as default when no other permission configuration is available	2016-10-11 14:21:10.725	2016-10-11 14:21:10.725	\N
\.


--
-- Name: permission_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('permission_templates_id_seq', 1, true);


--
-- Data for Name: project_links; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY project_links (id, project_id, link_type, name, href) FROM stdin;
\.


--
-- Name: project_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('project_links_id_seq', 1, false);


--
-- Data for Name: project_measures; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY project_measures (id, value, metric_id, snapshot_id, rule_id, rules_category_id, text_value, tendency, measure_date, project_id, alert_status, alert_text, url, description, rule_priority, characteristic_id, variation_value_1, variation_value_2, variation_value_3, variation_value_4, variation_value_5, person_id, measure_data) FROM stdin;
\.


--
-- Name: project_measures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('project_measures_id_seq', 1, false);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY projects (id, name, description, enabled, scope, qualifier, kee, root_id, language, copy_resource_id, long_name, person_id, created_at, path, deprecated_kee, uuid, project_uuid, module_uuid, module_uuid_path, authorization_updated_at) FROM stdin;
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('projects_id_seq', 1, false);


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY properties (id, prop_key, resource_id, text_value, user_id) FROM stdin;
13	sonar.profile.java	\N	Sonar way	\N
14	sonar.permission.template.default	\N	default_template	\N
18	sonar.core.id	\N	20161012164538	\N
19	sonar.core.version	\N	5.1	\N
20	sonar.core.startTime	\N	2016-10-12T16:45:38+0000	\N
\.


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('properties_id_seq', 20, true);


--
-- Data for Name: quality_gate_conditions; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY quality_gate_conditions (id, qgate_id, metric_id, period, operator, value_error, value_warning, created_at, updated_at) FROM stdin;
1	1	94	\N	GT	0	\N	2016-10-11 14:20:56.738	\N
2	1	95	3	GT	0	\N	2016-10-11 14:20:56.762	\N
3	1	31	\N	GT	0	\N	2016-10-11 14:20:56.778	\N
4	1	33	\N	GT	0	\N	2016-10-11 14:20:56.817	\N
5	1	37	3	LT	80	\N	2016-10-11 14:20:56.875	\N
6	1	106	\N	GT	\N	0	2016-10-11 14:20:56.903	\N
7	1	107	\N	GT	\N	0	2016-10-11 14:20:56.91	\N
8	1	32	\N	GT	\N	0	2016-10-11 14:20:56.919	\N
\.


--
-- Name: quality_gate_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('quality_gate_conditions_id_seq', 8, true);


--
-- Data for Name: quality_gates; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY quality_gates (id, name, created_at, updated_at) FROM stdin;
1	SonarQube way	2016-10-11 14:20:56.676	\N
\.


--
-- Name: quality_gates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('quality_gates_id_seq', 1, true);


--
-- Data for Name: resource_index; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY resource_index (id, kee, "position", name_size, resource_id, root_project_id, qualifier) FROM stdin;
\.


--
-- Name: resource_index_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('resource_index_id_seq', 1, false);


--
-- Data for Name: rules; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY rules (id, plugin_rule_key, plugin_config_key, plugin_name, description, priority, template_id, name, status, language, created_at, updated_at, note_created_at, note_updated_at, note_user_login, note_data, characteristic_id, default_characteristic_id, remediation_function, default_remediation_function, remediation_coeff, default_remediation_coeff, remediation_offset, default_remediation_offset, effort_to_fix_description, tags, system_tags, is_template, description_format) FROM stdin;
2	InsufficientLineCoverage	InsufficientLineCoverage	common-java	<p>An issue is created on a file as soon as the line coverage on this file is less than the required threshold. It gives the number of lines to be covered in order to reach the required threshold.</p>	2	\N	Insufficient line coverage by unit tests	REMOVED	java	2016-10-11 14:20:57.382	2016-10-12 16:28:41.544	\N	\N	\N	\N	\N	47	\N	LINEAR	\N	3min	\N	\N	\N	\N	\N	f	HTML
1	InsufficientBranchCoverage	InsufficientBranchCoverage	common-java	<p>An issue is created on a file as soon as the branch coverage on this file is less than the required threshold.It gives the number of branches to be covered in order to reach the required threshold.</p>	2	\N	Insufficient branch coverage by unit tests	REMOVED	java	2016-10-11 14:20:57.367	2016-10-12 16:28:41.555	\N	\N	\N	\N	\N	47	\N	LINEAR	\N	10min	\N	\N	\N	\N	\N	f	HTML
33	S1228	S1228	squid	<p>Each package in a Java project should include a <code>package-info.java</code> file. The purpose of this file is to document the Java package using javadoc and declare package annotations.</p>\n\n<h2>Compliant Solution</h2>\n<pre>\n/**\n* This package has non null parameters and is documented.\n**/\n@ParametersAreNonnullByDefault\npackage org.foo.bar;\n</pre>	1	\N	Packages should have a javadoc file 'package-info.java'	REMOVED	java	2016-10-11 14:20:57.892	2016-10-12 16:28:41.567	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
6	FailedUnitTests	FailedUnitTests	common-java	<p>Test failures or errors generally indicate that regressions have been introduced. Those tests should be handled as soon as possible to reduce the cost to fix the corresponding regressions.</p>	2	\N	Failed unit tests	REMOVED	java	2016-10-11 14:20:57.399	2016-10-12 16:28:40.374	\N	\N	\N	\N	\N	47	\N	LINEAR	\N	1h	\N	\N	\N	\N	\N	f	HTML
69	S1191	S1191	squid	<p>Classes in the <code>sun.*</code> packages are considered implementation details, and are not part of the Java API.</p>\n<p>They can cause problems when moving to new versions of Java because there is no backwards compatibility guarantee. Similarly, they can cause problems when moving to a different Java vendor, such as OpenJDK.</p>\n<p>Such classes are almost always wrapped by Java API classes that should be used instead.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nimport com.sun.jna.Native;     // Non-Compliant\nimport sun.misc.BASE64Encoder; // Non-Compliant\n</pre>	2	\N	Classes from "sun.*" packages should not be used	REMOVED	java	2016-10-11 14:20:57.971	2016-10-12 16:28:40.389	\N	\N	\N	\N	\N	6	\N	CONSTANT_ISSUE	\N	\N	\N	1h	\N	\N	\N	f	HTML
68	S1190	S1190	squid	<p>Through Java's evolution keywords have been added. While code that uses those words as identifiers may be compilable under older versions of Java, it will not be under modern versions. </p>\n<table>\n<tr><th>Keyword</th><th>Added</th></tr>\n<tr><td>assert</td><td>1.4</td></tr>\n<tr><td>const</td><td>reserved</td></tr>\n<tr><td>enum</td><td>5.0</td></tr>\n<tr><td>goto</td><td>reserved</td></tr>\n<tr><td>strictfp</td><td>1.2</td></tr>\n</table>\n<p>The following code snippet illustrates this rule:</p>\n<pre>\npublic void doSomething() {\n  int enum = 42;            // Non-Compliant\n}\n</pre>	2	\N	Future keywords should not be used as names	REMOVED	java	2016-10-11 14:20:57.969	2016-10-12 16:28:40.39	\N	\N	\N	\N	\N	6	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
177	S1860	S1860	squid	<p>Objects which are pooled and potentially reused should not be used for synchronization. If they are, it can cause unrelated threads to deadlock with unhelpful stacktraces. Specifically, <code>String</code> literals, and boxed primitives such as Integers should not be used as lock objects because they are pooled and reused. The story is even worse for <code>Boolean</code> objects, because there are only two instances of <code>Boolean</code>, <code>Boolean.TRUE</code> and <code>Boolean.FALSE</code> and every class that uses a Boolean will be referring to one of the two.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nprivate static final Boolean bLock = Boolean.FALSE;\nprivate static final Integer iLock = Integer.valueOf(0);\nprivate static final String sLock = "LOCK";\n\npublic void doSomething() {\n\n  synchronized(bLock) {  // Noncompliant\n    // ...\n  }\n  synchronized(iLock) {  // Noncompliant\n    // ...\n  }\n  synchronized(sLock) {  // Noncompliant\n    // ...\n  }\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nprivate static final Object lock1 = new Object();\nprivate static final Object lock2 = new Object();\nprivate static final Object lock3 = new Object();\n\npublic void doSomething() {\n\n  synchronized(lock1) {\n    // ...\n  }\n  synchronized(lock2) {\n    // ...\n  }\n  synchronized(lock3) {\n    // ...\n  }\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/rQGeAQ">CERT, LCK01-J</a> - Do not synchronize on objects that may be reused</li>\n</ul>	4	\N	Synchronisation should not be based on Strings or boxed primitives	REMOVED	java	2016-10-11 14:20:58.204	2016-10-12 16:28:40.403	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
63	S2178	S2178	squid	The use of non-short-circuit logic in a boolean context is likely a mistake - one that could cause serious program errors as conditions are evaluated under the wrong circumstances.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nif(getTrue() | getFalse()) { ... } // Noncompliant; both sides evaluated\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nif(getTrue() || getFalse()) { ... }  // true short-circuit logic\n</pre>	3	\N	Short-circuit logic should be used in boolean contexts	REMOVED	java	2016-10-11 14:20:57.958	2016-10-12 16:28:40.349	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
61	S2176	S2176	squid	While it's perfectly legal to give a class the same simple name as a class in another package that it extends or interface it implements, it's confusing and could cause problems in the future. \n\n<h2>Noncompliant Code Example</h2>\n<pre>\npackage my.mypackage;\n\npublic class Foo implements a.b.Foo { // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npackage my.mypackage;\n\npublic class FooJr implements a.b.Foo {\n</pre>	2	\N	Class names should not shadow interfaces or superclasses	REMOVED	java	2016-10-11 14:20:57.955	2016-10-12 16:28:40.407	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
62	S2175	S2175	squid	<p>A couple <code>Collection</code> methods can be called with arguments of an incorrect type, but doing so is pointless and likely the result of using the wrong argument. This rule will raise an issue when the type of the argument to <code>List.contains</code> or <code>List.remove</code> is unrelated to the type used for the list declaration.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nList&lt;String&gt; list = new ArrayList&lt;String&gt;();\nInteger integer = Integer.valueOf(1);\n\nif (list.contains(integer)) {  // Noncompliant. Always false.\n  list.remove(integer); // Noncompliant. list.add(iger) doesn't compile, so this will always return false\n}\n</pre>	3	\N	Inappropriate "Collection" calls should not be made	REMOVED	java	2016-10-11 14:20:57.956	2016-10-12 16:28:40.408	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
3	InsufficientCommentDensity	InsufficientCommentDensity	common-java	<p>An issue is created on a file as soon as the comment density coverage on this file is less than the required threshold. It gives the number of comment lines to be written in order to reach the required threshold.</p>	2	\N	Insufficient comment density	REMOVED	java	2016-10-11 14:20:57.387	2016-10-12 16:28:40.41	\N	\N	\N	\N	\N	16	\N	LINEAR	\N	3min	\N	\N	\N	\N	\N	f	HTML
9	S2096	S2096	squid	<p>There's no reason for a <code>main</code> method to <code>throw</code> anything. After all, what's going to catch it?</p>\n\n<p>Instead, the method should itself gracefully handle any exceptions that may bubble up to it, attach as much contextual information as possible, and perform whatever logging or user communication is necessary.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic static void main(String args[]) throws Exception { // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic static void main(String args[]) {\n</pre>	2	\N	"main" should not "throw" anything	REMOVED	java	2016-10-11 14:20:57.823	2016-10-12 16:28:40.442	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
85	S1872	S1872	squid	<p>There is no requirement that class names be unique, only that they be unique within a package. Therefore trying to determine an object's type based on its class name is an exercise fraught with danger. One of those dangers is that a malicious user will send objects of the same name as the trusted class and thereby gain trusted access. </p>\n<p>Instead, the <code>instanceof</code> operator should be used to check the object's underlying type.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npackage computer;\nclass Pear extends Laptop { ... }\n\npackage food;\nclass Pear extends Fruit { ... }\n\nclass Store {\n\n  public boolean hasSellByDate(Object item) {\n    if ("Pear".equals(item.getClass().getSimpleName())) {  // Noncompliant\n      return true;  // Results in throwing away week-old computers\n    }\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass Store {\n\n  public boolean hasSellByDate(Object item) {\n    if (item instanceof food.Pear) {\n      return true;\n    }\n  }\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/486.html">MITRE, CWE-486</a> - Comparison of Classes by Name</li>\n</ul>	3	\N	Classes should not be compared by name	REMOVED	java	2016-10-11 14:20:58.008	2016-10-12 16:28:40.414	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
84	S1871	S1871	squid	<p>Having two <code>cases</code> in the same <code>switch</code> statement or branches in the same <code>if</code> structure  with the same implementation is at best duplicate code, and at worst a coding error. If the same logic is truly needed for both instances, then they should be combined, for an <code>if</code> structure or one should fall through to the other for a <code>switch</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nswitch (i) {\n  case 1: \n    doSomething();\n    break;\n  case 2: \n    doSomethingDifferent();\n    break;\n  case 3:  // Noncompliant; duplicates case 1's implementation\n    doSomething(); \n    break;\n  default: \n    doTheRest();\n}\n\nif (a &gt;= 0 &amp;&amp; a &lt; 10) {\n  doTheThing();\nelse if (a &gt;= 10 &amp;&amp; a &lt; 20) {\n  doTheOtherThing();\n}\nelse if (a &gt;= 20 &amp;&amp; a &lt; 50) {\n  doTheThing();  // Noncompliant; duplicates first condition\n}\nelse {\n  doTheRest(); \n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nswitch (i) {\n  case 1: \n  case 3:\n    doSomething();\n    break;\n  case 2: \n    doSomethingDifferent();\n    break;\n  default: \n    doTheRest();\n}\n\nif ((a &gt;= 0 &amp;&amp; a &lt; 10) || (a &gt;= 20 &amp;&amp; a &lt; 50)) {\n  doTheThing();\nelse if (a &gt;= 10 &amp;&amp; a &lt; 20) {\n  doTheOtherThing();\n}\nelse {\n  doTheRest(); \n}\n</pre>\n<p>or </p>\n<pre>\nswitch (i) {\n  case 1: \n    doSomething();\n    break;\n  case 2: \n    doSomethingDifferent();\n    break;\n  case 3:\n    doThirdThing(); \n    break;\n  default: \n    doTheRest();\n}\n\nif (a &gt;= 0 &amp;&amp; a &lt; 10) {\n  doTheThing();\nelse if (a &gt;= 10 &amp;&amp; a &lt; 20) {\n  doTheOtherThing();\n}\nelse if (a &gt;= 20 &amp;&amp; a &lt; 50) {\n  doTheThirdThing();\n}\nelse {\n  doTheRest(); \n}\n</pre>	2	\N	Two branches in the same conditional structure should not have exactly the same implementation	REMOVED	java	2016-10-11 14:20:58.005	2016-10-12 16:28:40.415	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
18	MaximumInheritanceDepth	MaximumInheritanceDepth	squid	<p>Inheritance is certainly one of the most valuable concepts in object-oriented programming.</p>\n<p>It's a way to compartmentalize and reuse code by creating collections of attributes and behaviors called classes which can be based on previously created classes.</p>\n<p>But abusing of this concept by creating a deep inheritance tree can lead to very complex and unmaintainable source code.</p>\n<p>Most of the time a too deep inheritance tree is due to bad object oriented design which has led to systematically use 'inheritance' when 'composition' would suit better.</p>	2	\N	Inheritance tree of classes should not be too deep	REMOVED	java	2016-10-11 14:20:57.854	2016-10-12 16:28:42.602	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	4h	\N	\N	\N	f	HTML
16	ModifiersOrderCheck	ModifiersOrderCheck	squid	<p>The Java Language Specification recommends listing modifiers in the following order:</p>\n<p>1. Annotations</p>\n<p>2. public</p>\n<p>3. protected</p>\n<p>4. private</p>\n<p>5. abstract</p>\n<p>6. static</p>\n<p>7. final</p>\n<p>8. transient</p>\n<p>9. volatile</p>\n<p>10. synchronized</p>\n<p>11. native</p>\n<p>12. strictfp</p>\n<p>Not following this convention has no technical impact, but will reduce the code's readability because most developers are used to the standard order.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nstatic public void main(String[] args) {   // Non-Compliant\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic static void main(String[] args) {   // Compliant\n}\n</pre>	1	\N	Modifiers should be declared in the correct order	REMOVED	java	2016-10-11 14:20:57.849	2016-10-12 16:28:40.378	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
15	StringEqualityComparisonCheck	StringEqualityComparisonCheck	squid	<p>Strings, just like any other <code>Object</code>, should be compared using the <code>equals()</code> method.</p>\n<p>Using <code>==</code> and <code>!=</code> compares references rather than values, and usually does not work.</p>\n<p>The following code:</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif (variable == "foo") { /* ... */ }\nif (variable != "foo") { /* ... */ }\n</pre>\n<h2>Compliant Solution</h2>\n\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/597.html">MITRE, CWE-597</a> - Use of Wrong Operator in String Comparison</li>\n</ul>	3	\N	Strings should be compared using "equals()"	REMOVED	java	2016-10-11 14:20:57.846	2016-10-12 16:28:40.416	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
14	S1444	S1444	squid	<p>There is no good reason to declare a field "public" and "static" without also declaring it "final". Most of the time this is a kludge to share a state among several objects. But with this approach, any object can do whatever it wants with the shared state, such as setting it to <code>null</code>. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Greeter {\n  public static Foo foo = new Foo();\n  ...\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Greeter {\n  public static const Foo FOO = new Foo();\n  ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/500.html">MITRE, CWE-500</a> - Public Static Field Not Marked Final</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/display/java/OBJ10-J.">CERT OBJ10-J</a> - Do not use public static nonfinal variables</li>\n</ul>	3	\N	"public static" fields should always be constant	REMOVED	java	2016-10-11 14:20:57.844	2016-10-12 16:28:40.416	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
13	S1201	S1201	squid	<p>"equals" as a method name should be used exclusively to override <code>Object.equals(Object)</code> to prevent any confusion.</p>\n<p>It is tempting to overload the method to take a specific class instead of <code>Object</code> as parameter, to save the class comparison check. However, this will not work as expected.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass MyClass {\n  private int foo = 1;\n\n  public boolean equals(MyClass o) {                    // Non-Compliant - "equals" method which does not override Object.equals(Object)\n    return o != null &amp;&amp; o.foo == this.foo;\n  }\n\n  public static void main(String[] args) {\n    MyClass o1 = new MyClass();\n    Object o2 = new MyClass();\n    System.out.println(o1.equals(o2));                  // Will display "false" because "o2" is of type "Object" and not "MyClass"\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass MyClass {\n  private int foo = 1;\n\n  @Override\n  public boolean equals(Object o) {                     // Compliant - overrides Object.equals(Object)\n    if (o == null || !(o instanceof MyClass)) {\n      return false;\n    }\n\n    MyClass other = (MyClass)o;\n    return this.foo == other.foo;\n  }\n\n  /* ... */\n}\n</pre>	3	\N	Methods named "equals" should override Object.equals(Object)	REMOVED	java	2016-10-11 14:20:57.841	2016-10-12 16:28:40.417	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
12	S1200	S1200	squid	<p>\nAccording to the Single Responsibility Principle, introduced by Robert C. Martin in his book "Principles of Object Oriented Design", a class should have only one responsibility:\n</p>\n\n<blockquote>\nIf a class has more than one responsibility, then the responsibilities become coupled.\nChanges to one responsibility may impair or inhibit the class’ ability to meet the others.\nThis kind of coupling leads to fragile designs that break in unexpected ways when changed.\n</blockquote>\n\n<p>\nClasses which rely on many other classes tend to aggregate too many responsibilities and should be split into several smaller ones.\nNested classes dependencies are not counted as dependencies of the outer class.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<p>In case the threshold is set to 5</p>\n<pre>\nclass Foo {                        // Noncompliant - Foo depends on too many classes: T1, T2, T3, T4, T5, T6 and T7\n  T1 a1;                           // Foo is coupled to T1\n  T2 a2;                           // Foo is coupled to T2\n  T3 a3;                           // Foo is coupled to T3\n\n  public T4 compute(T5 a, T6 b) {  // Foo is coupled to T4, T5 and T6\n    T7 result = a.getResult(b);    // Foo is coupled to T7\n    return result;\n  }\n\n  public static class Bar {        // Compliant - Bar depends on 2 classes: T8 and T9\n    T8 a8;\n    T9 a9;\n  }\n}\n</pre>	2	\N	Classes should not be coupled to too many other classes (Single Responsibility Principle)	REMOVED	java	2016-10-11 14:20:57.836	2016-10-12 16:28:40.418	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	2h	\N	\N	\N	f	HTML
27	S1313	S1313	squid	<p>Hardcoding an IP address into source code is a bad idea for several reasons:</p>\n<ul>\n<li> a recompile is required if the address changes</li>\n<li> it forces the same address to be used in every environment (dev, sys, qa, prod)</li>\n<li> it places the responsibility of setting the value to use in production on the shoulders of the developer</li>\n<li> it allows attackers to decompile the code and thereby discover a potentially sensitive address</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nString ip = "127.0.0.1";\nSocket socket = new Socket(ip, 6667);\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nString ip = System.getProperty("myapplication.ip");\nSocket socket = new Socket(ip, 6667);\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/qQCHAQ">CERT, MSC03-J</a> - Never hard code sensitive information</li>\n</ul>	2	\N	IP addresses should not be hardcoded	REMOVED	java	2016-10-11 14:20:57.877	2016-10-12 16:28:41.501	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
20	S1315	S1315	squid	<p>This rule allows you to track the use of the Checkstyle suppression comment mechanism. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n// CHECKSTYLE:OFF\n</pre>	1	\N	"CHECKSTYLE:OFF" suppression comments should not be used	REMOVED	java	2016-10-11 14:20:57.86	2016-10-12 16:28:41.504	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
10	S1206	S1206	squid	<p>According to the Java Language Specification, there is a contract between <code>equals(Object)</code> and <code>hashCode()</code>:</p>\n<blockquote>\n<p>If two objects are equal according to the <code>equals(Object)</code> method, then calling the <code>hashCode</code> method on each of the two objects must produce the same integer result. </p>\n<p>It is not required that if two objects are unequal according to the <code>equals(java.lang.Object)</code> method, then calling the <code>hashCode</code> method on each of the two objects must produce distinct integer results.</p>\n<p>However, the programmer should be aware that producing distinct integer results for unequal objects may improve the performance of hashtables.</p>\n</blockquote>\n<p>In order to comply with this contract, those methods should be either both inherited, or both overridden.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass MyClass {    // Non-Compliant - should also override "hashCode()"\n\n  @Override\n  public boolean equals(Object obj) {\n    /* ... */\n  }\n\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass MyClass {    // Compliant\n\n  @Override\n  public boolean equals(Object obj) {\n    /* ... */\n  }\n\n  @Override\n  public int hashCode() {\n    /* ... */\n  }\n\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/581.html">MITRE, CWE-581</a> - Object Model Violation: Just One of Equals and Hashcode Defined</li>\n<li> CERT Java Secure Coding, MET09-J - Classes that define an equals() method must also define a hashCode() method</li>\n</ul>	4	\N	"equals(Object obj)" and "hashCode()" should be overridden in pairs	REMOVED	java	2016-10-11 14:20:57.827	2016-10-12 16:28:40.419	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
11	IndentationCheck	IndentationCheck	squid	<p>Proper indentation is a simple and effective way to improve the code's readability. Consistent indentation among the developers on a team also reduces the differences that are committed to source control systems, making code reviews easier. </p>\n<p>By default this rule checks that each block of code is indented but not the size of this indent. The parameter "indentSize" allows the expected indent size to be defined. Only the first line of a badly indented section is reported.</p>\n<p>The following code illustrates this rule when the expected indent size is set to 2:</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass Foo {\n  public int a; \n   public int b;   // Noncompliant, expected to start at column 4\n\n...\n\n  public void doSomething() {\n    if(something) {\n          doSomethingElse();  // Noncompliant, expected to start at column 6\n  }   // Noncompliant, expected to start at column 4\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass Foo {\n  public int a; \n  public int b; \n\n...\n\n  public void doSomething() {\n    if(something) {\n        doSomethingElse();\n    } \n  }\n}\n</pre>	1	\N	Source code should be indented consistently	REMOVED	java	2016-10-11 14:20:57.83	2016-10-12 16:28:40.421	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	\N	f	HTML
5	SkippedUnitTests	SkippedUnitTests	common-java	<p>Skipped unit tests are considered as dead code. Either they should be activated again (and updated) or they should be removed.</p>	2	\N	Skipped unit tests	REMOVED	java	2016-10-11 14:20:57.395	2016-10-12 16:28:40.425	\N	\N	\N	\N	\N	51	\N	LINEAR	\N	10min	\N	\N	\N	\N	\N	f	HTML
25	S1310	S1310	squid	<p>This rule allows you to track the use of the PMD suppression comment mechanism. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n// NOPMD\n</pre>	1	\N	"NOPMD" suppression comments should not be used	REMOVED	java	2016-10-11 14:20:57.871	2016-10-12 16:28:41.512	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
31	S1226	S1226	squid	<p>While it is technically correct to assign to parameters from within method bodies, it is better to use temporary variables to store intermediate results.</p>\n<p>This rule will typically detect cases where a constructor parameter is assigned to itself instead of a field of the same name, i.e. when <code>this</code> was forgotten.</p>\n<p>Allowing parameters to be assigned to also reduces the code readability as developers will not be able to know whether the original parameter or some temporary variable is being accessed without going through the whole method.</p>\n<p>Moreover, some developers might also expect assignments of method parameters to be visible from callers, which is not the case and can confuse them.</p>\n<p>All parameters should be treated as <code>final</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass MyClass {\n  public String name;\n\n  public MyClass(String name) {\n    name = name;                    // Noncompliant - useless identity assignment\n  }\n\n  public int add(int a, int b) {\n    a = a + b;                      // Noncompliant\n\n    /* additional logic */\n\n    return a;                       // Seems like the parameter is returned as is, what is the point?\n  }\n\n  public static void main(String[] args) {\n    MyClass foo = new MyClass();\n    int a = 40;\n    int b = 2;\n    foo.add(a, b);                  // Variable "a" will still hold 40 after this call\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass MyClass {\n  public String name;\n\n  public MyClass(String name) {\n    this.name = name;               // Compliant\n  }\n\n  public int add(int a, int b) {\n    return a + b;                   // Compliant\n  }\n\n  public static void main(String[] args) {\n    MyClass foo = new MyClass();\n    int a = 40;\n    int b = 2;\n    foo.add(a, b);\n  }\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2012, 17.8 - A function parameter should not be modified</li>\n</ul>	2	\N	Method parameters, caught exceptions and foreach variables should not be reassigned	REMOVED	java	2016-10-11 14:20:57.887	2016-10-12 16:28:41.562	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
29	ObjectFinalizeOverridenCheck	ObjectFinalizeOverridenCheck	squid	<p>This Object.finalize() method is called by the garbage collector on an object when garbage collection determines that there are no more references to the object. But there is absolutely no warranty that this method will be called AS SOON AS the last references to the object are removed. It can be few microseconds to few minutes later. So when some system resources need to be disposed by an object, it's better to not rely on this asynchronous mechanism to dispose them.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyClass {\n  ...\n  protected void finalize() {\n    releaseSomeResources();    //Non-Compliant\n  }\n  ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> CERT Java Secure Coding, MET12-J - Do not use finalizers|</li>\n</ul>	3	\N	The Object.finalize() method should not be overriden	REMOVED	java	2016-10-11 14:20:57.883	2016-10-12 16:28:42.583	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
30	ForLoopCounterChangedCheck	ForLoopCounterChangedCheck	squid	<p>Loop invariants are expressions whose values do not change during the execution of a loop. Placing the calculation of an invariant inside a loop is inefficient because the resulting value will always be the same, yet it must be re-calculated each time through the loop. Therefore invariants should be calculated and stored before loop execution begins.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nFor y = 0 to Height-1\n   For x = 0 to Width-1\n      i = y*Width + x   ' y*Width is invariant\n      '...\n   Next x\nNext y\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nFor y = 0 to Height-1\n   Dim temp as Integer = y*Width\n   For x = 0 to Width-1\n      i = temp + x\n      '...\n   Next x\nNext y\n</pre>	2	\N	Loop invariants should not be calculated inside the loop	REMOVED	java	2016-10-11 14:20:57.885	2016-10-12 16:28:40.361	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	3min	\N	\N	\N	f	HTML
28	ArchitecturalConstraint	ArchitecturalConstraint	squid	<p>A source code comply to an architectural model when it fully\n\tadheres to a set of architectural constraints. A constraint allows to\n\tdeny references between classes by pattern.</p>\n<p>You can for instance use this rule to :</p>\n<ul>\n\t<li>forbid access to **.web.** from **.dao.** classes</li>\n\t<li>forbid access to java.util.Vector, java.util.Hashtable and\n\t\tjava.util.Enumeration from any classes</li>\n\t<li>forbid access to java.sql.** from **.ui.** and **.web.**\n\t\tclasses</li>\n</ul>	2	\N	Architectural constraint	REMOVED	java	2016-10-11 14:20:57.88	2016-10-12 16:28:40.368	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	HTML
108	AssignmentInSubExpressionCheck	AssignmentInSubExpressionCheck	squid	<p>Assignments within sub-expressions are hard to spot and therefore make the code less readable.</p>\n<p>It is also a common mistake to write <code>=</code> when <code>==</code> was meant.</p>\n<p>Ideally, expressions should not have side-effects.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\ndoSomething(i = 42);\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\ni = 42;\ndoSomething(i);   \n</pre>\n<p>or</p>\n<pre>\ndoSomething(i == 42);  // Perhaps in fact the assignment operator was expected\n</pre>\n<h2>Exceptions</h2>\n\n<p>Assignments in <code>while</code> statement conditions, and assignments enclosed in relational expressions are allowed.</p>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 13.1 - Assignment operators shall not be used in expressions that yield a Boolean value</li>\n<li> MISRA C++:2008, 6-2-1 - Assignment operators shall not be used in sub-expressions</li>\n<li> MISRA C:2012, 13.4 - The result of of an assignment operator should not be used</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/481.html">MITRE, CWE-481</a> - Assigning instead of Comparing</li>\n</ul>	2	\N	Assignments should not be made from within sub-expressions	REMOVED	java	2016-10-11 14:20:58.057	2016-10-12 16:28:40.431	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
32	S2437	S2437	squid	<p>Certain bit operations are just silly and should not be performed because their results are predictable.</p>\n\n<p>Specifically, using <code>&amp; -1</code> with any value will always result in the original value, as will <code>anyValue ^ 0</code> and <code>anyValue | 0</code>.</p>	2	\N	Silly bit operations should not be performed	REMOVED	java	2016-10-11 14:20:57.89	2016-10-12 16:28:41.561	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
48	S2301	S2301	squid	<p>A selector argument is a <code>boolean</code> argument that's used to determine which of two paths to take through a method. Specifying such a parameter may seem innocuous, particularly if it's well named.</p>\n\n<p>Unfortunately, the maintainers of the code calling the method won't see the parameter name, only its value. They'll be forced either to guess at the meaning or to take extra time to look the method up.</p>\n\n<p>Instead, separate methods should be written.</p>\n\n<p>This rule finds methods with a <code>boolean</code> that's used to determine which path to take through the method.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void tempt(String name, boolean ofAge) {\n  if (ofAge) {\n    offerLiquor(name);\n  } else {\n    offerCandy(name);\n  }\n}\n\n// ...\npublic void corrupt() {\n  tempt("Joe", false); // does this mean not to temp Joe?\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void temptAdult(String name) {\n  offerLiquor(name);\n}\n\npublic void temptChild(String name) {\n    offerCandy(name);\n}\n\n// ...\npublic void corrupt() {\n  offerCandy("Joe");\n}\n</pre>	2	\N	Public methods should not contain selector arguments	REMOVED	java	2016-10-11 14:20:57.928	2016-10-12 16:28:40.432	\N	\N	\N	\N	\N	2	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
49	S1696	S1696	squid	<p><code>NullPointerException</code> should be avoided, not caught. Any situation in which <code>NullPointerException</code> is explicitly caught can easily be converted to a <code>null</code> test, and any behavior being carried out in the catch block can easily be moved to the "is null" branch of the conditional.</p>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic int lengthPlus(String str) {\n  int len = 2;\n\n  if (str != null) {\n    len += str.length();\n  }\n  else {\n    log.info("argument was null");\n  }\n  return len;\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/395.html">MITRE, CWE-395</a> - Use of NullPointerException Catch to Detect NULL Pointer Dereference</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/BIB3AQ">CERT, ERR08-J</a> - Do not catch NullPointerException or any of its ancestors</li>\n</ul>	2	\N	"NullPointerException" should not be caught	REMOVED	java	2016-10-11 14:20:57.93	2016-10-12 16:28:40.433	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
47	S1695	S1695	squid	A <code>NullPointerException</code> should indicate that a <code>null</code> value was unexpectedly encountered. Good programming practice dictates that code is structured to avoid NPE's. \n\nExplicitly throwing <code>NullPointerException</code> forces a method's callers to explicitly catch it, rather than coding to avoid it. Further, it makes it difficult to distinguish between the unexpectedly-encountered <code>null</code> value and the condition which causes the method to purposely throw an NPE.\n\nIf an NPE is being thrown to indicate that a parameter to the method should not have been null, use the <code>@NotNull</code> annotation instead.\n\n<h2>Noncompliant Code Sample</h2>\n<pre>\npublic void doSomething (String aString) throws NullPointerException \n{}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void doSomething (@NotNull String aString)\n{}\n</pre>	2	\N	"NullPointerException" should not be explicitly thrown	REMOVED	java	2016-10-11 14:20:57.926	2016-10-12 16:28:40.434	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
4	DuplicatedBlocks	DuplicatedBlocks	common-java	<p>An issue is created on a file as soon as there is a block of duplicated code on this file. It gives the number of blocks in the file.</p>	2	\N	Duplicated blocks	REMOVED	java	2016-10-11 14:20:57.392	2016-10-12 16:28:40.44	\N	\N	\N	\N	\N	36	\N	LINEAR	\N	1h	\N	\N	\N	\N	\N	f	HTML
37	S1223	S1223	squid	<p>Having a class and some of its methods sharing the same name is misleading, and leaves others to wonder whether it was done that way on purpose, or was the methods supposed to be a constructor.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Foo {\n   public Foo() {...}\n   public void Foo(String label) {...}  // Noncompliant\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Foo {\n   public Foo() {...}\n   public void foo(String label) {...}  // Compliant\n}\n</pre>	2	\N	Non-constructor methods should not have the same name as the enclosing class	REMOVED	java	2016-10-11 14:20:57.901	2016-10-12 16:28:41.565	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
38	TrailingCommentCheck	TrailingCommentCheck	squid	<p>This rule verifies that single-line comments are not located at the end of a line of code. The main idea behind this rule is that in order to be really readable, trailing comments would have to be properly written and formatted (correct alignment, no interference with the visual structure of the code, not too long to be visible) but most often, automatic code formatters would not handle this correctly: the code would end up less readable. Comments are far better placed on the previous empty line of code, where they will always be visible and properly formatted.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nint a1 = b + c; // This is a trailing comment that can be very very long\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\n// This very long comment is better placed before the line of code\nint a2 = b + c;\n</pre>\n<h2>Exceptions</h2>\n\n<p>By default, the property "legalTrailingCommentPattern" allows to ignore comments containing only one word :</p>\n<pre>\ndoSomething(); //FIXME\n</pre>	0	\N	Comments should not be located at the end of lines of code	REMOVED	java	2016-10-11 14:20:57.903	2016-10-12 16:28:41.632	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	\N	f	HTML
39	S1215	S1215	squid	<p>\nCalling <code>System.gc()</code> or <code>Runtime.getRuntime().gc()</code> is a bad idea for a simple reason:\nthere is no way to know exactly what will be done under the hood by the JVM because the behavior will depend on its vendor, version and options:\n</p>\n\n<ul>\n  <li>Will the whole application be frozen during the call?</li>\n  <li>Is the -XX:DisableExplicitGC option activated?</li>\n  <li>Will the JVM simply ignore the call?</li>\n  <li>...</li>\n</ul>\n\n<p>An application relying on those unpredictable methods is also unpredictable and therefore broken.</p>\n\n<p>The task of running the garbage collector should be left exclusively to the JVM.</p>	3	\N	Execution of the Garbage Collector should be triggered only by the JVM	REMOVED	java	2016-10-11 14:20:57.907	2016-10-12 16:28:40.426	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
40	S1699	S1699	squid	<p>Calling an overridable method from a constructor could result in failures or strange behaviors when instantiating a subclass which overrides the method.</p>\n<p>For example:</p>\n<ul>\n<li> The subclass class constructor starts by contract by calling the parent class constructor.</li>\n<li> The parent class constructor calls the method, which has been overridden in the child class.</li>\n<li> If the behavior of the child class method depends on fields that are initialized in the child class constructor, unexpected behavior (like a <code>NullPointerException</code>) can result, because the fields aren't initialized yet.</li>\n</ul>	2	\N	Constructors should only call non-overridable methods	REMOVED	java	2016-10-11 14:20:57.91	2016-10-12 16:28:40.427	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
41	S1217	S1217	squid	<p>The purpose of the <code>Thread.run()</code> and <code>Runnable.run()</code> methods is to execute code in a separate, dedicated thread. Calling those methods directly doesn't make sense because it causes their code to be executed in the current thread. </p>\n<p>To get the expected behavior, call the <code>Thread.start()</code> method instead.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nThread myThread = new Thread(runnable);\nmyThread.run(); // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nThread myThread = new Thread(runnable);\nmyThread.start(); // Compliant\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/572.html">MITRE, CWE-572</a> - Call to Thread run() instead of start()</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/KQAiAg">CERT THI00-J</a> - Do not invoke Thread.run()</li>\n</ul>	3	\N	Thread.run() and Runnable.run() should not be called directly	REMOVED	java	2016-10-11 14:20:57.912	2016-10-12 16:28:40.435	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
7	S2092	S2092	squid	<p>The "secure" attribute prevents cookies from being sent over plaintext connections such as HTTP, where they would be easily eavesdropped upon. Instead, cookies with the secure attribute are only sent over encrypted HTTPS connections.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nCookie c = new Cookie(SECRET, secret);  // Noncompliant; cookie is not secure\nresponse.addCookie(c);\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nCookie c = new Cookie(SECRET, secret);\nc.setSecure(true);\nresponse.addCookie(c);\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/614">MITRE, CWE-614</a> - Sensitive Cookie in HTTPS Session Without 'Secure' Attribute</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure</li>\n</ul>	3	\N	Cookies should be "secure"	REMOVED	java	2016-10-11 14:20:57.81	2016-10-12 16:28:40.443	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
43	S1451	S1451	squid	<p>Each source file should start with a header stating file ownership and the license which must be used to distribute the application. </p>\n<p>This rule must be fed with the header text that is expected at the beginning of every file.</p>\n<h2>Compliant Solution</h2>\n\n<pre>\n/*\n * SonarQube, open source software quality management tool.\n * Copyright (C) 2008-2013 SonarSource\n * mailto:contact AT sonarsource DOT com\n *\n * SonarQube is free software; you can redistribute it and/or\n * modify it under the terms of the GNU Lesser General Public\n * License as published by the Free Software Foundation; either\n * version 3 of the License, or (at your option) any later version.\n *\n * SonarQube is distributed in the hope that it will be useful,\n * but WITHOUT ANY WARRANTY; without even the implied warranty of\n * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU\n * Lesser General Public License for more details.\n *\n * You should have received a copy of the GNU Lesser General Public License\n * along with this program; if not, write to the Free Software Foundation,\n * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.\n */\n</pre>	4	\N	Copyright and license headers should be defined	REMOVED	java	2016-10-11 14:20:57.916	2016-10-12 16:28:40.43	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
42	S1219	S1219	squid	<p>Even if it is legal, mixing case and non-case labels in the body of a switch statement is very confusing and can even be the result of a typing error.</p>\n<h2>Noncompliant Code Examples</h2>\n\n<p>Case 1, the code is syntactically correct but the behavior is not the expected one</p>\n<pre>\nswitch (day) {\n  case MONDAY:\n    break;\n  case TUESDAY:\n    foo:for(int i = 0 ; i &lt; X ; i++) {\n         /* ... */\n        break foo;  // this break statement doesn't relate to the nesting case TUESDAY\n         /* ... */\n    }\n    break;\n    /* ... */\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<p>Case 1</p>\n<pre>\nswitch (day) {\n  case MONDAY:\n  case TUESDAY:\n  case WEDNESDAY:\n    doSomething();\n    break;\n  ...\n}\n</pre>\n<p>Case 2</p>\n<pre>\nswitch (day) {\n  case MONDAY:\n    break;\n  case TUESDAY:\n    compute(args); // put the content of the labelled "for" statement in a dedicated method\n    break;\n\n    /* ... */\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 15.0 - The MISRA C <em>switch</em> syntax shall be used.</li>\n<li> MISRA C++:2008, 6-4-3 - A switch statement shall be a well-formed switch statement.</li>\n<li> MISRA C:2012, 16.1 - All switch statements shall be well-formed</li>\n</ul>	3	\N	"switch" statements should not contain non-case labels	REMOVED	java	2016-10-11 14:20:57.914	2016-10-12 16:28:40.435	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
8	S2094	S2094	squid	<p>There is no good excuse for an empty class. If it's being used simply as a common extension point, it should be replaced with an <code>interface</code>. If it was stubbed in as a placeholder for future development it should be fleshed-out. In any other case, it should be eliminated.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Nothing {  // Noncompliant\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic interface Nothing {\n}\n</pre>	2	\N	Classes should not be empty	REMOVED	java	2016-10-11 14:20:57.815	2016-10-12 16:28:40.444	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
26	S1312	S1312	squid	<p>Loggers should:</p>\n<ul>\n<li> <code>private</code>: never be accessible outside of its parent class. If another class needs to log something, it should instantiate its own logger.</li>\n<li> <code>static</code>: not be dependent on an instance of a class (an object). When logging something, contextual information can of course be provided in the messages but the logger should be created at class level to prevent creating a logger along with each object.</li>\n<li> <code>(final|const)</code>: be created once and only once per class.</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic Logger logger = LoggerFactory.getLogger(Foo.class);  \n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nprivate static final Logger LOGGER = LoggerFactory.getLogger(Foo.class);\n</pre>	1	\N	Loggers should be "private static final" and should share a naming convention	REMOVED	java	2016-10-11 14:20:57.873	2016-10-12 16:28:41.502	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
19	S1314	S1314	squid	<p>Integer literals starting with a zero are octal rather than decimal values. While using octal values is fully supported, most developers do not have experience with them. They may not recognize octal values as such, mistaking them instead for decimal values.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nint myNumber = 010;   // myNumber will hold 8, not 10 - was this really expected?\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nint myNumber = 8;\n</pre>\n<h2>See (C/C++ only)</h2>\n\n<ul>\n<li> MISRA C:2004, 7.1 - Octal constants shall not be used</li>\n<li> MISRA C++:2008, 2-13-2</li>\n<li> MISRA C:2012, 7.1 - Octal constants shall not be used</li>\n</ul>	2	\N	Octal values should not be used	REMOVED	java	2016-10-11 14:20:57.858	2016-10-12 16:28:41.505	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
24	S2089	S2089	squid	<p>The fields in an HTTP request are putty in the hands of an attacker, and you cannot rely on them to tell you the truth about anything. While it may be safe to store such values after they have been neutralized, decisions should never be made based on their contents.</p>\n<p>This rule flags uses of the referer header field.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyServlet extends HttpServlet {\n  protected void doPost(HttpServletRequest request, HttpServletResponse response) \n        throws ServletException, IOException {\n    String referer = request.getHeader("referer");  // Noncompliant\n    if(isTrustedReferer(referer)){\n      //..\n    }\n    //...\n  }\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/293">MITRE, CWE-293</a> - Using Referer Field for Authentication</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A2-Broken_Authentication_and_Session_Management">OWASP Top Ten 2013 Category A2</a> - Broken Authentication and Session Management</li>\n</ul>	3	\N	HTTP referers should not be relied on	REMOVED	java	2016-10-11 14:20:57.869	2016-10-12 16:28:41.506	\N	\N	\N	\N	\N	20	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
21	S1317	S1317	squid	<p>Instantiating a <code>StringBuilder</code> or a <code>StringBuffer</code> with a character is misleading because most Java developers would expect the character to be the initial value of the <code>StringBuffer</code>. </p>\n<p>What actually happens is that the int representation of the character is used to determine the initial size of the <code>StringBuffer</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nStringBuffer foo = new StringBuffer('x');   //equivalent to StringBuffer foo = new StringBuffer(120);\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nStringBuffer foo = new StringBuffer("x");\n</pre>	2	\N	"StringBuilder" and "StringBuffer" should not be instantiated with a character	REMOVED	java	2016-10-11 14:20:57.862	2016-10-12 16:28:41.515	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
23	S1319	S1319	squid	<p>The purpose of the Java Collections API is to provide a well defined hierarchy of interfaces in order to hide implementation details.</p>\n<p>Implementing classes must be used to instantiate new collections, but the result of an instantiation should ideally be stored in a variable whose type is a Java Collection interface.</p>\n<p>This rule raises an issue when an implementation class:</p>\n<ul>\n<li> is returned from a <code>public</code> method.</li>\n<li> is accepted as an argument to a <code>public</code> method.</li>\n<li> is exposed as a <code>public</code> member.</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Employees {\n  private HashSet&lt;Employee&gt; employees = new HashSet&lt;Employee&gt;();  // Noncompliant - "employees" should have type "Set" rather than "HashSet"\n\n  public HashSet&lt;Employee&gt; getEmployees() {                       // Noncompliant\n    return employees;\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Employees {\n  private Set&lt;Employee&gt; employees = new HashSet&lt;Employee&gt;();      // Compliant\n\n  public Set&lt;Employee&gt; getEmployees() {                           // Compliant\n    return employees;\n  }\n}\n</pre>	2	\N	Declarations should use Java collection interfaces such as "List" rather than specific implementation classes such as "LinkedList"	REMOVED	java	2016-10-11 14:20:57.866	2016-10-12 16:28:41.518	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
44	S1210	S1210	squid	<p>\nAccording to the Java <code>Comparable.compareTo(T o)</code> documentation:\n</p>\n\n<blockquote>\nIt is strongly recommended, but not strictly required that <code>(x.compareTo(y)==0) == (x.equals(y))</code>.\nGenerally speaking, any class that implements the Comparable interface and violates this condition should clearly indicate this fact.\nThe recommended language is "Note: this class has a natural ordering that is inconsistent with equals."\n</blockquote>\n\n<p>\nIf this rule is violated, weird and unpredictable failures can occur.\nFor example, in Java 5 the <code>PriorityQueue.remove()</code> method relied on <code>compareTo()</code>, but since Java 6 it relies on <code>equals()</code>.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Foo implements Comparable&lt;Foo&gt; {\n  @Override\n  public int compareTo(Foo foo) { /* ... */ }      // Noncompliant as the equals(Object obj) method is not overridden\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Foo implements Comparable&lt;Foo&gt; {\n  @Override\n  public int compareTo(Foo foo) { /* ... */ }      // Compliant\n\n  @Override\n  public boolean equals(Object obj) { /* ... */ }\n}\n</pre>	3	\N	"equals(Object obj)" should be overridden along with the "compareTo(T obj)" method	REMOVED	java	2016-10-11 14:20:57.919	2016-10-12 16:28:40.427	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
45	S1452	S1452	squid	<p>Using a wildcard as a return type implicitly means that the return parameter should be considered as read-only but without any way to enforce this contract. </p>\n<p>Let's take the example of method returning a "List&lt;? extends Animal&gt;". Is it possible on this list to add a Dog, a Cat, ... we simply don't know. The consumer of a method should not have to deal with such disruptive questions. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nList&lt;? extends Animal&gt; getAnimals(){...}\n</pre>	2	\N	Generic wildcard types should not be used in return parameters	REMOVED	java	2016-10-11 14:20:57.921	2016-10-12 16:28:40.428	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
46	S1694	S1694	squid	<p>The purpose of an abstract class is to provide some heritable behaviors while also defining methods which must be implemented by sub-classes.</p>\n\n<p>A class with no abstract methods that was made abstract purely to prevent instantiation should be converted to a concrete class (i.e. remove the <code>abstract</code> keyword) with a private constructor.</p>\n\n<p>A class with only abstract methods and no inheritable behavior should be converted to an interface.</p>\n\n<h2>Noncompliant Code Sample</h2>\n<pre>\npublic abstract class Animal {\n  abstract void move();\n  abstract void feed();\n}\n\npublic abstract class Color {\n  private int red = 0;\n  private int green = 0;\n  private int blue = 0;\n\n  public int getRed(){\n    return red;\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic interface Animal {\n  void move();\n  void feed();\n}\n\npublic class Color {\n  private int red = 0;\n  private int green = 0;\n  private int blue = 0;\n\n  private Color (){\n  }\n\n  public int getRed() {\n    return red;\n  }\n}\n\npublic abstract class Lamp {\n\n  private boolean switchLamp=false;\n  public abstract void glow();\n\n  public void flipSwitch() {\n    switchLamp = !switchLamp;\n    if (switchLamp) {\n       glow();\n    }\n  }\n}\n</pre>	1	\N	An abstract class should have both abstract and concrete methods	REMOVED	java	2016-10-11 14:20:57.923	2016-10-12 16:28:40.429	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
22	S1318	S1318	squid	<p>Inexperienced Java developers might expect the <code>Object.equals(Object obj)</code> method to correctly handle the case where the left hand side is null, but that is not the case.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nif (variable.equals(null)) { /* ... */ }   // Noncompliant - "variable" is really null, a NullPointerException is thrown\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nif (variable == null) { /* ... */ }        // Compliant\n</pre>	3	\N	"object == null" should be used instead of "object.equals(null)"	REMOVED	java	2016-10-11 14:20:57.864	2016-10-12 16:28:41.524	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
36	S1221	S1221	squid	<p>Naming a method <code>hashcode()</code> or <code>equal</code> is either:</p>\n<ul>\n<li> A bug. Overriding <code>Object.hashCode()</code> or <code>Object.equals</code> was meant and the application does not behave as expected.</li>\n<li> Done on purpose. The name however will confuse every other developer, who will think it is a bug.</li>\n</ul>\n<p>In both cases, the method should be renamed.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic int hashcode() { /* ... */ }  // Noncompliant\n\npublic boolean equal(Object obj) { /* ... */ }  // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\n@Override\npublic int hashCode() { /* ... */ }\n\npublic boolean equals(Object obj) { /* ... */ } \n</pre>	3	\N	Methods should not be named "hashcode" or "equal"	REMOVED	java	2016-10-11 14:20:57.898	2016-10-12 16:28:41.563	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
35	S1220	S1220	squid	<p>According to the Java Language Specification:</p>\n\n<blockquote>\nUnnamed packages are provided by the Java platform principally for convenience when developing small or temporary applications or when just beginning development.\n</blockquote>\n\n<p>To enforce this best practice, classes located in default package can no longer be access from named ones since Java 1.4.</p>\n\n<p>The following piece of code:</p>\n\n<pre>\npublic class MyClass { /* ... */ }\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\npackage org.example;\n\npublic class MyClass{ /* ... */ }\n</pre>	1	\N	The default unnamed package should not be used	REMOVED	java	2016-10-11 14:20:57.896	2016-10-12 16:28:41.564	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
34	S2438	S2438	squid	<p>While it is technically correct to use a <code>Thread</code> where a Runnable is called for, the semantics of the two objects are different, and mixing them is a bad practice that will likely lead to headaches in the future.</p>\n\n<p>The crux of the issue is that <code>Thread</code> is a larger concept than <code>Runnable</code>. A <code>Runnable</code> is an object whose running should be managed. A <code>Thread</code> expects to manage the running of itself or other <code>Runnables</code>.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n    public static void main(String[] args) {\n        Thread r =new Thread() {\n            int p;\n            @Override\n            public void run() {\n                while(true)\n                    System.out.println("a");\n            }\n        };\n        new Thread(r).start();  // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\n    public static void main(String[] args) {\n        Runnable r =new Runnable() {\n            int p;\n            @Override\n            public void run() {\n                while(true)\n                    System.out.println("a");\n            }\n        };\n        new Thread(r).start();\n</pre>	3	\N	"Threads" should not be used where "Runnables" are expected	REMOVED	java	2016-10-11 14:20:57.894	2016-10-12 16:28:41.568	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
55	RedundantThrowsDeclarationCheck	RedundantThrowsDeclarationCheck	squid	<p>\nAn exception in a <code>throws</code> declaration in Java is redundant if:\n</p>\n\n<ul>\n  <li>It is listed multiple times</li>\n  <li>It is a subclass of another listed exception</li>\n  <li>It is a <code>RuntimeException</code>, or one of its descendants</li>\n</ul>\n\n<p>\nThe following code:\n</p>\n\n<pre>\nvoid foo() throws MyException, MyException {}  // Non-Compliant - should be listed once\nvoid bar() throws Throwable, Exception {}      // Non-Compliant - Exception is a subclass of Throwable\nvoid baz() throws RuntimeException {}          // Non-Compliant - RuntimeException can always be thrown\n</pre>\n\n<p>\nshould be refactored into:\n</p>\n\n<pre>\nvoid foo() throws MyException {}               // Compliant\nvoid bar() throws Throwable {}                 // Compliant\nvoid baz() {}                                  // Compliant\n</pre>	1	\N	Throws declarations should not be redundant	REMOVED	java	2016-10-11 14:20:57.943	2016-10-12 16:28:40.37	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
50	S1213	S1213	squid	<p>According to the Java Code Conventions as defined by Oracle, the members of a class or interface declaration should appear in the following order in the source files:</p>\n<ul>\n<li> Class and instance variables</li>\n<li> Constructors</li>\n<li> Methods</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Foo{ \n   private int field = 0;\n   public boolean isTrue() {...}     \n   public Foo() {...}                         // Noncompliant, constructor defined after methods\n   public static final int OPEN = 4;  //Noncompliant, variable defined after constructors and methods\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Foo{ \n   public static final int OPEN = 4;\n   private int field = 0;\n   public Foo() {...}\n   public boolean isTrue() {...}\n}\n</pre>	1	\N	The members of an interface declaration or class should appear in a pre-defined order	REMOVED	java	2016-10-11 14:20:57.932	2016-10-12 16:28:40.423	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
51	S1697	S1697	squid	<p>When either the equality operator in a null test or the logical operator that follows it is reversed, the code has the appearance of safely null-testing the object before dereferencing it. Unfortunately the effect is just the opposite - the object is null-tested and then dereferenced <em>only</em> if it is null, leading to a guaranteed null pointer dereference.</p>\n<h2>Compliant Solution</h2>\n\n<pre>\nif (str == null || str.length() == 0) {\n  System.out.println("String is empty");\n}\n\nif (str != null &amp;&amp; str.length() &gt; 0) {\n  System.out.println("String is not empty");\n}\n</pre>	4	\N	Short-circuit logic should be used to prevent null pointer dereferences in conditionals	REMOVED	java	2016-10-11 14:20:57.934	2016-10-12 16:28:40.424	\N	\N	\N	\N	\N	41	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
182	S1170	S1170	squid	<p>Making a constant just <code>final</code> as opposed to <code>static final</code> leads to duplicating its value for every instance of the class, uselessly increasing the amount of memory required to execute the application.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Myclass {\n  public final int THRESHOLD = 3;   \n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Myclass {\n  public static final int THRESHOLD = 3;    // Compliant\n}\n</pre>\n<h2>Exceptions (for Java)</h2>\n\n<p>No issues are reported on final fields of inner classes whose type is not a primitive or a String. Indeed according to the Java specification:</p>\n<blockquote>\n<p>An inner class is a nested class that is not explicitly or implicitly declared static. Inner classes may not declare static initializers (§8.7) or member interfaces. Inner classes may not declare static members, unless they are compile-time constant fields (§15.28).</p>\n</blockquote>	1	\N	Public constants should be declared "static final" rather than merely "final"	REMOVED	java	2016-10-11 14:20:58.213	2016-10-12 16:28:41.603	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
169	S2153	S2153	squid	<p>Boxing is the process of putting a primitive value into an analogous object, such as creating an <code>Integer</code> to hold an <code>int</code> value. Unboxing is the process of retrieving the primitive value from such an object.</p>\n<p>Since the original value is unchanged during boxing and unboxing, there's no point in doing either when not needed. This also applies to autoboxing and auto-unboxing (when Java implicitly handles the primitive/object transition for you).</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void examineInt(int a) { \n  //... \n}\n\npublic void examineInteger(Integer a) { \n  // ...\n}\n\npublic void func() {\n  int i = 0;\n  Integer iger1 = Integer.valueOf(0);\n  double d = 1.0;\n\n  int dIntValue = new Double(d).intValue(); // Noncompliant\n\n  examineInt(new Integer(i).intValue()); // Noncompliant; explicit box/unbox\n  examineInt(Integer.valueOf(i));  // Noncompliant; boxed int will be auto-unboxed\n\n  examineInteger(i); // Compliant; value is boxed but not then unboxed\n  examineInteger(iger1.intValue()); // Noncompliant; unboxed int will be autoboxed\n}\n</pre>	2	\N	Boxing and unboxing should not be immediately reversed	REMOVED	java	2016-10-11 14:20:58.186	2016-10-12 16:28:42.54	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
17	S888	S888	squid	<p>Testing <code>for</code> loop termination using an equality operator (<code>==</code> and <code>!=</code>) is dangerous, because it could set up an infinite loop. Using a relational operator instead casts a wider net, and makes it harder (but not impossible) to accidentally write an infinite loop.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nfor (int i = 1; i != 10; i += 2)  // Noncompliant. Infinite; i goes from 9 straight to 11.\n{\n  //...\n} \n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nfor (int i = 1; i &lt;= 10; i += 2)  // Compliant\n{\n  //...\n} \n</pre>\n<h2>Exceptions</h2>\n\n<p>An equality operator may be used if the loop counter is not modified within the body of the loop and either:</p>\n<ul>\n<li> starts below the ending value and is incremented by 1 on each iteration.</li>\n<li> starts above the ending value and is decremented by 1 on each iteration.</li>\n</ul>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C++:2008, 6-5-2</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/835">MITRE, CWE-835</a> - Loop with Unreachable Exit Condition ('Infinite Loop')</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/EwDJAQ">CERT, MSC21-C</a> - Use robust loop termination conditions</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/GwDJAQ">CERT, MSC21-CPP</a> - Use inequality to terminate a loop whose counter changes by more than one</li>\n</ul>	3	\N	Relational operators should be used in "for" loop termination conditions	REMOVED	java	2016-10-11 14:20:57.852	2016-10-12 16:28:42.558	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
54	EmptyFile	EmptyFile	squid	<p>Files with no lines of code clutter a project and should be removed. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n//package org.foo;\n//\n//public class Bar {}\n</pre>	2	\N	Files should not be empty	REMOVED	java	2016-10-11 14:20:57.941	2016-10-12 16:28:40.36	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
52	S1214	S1214	squid	<p>According to Joshua Bloch, author of "Effective Java":</p>\n\n<blockquote>\n<p>\nThe constant interface pattern is a poor use of interfaces.\n</p>\n\n<p>\nThat a class uses some constants internally is an implementation detail.\nImplementing a constant interface causes this implementation detail to leak into the class's exported API.\nIt is of no consequence to the users of a class that the class implements a constant interface.\nIn fact, it may even confuse them.\nWorse, it represents a commitment:\nif in a future release the class is modified so that it no longer needs to use the constants,\nit still must implement the interface to ensure binary compatibility.\nIf a nonfinal class implements a constant interface,\nall of its subclasses will have their namespaces polluted by the constants in the interface.\n</p>\n</blockquote>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\ninterface Status {                      // Non-Compliant\n   int OPEN = 1;\n   int CLOSED = 2;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\npublic enum Status {                    // Compliant\n  OPEN,\n  CLOSED;\n}\n</pre>\n\n<p>or</p>\n\n<pre>\npublic final class Status {             // Compliant\n   public static final int OPEN = 1;\n   public static final int CLOSED = 2;\n}\n</pre>	1	\N	Constants should not be defined in interfaces	REMOVED	java	2016-10-11 14:20:57.936	2016-10-12 16:28:40.422	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
53	S1698	S1698	squid	<p>Using the equality (<code>==</code>) and inequality (<code>!=</code>) operators to compare two objects does not check to see if they have the same values. Rather it checks to see if both object references point to exactly the same object in memory. The vast majority of the time, this is not what you want to do. Use the .equals() method to compare the values of two objects or to compare a string object to a string literal.</p>\n<h2>Compliant Solution</h2>\n\n<pre>\nString str1 = "blue";\nString str2 = "blue";\nString str3 = str1;\n\nif (str1.equals(str2))\n{\n  System.out.println("they're both 'blue'"); // this prints\n}\n\nif (str1.equals("blue"))\n{\n  System.out.println("they're both 'blue'"); // this prints\n}\n\nif (str1 == str3)\n{\n  System.out.println("they're the same object"); // this still prints, but it's probably not what you meant to do\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/595.html">MITRE, CWE-595</a> - Comparison of Object References Instead of Object Contents</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/wwD1AQ">CERT, EXP03-J</a> - Do not use the equality operators when comparing values of boxed primitives</li>\n</ul>	2	\N	Objects should be compared with "equals()"	REMOVED	java	2016-10-11 14:20:57.939	2016-10-12 16:28:40.422	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
137	S1168	S1168	squid	<p>Returning <code>null</code> instead of an actual array or collection forces callers of the method to explicitly test for nullity, making them more complex and less readable.</p>\n<p>Moreover, in many cases, <code>null</code> is used as a synonym for empty.</p>\n<p>The following code: </p>\n<pre>\npublic static Result[] getResults() {\n  return null;                             // Non-Compliant\n}\n\npublic static void main(String[] args) {\n  Result[] results = getResults();\n  \n  if (results != null) {                   // Nullity test required to prevent NPE\n    for (Result result: results) {\n      /* ... */\n    }\n  }\n}\n</pre>\n<p>should be refactored into:</p>\n<pre>\npublic static Result[] getResults() {\n  return new Result[0];                    // Compliant\n}\n\npublic static void main(String[] args) {\n  for (Result result: getResults()) {\n    /* ... */\n  }\n}\n</pre>\n<p>This rule also applies to collections:</p>\n<pre>\npublic static List&lt;Result&gt; getResults() {\n  return null;                             // Non-Compliant\n}\n</pre>\n<p>should be refactored into:</p>\n<pre>\npublic static List&lt;Result&gt; getResults() {\n  return Collections.emptyList();          // Compliant\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/AgG7AQ">CERT, MSC19-C</a> - For functions that return an array, prefer returning an empty array over a null value</li>\n</ul>	2	\N	Empty arrays and collections should be returned instead of null	REMOVED	java	2016-10-11 14:20:58.118	2016-10-12 16:28:41.611	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
57	LeftCurlyBraceStartLineCheck	LeftCurlyBraceStartLineCheck	squid	<p>Shared coding conventions make it possible to collaborate efficiently. This rule make it mandatory to place the open curly brace at the beginning of a line.</p>\n<p>The following code snippet illustrates this rule:</p>\n<pre>\npublic void myMethod \n{                                               //Compliant\n  if(something)\n  {                                             //Compliant\n    executeTask();\n  } else {                                    //Non-Compliant\n    doSomethingElse();\n  }\n}\n</pre>	1	\N	An open curly brace should be located at the beginning of a line	REMOVED	java	2016-10-11 14:20:57.947	2016-10-12 16:28:40.352	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	\N	f	HTML
56	ObjectFinalizeOverridenCallsSuperFinalizeCheck	ObjectFinalizeOverridenCallsSuperFinalizeCheck	squid	<p>Overriding the <code>Object.finalize()</code> method must be done with caution to dispose some system resources.</p>\n<p>Calling the <code>super.finalize()</code> at the end of this method implementation is highly recommended in case parent implementations must also dispose some system resources.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nprotected void finalize() {   // Noncompliant; no call to super.finalize();\n  releaseSomeResources();\n}\n\nprotected void finalize() {\n  super.finalize();  // Noncompliant; this call should come last\n  releaseSomeResources();\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nprotected void finalize() {\n  releaseSomeResources();\n  super.finalize();    \n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/568.html">MITRE, CWE-568</a> - finalize() Method Without super.finalize()</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/H4cbAQ">CERT, MET12-J</a> - Do not use finalizers</li>\n</ul>	4	\N	super.finalize() should be called at the end of Object.finalize() implementations	REMOVED	java	2016-10-11 14:20:57.945	2016-10-12 16:28:41.546	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
58	ClassVariableVisibilityCheck	ClassVariableVisibilityCheck	squid	<p>Public class variable fields do not respect the encapsulation principle and has three main disadvantages:</p>\n<ul>\n<li> Additional behavior such as validation cannot be added.</li>\n<li> The internal representation is exposed, and cannot be changed afterwards.</li>\n<li> Member values are subject to change from anywhere in the code and may not meet the programmer's assumptions.</li>\n</ul>\n<p>By using private attributes and accessor methods (set and get), unauthorized modifications are prevented.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyClass {\n\n  public static final int SOME_CONSTANT = 0;     // Compliant - constants are not checked\n\n  public String firstName;                       // Non-Compliant\n\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class MyClass {\n\n  public static final int SOME_CONSTANT = 0;     // Compliant - constants are not checked\n\n  private String firstName;                      // Compliant\n\n  public String getFirstName() {\n    return firstName;\n  }\n\n  public void setFirstName(String firstName) {\n    this.firstName = firstName;\n  }\n\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/493.html">MITRE, CWE-493</a> - Critical Public Variable Without Final Modifier</li>\n</ul>	2	\N	Class variable fields should not have public accessibility	REMOVED	java	2016-10-11 14:20:57.949	2016-10-12 16:28:41.55	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
254	S2236	S2236	squid	<p>On a Thread instance, the methods <code>wait(...)</code>, <code>notify()</code> and <code>notifyAll()</code> are available only because all classes in Java extend <code>Object</code> and therefore automatically inherit the methods. But there are two very good reasons to not call these methods on a Thread instance:</p>\n<ul>\n<li> Doing so is really confusing. What is really expected when calling, for instance, the <code>wait(...)</code> method on a Thread? That the execution of the Thread is suspended, or that acquisition of the object monitor is waited for?</li>\n<li> Internally, the JVM relies on these methods to change the state of the Thread (<code>BLOCKED</code>, <code>WAITING</code>, ...), so calling them will corrupt the behavior of the JVM.</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nThread myThread = new Thread(new RunnableJob());\n...\nmyThread.wait(2000);\n</pre>	4	\N	Methods "wait(...)", "notify()" and "notifyAll()" should never be called on Thread instances	REMOVED	java	2016-10-11 14:20:58.36	2016-10-12 16:28:42.568	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
228	S1149	S1149	squid	<p>\nEarly classes of the Java API, such as <code>Vector</code>, <code>Hashtable</code> and <code>StringBuffer</code>, were synchronized to make them thread-safe.\nUnfortunately, synchronization has a big negative impact on performance, even when using these collections from a single thread.\n</p>\n\n<p>It is better to use their new unsynchronized replacements:</p>\n\n<ul>\n  <li><code>ArrayList</code> or <code>LinkedList</code> instead of <code>Vector</code></li>\n  <li><code>Deque</code> instead of <code>Stack</code></li>\n  <li><code>HashMap</code> instead of <code>Hashtable</code></li>\n  <li><code>StringBuilder</code> instead of <code>StringBuffer</code></li>\n</ul>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nVector cats = new Vector();\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\nArrayList cats = new ArrayList(); \n</pre>\n\n<h2>Exceptions</h2>\n\n<p>Use of those synchronized classes is allowed in method signatures when overriding an existing method.</p>\n\n<pre>\n@Override\npublic Vector getCats() {...} \n</pre>	2	\N	Synchronized classes Vector, Hashtable, Stack and StringBuffer should not be used	REMOVED	java	2016-10-11 14:20:58.306	2016-10-12 16:28:42.571	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
242	S2232	S2232	squid	<p>There are several reasons to avoid <code>ResultSet.isLast()</code>. First, support for this method is optional for <code>TYPE_FORWARD_ONLY</code> result sets. Second, it can be expensive (the driver may need to fetch the next row to answer the question). Finally, the specification is not clear on what should be returned when the <code>ResultSet</code> is empty, so some drivers may return the opposite of what is expected.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nstmt.executeQuery("SELECT name, address FROM PERSON");\nResultSet rs = stmt.getResultSet();\nwhile (! rs.isLast()) { // Noncompliant\n// process row\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nResultSet rs = stmt.executeQuery("SELECT name, address FROM PERSON");\nwhile (! rs.next()) {\n// process row\n}\n</pre>	3	\N	"ResultSet.isLast()" should not be used	REMOVED	java	2016-10-11 14:20:58.335	2016-10-12 16:28:42.573	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
59	RightCurlyBraceDifferentLineAsNextBlockCheck	RightCurlyBraceDifferentLineAsNextBlockCheck	squid	<p>Shared coding conventions make it possible for a team to collaborate efficiently.</p>\n<p>This rule makes it mandatory to place a closing curly brace and the next <code>else</code>, <code>catch</code> or <code>finally</code> keyword on two different lines.</p>\n<p>The following code snippet illustrates this rule:</p>\n<pre>\npublic void myMethod() {\n  if(something) {\n    executeTask();\n  } else if (somethingElse) {          // Non-Compliant\n    doSomethingElse();\n  }\n  else {                               // Compliant\n     generateError();\n  }\n\n  try {\n    generateOrder();\n  } catch (Exception e) {              // Non-Compliant\n    log(e);\n  }\n  finally {                            // Compliant\n    closeConnection();\n  }\n}\n</pre>	1	\N	Close curly brace and the next "else", "catch" and "finally" keywords should be on two different lines	REMOVED	java	2016-10-11 14:20:57.951	2016-10-12 16:28:40.396	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	\N	f	HTML
60	S2055	S2055	squid	<p>When a <code>Serializable</code> object has a non-serializable ancestor in its inheritance chain, object deserialization (re-instantiating the object from file) starts at the first non-serializable class, and proceeds down the chain, adding the properties of each subsequent child class, until the final object has been instantiated.</p>\n\n<p>In order to create the non-serializable ancestor, its no-argument constructor is called. Therefore the non-serializable ancestor of a <code>Serializable</code> class must have a no-arg constructor. Otherwise the class is <code>Serializable</code> but not deserializable.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Fruit {\n  private Season ripe;\n\n  public Fruit (Season ripe) {...}\n  public void setRipe(Season ripe) {...}\n  public Season getRipe() {...}\n}\n\npublic class Raspberry extends Fruit \n        implements Serializable {  // Noncompliant; nonserializable ancestor doesn't have no-arg constructor\n  private static final long serialVersionUID = 1;\n\n  private String variety;\n\n  public Raspberry(Season ripe, String variety) { ...}\n  public void setVariety(String variety) {...}\n  public String getVarity() {...}\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Fruit {\n  private Season ripe;\n\n  public Fruit () {...};  // Compliant; no-arg constructor added to ancestor\n  public Fruit (Season ripe) {...}\n  public void setRipe(Season ripe) {...}\n  public Season getRipe() {...}\n}\n\npublic class Raspberry extends Fruit \n        implements Serializable {\n  private static final long serialVersionUID = 1;\n\n  private String variety;\n\n  public Raspberry(Season ripe, String variety) {...}\n  public void setVariety(String variety) {...}\n  public String getVarity() {...}\n}\n</pre>	3	\N	The non-serializable super class of a "Serializable" class must have a no-argument constructor	REMOVED	java	2016-10-11 14:20:57.953	2016-10-12 16:28:40.406	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
246	S1145	S1145	squid	<p><code>if</code> statements with conditions that are always false have the effect of making blocks of code non-functional. <code>if</code> statements with conditions that are always true are completely redundant, and make the code less readable.</p>\n<p>There are three possible causes for the presence of such code: </p>\n<ul>\n<li> An if statement was changed during debugging and that debug code has been committed.</li>\n<li> Some value was left unset.</li>\n<li> Some logic is not doing what the programmer thought it did.</li>\n</ul>\n<p>In any of these cases, unconditional <code>if</code> statements should be removed.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif (true) {  \n  doSomething(); \n}\n...\nif (false) {  \n  doSomethingElse(); \n}\n\nif (2 &lt; 3 ) { ... }  // Noncompliant; always false\n\nint i = 0;\nint j = 0;\n// ...\nj = foo();\n\nif (j &gt; 0 &amp;&amp; i &gt; 0) { ... }  // Noncompliant; always false - i never set after initialization\n\nboolean b = true;\n//...\nif (b || !b) { ... }  // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\ndoSomething(); \n...\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/489.html">MITRE, CWE-489</a> - Leftover Debug Code</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/570.html">MITRE, CWE-570</a> - Expression is Always False</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/571.html">MITRE, CWE-571</a> - Expression is Always True</li>\n<li> MISRA C:2004, 13.7</li>\n<li> MISRA C:2012, 14.3</li>\n</ul>	2	\N	"if" statement conditions should not unconditionally evaluate to "true" or to "false"	REMOVED	java	2016-10-11 14:20:58.344	2016-10-12 16:28:42.577	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
236	S881	S881	squid	<p>The use of increment and decrement operators in combination with other arithmetic operators is not recommended, because:</p>\n<p>It can significantly impair the readability of the code.</p>\n<p>It introduces additional side effects into a statement, with the potential for undefined behavior.</p>\n<p>It is safer to use these operators in isolation from any other arithmetic operators.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nu8a = ++u8b + u8c--; \nfoo = bar++ / 4;\n</pre>\n<h2>Compliant Solution</h2>\n\n<p>The following sequence is clearer and therefore safer:</p>\n<pre>\n++u8b;    \nu8a = u8b + u8c; \nu8c--; \nfoo = bar / 4;\nbar++;\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 12.1</li>\n<li> MISRA C:2004, 12.13</li>\n<li> MISRA C:2004, 13.3</li>\n<li> MISRA C++:2008, 5-2-10</li>\n<li> MISRA C:2012, 12.1</li>\n<li> MISRA C:2012, 13.3</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/ZwE">CERT, EXP30-C</a> - \tDo not depend on the order of evaluation for side effects</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/fYAyAQ">CERT, EXP30-CPP</a> - Do not depend on order of evaluation between sequence points</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/yQC7AQ">CERT, EXP05-J</a> - Do not follow a write by a subsequent write or read of the same object within an expression</li>\n</ul>	2	\N	Increment (++) and decrement (--) operators should not be mixed with other operators in an expression	REMOVED	java	2016-10-11 14:20:58.322	2016-10-12 16:28:42.582	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
148	S2123	S2123	squid	<p>A value that is incremented or decremented and then not stored is at best wasted code and at worst a bug.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic int pickNumber() {\n  int i = 0;\n  int j = 0;\n\n  i = i++; // Noncompliant; i is still zero\n\n  return j++; // Noncompliant; 0 returned\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic int pickNumber() {\n  int i = 0;\n  int j = 0;\n\n  i++; \n  return ++j; \n}\n</pre>	3	\N	Values should not be uselessly incremented	REMOVED	java	2016-10-11 14:20:58.145	2016-10-12 16:28:42.598	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
64	S2057	S2057	squid	<p>A <code>serialVersionUID</code> field is required in all <code>Serializable</code> classes. If you do not provide one, one will be calculated for you by the compiler. The danger in not explicitly choosing the value is that when the class changes, the compiler will generate an entirely new id, and you will be suddenly unable to deserialize (read from file) objects that were serialized with the previous version of the class.</p>\n\n<p><code>serialVersionUID</code>'s should be declared with all of these modifiers: <code>static final long</code>.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Raspberry extends Fruit  // Noncompliant; no serialVersionUID. \n        implements Serializable {\n  private String variety;\n\n  public Raspberry(Season ripe, String variety) { ...}\n  public void setVariety(String variety) {...}\n  public String getVarity() {...}\n}\n\npublic class Raspberry extends Fruit\n        implements Serializable {\n  private final int serialVersionUID = 1; // Noncompliant; not static &amp; int rather than long\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Raspberry extends Fruit\n        implements Serializable {\n  private static final long serialVersionUID = 1;\n  private String variety;\n\n  public Raspberry(Season ripe, String variety) { ...}\n  public void setVariety(String variety) {...}\n  public String getVarity() {...}\n}\n</pre>\n\n<h2>Exceptions</h2>\nSwing and AWT classes, <code>abstract</code> classes, <code>Throwable</code> and its subclasses (<code>Exception</code>s and <code>Error</code>s), and classes marked with <code>@SuppressWarnings("serial")</code> are ignored.	2	\N	"Serializable" classes should have a version id	REMOVED	java	2016-10-11 14:20:57.96	2016-10-12 16:28:40.35	\N	\N	\N	\N	\N	35	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
65	S2059	S2059	squid	<p>Serializing a non-<code>static</code> inner class will result in an attempt at serializing the outer class as well. If the outer class is actually serializable, then the serialization will succeed but possibly write out far more data than was intended.</p>\n\n<p>Making the inner class <code>static</code> (i.e. "nested") avoids this problem, therefore inner classes should be <code>static</code> if possible. However, you should be aware that there are semantic differences between an inner class and a nested one: \n<ul>\n  <li>an inner class can only be instantiated within the context of an instance of the outer class.</li>\n  <li>a nested (<code>static</code>) class can be instantiated independently of the outer class.</li>\n</ul>\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Raspberry implements Serializable {\n  // ...\n\n  public class Drupelet implements Serializable {  // Noncompliant; output may be too large\n    // ...\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Raspberry implements Serializable {\n  // ...\n\n  public static class Drupelet implements Serializable {\n    // ...\n  }\n}\n</pre>	2	\N	"Serializable" inner classes of "Serializable" classes should be static	REMOVED	java	2016-10-11 14:20:57.962	2016-10-12 16:28:40.353	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
77	UnusedProtectedMethod	UnusedProtectedMethod	squid	<p>Protected methods that are never used by any of the classes in the same project are suspected to be dead code. Dead code is unnecessary, inoperative code that should be removed. Removing dead code makes maintenance easier by decreasing the size of the maintained code base, thereby making it easier to understand the program and preventing the introduction of bugs.</p>\n<p>Unused protected methods are not considered dead code in the following cases:</p>\n<ul>\n<li> Protected methods which override a parent class method.</li>\n<li> Protected methods of an abstract class.</li>\n</ul>	2	\N	Unused protected methods should be removed	REMOVED	java	2016-10-11 14:20:57.991	2016-10-12 16:28:41.514	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
66	S1643	S1643	squid	<p>Strings are immutable objects in Java, so concatenation doesn't simply add the new String to the end of the existing string. Instead, in each loop iteration, the first String is converted to an intermediate object type, the second string is appended, and then the intermediate object is converted back to a String. Further, performance of these intermediate operations degrades as the String gets longer. Therefore, the use of StringBuilder is preferred.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nString str = "";\nfor (int i = 0; i < arrayOfStrings.length ; ++i) {\n  str = str + arrayOfStrings[i];\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nStringBuilder bld = new StringBuilder();\nfor (int i = 0; i < arrayOfStrings.length; ++i) {\n  bld.append(arrayOfStrings[i]);\n}\nString str = bld.toString();\n</pre>	2	\N	Strings should not be concatenated using '+' in a loop	REMOVED	java	2016-10-11 14:20:57.965	2016-10-12 16:28:40.346	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
67	S1764	S1764	squid	<p>Using the same value on either side of a binary operator is almost always a mistake. In the case of logical operators, it is either a copy/paste error and therefore a bug, or it is simply wasted code, and should be simplified. In the case of bitwise operators and most binary mathematical operators, having the same value on both sides of an operator yields predictable results, and should be simplified.</p>\n<p>This rule ignores <code>*</code>, <code>+</code>, and <code>=</code>. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif ( a == a ) { // always true\n  doZ();\n}\nif ( a != a ) { // always false\n  doY();\n}\nif ( a == b &amp;&amp; a == b ) { // if the first one is true, the second one is too\n  doX();\n}\nif ( a == b || a == b ) { // if the first one is true, the second one is too\n  doW();\n}\n\nint j = 5 / 5; //always 1\nint k = 5 - 5; //always 0\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\ndoZ();\n\nif ( a == b ) {\n  doX();\n}\nif ( a == b ) {\n  doW();\n}\n\nint j = 1;\nint k = 0;\n</pre>\n<h2>Exceptions</h2>\n\n<p>The specific case of testing a floating point value against itself is a valid test for <code>NaN</code> and is therefore ignored.</p>\n<p>Similarly, left-shifting 1 onto 1 is common in the construction of bit masks, and is ignored.</p>\n<pre>\nfloat f;\nif(f != f) { //test for NaN value\n  System.out.println("f is NaN");\n}\n\nint i = 1 &lt;&lt; 1; // Compliant\nint j = a &lt;&lt; a; // Noncompliant\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/NYA5">CERT, MSC12-C</a> - Detect and remove code that has no effect</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/SIIyAQ">CERT, MSC12-CPP</a> - Detect and remove code that has no effect</li>\n<li> Rule S1656 - Implements a check on <code>=</code>. </li>\n</ul>	3	\N	Identical expressions should not be used on both sides of a binary operator	REMOVED	java	2016-10-11 14:20:57.967	2016-10-12 16:28:40.348	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
76	S2162	S2162	squid	<p>A key facet of the <code>equals</code> contract is that if <code>a.equals(b)</code> then <code>b.equals(a)</code>, i.e. that the relationship is symmetric. </p>\n<p>Using <code>instanceof</code> breaks the contract when there are subclasses, because while the child is an <code>instanceof</code> the parent, the parent is not an <code>intanceof</code> the child. For instance, assume that <code>Raspberry extends Fruit</code> and adds some fields (requiring a new implementation of <code>equals</code>):</p>\n<pre>\nFruit fruit = new Fruit();\nRaspberry raspberry = new Raspberry();\n\nif (raspberry instanceof Fruit) { ... } // true\nif (fruit instanceof Raspberry) { ... } // false\n</pre>\n<p>If similar <code>instanceof</code> checks were used in the classes' <code>equals</code> methods, the symmetry principle would be broken:</p>\n<pre>\nraspberry.equals(fruit); // false\nfruit.equals(raspberry); //true\n</pre>\n<p>Additionally, non <code>final</code> classes shouldn't use a hardcoded class name in the <code>equals</code> method because doing so breaks the method for subclasses. Instead, make the comparison dynamic.</p>\n<p>Further, comparing to an unrelated class type breaks the contract for that unrelated type, because while <code>thisClass.equals(unrelatedClass)</code> can return true, <code>unrelatedClass.equals(thisClass)</code> will not.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Fruit extends Food {\n  private Season ripe;\n\n  public boolean equals(Object obj) {\n    if (obj == this) {\n      return true;\n    }\n    if (Fruit.class == obj.getClass()) { // Noncompliant; broken for child classes\n      return ripe.equals(((Fruit)obj).getRipe());\n    }\n    if (obj instanceof Fruit ) {  // Noncompliant; broken for child classes\n      return ripe.equals(((Fruit)obj).getRipe());\n    }\n    else if (obj instanceof Season) { // Noncompliant; symmetry broken for Season class\n      // ...\n    }\n    //...\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Fruit extends Food {\n  private Season ripe;\n\n  public boolean equals(Object obj) {\n    if (obj == this) {\n      return true;\n    }\n    if (this.getClass() == obj.getClass()) {\n      return ripe.equals(((Fruit)obj).getRipe());\n    }\n    return false;\n}\n</pre>	3	\N	"equals" methods should be symmetric and work for subclasses	REMOVED	java	2016-10-11 14:20:57.989	2016-10-12 16:28:40.38	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
71	S1193	S1193	squid	<p>\nMultiple catch blocks of the appropriate type should be used instead of catching a general exception, and then testing on the type.\n</p>\n\n<p>For example, following code:</p>\n\n<pre>\ntry {\n  /* ... */\n} catch (Exception e) {\n  if(e instanceof IOException) { /* ... */ }         // Non-Compliant\n  if(e instanceof NullPointerException{ /* ... */ }  // Non-Compliant\n}\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\ntry {\n  /* ... */\n} catch (IOException e) { /* ... */ }                // Compliant\n} catch (NullPointerException e) { /* ... */ }       // Compliant\n</pre>	2	\N	Exception types should not be tested using "instanceof" in catch blocks	REMOVED	java	2016-10-11 14:20:57.978	2016-10-12 16:28:40.391	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
70	S1192	S1192	squid	<p>Duplicated string literals make the process of refactoring error-prone, since you must be sure to update all occurrences.</p>\n<p>On the other hand, constants can be referenced from many places, but only need to be updated in a single place.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void run() {\n  prepare("action1");                              // Non-Compliant - "action1" is duplicated 3 times\n  execute("action1");\n  release("action1");\n}\n\n@SuppressWarning("all")                            // Compliant - annotations are excluded\nprivate void method1() { /* ... */ }\n@SuppressWarning("all")\nprivate void method2() { /* ... */ }\n\npublic String method3(String a) {\n  System.out.println("'" + a + "'");               // Compliant - literal "'" has less than 5 characters and is excluded\n  return "";                                       // Compliant - literal "" has less than 5 characters and is excluded\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nprivate static final String ACTION_1 = "action1";  // Compliant\n\npublic void run() {\n  prepare(ACTION_1);                               // Compliant\n  execute(ACTION_1);\n  release(ACTION_1);\n}\n</pre>\n<h2>Exceptions</h2>\n\n<p>To prevent generating some false-positives, literals having less than 5 characters are excluded.</p>	1	\N	String literals should not be duplicated	REMOVED	java	2016-10-11 14:20:57.974	2016-10-12 16:28:40.392	\N	\N	\N	\N	\N	39	\N	LINEAR_OFFSET	\N	2min	\N	2min	\N	\N	\N	f	HTML
74	CommentedOutCodeLine	CommentedOutCodeLine	squid	<p>Programmers should not comment out code as it bloats programs and reduces readability.</p>\n<p>Unused code should be deleted and can be retrieved from source control history if required.</p>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 2.4 - Sections of code should not be "commented out".</li>\n<li> MISRA C++:2008, 2-7-2 - Sections of code shall not be "commented out" using C-style comments.</li>\n<li> MISRA C++:2008, 2-7-3 - Sections of code should not be "commented out" using C++ comments.</li>\n<li> MISRA C:2012, Dir. 4.4 - Sections of code should not be "commented out"</li>\n</ul>	2	\N	Sections of code should not be "commented out"	REMOVED	java	2016-10-11 14:20:57.984	2016-10-12 16:28:41.516	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
75	S1195	S1195	squid	<p>According to the Java Language Specification: </p>\n<blockquote>\n<p>For compatibility with older versions of the Java SE platform,</p>\n<p>the declaration of a method that returns an array is allowed to place (some or all of) the empty bracket pairs that form the declaration of the array type after the formal parameter list.</p>\n<p>This obsolescent syntax should not be used in new code.</p>\n</blockquote>\n<p>The following code snippet illustrates this rule:</p>\n<pre>\npublic int getVector()[] { /* ... */ }    // Non-Compliant\n\npublic int[] getVector() { /* ... */ }    // Compliant\n\npublic int[] getMatrix()[] { /* ... */ }  // Non-Compliant\n\npublic int[][] getMatrix() { /* ... */ }  // Compliant\n</pre>	1	\N	Array designators "[]" should be located after the type in method signatures	REMOVED	java	2016-10-11 14:20:57.986	2016-10-12 16:28:40.379	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
73	S1194	S1194	squid	<p><code>java.lang.Error</code> and its subclasses represent abnormal conditions, such as <code>OutOfMemoryError</code>, which should only be encountered by the Java Virtual Machine.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyException extends Error { /* ... */ }       // Non-Compliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class MyException extends Exception { /* ... */ }   // Compliant\n</pre>	2	\N	"java.lang.Error" should not be extended	REMOVED	java	2016-10-11 14:20:57.982	2016-10-12 16:28:40.382	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
72	S2160	S2160	squid	<p>Extend a class that overrides <code>equals</code> and add fields without overriding <code>equals</code> in the subclass, and you run the risk of non-equivalent instances of your subclass being seen as equal, because only the superclass fields will be considered in the equality test.</p>\n\n<p>This rule looks for classes that do all of the following:</p>\n<ul>\n    <li>extend classes that override <code>equals</code>.</li>\n    <li>do not themselves override <code>equals</code>.</li>\n    <li>add fields.</li>\n</ul>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Fruit {\n  private Season ripe;\n\n  public boolean equals(Object obj) {\n    if (obj == this) {\n      return true;\n    }\n    if (this.class != obj.class) {\n      return false;\n    }\n    Fruit fobj = (Fruit) obj;\n    if (ripe.equals(fobj.getRipe()) {\n      return true;\n    }\n    return false;\n  }\n}\n\npublic class Raspberry extends Fruit {  // Noncompliant; instances will use Fruit's equals method\n  private Color ripeColor;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Fruit {\n  private Season ripe;\n\n  public boolean equals(Object obj) {\n    if (obj == this) {\n      return true;\n    }\n    if (this.class != obj.class) {\n      return false;\n    }\n    Fruit fobj = (Fruit) obj;\n    if (ripe.equals(fobj.getRipe()) {\n      return true;\n    }\n    return false;\n  }\n}\n\npublic class Raspberry extends Fruit {\n  private Color ripeColor;\n\n  public boolean equals(Object obj) {\n    if (! super.equals(obj)) {\n      return false;\n    }\n    Raspberry fobj = (Raspberry) obj;\n    if (ripeColor.equals(fobj.getRipeColor()) {  // added fields are tested\n      return true;\n    }\n    return false;\n  }\n}\n</pre>	2	\N	Subclasses that add fields should override "equals"	REMOVED	java	2016-10-11 14:20:57.98	2016-10-12 16:28:40.393	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
211	S1479	S1479	squid	<p>When <code>switch</code> statements have a large set of <code>case</code> clauses, it is usually an attempt to map two sets of data. A real map structure would be more readable and maintainable, and should be used instead.</p>	2	\N	"switch" statements should not have too many "case" clauses	REMOVED	java	2016-10-11 14:20:58.271	2016-10-12 16:28:41.581	\N	\N	\N	\N	\N	35	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
78	S2165	S2165	squid	<p>There is no point in setting class fields to <code>null</code> in a finalizer. If this this is a hint to the garbage collector, it is unnecessary - the object will be garbage collected anyway - and doing so may actually cause extra work for the garbage collector.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Foo {\n  private String name;\n\n  @Override\n  void finalize() {\n    name = null;  // Noncompliant; completely unnecessary\n</pre>	2	\N	"finalize" should not set fields to "null"	REMOVED	java	2016-10-11 14:20:57.994	2016-10-12 16:28:40.383	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
79	S1197	S1197	squid	<p>\nArray designators should always be located on the type for better code readability.\nOtherwise, developers must look both at the type and the variable name to know whether or not a variable is an array.\n</p>\n\n<p>The following code snippet illustrates this rule:</p>\n\n<pre>\nint matrix[][];   // Non-Compliant\nint[] matrix[];   // Non-Compliant\nint[][] matrix;   // Compliant\n</pre>	1	\N	Array designators "[]" should be on the type, not the variable	REMOVED	java	2016-10-11 14:20:57.996	2016-10-12 16:28:40.384	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
80	S2164	S2164	squid	For small numbers, <code>float</code> math has enough precision to yield the expected value, but for larger numbers, it does not. <code>BigDecimal</code> is the best alternative, but if a primitive is required, use a <code>double</code>.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nfloat a = 16777216.0f;\nfloat b = 1.0f;\nfloat c = a + b; // Noncompliant; yields 1.6777216E7 not 1.6777217E7\n\ndouble d = a + b; // Noncompliant; addition is still between 2 floats\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nfloat a = 16777216.0f;\nfloat b = 1.0f;\nBigDecimal c = BigDecimal.valueOf(a).add(BigDecimal.valueOf(b));\n\ndouble d = (double)a + (double)b;\n</pre>	3	\N	Math should not be performed on floats	REMOVED	java	2016-10-11 14:20:57.998	2016-10-12 16:28:40.388	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
81	S2167	S2167	squid	<p>It is the sign, rather than the magnitude of the value returned from <code>compareTo</code> that matters. Returning <code>Integer.MIN_VALUE</code> does not convey a higher degree of inequality, and doing so can cause errors because the return value of <code>compareTo</code> is sometimes inversed, with the expectation that negative values become positive. However, inversing <code>Integer.MIN_VALUE</code> yields <code>Integer.MIN_VALUE</code> rather than <code>Integer.MAX_VALUE</code>.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic int compareTo(MyClass) {\n  if (condition) {\n    return Integer.MIN_VALUE;  // Noncompliant\n  }\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic int compareTo(MyClass) {\n  if (condition) {\n    return -1;\n  }\n</pre>	3	\N	"compareTo" should not return "Integer.MIN_VALUE"	REMOVED	java	2016-10-11 14:20:58	2016-10-12 16:28:40.411	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
90	S1309	S1309	squid	<p>This rule allows you to track the usage of the <code>@SuppressWarnings</code> mechanism.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>In case "listOfWarnings=unused" :</p>\n<pre>\n@SuppressWarnings("unused")\n</pre>\n<h2>Compliant Solution</h2>\n\n<p>In case "listOfWarnings=all" (default value) :</p>\n<pre>\n@SuppressWarnings("unchecked")\n@SuppressWarnings("unused")\n</pre>	0	\N	The @SuppressWarnings annotation should not be used	REMOVED	java	2016-10-11 14:20:58.018	2016-10-12 16:28:40.439	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
82	S1199	S1199	squid	<p>Nested code blocks can be used to create a new scope and restrict the visibility of the variables defined inside it. Using this feature in a method typically indicates that the method has too many responsibilities, and should be refactored into smaller methods.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void evaluate(int operator) {\n  switch (operator) {\n    /* ... */\n    case ADD: {                                // Non-Compliant - nested code block '{' ... '}'\n        int a = stack.pop();\n        int b = stack.pop();\n        int result = a + b;\n        stack.push(result);\n        break;\n      }\n    /* ... */\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void evaluate(int operator) {\n  switch (operator) {\n    /* ... */\n    case ADD:                                  // Compliant\n      evaluateAdd();\n      break;\n    /* ... */\n  }\n}\n\nprivate void evaluateAdd() {\n  int a = stack.pop();\n  int b = stack.pop();\n  int result = a + b;\n  stack.push(result);\n}\n</pre>	2	\N	Nested code blocks should not be used	REMOVED	java	2016-10-11 14:20:58.001	2016-10-12 16:28:40.412	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
83	S2166	S2166	squid	Clear, communicative naming is important in code. It helps maintainers and API users understand the intentions for and uses of a unit of code. Using "exception" in the name of a class that does not extend <code>Exception</code> or one of its subclasses is a clear violation of the expectation that a class' name will indicate what it is and/or does.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class FruitException {  // Noncompliant; this has nothing to do with Exception\n  private Fruit expected;\n  private String unusualCharacteristics;\n  private boolean appropriateForCommercialExploitation;\n  // ...\n}\n\npublic class CarException {  // Noncompliant; the extends clause was forgotten?\n  public CarException(String message, Throwable cause) {\n  // ...\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class FruitSport {\n  private Fruit expected;\n  private String unusualCharacteristics;\n  private boolean appropriateForCommercialExploitation;\n  // ...\n}\n\npublic class CarException extends Exception {\n  public CarException(String message, Throwable cause) {\n  // ...\n</pre>	2	\N	Classes named like "Exception" should extend "Exception" or a subclass	REMOVED	java	2016-10-11 14:20:58.003	2016-10-12 16:28:40.413	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
256	S00120	S00120	squid	<p>Shared coding conventions allow teams to collaborate efficiently. This rule checks that all package names match a provided regular expression.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npackage org.exAmple; // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npackage org.example; \n</pre>	1	\N	Package names should comply with a naming convention	REMOVED	java	2016-10-11 14:20:58.364	2016-10-12 16:28:42.56	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
93	S2197	S2197	squid	When the modulus of a negative number is calculated, the result will either be negative or zero. Thus, comparing the modulus of a variable for equality with a positive number (or a negative one) could result in false negatives. \n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic boolean isOdd(int x) {\n  return x % 2 == 1;  // Noncompliant; if x is negative, x % 2 == -1\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic boolean isOdd(int x) {\n  return x %2 != 0;\n}\n</pre>\n\nor\n\n<pre>\npublic boolean isOdd(int x) {\n  return Math.abs(x %2) != 1;\n}\n</pre>	3	\N	Modulus results should not be checked for direct equality	REMOVED	java	2016-10-11 14:20:58.026	2016-10-12 16:28:40.363	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
86	S1873	S1873	squid	<p>Public arrays, even ones declared <code>static final</code> can have their contents edited by malicious programs. The <code>final</code> keyword on an array declaration means that the array object itself may only be assigned once, but its contents are still mutable. Therefore making arrays <code>public</code> is a security risk.</p>\n<p>Instead, arrays should be private and accessed through methods.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Estate {\n  // Noncompliant; array contents can be modified\n  public static final String [] HEIRS = new String [] { \n    "Betty", "Suzy" };\n}\n\npublic class Malicious {\n  public void changeWill() {\n    Estate.HEIRS[0] = "Biff";\n    if (Estate.HEIRS.length &gt; 1) {\n      for (int i = 1; i &lt; Estate.HEIRS.length; i++) {\n        Estate.HEIRS[i] = "";\n      }\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Estate {\n  private static final String [] HEIRS = new String [] { \n    "Betty", "Suzy" };\n\n  public String [] getHeirs() {\n    // return copy of HEIRS\n  }\n}\n\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/582.html">MITRE, CWE-582</a> - Array Declared Public, Final, and Static</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/607.html">MITRE, CWE-607</a> - Public Static Final Field References Mutable Object</li>\n</ul>	3	\N	"static final" arrays should be "private"	REMOVED	java	2016-10-11 14:20:58.01	2016-10-12 16:28:40.409	\N	\N	\N	\N	\N	18	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
87	S1994	S1994	squid	<p>It is almost always an error when a <code>for</code> loop's stop condition and incrementer don't act on the same variable. Even when it is not, it could confuse future maintainers of the code, and should be avoided.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nfor (i = 0; i < 10; j++) {  // Noncompliant\n  // ...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nfor (i = 0; i < 10; i++) {\n  // ...\n}\n</pre>	3	\N	"for" loop incrementers should modify the variable being tested in the loop's stop condition	REMOVED	java	2016-10-11 14:20:58.012	2016-10-12 16:28:40.41	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
89	EmptyStatementUsageCheck	EmptyStatementUsageCheck	squid	<p>Empty statements, i.e. <code>;</code>, are usually introduced by mistake, for example because:</p>\n<ul>\n<li> It was meant to be replaced by an actual statement, but this was forgotten.</li>\n<li> There was a typo which lead the semicolon to be doubled, i.e. <code>;;</code>.</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n<pre>\nvoid doSomething() {\n  ;                                                       // Non-Compliant - was used as a kind of TODO marker\n}\n\nvoid doSomethingElse() {\n  System.out.println("Hello, world!");;                     // Non-Compliant - double ;\n  ...\n  for (int i = 0; i &lt; 3; System.out.println(i), i++);       // Non-Compliant - Rarely, they are used on purpose as the body of a loop. It is a bad practice to have side-effects outside of the loop body\n  ...\n}\n</pre>\n<h2>Compliant Solution</h2>\n<pre>\nvoid doSomething() {}\n\nvoid doSomethingElse() {\n  System.out.println("Hello, world!");\n  ...\n  for (int i = 0; i &lt; 3; i++){\n    System.out.println(i);\n  }\n  ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 14.3 - Before preprocessing, a null statement shall only occur on a line by itself; it may be followed by a comment provided that the first character following the null statement is a white-space character.</li>\n<li> MISRA C++:2008, 6-2-3 - Before preprocessing, a null statement shall only occur on a line by itself; it may be followed by a comment, provided that the first character following the null statement is a white-space character.</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/NYA5">CERT, MSC12-C</a> - Detect and remove code that has no effect</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/SIIyAQ">CERT, MSC12-CPP</a> - Detect and remove code that has no effect</li>\n</ul>	1	\N	Empty statements should be removed	REMOVED	java	2016-10-11 14:20:58.016	2016-10-12 16:28:40.359	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
88	S2070	S2070	squid	<p>The MD5 algorithm and its successor, SHA-1, are no longer considered secure, because it is too easy to create hash collisions with them. That is, it takes too little computational effort to come up with a different input that produces the same MD5 or SHA-1 hash, and using the new, same-hash value gives an attacker the same access as if he had the originally-hashed value. This applies as well to the other Message-Digest algorithms: MD2, MD4, MD6.</p>\n<p>This rule tracks usage of the <code>java.security.MessageDigest</code>, and <code>org.apache.commons.codec.digest.DigestUtils</code> classes  to instantiate MD or SHA-1 algorithms, and of Guava's <code>com.google.common.hash.Hashing sha1</code> and <code>md5</code> methods. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nMessageDigest md = MessageDigest.getInstance("SHA1");  // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nMessageDigest md = MessageDigest.getInstance("SHA-256");\n</pre>\n<p>or</p>\n<pre>\nCipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/328">MITRE, CWE-328</a> - Reversible One-Way Hash</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/327">MITRE, CWE-327</a> - Use of a Broken or Risky Cryptographic Algorithm</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure</li>\n<li> <a href="http://www.sans.org/top25-software-errors/">SANS Top 25</a> - Porous Defenses</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#WEAK_MESSAGE_DIGEST">MessageDigest Is Weak</a></li>\n</ul>	3	\N	SHA-1 and Message-Digest hash algorithms should not be used	REMOVED	java	2016-10-11 14:20:58.014	2016-10-12 16:28:40.367	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
91	S2077	S2077	squid	<p>Applications that execute SQL commands should neutralize any externally-provided values used in those commands. Failure to do so could allow an attacker to include input that changes the query so that unintended commands are executed, or sensitive data is exposed.</p>\n<p>This rule checks that method parameters are not used directly in non-Hibernate SQL statements, and that parameter binding, rather than concatenation is used in Hibernate statements.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic User getUser(Connection con, String user) throws SQLException {\n\n  Statement stmt1 = null;\n  Statement stmt2 = null;\n  PreparedStatement pstmt;\n  try {\n    stmt1 = con.createStatement();\n    ResultSet rs1 = stmt1.executeQuery("GETDATE()"); // Compliant; parameters not used here\n\n    stmt2 = con.createStatement();\n    ResultSet rs2 = stmt2.executeQuery("select FNAME, LNAME, SSN " +\n                 "from USERS where UNAME=" + user);  // Noncompliant; parameter concatenated directly into query\n\n    pstmt = con.prepareStatement("select FNAME, LNAME, SSN " +\n                 "from USERS where UNAME=" + user);  // Noncompliant; parameter concatenated directly into query\n    ResultSet rs3 = pstmt.executeQuery();\n\n    //...\n}\n\npublic User getUserHibernate(org.hibernate.Session session, String userInput) {\n\n  org.hibernate.Query query = session.createQuery(  // Compliant\n            "FROM students where fname = " + userInput);  // Noncompliant; parameter binding should be used instead\n  // ...\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic User getUser(Connection con, String user) throws SQLException {\n\n  Statement stmt1 = null;\n  PreparedStatement pstmt = null;\n  String query = "select FNAME, LNAME, SSN " +\n                 "from USERS where UNAME=?"\n  try {\n    stmt1 = con.createStatement();\n    ResultSet rs1 = stmt1.executeQuery("GETDATE()");\n\n    pstmt = con.prepareStatement(query);\n    pstmt.setString(1, user);  // Compliant; PreparedStatements escape their inputs.\n    ResultSet rs2 = pstmt.executeQuery();\n\n    //...\n  }\n}\n\npublic User getUserHibernate(org.hibernate.Session session, String userInput) {\n\n  org.hibernate.Query query =  session.createQuery("FROM students where fname = ?");\n  query = query.setParameter(0,userInput);  // Parameter binding escapes all input\n  // ...\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/89">MITRE, CWE-89</a> - Improper Neutralization of Special Elements used in an SQL Command</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/564.html">MITRE, CWE-564</a> - SQL Injection: Hibernate</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/20.html">MITRE, CWE-20</a> - Improper Input Validation</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/943.html">MITRE, CWE-943</a> - Improper Neutralization of Special Elements in Data Query Logic</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A1-Injection">OWASP Top Ten 2013 Category A1</a> - Injection</li>\n<li> <a href="http://www.sans.org/top25-software-errors/">SANS Top 25</a> - Insecure Interaction Between Components</li>\n<li> Derived from FindSecBugs rules <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#SQL_INJECTION_JPA">Potential SQL/JPQL Injection (JPA)</a>, <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#SQL_INJECTION_JDO">Potential SQL/JDOQL Injection (JDO)</a>, <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#SQL_INJECTION_HIBERNATE">Potential SQL/HQL Injection (Hibernate)</a></li>\n</ul>	3	\N	Values passed to SQL commands should be sanitized	REMOVED	java	2016-10-11 14:20:58.021	2016-10-12 16:28:40.362	\N	\N	\N	\N	\N	20	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
92	S2076	S2076	squid	<p>Applications that execute operating system commands should neutralize any externally-provided values used in those commands. Failure to do so could allow an attacker to include input that executes unintended commands, or exposes sensitive data.</p>\n<p>This rule logs an issue as soon as a command is built dynamically. it's then up to the auditor to figure out if the command execution is secure or not. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void listContent(String input) {\n  Runtime rt = Runtime.getRuntime();\n  rt.exec("ls " + input); // Noncompliant; input could easily contain extra commands\n  ...\n}\n\npublic void execute(String command, String argument) {\n  ProcessBuilder pb = new ProcessBuilder(command, argument); // Noncompliant\n  ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/78">MITRE, CWE-78</a> - Improper Neutralization of Special Elements used in an OS Command</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/88">MITRE, CWE-88</a> - Argument Injection or Modification</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A1-Injection">OWASP Top Ten 2013 Category A1</a> - Injection</li>\n<li> <a href="http://www.sans.org/top25-software-errors/">SANS Top 25</a> - Insecure Interaction Between Components</li>\n<li> Derived from the FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#COMMAND_INJECTION">Potential Command Injection</a></li>\n</ul>	3	\N	Values passed to OS commands should be sanitized	REMOVED	java	2016-10-11 14:20:58.024	2016-10-12 16:28:40.365	\N	\N	\N	\N	\N	20	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
96	S109	S109	squid	<p>A magic number is a number that comes out of nowhere, and is directly used in a statement. Magic numbers are often used, for instance to limit the number of iterations of a loops, to test the value of a property, etc.</p>\n\n<p>Using magic numbers may seem obvious and straightforward when you're writing a piece of code, but they are much less obvious and straightforward at debugging time.</p>\n\n<p>That is why magic numbers must be demystified by first being assigned to clearly named constants before being used.</p>\n\n<p>-1, 0 and 1 are not considered magic numbers.</p>\n\n<h2>Noncompliant Code Sample</h2>\n\n<pre>\npublic static void doSomething() {\n  for(int i = 0; i < 4; i++){                 //Non-Compliant, 4 is a magic number\n  ...\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\npublic static final int NUMBER_OF_CYCLES = 4;\npublic static void doSomething() {\n  for(int i = 0; i < NUMBER_OF_CYCLES ; i++){   //Compliant\n    ...\n  }\n}\n</pre>	1	\N	Magic numbers should not be used	REMOVED	java	2016-10-11 14:20:58.033	2016-10-12 16:28:41.53	\N	\N	\N	\N	\N	35	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
199	CallToFileDeleteOnExitMethod	CallToFileDeleteOnExitMethod	squid	<p>Use of <code>File.deleteOnExit()</code> is not recommended for the following reasons:</p>\n<ul>\n<li> The deletion occurs only in the case of a normal JVM shutdown but not when the JVM crashes or is killed.</li>\n<li> For each file handler, the memory associated to the handler is released only at the end of the process.</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nFile file = new File("file.txt");\nfile.deleteOnExit();  // Noncompliant\n</pre>	2	\N	"deleteOnExit" should not be used	REMOVED	java	2016-10-11 14:20:58.246	2016-10-12 16:28:40.351	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
95	S1301	S1301	squid	<p><code>switch</code> statements are useful when there are many different cases depending on the value of the same expression.</p>\n<p>For just one or two cases however, the code will be more readable with <code>if</code> statements.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nswitch (variable) {\n  case 0:\n    doSomething();\n    break;\n  default:\n    doSomethingElse();\n    break;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif (variable == 0) {\n  doSomething();\n} else {\n  doSomethingElse();\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 15.5 - Every switch statement shall have at least one case clause.</li>\n<li> MISRA C++:2008, 6-4-8 - Every switch statement shall have at least one case-clause.</li>\n<li> MISRA C:2012, 16.6 - Every switch statement shall have at least two switch-clauses</li>\n</ul>	1	\N	"switch" statements should have at least 3 "case" clauses	REMOVED	java	2016-10-11 14:20:58.031	2016-10-12 16:28:40.437	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
94	S2078	S2078	squid	<p>Applications that execute LDAP queries should neutralize any externally-provided values in those commands. Failure to do so could allow an attacker to include input that changes the query so that unintended commands are executed, or sensitive data is exposed. Unhappily LDAP doesn't provide any prepared statement interfaces like SQL to easily remove this risk. So each time a LDAP query is built dynamically this rule logs an issue.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic User lookupUser(String username, String base, String [] requestedAttrs) {\n\n  // ...\n  DirContext dctx = new InitialDirContext(env);\n\n  SearchControls sc = new SearchControls();\n  sc.setReturningAttributes(requestedAttrs);  // Noncompliant\n  sc.setSearchScope(SearchControls.SUBTREE_SCOPE);\n\n  String filter = "(&amp;(objectClass=user)(sAMAccountName=" + username + "))";\n\n  NamingEnumeration results = dctx.search(base,  // Noncompliant\n        filter,  // Noncompliant; parameter concatenated directly into string\n        sc);\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic User lookupUser(String username, String base, String [] requestedAttrs) {\n\n  // ...\n  DirContext dctx = new InitialDirContext(env);\n\n  SearchControls sc = new SearchControls();\n  sc.setReturningAttributes(buildAttrFilter(requestedAttrs));  // Compliant; method presumably scrubs input\n  sc.setSearchScope(SearchControls.SUBTREE_SCOPE);\n  \n  String useBase = "ou=People";\n  if (! base.startsWith(useBase)) {\n    useBase = base;\n  }\n  \n  String filter = "(&amp;(objectClass=user)(sAMAccountName=" + username.replaceAll("[()| ]","") + "))";\n\n  NamingEnumeration results = dctx.search(useBase,  // Compliant; originally value used conditionally\n        filter,  // Compliant; parameter NOT concatenated directly into string\n        sc);\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/90">MITRE CWE-90</a> - Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A1-Injection">OWASP Top Ten 2013 Category A1</a> - Injection</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#LDAP_INJECTION">Potential LDAP Injection</a></li>\n</ul>	3	\N	Values passed to LDAP queries should be sanitized	REMOVED	java	2016-10-11 14:20:58.028	2016-10-12 16:28:40.438	\N	\N	\N	\N	\N	20	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
98	S2183	S2183	squid	<p>Since an <code>int</code> is a 32-bit variable, shifting by more than (-)31 is confusing at best and an error at worst. Shifting an <code>int</code> by 32 is the same as shifting it by 0, and shifting it by 33 is the same as shifting it by 1.</p>\n\n<p>Similarly, shifting a <code>long</code> by (-)64 is the same as shifting it by 0, and shifting it by 65 is the same as shifting it by 1.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic int shift(int a) {\n  return a << 48;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic int shift(int a) {\n  return a << 16;\n}\n</pre>	3	\N	Ints and longs should not be shifted by more than their number of bits-1	REMOVED	java	2016-10-11 14:20:58.037	2016-10-12 16:28:40.344	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
99	S2061	S2061	squid	Writers of <code>Serializable</code> classes can choose to let Java's automatic mechanisms handle serialization and deserialization, or they can choose to handle it themselves by implementing specific methods. However, if the signatures of those methods are not exactly what is expected, they will be ignored and the default serialization mechanisms will kick back in. \n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Watermelon implements Serializable {\n  // ...\n  void writeObject(java.io.ObjectOutputStream out)// Noncompliant; not private\n        throws IOException  \n  {...}\n\n  private void readObject(java.io.ObjectInputStream in)\n  {...}\n\n  public void readObjectNoData()  // Noncompliant; not private \n  {...}\n\n  static Object readResolve() throws ObjectStreamException  // Noncompliant; this method may have any access modifier, may not be static\n\n  Watermelon writeReplace() throws ObjectStreamException // Noncompliant; this method may have any access modifier, but must return Object\n  {...}\n} \n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Watermelon implements Serializable {\n  // ...\n  private void writeObject(java.io.ObjectOutputStream out) \n        throws IOException \n  {...}\n\n  private void readObject(java.io.ObjectInputStream in)\n        throws IOException, ClassNotFoundException\n  {...}\n\n  private void readObjectNoData()\n        throws ObjectStreamException\n  {...}\n\n  protected Object readResolve() throws ObjectStreamException\n  {...}\n\n  private Object writeReplace() throws ObjectStreamException\n  {...}\n</pre>	3	\N	Custom serialization method signatures should meet requirements	REMOVED	java	2016-10-11 14:20:58.039	2016-10-12 16:28:40.345	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
97	S106	S106	squid	<p>When logging a message there are two important requirements which must be fulfilled:</p>\n<ul>\n<li> The user must be able to easily retrieve the logs</li>\n<li> The format of all logged message must be uniform to allow the user to easily read the log</li>\n</ul>\n<p>If a program directly writes to the standard outputs, there is absolutely no way to comply with those requirements. That's why defining and using a dedicated logger is highly recommended.</p>\n<p>The following code snippet illustrates this rule:</p>\n<pre>\nSystem.out.println("My Message");  //Non-Compliant\n\nlogger.log("My Message");          //Compliant\n</pre>	2	\N	Standard ouputs should not be used directly to log anything	REMOVED	java	2016-10-11 14:20:58.035	2016-10-12 16:28:41.53	\N	\N	\N	\N	\N	19	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
212	S2326	S2326	squid	<p>Type parameters that aren't used are dead code, which can only distract and possibly confuse developers during maintenance. Therefore, unused type parameters should be removed.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nint &lt;T&gt; Add(int a, int b) // Noncompliant; &lt;T&gt; is ignored\n{\n  return a + b; \n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nint Add(int a, int b)\n{\n  return a + b; \n}\n</pre>	2	\N	Unused type parameters should be removed	REMOVED	java	2016-10-11 14:20:58.274	2016-10-12 16:28:41.583	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
100	S2184	S2184	squid	<p>When arithmetic is performed on <code>int</code>s, the result will always be an <code>int</code>. You can assign that result to a <code>long</code>, <code>double</code>, or <code>float</code> with automatic type conversion, but having started as an <code>int</code>, the result will likely not be what you expect. </p>\n<p>For instance, if the result of <code>int</code> division is assigned to a floating-point variable, precision will have been lost before the assignment. Likewise, if the result of multiplication is assigned to a <code>long</code>, it may have already overflowed before the assignment.</p>\n<p>In either case, the result will not be what was expected. Instead, at least one operand should be cast or promoted to the final type before the operation takes place.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nfloat twoThirds = 2/3; // Noncompliant; int division. Yields 0.0\nlong millisInYear = 1_000*3_600*24*365; // Noncompliant; int multiplication. Yields 1471228928\nlong bigNum = Integer.MAX_VALUE + 2; // Noncompliant. Yields -2147483647\nlong bigNegNum =  Integer.MIN_VALUE-1; //Noncompliant, gives a positive result instead of a negative one. \nDate myDate = new Date(seconds * 1_000); //Noncompliant, won't produce the expected result if seconds &gt; 2_147_483\n...\npublic long compute(int factor){\n  return factor * 10_000;  //Noncompliant, won't produce the expected result if factor &gt; 214_748\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nfloat twoThirds = 2f/3; // 2 promoted to float. Yields 0.6666667\nlong millisInYear = 1_000L*3_600*24*365; // 1000 promoted to long. Yields 31_536_000_000\nlong bigNum = Integer.MAX_VALUE + 2L; // 2 promoted to long. Yields 2_147_483_649\nlong bigNegNum =  Integer.MIN_VALUE-1L; // Yields -2_147_483_649\nDate myDate = new Date(seconds * 1_000L);\n...\npublic long compute(int factor){\n  return factor * 10_000L;\n}\n</pre>\n<p>or</p>\n<pre>\nfloat twoThirds = (float)2/3; // 2 cast to float\nlong millisInYear = (long)1_000*3_600*24*365; // 1_000 cast to long\nlong bigNum = (long)Integer.MAX_VALUE + 2;\nlong bigNegNum =  (long)Integer.MIN_VALUE-1;\nDate myDate = new Date((long)seconds * 1_000);\n...\npublic long compute(long factor){\n  return factor * 10_000;\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/190">MITRE, CWE-190</a> - Integer Overflow or Wraparound</li>\n<li> <a href="http://www.sans.org/top25-software-errors/">SANS Top 25</a> - Risky Resource Management</li>\n</ul>	2	\N	Math operands should be cast before assignment	REMOVED	java	2016-10-11 14:20:58.04	2016-10-12 16:28:40.336	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
101	S2063	S2063	squid	A non-serializable <code>Comparator</code> can prevent an otherwise-<code>Serializable</code> ordered collection from being serializable. Since the overhead to make a <code>Comparator</code> serializable is usually low, doing so can be considered good defensive programming.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class FruitComparator implements Comparator&lt;Fruit&gt; {  // Noncompliant\n  int compare(Fruit f1, Fruit f2) {...}\n  boolean equals(Object obj) {...}\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class FruitComparator implements Comparator&lt;Fruit&gt;, Serializable {\n  private static final long serialVersionUID = 1;\n\n  int compare(Fruit f1, Fruit f2) {...}\n  boolean equals(Object obj) {...}\n}\n</pre>	2	\N	Comparators should be "Serializable"	REMOVED	java	2016-10-11 14:20:58.043	2016-10-12 16:28:40.338	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
102	S1656	S1656	squid	<p>There is no reason to re-assign a variable to itself. Either this statement is redundant and should be removed, or the re-assignment is a mistake and some other value or variable was intended for the assignment instead.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void setName(String name) {\n    name = name;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void setName(String name) {\n    this.name = name;\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/NYA5">CERT, MSC12-C</a> - Detect and remove code that has no effect</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/SIIyAQ">CERT, MSC12-CPP</a> - Detect and remove code that has no effect</li>\n</ul>	2	\N	Variables should not be self-assigned	REMOVED	java	2016-10-11 14:20:58.045	2016-10-12 16:28:40.372	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	3min	\N	\N	\N	f	HTML
103	ParsingError	ParsingError	squid	<p>When the Java parser fails, it is possible to record the failure as a violation on the file. This way, not only it is possible to track the number of files that do not parse but also to easily find out why they do not parse.</p>	2	\N	Java parser failure	REMOVED	java	2016-10-11 14:20:58.047	2016-10-12 16:28:40.377	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
111	S1160	S1160	squid	<p>\nUsing checked exceptions forces method callers to deal with errors, either by propagating them or by handling them.\nThis makes those exceptions fully part of the API of the method.\n</p>\n\n<p>\nTo keep the complexity for callers reasonable, methods should not throw more than one kind of checked exception.\n</p>\n\n<p>The following code:</p>\n\n<pre>\npublic void delete() throws IOException, SQLException {      // Non-Compliant\n  /* ... */\n}\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\npublic void delete() throws SomeApplicationLevelException {  // Compliant\n  /* ... */\n}\n</pre>\n\nOverriding methods are not checked by this rule and are allowed to throw several checked exceptions.	2	\N	Public methods should throw at most one checked exception	REMOVED	java	2016-10-11 14:20:58.064	2016-10-12 16:28:42.593	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	1h	\N	\N	\N	f	HTML
105	S2066	S2066	squid	<p>Serializing a non-<code>static</code> inner class will result in an attempt at serializing the outer class as well. If the outer class is not serializable, then serialization will fail, resulting in a runtime error.</p>\n\n<p>Making the inner class <code>static</code> (i.e. "nested") avoids this problem, therefore inner classes should be <code>static</code> if possible. However, you should be aware that there are semantic differences between an inner class and a nested one: \n<ul>\n  <li>an inner class can only be instantiated within the context of an instance of the outer class.</li>\n  <li>a nested (<code>static</code>) class can be instantiated independently of the outer class.</li>\n</ul>\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Pomegranate {\n  // ...\n\n  public class Seed implements Serializable {  // Noncompliant; serialization will fail\n    // ...\n  }\n} \n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Pomegranate {\n  // ...\n\n  public static class Seed implements Serializable {\n    // ...\n  }\n} \n</pre>	3	\N	"Serializable" inner classes of non-serializable classes should be "static"	REMOVED	java	2016-10-11 14:20:58.051	2016-10-12 16:28:40.34	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
106	S2065	S2065	squid	<code>transient</code> is used to mark fields in a <code>Serializable</code> class which will not be written out to file (or stream). In a class that does not implement <code>Serializable</code>, this modifier is simply wasted keystrokes, and should be removed.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nclass Vegetable {  // does not implement Serializable\n  private transient Season ripe;  // Noncompliant\n  // ...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass Vegetable {\n  private Season ripe;\n  // ...\n}\n</pre>	1	\N	Fields in non-serializable classes should not be "transient"	REMOVED	java	2016-10-11 14:20:58.053	2016-10-12 16:28:40.343	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
104	ObjectFinalizeCheck	ObjectFinalizeCheck	squid	<p>According to the official javadoc documentation, this Object.finalize() is called by the garbage collector on an object when garbage collection determines that there are no more references to the object. Calling this method explicitly breaks this contract and so is misleading. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void dispose() throws Throwable {\n  this.finalize();                       // Non-Compliant\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/586.html">MITRE, CWE-586</a> - Explicit Call to Finalize()</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/H4cbAQ">CERT, MET12-J</a> - Do not use finalizers</li>\n</ul>	3	\N	The Object.finalize() method should not be called	REMOVED	java	2016-10-11 14:20:58.049	2016-10-12 16:28:40.373	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
257	S00122	S00122	squid	<p>For better readability, do not put more than one statement on a single line.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif(someCondition) doSomething();\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif(someCondition) {\n  doSomething();\n}\n</pre>	1	\N	Statements should be on separate lines	REMOVED	java	2016-10-11 14:20:58.367	2016-10-12 16:28:42.561	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	\N	f	HTML
109	S1774	S1774	squid	<p>While the ternary operator is pleasingly compact, it's use can make code more difficult to read. It should therefore be avoided in favor of the more verbose <code>if</code>/<code>else</code> structure.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nSystem.out.println(i>10?"yes":"no");\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nif (i > 10) {\n  System.out.println(("yes");\n} else {\n  System.out.println("no");\n}\n</pre>	2	\N	The ternary operator should not be used	REMOVED	java	2016-10-11 14:20:58.059	2016-10-12 16:28:40.371	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
107	S2068	S2068	squid	<p>Because it is easy to extract strings from a compiled application, credentials should never be hard-coded. Do so, and they're almost guaranteed to end up in the hands of an attacker. This is particularly true for applications that are distributed.</p>\n<p>Credentials should be stored outside of the code in a strongly-protected encrypted configuration file or database.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nConnection conn = null;\ntry {\n  conn = DriverManager.getConnection("jdbc:mysql://localhost/test?" +\n        "user=steve&amp;password=blue"); // Noncompliant\n  String uname = "steve";\n  String password = "blue";\n  conn = DriverManager.getConnection("jdbc:mysql://localhost/test?" +\n        "user=" + uname + "&amp;password=" + password); // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nConnection conn = null;\ntry {\n  String uname = getEncryptedUser();\n  String password = getEncryptedPass();\n  conn = DriverManager.getConnection("jdbc:mysql://localhost/test?" +\n        "user=" + uname + "&amp;password=" + password);\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/798">MITRE, CWE-798</a> - Use of Hard-coded Credentials</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/259">MITRE, CWE-259</a> - Use of Hard-coded Password</li>\n<li> <a href="http://www.sans.org/top25-software-errors/">SANS Top 25</a> - Porous Defenses</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A2-Broken_Authentication_and_Session_Management">OWASP Top Ten 2013 Category A2</a> - Broken Authentication and Session Management</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#HARD_CODE_PASSWORD">Hard Coded Password</a></li>\n</ul>	3	\N	Credentials should not be hard-coded	REMOVED	java	2016-10-11 14:20:58.055	2016-10-12 16:28:40.375	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
110	S138	S138	squid	<p>\nA method that grows too large tends to aggregate too many responsibilities.\nSuch method inevitably become harder to understand and therefore harder to maintain.\n</p>\n\n<p>\nAbove a specific threshold, it is strongly advised to refactor into smaller methods which focus on well-defined tasks.\nThose smaller method will not only be easier to understand, but also probably easier to test.\n</p>	2	\N	Methods should not have too many lines	REMOVED	java	2016-10-11 14:20:58.061	2016-10-12 16:28:40.441	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
112	S135	S135	squid	<p>Restricting the number of <code>break</code> and <code>continue</code> statements in a loop is done in the interest of good structured programming. </p>\n<p>One <code>break</code> and <code>continue</code> statement is acceptable in a loop, since it facilitates optimal coding. If there is more than one, the code should be refactored to increase readability.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nfor (int i = 1; i &lt;= 10; i++) {     // Noncompliant - 2 continue - one might be tempted to add some logic in between\n  if (i % 2 == 0) {\n    continue;\n  }\n\n  if (i % 3 == 0) {\n    continue;\n  }\n\n  System.out.println("i = " + i);\n}\n</pre>	2	\N	Loops should not contain more than a single "break" or "continue" statement	REMOVED	java	2016-10-11 14:20:58.067	2016-10-12 16:28:41.517	\N	\N	\N	\N	\N	16	\N	LINEAR	\N	20min	\N	\N	\N	\N	\N	f	HTML
114	S2251	S2251	squid	A <code>for</code> loop with a counter that moves in the wrong direction is not an infinite loop. Because of wraparound, the loop will eventually reach its stop condition, but in doing so, it will run many, many more times than anticipated, potentially causing unexpected behavior. \n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void doSomething(String [] strings) {\n  for (int i = 0; i &lt; strings.length; i--) { // Noncompliant;\n    String string = strings[i];  // ArrayIndexOutOfBoundsException when i reaches -1\n    //...\n  }\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void doSomething(String [] strings) {\n  for (int i = 0; i &lt; strings.length; i++) {\n    String string = strings[i];\n    //...\n  }\n</pre>	4	\N	A "for" loop update clause should move the counter in the right direction	REMOVED	java	2016-10-11 14:20:58.071	2016-10-12 16:28:42.585	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
115	S2130	S2130	squid	Rather than creating a boxed primitive from a <code>String</code> to extract the primitive value, use the relevant <code>parse</code> method instead. It will be clearer and more efficient.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nString myNum = "12.2";\n\nfloat f = new Float(myNum).floatValue();  // Noncompliant; creates &amp; discards a Float\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nString myNum = "12.2";\n\nfloat f = Float.parseFloat(myNum);\n</pre>	2	\N	Parsing should be used to convert "Strings" to primitives	REMOVED	java	2016-10-11 14:20:58.073	2016-10-12 16:28:42.586	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
113	S1161	S1161	squid	<p>Using the <code>@Override</code> annotation is useful for two reasons :</p>\n<ul>\n  <li>It elicits a warning from the compiler if the annotated method doesn't actually override anything, as in the case of a misspelling.</li>\n  <li>It improves the readability of the source code by making it obvious that methods are overridden.</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n<pre>\nclass ParentClass {\n  public boolean doSomething(){...}\n}\nclass FirstChildClass extends ParentClass {\n  public boolean doSomething(){...}  //Non-Compliant\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass ParentClass {\n  public boolean doSomething(){...}\n}\nclass FirstChildClass extends ParentClass {\n  @Override\n  public boolean doSomething(){...}  //Compliant\n}\n</pre>	2	\N	"@Override" annotation should be used on any method overriding (since Java 5) or implementing (since Java 6) another one	REMOVED	java	2016-10-11 14:20:58.069	2016-10-12 16:28:42.588	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
117	S2250	S2250	squid	<p>For most collections the <code>size()</code> method requires constant time, but the time required to execute <code>ConcurrentLinkedQueue.size()</code> is directly proportional to the number of elements in the queue. When the queue is large, this could therefore be an expensive operation. Further, the results may be inaccurate if the queue is modified during execution.</p>\n\n<p>By the way, if the <code>size()</code> is used only to check that the collection is empty, then the <code>isEmpty()</code> method should be used.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nConcurrentLinkedQueue queue = new ConcurrentLinkedQueue();\n//...\nlog.info("Queue contains " + queue.size() + " elements");\n</pre>	3	\N	"ConcurrentLinkedQueue.size()" should not be used	REMOVED	java	2016-10-11 14:20:58.077	2016-10-12 16:28:42.589	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
118	LowerCaseLongSuffixCheck	LowerCaseLongSuffixCheck	squid	<p>The long suffix should always be written in uppercase, i.e. 'L', as the lowercase 'l' can easily be confused with the digit one '1'.</p>\n<p>The following code:</p>\n<pre>\nlong n = 10l;  // Non-Compliant - easily confused with one zero one\n</pre>\n<p>should be refactored into:</p>\n<pre>\nlong n = 10L;  // Compliant\n</pre>	1	\N	Long suffix "L" should be upper case	REMOVED	java	2016-10-11 14:20:58.079	2016-10-12 16:28:41.508	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
119	MissingDeprecatedCheck	MissingDeprecatedCheck	squid	<p>Deprecation should be marked with both the <code>@Deprecated</code> annotation and @deprecated Javadoc tag. The annotation enables tools such as IDEs to warn about referencing deprecated elements, and the tag can be used to explain when it was deprecated, why, and how references should be refactored.</p>\n\n<p>The following code illustrates this rule:</p>\n\n<h2>Noncompliant Code Sample</h2>\n<pre>\nclass MyClass {\n\n@Deprecated\npublic void foo1() {\n}\n\n/**\n* @deprecated\n*/\npublic void foo2() {    // Non-Compliant\n}\n\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass MyClass {\n\n/**\n* @deprecated (when, why, refactoring advice...)\n*/\n@Deprecated\npublic void foo1() {\n}\n\n/**\n* @deprecated (when, why, refactoring advice...)\n*/\n@Deprecated\npublic void foo2() {    // Non-Compliant\n}\n\n}\n</pre>\n\n<h2>Exceptions</h2>\n<p>The members and methods of a deprecated class or interface are ignored by this rule. The classes and interfaces themselves are still subject to it.</p>\n\n<pre>\n/**\n* @deprecated (when, why, &etc...)\n*/\n@Deprecated\nclass Qix  {\n\npublic void foo() {} // Compliant; class is deprecated\n\n}\n\n/**\n* @deprecated (when, why, &etc...)\n*/\n@Deprecated\ninterface Plop {\n\nvoid bar();\n\n}\n</pre>	2	\N	Deprecated elements should have both the annotation and the Javadoc tag	REMOVED	java	2016-10-11 14:20:58.081	2016-10-12 16:28:41.575	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
120	S1602	S1602	squid	<p>There are two ways to write lambdas that contain single statement, but one is definitely more compact and readable than the other.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nx -&gt; {System.out.println(x+1);}\n(a, b) -&gt; { return a+b; }\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nx -&gt; System.out.println(x+1)\n(a, b) -&gt; a+b    //For return statement, the return keyword should also be dropped\n</pre>	2	\N	Lamdbas containing only one statement should not nest this statement in a block	REMOVED	java	2016-10-11 14:20:58.083	2016-10-12 16:28:41.623	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
116	S1162	S1162	squid	<p>The purpose of checked exceptions is to ensure that errors will be dealt with, either by propagating them or by handling them, but some believe that checked exceptions negatively impact the readability of source code, by spreading this error handling/propagation logic everywhere.</p>\n<p>This rule verifies that no method throws a new checked exception.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void myMethod1() throws CheckedException {\n  ...\n  throw new CheckedException(message);   // Non-Compliant\n  ...\n  throw new IllegalArgumentException(message); //Compliant; IllegalArgumentException is unchecked\n}   \n\npublic void myMethod2() throws CheckedException {  // Compliant; propagation allowed\n  myMethod1();\n}\n</pre>	2	\N	Checked Exception should not be thrown	REMOVED	java	2016-10-11 14:20:58.075	2016-10-12 16:28:42.587	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	1h	\N	\N	\N	f	HTML
124	S1848	S1848	squid	There is no good reason to create a new object to not do anything with it. Most of the time, this is due to a missing piece of code and so could lead to an unexpected behavior in production.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nif (x &lt; 0)\n  new IllegalArgumentException("x must be nonnegative");\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nif (x &lt; 0)\n  throw new IllegalArgumentException("x must be nonnegative");\n</pre>	3	\N	Objects should not be created to be dropped immediately without being used	REMOVED	java	2016-10-11 14:20:58.091	2016-10-12 16:28:41.614	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
122	S1724	S1724	squid	<p>Deprecated classes and interfaces should be avoided, rather than used, inherited or extended. Deprecation is a warning that the class or interface has been superseded, and will eventually be removed. The deprecation period allows you to make a smooth transition away from the aging, soon-to-be-retired technology.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n/**\n* @deprecated  As of release 1.3, replaced by {@link #Fee}\n*/@Deprecated\nclass Foo { ... }\n\nclass Bar extends Foo { ... }\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass Bar extends Fee { ... }\n</pre>\n\n<h2>Exception</h2>\n<p>When the class that extends a deprecated class is itself deprecated, the extending class will be ignored.</p>\n<pre>\n@Deprecated\nclass Bar extends Foo { ... } // compliant Bar is deprecated.\n</pre>\n\n  <h2>See</h2>\n    <ul>\n      <li><a href="http://cwe.mitre.org/data/definitions/477.html">MITRE, CWE-477</a> - Use of Obsolete Functions</li>\n    </ul>	2	\N	Deprecated classes and interfaces should not be extended/implemented	REMOVED	java	2016-10-11 14:20:58.087	2016-10-12 16:28:41.621	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
121	S1844	S1844	squid	<p>From the Java API documentation:</p>\n<blockquote>\n<code>Condition</code> factors out the <code>Object</code> monitor methods (<code>wait</code>, <code>notify</code> and <code>notifyAll</code>) into distinct objects to give the effect of having multiple wait-sets per object, by combining them with the use of arbitrary Lock implementations. Where a <code>Lock</code> replaces the use of <code>synchronized</code> methods and statements, a <code>Condition</code> replaces the use of the <code>Object</code> monitor methods.\n</blockquote>\n\nThe purpose of implementing the <code>Condition</code> interface is to gain access to its more nuanced <code>await</code> methods. Therefore, calling the method <code>Object.wait(...)</code> on a class implementing the <code>Condition</code> interface is silly and confusing.\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nfinal Lock lock = new ReentrantLock();\nfinal Condition notFull  = lock.newCondition();\n...\nnotFull.wait();\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nfinal Lock lock = new ReentrantLock();\nfinal Condition notFull  = lock.newCondition();\n...\nnotFull.await();\n</pre>	4	\N	"Object.wait(...)" should never be called on objects that implement "java.util.concurrent.locks.Condition"	REMOVED	java	2016-10-11 14:20:58.085	2016-10-12 16:28:41.628	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
123	S1604	S1604	squid	<p>Before Java 8, the only way to partially support closures in Java was by using anonymous inner classes. But the syntax of anonymous classes may seem unwieldy and unclear.</p>\n\n<p>With Java 8, most uses of anonymous inner classes should be replaced by lambdas to highly increase the readability of the source code.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nmyCollection.map(new Mapper<String,String>() {\n  public String map(String input) {\n    return new StringBuilder(input).reverse().toString();\n  }\n});\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nmyCollection.map(element -> new StringBuilder(element).reverse().toString());\n</pre>	2	\N	Anonymous inner classes containing only one method should become lambdas	REMOVED	java	2016-10-11 14:20:58.089	2016-10-12 16:28:41.637	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
126	LeftCurlyBraceEndLineCheck	LeftCurlyBraceEndLineCheck	squid	<p>Sharing some coding conventions is a key point to make it possible for a team to efficiently collaborate. This rule make it mandatory to place open curly braces at the end of lines of code.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif(condition)\n{\n  doSomething();\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif(condition) {\n  doSomething();\n}\n</pre>\n<h2>Exceptions</h2>\n\n<p>When blocks are inlined (left and right curly braces on the same line), no issue is triggered. </p>\n<pre>\nif(condition) {doSomething();} \n</pre>	1	\N	An open curly brace should be located at the end of a line	REMOVED	java	2016-10-11 14:20:58.094	2016-10-12 16:28:41.569	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	\N	f	HTML
125	S1849	S1849	squid	Calling <code>Iterator.hasNext()</code> is not supposed to have any side effects, and therefore should not change the state of the iterator. <code>Iterator.next()</code> advances the iterator by one item. So calling it inside <code>Iterator.hasNext()</code>, breaks the <code>hasNext()</code> contract, and will lead to unexpected behavior in production.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class FibonacciIterator implements Iterator&lt;Integer&gt;{\n...\n@Override\npublic boolean hasNext() {\n  if(next() != null) {\n    return true;\n  }\n  return false;\n}\n...\n}\n</pre>	4	\N	"Iterator.hasNext()" should not call "Iterator.next()"	REMOVED	java	2016-10-11 14:20:58.093	2016-10-12 16:28:41.612	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
128	S2253	S2253	squid	<p>This rule allows banning certain methods. </p>\n<p>Given parameters:</p>\n<ul>\n<li> className:java.lang.String</li>\n<li> methodName: replace</li>\n<li> argumentTypes: java.lang.CharSequence, java.lang.CharSequence</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nString name;\nname.replace("A","a");  // Noncompliant\n</pre>	2	\N	Disallowed methods should not be used	REMOVED	java	2016-10-11 14:20:58.098	2016-10-12 16:28:42.59	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	HTML
127	S1163	S1163	squid	<p>\nThrowing an exception from within a finally block will mask any exception which was previously thrown in the <code>try</code> or <code>catch</code> block.\nThe masked's exception message and stack trace will be lost.\n</p>\n\n<p>The following code:</p>\n\n<pre>\ntry {\n  /* some work which end up throwing an exception */\n  throw new IllegalArgumentException();\n} finally {\n  /* clean up */\n  throw new RuntimeException();                          // Non-Compliant - will mask the IllegalArgumentException\n}\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\ntry {\n  /* some work which end up throwing an exception */\n  throw new IllegalArgumentException();\n} finally {\n  /* clean up */                                         // Compliant\n}\n</pre>	2	\N	Exceptions should not be thrown in finally blocks	REMOVED	java	2016-10-11 14:20:58.096	2016-10-12 16:28:42.59	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
129	S2252	S2252	squid	If a <code>for</code> loop's condition is false before the first loop iteration, the loop will never be executed. Such loops are almost always bugs, particularly when the initial value and stop conditions are hard-coded.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nfor (int i = 10; i &lt; 10; i++) {  // Noncompliant \n  // ...\n</pre>	3	\N	Loop conditions should be true at least once	REMOVED	java	2016-10-11 14:20:58.102	2016-10-12 16:28:42.591	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
132	S2134	S2134	squid	<p>According to the Java API documentation:</p>\n<blockquote>\nThere are two ways to create a new thread of execution. One is to declare a class to be a subclass of Thread. This subclass should override the run method of class Thread. An instance of the subclass can then be allocated and started...\nThe other way to create a thread is to declare a class that implements the Runnable interface. That class then implements the run method. An instance of the class can then be allocated, passed as an argument when creating Thread, and started.\n</blockquote>\n\n<p>By definition, extending the Thread class without overriding the <code>run</code> method doesn't make sense, and implies that the contract of the <code>Thread</code> class is not well understood.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyRunner extends Threads { // Noncompliant; run method not overridden\n\n  public void doSometing() {...}\n}\n</pre>	2	\N	Classes extending java.lang.Thread should override the "run" method	REMOVED	java	2016-10-11 14:20:58.107	2016-10-12 16:28:41.605	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
131	S1165	S1165	squid	<p>Exceptions are meant to represent the application's state at which an error occurred.</p>\n<p>Making all fields final ensures that this state:</p>\n<ul>\n<li> Will be fully defined at the same time the exception is instantiated.</li>\n<li> Won't be updated or corrupted by some bogus error handler.</li>\n</ul>\n<p>This will enable developers to quickly understand what went wrong.</p>\n<p>The following code:</p>\n<pre>\npublic class MyException extends Exception {\n\n  private int status;                               // Non-Compliant\n\n  public MyException(String message) {\n    super(message);\n  }\n\n  public int getStatus() {\n    return status;\n  }\n\n  public void setStatus(int status) {\n    this.status = status;\n  }\n\n}\n</pre>\n<p>should be refactored into:</p>\n<pre>\npublic class MyException extends Exception {\n\n  private final int status;                         // Compliant\n\n  public MyException(String message, int status) {\n    super(message);\n    this.status = status;\n  }\n\n  public int getStatus() {\n    return status;\n  }\n\n}\n</pre>	2	\N	Exception classes should be immutable	REMOVED	java	2016-10-11 14:20:58.106	2016-10-12 16:28:41.607	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
130	S2131	S2131	squid	<p>"Boxing" is the process of putting a primitive value into a primitive-wrapper object. When that's done purely to use the wrapper class' <code>toString</code> method, it's a waste of memory and cycles because those methods are <code>static</code>, and can therefore be used without a class instance. Similarly, using the <code>static</code> method <code>valueOf</code> in the primitive-wrapper classes with a non-<code>String</code> argument should be avoided.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nint myInt = 4;\nString myIntString = new Integer(myInt).toString(); // Noncompliant; creates &amp; discards an Integer object\nmyIntString = Integer.valueOf(myInt).toString(); // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nint myInt = 4;\nString myIntString = Integer.toString(myInt);\n</pre>	2	\N	Primitives should not be boxed just for "String" conversion	REMOVED	java	2016-10-11 14:20:58.104	2016-10-12 16:28:42.592	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
133	S1166	S1166	squid	<p>When handling a caught exception, the original exception's message and stack trace should be logged or passed forward.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n // Noncompliant - exception is lost\ntry { /* ... */ } catch (Exception e) { LOGGER.info("context"); }   \n\n// Noncompliant - exception is lost (only message is preserved)       \ntry { /* ... */ } catch (Exception e) { LOGGER.info(e.getMessage()); }   \n\n// Noncompliant - exception is lost \ntry { /* ... */ } catch (Exception e) { throw new RuntimeException("context"); }\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\ntry { /* ... */ } catch (Exception e) { LOGGER.info(e); }   \n\ntry { /* ... */ } catch (Exception e) { throw new RuntimeException(e); }\n\ntry {\n  /* ... */\n} catch (RuntimeException e) {\n  doSomething();\n  throw e;\n} catch (Exception e) {\n  // Conversion into unchecked exception is also allowed\n  throw new RuntimeException(e);\n}\n</pre>\n<h2>Exceptions</h2>\n\n<p><code>InterruptedException</code>, <code>NumberFormatException</code>, <code>ParseException</code> and <code>MalformedURLException</code> exceptions are arguably used to indicate nonexceptional outcomes.</p>\n<p>Because they are part of Java, developers have no choice but to deal with them. This rule does not verify that those particular exceptions are correctly handled.</p>\n<pre>\nint myInteger;\ntry {\n  myInteger = Integer.parseInt(myString);\n} catch (NumberFormatException e) {\n  // It is perfectly acceptable to not handle "e" here\n  myInteger = 0;\n}\n\n</pre>	3	\N	Exception handlers should preserve the original exception	REMOVED	java	2016-10-11 14:20:58.109	2016-10-12 16:28:41.606	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
134	S2254	S2254	squid	<p>According to the Oracle Java API, the <code>HttpServletRequest.getRequestedSessionId()</code> method:</p>\n<blockquote>\n<p>Returns the session ID specified by the client. This may not be the same as the ID of the current valid session for this request. If the client did not specify a session ID, this method returns null.</p>\n</blockquote>\n<p>The session ID it returns is either transmitted in a cookie or a URL parameter so by definition, nothing prevents the end-user from manually updating the value of this session ID in the HTTP request. </p>\n<p>Here is an example of a updated HTTP header:</p>\n<pre>\nGET /pageSomeWhere HTTP/1.1\nHost: webSite.com\nUser-Agent: Mozilla/5.0\nCookie: JSESSIONID=Hacked_Session_Value'''"&gt;\n</pre>\n<p>Due to the ability of the end-user to manually change the value, the session ID in the request should only be used by a servlet container (E.G. Tomcat or Jetty) to see if the value matches the ID of an an existing session. If it does not, the user should be considered  unauthenticated. Moreover, this session ID should never be logged to prevent hijacking of active sessions.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif(isActiveSession(request.getRequestedSessionId()) ){\n  ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A2-Broken_Authentication_and_Session_Management">OWASP Top Ten 2013 Category A2</a> - Broken Authentication and Session Management</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#SERVLET_SESSION_ID">Untrusted Session Cookie Value</a></li>\n</ul>	3	\N	"HttpServletRequest.getRequestedSessionId()" should not be used	REMOVED	java	2016-10-11 14:20:58.112	2016-10-12 16:28:41.608	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
135	S2133	S2133	squid	<p>Creating an object for the sole purpose of calling <code>getClass</code> on it is a waste of memory and cycles. Instead, simply use the class' <code>.class</code> property.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nMyObject myOb = new MyObject();  // Noncompliant\nClass c = myOb.getClass(); \n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nClass c = MyObject.class; \n</pre>	2	\N	Objects should not be created only to "getClass"	REMOVED	java	2016-10-11 14:20:58.114	2016-10-12 16:28:41.609	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
139	S00101	S00101	squid	<p>Sharing some naming conventions is a key point to make it possible for a team to efficiently collaborate. This rule allows to check that all class names match a provided regular expression.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With default provided regular expression:</p>\n<pre>\nclass my_class {...}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass MyClass {...}\n</pre>	1	\N	Class names should comply with a naming convention	REMOVED	java	2016-10-11 14:20:58.122	2016-10-12 16:28:41.594	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
138	S2258	S2258	squid	<p>By contract, the <code>NullCipher</code> class provides an "identity cipher" -- one that does not transform or encrypt the plaintext in any way. As a consequence, the ciphertext is identical to the plaintext. So this class should be used for testing, and never in production code.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nNullCipher nc=new NullCipher();\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/327.html">CWE-327</a>: Use of a Broken or Risky Cryptographic Algorithm</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#NULL_CIPHER">NullCipher Unsafe</a></li>\n</ul>	4	\N	"javax.crypto.NullCipher" should not be used for anything other than testing	REMOVED	java	2016-10-11 14:20:58.12	2016-10-12 16:28:41.604	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
136	S2257	S2257	squid	<p>The use of a non-standard algorithm is dangerous because a determined attacker may be able to break the algorithm and compromise whatever data has been protected. Standard algorithms like <code>SHA-256</code>, <code>SHA-384</code>, <code>SHA-512</code>, ... should be used instead.</p>\n<p>This rule tracks creation of <code>java.security.MessageDigest</code> subclasses.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nMyCryptographicAlgorithm extends MessageDigest {\n  ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/327.html">CWE-327</a> - Use of a Broken or Risky Cryptographic Algorithm</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure</li>\n<li> <a href="http://www.sans.org/top25-software-errors/">SANS Top 25</a> - Porous Defenses</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#CUSTOM_MESSAGE_DIGEST">MessageDigest is Custom</a></li>\n</ul>	4	\N	Only standard cryptographic algorithms should be used	REMOVED	java	2016-10-11 14:20:58.116	2016-10-12 16:28:41.61	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	1d	\N	\N	\N	f	HTML
140	S128	S128	squid	<p>When the execution is not explicitly terminated at the end of a switch case, it continues to execute the statements of the following case. While this is sometimes intentional, it often is a mistake which leads to unexpected behavior. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nswitch (myVariable) {\n  case 1:                              \n    foo();\n    break;\n  case 2:  // Both 'doSomething()' and 'doSomethingElse()' will be executed. Is it on purpose ?\n    doSomething();\n  default:                               \n    doSomethingElse();\n    break;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nswitch (myVariable) {\n  case 1:                              \n    foo();\n    break;\n  case 2: \n    doSomething();\n    break;\n  default:                               \n    doSomethingElse();\n    break;\n}\n</pre>\n<h2>Exceptions</h2>\n\n<p>This rule is relaxed in the following cases:</p>\n<pre>\nswitch (myVariable) {\n  case 0:                                // Empty case used to specify the same behavior for a group of cases.\n  case 1:                               \n    doSomething();\n    break;\n  case 2:                                // Use of return statement\n    return;\n  case 3:                                // Use of throw statement\n    throw new IllegalStateException();\n  case 4:                                // Use of continue statement\n    continue;\n  default:                               // For the last case, use of break statement is optional \n    doSomethingElse();\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 15.0 - The MISRA C <em>switch</em> syntax shall be used.</li>\n<li> MISRA C:2004, 15.2 - An unconditional break statement shall terminate every non-empty switch clause</li>\n<li> MISRA C++:2008, 6-4-3 - A switch statement shall be a well-formed switch statement.</li>\n<li> MISRA C++:2008, 6-4-5 - An unconditional throw or break statement shall terminate every non-empty switch-clause</li>\n<li> MISRA C:2012, 16.1 - All switch statements shall be well-formed</li>\n<li> MISRA C:2012, 16.3 - An unconditional break statement shall terminate every switch-clause</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/484.html">MITRE, CWE-484</a> - Omitted Break Statement in Switch</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/YIFLAQ">CERT, MSC17-C</a> - Finish every set of statements associated with a case label with a break statement</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/ZoFLAQ">CERT, MSC18-CPP</a> - Finish every set of statements associated with a case label with a break statement</li>\n</ul>	3	\N	Switch cases should end with an unconditional "break" statement	REMOVED	java	2016-10-11 14:20:58.125	2016-10-12 16:28:40.436	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
142	MethodCyclomaticComplexity	MethodCyclomaticComplexity	squid	<p>\n  The cyclomatic complexity of methods should not exceed a defined threshold.\n  Complex code can perform poorly and will in any case be difficult to understand and therefore to maintain.\n</p>	2	\N	Methods should not be too complex	REMOVED	java	2016-10-11 14:20:58.131	2016-10-12 16:28:41.56	\N	\N	\N	\N	\N	51	\N	LINEAR_OFFSET	\N	1min	\N	10min	\N	\N	\N	f	HTML
213	S2447	S2447	squid	<p>While <code>null</code> is technically a valid <code>Boolean</code> value, that fact, and the distinction between <code>Boolean</code> and <code>boolean</code> is easy to forget. So returning <code>null</code> from a <code>Boolean</code> method is likely to cause problems with callers' code.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic Boolean isUsable() {\n  // ...\n  return null;  // Noncompliant\n}\n</pre>	3	\N	Null should not be returned from a "Boolean" method	REMOVED	java	2016-10-11 14:20:58.276	2016-10-12 16:28:41.585	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
141	S00100	S00100	squid	<p>Sharing some naming conventions is a key point to make it possible for a team to efficiently collaborate. This rule allows to check that all method names match a provided regular expression.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With default provided regular expression: XXXXX</p>\n<pre>\npublic int DoSomething(){...}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic int doSomething(){...}\n</pre>\n<h2>Exceptions</h2>\n\n<p>Overriding methods are excluded. </p>\n<pre> \n@Override \npublic int Do_Something(){...} \n</pre>	1	\N	Method names should comply with a naming convention	REMOVED	java	2016-10-11 14:20:58.128	2016-10-12 16:28:41.595	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
143	S1150	S1150	squid	<p>From the official Oracle Javadoc:</p>\n<blockquote>\n<p>NOTE: The functionality of this Enumeration interface is duplicated by the Iterator interface. In addition, Iterator adds an optional remove operation, and has shorter method names. New implementations should consider using Iterator in preference to Enumeration.</p>\n</blockquote>\n<p>The following code:</p>\n<pre>\npublic class MyClass implements Enumeration {  // Non-Compliant\n  /* ... */\n}\n</pre>\n<p>should be refactored into:</p>\n<pre>\npublic class MyClass implements Iterator {     // Compliant\n  /* ... */\n}\n</pre>	2	\N	Enumeration should not be implemented	REMOVED	java	2016-10-11 14:20:58.133	2016-10-12 16:28:42.563	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
147	S1153	S1153	squid	<p>\nAppending <code>String.valueOf()</code> to a <code>String</code> decreases the code readability.\nThe argument passed to <code>String.valueOf()</code> should be directly appended instead.\n</p>\n\n<p>The following code:</p>\n\n<pre>\npublic void display(int i){\n  System.out.println("Output is " + String.valueOf(i));    // Non-Compliant\n}\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\npublic void display(int i){\n  System.out.println("Output is " + i);                    // Compliant\n}\n</pre>	1	\N	String.valueOf() should not be appended to a String	REMOVED	java	2016-10-11 14:20:58.144	2016-10-12 16:28:42.564	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
146	S134	S134	squid	<p>\nNested <code>if</code>, <code>for</code>, <code>while</code>, <code>switch</code> and <code>try</code> statements is a key ingredient for making what's known as "Spaghetti code".\nSuch code is hard to read, refactor and therefore maintain.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<p>The following code snippet illustrates this rule with the default threshold of 3.</p>\n\n<pre>\npublic void process() {\n  if (condition1) {                  // Compliant - depth = 1\n    /* ... */\n    if (condition2) {                // Compliant - depth = 2\n      /* ... */\n      for(int i = 0; i < 10; i++) {  // Compliant - depth = 3, not exceeding the limit\n        /* ... */\n        if (condition4) {            // Non-Compliant - depth = 4\n          if (condition5) {          // Depth = 5, exceeding the limit, but issues are only reported on depth = 4\n            /* ... */\n          }\n          return;\n        }\n      }\n    }\n  }\n}\n</pre>	2	\N	Control flow statements "if", "for", "while", "switch" and "try" should not be nested too deeply	REMOVED	java	2016-10-11 14:20:58.141	2016-10-12 16:28:41.528	\N	\N	\N	\N	\N	36	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
268	S00116	S00116	squid	<p>Sharing some naming conventions is a key point to make it possible for a team to efficiently collaborate. This rule allows to check that field names match a provided regular expression.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass MyClass {\n   private int my_field;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass MyClass {\n   private int myField;\n}\n</pre>	1	\N	Field names should comply with a naming convention	REMOVED	java	2016-10-11 14:20:58.398	2016-10-12 16:28:42.551	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
144	S1151	S1151	squid	<p>The <code>switch</code> statement should be used only to clearly define some new branches in the control flow. As soon as a <code>case</code> clause contains too many statements this highly decreases the readability of the overall control flow statement. In such case, the content of <code>case</code> clause should be extracted in a dedicated method.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>The following code snippet illustrates this rule with the default threshold of 5:</p>\n<pre>\nswitch (myVariable) {\n  case 0: // 6 lines till next case\n    methodCall1("");\n    methodCall2("");\n    methodCall3("");\n    methodCall4("");\n    break;\n  case 1:\n  ...\n}\n</pre> \n<h2>Compliant Solution</h2>\n\n<pre>\nswitch (myVariable) {\n  case 0:                  \n    doSomething()\n    break;\n  case 1:\n  ...\n}\n...\nprivate void doSomething(){\n    methodCall1("");\n    methodCall2("");\n    methodCall3("");\n    methodCall4("");\n}\n</pre>	2	\N	"switch case" clauses should not have too many lines	REMOVED	java	2016-10-11 14:20:58.135	2016-10-12 16:28:42.562	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
145	S1710	S1710	squid	<p>Before Java 8 if you needed to use multiple instances of the same annotation, they had to be wrapped in a container annotation. With Java 8, that's no longer necessary, allowing for cleaner, more readable code.</p>\n\n<h2>Noncompliant Code Sample</h2>\n<pre>\n@SomeAnnotations({\n@SomeAnnotation(..a..),\n@SomeAnnotation(..b..),\n@SomeAnnotation(..c..),\n})\npublic class SomeClass {\n...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\n@SomeAnnotation(..a..)\n@SomeAnnotation(..b..)\n@SomeAnnotation(..c..)\npublic class SomeClass {\n...\n}\n</pre>	2	\N	Annotation repetitions should not be wrapped	REMOVED	java	2016-10-11 14:20:58.139	2016-10-12 16:28:42.597	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
152	S1157	S1157	squid	<p>\nUsing <code>toLowerCase()</code> or <code>toUpperCase()</code> to make case insensitive comparisons is inefficient because it requires the creation of temporary, intermediate <code>String</code> objects.\n</p>\n\n<p>The following code:</p>\n\n<pre>\nboolean result1 = foo.toUpperCase().equals(bar);             // Non-Compliant\nboolean result2 = foo.equals(bar.toUpperCase());             // Non-Compliant\nboolean result3 = foo.toLowerCase().equals(bar.LowerCase()); // Non-Compliant\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\nboolean result = foo.equalsIgnoreCase(bar);                  // Compliant\n</pre>	2	\N	Case insensitive string comparisons should be made without intermediate upper or lower casing	REMOVED	java	2016-10-11 14:20:58.152	2016-10-12 16:28:42.601	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
149	LabelsShouldNotBeUsedCheck	LabelsShouldNotBeUsedCheck	squid	<p>\nLabels are not commonly used in Java, and many developers do not understand how they work.\nMoreover, their usage make the control flow harder to follow, which reduces the code's readability.\n</p>\n\n<p>\nThe following code:\n</p>\n\n<pre>\nint matrix[][] = {\n  {1, 2, 3},\n  {4, 5, 6},\n  {7, 8, 9}\n};\n\nouter: for (int row = 0; row < matrix.length; row++) {   // Non-Compliant\n  for (int col = 0; col < matrix[row].length; col++) {\n    if (col == row) {\n      continue outer;\n    }\n    System.out.println(matrix[row][col]);                // Prints the elements under the diagonal, i.e. 4, 7 and 8\n  }\n}\n</pre>\n\n<p>\nshould be refactored into:\n</p>\n\n<pre>\nfor (int row = 1; row < matrix.length; row++) {          // Compliant\n  for (int col = 0; col < row; col++) {\n    System.out.println(matrix[row][col]);                // Also prints 4, 7 and 8\n  }\n}\n</pre>	2	\N	Labels should not be used	REMOVED	java	2016-10-11 14:20:58.147	2016-10-12 16:28:41.592	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
159	S2272	S2272	squid	By contract, any implementation of the <code>java.util.Iterator.next()</code> method should throw a <code>NoSuchElementException</code> exception when the iteration has no more elements. Any other behavior when the iteration is done could lead to unexpected behavior for users of this <code>Iterator</code>. \n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyIterator implements Iterator&lt;String&gt;{\n  ...\n  public String next(){\n    if(!hasNext()){\n      return null;\n    }\n    ...\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class MyIterator implements Iterator&lt;String&gt;{\n  ...\n  public String next(){\n    if(!hasNext()){\n      throw new NoSuchElementException();\n    }\n    ...\n  }\n}\n</pre>	2	\N	"Iterator.next()" methods should throw "NoSuchElementException"	REMOVED	java	2016-10-11 14:20:58.165	2016-10-12 16:28:42.53	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
150	S1155	S1155	squid	<p>Using <code>Collection.size()</code> to test for emptiness works, but using <code>Collection.isEmpty()</code> makes the code more readable and can be more performant. The time complexity of any <code>isEmpty()</code> method implementation should be <code>O(1)</code> whereas some implementations of <code>size()</code> can be <code>O\\(n)</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif (myCollection.size() == 0) {  // Non-Compliant\n  /* ... */\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif (myCollection.isEmpty()) {    // Compliant\n  /* ... */\n}\n</pre>	2	\N	Collection.isEmpty() should be used to test for emptiness	REMOVED	java	2016-10-11 14:20:58.149	2016-10-12 16:28:42.599	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
151	S2122	S2122	squid	<p><code>java.util.concurrent.ScheduledThreadPoolExecutor</code>'s pool is sized with <code>corePoolSize</code>, so setting <code>corePoolSize</code> to zero means the executor will have no threads and run nothing.</p>\n<p>This rule detects instances where <code>corePoolSize</code> is set to zero, via either its setter or the object constructor.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void do(){\n\n  ScheduledThreadPoolExecutor stpe1 = new ScheduledThreadPoolExecutor(0); // Noncompliant\n\n  ScheduledThreadPoolExecutor stpe2 = new ScheduledThreadPoolExecutor(POOL_SIZE);\n  stpe2.setCorePoolSize(0);  // Noncompliant\n</pre>	4	\N	"ScheduledThreadPoolExecutor" should not have 0 core threads	REMOVED	java	2016-10-11 14:20:58.15	2016-10-12 16:28:42.6	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
173	S1067	S1067	squid	<p>The complexity of an expression is defined by the number of <code>&amp;&amp;</code>, <code>||</code> and <code>condition ? ifTrue : ifFalse</code> operators it contains.</p>\n<p>A single expression's complexity should not become too high to keep the code readable.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With the default threshold value 3</p>\n<pre>\nif (((condition1 &amp;&amp; condition2) || (condition3 &amp;&amp; condition4)) &amp;&amp; condition5) { ... } \n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif ( (myFirstCondition() || mySecondCondition()) &amp;&amp; myLastCondition()) { ... }     \n</pre>	2	\N	Expressions should not be too complex	REMOVED	java	2016-10-11 14:20:58.194	2016-10-12 16:28:40.396	\N	\N	\N	\N	\N	51	\N	LINEAR_OFFSET	\N	1min	\N	5min	\N	\N	\N	f	HTML
155	S2127	S2127	squid	<p><code>Double.longBitsToDouble</code> expects a 64-bit, <code>long</code> argument. Pass it a smaller value, such as an <code>int</code> and the mathematical conversion into a <code>double</code> simply won't work as anticipated because the layout of the bits will be interpreted incorrectly, as if a child were trying to use an adult's gloves.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nint i = 42;\ndouble d = Double.longBitsToDouble(i);  // Noncompliant\n</pre>	4	\N	"Double.longBitsToDouble" should not be used for "int"	REMOVED	java	2016-10-11 14:20:58.157	2016-10-12 16:28:42.594	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
154	S1158	S1158	squid	<p>\nCreating temporary primitive wrapper objects only for <code>String</code> conversion is inefficient.\nInstead, the static <code>toString()</code> method of those primitive wrapper classes should be used.\n</p>\n\n<p>For example, the following code:</p>\n\n<pre>\nnew Integer(myInteger).toString();  // Non-Compliant\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\nInteger.toString(myInteger);      // Compliant\n</pre>	2	\N	Primitive wrappers should not be instantiated only to perform a "toString" conversion	REMOVED	java	2016-10-11 14:20:58.156	2016-10-12 16:28:42.595	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
153	S2245	S2245	squid	<p>When software generates predictable values in a context requiring unpredictability, it may be possible for an attacker to guess the next value that will be generated, and use this guess to impersonate another user or access sensitive information.</p>\n<p>As the <code>java.util.Random</code> class relies on a pseudorandom number generator, this class and relating <code>java.lang.Math.random()</code> method should not be used for security-critical applications or for protecting sensitive data. In such context, the <code>java.security.SecureRandom</code> class which relies on a cryptographically strong random number generator (RNG) should be used in place.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nRandom random = new Random();\nbyte bytes[] = new byte[20];\nrandom.nextBytes(bytes);\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/338.html">MITRE, CWE-338</a> - Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/330.html">MITRE, CWE-330</a> - Use of Insufficiently Random Values</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/326.html">MITRE, CWE-326</a> - Inadequate Encryption Strength</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/310">MITRE, CWE-310</a> - Cryptographic Issues</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/display/java/MSC02-J.+Generate+strong+random+numbers">CERT, MSC02-J</a> - Generate strong random numbers</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#PREDICTABLE_RANDOM">Predictable Pseudo Random Number Generator</a></li>\n</ul>	3	\N	Pseudorandom number generators (PRNGs) should not be used in secure contexts	REMOVED	java	2016-10-11 14:20:58.154	2016-10-12 16:28:42.602	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
158	S2273	S2273	squid	<p>By contract, the method <code>Object.wait(...)</code>, <code>Object.notify()</code> and <code>Object.notifyAll()</code> should be called by a thread that is the owner of the object's monitor. If this is not the case an <code>IllegalMonitorStateException</code> exception is thrown. This rule reinforces this constraint by making it mandatory to call one of these methods only inside a <code>synchronized</code> method or statement.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nprivate void removeElement() {\n  while (!suitableCondition()){\n    obj.wait();\n  }\n  ... // Perform removal\n}\n</pre>\n\nor\n\n<pre>\nprivate void removeElement() {\n  while (!suitableCondition()){\n    wait();\n  }\n  ... // Perform removal\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nprivate void removeElement() {\n  synchronized(obj) {\n    while (!suitableCondition()){\n      obj.wait();\n    }\n    ... // Perform removal\n  }\n}\n</pre>\n\nor\n\n<pre>\nprivate synchronized void removeElement() {\n  while (!suitableCondition()){\n    wait();\n  }\n  ... // Perform removal\n}\n</pre>	3	\N	"wait(...)", "notify()" and "notifyAll()" methods should only be called when a lock is obviously held on an object	REMOVED	java	2016-10-11 14:20:58.163	2016-10-12 16:28:42.528	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
157	S1182	S1182	squid	<p><code>Cloneable</code> is the marker <code>Interface</code> that indicates that <code>clone()</code> may be called on an object. Overriding <code>clone()</code> without implementing <code>Cloneable</code> can be useful if you want to control how subclasses clone themselves, but otherwise, it's probably a mistake.</p>\n<p>The usual convention for <code>Object.clone()</code> according to Oracle's Javadoc is:</p>\n<ol>\n<li> <code>x.clone() != x</code></li>\n<li> <code>x.clone().getClass() == x.getClass()</code></li>\n<li> <code>x.clone().equals\\(x\\)</code></li>\n</ol>\n<p>Obtaining the object that will be returned by calling <code>super.clone()</code> helps to satisfy those invariants:</p>\n<ol>\n<li> <code>super.clone()</code> returns a new object instance</li>\n<li> <code>super.clone()</code> returns an object of the same type as the one <code>clone()</code> was called on</li>\n<li> <code>Object.clone()</code> performs a shallow copy of the object's state</li>\n</ol>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass BaseClass {  // Noncompliant; should implement Cloneable\n  @Override\n  public Object clone() throws CloneNotSupportedException {    // Noncompliant; should return the super.clone() instance\n    return new BaseClass();\n  }\n}\n\nclass DerivedClass extends BaseClass implements Cloneable {\n  /* Does not override clone() */\n\n  public void sayHello() {\n    System.out.println("Hello, world!");\n  }\n}\n\nclass Application {\n  public static void main(String[] args) throws Exception {\n    DerivedClass instance = new DerivedClass();\n    ((DerivedClass) instance.clone()).sayHello();              // Throws a ClassCastException because invariant #2 is violated\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass BaseClass implements Cloneable {\n  @Override\n  public Object clone() throws CloneNotSupportedException {    // Compliant\n    return super.clone();\n  }\n}\n\nclass DerivedClass extends BaseClass implements Cloneable {\n  /* Does not override clone() */\n\n  public void sayHello() {\n    System.out.println("Hello, world!");\n  }\n}\n\nclass Application {\n  public static void main(String[] args) throws Exception {\n    DerivedClass instance = new DerivedClass();\n    ((DerivedClass) instance.clone()).sayHello();              // Displays "Hello, world!" as expected. Invariant #2 is satisfied\n  }\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/580.html">MITRE, CWE-580</a> - clone() Method Without super.clone()</li>\n</ul>	2	\N	Classes that override "clone" should be "Cloneable" and call "super.clone()"	REMOVED	java	2016-10-11 14:20:58.161	2016-10-12 16:28:42.54	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
156	S1181	S1181	squid	<p><code>Throwable</code> is the superclass of all errors and exceptions in Java.</p>\n<p><code>Error</code> is the superclass of all errors, which are not meant to be caught by applications.</p>\n<p>Catching either <code>Throwable</code> or <code>Error</code> will also catch <code>OutOfMemoryError</code> and <code>InternalError</code>, from which an application should not attempt to recover.</p>\n<p>Only <code>Exception</code> and its subclasses should be caught. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\ntry { /* ... */ } catch (Throwable t) { /* ... */ }  \ntry { /* ... */ } catch (Error e) { /* ... */ }   \n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\ntry { /* ... */ } catch (Exception e) { /* ... */ }\ntry { /* ... */ } catch (RuntimeException e) { /* ... */ }\ntry { /* ... */ } catch (MyException e) { /* ... */ }\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/396.html">MITRE, CWE-396</a> - Declaration of Catch for Generic Exception</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/BoB3AQ">CERT, ERR07-J</a> - Do not throw RuntimeException, Exception, or Throwable</li>\n</ul>	4	\N	Throwable and Error should not be caught	REMOVED	java	2016-10-11 14:20:58.159	2016-10-12 16:28:42.542	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
162	UndocumentedApi	UndocumentedApi	squid	<p>Try to imagine using the standard Java API (Collections, JDBC, IO, ...) without Javadoc. It would be a nightmare, because Javadoc is the only way to understand of the contract of the API. Documenting an API with Javadoc increases the productivity of the developers consuming it.</p>\n<p>The following Javadoc elements are required:</p>\n<ul>\n<li> Parameters, using <code>@param parameterName</code>.</li>\n<li> Method return values, using <code>@return</code>.</li>\n<li> Generic types, using <code>@param &amp;lt;T&amp;gt;</code>.</li>\n</ul>\n<p>The following public methods and constructors are not taken into account by this rule:</p>\n<ul>\n<li> Getters and setters.</li>\n<li> Methods with @Override annotation.</li>\n<li> Empty constructors.</li>\n<li> Static constants.</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n/**\n  * This is a Javadoc comment\n  */\npublic class MyClass&lt;T&gt; implements Runnable {    // Noncompliant - missing '@param &lt;T&gt;'\n\n  public static final DEFAULT_STATUS = 0;    // Compliant - static constant\n  private int status;                           // Compliant - not public\n\n  public String message;                  // Noncompliant\n\n  public MyClass() {                         // Noncompliant - missing documentation\n    this.status = DEFAULT_STATUS;\n  }\n\n  public void setStatus(int status) {  // Compliant - setter\n    this.status = status;\n  }\n\n  @Override\n  public void run() {                          // Compliant - has @Override annotation\n  }\n\n  protected void doSomething() {    // Compliant - not public\n  }\n\n  public void doSomething2(int value) {  // Noncompliant\n  }\n\n  public int doSomething3(int value) {  // Noncompliant\n    return value;\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\n/**\n  * This is a Javadoc comment\n  * @param &lt;T&gt; ...\n  */\npublic class MyClass&amp;lt;T&amp;gt; implements Runnable {\n\n  public static final DEFAULT_STATUS = 0;\n  private int status;\n\n  /**\n    * This is a Javadoc comment\n    */\n  public String message;\n\n  /**\n   * Class comment...\n   */\n  public MyClass() {\n    this.status = DEFAULT_STATUS;\n  }\n\n  public void setStatus(int status) {\n    this.status = status;\n  }\n\n  @Override\n  public void run() {\n  }\n\n  protected void doSomething() {\n  }\n\n  /**\n    * @param value ...\n    */\n  public void doSomething(int value) {\n\n  /**\n    *  {@inheritDoc}\n    */\n  public int doSomething(int value) {\n    return value;\n  }\n}\n</pre>	1	\N	Public types, methods and fields (API) should be documented with Javadoc	REMOVED	java	2016-10-11 14:20:58.17	2016-10-12 16:28:41.536	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
161	HiddenFieldCheck	HiddenFieldCheck	squid	<p>Shadowing fields with a local variable or with a method parameter is a bad practice reducing code readability: It makes it confusing to know whether the field or the variable is and should be accessed.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass Foo {\n  public int myField;\n\n  public void doSomething() {\n    int myField = 0;\n    ...\n  }\n\n  public void doSomethingElse(int myField) {\n    ...\n  }\n}\n</pre>\n<h2>Exceptions</h2>\n\n<p>Constructors and setters are exceptions; it is common practice to name arguments for the fields the values will be assigned to. Static methods are also excepted.</p>\n<pre>\nclass Foo {\n  public int myField;\n\n  public Foo(int myField) {\n    this.myField = myField;\n  }\n\n  public static Foo build(int myField) {\n    ...\n  }\n\n  public void setMyField(int myField){\n    this.myField = myField;\n  } \n}\n</pre>	2	\N	Local variables should not shadow class fields	REMOVED	java	2016-10-11 14:20:58.168	2016-10-12 16:28:41.541	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
160	S2151	S2151	squid	<p>Running finalizers on JVM exit is disabled by default. It can be enabled with <code>System.runFinalizersOnExit</code> and <code>Runtime.runFinalizersOnExit</code>, but both methods are deprecated because they are are inherently unsafe. </p>\n<p>According to the Oracle Javadoc:</p>\n<blockquote>\n<p>It may result in finalizers being called on live objects while other threads are concurrently manipulating those objects, resulting in erratic behavior or deadlock.</p>\n</blockquote>\n<p>If you really want to be execute something when the virtual machine begins its shutdown sequence, you should attach a shutdown hook. </p>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic static void main(String [] args) {\n  Runtime.addShutdownHook(new Runnable() {\n    public void run(){\n      doSomething();\n    }\n  });\n  //...\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/H4cbAQ">CERT, MET12-J</a> - Do not use finalizers</li>\n</ul>	4	\N	"runFinalizersOnExit" should not be called	REMOVED	java	2016-10-11 14:20:58.167	2016-10-12 16:28:42.531	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
174	S1188	S1188	squid	<p>\nAnonymous classes and lambdas (with Java 8) are a very convenient and compact way to inject a behavior without having to create a dedicated class. But those anonymous inner classes and lambdas should be used only if the behavior to be injected can be defined in a few lines of code, otherwise the source code can quickly become unreadable.\n</p>	2	\N	Lambdas and anonymous classes should not have too many lines	REMOVED	java	2016-10-11 14:20:58.197	2016-10-12 16:28:40.397	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
164	S2275	S2275	squid	<p>Because <code>printf</code>-style format strings are interpreted at runtime, rather than validated by the Java compiler, they can contain errors that lead to unexpected behavior or runtime errors. This rule statically validates the good behavior of <code>printf</code>-style formats when calling the <code>format(...)</code> methods of <code>java.util.Formatter</code>, <code>java.lang.String</code>, <code>java.io.PrintStream</code> and <code>java.io.PrintWriter</code> classes and the <code>printf(...)</code> methods of <code>java.io.PrintStream</code> or <code>java.io.PrintWriter</code> classes. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nString.format("The value of my integer is %d", "Hello World");  // Noncompliant; an 'int' is expected rather than a String\nString.format("First {0} and then {1}", "foo", "bar");  //Noncompliant. Looks like there is a confusion with the use of {{java.text.MessageFormat}}, parameters "foo" and "bar" will be simply ignored here\nString.format("Duke's Birthday year is %tX", c);  //Noncompliant; X is not a supported time conversion character\nString.format("Display %3$d and then %d", 1, 2, 3);   //Noncompliant; the second argument '2' is unused\nString.format("Too many arguments %d and %d", 1, 2, 3);  //Noncompliant; the third argument '3' is unused\nString.format("Not enough arguments %d and %d", 1);  //Noncompliant; the second argument is missing\nString.format("First Line\\n");   //Noncompliant; %n should be used in place of \\n to produce the platform-specific line separator\nString.format("%&lt; is equals to %d", 2);   //Noncompliant; the argument index '&lt;' refers to the previous format specifier but there isn't one\nString.format("Is myObject null ? %b", myObject);   //Noncompliant; when a non-boolean argument is formatted with %b, it prints true for any nonnull value, and false for null. Even if intended, this is misleading. It's better to directly inject the boolean value (myObject == null in this case)\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nString.format("The value of my integer is %d", 3);\nString.format("First %s and then %s", "foo", "bar");\nString.format("Duke's Birthday year is %tY", c);\nString.format("Display %2$d and then %d", 1, 3);\nString.format("Too many arguments %d %d", 1, 2);\nString.format("Not enough arguments %d and %d", 1, 2);\nString.format("First Line%n");\nString.format("%d is equals to %&lt;", 2);\nString.format("Is myObject null ? %b", myObject == null);\n</pre>	3	\N	Printf-style format strings should not lead to unexpected behavior at runtime	REMOVED	java	2016-10-11 14:20:58.175	2016-10-12 16:28:42.532	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
165	S2154	S2154	squid	<p>If wrapped primitive values (e.g. <code>Integers</code> and <code>Floats</code>) are used in a ternary operator (e.g. <code>a?b:c</code>), both values will be unboxed and coerced to a common type, potentially leading to unexpected results. To avoid this, add an explicit cast to a compatible type.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nInteger i = 123456789;\nFloat f = 1.0f;\nNumber n = condition ? i : f;  // Noncompliant; i is coerced to float. n = 1.23456792E8\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\nInteger i = 123456789;\nFloat f = 1.0f;\nNumber n = condition ? (Number) i : f;  // n = 123456789\n</pre>	3	\N	Dissimilar primitive wrappers should not be used with the ternary operator without explicit casting	REMOVED	java	2016-10-11 14:20:58.177	2016-10-12 16:28:42.534	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
163	S1185	S1185	squid	<p>Overriding a method just to call the same method from the super class without performing any other actions is useless and misleading. The only time this is justified is in <code>final</code> overriding methods, where the effect is to lock in the parent class behavior. This rule ignores such overrides of <code>equals</code>, <code>hashCode</code> and <code>toString</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void doSomething() {                \n  super.doSomething();\n}\n\n@Override\npublic boolean isLegal(Action action) {      \n  return super.isLegal(action);\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\n@Override\npublic boolean isLegal(Action action) {         // Compliant - not simply forwarding the call\n  return super.isLegal(new Action(/* ... */));\n}\n\n@Id\n@Override\npublic int getId() {                            // Compliant - there is annotation different from @Override\n  return super.getId();\n}\n</pre>	1	\N	Overriding methods should do more than simply call the same method in the super class	REMOVED	java	2016-10-11 14:20:58.173	2016-10-12 16:28:42.538	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
166	S1186	S1186	squid	<p>There are several reasons for a method not to have a method body:</p>\n<ul>\n<li> It is an unintentional omission, and should be fixed to prevent an unexpected behavior in production.</li>\n<li> It is not yet, or never will be, supported. In this case an <code>[UnsupportedOperationException|NotSupportedException|IllegalOperationError]</code> should be thrown.</li>\n<li> The method is an intentionally-blank override. In this case a nested comment should explain the reason for the blank override.</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void doSomething() {\n}\n\npublic void doSomethingElse() {\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\n@Override\npublic void doSomething() {\n  // Do nothing because of X and Y.\n}\n\n@Override\npublic void doSomethingElse() {\n  throw new UnsupportedOperationException();\n}\n</pre>\n<h2>Exceptions</h2>\n\n<p>An abstract class' may have empty methods, in order to provide default implementations for child classes.</p>\n<pre>\npublic abstract class Animal {\n  void speak() {\n  }\n}\n</pre>	2	\N	Methods should not be empty	REMOVED	java	2016-10-11 14:20:58.179	2016-10-12 16:28:42.536	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
167	S1065	S1065	squid	<p>If a label is declared but not used in the program, it can be considered as dead code and should therefore be removed.</p>\n<p>This will improve maintainability as developers will not wonder what this label is used for.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n&amp;lt;&amp;lt;foo&amp;gt;&amp;gt; -- Non-Compliant\nBEGIN\n  DBMS_OUTPUT.PUT_LINE('Hello, world!');\nEND;\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\n-- Compliant\nBEGIN\n  DBMS_OUTPUT.PUT_LINE('Hello, world!');\nEND;\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2012, 2.6 - A function should not contain unused label declarations</li>\n</ul>	2	\N	Unused labels should be removed	REMOVED	java	2016-10-11 14:20:58.181	2016-10-12 16:28:42.537	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
168	S2274	S2274	squid	<p>According to the Java <code>Condition</code> interface documentation:</p>\n<blockquote>\n<p>When waiting upon a <code>Condition</code>, a "spurious wakeup" is permitted to occur, in general, as a concession to the underlying platform semantics. This has little practical impact on most application programs as a Condition should always be waited upon in a loop, testing the state predicate that is being waited for. An implementation is free to remove the possibility of spurious wakeups but it is recommended that applications programmers always assume that they can occur and so always wait in a loop.</p>\n</blockquote>\n<p>The same advice is also found for the <code>Object.wait(...)</code> method:</p>\n<blockquote>\n<p>waits should always occur in loops, like this one:</p>\n</blockquote>\n<pre>\nsynchronized (obj) {\n  while (&lt;condition does not hold&gt;){\n    obj.wait(timeout); \n  }\n   ... // Perform action appropriate to condition\n}\n</pre> \n</blockquote>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nsynchronized (obj) {\n  if (!suitableCondition()){\n    obj.wait(timeout);   //the thread can wakeup whereas the condition is still false\n  }\n   ... // Perform action appropriate to condition\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nsynchronized (obj) {\n  while (!suitableCondition()){\n    obj.wait(timeout);\n  }\n   ... // Perform action appropriate to condition\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/display/java/THI03-J.+Always+invoke+wait%28%29+and+await%28%29+methods+inside+a+loop">CERT THI03-J</a> - Always invoke wait() and await() methods inside a loop</li>\n</ul>	3	\N	"Object.wait(...)" and "Condition.await(...)" should always be called inside a "while" loop	REMOVED	java	2016-10-11 14:20:58.183	2016-10-12 16:28:42.539	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
171	S2277	S2277	squid	<p>Without OAEP in RSA encryption, it takes less work for an attacker to decrypt the data or infer patterns from the ciphertext. This rule logs an issue as soon as a literal value starts with <code>RSA/NONE</code>. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nCipher rsa = javax.crypto.Cipher.getInstance("RSA/NONE/NoPadding");\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nCipher rsa = javax.crypto.Cipher.getInstance("RSA/ECB/OAEPWithSHA-1AndMGF1Padding");\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/780.html">MITRE CWE-780</a> - Use of RSA Algorithm without OAEP</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/327.html">MITRE CWE-327</a>: Use of a Broken or Risky Cryptographic Algorithm</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#RSA_NO_PADDING">RSA NoPadding Unsafe</a></li>\n</ul>	3	\N	Cryptographic RSA algorithms should always incorporate OAEP (Optimal Asymmetric Encryption Padding)	REMOVED	java	2016-10-11 14:20:58.19	2016-10-12 16:28:40.398	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
172	S2156	S2156	squid	The difference between <code>private</code> and <code>protected</code> visibility is that child classes can see and use <code>protected</code> members, but they cannot see <code>private</code> ones. Since a <code>final</code> class will have no children, marking the members of a <code>final</code> class <code>protected</code> is confusingly pointless.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic final class MyFinalClass {\n\n  protected String name = "Fred";  // Noncompliant\n  protected void setName(String name) {  // Noncompliant\n    // ...\n  }\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic final class MyFinalClass {\n\n  private String name = "Fred";\n  public void setName(String name) {\n    // ...\n  }\n</pre>	2	\N	"final" classes should not have "protected" members	REMOVED	java	2016-10-11 14:20:58.192	2016-10-12 16:28:40.399	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
170	S1066	S1066	squid	<p>Merging collapsible <code>if</code> statements increases the code's readability.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif (file != null) {\n  if (file.isFile() || file.isDirectory()) {\n    /* ... */\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif (file != null && isFileOrDirectory(file)) { \n  /* ... */\n}\n\nprivate static boolean isFileOrDirectory(File file) {\n  return file.isFile() || file.isDirectory();\n}\n</pre>	2	\N	Collapsible "if" statements should be merged	REMOVED	java	2016-10-11 14:20:58.188	2016-10-12 16:28:40.4	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
184	S1172	S1172	squid	<p>Unused parameters are misleading. Whatever the value passed to such parameters is, the behavior will be the same.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nvoid doSomething(int a, int b) {     // "b" is unused\n  compute(a);\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nvoid doSomething(int a) { \n  compute(a);\n}\n</pre>\n<h2>Exceptions</h2>\n\n<p>Override and implementation methods are excluded, as are methods that are intended to be overridden.</p>\n<pre>\n@override\nvoid doSomething(int a, int b) {     // no issue reported on b\n  compute(a);\n}\n\npublic void foo(String s) {\n  // designed to be extended but noop in standard case\n}\n\nprotected void bar(String s) {\n  //open-closed principle\n}\n\npublic void qix(String s) {\n  throw new UnsupportedOperationException("This method should be implemented in subclasses");\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C++:2008, 0-1-11</li>\n<li> MISRA C:2012, 2.7</li>\n</ul>	2	\N	Unused method parameters should be removed	REMOVED	java	2016-10-11 14:20:58.217	2016-10-12 16:28:41.599	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
175	S2276	S2276	squid	<p>If <code>Thread.sleep(...)</code> is called when the current thread holds a lock, it could lead to performance, and scalability issues, or even worse to deadlocks because the execution of the thread holding the lock is frozen. It's better to call <code>wait(...)</code> on the monitor object to temporarily release the lock and allow other threads to run.</p>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void doSomething(){\n  synchronized(monitor) {\n    while(notReady()){\n      monitor.wait(200);\n    }\n    process();\n  }\n  ...\n}\n</pre>	3	\N	"wait(...)" should be used instead of "Thread.sleep(...)" when a lock is held	REMOVED	java	2016-10-11 14:20:58.2	2016-10-12 16:28:40.401	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
176	S1068	S1068	squid	<p>\nIf a private field is declared but not used in the program, it can be considered dead code and should therefore be removed.\nThis will improve maintainability because developers will not wonder what the variable is used for.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyClass {\n  private int foo = 42;\n\n  public int compute(int a) {\n    return a * 42;\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class MyClass {\n  public int compute(int a) {\n    return a * 42;\n  }\n}\n</pre>\n\n<h2>Exceptions</h2>\n\n<p>\nThe Java serialization runtime associates with each serializable class a version number, called <code>serialVersionUID</code>, which is used during deserialization to verify that the sender and receiver of a serialized object have loaded classes for that object that are compatible with respect to serialization.\nA serializable class can declare its own <code>serialVersionUID</code> explicitly by declaring a field named <code>serialVersionUID</code> that must be static, final, and of type long. By definition those <code>serialVersionUID</code> fields should not be reported by this rule:\n</p>\n\n<pre>\npublic class MyClass implements java.io.Serializable {\n  private static final long serialVersionUID = 42L;\n}\n</pre>	2	\N	Unused private fields should be removed	REMOVED	java	2016-10-11 14:20:58.202	2016-10-12 16:28:40.402	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
178	S2278	S2278	squid	<p>According to the US National Institute of Standards and Technology (NIST), the Data Encryption Standard (DES) is no longer considered secure:</p>\n<blockquote>\n<p>Adopted in 1977 for federal agencies to use in protecting sensitive, unclassified information, the DES is being withdrawn because it no longer provides the security that is needed to protect federal government information.</p>\n<p>Federal agencies are encouraged to use the Advanced Encryption Standard, a faster and stronger algorithm approved as FIPS 197 in 2001.</p>\n</blockquote>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nCipher c = Cipher.getInstance("DESede/ECB/PKCS5Padding");\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nCipher c = Cipher.getInstance("AES/GCM/NoPadding");\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/326.html">MITRE CWE-326</a> - Inadequate Encryption Strength</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#DES_USAGE">DES / DESede Unsafe</a></li>\n</ul>	3	\N	DES (Data Encryption Standard) and DESede (3DES) should not be used	REMOVED	java	2016-10-11 14:20:58.205	2016-10-12 16:28:40.404	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
179	S2157	S2157	squid	<p>Simply implementing <code>Cloneable</code>  without also overriding <code>Object.clone()</code> does not necessarily make the class cloneable. While the <code>Cloneable</code> interface does not include a <code>clone</code> method, it is required by convention, and ensures true cloneability. Otherwise the default JVM <code>clone</code> will be used, which copies primitive values and object references from the source to the target. I.e. without overriding <code>clone</code>, any cloned instances will potentially share members with the source instance.</p>\n\n<p>Removing the <code>Cloneable</code> implementation and providing a good copy constructor is another viable (some say preferable) way of allowing a class to be copied.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nclass Team implements Cloneable {  // Noncompliant\n  private Person coach;\n  private List&lt;Person&gt; players;\n  public void addPlayer(Person p) {...}\n  public Person getCoach() {...}\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass Team implements Cloneable {\n  private Person coach;\n  private List&lt;Person&gt; players;\n  public void addPlayer(Person p) { ... }\n  public Person getCoach() { ... }\n\n  @Override\n  public Object clone() { \n    Team clone = (Team) super.clone();\n    //...\n  }\n}\n</pre>	3	\N	"Cloneables" should implement "clone"	REMOVED	java	2016-10-11 14:20:58.207	2016-10-12 16:28:40.405	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
181	S2039	S2039	squid	<p>Failing to explicitly declare the visibility of a member variable could result it in having a visibility you don't expect, and potentially leave it open to unexpected modification by other classes.</p>\n\n<h2>Noncompliant Code Sample</h2>\n<pre>\nclass Ball {\n  String color="red";  // Noncompliant\n}\nenum A {\n B;\n int a;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass Ball {\n  private String color="red";  // Compliant\n}\nenum A {\n B;\n private int a;\n}\n</pre>	2	\N	Member variable visibility should be specified	REMOVED	java	2016-10-11 14:20:58.211	2016-10-12 16:28:40.394	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
180	S1862	S1862	squid	<p>A chain of <code>if</code>/<code>else if</code> statements is evaluated from top to bottom. At most, only one branch will be executed: the first one with a condition that evaluates to <code>true</code>. </p>\n<p>Therefore, duplicating a condition automatically leads to dead code. Usually, this is due to a copy/paste error. At best, it's simply dead code and at worst, it's a bug that is likely to induce further bugs as the code is maintained, and obviously it could lead to unexpected behavior. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif (param == 1)\n  openWindow();\nelse if (param == 2)\n  closeWindow();\nelse if (param == 1)  // Noncompliant\n  moveWindowToTheBackground();\n}\n\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif (param == 1)\n  openWindow();\nelse if (param == 2)\n  closeWindow();\nelse if (param == 3)\n  moveWindowToTheBackground();\n}\n\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/NYA5">CERT, MSC12-C</a> - Detect and remove code that has no effect</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/SIIyAQ">CERT, MSC12-CPP</a> - Detect and remove code that has no effect</li>\n</ul>	3	\N	Conditions in related "if/else if" statements should not have the same condition	REMOVED	java	2016-10-11 14:20:58.209	2016-10-12 16:28:40.395	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
183	S1171	S1171	squid	<p>Non-static initializers are rarely used, and can be confusing for most developers.</p>\n<p>When possible, they should be refactored into standard constructors or field initializers.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass MyClass {\n  private static final Map&lt;String, String&gt; MY_MAP = new HashMap&lt;String, String&gt;() {\n\n    // Non-Compliant - HashMap should be extended only to add behavior, not for initialization\n    {\n      put("a", "b");\n    }\n\n  };\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass MyClass {\n  private static final Map&lt;String, String&gt; MY_MAP = new HashMap&lt;String, String&gt;();\n\n  static {\n    MY_MAP.put("a", "b");\n  }\n}\n</pre>\n<p>or using Guava:</p>\n<pre>\nclass MyClass {\n  // Compliant\n  private static final Map&lt;String, String&gt; MY_MAP = ImmutableMap.of("a", "b");\n}\n</pre>	2	\N	Only static class initializers should be used	REMOVED	java	2016-10-11 14:20:58.215	2016-10-12 16:28:41.602	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
187	ClassCyclomaticComplexity	ClassCyclomaticComplexity	squid	<p>The Cyclomatic Complexity is measured by the number of <code>&amp;&amp;</code> and <code>||</code> operators and <code>if</code>, <code>while</code>, <code>do</code>, <code>for</code>, <code>?:</code>, <code>catch</code>, <code>switch</code>, <code>case</code>, <code>return</code> and <code>throw</code> statements in the body of a class plus one for each constructor, method, static initializer, or instance initializer in the class. The last return statement in method, if exists, is not taken into account.</p>\n<p>Even when the Cyclomatic Complexity of a class is very high, this complexity might be well distributed among all methods. Nevertheless, most of the time, a very complex class is a class which breaks the Single Responsibility Principle and which should be re-factored to be split in several classes.</p>	2	\N	Classes should not be too complex	REMOVED	java	2016-10-11 14:20:58.223	2016-10-12 16:28:42.579	\N	\N	\N	\N	\N	16	\N	LINEAR_OFFSET	\N	1min	\N	10min	\N	\N	\N	f	HTML
185	S1294	S1294	squid	<p>Since arrays do not override <code>Object.equals()</code>, calling equals on two arrays is the same as comparing their addresses. This means that <code>array1.equals(array2)</code> is equivalent to <code>array1==array2</code>. </p>\n<p>However, some developers might expect <code>Array.equals(Object obj)</code> to do more than a simple memory address comparison, comparing for instance the size and content of the two arrays. To prevent such a misunderstanding, the '==' operator or <code>Arrays.equals(array1, array2)</code> must always be used in place of the <code>Array.equals(Object obj)</code> method.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif(array1.equals(array2)){...}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif(Arrays.equals(array1, array2)){...}\n</pre>\n<p>or</p>\n<pre>\nif(array1 == array2){...}\n</pre>	3	\N	The Array.equals(Object obj) method should not be used	REMOVED	java	2016-10-11 14:20:58.219	2016-10-12 16:28:41.598	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
186	S1609	S1609	squid	<p>A Single Abstract Method (SAM) interface is a Java interface containing only one method. The Java API is full of SAM interfaces, such as java.lang.Runnable, java.awt.event.ActionListener, java.util.Comparator and java.util.concurrent.Callable. SAM interfaces have a special place in Java 8 because they can be implemented using Lambda expressions or Method references.</p>\n\n<p>Using <code>@FunctionalInterface</code> forces a compile break when an additional, non-overriding abstract method is added to a SAM, which would break the use of Lambda implementations.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n  public interface Changeable&lt;T&gt; {\n    public void change(T o);\n  }\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\n  @FunctionalInterface\n  public interface Changeable&lt;T&gt; {\n    public void change(T o);\n  }\n</pre>	2	\N	@FunctionalInterface annotation should be used to flag Single Abstract Method interfaces	REMOVED	java	2016-10-11 14:20:58.221	2016-10-12 16:28:41.616	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
189	S1612	S1612	squid	<p>Method/constructor references are more compact and readable than using lambdas, and are therefore preferred.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n  List<Integer> list = new ArrayList<Integer>();\n  list.add(0);\n  list.add(1);\n  list.add(2);\n\n    list.forEach(n -> { System.out.println(n); });\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\n  List<Integer> list = new ArrayList<Integer>();\n  list.add(0);\n  list.add(1);\n  list.add(2);\n\n  list.forEach(System.out::println);\n</pre>	1	\N	Replace lambdas with method references when possible	REMOVED	java	2016-10-11 14:20:58.228	2016-10-12 16:28:42.545	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
188	S1611	S1611	squid	<p>There are two possible syntaxes for a lambda having only one input parameter with an inferred type: with and without parentheses around that single parameter. The simpler syntax, without parentheses, is more compact and readable than the one with parentheses, and is therefore preferred.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n(x) -> x * 2\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nx -> x * 2\n</pre>	1	\N	Parentheses should be removed from a single lambda input parameter when its type is inferred	REMOVED	java	2016-10-11 14:20:58.226	2016-10-12 16:28:42.547	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
191	S1175	S1175	squid	<p><code>Object.finalize()</code> is called by the Garbage Collector sometime after the object became unreferenced.</p>\n<p>Overloading this method is misleading:</p>\n<ul>\n<li> The overload will not be called by the Garbage Collector.</li>\n<li> Users are not expected to call <code>Object.finalize()</code> and will get confused.</li>\n</ul>\n<p>Another name should be picked for the method.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void finalize(int someParameter) {        // Non-Compliant\n  /* ... */\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void someBetterName(int someParameter) {  // Compliant\n  /* ... */\n}\n</pre>	2	\N	Object.finalize() should not be overloaded (by adding method parameters)	REMOVED	java	2016-10-11 14:20:58.231	2016-10-12 16:28:41.6	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
190	S1174	S1174	squid	<p>The contract of the <code>Object.finalize()</code> method is clear: only the Garbage Collector is supposed to call this method.</p>\n<p>Making this method public is misleading, because it implies that any caller can use it.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyClass {\n\n  @Override\n  public void finalize() {    // Non-Compliant\n    /* ... */\n  }\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/583.html">MITRE, CWE-583</a> - finalize() Method Declared Public</li>\n<li> CERT Java Secure Coding, MET12-J - Do not use finalizers</li>\n</ul>	2	\N	"Object.finalize()" should remain protected (versus public) when overriding	REMOVED	java	2016-10-11 14:20:58.23	2016-10-12 16:28:41.601	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
192	S2386	S2386	squid	<p>There is no good reason to have a mutable object as the <code>public static</code> member of an <code>interface</code>. Such variables should be moved into classes and their visibility lowered.</p>\n<p>This rule checks that interfaces do not have <code>public static</code> array, <code>Collection</code>, or <code>Date</code> members.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic interface MyInterface {\n\n  public static String [] strings; // Noncompliant\n\n}\n</pre>	3	\N	Interfaces should not have "public static" mutable fields	REMOVED	java	2016-10-11 14:20:58.233	2016-10-12 16:28:42.548	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
193	S1850	S1850	squid	<p><code>instanceof</code> operators that always return <code>true</code> or <code>false</code> are either useless or the result of a misunderstanding which could lead to unexpected behavior in production.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic boolean isSuitable(Integer param) {\n...\n  if(param instanceof Number) {  //Always true as param is an Integer, unless param is null\n    doSomething();\n  }\n...\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic boolean isSuitable(Integer param) {\n...\n  doSomething();\n...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/571.html">MITRE, CWE-571</a> - Expression is Always True</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/570.html">MITRE, CWE-570</a> - Expression is Always False</li>\n</ul>	2	\N	"instanceof" operators that always return "true" or "false" should be removed	REMOVED	java	2016-10-11 14:20:58.235	2016-10-12 16:28:42.549	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
194	S2388	S2388	squid	<p>When an inner class extends another class, and both its outer class and its parent class have a method with the same name, calls to that method can be confusing. The compiler will resolve the call to the superclass method, but maintainers may be confused, so the superclass method should be called explicitly, using <code>super.</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Parent {\n  public void foo() { ... }\n}\n\npublic class Outer {\n\n  public void foo() { ... }\n\n  public class Inner extends Parent {\n\n    public void doTheThing() {\n      foo();  // Noncompliant; was Outer.this.foo() intended instead?\n      // ...\n    }\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Parent {\n  public void foo() { ... }\n}\n\npublic class Outer {\n\n  public void foo() { ... }\n\n  public class Inner extends Parent {\n\n    public void doTheThing() {\n      super.foo();\n      // ...\n    }\n  }\n}\n</pre>	2	\N	Inner class calls to super class methods should be unambiguous	REMOVED	java	2016-10-11 14:20:58.237	2016-10-12 16:28:42.55	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
197	SwitchLastCaseIsDefaultCheck	SwitchLastCaseIsDefaultCheck	squid	<p>The requirement for a final <code>default</code> clause is defensive programming. The clause should either take appropriate action, or contain a suitable comment as to why no action is taken.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nswitch (param) {  //missing default clause\n  case 0:\n    doSomething();\n    break;\n  case 1:\n    doSomethingElse();\n    break;\n}\n\nswitch (param) {\n  default: // default clause should be the last one\n    error();\n    break;\n  case 0:\n    doSomething();\n    break;\n  case 1:\n    doSomethingElse();\n    break;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nswitch (param) {\n  case 0:\n    doSomething();\n    break;\n  case 1:\n    doSomethingElse();\n    break;\n  default:\n    error();\n    break;\n}\n</pre>\n\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 15.0 - The MISRA C <em>switch</em> syntax shall be used.</li>\n<li> MISRA C:2004, 15.3 - The final clause of a switch statement shall be the default clause</li>\n<li> MISRA C++:2008, 6-4-3 - A switch statement shall be a well-formed switch statement.</li>\n<li> MISRA C++:2008, 6-4-6 - The final clause of a switch statement shall be the default-clause</li>\n<li> MISRA C:2012, 16.1 - All switch statements shall be well-formed</li>\n<li> MISRA C:2012, 16.4 - Every <em>switch</em> statement shall have a <em>default</em> label</li>\n<li> MISRA C:2012, 16.5 - A <em>default</em> label shall appear as either the first or the last <em>switch label</em> of a <em>switch</em> statement</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/478.html">MITRE, CWE-478</a> - Missing Default Case in Switch Statement</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/YgE">CERT, MSC01-C</a> - Strive for logical completeness</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/JoIyAQ">CERT, MSC01-CPP</a> - Strive for logical completeness</li>\n</ul>	2	\N	"switch" statements should end with a "default" clause	REMOVED	java	2016-10-11 14:20:58.242	2016-10-12 16:28:40.376	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
196	S1481	S1481	squid	<p>If a local variable is declared but not used, it is dead code and should be removed. Doing so will improve maintainability because developers will not wonder what the variable is used for.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic int numberOfMinutes(int hours) {\n  int seconds = 0;   // seconds is never used \n  return hours * 60;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic int numberOfMinutes(int hours) {\n  return hours * 60;\n}\n</pre>	2	\N	Unused local variables should be removed	REMOVED	java	2016-10-11 14:20:58.241	2016-10-12 16:28:41.57	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
198	CallToDeprecatedMethod	CallToDeprecatedMethod	squid	<p>Once deprecated, a method should no longer be used as it means that the method might be removed sooner or later.</p>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/477.html">MITRE, CWE-477</a> - Use of Obsolete Functions</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A9-Using_Components_with_Known_Vulnerabilities">OWASP Top Ten 2013 Category A9</a> - Using Components with Known Vulnerabilities</li>\n</ul>	1	\N	Avoid use of deprecated methods	REMOVED	java	2016-10-11 14:20:58.244	2016-10-12 16:28:41.589	\N	\N	\N	\N	\N	11	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
195	S1610	S1610	squid	<p>With Java 8's "default method" feature, any abstract class without direct or inherited field should be converted into an interface.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic abstract class Car {\n  public abstract void start(Environment c);\n\n  public void stop(Environment c) {\n    c.freeze(this);\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic interface Car {\n  public void start(Environment c);\n\n  public default void stop(Environment c) {\n    c.freeze(this);\n  }\n}\n</pre>	2	\N	Abstract classes without fields should be converted to interfaces	REMOVED	java	2016-10-11 14:20:58.239	2016-10-12 16:28:42.544	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
201	RightCurlyBraceSameLineAsNextBlockCheck	RightCurlyBraceSameLineAsNextBlockCheck	squid	<p>Shared coding conventions make it possible for a team to collaborate efficiently.</p>\n<p>This rule makes it mandatory to place closing curly braces on the same line as the next <code>else</code>, <code>catch</code> or <code>finally</code> keywords.</p>\n<p>The following code snippet illustrates this rule:</p>\n<pre>\npublic void myMethod() {\n  if(something) {\n    executeTask();\n  } else if (somethingElse) {          // Compliant\n    doSomethingElse();\n  }\n  else {                               // Noncompliant\n     generateError();\n  }\n\n  try {\n    generateOrder();\n  } catch (Exception e) {              // Compliant\n    log(e);\n  }\n  finally {                            // Noncompliant\n    closeConnection();\n  }\n}\n</pre>	1	\N	Close curly brace and the next "else", "catch" and "finally" keywords should be located on the same line	REMOVED	java	2016-10-11 14:20:58.25	2016-10-12 16:28:40.334	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	\N	f	HTML
200	S1244	S1244	squid	<p>Floating point math is imprecise because of the challenges of storing such values in a binary representation. Even worse, floating point math is not associative; push a <code>float</code> or a <code>double</code> through a series of simple mathematical operations and the answer will be different based on the order of those operation because of the rounding that takes place at each step.</p>\n<p>Even simple floating point assignments are not simple:</p>\n<pre>\nfloat f = 0.1; // 0.100000001490116119384765625\ndouble d = 0.1; // 0.1000000000000000055511151231257827021181583404541015625\n</pre>\n<p>(Results will vary based on compiler and compiler settings);</p>\n<p>Therefore, the use of the equality (<code>==</code>) and inequality (<code>!=</code>) operators on <code>float</code> or <code>double</code> values is almost always an error. Instead the best course is to avoid floating point comparisons altogether. When that is not possible, you should consider using one of Java's float-handling <code>Numbers</code> such as <code>BigDecimal</code> which can properly handle floating point comparisons. A third option is to look not for equality but for whether the value is close enough. I.e. compare the absolute value of the difference between the stored value and the expected value against a margin of acceptable error. Note that this does not cover all cases (<code>NaN</code> and <code>Infinity</code> for instance).</p>\n<p>This rule checks for the use of direct and indirect equality/inequailty tests on floats and doubles.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre> \nfloat myNumber = 3.146; \nif ( myNumber == 3.146f ) { //Noncompliant. Because of floating point imprecision, this will be false \n  // ... \n} \nif ( myNumber != 3.146f ) { //Noncompliant. Because of floating point imprecision, this will be true \n  // ... \n} \n\nif (myNumber &lt; 4 || myNumber &gt; 4) { // Noncompliant; indirect inequality test\n  // ...\n}\n\nfloat zeroFloat = 0.0f;\nif (zeroFloat == 0) {  // Noncompliant. Computations may end up with a value close but not equal to zero.\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nfloat zeroFloat = 0.0f;\nif (Float.floatToRawIntBits(zeroFloat) == 0) { //Compliant for comparisons of zero. Using bit comparison ensures we compare zero values\n}\n</pre>\n<h2>Exceptions</h2>\n\n<p>Since <code>NaN</code> is not equal to itself, the specific case of testing a floating point value against itself is a valid test for <code>NaN</code> and is therefore ignored.</p>\n<pre>\nfloat f;\ndouble d;\nif(f != f) { // Compliant; test for NaN value\n  System.out.println("f is NaN");\n} else if (f != d) { // Noncompliant\n  // ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 13.3 - Floating-point expressions shall not be tested for equality or inequality.</li>\n<li> MISRA C++:2008, 6-2-2 - Floating-point expressions shall not be directly or indirectly tested for equality or inequality</li>\n</ul>	3	\N	Floating point numbers should not be tested for equality	REMOVED	java	2016-10-11 14:20:58.248	2016-10-12 16:28:41.538	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
202	S2333	S2333	squid	<p>The methods declared in an <code>interface</code> are <code>public</code> and <code>abstract</code> by default. Any variables are automatically <code>public static final</code>. There is no need to explicitly declare them so.</p>\n\n<p>Since annotations are implicitly interfaces, the same holds true for them as well.</p>\n\n<p>Similarly, the <code>final</code> modifier is redundant on any method of a <code>final</code> class.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic interface Vehicle {\n\n  public void go(int speed, Direction direction);  // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic interface Vehicle {\n\n  void go(int speed, Direction direction);\n</pre>	1	\N	Redundant modifiers should not be used	REMOVED	java	2016-10-11 14:20:58.252	2016-10-12 16:28:41.54	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
210	CycleBetweenPackages	CycleBetweenPackages	squid	<p>When several packages are involved in a cycle (package A &gt; package B &gt; package C &gt; package A where "&gt;" means "depends upon"), that means that those packages are highly coupled and that there is no way to reuse/extract one of those packages without importing all the other packages. Such cycle could quickly increase the effort required to maintain an application and to embrace business change. SonarQube not only detect cycles between packages but also determines what is the minimum effort to break those cycles. This rule log a violation on each source file having an outgoing dependency to be but in order to break a cycle.</p>	2	\N	Avoid cycle between java packages	REMOVED	java	2016-10-11 14:20:58.269	2016-10-12 16:28:41.535	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	1d	\N	\N	\N	f	HTML
206	UselessParenthesesCheck	UselessParenthesesCheck	squid	<p>\nUseless parentheses can sometimes be misleading and so should be removed.\n</p>\n\n<p>\nThe following code snippet illustrates this rule:\n</p>\n\n<pre>\nreturn 3;             // Compliant\nreturn (x);           // Non-Compliant\nreturn (x + 1);       // Non-Compliant\nint x = (y / 2 + 1);  // Non-Compliant\nint y = (4+X) * y;    // Compliant\n</pre>	2	\N	Useless parentheses around expressions should be removed to prevent any misunderstanding	REMOVED	java	2016-10-11 14:20:58.259	2016-10-12 16:28:40.331	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	\N	f	HTML
205	S1126	S1126	squid	<p>Return of boolean literal statements wrapped into <code>if-then-else</code> ones should be simplified.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif (expression) {  \n  return true;\n} else {\n  return false;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nreturn expression; \n</pre>\n<pre>\nreturn !!expression;\n</pre>	1	\N	Return of boolean expressions should not be wrapped into an "if-then-else" statement	REMOVED	java	2016-10-11 14:20:58.257	2016-10-12 16:28:41.531	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
203	S1125	S1125	squid	<p>Remove literal boolean values from conditional expressions to improve readability. Anything that can be tested for equality with a boolean value must itself be a boolean value, and boolean values can be tested atomicly.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif (booleanVariable == true) { /* ... */ }\nif (booleanVariable != true) { /* ... */ }\nif (booleanVariable || false) { /* ... */ }\ndoSomething(!false);\n\nbooleanVariable = condition ? true : exp;\nbooleanVariable = condition ? false : exp;\nbooleanVariable = condition ?  exp : true;\nbooleanVariable = condition ?  exp : false;\nbooleanVariable = condition ?  true : false;\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif (booleanVariable) { /* ... */ }\nif (!booleanVariable) { /* ... */ }\nif (booleanVariable) { /* ... */ }\ndoSomething(true);\n\nbooleanVariable = condition || exp;\nbooleanVariable = !condition &amp;&amp; exp;\nbooleanVariable = !condition ||  exp;\nbooleanVariable = condition &amp;&amp; exp;\nbooleanVariable = condition;\n</pre>	1	\N	Literal boolean values should not be used in condition expressions	REMOVED	java	2016-10-11 14:20:58.254	2016-10-12 16:28:41.533	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
204	S1488	S1488	squid	<p>Declaring a variable only to immediately return or throw it is a bad practice.\nSome developers argue that the practice improves code readability, because it enables them to explicitly name what is being returned. However, this variable is an internal implementation detail that is not exposed to the callers of the method. The method name should be sufficient for callers to know exactly what will be returned.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic long computeDurationInMilliseconds() {\n  long duration = (((hours * 60) + minutes) * 60 + seconds ) * 1000 ;\n  return duration;\n}\n\npublic void doSomething() {\n  RuntimeException myException = new RuntimeException();\n  throw myException;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic long computeDurationInMilliseconds() {\n  return (((hours * 60) + minutes) * 60 + seconds ) * 1000 ;\n}\n\npublic void doSomething() {\n  throw new RuntimeException();\n}\n</pre>	1	\N	Local Variables should not be declared and then immediately returned or thrown	REMOVED	java	2016-10-11 14:20:58.256	2016-10-12 16:28:41.534	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
207	UnusedPrivateMethod	UnusedPrivateMethod	squid	<p>Private methods that are never executed are dead code: unnecessary, inoperative code that should be removed. Cleaning out dead code decreases the size of the maintained codebase, making it easier to understand the program and preventing bugs from being introduced.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Foo implements Serializable\n{\n  private Foo(){}     //Compliant, private empty constructor intentionally used to prevent any direct instantiation of a class.\n  public static void doSomething(){\n    Foo foo = new Foo();\n    ...\n  }\n  private void unusedPrivateMethod(){...}\n  private void writeObject(ObjectOutputStream s){...}  //Compliant, relates to the java serialization mechanism\n  private void readObject(ObjectInputStream in){...}  //Compliant, relates to the java serialization mechanism\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Foo implements Serializable\n{\n  private Foo(){}     //Compliant, private empty constructor intentionally used to prevent any direct instantiation of a class.\n  public static void doSomething(){\n    Foo foo = new Foo();\n    ...\n  }\n\n  private void writeObject(ObjectOutputStream s){...}  //Compliant, relates to the java serialization mechanism\n\n  private void readObject(ObjectInputStream in){...}  //Compliant, relates to the java serialization mechanism\n}\n</pre>	2	\N	Unused private method should be removed	REMOVED	java	2016-10-11 14:20:58.261	2016-10-12 16:28:40.341	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
208	S1905	S1905	squid	<p>Unnecessary casting expressions make the code harder to read and understand.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void example() {\n  for (Foo obj : (List&lt;Foo&gt;) getFoos()) {  // Noncompliant; cast unnecessary because List&lt;Foo&gt; is what's returned\n  //...\n  }\n}\n\npublic List&lt;Foo&gt; getFoos() {\n  return this.foos;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void example() {\n  for (Foo obj : getFoos()) {\n    //...\n  }\n}\n\npublic List&lt;Foo&gt; getFoos() {\n  return this.foos;\n}\n</pre>\n\n<h2>Exceptions</h2>\n<p>Casting may be required to distinguish the method to call in the case of overloading:</p>\n<pre>\nclass A {}\nclass B extends A{}\nclass C {\n  void fun(A a){}\n  void fun(B b){}\n\n  void foo() {\n    B b = new B();\n    fun(b);\n    fun((A) b); //call the first method so cast is not redundant.\n  }\n}\n</pre>	1	\N	Redundant casts should not be used	REMOVED	java	2016-10-11 14:20:58.262	2016-10-12 16:28:41.567	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
209	UselessImportCheck	UselessImportCheck	squid	<p>\nThe imports part of a file should be handled by the Integrated Development Environment (IDE), not manually by the developer.\nUnused and useless imports should not occur if that is the case.\nLeaving them in reduces the code's readability, since their presence can be confusing.\n</p>\n\n<p>The following code snippet illustrates this rule:</p>\n\n<pre>\npackage my.company;\n\nimport java.lang.String;        // Non-Compliant - java.lang classes are always implicitly imported\nimport my.company.SomeClass;    // Non-Compliant - same package files are always implicitly imported\nimport java.io.File;            // Non-Compliant - File is not used\n\nimport my.company2.SomeType;\nimport my.company2.SomeType;    // Non-Compliant - 'SomeType' is already imported\n\nclass ExampleClass {\n\n  public String someString;\n  public SomeType something;\n\n}\n</pre>	1	\N	Useless imports should be removed	REMOVED	java	2016-10-11 14:20:58.267	2016-10-12 16:28:42.565	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
215	NoSonar	NoSonar	squid	<p>Any issue to quality rule can be deactivated with the <code>NOSONAR</code> marker. This marker is pretty useful to exclude false-positive results but sometimes it can abusively be used to hide real quality flaws.</p>\n<p>This rule allows to track and/or forbid use of this marker.</p>	2	\N	"NOSONAR" marker should not be used to switch-off issues	REMOVED	java	2016-10-11 14:20:58.28	2016-10-12 16:28:42.596	\N	\N	\N	\N	\N	18	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	\N	f	HTML
216	S2440	S2440	squid	<p><code>static</code> methods can be accessed without an instance of the enclosing class, so there's no reason to instantiate a class that has only <code>static</code> methods.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class TextUtils {\n  public static String stripHtml(String source) {\n    return source.replaceAll("<[^>]+>", "");\n  }\n}\n\npublic class TextManipulator {\n\n  // ...\n\n  public void cleanText(String source) {\n    TextUtils textUtils = new TextUtils(); // Noncompliant\n\n    String stripped = textUtils.stripHtml(source);\n\n    //...\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class TextUtils {\n  public static String stripHtml(String source) {\n    return source.replaceAll("<[^>]+>", "");\n  }\n}\n\npublic class TextManipulator {\n\n  // ...\n\n  public void cleanText(String source) {\n    String stripped = TextUtils.stripHtml(source);\n\n    //...\n  }\n}\n</pre>\n\n<h2>See Also</h2>\n<ul>\n    <li>{rule:squid:S1118} - Utility classes should not have public constructors</li>\n</ul>	2	\N	Classes with only "static" methods should not be instantiated	REMOVED	java	2016-10-11 14:20:58.282	2016-10-12 16:28:41.559	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
217	S2200	S2200	squid	While most <code>compareTo</code> methods return -1, 0, or 1, some do not, and testing the result of a <code>compareTo</code> against a specific value other than 0 could result in false negatives.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nif (myClass.compareTo(arg) == -1) {  // Noncompliant\n  // ...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nif (myClass.compareTo(arg) &lt; 0) {\n  // ...\n}\n</pre>	2	\N	"compareTo" results should not be checked for specific values	REMOVED	java	2016-10-11 14:20:58.284	2016-10-12 16:28:41.586	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
218	S2442	S2442	squid	<p>\n<code>java.util.concurrent.locks.Lock</code> offers far more powerful and flexible locking operations than are available with <code>synchronized</code> blocks.\nSo synchronizing on a <code>Lock</code> throws away the power of the object, and is just silly.\nInstead, such objects should be locked and unlocked using <code>tryLock()</code> and <code>unlock()</code>.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nLock lock = new MyLockImpl();\nsynchronized(lock) {  // Noncompliant\n  //...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\nLock lock = new MyLockImpl();\nlock.tryLock();\n//...\n</pre>	4	\N	"Lock" objects should not be "synchronized"	REMOVED	java	2016-10-11 14:20:58.286	2016-10-12 16:28:41.587	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
214	S1118	S1118	squid	<p>\nUtility classes, which are a collection of static members, are not meant to be instantiated.\nEven abstract utility classes, which can be extended, should not have public constructors.\n</p>\n\n<p>\nJava adds an implicit public constructor to every class which does not define at least one explicitly.\nHence, at least one non-public constructor should be defined.\n</p>\n</p>\n\n<p>The following code:</p>\n\n<pre>\nclass StringUtils { // Non-Compliant\n\n  public static String concatenate(String s1, String s2) {\n    return s1 + s2;\n  }\n\n}\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\nclass StringUtils { // Compliant\n\n  private StringUtils() {\n  }\n\n  public static String concatenate(String s1, String s2) {\n    return s1 + s2;\n  }\n\n}\n</pre>	2	\N	Utility classes should not have public constructors	REMOVED	java	2016-10-11 14:20:58.278	2016-10-12 16:28:41.593	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
219	S2441	S2441	squid	<p>If you have no intention of writting an <code>HttpSession</code> object to file, then storing non-<code>serializable</code> objects in it may not seem like a big deal. But whether or not you explicitly serialize the session, it may be written to disk anyway, as the server manages its memory use in a process called "passivation". Further, some servers automatically write their active sessions out to file at shutdown &amp; deserialize any such sessions at startup.</p>\n<p>The point is, that even though <code>HttpSession</code> does not <code>extend Serializable</code>, you must nonetheless assume that it will be serialized, and </p>\n<p>understand that if you've stored non-serializable objects in the session, errors will result. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Address {\n  //...\n}\n\n//...\nHttpSession session = request.getSession();\nsession.setAttribute("address", new Address());  // Noncompliant; Address isn't serializable\n</pre>	3	\N	Non-serializable objects should not be stored in "HttpSessions"	REMOVED	java	2016-10-11 14:20:58.288	2016-10-12 16:28:41.588	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
221	S2444	S2444	squid	<p>In a multi-threaded situation, un-<code>synchronized</code> lazy initialization of non-<code>volatile</code> fields could mean that a second thread has access to a half-initizliaed object while the first thread is still creating it. Allowing such access could cause serious bugs. Instead. the initizliation block should be <code>synchronized</code> or the variable made <code>volatile</code>.</p>\n<p>Similarly, updates of such fields should also be <code>synchronized</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nprotected static Object instance = null;\n\npublic static Object getInstance() {\n    if (instance != null) {\n        return instance;\n    }\n\n    instance = new Object();  // Noncompliant\n    return instance;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nprotected static volatile Object instance = null;\n\npublic static Object getInstance() {\n    if (instance != null) {\n        return instance;\n    }\n\n    instance = new Object();\n    return instance;\n}\n</pre>\n<p>or </p>\n<pre>\nprotected static Object instance = null;\n\npublic static synchronized Object getInstance() {\n    if (instance != null) {\n        return instance;\n    }\n\n    instance = new Object();\n    return instance;\n}\n</pre>	3	\N	Lazy initialization of "static" fields should be "synchronized"	REMOVED	java	2016-10-11 14:20:58.292	2016-10-12 16:28:41.589	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
220	S1596	S1596	squid	<p>Since the introduction of generics in Java 5, it is recommended to use generic types such as <code>List&lt;String&gt;</code> instead of raw ones such as just <code>List</code>. Assigning a raw type into a generic one is not type safe, and will generate a warning. The old <code>EMPTY</em>...</code> fields of the <code>Collections</code> class return raw types, whereas the newer <code>empty...()</code> methods return generic ones.</p>\n<p>Developers will also more easily find the <code>emptyIterator()</code> and <code>emptyListIterator()</code> methods for which there is no field equivalent if they are used to call the methods.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nList&lt;String&gt; collection1 = Collections.EMPTY_LIST;\nMap&lt;String, String&gt; collection2 = Collections.EMPTY_MAP;\nSet&lt;String&gt; collection3 = Collections.EMPTY_SET;\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nList&lt;String&gt; collection1 = Collections.emptyList();\nMap&lt;String, String&gt; collection2 = Collections.emptyMap();\nSet&lt;String&gt; collection3 = Collections.emptySet();\n</pre>	2	\N	Collections.emptyList(), emptyMap() and emptySet() should be used instead of Collections.EMPTY_LIST, EMPTY_MAP and EMPTY_SET	REMOVED	java	2016-10-11 14:20:58.29	2016-10-12 16:28:41.59	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
224	S2204	S2204	squid	<p><code>AtomicInteger</code>, and <code>AtomicLong</code> extend <code>Number</code>, but they're distinct from <code>Integer</code> and <code>Long</code> and should be handled differently. <code>AtomicInteger</code> and <code>AtomicLong</code> are designed to support lock-free, thread-safe programming on single variables. As such, an <code>AtomicInteger</code> will only ever be "equal" to itself. Instead, you should <code>.get()</code> the value and make comparisons on it.</p>\n\n<p>This applies to all the atomic, seeming-primitive wrapper classes: <code>AtomicInteger</code>, <code>AtomicLong</code>, and <code>AtomicBoolean</code>.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nAtomicInteger aInt1 = new AtomicInteger(0);\nAtomicInteger aInt2 = new AtomicInteger(0);\n\nif (aInt1.equals(aInt2)) { ... }  // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nAtomicInteger aInt1 = new AtomicInteger(0);\nAtomicInteger aInt2 = new AtomicInteger(0);\n\nif (aInt1.get() == aInt2.get()) { ... }\n</pre>	4	\N	".equals()" should not be used to test the values of "Atomic" classes	REMOVED	java	2016-10-11 14:20:58.298	2016-10-12 16:28:41.571	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
223	S1598	S1598	squid	<p>By convention, a Java class' physical location (source directories) and its logical representation (packages) should be kept in sync. Thus a Java file located at "src/org/sonarqube/Foo.java" should have a package of "org.sonarqube".</p>\n\n<p>Unfortunately, this convention is not enforced by Java compilers, and nothing prevents a developer from making the "Foo.java" class part of the "com.apple" package, which could degrade the maintainability of both the class and its application.</p>	2	\N	Package declaration should match source file directory	REMOVED	java	2016-10-11 14:20:58.296	2016-10-12 16:28:41.576	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
222	S2201	S2201	squid	<p>When the call to a function doesn't have any side effect, what is the point of ignoring the result of the function call ? In such case, either the function call is useless and should be dropped or the source code doesn't behave as expected. </p>\n<p>To prevent generating any false-positives, this rule triggers an issues only on the following predefined list of immutable classes in the Java API : String, Boolean, Integer, Double, Float, Byte, Character, Short, StackTraceElement.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void handle(String command){\n  command.toLowerCase(); // Noncompliant; result of method thrown away\n  ...\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void handle(String command){\n  String formattedCommand = command.toLowerCase();\n  ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2012, 17.7 - The value returned by a function having non-void return type shall be used</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/9YIRAQ">CERT, EXP12-C</a> - Do not ignore values returned by functions</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/eoAyAQ">CERT, EXP12-CPP</a> - Do not ignore values returned by functions or methods</li>\n</ul>	3	\N	Return values should not be ignored when function calls don't have any side effects	REMOVED	java	2016-10-11 14:20:58.294	2016-10-12 16:28:41.591	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
225	S2446	S2446	squid	<code>notify</code> and <code>notifyAll</code> both wake up sleeping threads, but <code>notify</code> only rouses one, while <code>notifyAll</code> rouses all of them. Since <code>notify</code> might not wake up the right thread, <code>notifyAll</code> should be used instead.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nclass MyThread extends Thread{\n\n  @Override\n  public void run(){\n    synchronized(this){\n      // ...\n      notify();  // Noncompliant\n    }\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass MyThread extends Thread{\n\n  @Override\n  public void run(){\n    synchronized(this){\n      // ...\n      notifyAll();\n    }\n  }\n}\n</pre>	3	\N	"notifyAll" should be used	REMOVED	java	2016-10-11 14:20:58.3	2016-10-12 16:28:41.573	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
226	S2445	S2445	squid	<p>Synchronizing on a class field synchronizes not on the field itself, but on the object assigned to it. So reassigning a field in a block synchronized on that field's contents immediately opens the block up to access by another thread.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nprivate String color = "red";\n\nprivate void doSomething(){\n  synchronized(color) {  // lock is actually on object instance "red" referred to by the color variable\n    //...\n    color = "green"; // Noncompliant; other threads now allowed into this block\n    // ...\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nprivate String color = "red";\nprivate Object lockObj = new Object();\n\nprivate void doSomething(){\n  synchronized(lockObj) {\n    //...\n    color = "green";\n    // ...\n  }\n}\n</pre>	4	\N	Blocks synchronized on fields should not contain assignments of new objects to those fields	REMOVED	java	2016-10-11 14:20:58.302	2016-10-12 16:28:41.58	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
227	S00112	S00112	squid	<p>Using such generic exceptions as <code>Error</code>, <code>RuntimeException</code>, <code>Throwable</code>, and <code>Exception</code> prevents calling methods from handling true, system-generated exceptions differently than application-generated errors. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void foo(String bar) throws Throwable {  // Non-Compliant\n  throw new RuntimeException("My Message");     // Non-Compliant\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void foo(String bar) {\n  throw new MyOwnRuntimeException("My Message"); \n}\n</pre>\n<h2>Exceptions</h2>\n\n<p>Generic exceptions in the signatures of overriding methods are ignored.</p>\n<pre>\n@Override\npublic void myMethod() throws Exception {...}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/397.html">MITRE, CWE-397</a> - Declaration of Throws for Generic Exception</li>\n</ul>	2	\N	Generic exceptions should never be thrown	REMOVED	java	2016-10-11 14:20:58.304	2016-10-12 16:28:41.639	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
229	S2118	S2118	squid	Nothing in a non-serializable class will be written out to file, and attempting to serialize such a class will result in an exception being thrown. Only a class that <code>implements Serializable</code> or one that extends such a class can successfully be serialized (or de-serialized).\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Vegetable {  // neither implements Serializable nor extends a class that does\n  //...\n}\n\npublic class Menu {\n  public void meal() throws IOException {\n    Vegetable veg;\n    //...\n    FileOutputStream fout = new FileOutputStream(veg.getName());\n    ObjectOutputStream oos = new ObjectOutputStream(fout);\n    oos.writeObject(veg);  // Noncompliant. Nothing will be written\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Vegetable implements Serializable {  // can now be serialized\n  //...\n}\n\npublic class Menu {\n  public void meal() throws IOException {\n    Vegetable veg;\n    //...\n    FileOutputStream fout = new FileOutputStream(veg.getName());\n    ObjectOutputStream oos = new ObjectOutputStream(fout);\n    oos.writeObject(veg);\n  }\n}\n</pre>	3	\N	Non-serializable classes should not be written	REMOVED	java	2016-10-11 14:20:58.308	2016-10-12 16:28:42.569	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
230	S1700	S1700	squid	<p>It's confusing to have a class member with the same name (case differences aside) as its enclosing class. This is particularly so when you consider the common practice of naming a class instance for the class itself.</p>\n<p>Best practice dictates that any field or member with the same name as the enclosing class be renamed to be more descriptive of the particular aspect of the class it represents or holds.</p>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Foo {\n  private String name; \n\n  public String getName() { }\n}\n\n//...\n\nFoo foo = new Foo();\nfoo.getName()\n\n</pre>\n<h2>Exceptions</h2>\n\n<p>When the type of the field is the containing class and that field is static, no issue is raised to allow singletons named like the type. </p>\n<pre> \npublic class Foo { \n  ... \n  private static Foo foo; \n  public Foo getInstance() { \n    if(foo==null){ \n      foo = new Foo(); \n    } \n    return foo; \n  } \n  ... \n} \n</pre>	2	\N	A field should not duplicate the name of its containing class	REMOVED	java	2016-10-11 14:20:58.309	2016-10-12 16:28:42.57	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
231	S1701	S1701	squid	<p>It's confusing to have a class field with the same name as a method in the class. It's also confusing to have multiple fields that differ only in capitalization</p>\n<p>Typically this situation indicates poor naming. Method names should be action-oriented, and thus contain a verb, which is unlikely in the case where both a method and a member have the same name. However, renaming a public method could be disruptive to callers. Therefore renaming the member is the recommended action.</p>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Foo {\n\n  public static final String NAME_QUERY = "Select name from person";\n  private String queryString; // member has been renamed\n  public String query() { \n    // do something...\n  }\n\n  private void doSomething() {\n\n    String tmp = query; // results in a compile error\n    String tmp2 = query(); // no question now what was intended\n  }\n}\n</pre>	2	\N	Fields and methods should not have conflicting names	REMOVED	java	2016-10-11 14:20:58.311	2016-10-12 16:28:42.58	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
235	S1141	S1141	squid	<p>Nesting <code>try</code>/<code>catch</code> blocks severely impacts the readability of source code because it makes it too difficult to understand which block will catch which exception.</p>	2	\N	Try-catch blocks should not be nested	REMOVED	java	2016-10-11 14:20:58.32	2016-10-12 16:28:41.548	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
234	S00107	S00107	squid	<p>A long parameter list can indicate that a new structure should be created to wrap the numerous parameters or that the function is doing too many things.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>The following code snippet illustrates this rule with a maximum number of 4 parameters:</p>\n<pre>\npublic void doSomething(int param1, int param2, int param3, String param4, long param5) {\n...\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void doSomething(int param1, int param2, int param3, String param4) {\n...\n}\n</pre>	2	\N	Methods should not have too many parameters	REMOVED	java	2016-10-11 14:20:58.317	2016-10-12 16:28:41.617	\N	\N	\N	\N	\N	51	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
233	S1948	S1948	squid	<p>Fields in a <code>Serializable</code> class must themselves be either <code>Serializable</code> or <code>transient</code> even if the class is never explicitly serialized or deserialized. That's because under load, most J2EE application frameworks flush objects to disk, and an allegedly <code>Serializable</code> object with non-transient, non-serializable data members could cause program crashes, and open the door to attackers.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Address {\n  //...\n}\n\npublic class Person implements Serializable {\n  private static final long serialVersionUID = 1905122041950251207L;\n\n  private String name;\n  private Address address;  // Noncompliant; Address isn't serializable\n}\n</pre>\n\n<h2>Compliant Example</h2>\n<pre>\npublic class Address implements Serializable {\n  private static final long serialVersionUID = 2405172041950251807L;\n}\n\npublic class Person implements Serializable {\n  private static final long serialVersionUID = 1905122041950251207L;\n\n  private String name;\n  private Address address;\n}\n</pre>\n\n<h2>Exceptions</h2>\n<p>The alternative to making all members <code>serializable</code> or <code>transient</code> is to implement special methods which take on the responsibility of properly serializing and de-serializing the object. This rule ignores classes which implement the following methods:</p>\n\n<pre>\nprivate void writeObject(java.io.ObjectOutputStream out) throws IOException\nprivate void readObject(java.io.ObjectInputStream in) throws IOException, ClassNotFoundException;\n</pre>\n\n<h2>See</h2>\n    <ul>\n      <li><a href="http://cwe.mitre.org/data/definitions/594.html">MITRE, CWE-594</a> - Saving Unserializable Objects to Disk</li>\n      <li><a href="http://docs.oracle.com/javase/6/docs/api/java/io/Serializable.html">Oracle Java 6, Serializable</a></li>\n      <li><a href="http://docs.oracle.com/javase/7/docs/api/java/io/Serializable.html">Oracle Java 7, Serializable</a></li>\n    </ul>	3	\N	Fields in a "Serializable" class should either be transient or serializable	REMOVED	java	2016-10-11 14:20:58.315	2016-10-12 16:28:42.578	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
232	S1943	S1943	squid	<p>Using classes and methods that rely on the default system encoding can result in code that works fine in its "home" environment. But that code may break for customers who use different encodings in ways that are extremely difficult to diagnose and nearly, if not completely, impossible to reproduce when it's time to fix them.</p>\n<p>This rule detects uses of the following classes and methods:</p>\n<ul>\n<li> <code>FileReader</code></li>\n<li> <code>FileWriter</code></li>\n<li> String constructors with a <code>byte[]</code> argument but no <code>Charset</code> argument</li>\n<ul>\n<li> <code>String(byte[] bytes)</code></li>\n<li> <code>String(byte[] bytes, int offset, int length)</code> </li>\n</ul>\n<li> <code>String.getBytes()</code></li>\n<li> <code>String.getBytes(int srcBegin, int srcEnd, byte[] dst, int dstBegin)</code></li>\n<li> <code>InputStreamReader(InputStream in)</code></li>\n<li> <code>OutputStreamWriter(OutputStream out)</code></li>\n<li> <code>ByteArrayOutputStream.toString()</code></li>\n<li> Some <code>Formatter</code> constructors</li>\n<ul>\n<li> <code>Formatter(String fileName)</code></li>\n<li> <code>Formatter(File file)</code></li>\n<li> <code>Formatter(OutputStream os)</code></li>\n</ul>\n<li> Some <code>Scanner</code> constructors</li>\n<ul>\n<li> <code>Scanner(File source)</code></li>\n<li> <code>Scanner(Path source)</code></li>\n<li> <code>Scanner(InputStream source)</code></li>\n</ul>\n<li> Some <code>PrintStream</code> constructors</li>\n<ul>\n<li> <code>PrintStream(File file)</code></li>\n<li> <code>PrintStream(OutputStream out)</code></li>\n<li> <code>PrintStream(OutputStream out, boolean autoFlush)</code></li>\n<li> <code>PrintStream(String fileName)</code></li>\n</ul>\n<li> Some <code>PrintWriter</code> constructors</li>\n<ul>\n<li> <code>PrintWriter(File file)</code></li>\n<li> <code>PrintWriter(OutputStream out)</code></li>\n<li> <code>PrintWriter(OutputStream out, boolean autoFlush)</code></li>\n<li> <code>PrintWriter(String fileName)</code></li>\n</ul>\n<li> <code>IOUtils</code> methods which accept an encoding argument when that argument is null, and overloads of those methods that omit the encoding argument</li>\n</ul>	2	\N	Classes and methods that rely on the default system encoding should not be used	REMOVED	java	2016-10-11 14:20:58.313	2016-10-12 16:28:42.581	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
237	S2110	S2110	squid	<p>Whether the valid value ranges for <code>Date</code> fields start with 0 or 1 varies by field. For instance, month starts at 0, and day of month starts at 1. Enter a date value that goes past the end of the valid range, and the date will roll without error or exception. For instance, enter 12 for month, and you'll get January of the following year.</p>\n\n<p>This rule checks for bad values used in conjunction with <code>java.util.Date</code>, <code>java.sql.Date</code>, and <code>java.util.Calendar</code>. Specifically, values outside of the valid ranges:</p>\n<table>\n  <thead>\n  <tr><td>Field</td> <td>Valid</td></tr>\n  </thead>\n  <tbody>\n    <tr><td>month</td><td>0-11</td></tr>\n    <tr><td>date (day)</td><td>0-31</td></tr>\n    <tr><td>hour</td><td>0-23</td></tr>\n    <tr><td>minute</td><td>0-60</td></tr>\n    <tr><td>second</td><td>0-61</td></tr>\n  </tbody>\n</table>\n\n<p>Note that this rule does not check for invalid leap years, leap seconds (second = 61), or invalid uses of the 31st day of the month.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nDate d = new Date();\nd.setDate(25);\nd.setYear(2014);\nd.setMonth(12);  // Noncompliant; rolls d into the next year\n\nCalendar c = new GregorianCalendar(2014, 12, 25);  // Noncompliant\nif (c.get(Calendar.MONTH) == 12) {  // Noncompliant; invalid comparison\n  // ...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nDate d = new Date();\nd.setDate(25);\nd.setYear(2014);\nd.setMonth(11);\n\nCalendar c = new Gregorian Calendar(2014, 11, 25);\nif (c.get(Calendar.MONTH) == 11) {\n  // ...\n}\n</pre>	3	\N	Invalid "Date" values should not be used	REMOVED	java	2016-10-11 14:20:58.324	2016-10-12 16:28:41.542	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
238	S1142	S1142	squid	<p>Having too many return statements in a method increases the method's essential complexity because the flow of execution is broken each time a return statement is encountered. This makes it harder to read and understand the logic of the [method|function].</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>The following code snippet illustrates this rule with the default threshold of 3:</p>\n<pre>\npublic boolean myMethod() { // Non-Compliant as there are 4 return statements\n  if (condition1) {\n    return true;\n  } else {\n    if (condition2) {\n      return false;\n    } else {\n      return true;\n    }\n  }\n  return false;\n}\n</pre>	2	\N	Methods should not contain too many return statements	REMOVED	java	2016-10-11 14:20:58.325	2016-10-12 16:28:41.543	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
240	S1143	S1143	squid	<p>Returning from a <code>finally</code> block suppresses the propagation of any unhandled <code>Throwable</code> which was thrown in the <code>try</code> or <code>catch</code> block.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic static void main(String[] args) {\n  try {\n    doSomethingWhichThrowsException();\n    System.out.println("OK");   // incorrect "OK" message is printed\n  } catch (RuntimeException e) {\n    System.out.println("ERROR");  // this message is not shown\n  }\n}\n\npublic static void doSomethingWhichThrowsException() {\n  try {\n    throw new RuntimeException();\n  } finally {\n    /* ... */\n    return;      // Non-Compliant - prevents the RuntimeException from being propagated\n  }\n}\n</pre>\n<pre>\npublic static void main(String[] args) {\n  try {\n    doSomethingWhichThrowsException();\n    System.out.println("OK");\n  } catch (RuntimeException e) {\n    System.out.println("ERROR");  // "ERROR" is printed as expected\n  }\n}\n\npublic static void doSomethingWhichThrowsException() {\n  try {\n    throw new RuntimeException();\n  } finally {\n    /* ... */\n  }\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/584.html">MITRE, CWE-584</a> - Return Inside Finally Block</li>\n</ul>	4	\N	"return" statements should not occur in "finally" blocks	REMOVED	java	2016-10-11 14:20:58.33	2016-10-12 16:28:42.572	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
239	S2230	S2230	squid	Marking a non-public method <code>@Transactional</code> is both useless and misleading because Spring doesn't "see" non-<code>public</code> methods, and so makes no provision for their proper invocation. Nor does Spring make provision for the methods invoked by the method it called.\n\nTherefore marking a <code>private</code>  method, for instance, <code>@Transactional</code> can only result in a runtime error or exception if the method is actually written to be <code>@Transactional</code>.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n@Transactional  // Noncompliant\nprivate void doTheThing(ArgClass arg) {\n  // ...\n}\n</pre>	3	\N	Non-public methods should not be "@Transactional"	REMOVED	java	2016-10-11 14:20:58.328	2016-10-12 16:28:41.549	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
241	S00108	S00108	squid	<p>Most of the time a block of code is empty when a piece of code is really missing. So such empty block must be either filled or removed.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nfor (int i = 0; i &lt; 42; i++){}  // Empty on purpose or missing piece of code ?\n</pre>\n<h2>Exceptions</h2>\n\n<p>When a block contains a comment, this block is not considered to be empty unless it is a <code>synchronized</code> block. <code>synchronized</code> blocks are still considered empty even with comments because they can still affect program flow.</p>	2	\N	Nested blocks of code should not be left empty	REMOVED	java	2016-10-11 14:20:58.333	2016-10-12 16:28:41.629	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
250	S1147	S1147	squid	<p>Calling <code>System.exit(int status)</code> or <code>Rutime.getRuntime().exit(int status)</code> calls the shutdown hooks and shuts downs the entire Java virtual machine. Calling <code>Runtime.getRuntime().halt(int)</code> does an immediate shutdown, without calling the shutdown hooks, and skipping finalization.</p>\n<p>Each of these methods should be used with extreme care, and only when the intent is to stop the whole Java process. For instance, none of them should be called from applications running in a J2EE container.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nSystem.exit(0);\nRuntime.getRuntime().exit(0);\nRuntime.getRuntime().halt(0);\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/382.html">MITRE, CWE-382</a> - Use of System.exit()</li>\n</ul>	3	\N	Exit methods should not be called	REMOVED	java	2016-10-11 14:20:58.351	2016-10-12 16:28:42.568	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
245	RightCurlyBraceStartLineCheck	RightCurlyBraceStartLineCheck	squid	<p>Shared coding conventions make it possible for a team to efficiently collaborate. This rule makes it mandatory to place a close curly brace at the beginning of a line.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif(condition) {\n  doSomething();} \n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif(condition) {\n  doSomething();\n} \n</pre>\n<h2>Exceptions</h2>\n\n<p>When blocks are inlined (open and close curly braces on the same line), no issue is triggered. </p>\n<pre>\nif(condition) {doSomething();} \n</pre>	1	\N	A close curly brace should be located at the beginning of a line	REMOVED	java	2016-10-11 14:20:58.342	2016-10-12 16:28:41.566	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	\N	f	HTML
244	S00103	S00103	squid	<p>\nHaving to scroll horizontally makes it harder to get a quick overview and understanding of any piece of code.\n</p>	1	\N	Lines should not be too long	REMOVED	java	2016-10-11 14:20:58.339	2016-10-12 16:28:41.596	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	\N	f	HTML
243	S2111	S2111	squid	<p>Because of floating point imprecision, you're unlikely to get the value you expect from the <code>BigDecimal(double)</code> constructor. </p>\n<p>From <a href="http://docs.oracle.com/javase/7/docs/api/java/math/BigDecimal.html#BigDecimal(double)">the JavaDocs</a>:</p>\n<blockquote>The results of this constructor can be somewhat unpredictable. One might assume that writing new BigDecimal(0.1) in Java creates a BigDecimal which is exactly equal to 0.1 (an unscaled value of 1, with a scale of 1), but it is actually equal to 0.1000000000000000055511151231257827021181583404541015625. This is because 0.1 cannot be represented exactly as a double (or, for that matter, as a binary fraction of any finite length). Thus, the value that is being passed in to the constructor is not exactly equal to 0.1, appearances notwithstanding.</blockquote>\n<p>Instead, you should use <code>BigDecimal.valueOf</code>, which uses a string under the covers to eliminate floating point rounding errors.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\ndouble d = 1.1;\n\nBigDecimal bd1 = new BigDecimal(d); // Noncompliant; see comment above\nBigDecimal bd2 = new BigDecimal(1.1); // Noncompliant; same result\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\ndouble d = 1.1;\n\nBigDecimal bd1 = BigDecimal.valueOf(d);\nBigDecimal bd2 = BigDecimal.valueOf(1.1);\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/NQAVAg">CERT, NUM10-J</a> - Do not construct BigDecimal ojbects from floating-point literals</li>\n</ul>	3	\N	"BigDecimal(double)" should not be used	REMOVED	java	2016-10-11 14:20:58.337	2016-10-12 16:28:42.574	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
249	S00105	S00105	squid	<p>\nDevelopers should not need to configure the tab width of their text editors in order to be able to read source code.\nSo the use of tabulation character must be banned.\n</p>	1	\N	Tabulation characters should not be used	REMOVED	java	2016-10-11 14:20:58.349	2016-10-12 16:28:41.613	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
247	S2114	S2114	squid	<p>Passing a collection as an argument to the collection's own method is either an error - some other argument was intended - or simply nonsensical code.</p>\n\n<p>Further, because some methods require that the argument remain unmodified during the execution, passing a collection to itself can result in undefined behavior.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nList &lt;Object&gt; objs = new ArrayList&lt;Object&gt;();\n  objs.add("Hello");\n\n  objs.add(objs); // Noncompliant; StackOverflowException if objs.hashCode() called\n  objs.addAll(objs); // Noncompliant; behavior undefined\n  objs.containsAll(objs); // Noncompliant; always true\n  objs.removeAll(objs); // Noncompliant; confusing. Use clear() instead\n  objs.retainAll(objs); // Noncompliant; NOOP\n</pre>	3	\N	Collections should not be passed as arguments to their own methods	REMOVED	java	2016-10-11 14:20:58.346	2016-10-12 16:28:42.575	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
248	S2235	S2235	squid	According to Oracle Javadoc:\n<blockquote>\n<code>IllegalMonitorStateException</code> is thrown when a thread has attempted to wait on an object's monitor or to notify other threads waiting on an object's monitor without owning the specified monitor.\n</blockquote>\n\nIn other words, this exception can be thrown only in case of bad design because <code>Object.wait(...)</code>, <code>Object.notify()</code> and <code>Object.notifyAll()</code> methods should never be called on an object whose monitor is not held. \n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void doSomething(){\n  ...\n  try {\n    ...\n    anObject.notify();\n    ...\n  } catch(IllegalMonitorStateException e) {\n    ...\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void doSomething(){\n  ...\n  synchronized(anObject) {\n    ...\n    anObject.notify();\n    ...\n  }\n}\n</pre>	3	\N	IllegalMonitorStateException should not be caught	REMOVED	java	2016-10-11 14:20:58.348	2016-10-12 16:28:42.576	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
252	S00104	S00104	squid	<p>\nA source file that grows too much tends to aggregate too many responsibilities and inevitably becomes harder to understand and therefore to maintain.\nAbove a specific threshold, it is strongly advised to refactor it into smaller pieces of code which focus on well defined tasks.\nThose smaller files will not only be easier to understand but also probably easier to test.\n</p>	2	\N	Files should not have too many lines	REMOVED	java	2016-10-11 14:20:58.355	2016-10-12 16:28:41.615	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1h	\N	\N	\N	f	HTML
255	S00121	S00121	squid	<p>While not technically incorrect, the omission of curly braces can be misleading, and may lead to the introduction of errors during maintenance.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n// the two statements seems to be attached to the if statement, but that is only true for the first one:\nif (condition)\n  executeSomething();\n  checkSomething();\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif (condition) {\n  executeSomething();\n  checkSomething();\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 14.8</li>\n<li> MISRA C:2004, 14.9</li>\n<li> MISRA C++:2008, 6-3-1</li>\n<li> MISRA C++:2008, 6-4-1</li>\n<li> MISRA C:2012, 15.6</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/483.html">MITRE, CWE-483</a> - Incorrect Block Delimitation</li>\n</ul>	1	\N	Control structures should always use curly braces	REMOVED	java	2016-10-11 14:20:58.362	2016-10-12 16:28:42.559	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
251	S2116	S2116	squid	While <code>hashCode</code> and <code>toString</code> are available on arrays, they are largely useless. <code>hashCode</code> returns the array's "identity hash code", and <code>toString</code> returns nearly the same value. Neither method's output actually reflects the array's contents. Instead, you should pass the array to the relevant static <code>Arrays</code> method.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic static void main( String[] args )\n{\n    String argStr = args.toString(); // Noncompliant\n    int argHash = args.hashCode(); // Noncompliant\n\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic static void main( String[] args )\n{\n    String argStr = Arrays.toString(args);\n    int argHash = Arrays.hashCode(args);\n\n</pre>	3	\N	"hashCode" and "toString" should not be called on array instances	REMOVED	java	2016-10-11 14:20:58.353	2016-10-12 16:28:42.566	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
253	S1148	S1148	squid	<p>\n<code>Throwable.printStackTrace(...)</code> prints a throwable and its stack trace to some stream.\n</p>\n\n<p>Loggers should be used instead to print throwables, as they have many advantages:</p>\n<ul>\n  <li>Users are able to easily retrieve the logs.</li>\n  <li>The format of log messages is uniform and allow users to browse the logs easily.</li>\n</ul>\n\n<p>The following code:</p>\n\n<pre>\ntry {\n  /* ... */\n} catch(Exception e) {\n  e.printStackTrace();        // Non-Compliant\n}\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\ntry {\n  /* ... */\n} catch(Exception e) {\n  LOGGER.log("context", e);   // Compliant\n}\n</pre>	3	\N	Throwable.printStackTrace(...) should not be called	REMOVED	java	2016-10-11 14:20:58.358	2016-10-12 16:28:42.567	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
261	S1132	S1132	squid	<p>\nIt is preferable to place string literals on the left-hand side of an <code>equals()</code> or <code>equalsIgnoreCase()</code> method call.\nThis prevents null pointer exceptions from being raised, as a string literal can never be null by definition.\n</p>\n\n<p>The following code:</p>\n\n<pre>\nString myString = null;\n\nSystem.out.println("Equal? " + myString.equals("foo"));                        // Non-Compliant - will raise a NPE\nSystem.out.println("Equal? " + (myString != null && myString.equals("foo")));  // Non-Compliant - null check could be removed\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\nSystem.out.println("Equal?" + "foo".equals(myString));                         // Compliant - properly deals with the null case\n</pre>	2	\N	Strings literals should be placed on the left side when checking for equality	REMOVED	java	2016-10-11 14:20:58.376	2016-10-12 16:28:41.554	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
258	S2109	S2109	squid	<p>The writer of an annotation can set one of three retention policies for it:</p>\n<ul>\n  <li><code>RetentionPolicy.SOURCE</code> - these annotations are dropped during compilation, E.G. <code>@Override</code>, <code>@SuppressWarnings</code>.</li>\n  <li><code>RetentionPolicy.CLASS</code> - these annotations are present in a compiled class but not loaded into the JVM at runtime. This is the default.</li>\n  <li><code>RetentionPolicy.RUNTIME</code> - these annotations are present in the class file and loaded into the JVM.</li>\n</ul>\n<p>Only annotations that have been given a <code>RUNTIME</code> retention policy will be available to reflection. Testing for annotations with any other retention policy is simply\n  an error, since the test will always return false.</p>\n\n<p>This rule checks that reflection is not used to detect annotations that do not have <code>RUNTIME</code> retention.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nMethod m = String.class.getMethod("getBytes", new Class[] {int.class,\nint.class, byte[].class, int.class});\nif (m.isAnnotationPresent(Override.class)) {  // Noncompliant; test will always return false, even when @Override is present in the code\n</pre>	4	\N	Reflection should not be used to check non-runtime annotations	REMOVED	java	2016-10-11 14:20:58.369	2016-10-12 16:28:41.558	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	\N	f	HTML
259	S00118	S00118	squid	<p>Sharing some naming conventions is a key point to make it possible for a team to efficiently collaborate. This rule allows to check that all abstract class names match a provided regular expression.</p>\n<p>The following code snippet illustrates this rule:</p>\n<pre>\nabstract class MyClass { // Non-Compliant\n}\n\nclass AbstractLikeClass { // Non-Compliant\n}\n\nabstract class AbstractClass { // Compliant\n}\n</pre>	1	\N	Abstract class names should comply with a naming convention	REMOVED	java	2016-10-11 14:20:58.371	2016-10-12 16:28:42.555	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
260	S00117	S00117	squid	<p>Sharing some naming conventions is a key point to make it possible for a team to efficiently collaborate. This rule allows to check that all local variable and function parameter names match a provided regular expression.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void doSomething(int my_param) { \n  int LOCAL;    \n  ...             \n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void doSomething(int myParam) { \n  int local;  \n  ...               \n}\n</pre>	1	\N	Local variable and method parameter names should comply with a naming convention	REMOVED	java	2016-10-11 14:20:58.374	2016-10-12 16:28:42.556	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
263	S1133	S1133	squid	<p>\nThis rule is meant to be used as a way to track code which is marked as being deprecated.\nDeprecated code should eventually be removed.\n</p>\n\n<p>\nThe following code illustrates this rule:\n</p>\n\n<pre>\nclass Foo {\n  /**\n    * @deprecated\n    */\n  public void foo() {    // Non-Compliant\n  }\n\n  @Deprecated            // Non-Compliant\n  public void bar() {\n  }\n\n  public void baz() {    // Compliant\n  }\n}\n</pre>	0	\N	Deprecated code should be removed eventually	REMOVED	java	2016-10-11 14:20:58.38	2016-10-12 16:28:41.553	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
267	S1135	S1135	squid	<p><code>TODO</code> tags are commonly used to mark places where some more code is required, but which the developer wants to implement later.</p>\n<p>Sometimes the developer will not have the time or will simply forget to get back to that tag.</p>\n<p>This rule is meant to track those tags, and ensure that they do not go unnoticed.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nvoid doSomething() {\n  // TODO\n}\n</pre>	0	\N	"TODO" tags should be handled	REMOVED	java	2016-10-11 14:20:58.396	2016-10-12 16:28:41.556	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
265	S1134	S1134	squid	<p><code>FIXME</code> tags are commonly used to mark places where a bug is suspected, but which the developer wants to deal with later.</p>\n<p>Sometimes the developer will not have the time or will simply forget to get back to that tag.</p>\n<p>This rule is meant to track those tags, and ensure that they do not go unnoticed.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nint divide(int numerator, int denominator) {\n  return numerator / denominator;              // FIXME denominator value might be  0\n}\n</pre>	2	\N	"FIXME" tags should be handled	REMOVED	java	2016-10-11 14:20:58.385	2016-10-12 16:28:41.557	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	\N	f	HTML
264	S00114	S00114	squid	<p>Sharing some naming conventions is a key point to make it possible for a team to efficiently collaborate. This rule allows to check that all interface names match a provided regular expression.</p>\n<p>The following code snippet illustrates this rule:</p>\n<pre>\npublic interface MyFirstInterface {...} // Compliant\npublic interface mySecondInterface {...} // Non-Compliant\n</pre>	1	\N	Interface names should comply with a naming convention	REMOVED	java	2016-10-11 14:20:58.382	2016-10-12 16:28:41.641	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
266	S00113	S00113	squid	<p>\nSome tools such as Git work better when files end with an empty line.\nThis rule simply generates an issue if it is missing.\n</p>\n\n<p>For example, a Git diff look like:</p>\n\n<pre>\n+class Test {\n+}\n\\ No newline at end of file\n</pre>\n\n<p>if the empty line is missing at the end of the file.</p>	1	\N	Files should contain an empty new line at the end	REMOVED	java	2016-10-11 14:20:58.394	2016-10-12 16:28:42.526	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	\N	f	HTML
262	S00119	S00119	squid	<p>Shared naming conventions make it possible for a team to collaborate efficiently. Following the established convention of single-letter type parameter names helps users and maintainers of your code quickly see the difference between a type parameter and a poorly named class.</p>\n\n<p>This rule check that all type parameter names match a provided regular expression. The following code snippets use the default regular expression.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyClass&lt;TYPE&gt; { // Non-Compliant\n  &lt;TYPE&gt; void method(TYPE t) { // Non-compliant\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n<pre>\npublic class MyClass&lt;T&gt; {\n  &lt;T&gt; void method(T t) {\n  }\n}\n</pre>	1	\N	Type parameter names should comply with a naming convention	REMOVED	java	2016-10-11 14:20:58.378	2016-10-12 16:28:42.557	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
269	S2226	S2226	squid	By contract, a servlet container creates one instance of each servlet and then a dedicated thread is attached to each new incoming HTTP request to process this request. So all threads are sharing the servlet instances and by extension instance fields.  To prevent any misunderstanding and unexpected behavior at runtime, all servlet fields should then be either <code>static</code> and/or <code>final</code>, or simply removed.\n\nWith Struts 1.X, the same constraint exists on <code>org.apache.struts.action.Action</code>.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyServlet extends HttpServlet {\n  private String userName;  //As this field is shared by all users, it's obvious that this piece of information should be managed differently\n  ...\n}\n</pre>\n\nor \n\n<pre>\npublic class MyAction extends Action {\n  private String userName;  //Same reason\n  ...\n}\n</pre>\n\n<h2>See</h2>\n<ul>\n\t<li><a href="https://www.securecoding.cert.org/confluence/display/java/VNA06-J.+Do+not+use+non-static+member+fields+in+a+servlet">CERT VNA06-J</a> - Do not use non-static member fields in a servlet</li>\n</ul>	3	\N	Servlets should never have mutable instance fields	REMOVED	java	2016-10-11 14:20:58.4	2016-10-12 16:28:41.551	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
271	S2225	S2225	squid	<p>Calling <code>toString()</code> or <code>clone()</code> on an object should always return a string or an object. Returning <code>null</code> instead contravenes the method's implicit contract.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic override string ToString () {\n  if (this.collection.Count == 0) {\n    return null; // Noncompliant\n  } else {\n    // ...\n </pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic override string ToString () {\n  if (this.collection.Count == 0) {\n    return "";\n  } else {\n    // ...\n </pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/476.html">MITRE CWE-476</a> : NULL Pointer Dereference</li>\n</ul>	3	\N	"toString()" and "clone()" methods should not return null	REMOVED	java	2016-10-11 14:20:58.405	2016-10-12 16:28:41.552	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
270	S00115	S00115	squid	<p>Shared coding conventions allow teams to collaborate efficiently. This rule checks that all constant names match a provided regular expression.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyClass {\n  public static final int first = 1;\n}\n\npublic enum MyEnum {\n  first;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class MyClass {\n  public static final int FIRST = 1; \n}\n\npublic enum MyEnum {\n  FIRST;\n}\n</pre>	1	\N	Constant names should comply with a naming convention	REMOVED	java	2016-10-11 14:20:58.402	2016-10-12 16:28:42.553	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
\.


--
-- Name: rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('rules_id_seq', 271, true);


--
-- Data for Name: rules_parameters; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY rules_parameters (id, rule_id, name, description, param_type, default_value) FROM stdin;
1	1	minimumBranchCoverageRatio	The minimum required branch coverage ratio.	STRING	65.0
2	2	minimumLineCoverageRatio	The minimum required line coverage ratio.	STRING	65.0
3	3	minimumCommentDensity	The minimum required comment density.	STRING	25.0
4	11	indentationLevel	Number of white-spaces of an indent. If this property is not set, we just check that the code is indented.	INTEGER	2
5	12	max	Maximum number of classes a single class is allowed to depend upon	INTEGER	20
6	18	max	Maximum depth of the inheritance tree. (Number)	INTEGER	5
7	26	format	Regular expression used to check the logger names against.	STRING	LOG(?:GER)?
8	28	fromClasses	Optional. If this property is not defined, all classes should adhere to this constraint. Ex : **.web.**	STRING	\N
9	28	toClasses	Mandatory. Ex : java.util.Vector, java.util.Hashtable, java.util.Enumeration	STRING	\N
10	38	legalTrailingCommentPattern	Description Pattern for text of trailing comments that are allowed. By default, comments containing only one word.	STRING	^\\s*+[^\\s]++$
11	43	headerFormat	Expected copyright and license header (plain text)	TEXT	\N
12	69	Exclude	Comma separated list of Sun packages to be ignored by this rule. Example: com.sun.jna,sun.misc	STRING	\N
13	70	threshold	Number of times a literal must be duplicated to trigger an issue	INTEGER	3
14	90	listOfWarnings	Comma separated list of warnings that can't be suppressed. Example: 'unchecked, cast, all, boxing'. An empty list means that no warning can be suppressed.	STRING	\N
15	110	max	Maximum authorized lines in a method	INTEGER	100
16	128	methodName	Name of the forbidden method	STRING	\N
17	128	className	Name of the class whose method is forbidden	STRING	\N
18	128	argumentTypes	Comma-delimited list of argument types, E.G. java.lang.String, int[], int	STRING	\N
19	133	exceptions	List of exceptions which should not be checked	STRING	java.lang.InterruptedException, java.lang.NumberFormatException, java.text.ParseException, java.net.MalformedURLException
20	139	format	Regular expression used to check the class names against.	STRING	^[A-Z][a-zA-Z0-9]*$
21	141	format	Regular expression used to check the method names against.	STRING	^[a-z][a-zA-Z0-9]*$
22	142	Threshold	The maximum authorized complexity.	INTEGER	10
23	144	max	Maximum number of lines	INTEGER	5
24	146	max	Maximum allowed control flow statement nesting depth.	INTEGER	3
25	162	forClasses	Pattern of classes which should adhere to this constraint. Ex : **.api.**	STRING	**
26	173	max	Maximum number of allowed conditional operators in an expression	INTEGER	3
27	174	Max	Maximum allowed lines in an anonymous class/lambda	INTEGER	20
28	187	max	Maximum complexity allowed.	INTEGER	200
29	211	maximum	Maximum number of case	INTEGER	30
30	234	max	Maximum authorized number of parameters	INTEGER	7
31	238	max	Maximum allowed return statements per method	INTEGER	3
32	244	maximumLineLength	The maximum authorized line length.	INTEGER	120
33	252	Max	Maximum authorized lines in a file.	INTEGER	1000
34	256	format	Regular expression used to check the package names against.	STRING	^[a-z]+(\\.[a-z][a-z0-9]*)*$
35	259	format	Regular expression used to check the abstract class names against.	STRING	^Abstract[A-Z][a-zA-Z0-9]*$
36	260	format	Regular expression used to check the names against.	STRING	^[a-z][a-zA-Z0-9]*$
37	262	format	Regular expression used to check the type parameter names against.	STRING	^[A-Z]$
38	264	format	Regular expression used to check the interface names against.	STRING	^[A-Z][a-zA-Z0-9]*$
39	268	format	Regular expression used to check the field names against.	STRING	^[a-z][a-zA-Z0-9]*$
40	270	format	Regular expression used to check the constant names against.	STRING	^[A-Z][A-Z0-9]*(_[A-Z0-9]+)*$
\.


--
-- Name: rules_parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('rules_parameters_id_seq', 40, true);


--
-- Data for Name: rules_profiles; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY rules_profiles (id, name, language, kee, parent_kee, rules_updated_at, created_at, updated_at) FROM stdin;
1	Sonar way	java	java-sonar-way-09275	\N	2016-10-11T14:21:09+0000	2016-10-11 14:21:02.915	2016-10-11 14:21:09.359
\.


--
-- Name: rules_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('rules_profiles_id_seq', 1, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY schema_migrations (version) FROM stdin;
1
2
10
11
14
35
53
54
59
61
62
79
80
86
87
88
93
95
115
118
119
131
132
136
138
139
140
141
151
160
163
167
168
169
180
190
191
200
201
202
211
214
215
216
217
220
221
222
230
231
232
233
234
235
236
237
238
239
240
250
251
252
254
255
256
257
258
259
261
262
263
280
281
282
283
284
285
286
287
300
301
302
303
304
305
306
320
321
330
331
332
333
334
335
350
351
352
353
354
355
356
358
359
360
361
362
363
370
379
380
381
382
383
387
388
391
392
394
397
398
399
400
401
402
403
404
405
406
410
411
412
413
414
415
416
417
418
419
430
431
432
433
434
440
441
442
443
444
460
461
462
463
464
465
466
467
480
481
482
483
484
485
486
488
489
490
492
493
494
495
496
497
498
510
511
512
513
514
515
516
517
518
519
520
521
522
523
524
525
526
530
531
532
533
534
535
536
537
538
539
540
541
542
544
545
546
547
548
549
550
551
552
553
554
555
556
580
581
582
583
584
600
601
603
604
605
702
703
704
705
706
707
708
709
710
711
712
713
714
715
716
717
718
719
720
721
750
752
753
754
755
756
758
759
760
761
762
763
764
765
766
768
769
770
771
772
773
775
776
777
778
779
780
781
782
783
784
785
786
787
788
789
790
791
792
793
794
795
796
\.


--
-- Data for Name: semaphores; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY semaphores (id, name, checksum, created_at, updated_at, locked_at) FROM stdin;
\.


--
-- Name: semaphores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('semaphores_id_seq', 1, false);


--
-- Data for Name: snapshots; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY snapshots (id, project_id, parent_snapshot_id, status, islast, scope, qualifier, root_snapshot_id, version, path, depth, root_project_id, period1_mode, period1_param, period2_mode, period2_param, period3_mode, period3_param, period4_mode, period4_param, period5_mode, period5_param, purge_status, created_at, build_date, period1_date, period2_date, period3_date, period4_date, period5_date) FROM stdin;
\.


--
-- Name: snapshots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('snapshots_id_seq', 1, false);


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY user_roles (id, user_id, resource_id, role) FROM stdin;
\.


--
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('user_roles_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY users (id, login, name, email, crypted_password, salt, remember_token, remember_token_expires_at, active, created_at, updated_at, scm_accounts) FROM stdin;
1	admin	Administrator		a373a0e667abb2604c1fd571eb4ad47fe8cc0878	48bc4b0d93179b5103fd3885ea9119498e9d161b	\N	\N	t	1476195647535	1476195628220	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Data for Name: widget_properties; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY widget_properties (id, widget_id, kee, text_value) FROM stdin;
1	16	metric1	complexity
2	16	metric2	sqale_index
3	16	metric3	coverage
4	17	displaySparkLine	true
5	17	metric1	ncloc
6	17	metric2	lines
7	17	metric3	statements
8	17	metric4	files
9	17	metric5	classes
10	17	metric6	functions
11	17	metric7	accessors
12	18	displaySparkLine	true
13	18	metric1	comment_lines_density
14	18	metric2	comment_lines
15	18	metric3	public_documented_api_density
16	18	metric4	public_undocumented_api
17	19	displaySparkLine	true
18	19	metric1	duplicated_lines_density
19	19	metric2	duplicated_lines
20	19	metric3	duplicated_blocks
21	19	metric4	duplicated_files
22	20	displaySparkLine	true
23	20	metric1	violations
24	20	metric2	blocker_violations
25	20	metric3	critical_violations
26	20	metric4	major_violations
27	20	metric5	minor_violations
28	20	metric6	info_violations
29	20	metric7	sqale_index
30	21	displaySparkLine	true
31	21	metric1	complexity
32	21	metric2	function_complexity
33	21	metric3	class_complexity
34	21	metric4	file_complexity
35	22	metric8	test_execution_time
36	22	displaySparkLine	true
37	22	metric1	coverage
38	22	metric2	line_coverage
39	22	metric3	branch_coverage
40	22	metric4	test_success_density
41	22	metric5	test_failures
42	22	metric6	test_errors
43	22	metric7	tests
44	24	filter	2
45	24	pageSize	50
46	25	filter	1
47	25	pageSize	20
48	26	filter	1
49	26	colorMetric	coverage
50	26	sizeMetric	ncloc
\.


--
-- Name: widget_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('widget_properties_id_seq', 50, true);


--
-- Data for Name: widgets; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY widgets (id, dashboard_id, widget_key, name, description, column_index, row_index, configured, created_at, updated_at, resource_id) FROM stdin;
1	1	size	\N	\N	1	1	t	2016-10-11 14:21:10.429	2016-10-11 14:21:10.429	\N
2	1	duplications	\N	\N	1	2	t	2016-10-11 14:21:10.429	2016-10-11 14:21:10.429	\N
3	1	complexity	\N	\N	1	3	t	2016-10-11 14:21:10.429	2016-10-11 14:21:10.429	\N
4	1	events	\N	\N	1	4	t	2016-10-11 14:21:10.429	2016-10-11 14:21:10.429	\N
5	1	description	\N	\N	1	5	t	2016-10-11 14:21:10.429	2016-10-11 14:21:10.429	\N
6	1	debt_overview	\N	\N	2	1	t	2016-10-11 14:21:10.429	2016-10-11 14:21:10.429	\N
7	1	rules	\N	\N	2	2	t	2016-10-11 14:21:10.429	2016-10-11 14:21:10.429	\N
8	1	alerts	\N	\N	2	3	t	2016-10-11 14:21:10.429	2016-10-11 14:21:10.429	\N
9	1	file_design	\N	\N	2	4	t	2016-10-11 14:21:10.429	2016-10-11 14:21:10.429	\N
10	1	code_coverage	\N	\N	2	5	t	2016-10-11 14:21:10.429	2016-10-11 14:21:10.429	\N
11	2	unresolved_issues_statuses	\N	\N	1	1	t	2016-10-11 14:21:10.485	2016-10-11 14:21:10.485	\N
12	2	action_plans	\N	\N	1	2	t	2016-10-11 14:21:10.485	2016-10-11 14:21:10.485	\N
13	2	reviews_per_developer	\N	\N	2	1	t	2016-10-11 14:21:10.485	2016-10-11 14:21:10.485	\N
14	2	my_reviews	\N	\N	2	2	t	2016-10-11 14:21:10.485	2016-10-11 14:21:10.485	\N
15	2	false_positive_reviews	\N	\N	2	3	t	2016-10-11 14:21:10.485	2016-10-11 14:21:10.485	\N
16	3	timeline	\N	\N	1	1	t	2016-10-11 14:21:10.535	2016-10-11 14:21:10.535	\N
17	3	time_machine	\N	\N	1	2	t	2016-10-11 14:21:10.535	2016-10-11 14:21:10.535	\N
18	3	time_machine	\N	\N	1	3	t	2016-10-11 14:21:10.535	2016-10-11 14:21:10.535	\N
19	3	time_machine	\N	\N	1	4	t	2016-10-11 14:21:10.535	2016-10-11 14:21:10.535	\N
20	3	time_machine	\N	\N	2	1	t	2016-10-11 14:21:10.535	2016-10-11 14:21:10.535	\N
21	3	time_machine	\N	\N	2	2	t	2016-10-11 14:21:10.535	2016-10-11 14:21:10.535	\N
22	3	time_machine	\N	\N	2	3	t	2016-10-11 14:21:10.535	2016-10-11 14:21:10.535	\N
23	4	welcome	\N	\N	1	1	t	2016-10-11 14:21:10.613	2016-10-11 14:21:10.613	\N
24	4	measure_filter_list	\N	\N	1	2	t	2016-10-11 14:21:10.613	2016-10-11 14:21:10.613	\N
25	4	measure_filter_list	\N	\N	2	1	t	2016-10-11 14:21:10.613	2016-10-11 14:21:10.613	\N
26	4	measure_filter_treemap	\N	\N	2	2	t	2016-10-11 14:21:10.613	2016-10-11 14:21:10.613	\N
\.


--
-- Name: widgets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('widgets_id_seq', 26, true);


--
-- Name: action_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY action_plans
    ADD CONSTRAINT action_plans_pkey PRIMARY KEY (id);


--
-- Name: active_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY active_dashboards
    ADD CONSTRAINT active_dashboards_pkey PRIMARY KEY (id);


--
-- Name: active_rule_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY active_rule_parameters
    ADD CONSTRAINT active_rule_parameters_pkey PRIMARY KEY (id);


--
-- Name: active_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY active_rules
    ADD CONSTRAINT active_rules_pkey PRIMARY KEY (id);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: analysis_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY analysis_reports
    ADD CONSTRAINT analysis_reports_pkey PRIMARY KEY (id);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: characteristics_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY characteristics
    ADD CONSTRAINT characteristics_pkey PRIMARY KEY (id);


--
-- Name: dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- Name: dependencies_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY dependencies
    ADD CONSTRAINT dependencies_pkey PRIMARY KEY (id);


--
-- Name: duplications_index_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY duplications_index
    ADD CONSTRAINT duplications_index_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: file_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY file_sources
    ADD CONSTRAINT file_sources_pkey PRIMARY KEY (id);


--
-- Name: graphs_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY graphs
    ADD CONSTRAINT graphs_pkey PRIMARY KEY (id);


--
-- Name: group_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY group_roles
    ADD CONSTRAINT group_roles_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: issue_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY issue_changes
    ADD CONSTRAINT issue_changes_pkey PRIMARY KEY (id);


--
-- Name: issue_filter_favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY issue_filter_favourites
    ADD CONSTRAINT issue_filter_favourites_pkey PRIMARY KEY (id);


--
-- Name: issue_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY issue_filters
    ADD CONSTRAINT issue_filters_pkey PRIMARY KEY (id);


--
-- Name: issues_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- Name: loaded_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY loaded_templates
    ADD CONSTRAINT loaded_templates_pkey PRIMARY KEY (id);


--
-- Name: manual_measures_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY manual_measures
    ADD CONSTRAINT manual_measures_pkey PRIMARY KEY (id);


--
-- Name: measure_filter_favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY measure_filter_favourites
    ADD CONSTRAINT measure_filter_favourites_pkey PRIMARY KEY (id);


--
-- Name: measure_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY measure_filters
    ADD CONSTRAINT measure_filters_pkey PRIMARY KEY (id);


--
-- Name: metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY metrics
    ADD CONSTRAINT metrics_pkey PRIMARY KEY (id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: perm_templates_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY perm_templates_groups
    ADD CONSTRAINT perm_templates_groups_pkey PRIMARY KEY (id);


--
-- Name: perm_templates_users_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY perm_templates_users
    ADD CONSTRAINT perm_templates_users_pkey PRIMARY KEY (id);


--
-- Name: permission_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY permission_templates
    ADD CONSTRAINT permission_templates_pkey PRIMARY KEY (id);


--
-- Name: project_links_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY project_links
    ADD CONSTRAINT project_links_pkey PRIMARY KEY (id);


--
-- Name: project_measures_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY project_measures
    ADD CONSTRAINT project_measures_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: properties_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: quality_gate_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY quality_gate_conditions
    ADD CONSTRAINT quality_gate_conditions_pkey PRIMARY KEY (id);


--
-- Name: quality_gates_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY quality_gates
    ADD CONSTRAINT quality_gates_pkey PRIMARY KEY (id);


--
-- Name: resource_index_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY resource_index
    ADD CONSTRAINT resource_index_pkey PRIMARY KEY (id);


--
-- Name: rules_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY rules_parameters
    ADD CONSTRAINT rules_parameters_pkey PRIMARY KEY (id);


--
-- Name: rules_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY rules
    ADD CONSTRAINT rules_pkey PRIMARY KEY (id);


--
-- Name: rules_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY rules_profiles
    ADD CONSTRAINT rules_profiles_pkey PRIMARY KEY (id);


--
-- Name: semaphores_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY semaphores
    ADD CONSTRAINT semaphores_pkey PRIMARY KEY (id);


--
-- Name: snapshots_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY snapshots
    ADD CONSTRAINT snapshots_pkey PRIMARY KEY (id);


--
-- Name: user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: widget_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY widget_properties
    ADD CONSTRAINT widget_properties_pkey PRIMARY KEY (id);


--
-- Name: widgets_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY widgets
    ADD CONSTRAINT widgets_pkey PRIMARY KEY (id);


--
-- Name: GROUPS_USERS_UNIQUE; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX "GROUPS_USERS_UNIQUE" ON groups_users USING btree (group_id, user_id);


--
-- Name: I_ACTION_PLANS_PROJECT_ID; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX "I_ACTION_PLANS_PROJECT_ID" ON action_plans USING btree (project_id);


--
-- Name: active_dashboards_dashboardid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX active_dashboards_dashboardid ON active_dashboards USING btree (dashboard_id);


--
-- Name: active_dashboards_userid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX active_dashboards_userid ON active_dashboards USING btree (user_id);


--
-- Name: activities_log_key; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX activities_log_key ON activities USING btree (log_key);


--
-- Name: characteristics_enabled; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX characteristics_enabled ON characteristics USING btree (enabled);


--
-- Name: deps_from_sid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX deps_from_sid ON dependencies USING btree (from_snapshot_id);


--
-- Name: deps_prj_sid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX deps_prj_sid ON dependencies USING btree (project_snapshot_id);


--
-- Name: deps_to_sid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX deps_to_sid ON dependencies USING btree (to_snapshot_id);


--
-- Name: duplications_index_hash; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX duplications_index_hash ON duplications_index USING btree (hash);


--
-- Name: duplications_index_psid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX duplications_index_psid ON duplications_index USING btree (project_snapshot_id);


--
-- Name: duplications_index_sid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX duplications_index_sid ON duplications_index USING btree (snapshot_id);


--
-- Name: events_resource_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX events_resource_id ON events USING btree (resource_id);


--
-- Name: events_snapshot_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX events_snapshot_id ON events USING btree (snapshot_id);


--
-- Name: file_sources_file_uuid_uniq; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX file_sources_file_uuid_uniq ON file_sources USING btree (file_uuid);


--
-- Name: file_sources_project_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX file_sources_project_uuid ON file_sources USING btree (project_uuid);


--
-- Name: file_sources_updated_at; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX file_sources_updated_at ON file_sources USING btree (updated_at);


--
-- Name: graphs_perspectives; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX graphs_perspectives ON graphs USING btree (snapshot_id, perspective);


--
-- Name: group_roles_group; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX group_roles_group ON group_roles USING btree (group_id);


--
-- Name: group_roles_resource; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX group_roles_resource ON group_roles USING btree (resource_id);


--
-- Name: group_roles_role; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX group_roles_role ON group_roles USING btree (role);


--
-- Name: index_groups_users_on_group_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX index_groups_users_on_group_id ON groups_users USING btree (group_id);


--
-- Name: index_groups_users_on_user_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX index_groups_users_on_user_id ON groups_users USING btree (user_id);


--
-- Name: issue_changes_issue_key; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issue_changes_issue_key ON issue_changes USING btree (issue_key);


--
-- Name: issue_changes_kee; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issue_changes_kee ON issue_changes USING btree (kee);


--
-- Name: issue_filter_favs_user; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issue_filter_favs_user ON issue_filter_favourites USING btree (user_login);


--
-- Name: issue_filters_name; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issue_filters_name ON issue_filters USING btree (name);


--
-- Name: issues_action_plan_key; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_action_plan_key ON issues USING btree (action_plan_key);


--
-- Name: issues_assignee; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_assignee ON issues USING btree (assignee);


--
-- Name: issues_component_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_component_uuid ON issues USING btree (component_uuid);


--
-- Name: issues_creation_date; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_creation_date ON issues USING btree (issue_creation_date);


--
-- Name: issues_kee; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX issues_kee ON issues USING btree (kee);


--
-- Name: issues_project_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_project_uuid ON issues USING btree (project_uuid);


--
-- Name: issues_resolution; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_resolution ON issues USING btree (resolution);


--
-- Name: issues_rule_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_rule_id ON issues USING btree (rule_id);


--
-- Name: issues_severity; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_severity ON issues USING btree (severity);


--
-- Name: issues_status; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_status ON issues USING btree (status);


--
-- Name: issues_updated_at; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_updated_at ON issues USING btree (updated_at);


--
-- Name: manual_measures_resource_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX manual_measures_resource_id ON manual_measures USING btree (resource_id);


--
-- Name: measure_filter_favs_userid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX measure_filter_favs_userid ON measure_filter_favourites USING btree (user_id);


--
-- Name: measure_filters_name; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX measure_filters_name ON measure_filters USING btree (name);


--
-- Name: measures_sid_metric; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX measures_sid_metric ON project_measures USING btree (snapshot_id, metric_id);


--
-- Name: metrics_unique_name; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX metrics_unique_name ON metrics USING btree (name);


--
-- Name: projects_kee; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX projects_kee ON projects USING btree (kee, enabled);


--
-- Name: projects_module_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX projects_module_uuid ON projects USING btree (module_uuid);


--
-- Name: projects_project_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX projects_project_uuid ON projects USING btree (project_uuid);


--
-- Name: projects_root_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX projects_root_id ON projects USING btree (root_id);


--
-- Name: projects_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX projects_uuid ON projects USING btree (uuid);


--
-- Name: properties_key; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX properties_key ON properties USING btree (prop_key);


--
-- Name: resource_index_key; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX resource_index_key ON resource_index USING btree (kee);


--
-- Name: resource_index_rid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX resource_index_rid ON resource_index USING btree (resource_id);


--
-- Name: rules_parameters_rule_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX rules_parameters_rule_id ON rules_parameters USING btree (rule_id);


--
-- Name: rules_repo_key; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX rules_repo_key ON rules USING btree (plugin_name, plugin_rule_key);


--
-- Name: semaphore_names; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX semaphore_names ON semaphores USING btree (name);


--
-- Name: snapshot_project_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX snapshot_project_id ON snapshots USING btree (project_id);


--
-- Name: snapshots_parent; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX snapshots_parent ON snapshots USING btree (parent_snapshot_id);


--
-- Name: snapshots_qualifier; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX snapshots_qualifier ON snapshots USING btree (qualifier);


--
-- Name: snapshots_root; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX snapshots_root ON snapshots USING btree (root_snapshot_id);


--
-- Name: snapshots_root_project_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX snapshots_root_project_id ON snapshots USING btree (root_project_id);


--
-- Name: uniq_author_logins; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX uniq_author_logins ON authors USING btree (login);


--
-- Name: uniq_group_roles; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX uniq_group_roles ON group_roles USING btree (group_id, resource_id, role);


--
-- Name: uniq_profile_rule_ids; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX uniq_profile_rule_ids ON active_rules USING btree (profile_id, rule_id);


--
-- Name: uniq_qprof_key; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX uniq_qprof_key ON rules_profiles USING btree (kee);


--
-- Name: uniq_quality_gates; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX uniq_quality_gates ON quality_gates USING btree (name);


--
-- Name: uniq_semaphore_checksums; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX uniq_semaphore_checksums ON semaphores USING btree (checksum);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: user_roles_resource; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX user_roles_resource ON user_roles USING btree (resource_id);


--
-- Name: user_roles_user; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX user_roles_user ON user_roles USING btree (user_id);


--
-- Name: users_login; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX users_login ON users USING btree (login);


--
-- Name: users_updated_at; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX users_updated_at ON users USING btree (updated_at);


--
-- Name: widget_properties_widgets; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX widget_properties_widgets ON widget_properties USING btree (widget_id);


--
-- Name: widgets_dashboards; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX widgets_dashboards ON widgets USING btree (dashboard_id);


--
-- Name: widgets_widgetkey; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX widgets_widgetkey ON widgets USING btree (widget_key);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

