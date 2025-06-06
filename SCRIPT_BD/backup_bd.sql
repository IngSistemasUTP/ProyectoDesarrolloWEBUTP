PGDMP         .    
            }         
   db_digital    15.13    15.13 S    d           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            e           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            f           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            g           1262    16515 
   db_digital    DATABASE     |   CREATE DATABASE db_digital WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Peru.1252';
    DROP DATABASE db_digital;
                postgres    false            �            1259    16591    categoria_ticket    TABLE     �   CREATE TABLE public.categoria_ticket (
    id_categoria integer NOT NULL,
    nombre_categoria character varying(100) NOT NULL,
    descripcion text
);
 $   DROP TABLE public.categoria_ticket;
       public         heap    postgres    false            �            1259    16590 !   categoria_ticket_id_categoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_ticket_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.categoria_ticket_id_categoria_seq;
       public          postgres    false    225            h           0    0 !   categoria_ticket_id_categoria_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.categoria_ticket_id_categoria_seq OWNED BY public.categoria_ticket.id_categoria;
          public          postgres    false    224            �            1259    16537    cliente    TABLE       CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    ruc character varying(50) NOT NULL,
    nombre_empresa_cliente character varying(250) NOT NULL,
    tipo_cliente character varying(50) NOT NULL,
    id_empresa integer NOT NULL,
    id_sistema integer NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16536    cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_id_cliente_seq;
       public          postgres    false    219            i           0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;
          public          postgres    false    218            �            1259    16556    empleado    TABLE       CREATE TABLE public.empleado (
    id_empleado integer NOT NULL,
    nombre_empleado character varying(100) NOT NULL,
    correo_empleado character varying(100) NOT NULL,
    telefono_empleado character varying(20),
    puesto character varying(150),
    id_empresa integer NOT NULL
);
    DROP TABLE public.empleado;
       public         heap    postgres    false            �            1259    16555    empleado_id_empleado_seq    SEQUENCE     �   CREATE SEQUENCE public.empleado_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.empleado_id_empleado_seq;
       public          postgres    false    221            j           0    0    empleado_id_empleado_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.empleado_id_empleado_seq OWNED BY public.empleado.id_empleado;
          public          postgres    false    220            �            1259    16517    empresa    TABLE     	  CREATE TABLE public.empresa (
    id_empresa integer NOT NULL,
    ruc character varying(100) NOT NULL,
    razon_social character varying(100) NOT NULL,
    direccion character varying(255),
    telefono character varying(20),
    correo character varying(100)
);
    DROP TABLE public.empresa;
       public         heap    postgres    false            �            1259    16516    empresa_id_empresa_seq    SEQUENCE     �   CREATE SEQUENCE public.empresa_id_empresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.empresa_id_empresa_seq;
       public          postgres    false    215            k           0    0    empresa_id_empresa_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.empresa_id_empresa_seq OWNED BY public.empresa.id_empresa;
          public          postgres    false    214            �            1259    16631    historial_ticket    TABLE     �   CREATE TABLE public.historial_ticket (
    id_historial integer NOT NULL,
    id_ticket integer NOT NULL,
    id_usuario integer NOT NULL,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    comentario text NOT NULL
);
 $   DROP TABLE public.historial_ticket;
       public         heap    postgres    false            �            1259    16630 !   historial_ticket_id_historial_seq    SEQUENCE     �   CREATE SEQUENCE public.historial_ticket_id_historial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.historial_ticket_id_historial_seq;
       public          postgres    false    229            l           0    0 !   historial_ticket_id_historial_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.historial_ticket_id_historial_seq OWNED BY public.historial_ticket.id_historial;
          public          postgres    false    228            �            1259    16530    sistema    TABLE     l   CREATE TABLE public.sistema (
    id_sistema integer NOT NULL,
    nombre_sistema character varying(100)
);
    DROP TABLE public.sistema;
       public         heap    postgres    false            �            1259    16529    sistema_id_sistema_seq    SEQUENCE     �   CREATE SEQUENCE public.sistema_id_sistema_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.sistema_id_sistema_seq;
       public          postgres    false    217            m           0    0    sistema_id_sistema_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.sistema_id_sistema_seq OWNED BY public.sistema.id_sistema;
          public          postgres    false    216            �            1259    16602    ticket    TABLE     ^  CREATE TABLE public.ticket (
    id_ticket integer NOT NULL,
    id_cliente integer NOT NULL,
    id_categoria integer NOT NULL,
    id_empleado_responsable integer,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_resolucion timestamp without time zone,
    estado character varying(50) DEFAULT 'Nuevo'::character varying NOT NULL,
    prioridad character varying(50) DEFAULT 'Media'::character varying,
    descripcion text NOT NULL,
    CONSTRAINT ticket_estado_check CHECK (((estado)::text = ANY ((ARRAY['Nuevo'::character varying, 'En Proceso'::character varying, 'Resuelto'::character varying, 'Cerrado'::character varying])::text[]))),
    CONSTRAINT ticket_prioridad_check CHECK (((prioridad)::text = ANY ((ARRAY['Alta'::character varying, 'Media'::character varying, 'Baja'::character varying])::text[])))
);
    DROP TABLE public.ticket;
       public         heap    postgres    false            �            1259    16601    ticket_id_ticket_seq    SEQUENCE     �   CREATE SEQUENCE public.ticket_id_ticket_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ticket_id_ticket_seq;
       public          postgres    false    227            n           0    0    ticket_id_ticket_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.ticket_id_ticket_seq OWNED BY public.ticket.id_ticket;
          public          postgres    false    226            �            1259    16570    usuario    TABLE     �  CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    id_cliente integer,
    id_empleado integer,
    correo_usuario character varying(100) NOT NULL,
    contrasena_usuario character varying(100) NOT NULL,
    tipo_usuario character varying(50) NOT NULL,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT usuario_tipo_usuario_check CHECK (((tipo_usuario)::text = ANY (ARRAY['Cliente'::text, 'Empleado'::text, 'Admin'::text])))
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            o           0    0    COLUMN usuario.tipo_usuario    COMMENT     X   COMMENT ON COLUMN public.usuario.tipo_usuario IS '''Cliente'', ''Empleado'',''Admin''';
          public          postgres    false    223            �            1259    16569    usuario_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public          postgres    false    223            p           0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;
          public          postgres    false    222            �           2604    16594    categoria_ticket id_categoria    DEFAULT     �   ALTER TABLE ONLY public.categoria_ticket ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_ticket_id_categoria_seq'::regclass);
 L   ALTER TABLE public.categoria_ticket ALTER COLUMN id_categoria DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    16540    cliente id_cliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    16559    empleado id_empleado    DEFAULT     |   ALTER TABLE ONLY public.empleado ALTER COLUMN id_empleado SET DEFAULT nextval('public.empleado_id_empleado_seq'::regclass);
 C   ALTER TABLE public.empleado ALTER COLUMN id_empleado DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    16520    empresa id_empresa    DEFAULT     x   ALTER TABLE ONLY public.empresa ALTER COLUMN id_empresa SET DEFAULT nextval('public.empresa_id_empresa_seq'::regclass);
 A   ALTER TABLE public.empresa ALTER COLUMN id_empresa DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    16634    historial_ticket id_historial    DEFAULT     �   ALTER TABLE ONLY public.historial_ticket ALTER COLUMN id_historial SET DEFAULT nextval('public.historial_ticket_id_historial_seq'::regclass);
 L   ALTER TABLE public.historial_ticket ALTER COLUMN id_historial DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    16533    sistema id_sistema    DEFAULT     x   ALTER TABLE ONLY public.sistema ALTER COLUMN id_sistema SET DEFAULT nextval('public.sistema_id_sistema_seq'::regclass);
 A   ALTER TABLE public.sistema ALTER COLUMN id_sistema DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    16605    ticket id_ticket    DEFAULT     t   ALTER TABLE ONLY public.ticket ALTER COLUMN id_ticket SET DEFAULT nextval('public.ticket_id_ticket_seq'::regclass);
 ?   ALTER TABLE public.ticket ALTER COLUMN id_ticket DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    16573    usuario id_usuario    DEFAULT     x   ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       public          postgres    false    223    222    223            ]          0    16591    categoria_ticket 
   TABLE DATA           W   COPY public.categoria_ticket (id_categoria, nombre_categoria, descripcion) FROM stdin;
    public          postgres    false    225   j       W          0    16537    cliente 
   TABLE DATA           p   COPY public.cliente (id_cliente, ruc, nombre_empresa_cliente, tipo_cliente, id_empresa, id_sistema) FROM stdin;
    public          postgres    false    219   �j       Y          0    16556    empleado 
   TABLE DATA           x   COPY public.empleado (id_empleado, nombre_empleado, correo_empleado, telefono_empleado, puesto, id_empresa) FROM stdin;
    public          postgres    false    221   ?k       S          0    16517    empresa 
   TABLE DATA           ]   COPY public.empresa (id_empresa, ruc, razon_social, direccion, telefono, correo) FROM stdin;
    public          postgres    false    215   l       a          0    16631    historial_ticket 
   TABLE DATA           b   COPY public.historial_ticket (id_historial, id_ticket, id_usuario, fecha, comentario) FROM stdin;
    public          postgres    false    229   �l       U          0    16530    sistema 
   TABLE DATA           =   COPY public.sistema (id_sistema, nombre_sistema) FROM stdin;
    public          postgres    false    217   m       _          0    16602    ticket 
   TABLE DATA           �   COPY public.ticket (id_ticket, id_cliente, id_categoria, id_empleado_responsable, fecha_creacion, fecha_resolucion, estado, prioridad, descripcion) FROM stdin;
    public          postgres    false    227   �m       [          0    16570    usuario 
   TABLE DATA           �   COPY public.usuario (id_usuario, id_cliente, id_empleado, correo_usuario, contrasena_usuario, tipo_usuario, fecha_registro) FROM stdin;
    public          postgres    false    223   -n       q           0    0 !   categoria_ticket_id_categoria_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.categoria_ticket_id_categoria_seq', 16, true);
          public          postgres    false    224            r           0    0    cliente_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 24, true);
          public          postgres    false    218            s           0    0    empleado_id_empleado_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.empleado_id_empleado_seq', 1141, true);
          public          postgres    false    220            t           0    0    empresa_id_empresa_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.empresa_id_empresa_seq', 2, true);
          public          postgres    false    214            u           0    0 !   historial_ticket_id_historial_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.historial_ticket_id_historial_seq', 2, true);
          public          postgres    false    228            v           0    0    sistema_id_sistema_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.sistema_id_sistema_seq', 41, true);
          public          postgres    false    216            w           0    0    ticket_id_ticket_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.ticket_id_ticket_seq', 2, true);
          public          postgres    false    226            x           0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 14, true);
          public          postgres    false    222            �           2606    16600 6   categoria_ticket categoria_ticket_nombre_categoria_key 
   CONSTRAINT     }   ALTER TABLE ONLY public.categoria_ticket
    ADD CONSTRAINT categoria_ticket_nombre_categoria_key UNIQUE (nombre_categoria);
 `   ALTER TABLE ONLY public.categoria_ticket DROP CONSTRAINT categoria_ticket_nombre_categoria_key;
       public            postgres    false    225            �           2606    16598 &   categoria_ticket categoria_ticket_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.categoria_ticket
    ADD CONSTRAINT categoria_ticket_pkey PRIMARY KEY (id_categoria);
 P   ALTER TABLE ONLY public.categoria_ticket DROP CONSTRAINT categoria_ticket_pkey;
       public            postgres    false    225            �           2606    16542    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    219            �           2606    16544    cliente cliente_ruc_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_ruc_key UNIQUE (ruc);
 A   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_ruc_key;
       public            postgres    false    219            �           2606    16563 %   empleado empleado_correo_empleado_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_correo_empleado_key UNIQUE (correo_empleado);
 O   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_correo_empleado_key;
       public            postgres    false    221            �           2606    16561    empleado empleado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public            postgres    false    221            �           2606    16524    empresa empresa_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa);
 >   ALTER TABLE ONLY public.empresa DROP CONSTRAINT empresa_pkey;
       public            postgres    false    215            �           2606    16528     empresa empresa_razon_social_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_razon_social_key UNIQUE (razon_social);
 J   ALTER TABLE ONLY public.empresa DROP CONSTRAINT empresa_razon_social_key;
       public            postgres    false    215            �           2606    16526    empresa empresa_ruc_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_ruc_key UNIQUE (ruc);
 A   ALTER TABLE ONLY public.empresa DROP CONSTRAINT empresa_ruc_key;
       public            postgres    false    215            �           2606    16639 &   historial_ticket historial_ticket_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.historial_ticket
    ADD CONSTRAINT historial_ticket_pkey PRIMARY KEY (id_historial);
 P   ALTER TABLE ONLY public.historial_ticket DROP CONSTRAINT historial_ticket_pkey;
       public            postgres    false    229            �           2606    16535    sistema sistema_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.sistema
    ADD CONSTRAINT sistema_pkey PRIMARY KEY (id_sistema);
 >   ALTER TABLE ONLY public.sistema DROP CONSTRAINT sistema_pkey;
       public            postgres    false    217            �           2606    16614    ticket ticket_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id_ticket);
 <   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_pkey;
       public            postgres    false    227            �           2606    16579 "   usuario usuario_correo_usuario_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_correo_usuario_key UNIQUE (correo_usuario);
 L   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_correo_usuario_key;
       public            postgres    false    223            �           2606    16577    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    223            �           1259    16652    idx_historial_ticket    INDEX     V   CREATE INDEX idx_historial_ticket ON public.historial_ticket USING btree (id_ticket);
 (   DROP INDEX public.idx_historial_ticket;
       public            postgres    false    229            �           1259    16650    idx_ticket_cliente    INDEX     K   CREATE INDEX idx_ticket_cliente ON public.ticket USING btree (id_cliente);
 &   DROP INDEX public.idx_ticket_cliente;
       public            postgres    false    227            �           1259    16651    idx_ticket_empleado_responsable    INDEX     e   CREATE INDEX idx_ticket_empleado_responsable ON public.ticket USING btree (id_empleado_responsable);
 3   DROP INDEX public.idx_ticket_empleado_responsable;
       public            postgres    false    227            �           1259    16654    idx_ticket_estado    INDEX     F   CREATE INDEX idx_ticket_estado ON public.ticket USING btree (estado);
 %   DROP INDEX public.idx_ticket_estado;
       public            postgres    false    227            �           1259    16655    idx_ticket_prioridad    INDEX     L   CREATE INDEX idx_ticket_prioridad ON public.ticket USING btree (prioridad);
 (   DROP INDEX public.idx_ticket_prioridad;
       public            postgres    false    227            �           1259    16653    idx_usuario_correo    INDEX     P   CREATE INDEX idx_usuario_correo ON public.usuario USING btree (correo_usuario);
 &   DROP INDEX public.idx_usuario_correo;
       public            postgres    false    223            �           2606    16545    cliente cliente_id_empresa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES public.empresa(id_empresa) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_id_empresa_fkey;
       public          postgres    false    3225    219    215            �           2606    16550    cliente cliente_id_sistema_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES public.sistema(id_sistema) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_id_sistema_fkey;
       public          postgres    false    219    217    3231            �           2606    16564 !   empleado empleado_id_empresa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES public.empresa(id_empresa) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_id_empresa_fkey;
       public          postgres    false    215    221    3225            �           2606    16640 0   historial_ticket historial_ticket_id_ticket_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial_ticket
    ADD CONSTRAINT historial_ticket_id_ticket_fkey FOREIGN KEY (id_ticket) REFERENCES public.ticket(id_ticket) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.historial_ticket DROP CONSTRAINT historial_ticket_id_ticket_fkey;
       public          postgres    false    229    3254    227            �           2606    16645 1   historial_ticket historial_ticket_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial_ticket
    ADD CONSTRAINT historial_ticket_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.historial_ticket DROP CONSTRAINT historial_ticket_id_usuario_fkey;
       public          postgres    false    229    3244    223            �           2606    16620    ticket ticket_id_categoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categoria_ticket(id_categoria) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_id_categoria_fkey;
       public          postgres    false    3248    227    225            �           2606    16615    ticket ticket_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_id_cliente_fkey;
       public          postgres    false    219    227    3233            �           2606    16625 *   ticket ticket_id_empleado_responsable_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_id_empleado_responsable_fkey FOREIGN KEY (id_empleado_responsable) REFERENCES public.empleado(id_empleado) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_id_empleado_responsable_fkey;
       public          postgres    false    221    227    3239            �           2606    16580    usuario usuario_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_id_cliente_fkey;
       public          postgres    false    219    3233    223            �           2606    16585     usuario usuario_id_empleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_id_empleado_fkey;
       public          postgres    false    221    223    3239            ]   �   x�M�=�0���>A�J�:���b%,�8�C��I*�l���~��p�\�>#D�3[��eHbPTY��Q&�����TD+��ä*�-G�H�a�*p�Щ+)���#_��ҚPY̻�%�\�����%qh)�Ub���7���.�(�X}�]�s��=Q�      W   u   x�3�442�L�-(J-NT(I-.��*-�L�L��4�4�JZ�gr~njQrfb�Bj�BR~qai�g@jQq~^�TO"D�	���������������c���B�����6-&�\1z\\\ L=&�      Y   �   x�m�K
�0���S���ͮ!R�ju!��H$m �.��g�b6
.��5���(�L�����E �`z���,�ұ��l:`	�XN'�t��r+~rf@a�mTO��_�A-��)�5\�N�#��MS����|��<�����U�jw }S=�o�A�p6'k��h�����]*�������0�d8��p$Pm      S   b   x�3�42066403370�442v�L�,q�Q�t,�Sp�IN�J,R �[(�*e�&&sZ�Z[�s�f���;��4&��%����r��qqq ���      a   x   x�]���  г����S�:B/.�
�)�Hݾ9w��X@H�Fa��LIbbo�x�wŧΊEט�U�s)��rӢ��qԼ�S���\���ܞ�؝��˷��R��w+����a�1?�v%Y      U   j   x�36���T�O+)O,JUpN�+)J�QHIU�,.I�M,�2�2���J�r�r�~�!\Ɩp�z�ļ�T#,1'��H,��21DV�W�!�(3��+F��� ��)Q      _   �   x�eͱ
�0����)��i��l��Aq�r�)FI,����&���,���h5m\�]c��]@�ζ=�8g��c%8���'�H�B�崎j*kDY�R�A�y�<�[	fE���:�}�^�;�{�9Ë��r�e.�c��|�ge1*!��y//      [   o   x�]�M
�0@���)z���m%+�k�	%Щ`s�Np�0�C�G?���-��,
׭սW��g��-�f;�Ue,�b0�h���g\����LLY��h����c '     