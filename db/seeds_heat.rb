# @HEAT = {none: (0..100),
#          mild: (101..2_500),
#          medium: (2_501..10_000),
#          hot: (10_001..350_000),
#          extreme:(350_001..2_200_000)
# }


@CHILLI_SHU = {
  annuum: {
    bell: { none: (0..0) },
    cayenne: { hot: (30_000..50_000) },
    jalapeno: { medium: (2_000..8_000) },
    poblano: { mild: (1_000..1_500) },
    serrano: { medium: (5_000..15_000) }
  },
  baccatum: {
    aji: { hot: (10_000..30_000) }
  },
  chinense: {
    carolina_reaper: { extreme: (1_800_000..2_200_000) },
    habenero: { hot: (100_000..350_000) },
    naga: { extreme: (1_000_000..1_500_000) },
    scotch_bonnet: { hot: (80_000..400_000) }
  },
  frutescens: {
    piri_piri: { hot: (50_000..100_000) },
    tabasco: { medium: (10_000..35_000) }
  },
  pubescens: {
    manzano: { hot: (10_000..30_000) },
    rocoto: { hot: (30_000..100_000) }
  }
}
