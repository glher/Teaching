
% Increase counter:

if (exist('idx', 'var'));
  idx = idx + 1;
else;
  idx = 1;
end;

% Version, title and date:

VERSION                   (idx, [1: 14])  = 'Serpent 2.1.25' ;
COMPILE_DATE              (idx, [1: 20])  = 'Mar 10 2016 13:04:48' ;
DEBUG                     (idx, 1)        = 0 ;
TITLE                     (idx, [1:  9])  = '180unique' ;
INPUT_FILE_NAME           (idx, [1:  8])  = 'deck.txt' ;
WORKING_DIRECTORY         (idx, [1: 77])  = '/Users/tessahennigh/nuclear/serpent-shared/input-decks/examples/45unique copy' ;
HOSTNAME                  (idx, [1: 23])  = 'wl-dhcp149-55.Mines.EDU' ;
CPU_TYPE                  (idx, [1:  7])  = 'Unknown' ;
START_DATE                (idx, [1: 24])  = 'Wed May  4 10:13:05 2016' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Wed May  4 10:17:45 2016' ;

% Run parameters:

POP                       (idx, 1)        = 1000 ;
CYCLES                    (idx, 1)        = 10 ;
SKIP                      (idx, 1)        = 10 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1462378385 ;
UFS_MODE                  (idx, 1)        = 0 ;
UFS_ORDER                 (idx, 1)        = 1.00000;
NEUTRON_TRANSPORT_MODE    (idx, 1)        = 1 ;
PHOTON_TRANSPORT_MODE     (idx, 1)        = 0 ;
GROUP_CONSTANT_GENERATION (idx, 1)        = 0 ;
B1_CALCULATION            (idx, [1:  3])  = [ 0 0 0 ];
B1_BURNUP_CORRECTION      (idx, 1)        = 0 ;
IMPLICIT_REACTION_RATES   (idx, 1)        = 0 ;

% Optimization:

OPTIMIZATION_MODE         (idx, 1)        = 1 ;
RECONSTRUCT_MICROXS       (idx, 1)        = 0 ;
RECONSTRUCT_MACROXS       (idx, 1)        = 0 ;
MG_MAJORANT_MODE          (idx, 1)        = 0 ;
SPECTRUM_COLLAPSE         (idx, 1)        = 0 ;

% Parallelization:

MPI_TASKS                 (idx, 1)        = 1 ;
OMP_THREADS               (idx, 1)        = 1 ;
MPI_REPRODUCIBILITY       (idx, 1)        = 0 ;
OMP_REPRODUCIBILITY       (idx, 1)        = 1 ;
SHARE_BUF_ARRAY           (idx, 1)        = 1 ;
SHARE_RES2_ARRAY          (idx, 1)        = 1 ;

% File paths:

XS_DATA_FILE_PATH         (idx, [1: 86])  = '/Users/tessahennigh/nuclear/export-controlled/serpent/c757mnyws00/xsdata/acedata/xsdir' ;
DECAY_DATA_FILE_PATH      (idx, [1: 94])  = '/Users/tessahennigh/nuclear/export-controlled/serpent/c757mnyws00/xsdata/endfb7/sss_endfb7.dec' ;
SFY_DATA_FILE_PATH        (idx, [1: 94])  = '/Users/tessahennigh/nuclear/export-controlled/serpent/c757mnyws00/xsdata/endfb7/sss_endfb7.nfy' ;
NFY_DATA_FILE_PATH        (idx, [1: 94])  = '/Users/tessahennigh/nuclear/export-controlled/serpent/c757mnyws00/xsdata/endfb7/sss_endfb7.nfy' ;
BRA_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;

% Collision and reaction sampling (neutrons/photons):

MIN_MACROXS               (idx, [1:   4]) = [  2.25344E-01 3.9E-09  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:  2])  = [  9.00000E-01  9.00000E-01 ];
ST_FRAC                   (idx, [1:   4]) = [  6.01112E-01 0.00450  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  3.98888E-01 0.00678  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  4.14886E-01 0.00375  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  6.52696E-01 0.00325  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  5.19688E+00 0.00504  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  3.83715E+01 0.00602  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  3.83672E+01 0.00602  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  2.04175E+01 0.00929  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  2.92615E+01 0.01322  0.00000E+00 0.0E+00 ];

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 10 ;
SOURCE_POPULATION         (idx, 1)        = 10119 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.01190E+03 0.00949 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  1.01190E+03 0.00949 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  4.33935E+00 ;
RUNNING_TIME              (idx, 1)        =  4.66027E+00 ;
INIT_TIME                 (idx, [1:  2])  = [  1.02508E+00  1.02508E+00 ];
PROCESS_TIME              (idx, [1:  2])  = [  3.11340E+00  3.11340E+00 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  5.21733E-01  5.21733E-01  0.00000E+00 ];
BURNUP_CYCLE_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
BATEMAN_SOLUTION_TIME     (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  4.66020E+00  0.00000E+00 ];
CPU_USAGE                 (idx, 1)        = 0.93114 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  9.78955E-01 0.00243 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  7.82820E-01 ;

% Memory usage:

ALLOC_MEMSIZE             (idx, 1)        = 1170.33;
MEMSIZE                   (idx, 1)        = 1127.27;
XS_MEMSIZE                (idx, 1)        = 1019.46;
MAT_MEMSIZE               (idx, 1)        = 64.96;
RES_MEMSIZE               (idx, 1)        = 34.39;
MISC_MEMSIZE              (idx, 1)        = 8.46;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 43.06;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 8 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 1207573 ;
NEUTRON_EMIN              (idx, 1)        =  1.00000E-11 ;
NEUTRON_EMAX              (idx, 1)        =  2.00000E+01 ;

% Unresolved resonance probability table sampling:

URES_DILU_CUT             (idx, 1)        =  1.00000E-09 ;
URES_EMIN                 (idx, 1)        =  1.00000E+37 ;
URES_EMAX                 (idx, 1)        = -1.00000E+37 ;
URES_AVAIL                (idx, 1)        = 230 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_NUCLIDES              (idx, 1)        = 1500 ;
TOT_TRANSPORT_NUCLIDES    (idx, 1)        = 370 ;
TOT_DOSIMETRY_NUCLIDES    (idx, 1)        = 0 ;
TOT_DECAY_NUCLIDES        (idx, 1)        = 1130 ;
TOT_PHOTON_NUCLIDES       (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 9937 ;
TOT_TRANSMU_REA           (idx, 1)        = 3006 ;

% Neutron physics options:

USE_DELNU                 (idx, 1)        = 1 ;
USE_URES                  (idx, 1)        = 0 ;
USE_DBRC                  (idx, 1)        = 0 ;
IMPL_CAPT                 (idx, 1)        = 0 ;
IMPL_NXN                  (idx, 1)        = 1 ;
IMPL_FISS                 (idx, 1)        = 0 ;
DOPPLER_PREPROCESSOR      (idx, 1)        = 1 ;
TMS_MODE                  (idx, 1)        = 0 ;
SAMPLE_FISS               (idx, 1)        = 1 ;
SAMPLE_CAPT               (idx, 1)        = 1 ;
SAMPLE_SCATT              (idx, 1)        = 1 ;

% Radioactivity data:

TOT_ACTIVITY              (idx, 1)        =  2.76068E+19 ;
TOT_DECAY_HEAT            (idx, 1)        =  2.64604E+06 ;
TOT_SF_RATE               (idx, 1)        =  4.12426E+07 ;
ACTINIDE_ACTIVITY         (idx, 1)        =  1.59477E+19 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        =  1.11167E+06 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        =  1.16591E+19 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        =  1.53437E+06 ;
INHALATION_TOXICITY       (idx, 1)        =  6.00514E+11 ;
INGESTION_TOXICITY        (idx, 1)        =  6.66488E+11 ;
SR90_ACTIVITY             (idx, 1)        =  2.58124E+15 ;
TE132_ACTIVITY            (idx, 1)        =  7.71698E+17 ;
I131_ACTIVITY             (idx, 1)        =  5.23942E+17 ;
I132_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
CS134_ACTIVITY            (idx, 1)        =  4.30483E+15 ;
CS137_ACTIVITY            (idx, 1)        =  3.73246E+15 ;
TOT_PHOTON_SRC            (idx, 1)        =  2.94004E+19 ;

% Normaliation coefficient:

NORM_COEF                 (idx, [1:   4]) = [  5.71237E+16 0.01008  0.00000E+00 0.0E+00 ];

% Parameters for burnup calculation:

BURN_MATERIALS            (idx, 1)        = 45 ;
BURN_MODE                 (idx, 1)        = 2 ;
BURN_STEP                 (idx, 1)        = 0 ;
BURNUP                     (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
BURN_DAYS                 (idx, 1)        =  0.00000E+00 ;

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  2.46484E-01 0.03331 ];
U235_FISS                 (idx, [1:   4]) = [  9.51017E+18 0.01557  4.17535E-01 0.01539 ];
U238_FISS                 (idx, [1:   4]) = [  1.06923E+18 0.07462  4.69463E-02 0.07467 ];
PU239_FISS                (idx, [1:   4]) = [  1.01136E+19 0.01805  4.44043E-01 0.01811 ];
PU240_FISS                (idx, [1:   4]) = [  1.14719E+16 0.66669  5.03807E-04 0.66669 ];
PU241_FISS                (idx, [1:   4]) = [  1.99931E+18 0.05564  8.77841E-02 0.05575 ];
U235_CAPT                 (idx, [1:   4]) = [  2.07337E+18 0.05022  6.06130E-02 0.04221 ];
U238_CAPT                 (idx, [1:   4]) = [  8.40869E+18 0.02634  2.46773E-01 0.03000 ];
PU239_CAPT                (idx, [1:   4]) = [  5.34314E+18 0.04277  1.56314E-01 0.03726 ];
PU240_CAPT                (idx, [1:   4]) = [  2.48180E+18 0.06568  7.23986E-02 0.05595 ];
PU241_CAPT                (idx, [1:   4]) = [  7.39764E+17 0.08335  2.17532E-02 0.08677 ];
XE135_CAPT                (idx, [1:   4]) = [  1.63949E+18 0.06230  4.81553E-02 0.06431 ];
SM149_CAPT                (idx, [1:   4]) = [  4.63989E+17 0.14699  1.35502E-02 0.14075 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   6]) = [  7.50000E+08 0.0E+00  7.50000E+08 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_POWDENS               (idx, [1:   6]) = [  1.04019E+00 6.8E-09  1.04019E+00 6.8E-09  0.00000E+00 0.0E+00 ];
TOT_GENRATE               (idx, [1:   6]) = [  6.13555E+19 0.00090  6.13555E+19 0.00090  0.00000E+00 0.0E+00 ];
TOT_FISSRATE              (idx, [1:   6]) = [  2.27764E+19 0.00019  2.27764E+19 0.00019  0.00000E+00 0.0E+00 ];
TOT_CAPTRATE              (idx, [1:   6]) = [  3.41476E+19 0.01705  2.61090E+19 0.01990  8.03855E+18 0.02616 ];
TOT_ABSRATE               (idx, [1:   6]) = [  5.69240E+19 0.01018  4.88854E+19 0.01060  8.03855E+18 0.02616 ];
TOT_SRCRATE               (idx, [1:   6]) = [  5.71237E+19 0.01008  5.71237E+19 0.01008  0.00000E+00 0.0E+00 ];
TOT_FLUX                  (idx, [1:   6]) = [  2.50370E+21 0.00767  3.99901E+20 0.00794  2.06422E+21 0.00814 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  2.43943E+17 0.17644 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  5.71679E+19 0.01007 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  2.19217E+21 0.00808 ];
INI_FMASS                 (idx, 1)        =  7.21023E+02 ;
TOT_FMASS                 (idx, 1)        =  7.21023E+02 ;
INI_BURN_FMASS            (idx, 1)        =  7.21023E+02 ;
TOT_BURN_FMASS            (idx, 1)        =  7.21023E+02 ;

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.69382E+00 0.00107 ];
FISSE                     (idx, [1:   2]) = [  2.05526E+02 0.00019 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  1.06453E+00 0.01041  1.06986E+00 0.00909  5.19162E-03 0.27210 ];
IMP_KEFF                  (idx, [1:   2]) = [  1.07505E+00 0.00998 ];
COL_KEFF                  (idx, [1:   2]) = [  1.07505E+00 0.00998 ];
ABS_KEFF                  (idx, [1:   2]) = [  1.07505E+00 0.00998 ];
ABS_KINF                  (idx, [1:   2]) = [  1.07969E+00 0.01015 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% Forward-weighted delayed neutron parameters:

FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  4.85608E-03 0.15188  9.40974E-05 1.00000  7.28209E-04 0.31488  1.46451E-03 0.24690  2.03577E-03 0.20437  3.58859E-04 0.40949  1.74647E-04 0.66813 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  6.31759E-01 0.34396  1.24906E-03 1.00000  1.84701E-02 0.27240  8.81508E-02 0.16688  2.88796E-01 0.11125  4.92884E-01 0.41793  1.72728E+00 0.66667 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Adjoint weighted time constants using Nauchi's method:

ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  2.93799E-05 0.03055  2.93349E-05 0.02976  1.94594E-05 0.43689 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  3.12455E-05 0.02846  3.11991E-05 0.02779  2.06670E-05 0.43347 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  3.89716E-03 0.25494  0.00000E+00 0.0E+00  4.88283E-04 0.69122  1.23113E-03 0.56558  1.67845E-03 0.23477  0.00000E+00 0.0E+00  4.99297E-04 0.68720 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  1.18274E+00 0.52584  0.00000E+00 0.0E+00  2.99660E-02 1.5E-08  1.14476E-01 0.01277  3.24076E-01 0.01387  0.00000E+00 0.0E+00  8.63638E+00 1.5E-08 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  1.61341E-05 0.34555  1.61404E-05 0.34563  1.81700E-06 1.00000 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  1.74283E-05 0.34596  1.74351E-05 0.34604  1.95255E-06 1.00000 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  9.69932E-04 1.00000  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  9.69932E-04 1.00000  0.00000E+00 0.0E+00 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  1.35398E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  1.35398E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  3.01218E-05 0.01432 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  3.20272E-05 0.00697 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  4.30572E-03 0.09272 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -1.42437E+02 0.08790 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  7.23518E-07 0.00925 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  2.25764E-06 0.01222  2.25730E-06 0.01269  2.30017E-06 0.12237 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  4.15411E-05 0.01459  4.15444E-05 0.01523  5.06256E-05 0.30902 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  7.21542E-01 0.00814  7.21074E-01 0.00763  1.03189E+00 0.18957 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.41859E+01 0.31894 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  3.83672E+01 0.00602  3.86268E+01 0.01269 ];


% Increase counter:

if (exist('idx', 'var'));
  idx = idx + 1;
else;
  idx = 1;
end;

% Version, title and date:

VERSION                   (idx, [1: 14])  = 'Serpent 2.1.25' ;
COMPILE_DATE              (idx, [1: 20])  = 'Mar 10 2016 13:04:48' ;
DEBUG                     (idx, 1)        = 0 ;
TITLE                     (idx, [1:  9])  = '180unique' ;
INPUT_FILE_NAME           (idx, [1:  8])  = 'deck.txt' ;
WORKING_DIRECTORY         (idx, [1: 77])  = '/Users/tessahennigh/nuclear/serpent-shared/input-decks/examples/45unique copy' ;
HOSTNAME                  (idx, [1: 23])  = 'wl-dhcp149-55.Mines.EDU' ;
CPU_TYPE                  (idx, [1:  7])  = 'Unknown' ;
START_DATE                (idx, [1: 24])  = 'Wed May  4 10:13:05 2016' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Wed May  4 10:25:12 2016' ;

% Run parameters:

POP                       (idx, 1)        = 1000 ;
CYCLES                    (idx, 1)        = 10 ;
SKIP                      (idx, 1)        = 10 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1462378385 ;
UFS_MODE                  (idx, 1)        = 0 ;
UFS_ORDER                 (idx, 1)        = 1.00000;
NEUTRON_TRANSPORT_MODE    (idx, 1)        = 1 ;
PHOTON_TRANSPORT_MODE     (idx, 1)        = 0 ;
GROUP_CONSTANT_GENERATION (idx, 1)        = 0 ;
B1_CALCULATION            (idx, [1:  3])  = [ 0 0 0 ];
B1_BURNUP_CORRECTION      (idx, 1)        = 0 ;
IMPLICIT_REACTION_RATES   (idx, 1)        = 0 ;

% Optimization:

OPTIMIZATION_MODE         (idx, 1)        = 1 ;
RECONSTRUCT_MICROXS       (idx, 1)        = 0 ;
RECONSTRUCT_MACROXS       (idx, 1)        = 0 ;
MG_MAJORANT_MODE          (idx, 1)        = 0 ;
SPECTRUM_COLLAPSE         (idx, 1)        = 0 ;

% Parallelization:

MPI_TASKS                 (idx, 1)        = 1 ;
OMP_THREADS               (idx, 1)        = 1 ;
MPI_REPRODUCIBILITY       (idx, 1)        = 0 ;
OMP_REPRODUCIBILITY       (idx, 1)        = 1 ;
SHARE_BUF_ARRAY           (idx, 1)        = 1 ;
SHARE_RES2_ARRAY          (idx, 1)        = 1 ;

% File paths:

XS_DATA_FILE_PATH         (idx, [1: 86])  = '/Users/tessahennigh/nuclear/export-controlled/serpent/c757mnyws00/xsdata/acedata/xsdir' ;
DECAY_DATA_FILE_PATH      (idx, [1: 94])  = '/Users/tessahennigh/nuclear/export-controlled/serpent/c757mnyws00/xsdata/endfb7/sss_endfb7.dec' ;
SFY_DATA_FILE_PATH        (idx, [1: 94])  = '/Users/tessahennigh/nuclear/export-controlled/serpent/c757mnyws00/xsdata/endfb7/sss_endfb7.nfy' ;
NFY_DATA_FILE_PATH        (idx, [1: 94])  = '/Users/tessahennigh/nuclear/export-controlled/serpent/c757mnyws00/xsdata/endfb7/sss_endfb7.nfy' ;
BRA_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;

% Collision and reaction sampling (neutrons/photons):

MIN_MACROXS               (idx, [1:   4]) = [  2.26297E-01 0.0E+00  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:  2])  = [  9.00000E-01  9.00000E-01 ];
ST_FRAC                   (idx, [1:   4]) = [  6.59473E-01 0.00379  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  3.40527E-01 0.00734  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  4.14252E-01 0.00477  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  6.89671E-01 0.00438  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  5.12307E+00 0.00376  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  4.57849E+01 0.00797  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  4.57840E+01 0.00797  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  2.05953E+01 0.00871  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  3.73159E+01 0.01088  0.00000E+00 0.0E+00 ];

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 10 ;
SOURCE_POPULATION         (idx, 1)        = 9938 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  9.93800E+02 0.02113 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  9.93800E+02 0.02113 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  1.15535E+01 ;
RUNNING_TIME              (idx, 1)        =  1.21192E+01 ;
INIT_TIME                 (idx, [1:  2])  = [  1.02508E+00  1.02508E+00 ];
PROCESS_TIME              (idx, [1:  2])  = [  9.30620E+00  3.12607E+00 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  1.60180E+00  5.49400E-01  5.30667E-01 ];
BURNUP_CYCLE_TIME         (idx, [1:  2])  = [  1.80117E-01  8.30333E-02 ];
BATEMAN_SOLUTION_TIME     (idx, [1:  2])  = [  1.47100E-01  1.56666E-03 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  1.21181E+01  1.21181E+01 ];
CPU_USAGE                 (idx, 1)        = 0.95332 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  9.73150E-01 0.00669 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.14663E-01 ;

% Memory usage:

ALLOC_MEMSIZE             (idx, 1)        = 1170.33;
MEMSIZE                   (idx, 1)        = 1127.27;
XS_MEMSIZE                (idx, 1)        = 1019.46;
MAT_MEMSIZE               (idx, 1)        = 64.96;
RES_MEMSIZE               (idx, 1)        = 34.39;
MISC_MEMSIZE              (idx, 1)        = 8.46;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 43.06;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 8 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 1207573 ;
NEUTRON_EMIN              (idx, 1)        =  1.00000E-11 ;
NEUTRON_EMAX              (idx, 1)        =  2.00000E+01 ;

% Unresolved resonance probability table sampling:

URES_DILU_CUT             (idx, 1)        =  1.00000E-09 ;
URES_EMIN                 (idx, 1)        =  1.00000E+37 ;
URES_EMAX                 (idx, 1)        = -1.00000E+37 ;
URES_AVAIL                (idx, 1)        = 230 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_NUCLIDES              (idx, 1)        = 1500 ;
TOT_TRANSPORT_NUCLIDES    (idx, 1)        = 370 ;
TOT_DOSIMETRY_NUCLIDES    (idx, 1)        = 0 ;
TOT_DECAY_NUCLIDES        (idx, 1)        = 1130 ;
TOT_PHOTON_NUCLIDES       (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 9937 ;
TOT_TRANSMU_REA           (idx, 1)        = 3006 ;

% Neutron physics options:

USE_DELNU                 (idx, 1)        = 1 ;
USE_URES                  (idx, 1)        = 0 ;
USE_DBRC                  (idx, 1)        = 0 ;
IMPL_CAPT                 (idx, 1)        = 0 ;
IMPL_NXN                  (idx, 1)        = 1 ;
IMPL_FISS                 (idx, 1)        = 0 ;
DOPPLER_PREPROCESSOR      (idx, 1)        = 1 ;
TMS_MODE                  (idx, 1)        = 0 ;
SAMPLE_FISS               (idx, 1)        = 1 ;
SAMPLE_CAPT               (idx, 1)        = 1 ;
SAMPLE_SCATT              (idx, 1)        = 1 ;

% Radioactivity data:

TOT_ACTIVITY              (idx, 1)        =  1.01691E+20 ;
TOT_DECAY_HEAT            (idx, 1)        =  2.91341E+07 ;
TOT_SF_RATE               (idx, 1)        =  4.26582E+08 ;
ACTINIDE_ACTIVITY         (idx, 1)        =  2.05677E+19 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        =  1.48520E+06 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        =  8.11230E+19 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        =  2.76488E+07 ;
INHALATION_TOXICITY       (idx, 1)        =  1.53255E+12 ;
INGESTION_TOXICITY        (idx, 1)        =  1.41278E+12 ;
SR90_ACTIVITY             (idx, 1)        =  3.91061E+15 ;
TE132_ACTIVITY            (idx, 1)        =  7.31753E+17 ;
I131_ACTIVITY             (idx, 1)        =  5.30495E+17 ;
I132_ACTIVITY             (idx, 1)        =  7.86744E+17 ;
CS134_ACTIVITY            (idx, 1)        =  1.12918E+16 ;
CS137_ACTIVITY            (idx, 1)        =  6.06954E+15 ;
TOT_PHOTON_SRC            (idx, 1)        =  8.86831E+19 ;

% Normaliation coefficient:

NORM_COEF                 (idx, [1:   4]) = [  7.99815E+16 0.01834  0.00000E+00 0.0E+00 ];

% Parameters for burnup calculation:

BURN_MATERIALS            (idx, 1)        = 45 ;
BURN_MODE                 (idx, 1)        = 2 ;
BURN_STEP                 (idx, 1)        = 1 ;
BURNUP                     (idx, [1:  2])  = [  3.12056E+01  3.07994E+01 ];
BURN_DAYS                 (idx, 1)        =  3.00000E+01 ;

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  3.62462E-01 0.01957 ];
U235_FISS                 (idx, [1:   4]) = [  6.39147E+18 0.02682  2.82110E-01 0.02656 ];
U238_FISS                 (idx, [1:   4]) = [  1.48937E+18 0.06362  6.57454E-02 0.06368 ];
PU239_FISS                (idx, [1:   4]) = [  1.00652E+19 0.01144  4.44288E-01 0.01136 ];
PU240_FISS                (idx, [1:   4]) = [  7.75658E+15 1.00000  3.42466E-04 1.00000 ];
PU241_FISS                (idx, [1:   4]) = [  4.50447E+18 0.04091  1.98852E-01 0.04116 ];
U235_CAPT                 (idx, [1:   4]) = [  1.18056E+18 0.09251  2.04064E-02 0.07609 ];
U238_CAPT                 (idx, [1:   4]) = [  1.36627E+19 0.02303  2.38597E-01 0.01537 ];
PU239_CAPT                (idx, [1:   4]) = [  5.82501E+18 0.03387  1.01914E-01 0.03645 ];
PU240_CAPT                (idx, [1:   4]) = [  4.81741E+18 0.05301  8.37966E-02 0.04033 ];
PU241_CAPT                (idx, [1:   4]) = [  1.82146E+18 0.05253  3.17448E-02 0.04307 ];
XE135_CAPT                (idx, [1:   4]) = [  1.73648E+18 0.04972  3.03458E-02 0.04864 ];
SM149_CAPT                (idx, [1:   4]) = [  5.05579E+17 0.11068  8.82296E-03 0.11141 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   6]) = [  7.50000E+08 0.0E+00  7.50000E+08 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_POWDENS               (idx, [1:   6]) = [  1.04019E+00 3.9E-09  1.04019E+00 3.9E-09  0.00000E+00 0.0E+00 ];
TOT_GENRATE               (idx, [1:   6]) = [  6.25442E+19 0.00157  6.25442E+19 0.00157  0.00000E+00 0.0E+00 ];
TOT_FISSRATE              (idx, [1:   6]) = [  2.26545E+19 0.00029  2.26545E+19 0.00029  0.00000E+00 0.0E+00 ];
TOT_CAPTRATE              (idx, [1:   6]) = [  5.73471E+19 0.02526  4.21260E+19 0.02503  1.52211E+19 0.03461 ];
TOT_ABSRATE               (idx, [1:   6]) = [  8.00016E+19 0.01806  6.47805E+19 0.01621  1.52211E+19 0.03461 ];
TOT_SRCRATE               (idx, [1:   6]) = [  7.99815E+19 0.01834  7.99815E+19 0.01834  0.00000E+00 0.0E+00 ];
TOT_FLUX                  (idx, [1:   6]) = [  3.87689E+21 0.02048  6.08721E+20 0.02170  3.20339E+21 0.02033 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  7.54035E+16 0.47746 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  8.00770E+19 0.01830 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  3.66636E+21 0.02064 ];
INI_FMASS                 (idx, 1)        =  7.21023E+02 ;
TOT_FMASS                 (idx, 1)        =  7.01340E+02 ;
INI_BURN_FMASS            (idx, 1)        =  7.21023E+02 ;
TOT_BURN_FMASS            (idx, 1)        =  7.01340E+02 ;

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.76079E+00 0.00185 ];
FISSE                     (idx, [1:   2]) = [  2.06631E+02 0.00029 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  7.77906E-01 0.01629  7.80671E-01 0.01689  3.42055E-03 0.25074 ];
IMP_KEFF                  (idx, [1:   2]) = [  7.84091E-01 0.01636 ];
COL_KEFF                  (idx, [1:   2]) = [  7.84091E-01 0.01636 ];
ABS_KEFF                  (idx, [1:   2]) = [  7.84091E-01 0.01636 ];
ABS_KINF                  (idx, [1:   2]) = [  7.84782E-01 0.01619 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% Forward-weighted delayed neutron parameters:

FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  6.83240E-03 0.16420  0.00000E+00 0.0E+00  1.56309E-03 0.26936  9.38757E-04 0.32726  2.79355E-03 0.13959  8.89679E-04 0.36861  6.47323E-04 0.59598 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  6.06219E-01 0.36232  0.00000E+00 0.0E+00  2.13063E-02 0.21830  6.88159E-02 0.27237  3.14802E-01 0.00591  6.25068E-01 0.34099  1.32117E+00 0.57813 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Adjoint weighted time constants using Nauchi's method:

ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  6.11027E-05 0.04660  6.10826E-05 0.04607  4.17424E-05 0.42829 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  4.72780E-05 0.03535  4.72627E-05 0.03463  3.15851E-05 0.42239 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  4.36764E-03 0.26184  0.00000E+00 0.0E+00  1.14350E-03 0.51487  0.00000E+00 0.0E+00  2.47146E-03 0.37699  7.52679E-04 0.68654  0.00000E+00 0.0E+00 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  4.87251E-01 0.33386  0.00000E+00 0.0E+00  3.05789E-02 0.02036  0.00000E+00 0.0E+00  3.17918E-01 0.01988  1.35398E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  3.36865E-05 0.36044  3.36211E-05 0.36004  2.56087E-05 1.00000 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  2.58384E-05 0.35620  2.57927E-05 0.35596  1.79023E-05 1.00000 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  4.45434E-04 1.00000  0.00000E+00 0.0E+00  4.45434E-04 1.00000  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  2.99660E-02 0.0E+00  0.00000E+00 0.0E+00  2.99660E-02 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  5.90187E-05 0.02326 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  4.58054E-05 0.01711 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  2.66379E-03 0.11572 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -4.57068E+01 0.12754 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  9.15284E-07 0.00998 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  2.21460E-06 0.00904  2.21537E-06 0.00932  2.01716E-06 0.08746 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  5.86762E-05 0.01670  5.86855E-05 0.01656  5.51326E-05 0.16632 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  7.25653E-01 0.00692  7.26675E-01 0.00663  6.98310E-01 0.16266 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  8.57946E+00 0.14832 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  4.57840E+01 0.00797  4.67274E+01 0.01928 ];

