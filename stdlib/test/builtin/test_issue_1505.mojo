# ===----------------------------------------------------------------------=== #
#
# This file is Modular Inc proprietary.
#
# ===----------------------------------------------------------------------=== #
# REQUIRES: disabled
# RUN: %mojo -debug-level full %s
# Test for https://github.com/modularml/mojo/issues/1505

from random import random_ui64

from testing import *


fn gen_perm() -> StaticIntTuple[64]:
    var result = StaticIntTuple[64]()
    for i in range(64):
        result[i] = i
    return result


def main():
    alias p = gen_perm()
    assert_equal(
        p,
        StaticIntTuple[64](
            0,
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15,
            16,
            17,
            18,
            19,
            20,
            21,
            22,
            23,
            24,
            25,
            26,
            27,
            28,
            29,
            30,
            31,
            32,
            33,
            34,
            35,
            36,
            37,
            38,
            39,
            40,
            41,
            42,
            43,
            44,
            45,
            46,
            47,
            48,
            49,
            50,
            51,
            52,
            53,
            54,
            55,
            56,
            57,
            58,
            59,
            60,
            61,
            62,
            63,
        ),
    )

    # generate random data to prevent that everything gets simplified
    var data1 = SIMD[DType.uint8, 64]()
    for i in range(64):
        data1[i] = random_ui64(0, 100).cast[DType.uint8]()
    assert_equal(
        data1,
        SIMD[DType.uint8, 64](
            0,
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15,
            16,
            17,
            18,
            19,
            20,
            21,
            22,
            23,
            24,
            25,
            26,
            27,
            28,
            29,
            30,
            31,
            32,
            33,
            34,
            35,
            36,
            37,
            38,
            39,
            40,
            41,
            42,
            43,
            44,
            45,
            46,
            47,
            48,
            49,
            50,
            51,
            52,
            53,
            54,
            55,
            56,
            57,
            58,
            59,
            60,
            61,
            62,
            63,
        ),
    )

    let data2 = data1.shuffle[
        p[0],
        p[1],
        p[2],
        p[3],
        p[4],
        p[5],
        p[6],
        p[7],
        p[8],
        p[9],
        p[10],
        p[11],
        p[12],
        p[13],
        p[14],
        p[15],
        p[16],
        p[17],
        p[18],
        p[19],
        p[20],
        p[21],
        p[22],
        p[23],
        p[24],
        p[25],
        p[26],
        p[27],
        p[28],
        p[29],
        p[30],
        p[31],
        p[32],
        p[33],
        p[34],
        p[35],
        p[36],
        p[37],
        p[38],
        p[39],
        p[40],
        p[41],
        p[42],
        p[43],
        p[44],
        p[45],
        p[46],
        p[47],
        p[48],
        p[49],
        p[50],
        p[51],
        p[52],
        p[53],
        p[54],
        p[55],
        p[56],
        p[57],
        p[58],
        p[59],
        p[60],
        p[61],
        p[62],
        p[63],
    ]()

    assert_equal(
        data2,
        SIMD[DType.uint8, 64](
            0,
            13,
            76,
            46,
            53,
            22,
            4,
            68,
            68,
            94,
            38,
            52,
            83,
            3,
            5,
            53,
            67,
            0,
            38,
            6,
            42,
            69,
            59,
            93,
            85,
            53,
            9,
            66,
            42,
            70,
            91,
            76,
            26,
            4,
            74,
            33,
            63,
            76,
            100,
            36,
            24,
            99,
            72,
            76,
            65,
            7,
            63,
            89,
            27,
            44,
            77,
            48,
            24,
            27,
            36,
            16,
            49,
            90,
            91,
            6,
            91,
            50,
            52,
            32,
        ),
    )
