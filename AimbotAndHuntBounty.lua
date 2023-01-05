
repeat wait()
until game:IsLoaded() and game.Players.LocalPlayer

if getgenv().Key == nil or getgenv().Key == " " then
	return game.Players.LocalPlayer:Kick("Input your key")
end
local start = os.time()
wait(2.3)
local Vin = {} local hexNums = {} for i = 0, 9 do hexNums[i] = tostring(i) end hexNums[10] = "A" hexNums[11] = "B" hexNums[12] = "C" hexNums[13] = "D" hexNums[14] = "E" hexNums[15] = "F" local decNums = {} for i = 0, 9 do decNums[tostring(i)] = i end decNums["A"] = 10 decNums["B"] = 11 decNums["C"] = 12 decNums["D"] = 13 decNums["E"] = 14 decNums["F"] = 15 Vin.decToHex = function(num) local output = "" while num > 0 do local remainder = num % 16 output = hexNums[remainder] .. output num = math.floor(num / 16) end return output end Vin.hexToDec = function(num) local output = 0 local max = string.len(num) for i = 1, max do local decnum = decNums[string.sub(num, i, i)] output = output + decnum * (16 ^ (max - i)) end return output end Vin.GetUTF8Table = function() local TableUTF8 = {} local i = 1 repeat table.insert(TableUTF8, {utf8.char(i), i}) i = i + 1 until i == 127 return TableUTF8 end Vin.UTF8Table = Vin.GetUTF8Table() Vin.GetUTF8Number = function(char) local UTF8Table = Vin.UTF8Table if string.len(char) > 1 then elseif string.len(char) < 1 then else for q, v in pairs(UTF8Table) do if char == v[1] then return v[2] end end end end Vin.Decrypt = function(text, key) local KeyCode = 0 local TextCodes = {} local UTF8Table = Vin.UTF8Table local EncryptedCodes = string.split(text, "-") local Decrypted = "" for a = 1, string.len(key) do KeyCode = (KeyCode + Vin.GetUTF8Number(string.sub(key, a, a))) end for i, v in pairs(EncryptedCodes) do if EncryptedCodes[i] ~= "" then table.insert(TextCodes, {Vin.hexToDec(EncryptedCodes[i]) / KeyCode}) end end for i, v in pairs(TextCodes) do for q, e in pairs(UTF8Table) do if v[1] == e[2] then Decrypted = Decrypted .. e[1] end end end return Decrypted end
local crypto = {} do crypto.hash = (function() local ipairs = ipairs local bit32_band = bit32.band local bit32_bor = bit32.bor local bit32_bxor = bit32.bxor local bit32_lshift = bit32.lshift local bit32_rshift = bit32.rshift local bit32_lrotate = bit32.lrotate local bit32_rrotate = bit32.rrotate local sha2_K_lo, sha2_K_hi, sha2_H_lo, sha2_H_hi, sha3_RC_lo, sha3_RC_hi = {}, {}, {}, {}, {}, {} local sha2_H_ext256 = { [224] = {}; [256] = sha2_H_hi; } local sha2_H_ext512_lo, sha2_H_ext512_hi = { [384] = {}; [512] = sha2_H_lo; }, { [384] = {}; [512] = sha2_H_hi; } local md5_K, md5_sha1_H = {}, {0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476, 0xC3D2E1F0} local md5_next_shift = {0, 0, 0, 0, 0, 0, 0, 0, 28, 25, 26, 27, 0, 0, 10, 9, 11, 12, 0, 15, 16, 17, 18, 0, 20, 22, 23, 21} local HEX64, XOR64A5, lanes_index_base local common_W = {} local K_lo_modulo, hi_factor, hi_factor_keccak = 4294967296, 0, 0 local TWO_POW_NEG_56 = 2 ^ -56 local TWO_POW_NEG_17 = 2 ^ -17 local TWO_POW_2 = 2 ^ 2 local TWO_POW_3 = 2 ^ 3 local TWO_POW_4 = 2 ^ 4 local TWO_POW_5 = 2 ^ 5 local TWO_POW_6 = 2 ^ 6 local TWO_POW_7 = 2 ^ 7 local TWO_POW_8 = 2 ^ 8 local TWO_POW_9 = 2 ^ 9 local TWO_POW_10 = 2 ^ 10 local TWO_POW_11 = 2 ^ 11 local TWO_POW_12 = 2 ^ 12 local TWO_POW_13 = 2 ^ 13 local TWO_POW_14 = 2 ^ 14 local TWO_POW_15 = 2 ^ 15 local TWO_POW_16 = 2 ^ 16 local TWO_POW_17 = 2 ^ 17 local TWO_POW_18 = 2 ^ 18 local TWO_POW_19 = 2 ^ 19 local TWO_POW_20 = 2 ^ 20 local TWO_POW_21 = 2 ^ 21 local TWO_POW_22 = 2 ^ 22 local TWO_POW_23 = 2 ^ 23 local TWO_POW_24 = 2 ^ 24 local TWO_POW_25 = 2 ^ 25 local TWO_POW_26 = 2 ^ 26 local TWO_POW_27 = 2 ^ 27 local TWO_POW_28 = 2 ^ 28 local TWO_POW_29 = 2 ^ 29 local TWO_POW_30 = 2 ^ 30 local TWO_POW_31 = 2 ^ 31 local TWO_POW_32 = 2 ^ 32 local TWO_POW_40 = 2 ^ 40 local TWO56_POW_7 = 256 ^ 7 local function sha256_feed_64(H, str, offs, size) local W, K = common_W, sha2_K_hi local h1, h2, h3, h4, h5, h6, h7, h8 = H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8] for pos = offs, offs + size - 1, 64 do for j = 1, 16 do pos = pos + 4 local a, b, c, d = string.byte(str, pos - 3, pos) W[j] = ((a * 256 + b) * 256 + c) * 256 + d end for j = 17, 64 do local a, b = W[j - 15], W[j - 2] W[j] = bit32_bxor(bit32_rrotate(a, 7), bit32_lrotate(a, 14), bit32_rshift(a, 3)) + bit32_bxor(bit32_lrotate(b, 15), bit32_lrotate(b, 13), bit32_rshift(b, 10)) + W[j - 7] + W[j - 16] end local a, b, c, d, e, f, g, h = h1, h2, h3, h4, h5, h6, h7, h8 for j = 1, 64 do local z = bit32_bxor(bit32_rrotate(e, 6), bit32_rrotate(e, 11), bit32_lrotate(e, 7)) + bit32_band(e, f) + bit32_band(-1 - e, g) + h + K[j] + W[j] h = g g = f f = e e = z + d d = c c = b b = a a = z + bit32_band(d, c) + bit32_band(a, bit32_bxor(d, c)) + bit32_bxor(bit32_rrotate(a, 2), bit32_rrotate(a, 13), bit32_lrotate(a, 10)) end h1, h2, h3, h4 = (a + h1) % 4294967296, (b + h2) % 4294967296, (c + h3) % 4294967296, (d + h4) % 4294967296 h5, h6, h7, h8 = (e + h5) % 4294967296, (f + h6) % 4294967296, (g + h7) % 4294967296, (h + h8) % 4294967296 end H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8] = h1, h2, h3, h4, h5, h6, h7, h8 end local function sha512_feed_128(H_lo, H_hi, str, offs, size) local W, K_lo, K_hi = common_W, sha2_K_lo, sha2_K_hi local h1_lo, h2_lo, h3_lo, h4_lo, h5_lo, h6_lo, h7_lo, h8_lo = H_lo[1], H_lo[2], H_lo[3], H_lo[4], H_lo[5], H_lo[6], H_lo[7], H_lo[8] local h1_hi, h2_hi, h3_hi, h4_hi, h5_hi, h6_hi, h7_hi, h8_hi = H_hi[1], H_hi[2], H_hi[3], H_hi[4], H_hi[5], H_hi[6], H_hi[7], H_hi[8] for pos = offs, offs + size - 1, 128 do for j = 1, 16 * 2 do pos = pos + 4 local a, b, c, d = string.byte(str, pos - 3, pos) W[j] = ((a * 256 + b) * 256 + c) * 256 + d end for jj = 34, 160, 2 do local a_lo, a_hi, b_lo, b_hi = W[jj - 30], W[jj - 31], W[jj - 4], W[jj - 5] local tmp1 = bit32_bxor(bit32_rshift(a_lo, 1) + bit32_lshift(a_hi, 31), bit32_rshift(a_lo, 8) + bit32_lshift(a_hi, 24), bit32_rshift(a_lo, 7) + bit32_lshift(a_hi, 25)) % 4294967296 + bit32_bxor(bit32_rshift(b_lo, 19) + bit32_lshift(b_hi, 13), bit32_lshift(b_lo, 3) + bit32_rshift(b_hi, 29), bit32_rshift(b_lo, 6) + bit32_lshift(b_hi, 26)) % 4294967296 + W[jj - 14] + W[jj - 32] local tmp2 = tmp1 % 4294967296 W[jj - 1] = bit32_bxor(bit32_rshift(a_hi, 1) + bit32_lshift(a_lo, 31), bit32_rshift(a_hi, 8) + bit32_lshift(a_lo, 24), bit32_rshift(a_hi, 7)) + bit32_bxor(bit32_rshift(b_hi, 19) + bit32_lshift(b_lo, 13), bit32_lshift(b_hi, 3) + bit32_rshift(b_lo, 29), bit32_rshift(b_hi, 6)) + W[jj - 15] + W[jj - 33] + (tmp1 - tmp2) / 4294967296 W[jj] = tmp2 end local a_lo, b_lo, c_lo, d_lo, e_lo, f_lo, g_lo, h_lo = h1_lo, h2_lo, h3_lo, h4_lo, h5_lo, h6_lo, h7_lo, h8_lo local a_hi, b_hi, c_hi, d_hi, e_hi, f_hi, g_hi, h_hi = h1_hi, h2_hi, h3_hi, h4_hi, h5_hi, h6_hi, h7_hi, h8_hi for j = 1, 80 do local jj = 2 * j local tmp1 = bit32_bxor(bit32_rshift(e_lo, 14) + bit32_lshift(e_hi, 18), bit32_rshift(e_lo, 18) + bit32_lshift(e_hi, 14), bit32_lshift(e_lo, 23) + bit32_rshift(e_hi, 9)) % 4294967296 + (bit32_band(e_lo, f_lo) + bit32_band(-1 - e_lo, g_lo)) % 4294967296 + h_lo + K_lo[j] + W[jj] local z_lo = tmp1 % 4294967296 local z_hi = bit32_bxor(bit32_rshift(e_hi, 14) + bit32_lshift(e_lo, 18), bit32_rshift(e_hi, 18) + bit32_lshift(e_lo, 14), bit32_lshift(e_hi, 23) + bit32_rshift(e_lo, 9)) + bit32_band(e_hi, f_hi) + bit32_band(-1 - e_hi, g_hi) + h_hi + K_hi[j] + W[jj - 1] + (tmp1 - z_lo) / 4294967296 h_lo = g_lo h_hi = g_hi g_lo = f_lo g_hi = f_hi f_lo = e_lo f_hi = e_hi tmp1 = z_lo + d_lo e_lo = tmp1 % 4294967296 e_hi = z_hi + d_hi + (tmp1 - e_lo) / 4294967296 d_lo = c_lo d_hi = c_hi c_lo = b_lo c_hi = b_hi b_lo = a_lo b_hi = a_hi tmp1 = z_lo + (bit32_band(d_lo, c_lo) + bit32_band(b_lo, bit32_bxor(d_lo, c_lo))) % 4294967296 + bit32_bxor(bit32_rshift(b_lo, 28) + bit32_lshift(b_hi, 4), bit32_lshift(b_lo, 30) + bit32_rshift(b_hi, 2), bit32_lshift(b_lo, 25) + bit32_rshift(b_hi, 7)) % 4294967296 a_lo = tmp1 % 4294967296 a_hi = z_hi + (bit32_band(d_hi, c_hi) + bit32_band(b_hi, bit32_bxor(d_hi, c_hi))) + bit32_bxor(bit32_rshift(b_hi, 28) + bit32_lshift(b_lo, 4), bit32_lshift(b_hi, 30) + bit32_rshift(b_lo, 2), bit32_lshift(b_hi, 25) + bit32_rshift(b_lo, 7)) + (tmp1 - a_lo) / 4294967296 end a_lo = h1_lo + a_lo h1_lo = a_lo % 4294967296 h1_hi = (h1_hi + a_hi + (a_lo - h1_lo) / 4294967296) % 4294967296 a_lo = h2_lo + b_lo h2_lo = a_lo % 4294967296 h2_hi = (h2_hi + b_hi + (a_lo - h2_lo) / 4294967296) % 4294967296 a_lo = h3_lo + c_lo h3_lo = a_lo % 4294967296 h3_hi = (h3_hi + c_hi + (a_lo - h3_lo) / 4294967296) % 4294967296 a_lo = h4_lo + d_lo h4_lo = a_lo % 4294967296 h4_hi = (h4_hi + d_hi + (a_lo - h4_lo) / 4294967296) % 4294967296 a_lo = h5_lo + e_lo h5_lo = a_lo % 4294967296 h5_hi = (h5_hi + e_hi + (a_lo - h5_lo) / 4294967296) % 4294967296 a_lo = h6_lo + f_lo h6_lo = a_lo % 4294967296 h6_hi = (h6_hi + f_hi + (a_lo - h6_lo) / 4294967296) % 4294967296 a_lo = h7_lo + g_lo h7_lo = a_lo % 4294967296 h7_hi = (h7_hi + g_hi + (a_lo - h7_lo) / 4294967296) % 4294967296 a_lo = h8_lo + h_lo h8_lo = a_lo % 4294967296 h8_hi = (h8_hi + h_hi + (a_lo - h8_lo) / 4294967296) % 4294967296 end H_lo[1], H_lo[2], H_lo[3], H_lo[4], H_lo[5], H_lo[6], H_lo[7], H_lo[8] = h1_lo, h2_lo, h3_lo, h4_lo, h5_lo, h6_lo, h7_lo, h8_lo H_hi[1], H_hi[2], H_hi[3], H_hi[4], H_hi[5], H_hi[6], H_hi[7], H_hi[8] = h1_hi, h2_hi, h3_hi, h4_hi, h5_hi, h6_hi, h7_hi, h8_hi end local function md5_feed_64(H, str, offs, size) local W, K, md5_next_shift = common_W, md5_K, md5_next_shift local h1, h2, h3, h4 = H[1], H[2], H[3], H[4] for pos = offs, offs + size - 1, 64 do for j = 1, 16 do pos = pos + 4 local a, b, c, d = string.byte(str, pos - 3, pos) W[j] = ((d * 256 + c) * 256 + b) * 256 + a end local a, b, c, d = h1, h2, h3, h4 local s = 25 for j = 1, 16 do local F = bit32_rrotate(bit32_band(b, c) + bit32_band(-1 - b, d) + a + K[j] + W[j], s) + b s = md5_next_shift[s] a = d d = c c = b b = F end s = 27 for j = 17, 32 do local F = bit32_rrotate(bit32_band(d, b) + bit32_band(-1 - d, c) + a + K[j] + W[(5 * j - 4) % 16 + 1], s) + b s = md5_next_shift[s] a = d d = c c = b b = F end s = 28 for j = 33, 48 do local F = bit32_rrotate(bit32_bxor(bit32_bxor(b, c), d) + a + K[j] + W[(3 * j + 2) % 16 + 1], s) + b s = md5_next_shift[s] a = d d = c c = b b = F end s = 26 for j = 49, 64 do local F = bit32_rrotate(bit32_bxor(c, bit32_bor(b, -1 - d)) + a + K[j] + W[(j * 7 - 7) % 16 + 1], s) + b s = md5_next_shift[s] a = d d = c c = b b = F end h1 = (a + h1) % 4294967296 h2 = (b + h2) % 4294967296 h3 = (c + h3) % 4294967296 h4 = (d + h4) % 4294967296 end H[1], H[2], H[3], H[4] = h1, h2, h3, h4 end local function sha1_feed_64(H, str, offs, size) local W = common_W local h1, h2, h3, h4, h5 = H[1], H[2], H[3], H[4], H[5] for pos = offs, offs + size - 1, 64 do for j = 1, 16 do pos = pos + 4 local a, b, c, d = string.byte(str, pos - 3, pos) W[j] = ((a * 256 + b) * 256 + c) * 256 + d end for j = 17, 80 do W[j] = bit32_lrotate(bit32_bxor(W[j - 3], W[j - 8], W[j - 14], W[j - 16]), 1) end local a, b, c, d, e = h1, h2, h3, h4, h5 for j = 1, 20 do local z = bit32_lrotate(a, 5) + bit32_band(b, c) + bit32_band(-1 - b, d) + 0x5A827999 + W[j] + e e = d d = c c = bit32_rrotate(b, 2) b = a a = z end for j = 21, 40 do local z = bit32_lrotate(a, 5) + bit32_bxor(b, c, d) + 0x6ED9EBA1 + W[j] + e e = d d = c c = bit32_rrotate(b, 2) b = a a = z end for j = 41, 60 do local z = bit32_lrotate(a, 5) + bit32_band(d, c) + bit32_band(b, bit32_bxor(d, c)) + 0x8F1BBCDC + W[j] + e e = d d = c c = bit32_rrotate(b, 2) b = a a = z end for j = 61, 80 do local z = bit32_lrotate(a, 5) + bit32_bxor(b, c, d) + 0xCA62C1D6 + W[j] + e e = d d = c c = bit32_rrotate(b, 2) b = a a = z end h1 = (a + h1) % 4294967296 h2 = (b + h2) % 4294967296 h3 = (c + h3) % 4294967296 h4 = (d + h4) % 4294967296 h5 = (e + h5) % 4294967296 end H[1], H[2], H[3], H[4], H[5] = h1, h2, h3, h4, h5 end local function keccak_feed(lanes_lo, lanes_hi, str, offs, size, block_size_in_bytes) local RC_lo, RC_hi = sha3_RC_lo, sha3_RC_hi local qwords_qty = block_size_in_bytes / 8 for pos = offs, offs + size - 1, block_size_in_bytes do for j = 1, qwords_qty do local a, b, c, d = string.byte(str, pos + 1, pos + 4) lanes_lo[j] = bit32_bxor(lanes_lo[j], ((d * 256 + c) * 256 + b) * 256 + a) pos = pos + 8 a, b, c, d = string.byte(str, pos - 3, pos) lanes_hi[j] = bit32_bxor(lanes_hi[j], ((d * 256 + c) * 256 + b) * 256 + a) end local L01_lo, L01_hi, L02_lo, L02_hi, L03_lo, L03_hi, L04_lo, L04_hi, L05_lo, L05_hi, L06_lo, L06_hi, L07_lo, L07_hi, L08_lo, L08_hi, L09_lo, L09_hi, L10_lo, L10_hi, L11_lo, L11_hi, L12_lo, L12_hi, L13_lo, L13_hi, L14_lo, L14_hi, L15_lo, L15_hi, L16_lo, L16_hi, L17_lo, L17_hi, L18_lo, L18_hi, L19_lo, L19_hi, L20_lo, L20_hi, L21_lo, L21_hi, L22_lo, L22_hi, L23_lo, L23_hi, L24_lo, L24_hi, L25_lo, L25_hi = lanes_lo[1], lanes_hi[1], lanes_lo[2], lanes_hi[2], lanes_lo[3], lanes_hi[3], lanes_lo[4], lanes_hi[4], lanes_lo[5], lanes_hi[5], lanes_lo[6], lanes_hi[6], lanes_lo[7], lanes_hi[7], lanes_lo[8], lanes_hi[8], lanes_lo[9], lanes_hi[9], lanes_lo[10], lanes_hi[10], lanes_lo[11], lanes_hi[11], lanes_lo[12], lanes_hi[12], lanes_lo[13], lanes_hi[13], lanes_lo[14], lanes_hi[14], lanes_lo[15], lanes_hi[15], lanes_lo[16], lanes_hi[16], lanes_lo[17], lanes_hi[17], lanes_lo[18], lanes_hi[18], lanes_lo[19], lanes_hi[19], lanes_lo[20], lanes_hi[20], lanes_lo[21], lanes_hi[21], lanes_lo[22], lanes_hi[22], lanes_lo[23], lanes_hi[23], lanes_lo[24], lanes_hi[24], lanes_lo[25], lanes_hi[25] for round_idx = 1, 24 do local C1_lo = bit32_bxor(L01_lo, L06_lo, L11_lo, L16_lo, L21_lo) local C1_hi = bit32_bxor(L01_hi, L06_hi, L11_hi, L16_hi, L21_hi) local C2_lo = bit32_bxor(L02_lo, L07_lo, L12_lo, L17_lo, L22_lo) local C2_hi = bit32_bxor(L02_hi, L07_hi, L12_hi, L17_hi, L22_hi) local C3_lo = bit32_bxor(L03_lo, L08_lo, L13_lo, L18_lo, L23_lo) local C3_hi = bit32_bxor(L03_hi, L08_hi, L13_hi, L18_hi, L23_hi) local C4_lo = bit32_bxor(L04_lo, L09_lo, L14_lo, L19_lo, L24_lo) local C4_hi = bit32_bxor(L04_hi, L09_hi, L14_hi, L19_hi, L24_hi) local C5_lo = bit32_bxor(L05_lo, L10_lo, L15_lo, L20_lo, L25_lo) local C5_hi = bit32_bxor(L05_hi, L10_hi, L15_hi, L20_hi, L25_hi) local D_lo = bit32_bxor(C1_lo, C3_lo * 2 + (C3_hi % TWO_POW_32 - C3_hi % TWO_POW_31) / TWO_POW_31) local D_hi = bit32_bxor(C1_hi, C3_hi * 2 + (C3_lo % TWO_POW_32 - C3_lo % TWO_POW_31) / TWO_POW_31) local T0_lo = bit32_bxor(D_lo, L02_lo) local T0_hi = bit32_bxor(D_hi, L02_hi) local T1_lo = bit32_bxor(D_lo, L07_lo) local T1_hi = bit32_bxor(D_hi, L07_hi) local T2_lo = bit32_bxor(D_lo, L12_lo) local T2_hi = bit32_bxor(D_hi, L12_hi) local T3_lo = bit32_bxor(D_lo, L17_lo) local T3_hi = bit32_bxor(D_hi, L17_hi) local T4_lo = bit32_bxor(D_lo, L22_lo) local T4_hi = bit32_bxor(D_hi, L22_hi) L02_lo = (T1_lo % TWO_POW_32 - T1_lo % TWO_POW_20) / TWO_POW_20 + T1_hi * TWO_POW_12 L02_hi = (T1_hi % TWO_POW_32 - T1_hi % TWO_POW_20) / TWO_POW_20 + T1_lo * TWO_POW_12 L07_lo = (T3_lo % TWO_POW_32 - T3_lo % TWO_POW_19) / TWO_POW_19 + T3_hi * TWO_POW_13 L07_hi = (T3_hi % TWO_POW_32 - T3_hi % TWO_POW_19) / TWO_POW_19 + T3_lo * TWO_POW_13 L12_lo = T0_lo * 2 + (T0_hi % TWO_POW_32 - T0_hi % TWO_POW_31) / TWO_POW_31 L12_hi = T0_hi * 2 + (T0_lo % TWO_POW_32 - T0_lo % TWO_POW_31) / TWO_POW_31 L17_lo = T2_lo * TWO_POW_10 + (T2_hi % TWO_POW_32 - T2_hi % TWO_POW_22) / TWO_POW_22 L17_hi = T2_hi * TWO_POW_10 + (T2_lo % TWO_POW_32 - T2_lo % TWO_POW_22) / TWO_POW_22 L22_lo = T4_lo * TWO_POW_2 + (T4_hi % TWO_POW_32 - T4_hi % TWO_POW_30) / TWO_POW_30 L22_hi = T4_hi * TWO_POW_2 + (T4_lo % TWO_POW_32 - T4_lo % TWO_POW_30) / TWO_POW_30 D_lo = bit32_bxor(C2_lo, C4_lo * 2 + (C4_hi % TWO_POW_32 - C4_hi % TWO_POW_31) / TWO_POW_31) D_hi = bit32_bxor(C2_hi, C4_hi * 2 + (C4_lo % TWO_POW_32 - C4_lo % TWO_POW_31) / TWO_POW_31) T0_lo = bit32_bxor(D_lo, L03_lo) T0_hi = bit32_bxor(D_hi, L03_hi) T1_lo = bit32_bxor(D_lo, L08_lo) T1_hi = bit32_bxor(D_hi, L08_hi) T2_lo = bit32_bxor(D_lo, L13_lo) T2_hi = bit32_bxor(D_hi, L13_hi) T3_lo = bit32_bxor(D_lo, L18_lo) T3_hi = bit32_bxor(D_hi, L18_hi) T4_lo = bit32_bxor(D_lo, L23_lo) T4_hi = bit32_bxor(D_hi, L23_hi) L03_lo = (T2_lo % TWO_POW_32 - T2_lo % TWO_POW_21) / TWO_POW_21 + T2_hi * TWO_POW_11 L03_hi = (T2_hi % TWO_POW_32 - T2_hi % TWO_POW_21) / TWO_POW_21 + T2_lo * TWO_POW_11 L08_lo = (T4_lo % TWO_POW_32 - T4_lo % TWO_POW_3) / TWO_POW_3 + T4_hi * TWO_POW_29 % TWO_POW_32 L08_hi = (T4_hi % TWO_POW_32 - T4_hi % TWO_POW_3) / TWO_POW_3 + T4_lo * TWO_POW_29 % TWO_POW_32 L13_lo = T1_lo * TWO_POW_6 + (T1_hi % TWO_POW_32 - T1_hi % TWO_POW_26) / TWO_POW_26 L13_hi = T1_hi * TWO_POW_6 + (T1_lo % TWO_POW_32 - T1_lo % TWO_POW_26) / TWO_POW_26 L18_lo = T3_lo * TWO_POW_15 + (T3_hi % TWO_POW_32 - T3_hi % TWO_POW_17) / TWO_POW_17 L18_hi = T3_hi * TWO_POW_15 + (T3_lo % TWO_POW_32 - T3_lo % TWO_POW_17) / TWO_POW_17 L23_lo = (T0_lo % TWO_POW_32 - T0_lo % TWO_POW_2) / TWO_POW_2 + T0_hi * TWO_POW_30 % TWO_POW_32 L23_hi = (T0_hi % TWO_POW_32 - T0_hi % TWO_POW_2) / TWO_POW_2 + T0_lo * TWO_POW_30 % TWO_POW_32 D_lo = bit32_bxor(C3_lo, C5_lo * 2 + (C5_hi % TWO_POW_32 - C5_hi % TWO_POW_31) / TWO_POW_31) D_hi = bit32_bxor(C3_hi, C5_hi * 2 + (C5_lo % TWO_POW_32 - C5_lo % TWO_POW_31) / TWO_POW_31) T0_lo = bit32_bxor(D_lo, L04_lo) T0_hi = bit32_bxor(D_hi, L04_hi) T1_lo = bit32_bxor(D_lo, L09_lo) T1_hi = bit32_bxor(D_hi, L09_hi) T2_lo = bit32_bxor(D_lo, L14_lo) T2_hi = bit32_bxor(D_hi, L14_hi) T3_lo = bit32_bxor(D_lo, L19_lo) T3_hi = bit32_bxor(D_hi, L19_hi) T4_lo = bit32_bxor(D_lo, L24_lo) T4_hi = bit32_bxor(D_hi, L24_hi) L04_lo = T3_lo * TWO_POW_21 % TWO_POW_32 + (T3_hi % TWO_POW_32 - T3_hi % TWO_POW_11) / TWO_POW_11 L04_hi = T3_hi * TWO_POW_21 % TWO_POW_32 + (T3_lo % TWO_POW_32 - T3_lo % TWO_POW_11) / TWO_POW_11 L09_lo = T0_lo * TWO_POW_28 % TWO_POW_32 + (T0_hi % TWO_POW_32 - T0_hi % TWO_POW_4) / TWO_POW_4 L09_hi = T0_hi * TWO_POW_28 % TWO_POW_32 + (T0_lo % TWO_POW_32 - T0_lo % TWO_POW_4) / TWO_POW_4 L14_lo = T2_lo * TWO_POW_25 % TWO_POW_32 + (T2_hi % TWO_POW_32 - T2_hi % TWO_POW_7) / TWO_POW_7 L14_hi = T2_hi * TWO_POW_25 % TWO_POW_32 + (T2_lo % TWO_POW_32 - T2_lo % TWO_POW_7) / TWO_POW_7 L19_lo = (T4_lo % TWO_POW_32 - T4_lo % TWO_POW_8) / TWO_POW_8 + T4_hi * TWO_POW_24 % TWO_POW_32 L19_hi = (T4_hi % TWO_POW_32 - T4_hi % TWO_POW_8) / TWO_POW_8 + T4_lo * TWO_POW_24 % TWO_POW_32 L24_lo = (T1_lo % TWO_POW_32 - T1_lo % TWO_POW_9) / TWO_POW_9 + T1_hi * TWO_POW_23 % TWO_POW_32 L24_hi = (T1_hi % TWO_POW_32 - T1_hi % TWO_POW_9) / TWO_POW_9 + T1_lo * TWO_POW_23 % TWO_POW_32 D_lo = bit32_bxor(C4_lo, C1_lo * 2 + (C1_hi % TWO_POW_32 - C1_hi % TWO_POW_31) / TWO_POW_31) D_hi = bit32_bxor(C4_hi, C1_hi * 2 + (C1_lo % TWO_POW_32 - C1_lo % TWO_POW_31) / TWO_POW_31) T0_lo = bit32_bxor(D_lo, L05_lo) T0_hi = bit32_bxor(D_hi, L05_hi) T1_lo = bit32_bxor(D_lo, L10_lo) T1_hi = bit32_bxor(D_hi, L10_hi) T2_lo = bit32_bxor(D_lo, L15_lo) T2_hi = bit32_bxor(D_hi, L15_hi) T3_lo = bit32_bxor(D_lo, L20_lo) T3_hi = bit32_bxor(D_hi, L20_hi) T4_lo = bit32_bxor(D_lo, L25_lo) T4_hi = bit32_bxor(D_hi, L25_hi) L05_lo = T4_lo * TWO_POW_14 + (T4_hi % TWO_POW_32 - T4_hi % TWO_POW_18) / TWO_POW_18 L05_hi = T4_hi * TWO_POW_14 + (T4_lo % TWO_POW_32 - T4_lo % TWO_POW_18) / TWO_POW_18 L10_lo = T1_lo * TWO_POW_20 % TWO_POW_32 + (T1_hi % TWO_POW_32 - T1_hi % TWO_POW_12) / TWO_POW_12 L10_hi = T1_hi * TWO_POW_20 % TWO_POW_32 + (T1_lo % TWO_POW_32 - T1_lo % TWO_POW_12) / TWO_POW_12 L15_lo = T3_lo * TWO_POW_8 + (T3_hi % TWO_POW_32 - T3_hi % TWO_POW_24) / TWO_POW_24 L15_hi = T3_hi * TWO_POW_8 + (T3_lo % TWO_POW_32 - T3_lo % TWO_POW_24) / TWO_POW_24 L20_lo = T0_lo * TWO_POW_27 % TWO_POW_32 + (T0_hi % TWO_POW_32 - T0_hi % TWO_POW_5) / TWO_POW_5 L20_hi = T0_hi * TWO_POW_27 % TWO_POW_32 + (T0_lo % TWO_POW_32 - T0_lo % TWO_POW_5) / TWO_POW_5 L25_lo = (T2_lo % TWO_POW_32 - T2_lo % TWO_POW_25) / TWO_POW_25 + T2_hi * TWO_POW_7 L25_hi = (T2_hi % TWO_POW_32 - T2_hi % TWO_POW_25) / TWO_POW_25 + T2_lo * TWO_POW_7 D_lo = bit32_bxor(C5_lo, C2_lo * 2 + (C2_hi % TWO_POW_32 - C2_hi % TWO_POW_31) / TWO_POW_31) D_hi = bit32_bxor(C5_hi, C2_hi * 2 + (C2_lo % TWO_POW_32 - C2_lo % TWO_POW_31) / TWO_POW_31) T1_lo = bit32_bxor(D_lo, L06_lo) T1_hi = bit32_bxor(D_hi, L06_hi) T2_lo = bit32_bxor(D_lo, L11_lo) T2_hi = bit32_bxor(D_hi, L11_hi) T3_lo = bit32_bxor(D_lo, L16_lo) T3_hi = bit32_bxor(D_hi, L16_hi) T4_lo = bit32_bxor(D_lo, L21_lo) T4_hi = bit32_bxor(D_hi, L21_hi) L06_lo = T2_lo * TWO_POW_3 + (T2_hi % TWO_POW_32 - T2_hi % TWO_POW_29) / TWO_POW_29 L06_hi = T2_hi * TWO_POW_3 + (T2_lo % TWO_POW_32 - T2_lo % TWO_POW_29) / TWO_POW_29 L11_lo = T4_lo * TWO_POW_18 + (T4_hi % TWO_POW_32 - T4_hi % TWO_POW_14) / TWO_POW_14 L11_hi = T4_hi * TWO_POW_18 + (T4_lo % TWO_POW_32 - T4_lo % TWO_POW_14) / TWO_POW_14 L16_lo = (T1_lo % TWO_POW_32 - T1_lo % TWO_POW_28) / TWO_POW_28 + T1_hi * TWO_POW_4 L16_hi = (T1_hi % TWO_POW_32 - T1_hi % TWO_POW_28) / TWO_POW_28 + T1_lo * TWO_POW_4 L21_lo = (T3_lo % TWO_POW_32 - T3_lo % TWO_POW_23) / TWO_POW_23 + T3_hi * TWO_POW_9 L21_hi = (T3_hi % TWO_POW_32 - T3_hi % TWO_POW_23) / TWO_POW_23 + T3_lo * TWO_POW_9 L01_lo = bit32_bxor(D_lo, L01_lo) L01_hi = bit32_bxor(D_hi, L01_hi) L01_lo, L02_lo, L03_lo, L04_lo, L05_lo = bit32_bxor(L01_lo, bit32_band(-1 - L02_lo, L03_lo)), bit32_bxor(L02_lo, bit32_band(-1 - L03_lo, L04_lo)), bit32_bxor(L03_lo, bit32_band(-1 - L04_lo, L05_lo)), bit32_bxor(L04_lo, bit32_band(-1 - L05_lo, L01_lo)), bit32_bxor(L05_lo, bit32_band(-1 - L01_lo, L02_lo)) L01_hi, L02_hi, L03_hi, L04_hi, L05_hi = bit32_bxor(L01_hi, bit32_band(-1 - L02_hi, L03_hi)), bit32_bxor(L02_hi, bit32_band(-1 - L03_hi, L04_hi)), bit32_bxor(L03_hi, bit32_band(-1 - L04_hi, L05_hi)), bit32_bxor(L04_hi, bit32_band(-1 - L05_hi, L01_hi)), bit32_bxor(L05_hi, bit32_band(-1 - L01_hi, L02_hi)) L06_lo, L07_lo, L08_lo, L09_lo, L10_lo = bit32_bxor(L09_lo, bit32_band(-1 - L10_lo, L06_lo)), bit32_bxor(L10_lo, bit32_band(-1 - L06_lo, L07_lo)), bit32_bxor(L06_lo, bit32_band(-1 - L07_lo, L08_lo)), bit32_bxor(L07_lo, bit32_band(-1 - L08_lo, L09_lo)), bit32_bxor(L08_lo, bit32_band(-1 - L09_lo, L10_lo)) L06_hi, L07_hi, L08_hi, L09_hi, L10_hi = bit32_bxor(L09_hi, bit32_band(-1 - L10_hi, L06_hi)), bit32_bxor(L10_hi, bit32_band(-1 - L06_hi, L07_hi)), bit32_bxor(L06_hi, bit32_band(-1 - L07_hi, L08_hi)), bit32_bxor(L07_hi, bit32_band(-1 - L08_hi, L09_hi)), bit32_bxor(L08_hi, bit32_band(-1 - L09_hi, L10_hi)) L11_lo, L12_lo, L13_lo, L14_lo, L15_lo = bit32_bxor(L12_lo, bit32_band(-1 - L13_lo, L14_lo)), bit32_bxor(L13_lo, bit32_band(-1 - L14_lo, L15_lo)), bit32_bxor(L14_lo, bit32_band(-1 - L15_lo, L11_lo)), bit32_bxor(L15_lo, bit32_band(-1 - L11_lo, L12_lo)), bit32_bxor(L11_lo, bit32_band(-1 - L12_lo, L13_lo)) L11_hi, L12_hi, L13_hi, L14_hi, L15_hi = bit32_bxor(L12_hi, bit32_band(-1 - L13_hi, L14_hi)), bit32_bxor(L13_hi, bit32_band(-1 - L14_hi, L15_hi)), bit32_bxor(L14_hi, bit32_band(-1 - L15_hi, L11_hi)), bit32_bxor(L15_hi, bit32_band(-1 - L11_hi, L12_hi)), bit32_bxor(L11_hi, bit32_band(-1 - L12_hi, L13_hi)) L16_lo, L17_lo, L18_lo, L19_lo, L20_lo = bit32_bxor(L20_lo, bit32_band(-1 - L16_lo, L17_lo)), bit32_bxor(L16_lo, bit32_band(-1 - L17_lo, L18_lo)), bit32_bxor(L17_lo, bit32_band(-1 - L18_lo, L19_lo)), bit32_bxor(L18_lo, bit32_band(-1 - L19_lo, L20_lo)), bit32_bxor(L19_lo, bit32_band(-1 - L20_lo, L16_lo)) L16_hi, L17_hi, L18_hi, L19_hi, L20_hi = bit32_bxor(L20_hi, bit32_band(-1 - L16_hi, L17_hi)), bit32_bxor(L16_hi, bit32_band(-1 - L17_hi, L18_hi)), bit32_bxor(L17_hi, bit32_band(-1 - L18_hi, L19_hi)), bit32_bxor(L18_hi, bit32_band(-1 - L19_hi, L20_hi)), bit32_bxor(L19_hi, bit32_band(-1 - L20_hi, L16_hi)) L21_lo, L22_lo, L23_lo, L24_lo, L25_lo = bit32_bxor(L23_lo, bit32_band(-1 - L24_lo, L25_lo)), bit32_bxor(L24_lo, bit32_band(-1 - L25_lo, L21_lo)), bit32_bxor(L25_lo, bit32_band(-1 - L21_lo, L22_lo)), bit32_bxor(L21_lo, bit32_band(-1 - L22_lo, L23_lo)), bit32_bxor(L22_lo, bit32_band(-1 - L23_lo, L24_lo)) L21_hi, L22_hi, L23_hi, L24_hi, L25_hi = bit32_bxor(L23_hi, bit32_band(-1 - L24_hi, L25_hi)), bit32_bxor(L24_hi, bit32_band(-1 - L25_hi, L21_hi)), bit32_bxor(L25_hi, bit32_band(-1 - L21_hi, L22_hi)), bit32_bxor(L21_hi, bit32_band(-1 - L22_hi, L23_hi)), bit32_bxor(L22_hi, bit32_band(-1 - L23_hi, L24_hi)) L01_lo = bit32_bxor(L01_lo, RC_lo[round_idx]) L01_hi = L01_hi + RC_hi[round_idx] end lanes_lo[1] = L01_lo lanes_hi[1] = L01_hi lanes_lo[2] = L02_lo lanes_hi[2] = L02_hi lanes_lo[3] = L03_lo lanes_hi[3] = L03_hi lanes_lo[4] = L04_lo lanes_hi[4] = L04_hi lanes_lo[5] = L05_lo lanes_hi[5] = L05_hi lanes_lo[6] = L06_lo lanes_hi[6] = L06_hi lanes_lo[7] = L07_lo lanes_hi[7] = L07_hi lanes_lo[8] = L08_lo lanes_hi[8] = L08_hi lanes_lo[9] = L09_lo lanes_hi[9] = L09_hi lanes_lo[10] = L10_lo lanes_hi[10] = L10_hi lanes_lo[11] = L11_lo lanes_hi[11] = L11_hi lanes_lo[12] = L12_lo lanes_hi[12] = L12_hi lanes_lo[13] = L13_lo lanes_hi[13] = L13_hi lanes_lo[14] = L14_lo lanes_hi[14] = L14_hi lanes_lo[15] = L15_lo lanes_hi[15] = L15_hi lanes_lo[16] = L16_lo lanes_hi[16] = L16_hi lanes_lo[17] = L17_lo lanes_hi[17] = L17_hi lanes_lo[18] = L18_lo lanes_hi[18] = L18_hi lanes_lo[19] = L19_lo lanes_hi[19] = L19_hi lanes_lo[20] = L20_lo lanes_hi[20] = L20_hi lanes_lo[21] = L21_lo lanes_hi[21] = L21_hi lanes_lo[22] = L22_lo lanes_hi[22] = L22_hi lanes_lo[23] = L23_lo lanes_hi[23] = L23_hi lanes_lo[24] = L24_lo lanes_hi[24] = L24_hi lanes_lo[25] = L25_lo lanes_hi[25] = L25_hi end end do local function mul(src1, src2, factor, result_length) local result, carry, value, weight = table.create(result_length), 0, 0, 1 for j = 1, result_length do for k = math.max(1, j + 1 - #src2), math.min(j, #src1) do carry = carry + factor * src1[k] * src2[j + 1 - k] end local digit = carry % TWO_POW_24 result[j] = math.floor(digit) carry = (carry - digit) / TWO_POW_24 value = value + digit * weight weight = weight * TWO_POW_24 end return result, value end local idx, step, p, one, sqrt_hi, sqrt_lo = 0, {4, 1, 2, -2, 2}, 4, {1}, sha2_H_hi, sha2_H_lo repeat p = p + step[p % 6] local d = 1 repeat d = d + step[d % 6] if d * d > p then local root = p ^ (1 / 3) local R = root * TWO_POW_40 R = mul(table.create(1, math.floor(R)), one, 1, 2) local _, delta = mul(R, mul(R, R, 1, 4), -1, 4) local hi = R[2] % 65536 * 65536 + math.floor(R[1] / 256) local lo = R[1] % 256 * 16777216 + math.floor(delta * (TWO_POW_NEG_56 / 3) * root / p) if idx < 16 then root = math.sqrt(p) R = root * TWO_POW_40 R = mul(table.create(1, math.floor(R)), one, 1, 2) _, delta = mul(R, R, -1, 2) local hi = R[2] % 65536 * 65536 + math.floor(R[1] / 256) local lo = R[1] % 256 * 16777216 + math.floor(delta * TWO_POW_NEG_17 / root) local idx = idx % 8 + 1 sha2_H_ext256[224][idx] = lo sqrt_hi[idx], sqrt_lo[idx] = hi, lo + hi * hi_factor if idx > 7 then sqrt_hi, sqrt_lo = sha2_H_ext512_hi[384], sha2_H_ext512_lo[384] end end idx = idx + 1 sha2_K_hi[idx], sha2_K_lo[idx] = hi, lo % K_lo_modulo + hi * hi_factor break end until p % d == 0 until idx > 79 end for width = 224, 256, 32 do local H_lo, H_hi = {}, nil if XOR64A5 then for j = 1, 8 do H_lo[j] = XOR64A5(sha2_H_lo[j]) end else H_hi = {} for j = 1, 8 do H_lo[j] = bit32_bxor(sha2_H_lo[j], 0xA5A5A5A5) % 4294967296 H_hi[j] = bit32_bxor(sha2_H_hi[j], 0xA5A5A5A5) % 4294967296 end end sha512_feed_128(H_lo, H_hi, "SHA-512/" .. tostring(width) .. "\128" .. string.rep("\0", 115) .. "\88", 0, 128) sha2_H_ext512_lo[width] = H_lo sha2_H_ext512_hi[width] = H_hi end do for idx = 1, 64 do local hi, lo = math.modf(math.abs(math.sin(idx)) * TWO_POW_16) md5_K[idx] = hi * 65536 + math.floor(lo * TWO_POW_16) end end do local sh_reg = 29 local function next_bit() local r = sh_reg % 2 sh_reg = bit32_bxor((sh_reg - r) / 2, 142 * r) return r end for idx = 1, 24 do local lo, m = 0, nil for _ = 1, 6 do m = m and m * m * 2 or 1 lo = lo + next_bit() * m end local hi = next_bit() * m sha3_RC_hi[idx], sha3_RC_lo[idx] = hi, lo + hi * hi_factor_keccak end end local function sha256ext(width, message) local Array256 = sha2_H_ext256[width] local length, tail = 0, "" local H = table.create(8) H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8] = Array256[1], Array256[2], Array256[3], Array256[4], Array256[5], Array256[6], Array256[7], Array256[8] local function partial(message_part) if message_part then local partLength = #message_part if tail then length = length + partLength local offs = 0 local tailLength = #tail if tail ~= "" and tailLength + partLength >= 64 then offs = 64 - tailLength sha256_feed_64(H, tail .. string.sub(message_part, 1, offs), 0, 64) tail = "" end local size = partLength - offs local size_tail = size % 64 sha256_feed_64(H, message_part, offs, size - size_tail) tail = tail .. string.sub(message_part, partLength + 1 - size_tail) return partial else error("Adding more chunks is not allowed after receiving the result", 2) end else if tail then local final_blocks = table.create(10) final_blocks[1] = tail final_blocks[2] = "\128" final_blocks[3] = string.rep("\0", (-9 - length) % 64 + 1) tail = nil length = length * (8 / TWO56_POW_7) for j = 4, 10 do length = length % 1 * 256 final_blocks[j] = string.char(math.floor(length)) end final_blocks = table.concat(final_blocks) sha256_feed_64(H, final_blocks, 0, #final_blocks) local max_reg = width / 32 for j = 1, max_reg do H[j] = string.format("%08x", H[j] % 4294967296) end H = table.concat(H, "", 1, max_reg) end return H end end if message then return partial(message)() else return partial end end local function sha512ext(width, message) local length, tail, H_lo, H_hi = 0, "", table.pack(table.unpack(sha2_H_ext512_lo[width])), not HEX64 and table.pack(table.unpack(sha2_H_ext512_hi[width])) local function partial(message_part) if message_part then local partLength = #message_part if tail then length = length + partLength local offs = 0 if tail ~= "" and #tail + partLength >= 128 then offs = 128 - #tail sha512_feed_128(H_lo, H_hi, tail .. string.sub(message_part, 1, offs), 0, 128) tail = "" end local size = partLength - offs local size_tail = size % 128 sha512_feed_128(H_lo, H_hi, message_part, offs, size - size_tail) tail = tail .. string.sub(message_part, partLength + 1 - size_tail) return partial else error("Adding more chunks is not allowed after receiving the result", 2) end else if tail then local final_blocks = table.create(3) final_blocks[1] = tail final_blocks[2] = "\128" final_blocks[3] = string.rep("\0", (-17 - length) % 128 + 9) tail = nil length = length * (8 / TWO56_POW_7) for j = 4, 10 do length = length % 1 * 256 final_blocks[j] = string.char(math.floor(length)) end final_blocks = table.concat(final_blocks) sha512_feed_128(H_lo, H_hi, final_blocks, 0, #final_blocks) local max_reg = math.ceil(width / 64) if HEX64 then for j = 1, max_reg do H_lo[j] = HEX64(H_lo[j]) end else for j = 1, max_reg do H_lo[j] = string.format("%08x", H_hi[j] % 4294967296) .. string.format("%08x", H_lo[j] % 4294967296) end H_hi = nil end H_lo = string.sub(table.concat(H_lo, "", 1, max_reg), 1, width / 4) end return H_lo end end if message then return partial(message)() else return partial end end local function md5(message) local H, length, tail = table.create(4), 0, "" H[1], H[2], H[3], H[4] = md5_sha1_H[1], md5_sha1_H[2], md5_sha1_H[3], md5_sha1_H[4] local function partial(message_part) if message_part then local partLength = #message_part if tail then length = length + partLength local offs = 0 if tail ~= "" and #tail + partLength >= 64 then offs = 64 - #tail md5_feed_64(H, tail .. string.sub(message_part, 1, offs), 0, 64) tail = "" end local size = partLength - offs local size_tail = size % 64 md5_feed_64(H, message_part, offs, size - size_tail) tail = tail .. string.sub(message_part, partLength + 1 - size_tail) return partial else error("Adding more chunks is not allowed after receiving the result", 2) end else if tail then local final_blocks = table.create(3) final_blocks[1] = tail final_blocks[2] = "\128" final_blocks[3] = string.rep("\0", (-9 - length) % 64) tail = nil length = length * 8 for j = 4, 11 do local low_byte = length % 256 final_blocks[j] = string.char(low_byte) length = (length - low_byte) / 256 end final_blocks = table.concat(final_blocks) md5_feed_64(H, final_blocks, 0, #final_blocks) for j = 1, 4 do H[j] = string.format("%08x", H[j] % 4294967296) end H = string.gsub(table.concat(H), "(..)(..)(..)(..)", "%4%3%2%1") end return H end end if message then return partial(message)() else return partial end end local function sha1(message) local H, length, tail = table.pack(table.unpack(md5_sha1_H)), 0, "" local function partial(message_part) if message_part then local partLength = #message_part if tail then length = length + partLength local offs = 0 if tail ~= "" and #tail + partLength >= 64 then offs = 64 - #tail sha1_feed_64(H, tail .. string.sub(message_part, 1, offs), 0, 64) tail = "" end local size = partLength - offs local size_tail = size % 64 sha1_feed_64(H, message_part, offs, size - size_tail) tail = tail .. string.sub(message_part, partLength + 1 - size_tail) return partial else error("Adding more chunks is not allowed after receiving the result", 2) end else if tail then local final_blocks = table.create(10) final_blocks[1] = tail final_blocks[2] = "\128" final_blocks[3] = string.rep("\0", (-9 - length) % 64 + 1) tail = nil length = length * (8 / TWO56_POW_7) for j = 4, 10 do length = length % 1 * 256 final_blocks[j] = string.char(math.floor(length)) end final_blocks = table.concat(final_blocks) sha1_feed_64(H, final_blocks, 0, #final_blocks) for j = 1, 5 do H[j] = string.format("%08x", H[j] % 4294967296) end H = table.concat(H) end return H end end if message then return partial(message)() else return partial end end local function keccak(block_size_in_bytes, digest_size_in_bytes, is_SHAKE, message) if type(digest_size_in_bytes) ~= "number" then error("Argument 'digest_size_in_bytes' must be a number", 2) end local tail, lanes_lo, lanes_hi = "", table.create(25, 0), hi_factor_keccak == 0 and table.create(25, 0) local result local function partial(message_part) if message_part then local partLength = #message_part if tail then local offs = 0 if tail ~= "" and #tail + partLength >= block_size_in_bytes then offs = block_size_in_bytes - #tail keccak_feed(lanes_lo, lanes_hi, tail .. string.sub(message_part, 1, offs), 0, block_size_in_bytes, block_size_in_bytes) tail = "" end local size = partLength - offs local size_tail = size % block_size_in_bytes keccak_feed(lanes_lo, lanes_hi, message_part, offs, size - size_tail, block_size_in_bytes) tail = tail .. string.sub(message_part, partLength + 1 - size_tail) return partial else error("Adding more chunks is not allowed after receiving the result", 2) end else if tail then local gap_start = is_SHAKE and 31 or 6 tail = tail .. (#tail + 1 == block_size_in_bytes and string.char(gap_start + 128) or string.char(gap_start) .. string.rep("\0", (-2 - #tail) % block_size_in_bytes) .. "\128") keccak_feed(lanes_lo, lanes_hi, tail, 0, #tail, block_size_in_bytes) tail = nil local lanes_used = 0 local total_lanes = math.floor(block_size_in_bytes / 8) local qwords = {} local function get_next_qwords_of_digest(qwords_qty) if lanes_used >= total_lanes then keccak_feed(lanes_lo, lanes_hi, "\0\0\0\0\0\0\0\0", 0, 8, 8) lanes_used = 0 end qwords_qty = math.floor(math.min(qwords_qty, total_lanes - lanes_used)) if hi_factor_keccak ~= 0 then for j = 1, qwords_qty do qwords[j] = HEX64(lanes_lo[lanes_used + j - 1 + lanes_index_base]) end else for j = 1, qwords_qty do qwords[j] = string.format("%08x", lanes_hi[lanes_used + j] % 4294967296) .. string.format("%08x", lanes_lo[lanes_used + j] % 4294967296) end end lanes_used = lanes_used + qwords_qty return string.gsub(table.concat(qwords, "", 1, qwords_qty), "(..)(..)(..)(..)(..)(..)(..)(..)", "%8%7%6%5%4%3%2%1"), qwords_qty * 8 end local parts = {} local last_part, last_part_size = "", 0 local function get_next_part_of_digest(bytes_needed) bytes_needed = bytes_needed or 1 if bytes_needed <= last_part_size then last_part_size = last_part_size - bytes_needed local part_size_in_nibbles = bytes_needed * 2 local result = string.sub(last_part, 1, part_size_in_nibbles) last_part = string.sub(last_part, part_size_in_nibbles + 1) return result end local parts_qty = 0 if last_part_size > 0 then parts_qty = 1 parts[parts_qty] = last_part bytes_needed = bytes_needed - last_part_size end while bytes_needed >= 8 do local next_part, next_part_size = get_next_qwords_of_digest(bytes_needed / 8) parts_qty = parts_qty + 1 parts[parts_qty] = next_part bytes_needed = bytes_needed - next_part_size end if bytes_needed > 0 then last_part, last_part_size = get_next_qwords_of_digest(1) parts_qty = parts_qty + 1 parts[parts_qty] = get_next_part_of_digest(bytes_needed) else last_part, last_part_size = "", 0 end return table.concat(parts, "", 1, parts_qty) end if digest_size_in_bytes < 0 then result = get_next_part_of_digest else result = get_next_part_of_digest(digest_size_in_bytes) end end return result end end if message then return partial(message)() else return partial end end local function HexToBinFunction(hh) return string.char(tonumber(hh, 16)) end local function hex2bin(hex_string) return (string.gsub(hex_string, "%x%x", HexToBinFunction)) end local base64_symbols = { ["+"] = 62, ["-"] = 62, [62] = "+"; ["/"] = 63, ["_"] = 63, [63] = "/"; ["="] = -1, ["."] = -1, [-1] = "="; } local symbol_index = 0 for j, pair in ipairs{"AZ", "az", "09"} do for ascii = string.byte(pair), string.byte(pair, 2) do local ch = string.char(ascii) base64_symbols[ch] = symbol_index base64_symbols[symbol_index] = ch symbol_index = symbol_index + 1 end end local function bin2base64(binary_string) local stringLength = #binary_string local result = table.create(math.ceil(stringLength / 3)) local length = 0 for pos = 1, #binary_string, 3 do local c1, c2, c3, c4 = string.byte(string.sub(binary_string, pos, pos + 2) .. '\0', 1, -1) length = length + 1 result[length] = base64_symbols[math.floor(c1 / 4)] .. base64_symbols[c1 % 4 * 16 + math.floor(c2 / 16)] .. base64_symbols[c3 and c2 % 16 * 4 + math.floor(c3 / 64) or -1] .. base64_symbols[c4 and c3 % 64 or -1] end return table.concat(result) end local function base642bin(base64_string) local result, chars_qty = {}, 3 for pos, ch in string.gmatch(string.gsub(base64_string, "%s+", ""), "()(.)") do local code = base64_symbols[ch] if code < 0 then chars_qty = chars_qty - 1 code = 0 end local idx = pos % 4 if idx > 0 then result[-idx] = code else local c1 = result[-1] * 4 + math.floor(result[-2] / 16) local c2 = (result[-2] % 16) * 16 + math.floor(result[-3] / 4) local c3 = (result[-3] % 4) * 64 + code result[#result + 1] = string.sub(string.char(c1, c2, c3), 1, chars_qty) end end return table.concat(result) end local block_size_for_HMAC local BinaryStringMap = {} for Index = 0, 255 do BinaryStringMap[string.format("%02x", Index)] = string.char(Index) end local function hmac(hash_func, key, message, AsBinary) local block_size = block_size_for_HMAC[hash_func] if not block_size then error("Unknown hash function", 2) end local KeyLength = #key if KeyLength > block_size then key = string.gsub(hash_func(key), "%x%x", HexToBinFunction) KeyLength = #key end local append = hash_func()(string.gsub(key, ".", function(c) return string.char(bit32_bxor(string.byte(c), 0x36)) end) .. string.rep("6", block_size - KeyLength)) local result local function partial(message_part) if not message_part then result = result or hash_func( string.gsub(key, ".", function(c) return string.char(bit32_bxor(string.byte(c), 0x5c)) end) .. string.rep("\\", block_size - KeyLength) .. (string.gsub(append(), "%x%x", HexToBinFunction)) ) return result elseif result then error("Adding more chunks is not allowed after receiving the result", 2) else append(message_part) return partial end end if message then local FinalMessage = partial(message)() return AsBinary and (string.gsub(FinalMessage, "%x%x", BinaryStringMap)) or FinalMessage else return partial end end local sha = { md5 = md5, sha1 = sha1, sha224 = function(message) return sha256ext(224, message) end; sha256 = function(message) return sha256ext(256, message) end; sha512_224 = function(message) return sha512ext(224, message) end; sha512_256 = function(message) return sha512ext(256, message) end; sha384 = function(message) return sha512ext(384, message) end; sha512 = function(message) return sha512ext(512, message) end; sha3_224 = function(message) return keccak((1600 - 2 * 224) / 8, 224 / 8, false, message) end; sha3_256 = function(message) return keccak((1600 - 2 * 256) / 8, 256 / 8, false, message) end; sha3_384 = function(message) return keccak((1600 - 2 * 384) / 8, 384 / 8, false, message) end; sha3_512 = function(message) return keccak((1600 - 2 * 512) / 8, 512 / 8, false, message) end; shake128 = function(message, digest_size_in_bytes) return keccak((1600 - 2 * 128) / 8, digest_size_in_bytes, true, message) end; shake256 = function(message, digest_size_in_bytes) return keccak((1600 - 2 * 256) / 8, digest_size_in_bytes, true, message) end; hmac = hmac; hex_to_bin = hex2bin; base64_to_bin = base642bin; bin_to_base64 = bin2base64; } block_size_for_HMAC = { [sha.md5] = 64; [sha.sha1] = 64; [sha.sha224] = 64; [sha.sha256] = 64; [sha.sha512_224] = 128; [sha.sha512_256] = 128; [sha.sha384] = 128; [sha.sha512] = 128; [sha.sha3_224] = (1600 - 2 * 224) / 8; [sha.sha3_256] = (1600 - 2 * 256) / 8; [sha.sha3_384] = (1600 - 2 * 384) / 8; [sha.sha3_512] = (1600 - 2 * 512) / 8; } return sha; end)(); end

local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

function enc(data)
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

function dec(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
    end))
end

local HttpService = game:GetService("HttpService")

getgenv().http_request = http_request or request or (http and http.request) or syn.request 

local requests = function(url)
	pcall(function()
		req = getgenv().http_request({Url = url, Method = "GET"})
        if not req.Success then
            game.Players.LocalPlayer:Kick('bad request')
            wait(1)
            while true do end
            return
        end
        local asd = HttpService:JSONDecode(req.Body)
		if asd.Message then
            game.Players.LocalPlayer:Kick(asd.Message.. "#bot-command use command `!resethwid`")
            wait(1)
            while true do end
            return
		end
	end)
	return req.Body
end

if start == os.time() or rawequal(start, os.time()) then
	game.Players.LocalPlayer:Kick('Error Unknown')
    wait(1)
    while true do end
    return
end

if math.random(1,10000) == math.random(1,10000) then
    game.Players.LocalPlayer:Kick('Error Unknown')
    wait(1)
    while true do end
    return
end


local function Random()
    return (string.sub(tostring({}),18, math.random(-5,-2)))
end

local function RandomString()
    local out = ""
    for i=1,5 do
        out = out..Random()
    end
    return out
end

local gen = RandomString()..os.time()..math.random(1,10000)
gen = gen..game:GetService("HttpService"):GenerateGUID(false)
gen = gen..game.PlaceId
gen = gen..game.PlaceVersion
gen = gen..game.Workspace.DistributedGameTime
gen = gen..tostring(print)
gen = gen..tostring(function() end)
gen = crypto.hash.sha256(gen)


local succ, res = pcall(requests, 'https://sitinkhub.herokuapp.com/api/server/'..getgenv().Key..'/'..gen)
if not succ then
    game.Players.LocalPlayer:Kick('Error Unknown')
    wait(1)
    while true do end
    return
end

local success, hwid = pcall(requests, 'https://sitinkhub.herokuapp.com/api/hwid/')
if not success then
    game.Players.LocalPlayer:Kick('Error Unknown')
    wait(1)
    while true do end
    return
end

local data = HttpService:JSONDecode(Vin.Decrypt(res, getgenv().Key..math.floor(os.time()/1000)))

if getgenv().Key ~= data.Key then
    game.Players.LocalPlayer:Kick('Invalid Key')
    wait(1)
    while true do end
    return
end

if false == true then
    game.Players.LocalPlayer:Kick('Error Unknown')
    wait(1)
    while true do end
    return
end

pass = false

if data.Hwid == 'Unknown' then
    pass = true
end

if not pass and hwid ~= data.Hwid then
    game.Players.LocalPlayer:Kick('Invalid Hwid')
    wait(1)
    while true do end
    return
end

if true ~= true then
    game.Players.LocalPlayer:Kick('Error Unknown')
    wait(1)
    while true do end
    return
end

local token = enc(tostring(getgenv().Key)..tostring(hwid)..tostring(math.floor(os.time()/1000))..tostring(gen))

if token ~= data.Token then
    game.Players.LocalPlayer:Kick('Error Unknown')
    wait(1)
    while true do end
    return
end

if true == false then
    game.Players.LocalPlayer:Kick('Error Unknown')
    wait(1)
    while true do end
    return
end

if data.Key == getgenv().Key and token == data.Token then
    whitelist = true
end

repeat wait() until whitelist


if getgenv().ScriptReady then
    return print("Script Ready")
end
getgenv().ScriptReady = true
repeat wait()
until game:IsLoaded() and game.Players.LocalPlayer
local checktdisconnet = 1
repeat wait()
until game:GetService("Players").LocalPlayer:FindFirstChild("DataLoaded") 
print("check")
local Library = {}
local Library_Function = {}
local TweenService = game:GetService('TweenService')
local uis = game:GetService("UserInputService")

function Library_Function.Destroy()
    getgenv().VinF_Loaded = false;
    Library.Gui:Destroy();
    Library.NotiGui:Destroy();
end

Library_Function.GetIMG = function(url)
    local File = 'SynAsset ['
    if url and type(url) == 'string' and tostring(game:HttpGet(url)):find('PNG') then
        for i = 1, 5 do
            File = tostring(File..string.char(math.random(65, 122)))
        end
        File = File..'].png'
        writefile(File, game:HttpGet(url))
        coroutine.wrap(function()
            wait(5)
            if isfile(File) then
                delfile(File)
            end
        end)()
        return getsynasset(File)
    end
end


local UI_Theme = {
    ['Main Color'] = Color3.fromRGB(115, 148, 255);
    ['Image Icon'] = "rbxassetid://4638314646";
}

local function getcolor(color)
    return {math.floor(color.r*255),math.floor(color.g*255),math.floor(color.b*255)}
end

Library.NotiGui = Instance.new('ScreenGui')
Library.NotiGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Library.NotiGui.Name = 'VinF Notification [Premium Edition]'


    Library.NotiGui.Parent = game:GetService('CoreGui')


local NotiContainer = Instance.new("Frame")
local NotiList = Instance.new("UIListLayout")


NotiContainer.Name = "NotiContainer"
NotiContainer.Parent = Library.NotiGui
NotiContainer.AnchorPoint = Vector2.new(1, 1)
NotiContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotiContainer.BackgroundTransparency = 1.000
NotiContainer.Position = UDim2.new(1, -5, 1, -5)
NotiContainer.Size = UDim2.new(0, 350, 1, -10)

NotiList.Name = "NotiList"
NotiList.Parent = NotiContainer
NotiList.SortOrder = Enum.SortOrder.LayoutOrder
NotiList.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotiList.Padding = UDim.new(0, 5)



function Library.CreateNoti(Setting)
    local TitleName = Setting.Title; 
    local Desc = Setting.Desc; 
    local Timeshow = Setting.ShowTime or 10;

    local NotiFrame = Instance.new("Frame")
    local Noticontainer = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Topnoti = Instance.new("Frame")
    local Vinfimg = Instance.new("ImageLabel")
    local VinfimgCorner = Instance.new("UICorner")
    local TextLabel = Instance.new("TextLabel")
    local CloseContainer = Instance.new("Frame")
    local CloseImage = Instance.new("ImageLabel")
    local TextButton = Instance.new("TextButton")
    local TextLabel_2 = Instance.new("TextLabel")

    NotiFrame.Name = "NotiFrame"
    NotiFrame.Parent = NotiContainer
    NotiFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotiFrame.BackgroundTransparency = 1.000
    NotiFrame.ClipsDescendants = true
    NotiFrame.Position = UDim2.new(0, 0, 0.865191162, 0)
    NotiFrame.Size = UDim2.new(1, 0, 0, 100)

    Noticontainer.Name = "Noticontainer"
    Noticontainer.Parent = NotiFrame
    Noticontainer.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
    Noticontainer.Position = UDim2.new(1, 0, 0, 0)
    Noticontainer.Size = UDim2.new(1, 0, 1, 0)

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Noticontainer

    Topnoti.Name = "Topnoti"
    Topnoti.Parent = Noticontainer
    Topnoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Topnoti.BackgroundTransparency = 1.000
    Topnoti.Position = UDim2.new(0, 0, 0, 5)
    Topnoti.Size = UDim2.new(1, 0, 0, 25)

    Vinfimg.Name = "Vinfimg"
    Vinfimg.Parent = Topnoti
    Vinfimg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Vinfimg.BackgroundTransparency = 1.000
    Vinfimg.Position = UDim2.new(0, 10, 0, 0)
    Vinfimg.Size = UDim2.new(0, 25, 0, 25)
    Vinfimg.Image = UI_Theme['Image Icon']

    VinfimgCorner.CornerRadius = UDim.new(1, 0)
    VinfimgCorner.Name = "VinfimgCorner"
    VinfimgCorner.Parent = Vinfimg

    TextLabel.Parent = Topnoti
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Position = UDim2.new(0, 40, 0, 0)
    TextLabel.Size = UDim2.new(1, -40, 1, 0)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = "<font color=\"rgb("..tostring(getcolor(UI_Theme['Main Color'])[1])..','..tostring(getcolor(UI_Theme['Main Color'])[2])..','..tostring(getcolor(UI_Theme['Main Color'])[3])..")\">sitink Hub</font> - "..TitleName
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14.000
    TextLabel.TextWrapped = true
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.RichText = true

    CloseContainer.Name = "CloseContainer"
    CloseContainer.Parent = Topnoti
    CloseContainer.AnchorPoint = Vector2.new(1, 0.5)
    CloseContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseContainer.BackgroundTransparency = 1.000
    CloseContainer.Position = UDim2.new(1, -4, 0.5, 0)
    CloseContainer.Size = UDim2.new(0, 22, 0, 22)

    CloseImage.Name = "CloseImage"
    CloseImage.Parent = CloseContainer
    CloseImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseImage.BackgroundTransparency = 1.000
    CloseImage.Size = UDim2.new(1, 0, 1, 0)
    CloseImage.Image = "rbxassetid://3926305904"
    CloseImage.ImageRectOffset = Vector2.new(284, 4)
    CloseImage.ImageRectSize = Vector2.new(24, 24)

    TextButton.Parent = CloseContainer
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BackgroundTransparency = 1.000
    TextButton.Size = UDim2.new(1, 0, 1, 0)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = ""
    TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.TextSize = 14.000

    TextLabel_2.Name = 'Bu cac tao ne'
    TextLabel_2.Parent = Noticontainer
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 1.000
    TextLabel_2.Position = UDim2.new(0, 10, 0, 35)
    TextLabel_2.Size = UDim2.new(1, -15, 1, -40)
    TextLabel_2.Font = Enum.Font.GothamBold
    TextLabel_2.Text = Desc
    TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.TextSize = 14.000
    TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel_2.RichText = true

    local function remove()
        TweenService:Create(Noticontainer,TweenInfo.new(.25),{Position = UDim2.new(1,0,0,0)}):Play()
        wait(.25)
        NotiFrame:Destroy()
    end

    TweenService:Create(Noticontainer,TweenInfo.new(.25),{Position = UDim2.new(0,0,0,0)}):Play()

    TextButton.MouseEnter:Connect(function()
        TweenService:Create(CloseImage,TweenInfo.new(.25),{ImageColor3 = UI_Theme['Main Color']}):Play()
    end)

    TextButton.MouseLeave:Connect(function()
        TweenService:Create(CloseImage,TweenInfo.new(.25),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
    end)

    TextButton.MouseButton1Click:Connect(function()
        Library.addbuttoneffect()
        wait(.25)
        remove()
    end)

    spawn(function()
        wait(Timeshow)
        remove()
    end)


end

function Library.CreateWindow(WindowName)
    --Drag function, by Ririchi / Inori
    local Heartbeat = game:GetService("RunService").Heartbeat;

    local dragger = {}

    do
        local mouse        = game:GetService("Players").LocalPlayer:GetMouse();
        local inputService = game:GetService('UserInputService');
        local heartbeat    = game:GetService("RunService").Heartbeat;

        function dragger.new(frame, secondlol)
            frame.Active = true;
            secondlol.Active = true;

            secondlol.MouseLeave:connect(function()
                IsInFrame = false;
            end)

            secondlol.MouseEnter:connect(function()
                IsInFrame = true;
            end)

            local input = secondlol.InputBegan:connect(function(key)
                if key.UserInputType == Enum.UserInputType.MouseButton1 and IsInFrame then
                    local objectPosition = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y);
                    while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                        pcall(function()
                            frame:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X + (frame.Size.X.Offset * frame.AnchorPoint.X), 0, mouse.Y - objectPosition.Y + (frame.Size.Y.Offset * frame.AnchorPoint.Y)), 'Out', 'Linear', 0.01, true);
                        end)
                    end
                end
            end)
        end
    end

    --Created ScreenUI
    Library.Gui = Instance.new('ScreenGui')
    Library.Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Library.Gui.Name = 'sitink[Premium Edition]'
    Library.Toggled = true

    Library.Gui.Parent = game:GetService('CoreGui')

    --Button Effect
    function Library.addbuttoneffect()
        local mouse = game:GetService("Players").LocalPlayer:GetMouse();
        local buoi = Drawing.new("Circle")
        buoi.Visible = true
        buoi.Radius = 10
        buoi.Filled = true
        buoi.Color = getgenv().CustomUI and getgenv().CustomUI.Misc.ClickEffect or Color3.fromRGB(255, 255, 255)
        buoi.Position = Vector2.new(mouse.X, mouse.Y + 35)


        local BuoiFolder = Instance.new('Folder')
        BuoiFolder.Parent = Library.gui
        BuoiFolder.Name = 'Van ddos'

        local a = Instance.new('NumberValue')
        a.Value = 10
        a.Parent = BuoiFolder
        a.Name = 'Van meo'

        local b = Instance.new('NumberValue')
        b.Value = 1
        b.Parent = BuoiFolder
        b.Name = 'Van ddos va van meo nhu nhau'

        TweenService:Create(a,TweenInfo.new(.25),{Value = 30}):Play()
        TweenService:Create(b,TweenInfo.new(.25),{Value = 0}):Play()


        a:GetPropertyChangedSignal('Value'):Connect(function()
            buoi.Radius = a.Value
        end)


        b:GetPropertyChangedSignal('Value'):Connect(function()
            buoi.Transparency = b.Value
        end)

        wait(.5)
        BuoiFolder:Destroy()
    end

    --Toggle UI Function
    function Library_Function.Toggle() 
        Library.Toggled = not Library.Toggled;
        Library.Gui.Enabled = Library.Toggled;
    end

    --Created Window

    local Top = Instance.new("Frame")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TopContainer = Instance.new("Frame")
    local TitleName = Instance.new("TextLabel")
    local CloseContainer = Instance.new("Frame")
    local CloseImage = Instance.new("ImageLabel")
    local CloseButton = Instance.new("TextButton")
    local TabContainer = Instance.new("ScrollingFrame")
    local TabCon_Con = Instance.new("Frame")
    local TabListLayout = Instance.new("UIListLayout")
    local VinfContainer = Instance.new("Frame")
    local Vinf = Instance.new("Frame")
    local VinfCorner = Instance.new("UICorner")
    local Vinfimg = Instance.new("ImageLabel")
    local VinfimgCorner = Instance.new("UICorner")
    local VinfText = Instance.new("TextLabel")
    local TextButton_2 = Instance.new("TextButton")
    local MainContainer = Instance.new("Frame")
    local MainPage = Instance.new("UIPageLayout")

    Top.Name = "VinHub bu cac"
    Top.Parent = Library.Gui
    Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Top.AnchorPoint = Vector2.new(.5,.5)
    Top.BackgroundTransparency = 1.000
    Top.Position = UDim2.new(0.5, 0, 0.27, 0)
    Top.Size = UDim2.new(0, 670, 0, 30)

    dragger.new(Top,Top)

    Main.Name = "VinHub bu cac x2"
    Main.Parent = Top
    Main.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
    Main.Size = UDim2.new(1, 0, 0, 370)

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Main

    TopContainer.Name = "TopContainer"
    TopContainer.Parent = Main
    TopContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopContainer.BackgroundTransparency = 1.000
    TopContainer.Size = UDim2.new(1, 0, 0, 30)

    TitleName.Name = "TitleName"
    TitleName.Parent = TopContainer
    TitleName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleName.BackgroundTransparency = 1.000
    TitleName.Position = UDim2.new(0, 10, 0, 0)
    TitleName.Size = UDim2.new(1, -10, 1, 0)
    TitleName.Font = Enum.Font.GothamBold
    TitleName.Text = "<font color=\"rgb("..tostring(getcolor(UI_Theme['Main Color'])[1])..','..tostring(getcolor(UI_Theme['Main Color'])[2])..','..tostring(getcolor(UI_Theme['Main Color'])[3])..")\">sitink Hub</font> - "..WindowName
    TitleName.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleName.TextSize = 16.000
    TitleName.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    TitleName.TextWrapped = true
    TitleName.TextXAlignment = Enum.TextXAlignment.Left
    TitleName.RichText = true

    CloseContainer.Name = "CloseContainer"
    CloseContainer.Parent = TopContainer
    CloseContainer.AnchorPoint = Vector2.new(1, 0.5)
    CloseContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseContainer.BackgroundTransparency = 1.000
    CloseContainer.Position = UDim2.new(1, -4, 0.5, 0)
    CloseContainer.Size = UDim2.new(0, 22, 0, 22)

    CloseImage.Name = "CloseImage"
    CloseImage.Parent = CloseContainer
    CloseImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseImage.BackgroundTransparency = 1.000
    CloseImage.Size = UDim2.new(1, 0, 1, 0)
    CloseImage.Image = "rbxassetid://3926305904"
    CloseImage.ImageRectOffset = Vector2.new(284, 4)
    CloseImage.ImageRectSize = Vector2.new(24, 24)

    CloseButton.Parent = CloseContainer
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.BackgroundTransparency = 1.000
    CloseButton.Size = UDim2.new(1, 0, 1, 0)
    CloseButton.Font = Enum.Font.SourceSans
    CloseButton.Text = ""
    CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    CloseButton.TextSize = 14.000

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = Main
    TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0, 10, 0, 80)
    TabContainer.Selectable = false
    TabContainer.Size = UDim2.new(0, 180, 0, 280)
    TabContainer.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabContainer.ScrollBarThickness = 5
    TabContainer.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

    TabCon_Con.Name = "TabCon_Con"
    TabCon_Con.Parent = TabContainer
    TabCon_Con.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabCon_Con.BackgroundTransparency = 1.000
    TabCon_Con.Position = UDim2.new(0, 5, 0, 0)
    TabCon_Con.Size = UDim2.new(1, -15, 1, 0)

    TabListLayout.Name = "TabListLayout"
    TabListLayout.Parent = TabCon_Con
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 5)

    TabListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabContainer.CanvasSize = UDim2.new(0,0,0,TabListLayout.AbsoluteContentSize.Y + 5)
    end)

    VinfContainer.Name = "VinfContainer"
    VinfContainer.Parent = Main
    VinfContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    VinfContainer.BackgroundTransparency = 1.000
    VinfContainer.Position = UDim2.new(0, 10, 0, 30)
    VinfContainer.Size = UDim2.new(0, 180, 0, 44)

    Vinf.Name = "Vinf"
    Vinf.Parent = VinfContainer
    Vinf.AnchorPoint = Vector2.new(0.5, 0.5)
    Vinf.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Vinf.BackgroundTransparency = 1
    Vinf.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Vinf.Position = UDim2.new(0.5, 0, 0.5, 0)
    Vinf.Size = UDim2.new(1, -4, 1, -4)

    VinfCorner.CornerRadius = UDim.new(0, 4)
    VinfCorner.Name = "VinfCorner"
    VinfCorner.Parent = Vinf

    Vinfimg.Name = "Vinfimg"
    Vinfimg.Parent = Vinf
    Vinfimg.AnchorPoint = Vector2.new(0, 0.5)
    Vinfimg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Vinfimg.BackgroundTransparency = 1.000
    Vinfimg.Position = UDim2.new(0, 5, 0.5, 0)
    Vinfimg.Size = UDim2.new(0, 30, 0, 30)
    Vinfimg.Image = UI_Theme['Image Icon']

    VinfimgCorner.CornerRadius = UDim.new(1, 0)
    VinfimgCorner.Name = "VinfimgCorner"
    VinfimgCorner.Parent = Vinfimg

    VinfText.Name = "VinfText"
    VinfText.Parent = Vinf
    VinfText.AnchorPoint = Vector2.new(1, 0.5)
    VinfText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    VinfText.BackgroundTransparency = 1.000
    VinfText.Position = UDim2.new(1, 0, 0.5, 0)
    VinfText.Size = UDim2.new(0, 135, 0, 40)
    VinfText.Font = Enum.Font.Gotham
    VinfText.Text = "<b>sitink Hub Info</b>"
    VinfText.TextColor3 = Color3.fromRGB(255, 255, 255)
    VinfText.TextSize = 14.000
    VinfText.TextXAlignment = Enum.TextXAlignment.Left
    VinfText.RichText = true

    TextButton_2.Parent = VinfContainer
    TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_2.BackgroundTransparency = 1.000
    TextButton_2.Size = UDim2.new(1, 0, 1, 0)
    TextButton_2.Font = Enum.Font.SourceSans
    TextButton_2.Text = ""
    TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_2.TextSize = 14.000

    MainContainer.Name = "MainContainer"
    MainContainer.Parent = Main
    MainContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainContainer.BackgroundTransparency = 1.000
    MainContainer.ClipsDescendants = true
    MainContainer.Position = UDim2.new(0, 210, 0, 30)
    MainContainer.Size = UDim2.new(0, 455, 0, 370)

    MainPage.Name = "MainPage"
    MainPage.Parent = MainContainer
    MainPage.FillDirection = Enum.FillDirection.Vertical
    MainPage.SortOrder = Enum.SortOrder.LayoutOrder
    MainPage.EasingDirection = Enum.EasingDirection.InOut
    MainPage.EasingStyle = Enum.EasingStyle.Quart
    MainPage.Padding = UDim.new(0, 5)
    MainPage.TweenTime = .25

    TextButton_2.MouseEnter:Connect(function()
        TweenService:Create(Vinf,TweenInfo.new(.5),{BackgroundTransparency = .75}):Play()
    end)
    TextButton_2.MouseLeave:Connect(function()
        TweenService:Create(Vinf,TweenInfo.new(.5),{BackgroundTransparency = 1}):Play()
    end)

    --Close Function 

    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseImage,TweenInfo.new(.5),{ImageColor3 = UI_Theme['Main Color']}):Play()
    end)

    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseImage,TweenInfo.new(.5),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
    end)

    CloseButton.MouseButton1Click:Connect(function()
        Library.addbuttoneffect()
        Library_Function.Destroy()
    end)



    local Main_function = {}

    local LayoutOrderBut = -1
    local LayoutOrder = -1

    function Main_function.CreatePage(Tab_Name)
        LayoutOrderBut = LayoutOrderBut + 1
        LayoutOrder = LayoutOrder + 1

        local TabName = Instance.new("Frame")
        local TabNameCorner = Instance.new("UICorner")
        local Line = Instance.new("Frame")
        local InLine = Instance.new("Frame")
        local LineCorner = Instance.new("UICorner")
        local TabTitleContainer = Instance.new("Frame")
        local TabTitle = Instance.new("TextLabel")
        local TabButton = Instance.new('TextButton')
        local TabFrame = Instance.new("Frame")
        local TabLabel = Instance.new("TextLabel")
        local TabButton2 = Instance.new('TextButton')

        TabName.Name = Tab_Name.."Tab_Control"
        TabName.Parent = TabCon_Con
        TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabName.BackgroundTransparency = 1.000
        TabName.Size = UDim2.new(1, 0, 0, 30)
        TabName.LayoutOrder = LayoutOrderBut

        TabNameCorner.CornerRadius = UDim.new(0, 4)
        TabNameCorner.Name = "TabNameCorner"
        TabNameCorner.Parent = TabName

        Line.Name = "Line"
        Line.Parent = TabName
        Line.AnchorPoint = Vector2.new(0, 0.5)
        Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Line.BackgroundTransparency = 1.000
        Line.Position = UDim2.new(0, 0, 0.5, 0)
        Line.Size = UDim2.new(0, 14, 1, 0)

        InLine.Name = "InLine"
        InLine.Parent = Line
        InLine.AnchorPoint = Vector2.new(0.5, 0.5)
        InLine.BackgroundColor3 = Color3.fromRGB(115, 148, 255)
        InLine.BorderSizePixel = 0
        InLine.Position = UDim2.new(0.5, 0, 0.5, 0)
        InLine.Size = UDim2.new(1, -10, 0, 0)

        LineCorner.Name = "LineCorner"
        LineCorner.Parent = InLine

        TabTitleContainer.Name = "TabTitleContainer"
        TabTitleContainer.Parent = TabName
        TabTitleContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabTitleContainer.BackgroundTransparency = 1.000
        TabTitleContainer.Position = UDim2.new(0, 15, 0, 0)
        TabTitleContainer.Size = UDim2.new(1, -15, 0, 30)

        TabTitle.Name = "TabTitle"
        TabTitle.Parent = TabTitleContainer
        TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabTitle.BackgroundTransparency = 1.000
        TabTitle.Size = UDim2.new(1, 0, 1, 0)
        TabTitle.Font = Enum.Font.GothamBold
        TabTitle.Text = Tab_Name
        TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabTitle.TextSize = 14.000
        TabTitle.TextXAlignment = Enum.TextXAlignment.Left

        TabButton.Name = 'TabButton'
        TabButton.Parent = TabName
        TabButton.BackgroundTransparency = 1
        TabButton.TextTransparency = 1
        TabButton.Size = UDim2.new(1,0,1,0)

        local TabNameCon = Instance.new("Frame")
        local FolderContainerTitle = Instance.new("Frame")
        local FolderTitleLayout = Instance.new("UIListLayout")
        local FolderContainer = Instance.new("Frame")
        local FolderPageLayout = Instance.new("UIPageLayout")

        TabNameCon.Name = Tab_Name.."Tab_Con"
        TabNameCon.Parent = MainContainer
        TabNameCon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabNameCon.BackgroundTransparency = 1.000
        TabNameCon.Position = UDim2.new(0, 0, 0, 30)
        TabNameCon.Size = UDim2.new(1, 0, 1, -30)
        TabNameCon.LayoutOrder = 1

        FolderContainerTitle.Name = "FolderContainerTitle"
        FolderContainerTitle.Parent = TabNameCon
        FolderContainerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FolderContainerTitle.BackgroundTransparency = 1.000
        FolderContainerTitle.Size = UDim2.new(0, 450, 0, 25)

        FolderTitleLayout.Name = "FolderTitleLayout"
        FolderTitleLayout.Parent = FolderContainerTitle
        FolderTitleLayout.FillDirection = Enum.FillDirection.Horizontal
        FolderTitleLayout.SortOrder = Enum.SortOrder.LayoutOrder

        FolderContainer.Name = "FolderContainer"
        FolderContainer.Parent = TabNameCon
        FolderContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FolderContainer.BackgroundTransparency = 1.000
        FolderContainer.Position = UDim2.new(0, 0, 0, 30)
        FolderContainer.Size = UDim2.new(1, 0, 1, -30)

        FolderPageLayout.Name = "FolderPageLayout"
        FolderPageLayout.Parent = FolderContainer
        FolderPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        FolderPageLayout.EasingDirection = Enum.EasingDirection.InOut
        FolderPageLayout.EasingStyle = Enum.EasingStyle.Quart
        FolderPageLayout.Padding = UDim.new(0, 5)
        FolderPageLayout.TweenTime = .25

        local Frame = Instance.new("Frame")
        local FolButton = Instance.new("TextButton")


        Frame.Parent = FolderContainerTitle
        Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame.BackgroundTransparency = 1.000
        Frame.Size = UDim2.new(0, 100, 1, 0)

        FolButton.Parent = Frame
        FolButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FolButton.BackgroundTransparency = 1.000
        FolButton.Size = UDim2.new(1, 0, 1, 0)
        FolButton.Font = Enum.Font.GothamBold
        FolButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        FolButton.TextSize = 16.000
        FolButton.TextXAlignment = Enum.TextXAlignment.Left
        FolButton.Text = Tab_Name

        local FolderMain = Instance.new("ScrollingFrame")
        local FolderCon = Instance.new("Frame")
        local FolderConList = Instance.new("UIListLayout")

        FolderMain.Name = "FolderMain"
        FolderMain.Parent = FolderContainer
        FolderMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FolderMain.BackgroundTransparency = 1.000
        FolderMain.BorderSizePixel = 0
        FolderMain.Selectable = false
        FolderMain.Size = UDim2.new(1, 0, 1, 0)
        FolderMain.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        FolderMain.ScrollBarThickness = 5
        FolderMain.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        FolderMain.CanvasSize = UDim2.new(0,0,0,0)

        FolderCon.Name = "FolderCon"
        FolderCon.Parent = FolderMain
        FolderCon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FolderCon.BackgroundTransparency = 1.000
        FolderCon.Position = UDim2.new(0, 0, 0, 0)
        FolderCon.Size = UDim2.new(1, -10, 1, 0)

        FolderConList.Name = "FolderConList"
        FolderConList.Parent = FolderCon
        FolderConList.SortOrder = Enum.SortOrder.LayoutOrder
        FolderConList.Padding = UDim.new(0,5)

        FolderConList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            FolderMain.CanvasSize = UDim2.new(0,0,0,FolderConList.AbsoluteContentSize.Y + 5)
        end)

        FolButton.MouseButton1Click:Connect(function() Library.addbuttoneffect() end)

        FolButton.MouseButton1Click:Connect(function()
            TweenService:Create(FolButton,TweenInfo.new(.5),{TextTransparency = 0}):Play()
            FolderPageLayout:JumpTo(FolderMain)
            for i,v in next, FolderContainerTitle:GetChildren() do
                if string.find(v.Name,'Fol') and v:IsA('Frame') then 
                    TweenService:Create(v.Foltext,TweenInfo.new(.25),{TextTransparency = 1}):Play()
                    TweenService:Create(v.Folimg,TweenInfo.new(.25),{ImageTransparency = 1}):Play()
                    wait(.25)
                    v.Visible = false 
                end
            end
        end)


        Frame.Size = UDim2.new(0, 10 + FolButton.TextBounds.X, 0, 25)

        TabButton.MouseEnter:Connect(function()
            if TabName.BackgroundTransparency == 1 then 
                TweenService:Create(TabName,TweenInfo.new(.5),{BackgroundTransparency = 0.5}):Play()
            end
        end)

        TabButton.MouseLeave:Connect(function()
            if not TabName.Active then 
                TweenService:Create(TabName,TweenInfo.new(.5),{BackgroundTransparency = 1}):Play()
            end
        end)

        for i,v in pairs(TabCon_Con:GetChildren()) do
            if not (v:IsA('UIListLayout')) then
                if i == 2 then 
                    v.BackgroundTransparency = 0.7;
                    v.Line.InLine.Size = UDim2.new(1, -10, 1, -10)
                    v.Active = true
                    oldlay = v.LayoutOrder
                    oldobj = v
                end
            end
        end

        TabButton.MouseButton1Click:Connect(function()
            Library.addbuttoneffect()
        end)

        TabButton.MouseButton1Click:Connect(function()
            if TabName.Name == Tab_Name.."Tab_Control" and not TabName.Active then

                for i,v in pairs(MainContainer:GetChildren()) do
                    if not (v:IsA('UIPageLayout')) and not (v:IsA('UICorner')) then
                        v.Visible = false
                        --[[if v.Name == Tab_Name.."Tab_Con" then
                            MainPage:JumpToIndex(TabNameCon.LayoutOrder)
                        end]]
                    end
                end
                TabNameCon.Visible = true 
                MainPage:JumpTo(TabNameCon)

                for i,v in pairs(TabCon_Con:GetChildren()) do
                    if not (v:IsA('UIListLayout')) then
                        if v.Name == Tab_Name.."Tab_Control" then 
                            if v.LayoutOrder > oldlay  then 
                                oldobj.Active = false 
                                TweenService:Create(oldobj.Line.InLine,TweenInfo.new(.5),{Size = UDim2.new(1,-10,0,0),Position = UDim2.new(0.5, 0, 1, 0), AnchorPoint = Vector2.new(.5,1)}):Play()
                                TweenService:Create(oldobj,TweenInfo.new(.5),{BackgroundTransparency = 1}):Play()
                                v.Line.InLine.Position = UDim2.new(0.5, 0, 0, 0)
                                v.Line.InLine.AnchorPoint = Vector2.new(.5,0)
                                wait(.25)
                                TweenService:Create(v.Line.InLine,TweenInfo.new(.5),{Size = UDim2.new(1,-10,1,-10),Position = UDim2.new(0.5, 0, .5, 0), AnchorPoint = Vector2.new(.5,.5)}):Play()
                                TweenService:Create(v,TweenInfo.new(.5),{BackgroundTransparency = .7}):Play()
                                v.Active = true
                                oldobj = v
                                oldlay = v.LayoutOrder
                            else
                                oldobj.Active = false 
                                TweenService:Create(oldobj.Line.InLine,TweenInfo.new(.5),{Size = UDim2.new(1,-10,0,0),Position = UDim2.new(0.5, 0, 0, 0), AnchorPoint = Vector2.new(.5,0)}):Play()
                                TweenService:Create(oldobj,TweenInfo.new(.5),{BackgroundTransparency = 1}):Play()
                                v.Line.InLine.Position = UDim2.new(0.5, 0, 1, 0)
                                v.Line.InLine.AnchorPoint = Vector2.new(.5,1)
                                wait(.25)
                                TweenService:Create(v.Line.InLine,TweenInfo.new(.5),{Size = UDim2.new(1,-10,1,-10),Position = UDim2.new(0.5, 0, .5, 0), AnchorPoint = Vector2.new(.5,.5)}):Play()
                                TweenService:Create(v,TweenInfo.new(.5),{BackgroundTransparency = .7}):Play()
                                v.Active = true
                                oldobj = v
                                oldlay = v.LayoutOrder
                            end

                        end
                    end
                end
            end
        end)

        local Page_function = {}

        function Page_function.AddFolder(Setting)
            local Folder_Name = Setting.Folder_Name;
            local Folder_Desc = Setting.Folder_Desc;

            local Fol = Instance.new("Frame")
            local Foltext = Instance.new("TextButton")
            local Folimg = Instance.new("ImageLabel")

            Fol.Name = Folder_Name.."Fol"
            Fol.Parent = FolderContainerTitle
            Fol.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Fol.BackgroundTransparency = 1.000
            Fol.Size = UDim2.new(0, 100, 1, 0)
            Fol.Visible = false

            Foltext.Name = "Foltext"
            Foltext.Parent = Fol
            Foltext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Foltext.BackgroundTransparency = 1.000
            Foltext.Position = UDim2.new(0, 20, 0, 0)
            Foltext.Size = UDim2.new(1, -20, 1, 0)
            Foltext.Font = Enum.Font.GothamBold
            Foltext.TextColor3 = Color3.fromRGB(255, 255, 255)
            Foltext.TextSize = 16.000
            Foltext.TextXAlignment = Enum.TextXAlignment.Left
            Foltext.Text = Folder_Name

            Fol.Size = UDim2.new(0, 30 + Foltext.TextBounds.X, 0, 25)

            Folimg.Name = "Folimg"
            Folimg.Parent = Fol
            Folimg.AnchorPoint = Vector2.new(0, 0.5)
            Folimg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Folimg.BackgroundTransparency = 1.000
            Folimg.Position = UDim2.new(0, 0, 0.5, 0)
            Folimg.Size = UDim2.new(0, 15, 0, 15)
            Folimg.Image = "rbxassetid://6954383209"

            local Folder_Desc = Folder_Desc or ''
            local foldername = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local concac = Instance.new("Frame")
            local title = Instance.new("TextLabel")
            local concac1 = Instance.new("Frame")
            local desc = Instance.new("TextLabel")
            local Frame = Instance.new("Frame")
            local ImageLabel = Instance.new("ImageLabel")
            local folderbutton = Instance.new("TextButton")

            foldername.Name = Folder_Name.."folder"
            foldername.Parent = FolderCon
            foldername.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            foldername.Size = UDim2.new(1, 0, 0, 50)

            UICorner.CornerRadius = UDim.new(0, 4)
            UICorner.Parent = foldername

            concac.Name = "concac"
            concac.Parent = foldername
            concac.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            concac.BackgroundTransparency = 1.000
            concac.Size = UDim2.new(1, 0, 0.5, 0)

            title.Name = "title"
            title.Parent = concac
            title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            title.BackgroundTransparency = 1.000
            title.Position = UDim2.new(0, 5, 0, 0)
            title.Size = UDim2.new(1, -5, 1, 0)
            title.Font = Enum.Font.GothamBold
            title.TextColor3 = Color3.fromRGB(255, 255, 255)
            title.TextSize = 15.000
            title.TextXAlignment = Enum.TextXAlignment.Left
            title.Text = Folder_Name

            concac1.Name = "concac1"
            concac1.Parent = foldername
            concac1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            concac1.BackgroundTransparency = 1.000
            concac1.Position = UDim2.new(0, 0, 0, 25)
            concac1.Size = UDim2.new(1, 0, 0.5, 0)

            desc.Name = "desc"
            desc.Parent = concac1
            desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            desc.BackgroundTransparency = 1.000
            desc.Position = UDim2.new(0, 5, 0, 0)
            desc.Size = UDim2.new(1, -5, 1, 0)
            desc.Font = Enum.Font.GothamBold
            desc.TextColor3 = Color3.fromRGB(255, 255, 255)
            desc.TextSize = 12.000
            desc.TextXAlignment = Enum.TextXAlignment.Left
            desc.Text = Folder_Desc

            Frame.Parent = foldername
            Frame.AnchorPoint = Vector2.new(1, 0.5)
            Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Frame.BackgroundTransparency = 1.000
            Frame.Position = UDim2.new(1, -10, 0.5, 0)
            Frame.Size = UDim2.new(0, 20, 0, 20)

            ImageLabel.Parent = Frame
            ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ImageLabel.BackgroundTransparency = 1.000
            ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
            ImageLabel.Size = UDim2.new(1, 0, 1, 0)
            ImageLabel.Image = "rbxassetid://6954383209"

            folderbutton.Name = "folderbutton"
            folderbutton.Parent = foldername
            folderbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            folderbutton.BackgroundTransparency = 1.000
            folderbutton.Size = UDim2.new(1, 0, 1, 0)
            folderbutton.Font = Enum.Font.SourceSans
            folderbutton.Text = ""
            folderbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
            folderbutton.TextSize = 14.000

            local FolderInCon = Instance.new("ScrollingFrame")
            local FolderConCon = Instance.new("Frame")
            local FolderConConList = Instance.new("UIListLayout")

            FolderInCon.Name = Folder_Name.."Bucu"
            FolderInCon.Parent = FolderContainer
            FolderInCon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            FolderInCon.BackgroundTransparency = 1.000
            FolderInCon.BorderSizePixel = 0
            FolderInCon.Selectable = false
            FolderInCon.Size = UDim2.new(1, 0, 1, 0)
            FolderInCon.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            FolderInCon.ScrollBarThickness = 5
            FolderInCon.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            FolderInCon.LayoutOrder = 1
            FolderInCon.CanvasSize = UDim2.new(0,0,0,0)

            FolderConCon.Name = "FolderConCon"
            FolderConCon.Parent = FolderInCon
            FolderConCon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            FolderConCon.BackgroundTransparency = 1.000
            FolderConCon.Size = UDim2.new(1, -10, 1, 0)

            FolderConConList.Name = "FolderConConList"
            FolderConConList.Parent = FolderConCon
            FolderConConList.SortOrder = Enum.SortOrder.LayoutOrder
            FolderConConList.Padding = UDim.new(0, 5)

            FolderConConList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                FolderInCon.CanvasSize = UDim2.new(0,0,0,FolderConConList.AbsoluteContentSize.Y + 5)
            end)

            folderbutton.MouseButton1Click:Connect(function()
                Library.addbuttoneffect();
            end)

            folderbutton.MouseButton1Click:Connect(function()
                for i,v in next, FolderContainer:GetChildren() do 
                    if v:IsA('Frame') and string.find(v.Name,'bucu') then 
                        v.Visible = false 
                    end
                end
                FolderInCon.Visible = true 
                FolderPageLayout:JumpTo(FolderInCon)
            end)

            folderbutton.MouseButton1Click:Connect(function()
                for i,v in next, FolderContainerTitle:GetChildren() do 
                    if v.Name == 'Frame' then 
                        TweenService:Create(v.TextButton,TweenInfo.new(.5),{TextTransparency =.4}):Play()
                    elseif not v:IsA('UIListLayout') then
                        TweenService:Create(v.Foltext,TweenInfo.new(.25),{TextTransparency = 1}):Play()
                        TweenService:Create(v.Folimg,TweenInfo.new(.25),{ImageTransparency = 1}):Play()
                        wait()
                        v.Visible = false
                    end
                end
                Fol.Visible = true
                spawn(function()
                    wait()
                    TweenService:Create(Fol.Foltext,TweenInfo.new(.25),{TextTransparency = 0}):Play()
                    TweenService:Create(Fol.Folimg,TweenInfo.new(.25),{ImageTransparency = 0}):Play()
                end)

            end)

            local Folder_function = {}
            local Sec_oder = -1 
            local Sec_zin = 99
            function Folder_function.AddSection(Section_name)
                Sec_oder = Sec_oder + 1
                Sec_zin = Sec_zin - 1
                local SectionName = Instance.new("Frame")
                local SectionListLayout = Instance.new("UIListLayout")
                local SectionTitle = Instance.new("TextLabel")


                SectionName.Name = Section_name.."bucac"
                SectionName.Parent = FolderConCon
                SectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SectionName.BackgroundTransparency = 1.000
                SectionName.Size = UDim2.new(1, 0, 0, 50)
                --SectionName.LayoutOrder = Sec_oder
                --SectionName.ZIndex = Sec_zin

                SectionListLayout.Name = "SectionListLayout"
                SectionListLayout.Parent = SectionName
                SectionListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                SectionListLayout.Padding = UDim.new(0, 5)

                SectionTitle.Name = "SectionTitle"
                SectionTitle.Parent = SectionName
                SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SectionTitle.BackgroundTransparency = 1.000
                SectionTitle.Size = UDim2.new(1, 0, 0, 20)
                SectionTitle.Font = Enum.Font.GothamBlack
                SectionTitle.Text = Section_name
                SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                SectionTitle.TextSize = 13.000
                SectionTitle.TextXAlignment = Enum.TextXAlignment.Left

                SectionListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    SectionName.Size = UDim2.new(1,0,0,SectionListLayout.AbsoluteContentSize.Y + 5)
                end)

                local Section_function = {}

                function Section_function.CreateToggle(Setting,Callback)
                    
                    local TogName = Setting.ToggleName; 
                    local TogDesc = Setting.ToggleDesc; 
                    local DefaultValue = Setting.DefaultValue or false;
                    local Callback = Callback or function() end;

                    local ToggleFrame = Instance.new("Frame")
                    local ToggleCorner = Instance.new("UICorner")
                    local ToggleTitle = Instance.new("TextLabel")
                    local ToggleDesc = Instance.new("TextLabel")
                    local ToggleButton = Instance.new("TextButton")
                    local Togglebucu = Instance.new("Frame")
                    local TogglebucuCorner = Instance.new("UICorner")
                    local StageFrame = Instance.new("Frame")
                    local StageFrameCorner = Instance.new("UICorner")
                    local StrokeUI = Instance.new('UIStroke')

                    ToggleFrame.Name = TogName.."Ngu"
                    ToggleFrame.Parent = SectionName
                    ToggleFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    ToggleFrame.Position = UDim2.new(0, 0, 0, 0)
                    ToggleFrame.Size = UDim2.new(1, 0, 0, 50)
                    ToggleFrame.LayoutOrder = OderSec

                    ToggleCorner.CornerRadius = UDim.new(0, 4)
                    ToggleCorner.Name = "ToggleCorner"
                    ToggleCorner.Parent = ToggleFrame

                    ToggleTitle.Name = "ToggleTitle"
                    ToggleTitle.Parent = ToggleFrame
                    ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleTitle.BackgroundTransparency = 1.000
                    ToggleTitle.Position = UDim2.new(0, 10, 0, 0)
                    ToggleTitle.Size = UDim2.new(1, -10, 0.5, 10)
                    ToggleTitle.Font = Enum.Font.GothamBlack
                    ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleTitle.TextSize = 14.000
                    ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
                    ToggleTitle.Text = TogName

                    ToggleDesc.Name = "ToggleDesc"
                    ToggleDesc.Parent = ToggleFrame
                    ToggleDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleDesc.BackgroundTransparency = 1.000
                    ToggleDesc.Position = UDim2.new(0, 10, 0.5, -5)
                    ToggleDesc.Size = UDim2.new(1, -10, 0.5, 0)
                    ToggleDesc.Font = Enum.Font.GothamBold
                    ToggleDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleDesc.TextSize = 12.000
                    ToggleDesc.TextXAlignment = Enum.TextXAlignment.Left
                    ToggleDesc.Text = TogDesc

                    ToggleButton.Name = "ToggleButton"
                    ToggleButton.Parent = ToggleFrame
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleButton.BackgroundTransparency = 1.000
                    ToggleButton.Size = UDim2.new(1, 0, 1, 0)
                    ToggleButton.Font = Enum.Font.SourceSans
                    ToggleButton.Text = ""
                    ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                    ToggleButton.TextSize = 14.000

                    Togglebucu.Name = "Togglebucu"
                    Togglebucu.Parent = ToggleFrame
                    Togglebucu.AnchorPoint = Vector2.new(1, 0.5)
                    Togglebucu.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
                    Togglebucu.Position = UDim2.new(1, -10, 0.5, 0)
                    Togglebucu.Size = UDim2.new(0, 50, 0, 20)

                    StrokeUI.Parent = Togglebucu
                    StrokeUI.Color = Color3.fromRGB(255,255,255)
                    StrokeUI.LineJoinMode = Enum.LineJoinMode.Round
                    StrokeUI.Thickness = 1

                    TogglebucuCorner.CornerRadius = UDim.new(1, 0)
                    TogglebucuCorner.Name = "TogglebucuCorner"
                    TogglebucuCorner.Parent = Togglebucu

                    StageFrame.Name = "StageFrame"
                    StageFrame.Parent = Togglebucu
                    StageFrame.AnchorPoint = Vector2.new(0, 0.5)
                    StageFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    StageFrame.Position = UDim2.new(0, 3, 0.5, 0)
                    StageFrame.Size = UDim2.new(0, 14, 0, 14)

                    StageFrameCorner.CornerRadius = UDim.new(1, 0)
                    StageFrameCorner.Name = "StageFrameCorner"
                    StageFrameCorner.Parent = StageFrame

                    ToggleButton.MouseEnter:Connect(function()
                        TweenService:Create(ToggleFrame,TweenInfo.new(.5),{BackgroundColor3 = Color3.fromRGB(69, 69, 69)}):Play()
                    end)

                    ToggleButton.MouseLeave:Connect(function()
                        TweenService:Create(ToggleFrame,TweenInfo.new(.5),{BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
                    end)

                    local function Conback(val)
                        local stagepos = val and UDim2.new(1,-17,.5,0) or UDim2.new(0,3,.5,0)
                        local stroketrans = val and 1 or 0 
                        local Togglebucucolor = val and UI_Theme['Main Color'] or Color3.fromRGB(55, 55, 55)
                        TweenService:Create(Togglebucu,TweenInfo.new(.25),{BackgroundColor3 = Togglebucucolor}):Play()
                        TweenService:Create(StrokeUI,TweenInfo.new(.25),{Transparency = stroketrans}):Play()
                        TweenService:Create(StageFrame,TweenInfo.new(.25),{Position = stagepos}):Play()
                        Callback(val)
                    end

                    if DefaultValue and Callback then Conback(DefaultValue) end 

                    ToggleButton.MouseButton1Click:Connect(function() Library.addbuttoneffect() end)

                    ToggleButton.MouseButton1Click:Connect(function()
                        DefaultValue = not DefaultValue
                        Conback(DefaultValue)
                    end)

                    local tog_func = {}

                    function tog_func.SetStage(vale)
                        Conback(vale)
                    end

                    return tog_func

                end

                function Section_function.CreateButton(Setting,Callback)

                    

                    local ButtonName = Setting.ButtonName
                    local ButtonValue = Setting.ButtonValue
                    local ButtonDescText = Setting.ButtonDesc
                    local Callback = Callback or function() end

                    local Sizef = ButtonDescText and UDim2.new(1, 0, 0, 50) or UDim2.new(1, 0, 0, 40)
                    local Sizename = ButtonDescText and UDim2.new(1, -10, 0.5, 10) or UDim2.new(1, -10, 1, 0)
                    local Sizebut = ButtonDescText and UDim2.new(0,150,1,-20) or UDim2.new(0,150,0,24)

                    local ButtonFrame = Instance.new("Frame")
                    local ButtonCorner = Instance.new("UICorner")
                    local ButtonTitle = Instance.new("TextLabel")
                    local ButtonDesc = Instance.new("TextLabel")
                    local ButtonCor = Instance.new("Frame")
                    local ButtonCorner1 = Instance.new("UICorner")
                    local Buttonee = Instance.new("TextButton")

                    ButtonFrame.Name = ButtonName.."Ngu"
                    ButtonFrame.Parent = SectionName
                    ButtonFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    ButtonFrame.Position = UDim2.new(0, 0, 0, 0)
                    ButtonFrame.Size = Sizef
                    ButtonFrame.LayoutOrder = OderSec

                    ButtonCorner.CornerRadius = UDim.new(0, 4)
                    ButtonCorner.Name = "ButtonCorner"
                    ButtonCorner.Parent = ButtonFrame

                    ButtonTitle.Name = "ButtonTitle"
                    ButtonTitle.Parent = ButtonFrame
                    ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ButtonTitle.BackgroundTransparency = 1.000
                    ButtonTitle.Position = UDim2.new(0, 10, 0, 0)
                    ButtonTitle.Size = Sizename
                    ButtonTitle.Font = Enum.Font.GothamBlack
                    ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    ButtonTitle.TextSize = 14.000
                    ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
                    ButtonTitle.Text = ButtonName

                    if ButtonDescText then
                        ButtonDesc.Name = "ButtonDesc"
                        ButtonDesc.Parent = ButtonFrame
                        ButtonDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ButtonDesc.BackgroundTransparency = 1.000
                        ButtonDesc.Position = UDim2.new(0, 10, 0.5, -5)
                        ButtonDesc.Size = UDim2.new(1, -10, 0.5, 0)
                        ButtonDesc.Font = Enum.Font.GothamBold
                        ButtonDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
                        ButtonDesc.TextSize = 12.000
                        ButtonDesc.TextXAlignment = Enum.TextXAlignment.Left
                        ButtonDesc.Text = ButtonDescText
                    end

                    ButtonCor.Name = "ButtonCor"
                    ButtonCor.Parent = ButtonFrame
                    ButtonCor.AnchorPoint = Vector2.new(1, 0.5)
                    ButtonCor.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
                    ButtonCor.Position = UDim2.new(1, -10, 0.5, 0)
                    ButtonCor.Size = Sizebut

                    ButtonCorner1.CornerRadius = UDim.new(0, 4)
                    ButtonCorner1.Name = "ButtonCorner"
                    ButtonCorner1.Parent = ButtonCor

                    Buttonee.Name = "Buttonee"
                    Buttonee.Parent = ButtonCor
                    Buttonee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Buttonee.BackgroundTransparency = 1.000
                    Buttonee.Size = UDim2.new(1, 0, 1, 0)
                    Buttonee.Font = Enum.Font.GothamBold
                    Buttonee.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Buttonee.TextSize = 14.000
                    Buttonee.Text = ButtonValue

                    Buttonee.MouseButton1Click:Connect(function()
                        Library.addbuttoneffect()
                    end)

                    Buttonee.MouseButton1Click:Connect(function()
                        Callback()
                    end)

                end

                function Section_function.CreateLabel(Setting)
                    

                    local TitleText = Setting.Title 
                    local TitleBGColor = Setting.BgColor or Color3.fromRGB(60,60,60)
                    local TitleTextColor = Setting.TextColor or Color3.fromRGB(255,255,255)

                    local LabelFrame = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local LabelTitle = Instance.new("TextLabel")

                    LabelFrame.Name = TitleText.."Ngu"
                    LabelFrame.Parent = SectionName
                    LabelFrame.BackgroundColor3 = TitleBGColor
                    LabelFrame.Size = UDim2.new(1, 0, 0, 30)
                    LabelFrame.LayoutOrder = OderSec

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = LabelFrame

                    LabelTitle.Name = "LabelTitle"
                    LabelTitle.Parent = LabelFrame
                    LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    LabelTitle.BackgroundTransparency = 1.000
                    LabelTitle.Position = UDim2.new(0, 10, 0, 0)
                    LabelTitle.Size = UDim2.new(1, -10, 1, 0)
                    LabelTitle.Font = Enum.Font.GothamBlack
                    LabelTitle.TextColor3 = TitleTextColor
                    LabelTitle.TextSize = 14.000
                    LabelTitle.TextXAlignment = Enum.TextXAlignment.Left
                    LabelTitle.Text = TitleText

                    local label_func = {}
                    function label_func:SetText(Val)
                        LabelTitle.Text = Val 
                    end 

                    return label_func


                end
                function Section_function.CreateLabelmmb(Setting)
                    

                    local TitleText = Setting.Title 
                    local TitleBGColor = Setting.BgColor or Color3.fromRGB(60,60,60)
                    local TitleTextColor = Setting.TextColor or Color3.fromRGB(255,255,255)

                    local LabelFrame = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local LabelTitle = Instance.new("TextLabel")

                    LabelFrame.Name = TitleText.."Ngu"
                    LabelFrame.Parent = SectionName
                    LabelFrame.BackgroundColor3 = TitleBGColor
                    LabelFrame.Size = UDim2.new(1, 0, 0, Setting.Size)
                    LabelFrame.LayoutOrder = OderSec

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = LabelFrame

                    LabelTitle.Name = "LabelTitle"
                    LabelTitle.Parent = LabelFrame
                    LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    LabelTitle.BackgroundTransparency = 1.000
                    LabelTitle.Position = UDim2.new(0, 1, 0, 0)
                    LabelTitle.Size = UDim2.new(0, -1, 1, 0)
                    LabelTitle.Font = Enum.Font.GothamBlack
                    LabelTitle.TextColor3 = TitleTextColor
                    LabelTitle.TextSize = 14.000
                    LabelTitle.TextXAlignment = Enum.TextXAlignment.Left
                    LabelTitle.Text = TitleText
                    local label_func = {}
                    function label_func:SetText(Val)
                        LabelTitle.Text = Val 
                    end 

                    return label_func

                end
                
                function Section_function.CreateSlider(Setting,Callback)
                    

                    local TitleText = Setting.Title; 
                    local DescText = Setting.Desc; 
                    local Min_Value = Setting.Min or 0;
                    local Max_Value = Setting.Max or 100;
                    local DefaultValue = Setting.DefaultValue or Min_Value;
                    local Precise = Setting.Precise or false;
                    local Disabled = Setting.Disabled or false; 

                    local SizeChia = 200; 

                    local Callback = Callback or function() end


                    local SliderFrame = Instance.new("Frame")
                    local ToggleCorner = Instance.new("UICorner")
                    local SliderTitle = Instance.new("TextLabel")
                    local SliderDesc = Instance.new("TextLabel")
                    local SliderBar = Instance.new("Frame")
                    local SliderButton = Instance.new("TextButton")
                    local SliderBarCorner = Instance.new("UICorner")
                    local Bar = Instance.new("Frame")
                    local BarCorner = Instance.new("UICorner")
                    local SliderBox = Instance.new("TextBox")

                    SliderFrame.Name = TitleText.."Ngu"
                    SliderFrame.Parent = SectionName
                    SliderFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    SliderFrame.Position = UDim2.new(0, 0, 0.208333328, 0)
                    SliderFrame.Size = UDim2.new(1, 0, 0, 50)
                    SliderFrame.LayoutOrder = OderSec

                    ToggleCorner.CornerRadius = UDim.new(0, 4)
                    ToggleCorner.Name = "ToggleCorner"
                    ToggleCorner.Parent = SliderFrame

                    SliderTitle.Name = "SliderTitle"
                    SliderTitle.Parent = SliderFrame
                    SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderTitle.BackgroundTransparency = 1.000
                    SliderTitle.Position = UDim2.new(0, 10, 0, 0)
                    SliderTitle.Size = UDim2.new(1, -10, 0.5, 10)
                    SliderTitle.Font = Enum.Font.GothamBlack
                    SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SliderTitle.TextSize = 14.000
                    SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
                    SliderTitle.Text = TitleText;

                    SliderDesc.Name = "SliderDesc"
                    SliderDesc.Parent = SliderFrame
                    SliderDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderDesc.BackgroundTransparency = 1.000
                    SliderDesc.Position = UDim2.new(0, 10, 0.600000024, -5)
                    SliderDesc.Size = UDim2.new(1, -10, 0.5, 0)
                    SliderDesc.Font = Enum.Font.GothamBold
                    SliderDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SliderDesc.TextSize = 12.000
                    SliderDesc.TextXAlignment = Enum.TextXAlignment.Left
                    SliderDesc.Text = DescText

                    SliderBar.Name = "SliderBar"
                    SliderBar.Parent = SliderFrame
                    SliderBar.AnchorPoint = Vector2.new(1, 0.5)
                    SliderBar.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
                    SliderBar.Position = UDim2.new(1, -10, 0.5, 0)
                    SliderBar.Size = UDim2.new(0, 200, 0, 5)
                    SliderBar.ClipsDescendants = true; 

                    SliderButton.Name = "SliderButton "
                    SliderButton.Parent = SliderBar
                    SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderButton.BackgroundTransparency = 1.000
                    SliderButton.Size = UDim2.new(1, 0, 1, 0)
                    SliderButton.Font = Enum.Font.GothamBold
                    SliderButton.Text = ""
                    SliderButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SliderButton.TextSize = 14.000

                    SliderBarCorner.CornerRadius = UDim.new(1, 0)
                    SliderBarCorner.Name = "SliderBarCorner"
                    SliderBarCorner.Parent = SliderBar

                    Bar.Name = "Bar"
                    Bar.Parent = SliderBar
                    Bar.BackgroundColor3 = UI_Theme['Main Color']
                    Bar.Size = UDim2.new(1, 0, 1, 0)

                    BarCorner.CornerRadius = UDim.new(1, 0)
                    BarCorner.Name = "BarCorner"
                    BarCorner.Parent = Bar

                    SliderBox.Name = "SliderBox"
                    SliderBox.Parent = SliderFrame
                    SliderBox.AnchorPoint = Vector2.new(0, 0.5)
                    SliderBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderBox.BackgroundTransparency = 1.000
                    SliderBox.Position = UDim2.new(0, 180, 0.5, 0)
                    SliderBox.Size = UDim2.new(0, 50, 0, 20)
                    SliderBox.ClearTextOnFocus = false
                    SliderBox.Font = Enum.Font.GothamBold
                    SliderBox.Text = DefaultValue;
                    SliderBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SliderBox.TextSize = 14.000
                    SliderBox.TextXAlignment = Enum.TextXAlignment.Right

                    local mouse = game.Players.LocalPlayer:GetMouse()

                    if DefaultValue and not Disabled then 
                        if DefaultValue <= Min_Value then DefaultValue = Min_Value elseif DefaultValue >= Max_Value then DefaultValue = Max_Value end
                        Bar.Size = UDim2.new(1 - ((Max_Value - DefaultValue) / (Max_Value - Min_Value)),0, 0, 6)
                        SliderBox.Text = DefaultValue
                        Callback(DefaultValue)
                    end

                    SliderButton.MouseButton1Down:Connect(function()
                        if not Disabled then 
                            local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))

                            pcall(function()
                                Callback(value)
                                SliderBox.Text = value
                            end)
                            Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
                            moveconnection = mouse.Move:Connect(function()   
                                local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))
                                pcall(function()
                                    Callback(value)
                                    SliderBox.Text = value
                                end)
                                Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
                            end)
                            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                    local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))

                                    pcall(function()
                                        Callback(value)
                                        SliderBox.Text = value
                                    end)
                                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
                                    moveconnection:Disconnect()
                                    releaseconnection:Disconnect()
                                end
                            end)
                        end
                    end)

                    local function GetSliderValue(Value)
                        if tonumber(Value) <= Min_Value then
                            Bar.Size = UDim2.new(0,(0 * SizeChia), 0, 6)
                            SliderBox.Text = Min_Value
                            if not Disabled then 
                                Callback(tonumber(Min_Value))
                            end

                        elseif tonumber(Value) >= Max_Value then
                            Bar.Size = UDim2.new(0,(Max_Value  /  Max_Value * SizeChia), 0, 6)
                            SliderBox.Text = Max_Value
                            if not Disabled then 
                                Callback(tonumber(Max_Value))
                            end
                        else
                            Bar.Size = UDim2.new(1 - ((Max_Value - Value) / (Max_Value - Min_Value)),0, 0, 6)
                            if not Disabled then 
                                Callback(tonumber(Value))
                            end
                        end
                    end


                    SliderBox.FocusLost:Connect(function()
                        GetSliderValue(SliderBox.Text)
                    end)


                    local slider_function = {}

                    function slider_function.SetValue(Value)
                        GetSliderValue(Value)
                    end

                    return slider_function

                end

                function Section_function.CreateDropdown(Setting,Callback)

                    local TitleText = Setting.Title; 
                    local DescText = Setting.Desc; 

                    local List = Setting.List; 
                    local Search_Setting = Setting.Search;
                    local Selected = Setting.Selected; 
                    local DefaultVal = Setting.DefaultValue or List[1];
                    local Callback = Callback or function() end

                    local DropdownFrame = Instance.new("Frame")
                    local DropdownFrame_Corner = Instance.new("UICorner")
                    local DropdownVal = Instance.new("Frame")
                    local DropdownValCorner = Instance.new("UICorner")
                    local DropdownButton = Instance.new("TextButton")
                    local ImageLabel = Instance.new("ImageLabel")
                    local DropdownContainer = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local DropdownScroll = Instance.new("ScrollingFrame")
                    local ScrollContainer = Instance.new("Frame")
                    local ScrollContainerList = Instance.new("UIListLayout")
                    local DropdownTitle = Instance.new("TextLabel")
                    local TextLabel


                    if Search_Setting then 
                        TextLabel = Instance.new("TextBox")
                    else
                        TextLabel = Instance.new("TextLabel")
                    end

                    DropdownFrame.Name = "DropdownFrame"
                    DropdownFrame.Parent = SectionName
                    DropdownFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    DropdownFrame.Position = UDim2.new(0, 0, 0.636792421, 0)
                    DropdownFrame.Size = UDim2.new(1, 0, 0.0166898686, 50)
                    DropdownFrame.ZIndex = 2

                    DropdownFrame_Corner.CornerRadius = UDim.new(0, 4)
                    DropdownFrame_Corner.Name = "DropdownFrame_Corner"
                    DropdownFrame_Corner.Parent = DropdownFrame

                    DropdownVal.Name = "DropdownVal"
                    DropdownVal.Parent = DropdownFrame
                    DropdownVal.AnchorPoint = Vector2.new(1, 0.5)
                    DropdownVal.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
                    DropdownVal.Position = UDim2.new(1, -10, 0, 35)
                    DropdownVal.Size = UDim2.new(1, -20, 0, 24)

                    DropdownValCorner.CornerRadius = UDim.new(0, 4)
                    DropdownValCorner.Name = "DropdownValCorner"
                    DropdownValCorner.Parent = DropdownVal

                    DropdownButton.Name = "DropdownButton"
                    DropdownButton.Parent = DropdownVal
                    DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownButton.BackgroundTransparency = 1.000
                    DropdownButton.Size = UDim2.new(1, 0, 1, 0)
                    DropdownButton.Font = Enum.Font.GothamBold
                    DropdownButton.Text = ""
                    DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownButton.TextSize = 14.000

                    ImageLabel.Parent = DropdownVal
                    ImageLabel.AnchorPoint = Vector2.new(1, 0.5)
                    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ImageLabel.BackgroundTransparency = 1.000
                    ImageLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    ImageLabel.Position = UDim2.new(1, -6, 0.5, 0)
                    ImageLabel.Rotation = 90.000
                    ImageLabel.Size = UDim2.new(0, 12, 0, 12)
                    ImageLabel.Image = "rbxassetid://6954383209"

                    DropdownContainer.Name = "DropdownContainer"
                    DropdownContainer.Parent = DropdownVal
                    DropdownContainer.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
                    DropdownContainer.BorderSizePixel = 0
                    DropdownContainer.Position = UDim2.new(0, 0, 1, 5)
                    DropdownContainer.Size = UDim2.new(1, 0, 0, 0)
                    DropdownContainer.ClipsDescendants = true

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = DropdownContainer

                    DropdownScroll.Name = "DropdownScroll"
                    DropdownScroll.Parent = DropdownContainer
                    DropdownScroll.Active = true
                    DropdownScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownScroll.BackgroundTransparency = 1.000
                    DropdownScroll.BorderSizePixel = 0
                    DropdownScroll.Size = UDim2.new(1, 0, 1, 0)
                    DropdownScroll.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                    DropdownScroll.ScrollBarThickness = 5
                    DropdownScroll.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

                    ScrollContainer.Name = "ScrollContainer"
                    ScrollContainer.Parent = DropdownScroll
                    ScrollContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ScrollContainer.BackgroundTransparency = 1.000
                    ScrollContainer.Position = UDim2.new(0, 5, 0, 5)
                    ScrollContainer.Size = UDim2.new(1, -15, 1, -5)

                    ScrollContainerList.Name = "ScrollContainerList"
                    ScrollContainerList.Parent = ScrollContainer
                    ScrollContainerList.SortOrder = Enum.SortOrder.LayoutOrder
                    ScrollContainerList.Padding = UDim.new(0, 5)

                    TextLabel.Parent = DropdownVal
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.ClipsDescendants = true
                    TextLabel.Position = UDim2.new(0, 5, 0, 0)
                    TextLabel.Size = UDim2.new(1, -30, 1, 0)
                    TextLabel.Font = Enum.Font.GothamBold
                    TextLabel.Text = DescText
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 14.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    pcall(function()
                        TextLabel.PlaceholderText = DescText
                    end)
                    if not Selected then
                        if Search_Setting then
                            TextLabel.PlaceholderText = DefaultVal; 
                        else
                            TextLabel.Text = DefaultVal; 
                        end
                    end
                    DropdownTitle.Name = "DropdownTitle"
                    DropdownTitle.Parent = DropdownFrame
                    DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownTitle.BackgroundTransparency = 1.000
                    DropdownTitle.Position = UDim2.new(0, 10, 0, 0)
                    DropdownTitle.Size = UDim2.new(1, -10, 0, 25)
                    DropdownTitle.Font = Enum.Font.GothamBlack
                    DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownTitle.TextSize = 14.000
                    DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
                    DropdownTitle.Text = TitleText


                    ScrollContainerList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                        DropdownScroll.CanvasSize = UDim2.new(0, 0, 0, 10 + ScrollContainerList.AbsoluteContentSize.Y + 5)
                    end)

                    local isbusy = false

                    local found = {}

                    local searchtable = {}

                    local function edit()
                        for i in pairs(found) do
                            found[i] = nil
                        end
                        for h, l in pairs(ScrollContainer:GetChildren()) do
                            if not l:IsA("UIListLayout") and not l:IsA("UIPadding") and not l:IsA('UIGridLayout') then
                                l.Visible = false
                            end
                        end
                        TextLabel.Text = string.lower(TextLabel.Text)
                    end

                    local ListNew = List

                    local function Search()
                        local Results = {}
                        for i, v in pairs(searchtable) do
                            if string.find(v, TextLabel.Text) then
                                table.insert(found, v)
                            end
                        end
                        for a, b in pairs(ScrollContainer:GetChildren()) do
                            for c, d in pairs(found) do
                                if d == b.Name then
                                    b.Visible = true
                                end
                            end
                        end
                    end

                    local function clear_object_in_list()
                        for i,v in next, ScrollContainer:GetChildren() do 
                            if v:IsA('Frame') then 
                                v:Destroy()
                            end
                        end
                    end

                    local function refreshlist()
                        clear_object_in_list()

                        searchtable = {}

                        for i, v in pairs(ListNew) do
                            if not Selected then 
                                table.insert(searchtable, string.lower(v))
                            else 
                                table.insert(searchtable, string.lower(i))
                            end 
                        end

                        if not Selected then 
                            for i,v in pairs (ListNew) do

                                local Dropval = Instance.new("Frame")
                                local DropvalCorner = Instance.new("UICorner")
                                local Line = Instance.new("Frame")
                                local InLine = Instance.new("Frame")
                                local LineCorner = Instance.new("UICorner")
                                local Dropvalcontainer = Instance.new("Frame")
                                local Dropvalbutton = Instance.new("TextButton")

                                Dropval.Name = string.lower(v)
                                Dropval.Parent = ScrollContainer
                                Dropval.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Dropval.BackgroundTransparency = 1.000
                                Dropval.Size = UDim2.new(1, 0, 0, 20)

                                DropvalCorner.CornerRadius = UDim.new(0, 4)
                                DropvalCorner.Name = "DropvalCorner"
                                DropvalCorner.Parent = Dropval

                                Line.Name = "Line"
                                Line.Parent = Dropval
                                Line.AnchorPoint = Vector2.new(0, 0.5)
                                Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Line.BackgroundTransparency = 1.000
                                Line.Position = UDim2.new(0, 0, 0.5, 0)
                                Line.Size = UDim2.new(0, 14, 1, 0)

                                InLine.Name = "InLine"
                                InLine.Parent = Line
                                InLine.AnchorPoint = Vector2.new(0.5, 0.5)
                                InLine.BackgroundColor3 = UI_Theme['Main Color']
                                InLine.BackgroundTransparency = 1.000
                                InLine.BorderSizePixel = 0
                                InLine.Position = UDim2.new(0.5, 0, 0.5, 0)
                                InLine.Size = UDim2.new(1, -10, 1, -10)

                                LineCorner.Name = "LineCorner"
                                LineCorner.Parent = InLine

                                Dropvalcontainer.Name = "Dropvalcontainer"
                                Dropvalcontainer.Parent = Dropval
                                Dropvalcontainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Dropvalcontainer.BackgroundTransparency = 1.000
                                Dropvalcontainer.Position = UDim2.new(0, 15, 0, 0)
                                Dropvalcontainer.Size = UDim2.new(1, -15, 1, 0)

                                Dropvalbutton.Name = "Dropvalbutton"
                                Dropvalbutton.Parent = Dropvalcontainer
                                Dropvalbutton.Active = false
                                Dropvalbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Dropvalbutton.BackgroundTransparency = 1.000
                                Dropvalbutton.Selectable = false
                                Dropvalbutton.Size = UDim2.new(1, 0, 1, 0)
                                Dropvalbutton.Font = Enum.Font.GothamBold
                                Dropvalbutton.Text = v
                                Dropvalbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
                                Dropvalbutton.TextSize = 13.000
                                Dropvalbutton.TextWrapped = true
                                Dropvalbutton.TextXAlignment = Enum.TextXAlignment.Left

                                if Search_Setting then
                                    if v == TextLabel.PlaceholderText then
                                        InLine.BackgroundTransparency = 0;
                                        Dropval.BackgroundTransparency = .7
                                    end
                                else
                                    if v == TextLabel.Text then 
                                        InLine.BackgroundTransparency = 0;
                                        Dropval.BackgroundTransparency = .7
                                    end
                                end

                                Dropvalbutton.MouseButton1Click:Connect(function()

                                    if Search_Setting then
                                        TextLabel.PlaceholderText = v
                                    else
                                        TextLabel.Text = v
                                    end

                                    refreshlist()
                                    if Callback then 
                                        Callback(v)
                                    end

                                end)

                                Dropvalbutton.MouseButton1Click:Connect(function()
                                    Library.addbuttoneffect()
                                end)

                            end
                        else 	

                            for i,v in pairs (ListNew) do

                                local linetran = v and 0 or 1
                                local objtran = v and .7 or 1

                                local Dropval = Instance.new("Frame")
                                local DropvalCorner = Instance.new("UICorner")
                                local Line = Instance.new("Frame")
                                local InLine = Instance.new("Frame")
                                local LineCorner = Instance.new("UICorner")
                                local Dropvalcontainer = Instance.new("Frame")
                                local Dropvalbutton = Instance.new("TextButton")

                                Dropval.Name = string.lower(i)
                                Dropval.Parent = ScrollContainer
                                Dropval.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Dropval.BackgroundTransparency = objtran
                                Dropval.Size = UDim2.new(1, 0, 0, 20)

                                DropvalCorner.CornerRadius = UDim.new(0, 4)
                                DropvalCorner.Name = "DropvalCorner"
                                DropvalCorner.Parent = Dropval

                                Line.Name = "Line"
                                Line.Parent = Dropval
                                Line.AnchorPoint = Vector2.new(0, 0.5)
                                Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Line.BackgroundTransparency = 1.000
                                Line.Position = UDim2.new(0, 0, 0.5, 0)
                                Line.Size = UDim2.new(0, 14, 1, 0)

                                InLine.Name = "InLine"
                                InLine.Parent = Line
                                InLine.AnchorPoint = Vector2.new(0.5, 0.5)
                                InLine.BackgroundColor3 = UI_Theme['Main Color']
                                InLine.BackgroundTransparency = linetran
                                InLine.BorderSizePixel = 0
                                InLine.Position = UDim2.new(0.5, 0, 0.5, 0)
                                InLine.Size = UDim2.new(1, -10, 1, -10)

                                LineCorner.Name = "LineCorner"
                                LineCorner.Parent = InLine

                                Dropvalcontainer.Name = "Dropvalcontainer"
                                Dropvalcontainer.Parent = Dropval
                                Dropvalcontainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Dropvalcontainer.BackgroundTransparency = 1.000
                                Dropvalcontainer.Position = UDim2.new(0, 15, 0, 0)
                                Dropvalcontainer.Size = UDim2.new(1, -15, 1, 0)

                                Dropvalbutton.Name = "Dropvalbutton"
                                Dropvalbutton.Parent = Dropvalcontainer
                                Dropvalbutton.Active = false
                                Dropvalbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Dropvalbutton.BackgroundTransparency = 1.000
                                Dropvalbutton.Selectable = false
                                Dropvalbutton.Size = UDim2.new(1, 0, 1, 0)
                                Dropvalbutton.Font = Enum.Font.GothamBold
                                Dropvalbutton.Text = i
                                Dropvalbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
                                Dropvalbutton.TextSize = 13.000
                                Dropvalbutton.TextWrapped = true
                                Dropvalbutton.TextXAlignment = Enum.TextXAlignment.Left

                                Dropvalbutton.MouseButton1Click:Connect(function()
                                    Library.addbuttoneffect()
                                end)

                                Dropvalbutton.MouseButton1Click:Connect(function()
                                    v = not v 

                                    local linetran = v and 0 or 1
                                    local objtran = v and .7 or 1

                                    TweenService:Create(Dropval,TweenInfo.new(.5),{BackgroundTransparency = objtran}):Play()
                                    TweenService:Create(InLine,TweenInfo.new(.5),{BackgroundTransparency = linetran}):Play()

                                    if Callback then
                                        Callback(i,v)
                                        List[i] = v
                                    end
                                end)
                            end

                        end 

                    end
                    


                    if Search_Setting then
                        TextLabel.Changed:Connect(function()
                            edit()
                            Search()
                        end)
                    end

                    if typeof(DefaultVal) ~= 'table' then
                        Callback(DefaultVal)
                        if Search_Setting then
                            TextLabel.PlaceholderText = tostring(DefaultVal)
                        else
                            TextLabel.Text = tostring(DefaultVal)
                        end
                    elseif Selected then
                        for i,v in next, DefaultVal do
                            ListNew[i] = v
                            Callback(i,v)
                        end
                    end

                    if Search_Setting then 
                        TextLabel.Focused:Connect(function()
                            Library.addbuttoneffect()
                        end)

                        TextLabel.Focused:Connect(function()
                            refreshlist()
                            isbusy = not isbusy 
                            local listsize = isbusy and UDim2.new(1, 0,0, 175) or UDim2.new(1, 0,0, 0)
                            local dropsize = isbusy and UDim2.new(1, 0,0, 235) or UDim2.new(1, 0,0, 55)

                            TweenService:Create(DropdownContainer,TweenInfo.new(.5),{Size = listsize}):Play()
                            TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropsize}):Play()

                        end)


                    end


                    DropdownButton.MouseButton1Click:Connect(function()
                        Library.addbuttoneffect()
                    end)

                    DropdownButton.MouseButton1Click:Connect(function()
                        refreshlist()
                        isbusy = not isbusy 
                        local listsize = isbusy and UDim2.new(1, 0,0, 175) or UDim2.new(1, 0,0, 0)
                        local dropsize = isbusy and UDim2.new(1, 0,0, 235) or UDim2.new(1, 0,0, 55)

                        TweenService:Create(DropdownContainer,TweenInfo.new(.5),{Size = listsize}):Play()
                        TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropsize}):Play()

                    end)

                    local dropdown_function = {}
                        function dropdown_function:GetNewList(List)

                            ListNew = List

                            refreshlist()
                            isbusy = true
                            local listsize = isbusy and UDim2.new(1, 0,0, 175) or UDim2.new(1, 0,0, 0)
                            local dropsize = isbusy and UDim2.new(1, 0,0, 235) or UDim2.new(1, 0,0, 55)

                            TweenService:Create(DropdownContainer,TweenInfo.new(.5),{Size = listsize}):Play()
                            TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropsize}):Play()

                        end

                        return dropdown_function

                    end


                    function Section_function.CreateTextBox(Setting,Callback)
                        

                        local TitleText = Setting.Title;
                        local DescText = Setting.Desc; 

                        local Number_Only = Setting.Number or false 

                        local DefaultVal = Setting.DefaultValue or '' 

                        local Placeholder = Setting.Placeholder or Setting.Title

                        local Callback = Callback or function() end

                        local TextBoxFrame = Instance.new("Frame")
                        local BoxVal = Instance.new("Frame")
                        local DropdownValCorner = Instance.new("UICorner")
                        local Box = Instance.new("TextBox")
                        local Lineeeee = Instance.new("Frame")
                        local UICorner = Instance.new("UICorner")
                        local TextboxDesc = Instance.new("TextLabel")
                        local TextboxTitle = Instance.new("TextLabel")
                        local UICorner_2 = Instance.new("UICorner")

                        TextBoxFrame.Name = TitleText.."Ngu"
                        TextBoxFrame.Parent = SectionName
                        TextBoxFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        TextBoxFrame.Position = UDim2.new(0, 0, 0.725806475, 0)
                        TextBoxFrame.Size = UDim2.new(1, 0, 0, 50)
                        TextBoxFrame.LayoutOrder = OderSec

                        BoxVal.Name = "BoxVal"
                        BoxVal.Parent = TextBoxFrame
                        BoxVal.AnchorPoint = Vector2.new(1, 0.5)
                        BoxVal.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
                        BoxVal.ClipsDescendants = true
                        BoxVal.Position = UDim2.new(1, -10, 0.5, 0)
                        BoxVal.Size = UDim2.new(0, 200, 0, 24)

                        DropdownValCorner.CornerRadius = UDim.new(0, 4)
                        DropdownValCorner.Name = "DropdownValCorner"
                        DropdownValCorner.Parent = BoxVal

                        Box.Name = "Box"
                        Box.Parent = BoxVal
                        Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Box.BackgroundTransparency = 1.000
                        Box.ClipsDescendants = true
                        Box.Position = UDim2.new(0, 5, 0, 0)
                        Box.Size = UDim2.new(1, -5, 1, 0)
                        Box.Font = Enum.Font.GothamBold
                        Box.PlaceholderColor3 = Color3.fromRGB(185, 185, 185)
                        Box.Text = ""
                        Box.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Box.TextSize = 14.000
                        Box.TextXAlignment = Enum.TextXAlignment.Left
                        Box.PlaceholderText = Placeholder

                        Lineeeee.Name = "Lineeeee"
                        Lineeeee.Parent = BoxVal
                        Lineeeee.BackgroundColor3 = UI_Theme['Main Color']
                        Lineeeee.BackgroundTransparency = 1.000
                        Lineeeee.Position = UDim2.new(0, 0, 1, -2)
                        Lineeeee.Size = UDim2.new(1, 0, 0, 6)

                        UICorner.CornerRadius = UDim.new(1, 0)
                        UICorner.Parent = Lineeeee

                        TextboxDesc.Name = "TextboxDesc"
                        TextboxDesc.Parent = TextBoxFrame
                        TextboxDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextboxDesc.BackgroundTransparency = 1.000
                        TextboxDesc.Position = UDim2.new(0, 10, 0.600000024, -5)
                        TextboxDesc.Size = UDim2.new(1, -10, 0.5, 0)
                        TextboxDesc.Font = Enum.Font.GothamBold
                        TextboxDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextboxDesc.TextSize = 12.000
                        TextboxDesc.TextXAlignment = Enum.TextXAlignment.Left
                        TextboxDesc.Text = DescText

                        TextboxTitle.Name = "TextboxTitle"
                        TextboxTitle.Parent = TextBoxFrame
                        TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextboxTitle.BackgroundTransparency = 1.000
                        TextboxTitle.Position = UDim2.new(0, 10, 0, 0)
                        TextboxTitle.Size = UDim2.new(1, -10, 0.5, 10)
                        TextboxTitle.Font = Enum.Font.GothamBlack
                        TextboxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextboxTitle.TextSize = 14.000
                        TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left
                        TextboxTitle.Text = TitleText

                        UICorner_2.CornerRadius = UDim.new(0, 4)
                        UICorner_2.Parent = TextBoxFrame

                        Box.Focused:Connect(function() 
                            TweenService:Create(Lineeeee,TweenInfo.new(.5),{BackgroundTransparency = 0}):Play()
                        end)

                        Box.Focused:Connect(function() 

                            Library.addbuttoneffect()

                        end)



                        if Number_Only then 
                            Box:GetPropertyChangedSignal("Text"):Connect(function()
                                if tonumber(Box.Text) then 
                                else 
                                    Box.PlaceholderText = Placeholder
                                    Box.Text = ''
                                end
                            end)
                        end

                        Box.FocusLost:Connect(function()
                            TweenService:Create(Lineeeee,TweenInfo.new(.5),{BackgroundTransparency = 1}):Play()
                            if Box.Text ~= '' then
                                Callback(Box.Text)
                            end
                        end)

                        local textbox_function = {}

                        if DefaultVal then
                            Box.Text = DefaultVal
                            Callback(DefaultVal)
                        end

                        function textbox_function.SetValue(Value)
                            Box.Text = Value
                            Callback(Value)
                        end 

                        return textbox_function;

                    end

                    function Section_function.CreateKeybind(Setting,Callback)	

                        local TitleText = Setting.Title; 
                        local DescText = Setting.Desc; 

                        local Callback = Callback or function() end
                        local keycodename = Setting.KeyDefault or Setting.Key or Setting.Default
                        local Default = Setting.KeyDefault or Setting.Key or Setting.Default
                        local Type = tostring(Default):match("UserInputType") and "UserInputType" or "KeyCode"
                        keycodename = tostring(keycodename):gsub("Enum.UserInputType.", "")
                        keycodename = tostring(keycodename):gsub("Enum.KeyCode.", "")

                        local BindFrame = Instance.new("Frame")
                        local BindTitle = Instance.new("TextLabel")
                        local BindDesc = Instance.new("TextLabel")
                        local BindCor = Instance.new("Frame")
                        local ButtonCorner = Instance.new("UICorner")
                        local Bindkey = Instance.new("TextButton")
                        local BindCorner = Instance.new("UICorner")

                        BindFrame.Name = TitleText.."Ngu"
                        BindFrame.Parent = SectionName
                        BindFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        BindFrame.Position = UDim2.new(0, 0, 0.208333328, 0)
                        BindFrame.Size = UDim2.new(1, 0, 0, 50)
                        BindFrame.LayoutOrder = OderSec

                        BindTitle.Name = "BindTitle"
                        BindTitle.Parent = BindFrame
                        BindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        BindTitle.BackgroundTransparency = 1.000
                        BindTitle.Position = UDim2.new(0, 10, 0, 0)
                        BindTitle.Size = UDim2.new(1, -10, 0.5, 10)
                        BindTitle.Font = Enum.Font.GothamBlack
                        BindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                        BindTitle.TextSize = 14.000
                        BindTitle.TextXAlignment = Enum.TextXAlignment.Left
                        BindTitle.Text = TitleText

                        BindDesc.Name = "BindDesc"
                        BindDesc.Parent = BindFrame
                        BindDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        BindDesc.BackgroundTransparency = 1.000
                        BindDesc.Position = UDim2.new(0, 10, 0.600000024, -5)
                        BindDesc.Size = UDim2.new(1, -10, 0.5, 0)
                        BindDesc.Font = Enum.Font.GothamBold
                        BindDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
                        BindDesc.TextSize = 12.000
                        BindDesc.TextXAlignment = Enum.TextXAlignment.Left
                        BindDesc.Text = DescText

                        BindCor.Name = "BindCor"
                        BindCor.Parent = BindFrame
                        BindCor.AnchorPoint = Vector2.new(1, 0.5)
                        BindCor.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
                        BindCor.Position = UDim2.new(1, -10, 0.5, 0)
                        BindCor.Size = UDim2.new(0, 150, 1, -26)

                        ButtonCorner.CornerRadius = UDim.new(0, 4)
                        ButtonCorner.Name = "ButtonCorner"
                        ButtonCorner.Parent = BindCor

                        Bindkey.Name = "Bindkey"
                        Bindkey.Parent = BindCor
                        Bindkey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Bindkey.BackgroundTransparency = 1.000
                        Bindkey.Size = UDim2.new(1, 0, 1, 0)
                        Bindkey.Font = Enum.Font.GothamBold
                        Bindkey.Text = tostring(Default):gsub("Enum.KeyCode.", "");
                        Bindkey.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Bindkey.TextSize = 14.000

                        BindCorner.CornerRadius = UDim.new(0, 4)
                        BindCorner.Name = "BindCorner"
                        BindCorner.Parent = BindFrame

                        local WhitelistedType = {
                            [Enum.UserInputType.MouseButton1] = "Mouse1";
                            [Enum.UserInputType.MouseButton2] = "Mouse2";
                            [Enum.UserInputType.MouseButton3] = "Mouse3";
                        };

                        Bindkey.MouseButton1Click:Connect(function()
                            Library.addbuttoneffect()
                        end)

                        Bindkey.MouseButton1Click:Connect(function()
                            local Connection;

                            Bindkey.Text = "...";

                            Connection = uis.InputBegan:Connect(function(i)
                                if WhitelistedType[i.UserInputType] then
                                    Bindkey.Text = WhitelistedType[i.UserInputType];
                                    spawn(function()
                                        wait(0.1)
                                        Default = i.UserInputType;
                                        Type = "UserInputType";
                                    end);
                                elseif i.KeyCode ~= Enum.KeyCode.Unknown then
                                    Bindkey.Text = tostring(i.KeyCode):gsub("Enum.KeyCode.", "");
                                    spawn(function()
                                        wait(0.1)
                                        Default = i.KeyCode;
                                        Type = "KeyCode";
                                    end);
                                else
                                    warn("Exception: " .. i.UserInputType .. " " .. i.KeyCode);
                                end;


                                Connection:Disconnect();
                            end);
                        end);

                        uis.InputBegan:Connect(function(i)
                            if (Default == i.UserInputType or Default == i.KeyCode) then
                                Callback(Default);
                            end;
                        end);

                    end
                    return Section_function
                end
                return Folder_function
            end
            return Page_function
        end
    return Main_function
end

repeat wait()
    pcall(function()
        local queue = queue_on_teleport
        if syn then
        queue = syn.queue_on_teleport
        end
        game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
            if State == Enum.TeleportState.Started then
                queue(string.format([[
                        getgenv().Key = "%s"
                        getgenv().Marines = %s
                        repeat wait() until game:IsLoaded()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/AimbotAndHuntBounty.lua"))()
                        ]],getgenv().Key,tostring(getgenv().Marines)))
            end
        end)
        
        if getgenv().Marines then
            for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Activated)) do
                v.Function()
            end
        else
            for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do
                v.Function()
            end
        end
    end)
until game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") and  not game:GetService("Players").LocalPlayer.PlayerGui.Main:WaitForChild("ChooseTeam").Visible or not game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam")
repeat wait()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Beli.Text == "$ ..." then
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
        print("cool")
    end
until game:GetService("Players").LocalPlayer:FindFirstChild("WeaponAssetCache")
local queue = queue_on_teleport
if syn then
queue = syn.queue_on_teleport
end
spawn(function()
    game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
        if State == Enum.TeleportState.InProgress then
            print("auto exe")
            queue(string.format([[
                getgenv().Key = "%s"
                getgenv().Marines = %s
                repeat wait() until game:IsLoaded()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/AimbotAndHuntBounty.lua"))()
                ]],getgenv().Key,tostring(getgenv().Marines)))
        end
    end)
end)
local Setting
local DefaultSetting = {
    autofarmbounty2 = false,
    hopserverfarmbounty2 = false,
    autoenergycore2 = false,
    autosave2 = false,
    pickskillmelee1 = {
        ["Z"] = false,
        ["X"] = false,
        ["C"] = false,
        ["V"] = false,
        ["F"] = false,
    },
    pickskillDevilFruitorgun1 = {
        ["Z"] = false,
        ["X"] = false,
        ["C"] = false,
        ["V"] = false,
        ["F"] = false,
    },
    webhookhuntbounty2 = false,
    urlwebhook2 = "",
    whitescreen = false,
}
local plr = game.Players.LocalPlayer
local CommF = game.ReplicatedStorage.Remotes["CommF_"]
if not isfolder('Sitink Hub-BloxFruit-BountyFarm') then
    makefolder('Sitink Hub-BloxFruit-BountyFarm')
end
if not pcall(function() readfile("Sitink Hub-BloxFruit-BountyFarm/"..game.Players.LocalPlayer.Name..".json") end) then
    writefile("Sitink Hub-BloxFruit-BountyFarm/"..game.Players.LocalPlayer.Name..".json", game:GetService("HttpService"):JSONEncode(DefaultSetting))
end
local asd, xyz = pcall(function()
    Setting = game:GetService("HttpService"):JSONDecode(readfile("Sitink Hub-BloxFruit-BountyFarm/"..game.Players.LocalPlayer.Name..".json"))
end)

if not asd then
    Setting = DefaultSetting                                                                                                                                                                                                                                        
end
for i,v in next, DefaultSetting do
    if not Setting[i] then
        Setting[i] = DefaultSetting[i]
        wait()
        writefile("Sitink Hub-BloxFruit-BountyFarm/"..game.Players.LocalPlayer.Name..".json", game:GetService("HttpService"):JSONEncode(Setting))
    end
end
Main = Library.CreateWindow('Blox Fruit')
t1 = Main.CreatePage('Main')
loadstring([[
    local MT = getrawmetatable(game)
    local OldNameCall = MT.__namecall
    setreadonly(MT, false)
    MT.__namecall = newcclosure(function(self, ...)
        local Method = getnamecallmethod()
        local Args = {...}
        if automasterydevilfruit or aimbotskill or autofarmbounty or autoSeabeastx or autoawakenandfarmmas then
            if autofarmbounty or aimbotskill then 
                if Method == 'FireServer' and self.Name == 'RemoteEvent' then
                    if  #Args == 1 and typeof(Args[1]) == "Vector3" then
                        Args[1] = getgenv().psskill.Position
                    end
                    if #Args == 1 and typeof(Args[1]) == "CFrame" then
                        Args[1] = getgenv().psskill
                    end
                end
            else
                if Method == 'FireServer' and self.Name == 'RemoteEvent' then
                    if  #Args == 1 and typeof(Args[1]) == "Vector3" then
                        Args[1] = Vector3.new(getgenv().psskill.X,getgenv().psskill.Y,getgenv().psskill.Z)
                    end
                    if #Args == 1 and typeof(Args[1]) == "CFrame" then
                        Args[1] = CFrame.new(getgenv().psskill.X,getgenv().psskill.Y,getgenv().psskill.Z)
                    end
                end
            end
        end
        return OldNameCall(self, unpack(Args))
    end)

    setreadonly(MT, true)
]])()
if not syn then
else
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
end
function toTarget(pos, targetPos, targetCFrame)
    local aaa = Speedtween or 150
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((targetPos - pos).Magnitude/aaa, Enum.EasingStyle.Quad)
    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Sit then
        for i,v in pairs(game.workspace:GetDescendants()) do
            if v:IsA("Seat") then
                v:Destroy()
            end
        end
    end
    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
        getgenv().Tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"), info, {CFrame = targetCFrame})
        getgenv().noclip = true
        getgenv().Tween:Play()
    end
end
if syn then
    game:GetService('RunService').Stepped:connect(function()
        if autofarmbounty then
            if plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health ~= 0    then
                plr.Character.Humanoid:ChangeState(11)
            end 
        end
    end)
else
    function CreateTweenFloat()
        if not plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
            local BV = Instance.new("BodyVelocity")
            BV.Parent = plr.Character.HumanoidRootPart
            BV.Name = "EffectsSY"
            BV.MaxForce = Vector3.new(0, 100000, 0)
            BV.Velocity = Vector3.new(0, 0, 0)
        end
    end
    local LocalPlayer = game:GetService("Players").LocalPlayer   
    local function getTorso(LocalPlayer)
        if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if LocalPlayer.Character:FindFirstChild('UpperTorso') then
                return LocalPlayer.Character.UpperTorso
            else
                return LocalPlayer.Character.Torso
            end
        end
    end    
    game:GetService("RunService").Stepped:Connect(function()
        if autofarmbounty then
            if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") then
                getTorso(LocalPlayer).CanCollide = false
                LocalPlayer.Character.Head.CanCollide = false
                LocalPlayer.Character.HumanoidRootPart.CanCollide = false
                if LocalPlayer.Character.UpperTorso then
                    LocalPlayer.Character.LowerTorso.CanCollide = false
                end
            end
        end
    end)
    game:GetService('RunService').Stepped:connect(function()
        if autofarmbounty then
            if plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health ~= 0 then
                spawn(function()
                    CreateTweenFloat()
                end)
            end
        end
        spawn(function()
            if not autofarmbounty then
                if plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
                    plr.Character.HumanoidRootPart.EffectsSY:Destroy()
                end
            end
        end)
    end)
end
e10 = t1.AddFolder({Folder_Name = 'Aimbot Skill + Farm Bounty',Folder_Desc = 'Function Aimbot + Bounty'})
bucu10 = e10.AddSection('Main Aimbot Skill')
function tableplayeraimbot()
    local tableselectplayer = {"deo co thang nao trong sv"}
    for i,v in next,game:GetService("Workspace").Characters:GetChildren() do
        if v:IsA("Model") and not string.find(v.Name, tostring(game.Players.LocalPlayer.Name)) then
            if table.find(tableselectplayer,"deo co thang nao trong sv") then
                table.remove(tableselectplayer,1)
            end
            table.insert(tableselectplayer,v.Name)
        end
    end
    return tableselectplayer
end
dropdownplayer = bucu10.CreateDropdown({Title = 'Select Player',Desc='Select Player',List = tableplayeraimbot(),Search = true, Selected = false},function(v)
    selectplayerr = v
end)
refplayeraimbot = bucu10.CreateButton({ButtonName = 'Refresh Weapons', ButtonDesc = 'Refresh Weapons' , ButtonValue = 'Click '},function()
    dropdownplayer:GetNewList(tableplayeraimbot())
end)
local tableselectmethodaimbot = {"Select Player","Target nearest Player"}
bucu10.CreateDropdown({Title = 'Select Method',Desc='Select Method',List = tableselectmethodaimbot,Search = true, Selected = false},function(v)
selectmethod  = v
end)
local labeltargetplayer = bucu10.CreateLabel({Title = 'Player Target :'},function(v)
end)

bucu10.CreateToggle({ToggleName = 'Aimbot Skill', ToggleDesc = '', DefaultValue = false},function(v)
aimbotskill = v
end)
bucu10.CreateToggle({ToggleName = 'Attack No CD Aura', ToggleDesc = '', DefaultValue = false},function(v)
attacknocd = v
end)
tickdetectattackmmb = tick()
spawn(function()
while wait() do
    if attacknocd then
        pcall(function()
            attackfarmounbty()
        end)
    end
end
end)
function ClosestPartaimbot()
local dist = math.huge
getgenv().targetaimbot = nil
for i,v in pairs(game.Workspace.Characters:GetChildren()) do
    if v:IsA("Model")  then
        if v.Name ~= plr.Name and (game.Players.LocalPlayer.Team == game.Teams.Marines and game.Players[v.Name].Team ~= game.Teams.Marines or game.Players.LocalPlayer.Team ~= game.Teams.Marines)  then
            local conconcac = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude
            if conconcac < dist then
                dist = conconcac
                getgenv().targetaimbot = v.Name
            end
        end
    end
end
return getgenv().targetaimbot
end
spawn(function()
while wait() do
    if (aimbotskill or aimbotgun) and selectmethod == "Select Player" then
        labeltargetplayer:SetText("Player Target: "..selectplayerr)
    elseif (aimbotskill or aimbotgun) and  selectmethod == "Target nearest Player" then
        labeltargetplayer:SetText("Player Target: "..ClosestPartaimbot())
    end
end
end)
spawn(function()
game.RunService.RenderStepped:connect(function()
    if (aimbotskill or aimbotgun) and selectmethod == "Select Player" then
        for i,v in next,game.Workspace.Characters:GetChildren() do
            if v:IsA("Model") and v.Name == selectplayerr then
                getgenv().psskill = CFrame.new(v.HumanoidRootPart.CFrame.p, v.HumanoidRootPart.Position + v.HumanoidRootPart.Velocity/1.5)
                getgenv().CframeAimbotgun = CFrame.new(v.HumanoidRootPart.Position)
            end
        end
    elseif (aimbotskill or aimbotgun) and  selectmethod == "Target nearest Player" then
        for i,v in next,game.Workspace.Characters:GetChildren() do
            if v:IsA("Model") and v.Name == ClosestPartaimbot() then
                getgenv().psskill = CFrame.new(v.HumanoidRootPart.CFrame.p, v.HumanoidRootPart.Position + v.HumanoidRootPart.Velocity/1.5)
                getgenv().CframeAimbotgun = CFrame.new(v.HumanoidRootPart.Position)
            end
        end
    end
end)
end)
bucu10.CreateToggle({ToggleName = 'Slient Aimbot Gun', ToggleDesc = '', DefaultValue = false},function(v)
aimbotgun = v
end)

local tableDFBL = {
"Door-Door",
}
bucu10cham5 = e10.AddSection('Main Farm Bounty')
getgenv().tableblacklistplayer = {}
function ClosestPlayerFarmBounty()
    local dist = math.huge
    local a 
    for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
        if v:IsA("Model") and v.Name ~= game.Players.LocalPlayer.Name and not table.find(getgenv().tableblacklistplayer,v.Name) and not table.find(tableDFBL,game:GetService("Players")[v.Name].Data.DevilFruit.Value) and (game.Players.LocalPlayer.Team == game.Teams.Marines and game.Players[v.Name].Team ~= game.Teams.Marines or game.Players.LocalPlayer.Team ~= game.Teams.Marines) and plr.Data.Level.Value-game:GetService("Players")[v.Name].Data.Level.Value < 500  then
            local magnitude = (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if magnitude < dist then
                dist = magnitude
                a = v.Name
            end
        end
    end
    return a
end
function checkraidbounty(p)
    for i,v in pairs(game.Workspace["_WorldOrigin"].Locations:GetChildren()) do
        if string.find(v.Name, "Island") then
            if game.Workspace["_WorldOrigin"].Locations:FindFirstChild(v.Name) then
                if (v.Position-p.HumanoidRootPart.Position).Magnitude <= 1000 then
                    Library.CreateNoti({Title = 'Sitink Noti',Desc = p.Name..": Raid", ShowTime = 5})
                    return true
                end
            end
        end
    end
    return false
end
function checksafezone(p)
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].SafeZones:GetChildren()) do
        if v:IsA("Part") then
            if (v.Position-p.HumanoidRootPart.Position).magnitude <= 400 and p.Humanoid.Health / p.Humanoid.MaxHealth >= 90/100 then
                Library.CreateNoti({Title = 'Sitink Noti',Desc = p.Name..": SafeZone", ShowTime = 5})
                return true
            end
        end
    end
    return false
end
function checkattackplayuer(v)
    for i,k in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetDescendants()) do
        if k:IsA("TextLabel") then
            if string.find(k.Text,"attack") and not k:FindFirstChild(v.Name) then
                local BV = Instance.new("TextBox")
                BV.Parent = k.Parent
                BV.Name = v.Name
                k:Destroy()
                return true
            end
        end
    end
end
local pickskillmelee = {
["Z"] = false,
["X"] = false,
["C"] = false,
["V"] = false,
["F"] = false,
}
local pickskillDevilFruitorgun = {
["Z"] = false,
["X"] = false,
["C"] = false,
["V"] = false,
["F"] = false,
}
local pickskillGun = {
    ["Z"] = false,
    ["X"] = false,
    ["C"] = false,
    ["V"] = false,
    ["F"] = false,
}
bucu10cham5.CreateDropdown({Title = 'Pick Skill Melee',Desc='Pick Skill Melee',List = pickskillmelee,Search = true, Selected = true,DefaultValue = Setting.pickskillmelee1 },function(i,v)
    pickskillmelee[i] = v
    Setting.pickskillmelee1[i] = v
end)
bucu10cham5.CreateDropdown({Title = 'Pick Skill DF Or Gun',Desc='Pick Skill DF Or gun',List = pickskillDevilFruitorgun,Search = true, Selected = true,DefaultValue = Setting.pickskillDevilFruitorgun1 },function(i,v)
    pickskillDevilFruitorgun[i] = v
    Setting.pickskillDevilFruitorgun1[i] = v
end)
function checkcdskillbloxfruit()
    local a = {}
    local b = {}
    local z
    if SelectmethodFarmbounty == "Devil Fruit" then 
        z = "Blox Fruit"
    end
    for i,v in next,game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameWeapon(z)]:GetChildren() do 
        if v:IsA("Frame") and pickskillDevilFruitorgun[v.Name] then
            if v.Name ~= "Template" and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                table.insert(a,v)
            end
        end
    end
    return a 
end
function checkcdskillmelee()
    local a = {}
    local b = {}
    for i,v in next,game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameWeapon("Melee")]:GetChildren() do 
        if v:IsA("Frame") and pickskillmelee[v.Name] then
            if v.Name ~= "Template" and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                table.insert(a,v)
            end
        end
    end
    return a 
end
local usemelee = false 
local useDF = true 
local TeleportSafe = false
getgenv().autoattackmmb = false
local up = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
local ret = up[2]
function attackfarmounbty()               
    if game.Players.LocalPlayer.Character.Stun.Value == 0 then
        local p13 = ret.activeController
        local bladehit =
        require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
        game.Players.LocalPlayer.Character,
        {game.Players.LocalPlayer.Character.HumanoidRootPart},10)
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            local u8 = debug.getupvalue(p13.attack, 5)
            local u9 = debug.getupvalue(p13.attack, 6)
            local u7 = debug.getupvalue(p13.attack, 4)
            local u10 = debug.getupvalue(p13.attack, 7)

            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
            (function()
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            end)()
            u10 = u10 + 1
            debug.setupvalue(p13.attack, 5, u8)
            debug.setupvalue(p13.attack, 6, u9)
            debug.setupvalue(p13.attack, 4, u7)
            debug.setupvalue(p13.attack, 7, u10)
            pcall(
                function()
                    for k, v in pairs(p13.animator.anims.basic) do
                    -- print(v)
                    v:Play()
                    -- v:AdjustSpeed(0/0)
                    end	
                end
            )
            if plr.Character:FindFirstChildOfClass("Tool") and p13.blades and p13.blades[1]  then
                if not autofarmbounty then
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",p13.blades[1].Parent.Parent.Name)
                end
                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 1, "")
            end
        end
    end
end
local useskill = false
local mmba = true
TableLocations = {
    ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
    ["Hydra"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
    ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
    ["Great Tree"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656),
}
tableincombt = {
    "⚔️In Combat - Honor at risk!⚔️",
    "⚔️In Combat - Bounty at risk!⚔️"
}
function poscheckspawn(pos)
    dist = math.huge
    local name
    for i,v in next,game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns.Pirates:GetChildren() do
        if v:IsA("Model") then
            local magnitude = (v.Part.Position - pos).magnitude
            if magnitude < dist then
                dist = magnitude
                name = v
            end
        end
    end
    return name
end
function Usekillbounty(v2)
    if (v2.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 50 then
        local deomemay = tick()
        repeat wait()
        until tick()-deomemay >= 0.5
        useskill = true
    elseif (v2.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude >= 300 then
        useskill = false
    end
end
function teleportbounty(v)
    for i,v2 in pairs(TableLocations) do
        if plr.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-v2).Magnitude <= 5000 and  (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude >= 5000 then
            return 
        end
    end 
    if  (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude >= 8000 and (poscheckspawn(v.HumanoidRootPart.Position).Part.Position-v.HumanoidRootPart.Position).Magnitude < 5000  and (not game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible or game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible and not table.find(tableincombt,game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Text)) then
        return 
    end
    if plr.Character:FindFirstChild("Humanoid") and plr.character.Humanoid.Health < 4000 then
        mmba = false 
    elseif plr.Character:FindFirstChild("Humanoid") and plr.character.Humanoid.Health >= 8000 then
        mmba = true
    end
    if mmba then
        if plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("Humanoid").Health > 0 then 
            getgenv().bypass = false
            if (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 300 and not TeleportSafe then 
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,0,0))
            else
                if getgenv().Tween then
                    getgenv().Tween:Pause()
                    getgenv().Tween:Cancel()
                end
                if SelectmethodFarmbounty ~= "Gun" then
                    if TeleportSafe then
                        local magnitudetarget1 = Vector3.new(0,v.HumanoidRootPart.Position.Y,0) 
                        local magnitudetarget2 = Vector3.new(0,game:GetService("Workspace").Camera.Part.Position.Y,0)
                        if (magnitudetarget1-magnitudetarget2).Magnitude > 15 then
                            plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0,300,0)
                        else
                            plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0,20,300)
                        end
                    else
                        plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(-90))+Vector3.new(0,6.5,0) 
                    end
                else
                    if usemelee then 
                        plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(-90))+Vector3.new(0,6.5,0) 
                    else
                        local PosY = 45
						local PosZ = 0
                        local PosY2 = 20
                        if v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart:FindFirstChild("Buddha2") or v.HumanoidRootPart:FindFirstChild("Buddha")) then
                            PosY = 80
							PosZ = 20
                            PosY2 = 50
                        end
                        local magnitudetarget1 = Vector3.new(0,v.HumanoidRootPart.Position.Y,0) 
                        local magnitudetarget2 = Vector3.new(0,game:GetService("Workspace").Camera.Part.Position.Y,0)
                        if (magnitudetarget1-magnitudetarget2).Magnitude > 15 then
                            plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0,PosY,PosZ)
                        else
                            plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0,PosY2,-50)
                        end
                    end
                end
            end
        end
    else
        if plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("Humanoid").Health > 0 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,2500,0)) 
        end
    end
end
local hopfarmbounty = false
local mmbbounty = true
spawn(function()
    while wait() do
        pcall(function()
            if autofarmbounty then 
                if getgenv().targetbounty then
                    local v = getgenv().targetbounty
                    getgenv().psskill = CFrame.new(v.HumanoidRootPart.CFrame.p, v.HumanoidRootPart.Position + v.HumanoidRootPart.Velocity/1.5)
                end
            end
        end)
    end
end)
function NameWeapon(x)
    local a 
    for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == x  then
            a = v.Name
        end
    end
    for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == x  then
            a = v.Name
        end
    end
    return a 
end
function equiptool(toolname)
    if plr.Backpack:FindFirstChild(toolname)  then
        plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(toolname))
        return true
    end
end
loadstring([[
local ExpectedArguments = {
    FindPartOnRayWithIgnoreList = {
        ArgCountRequired = 3,
        Args = {
            "Instance", "Ray", "table", "boolean", "boolean"
        }
    },
}
function CalculateChance(Percentage)
    Percentage = math.floor(Percentage)
    local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100
    return chance <= Percentage / 100
end
local function ValidateArguments(Args, RayMethod)
    local Matches = 0
    if #Args < RayMethod.ArgCountRequired then
        return false
    end
    for Pos, Argument in next, Args do
        if typeof(Argument) == RayMethod.Args[Pos] then
            Matches = Matches + 1
        end
    end
    return Matches >= RayMethod.ArgCountRequired
end
local function getDirection(Origin, Position)
    return (Position - Origin).Unit * 1000
end
local oldNamecall2
oldNamecall2 = hookmetamethod(game, "__namecall", newcclosure(function(...)
    if  autofarmbounty and getgenv().targetbounty then
        local Method = getnamecallmethod()
        local Arguments = {...}
        local self = Arguments[1]
        local chance = CalculateChance(100)
        if  self == workspace and not checkcaller() and chance == true  then
            if Method == "FindPartOnRayWithIgnoreList"  then
                if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithIgnoreList) then
                    local A_Ray = Arguments[2]
                    local HitPart = game.Players[getgenv().targetbounty.Name].Character.HumanoidRootPart
                    if HitPart then
                        local Origin = A_Ray.Origin
                        local Direction = getDirection(Origin, HitPart.Position)
                        Arguments[2] = Ray.new(Origin, Direction)
                        return oldNamecall2(unpack(Arguments))
                    end
                end
            end
        end
    end
    return oldNamecall2(...)
end))
]])()
loadstring([[
local olddd
olddd = hookmetamethod(game, "__index", function(self, key)
    if tostring(key):lower()== 'hit' and (automasterydevilfruit and Selectmethodmastery == "Gun" or aimbotgun)  and getgenv().CframeAimbotgun then
        return getgenv().CframeAimbotgun
    end
    return olddd(self, key)
end)
]])()
function checkcooldownskill(a,b)
    for i,v in next,game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[a]:GetChildren() do 
        if v:IsA("Frame") and v.Name == b then
            if v.Name ~= "Template" and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                return true
            end
        end
    end
    return false
end
function autoclickbounty(v2)
    if not getgenv().clickattackbounty and v2:FindFirstChild("HumanoidRootPart") and (v2.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 50   then
        local condimemeay = tick()
        repeat wait()
        until tick()-condimemeay >= 10 
        getgenv().clickattackbounty = true
    end
    if v2:FindFirstChild("HumanoidRootPart") and (v2.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 50 then
        if getgenv().clickattackbounty and plr.Character:FindFirstChild(NameWeapon("Melee")) and v2.Humanoid.Health/v2.Humanoid.MaxHealth >= 70/100 then 
            attackfarmounbty()
        end
    end 
    if v2:FindFirstChild("HumanoidRootPart") and (v2.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 500 then 
        getgenv().clickattackbounty = false
    end
end
function checkskillbounty(v2)
    if NameWeapon("Melee") and NameWeapon("Blox Fruit") then
        if  v2:FindFirstChild("HumanoidRootPart") and (v2.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 500 then 
            if not useDF and not usemelee then
                TeleportSafe = true
                local a = tick()
                repeat wait()
                    if getgenv().Tween then
                        getgenv().Tween:Pause()
                        getgenv().Tween:Cancel()
                    end
                until tick()-a >= 4 
                TeleportSafe = false
                if #checkcdskillmelee() >=2 and #checkcdskillbloxfruit() <= 2 then 
                    usemelee = true 
                else
                    useDF = true 
                end
            else
                if #checkcdskillmelee() == 0 and usemelee and not TeleportSafe then
                    local ax = tick()
                    repeat wait()
                    until tick()-ax >= 0.2
                    if #checkcdskillbloxfruit() >= 2 then
                        useDF = true 
                    end
                    usemelee = false
                elseif  #checkcdskillbloxfruit() == 0 and useDF and not TeleportSafe  then
                    useDF = false
                    if #checkcdskillmelee() >= 2 then
                        usemelee = true 
                    end
                end
            end
        end
    end
end
function autoskillbounty(v2)
    if NameWeapon("Melee") and not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameWeapon("Melee")) then
        equiptool(NameWeapon("Melee"))
        return 
    end
    local z
    if SelectmethodFarmbounty == "Devil Fruit" then 
        z = "Blox Fruit"
    end
    if NameWeapon(z) and  not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameWeapon(z)) then
        equiptool(NameWeapon(z))
        return 
    end
    if SelectmethodFarmbounty == "Gun" then 
        if  usemelee and v2:FindFirstChild("Humanoid") and v2.Humanoid.Health/v2.Humanoid.MaxHealth >= 30/100 then 
            if NameWeapon("Melee") then
                equiptool(NameWeapon("Melee"))
                if v2:FindFirstChild("HumanoidRootPart") and (v2.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 50 then
                    if useskill then
                        if pickskillmelee["Z"] and checkcooldownskill(NameWeapon("Melee"),"Z") then
                            game.VirtualInputManager:SendKeyEvent(true, "Z", false, game)
                            local Z = tick()
                            repeat wait()
                            until tick()-Z >= meleeholdskillz
                            game.VirtualInputManager:SendKeyEvent(false, "Z", false, game)
                        elseif pickskillmelee["X"] and checkcooldownskill(NameWeapon("Melee"),"X") then
                            game.VirtualInputManager:SendKeyEvent(true, "X", false, game)
                            local Z = tick()
                            repeat wait()
                            until tick()-Z >= meleeholdskillx
                            game.VirtualInputManager:SendKeyEvent(false, "X", false, game)
                        elseif pickskillmelee["C"] and checkcooldownskill(NameWeapon("Melee"),"C") then
                            game.VirtualInputManager:SendKeyEvent(true, "C", false, game)
                            local Z = tick()
                            repeat wait()
                            until tick()-Z >= meleeholdskillc
                            game.VirtualInputManager:SendKeyEvent(false, "C", false, game)
                        end
                    end
                end
                if #checkcdskillmelee() == 0 and usemelee then 
                    local deomemayx = tick()
                    repeat wait()
                    until tick()-deomemayx >= 0.5
                    usemelee = false
                end
            end
        else
            if NameWeapon("Gun") then
                if #checkcdskillmelee() >= 2 and v2.Humanoid.Health/v2.Humanoid.MaxHealth >= 30/100 then  
                    usemelee = true 
                else
                    usemelee = false
                end
                equiptool(NameWeapon("Gun"))
                if v2:FindFirstChild("HumanoidRootPart") and  (v2.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 150 then 
                    game:GetService "VirtualUser":CaptureController()
                    game:GetService "VirtualUser":Button1Down(Vector2.new(50, 50))
                end
                if pickskillDevilFruitorgun["Z"] and checkcooldownskill(NameWeapon("Gun"),"Z") then
                    game.VirtualInputManager:SendKeyEvent(true, "Z", false, game)
                    local Z = tick()
                    repeat wait()
                    until tick()-Z >= holdskillz
                    game.VirtualInputManager:SendKeyEvent(false, "Z", false, game)
                elseif pickskillDevilFruitorgun["X"] and checkcooldownskill(NameWeapon("Gun"),"X") then
                    game.VirtualInputManager:SendKeyEvent(true, "X", false, game)
                    local Z = tick()
                    repeat wait()
                    until tick()-Z >= holdskillx
                    game.VirtualInputManager:SendKeyEvent(false, "X", false, game)
                end
            end
        end
    else
        if usemelee then
            if NameWeapon("Melee") then
                equiptool(NameWeapon("Melee"))
                if v2:FindFirstChild("HumanoidRootPart") and (v2.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 50 then
                   if useskill then
                        if pickskillmelee["Z"] and checkcooldownskill(NameWeapon("Melee"),"Z") then
                            game.VirtualInputManager:SendKeyEvent(true, "Z", false, game)
                            local Z = tick()
                            repeat wait()
                            until tick()-Z >= meleeholdskillz
                            game.VirtualInputManager:SendKeyEvent(false, "Z", false, game)
                        elseif pickskillmelee["X"] and checkcooldownskill(NameWeapon("Melee"),"X") then
                            game.VirtualInputManager:SendKeyEvent(true, "X", false, game)
                            local Z = tick()
                            repeat wait()
                            until tick()-Z >= meleeholdskillx
                            game.VirtualInputManager:SendKeyEvent(false, "X", false, game)
                        elseif pickskillmelee["C"] and checkcooldownskill(NameWeapon("Melee"),"C") then
                            game.VirtualInputManager:SendKeyEvent(true, "C", false, game)
                            local Z = tick()
                            repeat wait()
                            until tick()-Z >= meleeholdskillc
                            game.VirtualInputManager:SendKeyEvent(false, "C", false, game)
                        end
                    end
                end
            end
        else
            if NameWeapon("Blox Fruit") then
                equiptool(NameWeapon("Blox Fruit"))
                if v2:FindFirstChild("HumanoidRootPart") and  (v2.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 50 then
                    if useskill then
                        if pickskillDevilFruitorgun["Z"] and checkcooldownskill(NameWeapon("Blox Fruit"),"Z") then
                            game.VirtualInputManager:SendKeyEvent(true, "Z", false, game)
                            local Z = tick()
                            repeat wait()
                            until tick()-Z >= holdskillz
                            game.VirtualInputManager:SendKeyEvent(false, "Z", false, game)
                        elseif pickskillDevilFruitorgun["X"] and checkcooldownskill(NameWeapon("Blox Fruit"),"X") then
                            game.VirtualInputManager:SendKeyEvent(true, "X", false, game)
                            local Z = tick()
                            repeat wait()
                            until tick()-Z >= holdskillx
                            game.VirtualInputManager:SendKeyEvent(false, "X", false, game)
                        elseif pickskillDevilFruitorgun["C"] and checkcooldownskill(NameWeapon("Blox Fruit"),"C") then
                            game.VirtualInputManager:SendKeyEvent(true, "C", false, game)
                            local Z = tick()
                            repeat wait()
                            until tick()-Z >= holdskillc
                            game.VirtualInputManager:SendKeyEvent(false, "C", false, game)
                        elseif pickskillDevilFruitorgun["V"] and checkcooldownskill(NameWeapon("Blox Fruit"),"V") then
                            game.VirtualInputManager:SendKeyEvent(true, "V", false, game)
                            local Z = tick()
                            repeat wait()
                            until tick()-Z >= holdskillv
                            game.VirtualInputManager:SendKeyEvent(false, "V", false, game)
                        elseif pickskillDevilFruitorgun["F"] and checkcooldownskill(NameWeapon("Blox Fruit"),"F") then
                            game.VirtualInputManager:SendKeyEvent(true, "F", false, game)
                            local Z = tick()
                            repeat wait()
                            until tick()-Z >= holdskillf
                            game.VirtualInputManager:SendKeyEvent(false, "F", false, game)
                        end
                    end
                end
            end
        end
    end
end
function AutoFarmBountyy()
    if not hopfarmbounty and not getgenv().HopBounty then
        for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
            if v.Name == ClosestPlayerFarmBounty() then
                if not table.find(getgenv().tableblacklistplayer,v.Name) then
                    table.insert(getgenv().tableblacklistplayer,v.Name)
                end
                local mmb = tick()
                getgenv().targetbounty = v
                repeat wait()
                    if plr.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                        mmb = tick()
                        getgenv().tickattack = tick()
                    end
                    spawn(function()  
                        mmbbounty = false
                        getgenv().psskill = CFrame.new(v.HumanoidRootPart.CFrame.p, v.HumanoidRootPart.Position + v.HumanoidRootPart.Velocity/1.5)
                    end)
                    spawn(function()
                        teleportbounty(v)
                    end)
                    spawn(function()
                        autoskillbounty(v)
                    end)
                    spawn(function()
                        if SelectmethodFarmbounty == "Devil Fruit" then 
                            checkskillbounty(v)
                        end
                    end)
                    spawn(function()
                        Usekillbounty(v)
                    end)
                    spawn(function()
                        autoclickbounty(v)
                    end)
                until (tick()-mmb >= 25 and v.Humanoid.Health/v.Humanoid.MaxHealth >= 90/100) or  checkraidbounty(v) or checksafezone(v) or checkattackplayuer(v) or (v:FindFirstChild("Humanoid") and v.Humanoid.Health <= 0) or not autofarmbounty or hopfarmbounty or not v or not v.Parent or getgenv().HopBounty
                getgenv().clickattackbounty = false
                getgenv().targetbounty = nil
                mmbbounty = true
                TeleportSafe = false
            end
        end
    end
end
bucu10cham5.CreateDropdown({Title = 'Select Method Farm',Desc='',List = {"Gun","Devil Fruit"},Search = true, Selected = false,DefaultValue = Setting.SelectmethodFarmbounty2},function(v)
    SelectmethodFarmbounty = v
    Setting.SelectmethodFarmbounty2 = v
end)
bucu10cham5.CreateToggle({ToggleName = 'Farm Bounty', ToggleDesc = '', DefaultValue = Setting.autofarmbounty2},function(v)
Setting.autofarmbounty2 = v
autofarmbounty = v
end)
bucu10cham5.CreateToggle({ToggleName = 'Hop Server Farm Bounty', ToggleDesc = '', DefaultValue = Setting.hopserverfarmbounty2},function(v)
Setting.hopserverfarmbounty2 = v
hopserverfarmbounty = v
end)
bucu10cham5.CreateToggle({ToggleName = 'Auto Energy Core and Race', ToggleDesc = '', DefaultValue = Setting.autoenergycore2},function(v)
Setting.autoenergycore2 = v
autoenergycore = v
end)
function checkhakikenprovip()
    if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
        return true
    else
        return false
    end
end
function FFCMatch(Ins, Name)
    for k, v in pairs(Ins:GetChildren()) do
        if string.match(v.Name, Name) then
            return v
        end
    end
    return nil
end
require(game:GetService("ReplicatedStorage").Util.CameraShaker):Stop()
local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShakerR:Stop()
spawn(function()
    while wait() do
        if autofarmbounty then
            if game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible  then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
            end
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("CharacterReady") then
                    game.Players.LocalPlayer.Character.CharacterReady:Destroy()
                end
                spawn(function()
                    if autoenergycore then
                        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                    end
                end)
                if not checkhakikenprovip()  then
                    game.Players.LocalPlayer.VisionRadius.Value = math.huge
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                    wait(2)
                end
            end)
        end
    end
end)
getgenv().bypasstp = false 
spawn(function()
    while wait() do 
        pcall(function()
            if autofarmbounty then
                    local v = getgenv().targetbounty
                    for i,v2 in pairs(TableLocations) do
                        if  (v.HumanoidRootPart.Position-v2).Magnitude <= 5000 and  (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude >= 5000 then
                            args = {
                                "requestEntrance",
                                v2,
                            }
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                            if getgenv().Tween then
                                getgenv().Tween:Pause()
                                getgenv().Tween:Cancel()
                            end
                            return 
                        end
                    end 
                    if  (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude >= 8000 and (poscheckspawn(v.HumanoidRootPart.Position).Part.Position-v.HumanoidRootPart.Position).Magnitude < 5000  and (not game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible or game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible and not table.find(tableincombt,game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Text)) then
                        if getgenv().Tween then
                            getgenv().Tween:Pause()
                            getgenv().Tween:Cancel()
                        end
                        plr.Character.Humanoid.Health = 0
                        plr.Character.HumanoidRootPart.CFrame = poscheckspawn(v.HumanoidRootPart.Position).Part.CFrame
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                        if getgenv().Tween then
                            getgenv().Tween:Pause()
                            getgenv().Tween:Cancel()
                        end
                        getgenv().bypasstp = true
                        return 
                    elseif (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 8000 and plr.Character.Humanoid.Health > 0 then 
                        getgenv().bypasstp = false
                    end
                    if getgenv().bypasstp and (not game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible or game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible and not table.find(tableincombt,game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Text)) then 
                        plr.Character.Humanoid.Health = 0
                        plr.Character.HumanoidRootPart.CFrame = poscheckspawn(v.HumanoidRootPart.Position).Part.CFrame
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                    end
                spawn(function()
                    if not FFCMatch(plr.Character, "_BusoLayer1") and not plr.Character:FindFirstChild("HasBuso") then
                        CommF:InvokeServer("Buso")
                        wait(2)
                    end
                end)
            end
        end)
    end
end)
spawn(function()
    while wait() do
        if autofarmbounty then
            pcall(function()
                AutoFarmBountyy()
            end)
        end
    end
end)

function checkPlayerFarmBountyHop()
    if not ClosestPlayerFarmBounty() and mmbbounty then
        hopfarmbounty = true 
    end
end
local demsofarmbounty = 0

local SettingHopServer
local DefaultSettingHopServer = {}
if not pcall(function() readfile("Sitink Hub-BloxFruit-BountyFarm/JobHopServers.json") end) then
    writefile("Sitink Hub-BloxFruit-BountyFarm/JobHopServers.json", game:GetService("HttpService"):JSONEncode(DefaultSettingHopServer))
end
local xxxxxxx, jkhkjkjlkjoiu = pcall(function()
    SettingHopServer = game:GetService("HttpService"):JSONDecode(readfile("Sitink Hub-BloxFruit-BountyFarm/JobHopServers.json"))
end)
if not xxxxxxx then
    SettingHopServer = DefaultSettingHopServer
end
function CheckJobIdServer()
    local mmb = {}
    for i,v in next,game:GetService("HttpService"):JSONDecode(readfile("Sitink Hub-BloxFruit-BountyFarm/JobHopServers.json")) do
        table.insert(mmb,i) 
    end
    return mmb 
end
SettingHopServer[game.JobId] = true
function HopServer()
    local function Hop()
        for i=1,100 do
            local huhu = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(i)
            for k,v in pairs(huhu) do
                if k ~= game.JobId and not table.find(CheckJobIdServer(),k) and v.Count >= 10 then
                    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",k)
                    writefile("Sitink Hub-BloxFruit-BountyFarm/JobHopServers.json", game:GetService("HttpService"):JSONEncode(SettingHopServer))
                end
            end
        end
    end
    while wait() do
        pcall(function() 
            Hop()
        end)
    end
end
spawn(function()
    while wait() do
        if hopserverfarmbounty then 
            pcall(function()
                checkPlayerFarmBountyHop()
                if game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible  then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                end
                if hopfarmbounty or getgenv().HopBounty then
                    Library.CreateNoti({Title = 'Sitink Noti',Desc = "Farm Bounty Hop Server", ShowTime = 5})
                    wait(5)
                end
                spawn(function()
                    if hopfarmbounty or getgenv().HopBounty then
                        toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-12549.1220703125, 337.2033996582031, -7486.9052734375).Position,CFrame.new(-12549.1220703125, 337.2033996582031, -7486.9052734375))
                    end
                end)
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if hopserverfarmbounty then 
            pcall(function()
                checkPlayerFarmBountyHop()
                if (getgenv().HopBounty or hopfarmbounty) and demsofarmbounty == 0 
                and (not game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible or (game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible and not table.find(tableincombt,game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Text))) then
                    demsofarmbounty = demsofarmbounty +1
                    HopServer()
                end
            end)
        end
    end
end)
getgenv().HopBounty = false
spawn(function()
    while wait() do 
        if hopserverfarmbounty then
            local mmbconmemay = tick()
            repeat wait()
            until tick()-mmbconmemay >= 10*60
            getgenv().HopBounty = true
        end
    end
end)
bucu10cham5.CreateTextBox({Title = 'Url Webhook', Desc = '' , DefaultValue = Setting.urlwebhook2},function(v)
    urlwebhook = v
    Setting.urlwebhook2 = v
end)
bucu10cham5.CreateToggle({ToggleName = 'Webhook Hunt Bounty', ToggleDesc = '', DefaultValue = Setting.webhookhuntbounty2},function(v)
    webhookhuntbounty = v
    Setting.webhookhuntbounty2 = v
end)
local suffixes = {"K", "M", "B", "T", "Q","QA"} 

local function toSuffixString(p75,p76)
	local v478 = nil;
	v478 = ("%%.%df"):format(p76 or 2);
	if not p75 then
		return 0;
	end;
	if p75 >= 1000000000000 then
		return v478:format(p75 / 1000000000000) .. "T";
	end;
	if p75 >= 1000000000 then
		return v478:format(p75 / 1000000000) .. "B";
	end;
	if p75 >= 1000000 then
		return v478:format(p75 / 1000000) .. "M";
	end;
	if not (p75 >= 1000) then
		return p75;
	end;
	return v478:format(p75-1 / 1000) .. "K";
end
function format(num, digits)
	return string.format("%0" .. digits .. "i", num)
end

function parseDateTime()
	local osDate = os.date("!*t")
	local year, mon, day = osDate["year"], osDate["month"], osDate["day"]
	local hour, min, sec = osDate["hour"], osDate["min"], osDate["sec"]
	return year .. "-" .. format(mon, 2) .. "-" .. format(day, 2) .. "T" .. format(hour, 2) .. ":" .. format(min, 2) .. ":" .. format(sec, 2) .. "Z"
end
function sendmsgbounty(url,x)
    local dt = DateTime.now()
    local timestamp = dt:FormatUniversalTime("LL", "vi-vn")
    local now = DateTime.now()
    local timestamp2 = now:FormatLocalTime("LT", "vi-vn")  
	msg = {
		["content"] = "",
		["embeds"] = {
			{
				["color"] = tonumber(0x000000),
				["title"] = "sitink Hub-Hunt Bounty",
				["fields"] = {
					{
						["name"] = "Name :".."||"..game.Players.LocalPlayer.Name.."||",
						["value"] = x.."\nBounty: "..toSuffixString(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value),
						["inline"] = false
					},
				},
                ["timestamp"] = parseDateTime(),
			}
		}
	} 
    local request = http_request
    if syn then
        request = syn.request 
    end
    local response = request(
        {
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode(msg)
        }
    )
end
spawn(function()
    while wait() do
        if webhookhuntbounty then
            pcall(function()
                for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                    if v:IsA("TextLabel") then
                        if string.find(v.Text, "killing") and not v:FindFirstChild("mmb") then
                            local a = v.Text:split("<")[2]
                            a = a:split(">")[2]
                            local b = v.Text:split(" from ")[2]
                            sendmsgbounty(urlwebhook,"**"..a.." form "..b.."**")
                            local BV = Instance.new("TextBox")
                            BV.Parent = v
                            BV.Name = "mmb"
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
        if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame")  then
            if string.find(game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text,'Teleport') then 
            else
                HopServer()
            end
        end
    end)
end)
bucu10cham5.CreateToggle({ToggleName = 'white screen', ToggleDesc = '', DefaultValue = Setting.whitescreen},function(v)
    Setting.whitescreen = v
end)
spawn(function()
    while wait() do
        pcall(function()
            if Setting.whitescreen then
                if not game.Workspace:FindFirstChild("Ignored") then
                    local Ignored = Instance.new("IntValue", game.Workspace)
                    Ignored.Name = "Ignored"
                    local RunService = game:GetService("RunService")
                    RunService:Set3dRenderingEnabled(false)
                end
            else
                if game.Workspace:FindFirstChild("Ignored") then
                    local RunService = game:GetService("RunService")
                    RunService:Set3dRenderingEnabled(true)
                    game.Workspace:FindFirstChild("Ignored"):Destroy()
                end
            end
        end)
    end
end)

e11 = t1.AddFolder({Folder_Name = 'Setting Hold Skill',Folder_Desc = 'Function Hold Skill'})
bucu11 = e11.AddSection('Hold Skill')
bucu11.CreateSlider({Title = 'Hold Skill Z [Gun Or Fruit]',Desc='',Min = 0,Max = 5,DefaultValue = Setting.holdskillz1},function(v)
    holdskillz = v
    Setting.holdskillz1 = v
end)
bucu11.CreateSlider({Title = 'Hold Skill X [Gun Or Fruit]',Desc='',Min = 0,Max = 5,DefaultValue = Setting.holdskillx1},function(v)
    holdskillx = v
    Setting.holdskillx1 = v
end)
bucu11.CreateSlider({Title = 'Hold Skill C [Gun Or Fruit]',Desc='',Min = 0,Max = 5,DefaultValue = Setting.holdskillc1},function(v)
    holdskillc = v
    Setting.holdskillc1 = v
end)
bucu11.CreateSlider({Title = 'Hold Skill V [Gun Or Fruit]',Desc='',Min = 0,Max = 5,DefaultValue = Setting.holdskillv1},function(v)
    holdskillv = v
    Setting.holdskillv1 = v
end)
bucu11.CreateSlider({Title = 'Hold Skill F [Gun Or Fruit]',Desc='',Min = 0,Max = 5,DefaultValue = Setting.holdskillf1},function(v)
    holdskillf = v
    Setting.holdskillf1 = v
end)
-----melee
bucu11.CreateSlider({Title = 'Hold Skill Z [Melee]',Desc='',Min = 0,Max = 5,DefaultValue = Setting.meleeholdskillz1},function(v)
    meleeholdskillz = v
    Setting.meleeholdskillz1 = v
end)
bucu11.CreateSlider({Title = 'Hold Skill X [Melee]',Desc='',Min = 0,Max = 5,DefaultValue = Setting.meleeholdskillx1},function(v)
    meleeholdskillx = v
    Setting.meleeholdskillx1 = v
end)
bucu11.CreateSlider({Title = 'Hold Skill C [Melee]',Desc='',Min = 0,Max = 5,DefaultValue = Setting.meleeholdskillc1},function(v)
    meleeholdskillc = v
    Setting.meleeholdskillc1 = v
end)
bucu11.CreateSlider({Title = 'Hold Skill V [Melee]',Desc='',Min = 0,Max = 5,DefaultValue = Setting.meleeholdskillv1},function(v)
    meleeholdskillv = v
    Setting.meleeholdskillv1 = v
end)
bucu11.CreateSlider({Title = 'Hold Skill F [Melee]',Desc='',Min = 0,Max = 5,DefaultValue = Setting.meleeholdskillf1},function(v)
    meleeholdskillf = v
    Setting.meleeholdskillf1 = v
end)

spawn(function()
    while wait() do
        writefile("Sitink Hub-BloxFruit-BountyFarm/"..game.Players.LocalPlayer.Name..".json", game:GetService("HttpService"):JSONEncode(Setting))
    end
end)
