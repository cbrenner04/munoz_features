# filename: ./spec/support/participants_helper.rb
=begin
require './lib/pages/participants'

def participant_generic
  @participant_113 ||= Participants.new(
    pt_id: 'gen',
  )
end

def participant_113
  @participant_113 ||= Participants.new(
    pt_id: 113,
    locale: 'english'
  )
end

def participant_132
  @participant_132 ||= Participants.new(
    pt_id: 132,
    locale: 'english'
  )
end

def participant_17
  @participant_17 ||= Participants.new(
    pt_id: 17,
    locale: 'english'
  )
end

def participant_18
  @participant_18 ||= Participants.new(
    pt_id: 18,
    locale: 'english'
  )
end

def participant_19
  @participant_19 ||= Participants.new(
    pt_id: 19,
    locale: 'english'
  )
end

def participant_114
  @participant_114 ||= Participants.new(
    pt_id: 114,
    locale: 'english'
  )
end

def participant_115
  @participant_115 ||= Participants.new(
    pt_id: 115,
    locale: 'english'
  )
end

def participant_116
  @participant_116 ||= Participants.new(
    pt_id: 116,
    locale: 'english'
  )
end

def participant_143
  @participant_143 ||= Participants.new(
    pt_id: 143,
    locale: 'english'
  )
end

def participant_144
  @participant_144 ||= Participants.new(
    pt_id: 144,
    locale: 'english'
  )
end

def participant_145
  @participant_145 ||= Participants.new(
    pt_id: 145,
    locale: 'english'
  )
end

def participant_155
  @participant_155 ||= Participants.new(
    pt_id: 155,
    locale: 'english'
  )
end

def participant_213
  @participant_213 ||= Participants.new(
    pt_id: 213,
    locale: 'español'
  )
end

def participant_20
  @participant_20 ||= Participants.new(
    pt_id: 20,
    locale: 'español'
  )
end

def participant_21
  @participant_21 ||= Participants.new(
    pt_id: 21,
    locale: 'español'
  )
end

def participant_22
  @participant_21 ||= Participants.new(
    pt_id: 21,
    locale: 'español'
  )
end

def participant_214
  @participant_214 ||= Participants.new(
    pt_id: 214,
    locale: 'español'
  )
end

def participant_215
  @participant_215 ||= Participants.new(
    pt_id: 215,
    locale: 'español'
  )
end

def participant_216
  @participant_216 ||= Participants.new(
    pt_id: 216,
    locale: 'español'
  )
end

def participant_243
  @participant_243 ||= Participants.new(
    pt_id: 243,
    locale: 'español'
  )
end

def participant_244
  @participant_244 ||= Participants.new(
    pt_id: 244,
    locale: 'español'
  )
end

def participant_245
  @participant_245 ||= Participants.new(
    pt_id: 245,
    locale: 'español'
  )
end

def participant_255
  @participant_255 ||= Participants.new(
    pt_id: 255,
    locale: 'español'
  )
end

# Below are participant case used for Consent

def participant_35
  @participant_35 ||= Participants.new(
    pt_id: 35,
    locale: 'english'
  )
end

def participant_36
  @participant_36 ||= Participants.new(
    pt_id: 36,
    locale: 'english'
  )
end

def participant_37
  @participant_37 ||= Participants.new(
    pt_id: 37,
    locale: 'english'
  )
end

def participant_106
  @participant_106 ||= Participants.new(
    pt_id: 106,
    locale: 'english'
  )
end

def participant_107
  @participant_107 ||= Participants.new(
    pt_id: 107,
    locale: 'english'
  )
end

def participant_108
  @participant_108 ||= Participants.new(
    pt_id: 108,
    locale: 'english'
  )
end

def participant_109
  @participant_109 ||= Participants.new(
    pt_id: 109,
    locale: 'english'
  )
end

def participant_131
  @participant_131 ||= Participants.new(
    pt_id: 131,
    locale: 'english'
  )
end

def participant_38
  @participant_38 ||= Participants.new(
    pt_id: 38,
    locale: 'español'
  )
end

def participant_39
  @participant_39 ||= Participants.new(
    pt_id: 39,
    locale: 'español'
  )
end

def participant_40
  @participant_40 ||= Participants.new(
    pt_id: 40,
    locale: 'español'
  )
end

def participant_206
  @participant_206 ||= Participants.new(
    pt_id: 206,
    locale: 'español'
  )
end

def participant_207
  @participant_207 ||= Participants.new(
    pt_id: 207,
    locale: 'español'
  )
end

def participant_208
  @participant_208 ||= Participants.new(
    pt_id: 208,
    locale: 'español'
  )
end

def participant_209
  @participant_209 ||= Participants.new(
    pt_id: 209,
    locale: 'español'
  )
end

def participant_231
  @participant_231 ||= Participants.new(
    pt_id: 231,
    locale: 'español'
  )
end

# Below are participants used for Eligibility

def participant_gen_eng
  @participant_gen_eng ||= Participants.new(locale: 'english')
end

def participant_gen_esp
  @participant_gen_esp ||= Participants.new(locale: 'español')
end

def participant_101
  @participant_101 ||= Participants.new(
    pt_id: 101,
    locale: 'english'
  )
end

def participant_102
  @participant_102 ||= Participants.new(
    pt_id: 102,
    locale: 'english'
  )
end

def participant_103
  @participant_103 ||= Participants.new(
    pt_id: 103,
    locale: 'english'
  )
end

def participant_104
  @participant_104 ||= Participants.new(
    pt_id: 104,
    locale: 'english'
  )
end

def participant_9
  @participant_9 ||= Participants.new(
    pt_id: 9,
    locale: 'english'
  )
end

def participant_31
  @participant_31 ||= Participants.new(
    pt_id: 31,
    locale: 'english'
  )
end

def participant_25
  @participant_25 ||= Participants.new(
    pt_id: 25,
    locale: 'english'
  )
end

def participant_151
  @participant_151 ||= Participants.new(
    pt_id: 151,
    locale: 'english'
  )
end

def participant_152
  @participant_152 ||= Participants.new(
    pt_id: 152,
    locale: 'english'
  )
end

def participant_32
  @participant_32 ||= Participants.new(
    pt_id: 32,
    locale: 'english'
  )
end

def participant_201
  @participant_201 ||= Participants.new(
    pt_id: 201,
    locale: 'español'
  )
end

def participant_202
  @participant_202 ||= Participants.new(
    pt_id: 202,
    locale: 'español'
  )
end

def participant_203
  @participant_203 ||= Participants.new(
    pt_id: 203,
    locale: 'español'
  )
end

def participant_204
  @participant_204 ||= Participants.new(
    pt_id: 204,
    locale: 'español'
  )
end

def participant_10
  @participant_10 ||= Participants.new(
    pt_id: 10,
    locale: 'español'
  )
end

def participant_33
  @participant_33 ||= Participants.new(
    pt_id: 33,
    locale: 'español'
  )
end

def participant_26
  @participant_26 ||= Participants.new(
    pt_id: 26,
    locale: 'español'
  )
end

def participant_251
  @participant_251 ||= Participants.new(
    pt_id: 251,
    locale: 'español'
  )
end

def participant_252
  @participant_252 ||= Participants.new(
    pt_id: 252,
    locale: 'español'
  )
end

def participant_34
  @participant_34 ||= Participants.new(
    pt_id: 34,
    locale: 'español'
  )
end

# Below are participants used for feedback.

def participant_146
  @participant_146 ||= Participants.new(
    pt_id: 146,
    locale: 'english'
  )
end

def participant_147
  @participant_147 ||= Participants.new(
    pt_id: 147,
    locale: 'english'
  )
end

def participant_148
  @participant_148 ||= Participants.new(
    pt_id: 148,
    locale: 'english'
  )
end

def participant_246
  @participant_246 ||= Participants.new(
    pt_id: 246,
    locale: 'español'
  )
end

def participant_247
  @participant_247 ||= Participants.new(
    pt_id: 247,
    locale: 'español'
  )
end

def participant_248
  @participant_248 ||= Participants.new(
    pt_id: 248,
    locale: 'español'
  )
end

# Below are participants used for login.

def participant_112
  @participant_112 ||= Participants.new(
    pt_id: 112,
    locale: 'english'
  )
end

def participant_fake
  @participant_fake ||= Participants.new(
    pt_id: 1234,
    locale: 'english'
  )
end

def participant_110
  @participant_110 ||= Participants.new(
    pt_id: 110,
    locale: 'english'
  )
end

def participant_5
  @participant_5 ||= Participants.new(
    pt_id: 5,
    locale: 'english'
  )
end

def participant_105
  @participant_105 ||= Participants.new(
    pt_id: 105,
    locale: 'english'
  )
end

def participant_6
  @participant_6 ||= Participants.new(
    pt_id: 6,
    locale: 'english'
  )
end

def participant_111
  @participant_111 ||= Participants.new(
    pt_id: 111,
    locale: 'english'
  )
end

def participant_29
  @participant_29 ||= Participants.new(
    pt_id: 29,
    locale: 'english'
  )
end

def participant_3
  @participant_3 ||= Participants.new(
    pt_id: 3,
    locale: 'english'
  )
end

def participant_156
  @participant_156 ||= Participants.new(
    pt_id: 156,
    locale: 'english'
  )
end

#Spanish

def participant_212
  @participant_212 ||= Participants.new(
    pt_id: 212,
    locale: 'español'
  )
end

def participant_210
  @participant_210 ||= Participants.new(
    pt_id: 210,
    locale: 'español'
  )
end

def participant_8
  @participant_8 ||= Participants.new(
    pt_id: 8,
    locale: 'español'
  )
end

def participant_205
  @participant_205 ||= Participants.new(
    pt_id: 205,
    locale: 'español'
  )
end

def participant_7
  @participant_7 ||= Participants.new(
    pt_id: 7,
    locale: 'español'
  )
end

def participant_211
  @participant_211 ||= Participants.new(
    pt_id: 211,
    locale: 'español'
  )
end

def participant_30
  @participant_30 ||= Participants.new(
    pt_id: 30,
    locale: 'español'
  )
end

def participant_4
  @participant_4 ||= Participants.new(
    pt_id: 4,
    locale: 'español'
  )
end

def participant_256
  @participant_256 ||= Participants.new(
    pt_id: 256,
    locale: 'español'
  )
end

p#articipants for quit date

def participant_133
  @participant_133 ||= Participants.new(
    pt_id: 133,
    locale: 'english'
  )
end

def participant_134
  @participant_134 ||= Participants.new(
    pt_id: 134,
    locale: 'english'
  )
end

def participant_135
  @participant_135 ||= Participants.new(
    pt_id: 135,
    locale: 'english'
  )
end

def participant_136
  @participant_136 ||= Participants.new(
    pt_id: 136,
    locale: 'english'
  )
end

def participant_137
  @participant_137 ||= Participants.new(
    pt_id: 137,
    locale: 'english'
  )
end

def participant_139
  @participant_139 ||= Participants.new(
    pt_id: 139,
    locale: 'english'
  )
end

def participant_149
  @participant_149 ||= Participants.new(
    pt_id: 149,
    locale: 'english'
  )
end

def participant_154
  @participant_154 ||= Participants.new(
    pt_id: 154,
    locale: 'english'
  )
end

def participant_150
  @participant_150 ||= Participants.new(
    pt_id: 150,
    locale: 'english'
  )
end

def participant_141
  @participant_141 ||= Participants.new(
    pt_id: 141,
    locale: 'english'
  )
end

def participant_142
  @participant_142 ||= Participants.new(
    pt_id: 142,
    locale: 'english'
  )
end

def participant_254
  @participant_254 ||= Participants.new(
    pt_id: 254,
    locale: 'english'
  )
end

#spanish

def participant_233
  @participant_233 ||= Participants.new(
    pt_id: 233,
    locale: 'español'
  )
end

def participant_234
  @participant_234 ||= Participants.new(
    pt_id: 234,
    locale: 'español'
  )
end

def participant_235
  @participant_235 ||= Participants.new(
    pt_id: 235,
    locale: 'español'
  )
end

def participant_236
  @participant_236 ||= Participants.new(
    pt_id: 236,
    locale: 'español'
  )
end

def participant_237
  @participant_237 ||= Participants.new(
    pt_id: 237,
    locale: 'español'
  )
end

def participant_241
  @participant_241 ||= Participants.new(
    pt_id: 241,
    locale: 'español'
  )
end

def participant_239
  @participant_239 ||= Participants.new(
    pt_id: 239,
    locale: 'español'
  )
end

def participant_249
  @participant_249 ||= Participants.new(
    pt_id: 249,
    locale: 'español'
  )
end

def participant_250
  @participant_250 ||= Participants.new(
    pt_id: 250,
    locale: 'español'
  )
end

def participant_242
  @participant_242 ||= Participants.new(
    pt_id: 242,
    locale: 'español'
  )
end


# Stop smoking guide participants


def participant_117
  @participant_117 ||= Participants.new(
    pt_id: 117,
    locale: 'english'
  )
end

def participant_126
  @participant_126 ||= Participants.new(
    pt_id: 126,
    locale: 'english'
  )
end

def participant_118
  @participant_118 ||= Participants.new(
    pt_id: 118,
    locale: 'english'
  )
end

def participant_119
  @participant_119 ||= Participants.new(
    pt_id: 119,
    locale: 'english'
  )
end

def participant_127
  @participant_127 ||= Participants.new(
    pt_id: 127,
    locale: 'english'
  )
end

def participant_120
  @participant_120 ||= Participants.new(
    pt_id: 120,
    locale: 'english'
  )
end

def participant_121
  @participant_121 ||= Participants.new(
    pt_id: 121,
    locale: 'english'
  )
end

def participant_128
  @participant_128 ||= Participants.new(
    pt_id: 128,
    locale: 'english'
  )
end

def participant_122
  @participant_122 ||= Participants.new(
    pt_id: 122,
    locale: 'english'
  )
end

def participant_123
  @participant_123 ||= Participants.new(
    pt_id: 123,
    locale: 'english'
  )
end

def participant_129
  @participant_129 ||= Participants.new(
    pt_id: 129,
    locale: 'english'
  )
end

def participant_124
  @participant_124 ||= Participants.new(
    pt_id: 124,
    locale: 'english'
  )
end

def participant_125
  @participant_125 ||= Participants.new(
    pt_id: 125,
    locale: 'english'
  )
end

def participant_130
  @participant_130 ||= Participants.new(
    pt_id: 130,
    locale: 'english'
  )
end

# Spanish

def participant_217
  @participant_217 ||= Participants.new(
    pt_id: 217,
    locale: 'español'
  )
end

def participant_226
  @participant_226 ||= Participants.new(
    pt_id: 226,
    locale: 'español'
  )
end

def participant_218
  @participant_218 ||= Participants.new(
    pt_id: 218,
    locale: 'español'
  )
end

def participant_219
  @participant_219 ||= Participants.new(
    pt_id: 219,
    locale: 'español'
  )
end

def participant_227
  @participant_227 ||= Participants.new(
    pt_id: 227,
    locale: 'español'
  )
end

def participant_220
  @participant_220 ||= Participants.new(
    pt_id: 220,
    locale: 'español'
  )
end

def participant_221
  @participant_221 ||= Participants.new(
    pt_id: 221,
    locale: 'español'
  )
end

def participant_228
  @participant_228 ||= Participants.new(
    pt_id: 228,
    locale: 'español'
  )
end

def participant_222
  @participant_222 ||= Participants.new(
    pt_id: 222,
    locale: 'español'
  )
end

def participant_223
  @participant_223 ||= Participants.new(
    pt_id: 223,
    locale: 'español'
  )
end

def participant_229
  @participant_229 ||= Participants.new(
    pt_id: 229,
    locale: 'español'
  )
end

def participant_224
  @participant_224 ||= Participants.new(
    pt_id: 224,
    locale: 'español'
  )
end

def participant_225
  @participant_225 ||= Participants.new(
    pt_id: 225,
    locale: 'español'
  )
end

def participant_230
  @participant_230 ||= Participants.new(
    pt_id: 230,
    locale: 'español'
  )
end


# Participant bugs participants


#def participant_121
#  @participant_121 ||= Participants.new(
#    pt_id: 121,
#    locale: 'english'
#  )
#end

#def participant_225
#  @participant_225 ||= Participants.new(
#    pt_id: 225,
#    locale: 'español'
#  )
#end
=end
