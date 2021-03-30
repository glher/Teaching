
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
WORKING_DIRECTORY         (idx, [1: 74])  = '/Users/tessahennigh/nuclear/serpent-shared/input-decks/examples/180unique2' ;
HOSTNAME                  (idx, [1: 23])  = 'wl-dhcp149-55.Mines.EDU' ;
CPU_TYPE                  (idx, [1:  7])  = 'Unknown' ;
START_DATE                (idx, [1: 24])  = 'Mon May  2 22:10:06 2016' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Mon May  2 22:15:49 2016' ;

% Run parameters:

POP                       (idx, 1)        = 1000 ;
CYCLES                    (idx, 1)        = 10 ;
SKIP                      (idx, 1)        = 10 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1462248606 ;
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

MIN_MACROXS               (idx, [1:   4]) = [  2.18280E-01 0.0E+00  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:  2])  = [  9.00000E-01  9.00000E-01 ];
ST_FRAC                   (idx, [1:   4]) = [  2.32878E-02 0.01305  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  9.76712E-01 0.00031  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  8.42377E-01 0.00194  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  8.42677E-01 0.00194  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  2.68618E+00 0.00399  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  4.52043E+01 0.01425  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  4.51977E+01 0.01425  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  8.42759E+00 0.00573  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  1.13484E+00 0.00800  0.00000E+00 0.0E+00 ];

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 10 ;
SOURCE_POPULATION         (idx, 1)        = 9978 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  9.97800E+02 0.01284 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  9.97800E+02 0.01284 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  5.57851E+00 ;
RUNNING_TIME              (idx, 1)        =  5.71585E+00 ;
INIT_TIME                 (idx, [1:  2])  = [  1.13195E+00  1.13195E+00 ];
PROCESS_TIME              (idx, [1:  2])  = [  4.26130E+00  4.26130E+00 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  3.22250E-01  3.22250E-01  0.00000E+00 ];
BURNUP_CYCLE_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
BATEMAN_SOLUTION_TIME     (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  5.71552E+00  0.00000E+00 ];
CPU_USAGE                 (idx, 1)        = 0.97597 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  9.97293E-01 0.00051 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  8.03296E-01 ;

% Memory usage:

ALLOC_MEMSIZE             (idx, 1)        = 1296.66;
MEMSIZE                   (idx, 1)        = 1257.53;
XS_MEMSIZE                (idx, 1)        = 993.78;
MAT_MEMSIZE               (idx, 1)        = 220.83;
RES_MEMSIZE               (idx, 1)        = 34.39;
MISC_MEMSIZE              (idx, 1)        = 8.53;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 39.13;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 7 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 1160429 ;
NEUTRON_EMIN              (idx, 1)        =  1.00000E-11 ;
NEUTRON_EMAX              (idx, 1)        =  2.00000E+01 ;

% Unresolved resonance probability table sampling:

URES_DILU_CUT             (idx, 1)        =  1.00000E-09 ;
URES_EMIN                 (idx, 1)        =  1.00000E+37 ;
URES_EMAX                 (idx, 1)        = -1.00000E+37 ;
URES_AVAIL                (idx, 1)        = 234 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_NUCLIDES              (idx, 1)        = 1434 ;
TOT_TRANSPORT_NUCLIDES    (idx, 1)        = 352 ;
TOT_DOSIMETRY_NUCLIDES    (idx, 1)        = 0 ;
TOT_DECAY_NUCLIDES        (idx, 1)        = 1082 ;
TOT_PHOTON_NUCLIDES       (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 9415 ;
TOT_TRANSMU_REA           (idx, 1)        = 2816 ;

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

TOT_ACTIVITY              (idx, 1)        =  1.28826E+18 ;
TOT_DECAY_HEAT            (idx, 1)        =  1.11557E+05 ;
TOT_SF_RATE               (idx, 1)        =  1.38218E+07 ;
ACTINIDE_ACTIVITY         (idx, 1)        =  8.60486E+17 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        =  6.00751E+04 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        =  4.27778E+17 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        =  5.14814E+04 ;
INHALATION_TOXICITY       (idx, 1)        =  3.68628E+10 ;
INGESTION_TOXICITY        (idx, 1)        =  3.00951E+10 ;
SR90_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
TE132_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
I131_ACTIVITY             (idx, 1)        =  1.75842E+16 ;
I132_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
CS134_ACTIVITY            (idx, 1)        =  1.58018E+15 ;
CS137_ACTIVITY            (idx, 1)        =  3.19867E+15 ;
TOT_PHOTON_SRC            (idx, 1)        =  1.34326E+18 ;

% Normaliation coefficient:

NORM_COEF                 (idx, [1:   4]) = [  1.87910E+17 0.00947  0.00000E+00 0.0E+00 ];

% Parameters for burnup calculation:

BURN_MATERIALS            (idx, 1)        = 180 ;
BURN_MODE                 (idx, 1)        = 2 ;
BURN_STEP                 (idx, 1)        = 0 ;
BURNUP                     (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
BURN_DAYS                 (idx, 1)        =  0.00000E+00 ;

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  2.43287E-01 0.02245 ];
U235_FISS                 (idx, [1:   4]) = [  7.75883E+19 0.00492  8.40771E-01 0.00481 ];
U238_FISS                 (idx, [1:   4]) = [  3.80213E+18 0.06653  4.12005E-02 0.06649 ];
PU239_FISS                (idx, [1:   4]) = [  1.01414E+19 0.03925  1.09900E-01 0.03936 ];
PU241_FISS                (idx, [1:   4]) = [  7.50003E+17 0.18611  8.12799E-03 0.18618 ];
U235_CAPT                 (idx, [1:   4]) = [  1.63576E+19 0.03892  1.72738E-01 0.03154 ];
U238_CAPT                 (idx, [1:   4]) = [  2.85520E+19 0.02654  3.01709E-01 0.01631 ];
PU239_CAPT                (idx, [1:   4]) = [  5.63760E+18 0.02958  5.98151E-02 0.03600 ];
PU240_CAPT                (idx, [1:   4]) = [  2.17184E+18 0.09538  2.30276E-02 0.09293 ];
PU241_CAPT                (idx, [1:   4]) = [  1.89297E+17 0.29103  1.96185E-03 0.28680 ];
XE135_CAPT                (idx, [1:   4]) = [  2.66634E+18 0.08157  2.81551E-02 0.07355 ];
SM149_CAPT                (idx, [1:   4]) = [  7.12332E+17 0.26611  7.33748E-03 0.24890 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   6]) = [  3.00000E+09 0.0E+00  3.00000E+09 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_POWDENS               (idx, [1:   6]) = [  1.00875E+00 0.0E+00  1.00875E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_GENRATE               (idx, [1:   6]) = [  2.31032E+20 0.00067  2.31032E+20 0.00067  0.00000E+00 0.0E+00 ];
TOT_FISSRATE              (idx, [1:   6]) = [  9.22819E+19 0.00012  9.22819E+19 0.00012  0.00000E+00 0.0E+00 ];
TOT_CAPTRATE              (idx, [1:   6]) = [  9.46099E+19 0.01959  6.01941E+19 0.02354  3.44158E+19 0.02298 ];
TOT_ABSRATE               (idx, [1:   6]) = [  1.86892E+20 0.00989  1.52476E+20 0.00926  3.44158E+19 0.02298 ];
TOT_SRCRATE               (idx, [1:   6]) = [  1.87910E+20 0.00947  1.87910E+20 0.00947  0.00000E+00 0.0E+00 ];
TOT_FLUX                  (idx, [1:   6]) = [  8.98562E+21 0.01171  1.35683E+21 0.00858  7.48821E+21 0.01296 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  1.24238E+18 0.13278 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  1.88134E+20 0.00940 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  8.50401E+21 0.01684 ];
INI_FMASS                 (idx, 1)        =  2.97398E+03 ;
TOT_FMASS                 (idx, 1)        =  2.97398E+03 ;
INI_BURN_FMASS            (idx, 1)        =  2.97398E+03 ;
TOT_BURN_FMASS            (idx, 1)        =  2.97398E+03 ;

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.50355E+00 0.00078 ];
FISSE                     (idx, [1:   2]) = [  2.02906E+02 0.00012 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  1.23423E+00 0.00850  1.22181E+00 0.00897  8.64248E-03 0.14057 ];
IMP_KEFF                  (idx, [1:   2]) = [  1.23046E+00 0.00934 ];
COL_KEFF                  (idx, [1:   2]) = [  1.23046E+00 0.00934 ];
ABS_KEFF                  (idx, [1:   2]) = [  1.23046E+00 0.00934 ];
ABS_KINF                  (idx, [1:   2]) = [  1.23875E+00 0.00983 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% Forward-weighted delayed neutron parameters:

FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  5.46524E-03 0.11048  2.37115E-04 0.50935  1.22814E-03 0.22213  8.28058E-04 0.30477  2.28574E-03 0.20073  5.65675E-04 0.36276  3.20507E-04 0.40851 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  9.11321E-01 0.30097  3.74717E-03 0.50918  2.85478E-02 0.11116  7.72189E-02 0.21838  3.17602E-01 0.00193  6.68153E-01 0.33338  3.58882E+00 0.40967 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Adjoint weighted time constants using Nauchi's method:

ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  3.26634E-05 0.01891  3.26381E-05 0.01917  3.15572E-05 0.21072 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  4.03312E-05 0.02286  4.02996E-05 0.02305  3.90314E-05 0.20996 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  7.07600E-03 0.14452  5.98452E-04 0.51015  1.20225E-03 0.27296  1.31000E-03 0.35904  3.37256E-03 0.24839  1.91022E-04 1.00000  4.01710E-04 0.66677 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  8.50911E-01 0.51875  1.24906E-02 0.0E+00  3.18241E-02 5.8E-09  1.09375E-01 0.0E+00  3.16990E-01 0.0E+00  1.35398E+00 0.0E+00  8.63638E+00 0.0E+00 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  1.82486E-05 0.35578  1.81867E-05 0.35607  1.14664E-05 0.66940 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  2.27154E-05 0.35382  2.26399E-05 0.35414  1.38928E-05 0.66887 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  2.25019E-03 0.81227  0.00000E+00 0.0E+00  1.31846E-03 1.00000  0.00000E+00 0.0E+00  9.31728E-04 0.66992  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  2.13447E-01 0.48510  0.00000E+00 0.0E+00  3.02552E-02 0.0E+00  0.00000E+00 0.0E+00  3.16990E-01 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  3.20179E-05 0.00982 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  3.94898E-05 0.00368 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  5.56274E-03 0.06040 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -1.74424E+02 0.06635 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  8.85678E-07 0.01553 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  2.35439E-06 0.00610  2.35031E-06 0.00623  2.96349E-06 0.14165 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  5.25502E-05 0.01992  5.26299E-05 0.02064  4.19478E-05 0.16900 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  7.70468E-01 0.00441  7.69454E-01 0.00425  1.11778E+00 0.19248 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.06468E+01 0.18166 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  4.51977E+01 0.01425  4.36336E+01 0.01484 ];


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
WORKING_DIRECTORY         (idx, [1: 74])  = '/Users/tessahennigh/nuclear/serpent-shared/input-decks/examples/180unique2' ;
HOSTNAME                  (idx, [1: 23])  = 'wl-dhcp149-55.Mines.EDU' ;
CPU_TYPE                  (idx, [1:  7])  = 'Unknown' ;
START_DATE                (idx, [1: 24])  = 'Mon May  2 22:10:06 2016' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Mon May  2 22:37:48 2016' ;

% Run parameters:

POP                       (idx, 1)        = 1000 ;
CYCLES                    (idx, 1)        = 10 ;
SKIP                      (idx, 1)        = 10 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1462248606 ;
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

MIN_MACROXS               (idx, [1:   4]) = [  2.18280E-01 0.0E+00  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:  2])  = [  9.00000E-01  9.00000E-01 ];
ST_FRAC                   (idx, [1:   4]) = [  2.31117E-02 0.01519  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  9.76888E-01 0.00036  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  8.38552E-01 0.00142  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  8.38842E-01 0.00142  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  2.71700E+00 0.00489  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  4.95135E+01 0.01114  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  4.95063E+01 0.01115  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  9.50475E+00 0.00522  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  1.24389E+00 0.01487  0.00000E+00 0.0E+00 ];

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 10 ;
SOURCE_POPULATION         (idx, 1)        = 10021 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00210E+03 0.02108 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  1.00210E+03 0.02108 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  2.74693E+01 ;
RUNNING_TIME              (idx, 1)        =  2.77040E+01 ;
INIT_TIME                 (idx, [1:  2])  = [  1.13195E+00  1.13195E+00 ];
PROCESS_TIME              (idx, [1:  2])  = [  2.46681E+01  1.02658E+01 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  1.16362E+00  4.25900E-01  4.15467E-01 ];
BURNUP_CYCLE_TIME         (idx, [1:  2])  = [  7.28183E-01  3.35650E-01 ];
BATEMAN_SOLUTION_TIME     (idx, [1:  2])  = [  5.86550E-01  1.66667E-03 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  2.77027E+01  2.77027E+01 ];
CPU_USAGE                 (idx, 1)        = 0.99153 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  9.97223E-01 0.00057 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.56625E-01 ;

% Memory usage:

ALLOC_MEMSIZE             (idx, 1)        = 1296.66;
MEMSIZE                   (idx, 1)        = 1257.53;
XS_MEMSIZE                (idx, 1)        = 993.78;
MAT_MEMSIZE               (idx, 1)        = 220.83;
RES_MEMSIZE               (idx, 1)        = 34.39;
MISC_MEMSIZE              (idx, 1)        = 8.53;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 39.13;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 7 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 1160429 ;
NEUTRON_EMIN              (idx, 1)        =  1.00000E-11 ;
NEUTRON_EMAX              (idx, 1)        =  2.00000E+01 ;

% Unresolved resonance probability table sampling:

URES_DILU_CUT             (idx, 1)        =  1.00000E-09 ;
URES_EMIN                 (idx, 1)        =  1.00000E+37 ;
URES_EMAX                 (idx, 1)        = -1.00000E+37 ;
URES_AVAIL                (idx, 1)        = 234 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_NUCLIDES              (idx, 1)        = 1434 ;
TOT_TRANSPORT_NUCLIDES    (idx, 1)        = 352 ;
TOT_DOSIMETRY_NUCLIDES    (idx, 1)        = 0 ;
TOT_DECAY_NUCLIDES        (idx, 1)        = 1082 ;
TOT_PHOTON_NUCLIDES       (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 9415 ;
TOT_TRANSMU_REA           (idx, 1)        = 2816 ;

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

TOT_ACTIVITY              (idx, 1)        =  4.12619E+20 ;
TOT_DECAY_HEAT            (idx, 1)        =  1.26993E+08 ;
TOT_SF_RATE               (idx, 1)        =  2.39150E+08 ;
ACTINIDE_ACTIVITY         (idx, 1)        =  7.06423E+19 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        =  5.08760E+06 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        =  3.41975E+20 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        =  1.21904E+08 ;
INHALATION_TOXICITY       (idx, 1)        =  6.29731E+12 ;
INGESTION_TOXICITY        (idx, 1)        =  6.13214E+12 ;
SR90_ACTIVITY             (idx, 1)        =  7.80341E+15 ;
TE132_ACTIVITY            (idx, 1)        =  3.14726E+18 ;
I131_ACTIVITY             (idx, 1)        =  2.07844E+18 ;
I132_ACTIVITY             (idx, 1)        =  3.33478E+18 ;
CS134_ACTIVITY            (idx, 1)        =  1.38302E+16 ;
CS137_ACTIVITY            (idx, 1)        =  1.30551E+16 ;
TOT_PHOTON_SRC            (idx, 1)        =  3.60777E+20 ;

% Normaliation coefficient:

NORM_COEF                 (idx, [1:   4]) = [  2.56680E+17 0.01597  0.00000E+00 0.0E+00 ];

% Parameters for burnup calculation:

BURN_MATERIALS            (idx, 1)        = 180 ;
BURN_MODE                 (idx, 1)        = 2 ;
BURN_STEP                 (idx, 1)        = 1 ;
BURNUP                     (idx, [1:  2])  = [  3.02625E+01  3.04045E+01 ];
BURN_DAYS                 (idx, 1)        =  3.00000E+01 ;

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  3.08640E-01 0.02106 ];
U235_FISS                 (idx, [1:   4]) = [  5.46706E+19 0.00939  5.96925E-01 0.00920 ];
U238_FISS                 (idx, [1:   4]) = [  4.52630E+18 0.06115  4.94233E-02 0.06124 ];
PU239_FISS                (idx, [1:   4]) = [  2.60846E+19 0.01603  2.84814E-01 0.01610 ];
PU241_FISS                (idx, [1:   4]) = [  6.02629E+18 0.04838  6.58043E-02 0.04855 ];
U235_CAPT                 (idx, [1:   4]) = [  1.09177E+19 0.03688  6.69477E-02 0.03644 ];
U238_CAPT                 (idx, [1:   4]) = [  4.14316E+19 0.02982  2.53260E-01 0.01197 ];
PU239_CAPT                (idx, [1:   4]) = [  1.47787E+19 0.02588  9.06364E-02 0.02681 ];
PU240_CAPT                (idx, [1:   4]) = [  1.02080E+19 0.08297  6.22001E-02 0.07251 ];
PU241_CAPT                (idx, [1:   4]) = [  2.32596E+18 0.11142  1.40880E-02 0.09793 ];
XE135_CAPT                (idx, [1:   4]) = [  6.97033E+18 0.04891  4.25149E-02 0.03602 ];
SM149_CAPT                (idx, [1:   4]) = [  1.41801E+18 0.12318  8.63431E-03 0.11673 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   6]) = [  3.00000E+09 0.0E+00  3.00000E+09 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_POWDENS               (idx, [1:   6]) = [  1.00875E+00 0.0E+00  1.00875E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_GENRATE               (idx, [1:   6]) = [  2.39315E+20 0.00096  2.39315E+20 0.00096  0.00000E+00 0.0E+00 ];
TOT_FISSRATE              (idx, [1:   6]) = [  9.15856E+19 0.00019  9.15856E+19 0.00019  0.00000E+00 0.0E+00 ];
TOT_CAPTRATE              (idx, [1:   6]) = [  1.63491E+20 0.02411  1.08700E+20 0.02598  5.47905E+19 0.02784 ];
TOT_ABSRATE               (idx, [1:   6]) = [  2.55076E+20 0.01547  2.00286E+20 0.01412  5.47905E+19 0.02784 ];
TOT_SRCRATE               (idx, [1:   6]) = [  2.56680E+20 0.01597  2.56680E+20 0.01597  0.00000E+00 0.0E+00 ];
TOT_FLUX                  (idx, [1:   6]) = [  1.28969E+22 0.01718  1.91222E+21 0.01879  1.07892E+22 0.01733 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  1.86509E+18 0.17515 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  2.56941E+20 0.01599 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  1.27203E+22 0.02004 ];
INI_FMASS                 (idx, 1)        =  2.97398E+03 ;
TOT_FMASS                 (idx, 1)        =  2.88974E+03 ;
INI_BURN_FMASS            (idx, 1)        =  2.97398E+03 ;
TOT_BURN_FMASS            (idx, 1)        =  2.88974E+03 ;

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.61302E+00 0.00114 ];
FISSE                     (idx, [1:   2]) = [  2.04448E+02 0.00019 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  9.36290E-01 0.01283  9.30436E-01 0.01571  4.01620E-03 0.21512 ];
IMP_KEFF                  (idx, [1:   2]) = [  9.34452E-01 0.01570 ];
COL_KEFF                  (idx, [1:   2]) = [  9.34452E-01 0.01570 ];
ABS_KEFF                  (idx, [1:   2]) = [  9.34452E-01 0.01570 ];
ABS_KINF                  (idx, [1:   2]) = [  9.41159E-01 0.01522 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% Forward-weighted delayed neutron parameters:

FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  5.90735E-03 0.16480  1.10562E-04 1.00000  8.59302E-04 0.51756  1.31610E-03 0.27784  2.63009E-03 0.14784  9.91299E-04 0.31402  0.00000E+00 0.0E+00 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  3.64602E-01 0.10616  1.24906E-03 1.00000  9.45335E-03 0.50925  8.73522E-02 0.16668  3.17748E-01 0.00423  7.60466E-01 0.27502  0.00000E+00 0.0E+00 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Adjoint weighted time constants using Nauchi's method:

ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  5.04592E-05 0.03140  5.04537E-05 0.03130  3.73055E-05 0.34572 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  4.71333E-05 0.02482  4.71295E-05 0.02481  3.45714E-05 0.33279 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  4.35738E-03 0.20771  1.88501E-04 1.00000  2.07469E-04 1.00000  9.15202E-04 0.51068  1.44422E-03 0.41615  1.30318E-03 0.55610  2.98805E-04 1.00000 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  1.00500E+00 0.50668  1.24906E-02 0.0E+00  3.18241E-02 0.0E+00  1.09375E-01 9.1E-09  3.15730E-01 0.00399  1.34725E+00 0.00500  8.63638E+00 0.0E+00 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  2.62595E-05 0.35417  2.62682E-05 0.35409  3.17976E-06 1.00000 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  2.50100E-05 0.35672  2.50183E-05 0.35664  3.05113E-06 1.00000 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  1.22526E-03 1.00000  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  1.22526E-03 1.00000  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  3.17619E-01 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  3.17619E-01 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  4.73270E-05 0.01380 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  4.42471E-05 0.00565 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  5.23261E-03 0.17427 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -1.10019E+02 0.17238 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  9.89081E-07 0.00862 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  2.23413E-06 0.00758  2.23481E-06 0.00765  2.12401E-06 0.12935 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  6.29112E-05 0.01325  6.29925E-05 0.01318  4.41136E-05 0.14813 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  7.60562E-01 0.00640  7.60859E-01 0.00655  1.04420E+00 0.26241 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.14718E+01 0.38193 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  4.95063E+01 0.01115  4.79686E+01 0.01355 ];

