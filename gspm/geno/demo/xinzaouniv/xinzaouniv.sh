#!/bin/bash

reclude geno/base/io

width=$(geno::base::io::screen::width)
height=$(geno::base::io::screen::height)

geno::base::io::screen::clearscreen
geno::base::io::screen::text::writeatscreencenter "新 造 大 学"
geno::base::io::screen::text::writeattopleft $((height / 2 + 3)) $((width / 2)) "新存档"
geno::base::io::screen::text::writeattopleft $((height / 2 + 4)) $((width / 2)) "读存档"
geno::base::io::screen::text::writeattopleft $((height / 2 + 5)) $((width / 2)) "输入作弊码"
geno::base::io::screen::text::writeattopleft $((height / 2 + 6)) $((width / 2)) "退出"
geno::base::io::screen::cursor::putatlastline
geno::base::io::read::key
