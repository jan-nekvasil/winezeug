;
; AutoHotKey Test Script for VLC 0.8.6f
;
; Copyright (C) 2009 Austin English
;
; This library is free software; you can redistribute it and/or
; modify it under the terms of the GNU Lesser General Public
; License as published by the Free Software Foundation; either
; version 2.1 of the License, or (at your option) any later version.
;
; This library is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
; Lesser General Public License for more details.
;
; You should have received a copy of the GNU Lesser General Public
; License along with this library; if not, write to the Free Software
; Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
;

#Include helper_functions
#Include init_test

; Download VLC, silently run the installer, sha1sum installed files, run it, verify the window exists, and exit.

DOWNLOAD("http://www.videolan.org/mirror-geo-redirect.php?file=vlc/0.8.6f/win32/vlc-0.8.6f-win32.exe", "vlc-0.8.6f-win32.exe", "b83558e4232c47a385dbc93ebdc2e6b942fbcfbf")

Runwait, vlc-0.8.6f-win32.exe /S
ERROR_TEST("Installing VLC had some error.", "Installing VLC went okay.")

SetWorkingDir, %A_ProgramFiles%\VideoLAN\VLC
SHA1("e2b6ecfe3ce14c7819530a1a8679b26f9d04cf98", "AUTHORS.txt")
SHA1("2bcd537e03d4bb9248b98447d23914e4799eaa4d", "axvlc.dll")
SHA1("b9e28040de9d8773c5b0cc8108869e8f3f287798", "COPYING.txt")
SHA1("b1b0b97bca2a98cceb9834c4e767ce85018c5a77", "Documentation.url")
SHA1("34a45320eb901e8e87e12d32a4e05458789eb056", "libvlc.dll")
SHA1("d332fb83bab81b1ab54f902585a921cf16c78da1", "MAINTAINERS.txt")
SHA1("a1a009cdc84e70f103ed9215d88786d1c7fca398", "NEWS.txt")
SHA1("de762c681820795bc0cf1a0e8c033397be017cb0", "README.txt")
SHA1("3cc492a48996e0b4f8932ac2a56e1c53911adb3e", "THANKS.txt")
SHA1("f34411542651b5c2b41cd25e5ef82fb3cfc6dcb8", "uninstall.exe")
SHA1("22422a6d2f6916b8e12d0a5d262a58f680ccb3e7", "vlc.exe")
SHA1("a2bb61edd0df1f1f56b3b4135a1fa8cdd3556694", "vlc.exe.manifest")
SHA1("0758210dc20371e44bdabae498245b5e450219d4", "skins\default.vlt")
SHA1("421307a45fea7cf1d203df2af17920bc29443376", "skins\skin.catalog")
SHA1("80bca1dd5767f3ae3679fb455c4e68e04b089661", "skins\skin.dtd")
SHA1("123060e20c75ea06286397a10e025e135409cc4a", "skins\winamp2.xml")
SHA1("97822c7b09ec39dd9175c91e5a98abe2cd85de6c", "skins\fonts\FreeSans.ttf")
SHA1("5e338e7795dfb8238b2f9ed2d38fbbb129cbf9fc", "skins\fonts\FreeSansBold.ttf")
SHA1("36f072115043dc874dd44f9d1a3314bc95cadae9", "plugins\liba52sys_plugin.dll")
SHA1("e4aba3d4ba822ad1f39f2a139d334145e6cb7475", "plugins\liba52tofloat32_plugin.dll")
SHA1("87151d58323aca8a2023fdcc78b03fe9c8b7ed8a", "plugins\liba52tospdif_plugin.dll")
SHA1("9b2734c11f29c85037fbed3fa412f07836942863", "plugins\liba52_plugin.dll")
SHA1("5430f324e52501aee2f6fb8b6d798cd00ef959c8", "plugins\libaccess_directory_plugin.dll")
SHA1("bf97568dd80a24446f6144a756f6b088fdbd6e67", "plugins\libaccess_fake_plugin.dll")
SHA1("62fe12445bced4c7045ffac09dfb4f38ffcdefda", "plugins\libaccess_file_plugin.dll")
SHA1("c06c6a329b076607f75a6a3f3d0a65943a10d6c5", "plugins\libaccess_filter_dump_plugin.dll")
SHA1("a4d58cbec82803b02a0a583247a7accf2709d8b2", "plugins\libaccess_filter_record_plugin.dll")
SHA1("8eef560ba32ac6aa0f6ff00e1e5b9fbc9045a5af", "plugins\libaccess_filter_timeshift_plugin.dll")
SHA1("dff3b967d40bc5aaa3178d2e5ebddbe9db14b329", "plugins\libaccess_ftp_plugin.dll")
SHA1("56af761d423c9902bd35bc932cfc1ff28a0ee975", "plugins\libaccess_http_plugin.dll")
SHA1("cff7a635f94ba250a7e2856b14ad52c10c12c719", "plugins\libaccess_mms_plugin.dll")
SHA1("ffcf12b8232155062d23377d63b90130c7b40b2a", "plugins\libaccess_output_dummy_plugin.dll")
SHA1("9a2a7cae15b387364603838c703fe2a07c7b97fc", "plugins\libaccess_output_file_plugin.dll")
SHA1("5db8ea2efdff4e7295e69ec80b41f73213ffbd03", "plugins\libaccess_output_http_plugin.dll")
SHA1("96a6cf24689d5fcbd087c8406d6a1bbf38fc8c09", "plugins\libaccess_output_shout_plugin.dll")
SHA1("f4f03434d741a52ba5cc08dfa514cbeef70839d9", "plugins\libaccess_output_udp_plugin.dll")
SHA1("012beb7cae9ca4cdd7e9057f65f856310e146bd8", "plugins\libaccess_realrtsp_plugin.dll")
SHA1("ce91a178c3bb18873e9157691f71146eef702723", "plugins\libaccess_smb_plugin.dll")
SHA1("410192f0875f50376259bef68b112350f5d97fb9", "plugins\libaccess_tcp_plugin.dll")
SHA1("bef13b984504a241ef417fa1ad902b90961fcae7", "plugins\libaccess_udp_plugin.dll")
SHA1("816f1b25f959a9f48b853a8ce27959eb9497e206", "plugins\libadjust_plugin.dll")
SHA1("7f7c7d907929a1bebed726ed1851186df6a13c1a", "plugins\libadpcm_plugin.dll")
SHA1("3e28cb2f2e66fd3cc53f8c59e9bf28fc96c76a93", "plugins\libaiff_plugin.dll")
SHA1("040a28c9a60ad9ede46649cb2c40ffc95d2d929d", "plugins\libaout_directx_plugin.dll")
SHA1("9b6634ca886f8206b56f6aab2b44408e866942bf", "plugins\libaout_file_plugin.dll")
SHA1("07d1538ada9feb560f1005db7d00e73d1b17c412", "plugins\libaraw_plugin.dll")
SHA1("684bf6b659fd872e232e90120be6dba35ecd01ce", "plugins\libasf_plugin.dll")
SHA1("65050816fe1c7816117bf294d87dfac22135b85a", "plugins\libaudio_format_plugin.dll")
SHA1("8d1bcbed16830ae47739cadaaef81703f60d057d", "plugins\libau_plugin.dll")
SHA1("e43200ab50d4f0a91de6fc62b6eea688eedf014f", "plugins\libavi_plugin.dll")
SHA1("c0c9732406ad0bf72fc6c80f0949c05414f2aa35", "plugins\libbandlimited_resampler_plugin.dll")
SHA1("680ac5337022ab9ceff16696adec4d2a09c085b2", "plugins\libblend_plugin.dll")
SHA1("ef9af999c24b3a11e9c5fda4761d9ae40a9a9fe2", "plugins\libcaca_plugin.dll")
SHA1("ace296176169da4530e5b71a9abab8f5d9affb21", "plugins\libcdda_plugin.dll")
SHA1("1511d374524b15241bdf8a3336004cba57a4bde9", "plugins\libcinepak_plugin.dll")
SHA1("5eebcd95071d18902e09fa5e139b20858520adc5", "plugins\libclone_plugin.dll")
SHA1("6f4ef5a695f61310960104639fd9ebc0380ddc42", "plugins\libcmml_plugin.dll")
SHA1("b11c6acffce9e89fc399e08385156e06b21e9988", "plugins\libcrop_plugin.dll")
SHA1("1371b71b2030a7a77e0043726cb64b301a2b9a49", "plugins\libcvdsub_plugin.dll")
SHA1("069596da81e7af30b0beb3f435ceccd5df98d842", "plugins\libdeinterlace_plugin.dll")
SHA1("aaf70c0fc32d3213aa55aa3e5e3f71c4d9f8fbdf", "plugins\libdemuxdump_plugin.dll")
SHA1("1695921dc56f82a08abcad48f81ddd63eeb9730d", "plugins\libdirect3d_plugin.dll")
SHA1("b59d981e5a8068991f5fb635efb996ea6aa7471b", "plugins\libdistort_plugin.dll")
SHA1("3db3fdc441aa0852fd7a81a90ac46d08ddda8ebe", "plugins\libdmo_plugin.dll")
SHA1("00a0a272d064b8854aa24c72db70526931595355", "plugins\libdolby_surround_decoder_plugin.dll")
SHA1("9aaa437eaa5bb1aede565dee9666f4b3338ff45a", "plugins\libdshow_plugin.dll")
SHA1("4cc1a0d0f2440c5ed5ee89db58590f9f41f4c69c", "plugins\libdtssys_plugin.dll")
SHA1("ee76b08eca69cb19b043e28a44d68467f199acbd", "plugins\libdtstofloat32_plugin.dll")
SHA1("27e9b82a3a1b4c04dbffb2ef7fceb284c05600f2", "plugins\libdtstospdif_plugin.dll")
SHA1("2e019c10b328ef0962c2ddd5432365c651ed243e", "plugins\libdts_plugin.dll")
SHA1("d39fe7e6b16e4c7c27e17cc498eea9720c7aca5d", "plugins\libdummy_plugin.dll")
SHA1("5f854c1c65cbc4866be0fb0a62ba0b4fc2aed1c7", "plugins\libdvbsub_plugin.dll")
SHA1("1fb282d50b488056328cc47ed3b98a2083a69eaf", "plugins\libdvdnav_plugin.dll")
SHA1("5f8fd982ddd8aa838b6657e6572eb7f9e57b1e8d", "plugins\libdvdread_plugin.dll")
SHA1("ebc5597d7a2d7d16966551e28a08cce390b8e299", "plugins\libequalizer_plugin.dll")
SHA1("7022e7017872a8d74dc45d805b9b0f39c2e4c486", "plugins\libexport_plugin.dll")
SHA1("03525b2e28ea83982c8cb1806e44006468f18a30", "plugins\libfaad_plugin.dll")
SHA1("972fc5ba8089d5e7556756aecde4924d9075aa9b", "plugins\libfake_plugin.dll")
SHA1("73d86c3aef8d64b0445bf3653319491e40fd042c", "plugins\libffmpeg_plugin.dll")
SHA1("6b8d5ea3ba39cdd4091b3f993db0aebf59cc9b2d", "plugins\libfixed32tofloat32_plugin.dll")
SHA1("ae2629a9e90b761c337becd5832e0a3172a3f470", "plugins\libfixed32tos16_plugin.dll")
SHA1("e1f93caa44663d7ff953610b9594e9eac0f11bcd", "plugins\libflacdec_plugin.dll")
SHA1("a3216a1f4dee38808d0e288aa0ddaff1d329cca0", "plugins\libflac_plugin.dll")
SHA1("031871dcc09c58e804a9d542094f609391f7ca60", "plugins\libfloat32tos16_plugin.dll")
SHA1("9ed0f9b72c7683acd2f1b7ab13b3badf8584d920", "plugins\libfloat32tos8_plugin.dll")
SHA1("eb76ebb6598af37270a060185b17b0975d26aca0", "plugins\libfloat32tou16_plugin.dll")
SHA1("c8024463823ce3adfda9835e58e8182760aae4f8", "plugins\libfloat32tou8_plugin.dll")
SHA1("8c23736230d58f48500ab140ec50f33cab3dd4fd", "plugins\libfloat32_mixer_plugin.dll")
SHA1("a94694093c4ae73f4c056d3d6ef0cc4dbfd9697f", "plugins\libfreetype_plugin.dll")
SHA1("1fa4b4160d14127c1e72d8a4f7089316795ec76e", "plugins\libgestures_plugin.dll")
SHA1("c1052f78424ea904e1c8cb625936e163c3a355f5", "plugins\libglwin32_plugin.dll")
SHA1("99d6f51fe7dbc85e9fd39fc68db07b9cf1330983", "plugins\libgnutls_plugin.dll")
SHA1("22956e0e4c8a50b970319081177a67db711b4f8b", "plugins\libgoom_plugin.dll")
SHA1("6053b2aed083e04af0813c785bb868d68d9000b7", "plugins\libgrowl_plugin.dll")
SHA1("17318c2b3024534be3b39d2c4b97f9d7a8716e77", "plugins\libh264_plugin.dll")
SHA1("32a321f421ddebf55caf7f2728aea8d2e5750b17", "plugins\libheadphone_channel_mixer_plugin.dll")
SHA1("6a841c63d4df31c751f1d0486ef2e3b378e8b26a", "plugins\libhotkeys_plugin.dll")
SHA1("4387b822e0ed7796fb609f7276510ebafa1c4531", "plugins\libhttp_plugin.dll")
SHA1("468872824cf14ea4cef0ac95a50717b42b824d4e", "plugins\libi420_rgb_plugin.dll")
SHA1("2d59dd83a849a7bdca29caecd2603bd467b041b6", "plugins\libi420_ymga_plugin.dll")
SHA1("14c17c65e21ecbec0e226a99935d601c08bf93ea", "plugins\libi420_yuy2_plugin.dll")
SHA1("12a4307b80cd8a467c92283544518744ceac8b5b", "plugins\libi422_yuy2_plugin.dll")
SHA1("371de792fa26932567c3d47c6853c20202e191f2", "plugins\libid3tag_plugin.dll")
SHA1("047c2286e83b1dd8f80fb371753afdeba0bbbfd3", "plugins\libimage_plugin.dll")
SHA1("1af5e3fe494a400ad65dcb704c93869fd28bac13", "plugins\libinvert_plugin.dll")
SHA1("50639079a3d099b6d90f91e95dacd8e1dd63ffcf", "plugins\libipv4_plugin.dll")
SHA1("b4345489189d26ac738ad18e39a5e8a832150f98", "plugins\libipv6_plugin.dll")
SHA1("143824f4b857aa9dfcd98dbd20310cd995ed45f8", "plugins\liblibmpeg2_plugin.dll")
SHA1("1442498aea3ac6c7b86cde3d5f51793e36f61bad", "plugins\liblinear_resampler_plugin.dll")
SHA1("30e53275fcc2b5b2296f6f8c8999e0729fe26185", "plugins\liblogger_plugin.dll")
SHA1("29315413b622db87905d4a935264cc96ba8558fd", "plugins\liblogo_plugin.dll")
SHA1("8f1de260fedbded3afaa7a017f2c7301176c694a", "plugins\liblpcm_plugin.dll")
SHA1("1bec3720b3b0533ceebff19dc4d07032e9de87db", "plugins\libm3u_plugin.dll")
SHA1("401a4777cc41ded8fc58a6b09f00ee2990ecd8c0", "plugins\libm4a_plugin.dll")
SHA1("018b25d99ab2af111b1bb52e64e6b5a4ad806c2b", "plugins\libm4v_plugin.dll")
SHA1("fdeccd6b3a8eb8d07eba44cbaf58d3ec906c0e93", "plugins\libmagnify_plugin.dll")
SHA1("9c11b606e56ab0424b0168cbd9658efcd91c77b6", "plugins\libmarq_plugin.dll")
SHA1("a86a378a8a0efebcb618dc70f480fa70489a5d9f", "plugins\libmemcpy_plugin.dll")
SHA1("68abfc1914b89ba85f7c511cbff560322c1bf38a", "plugins\libmjpeg_plugin.dll")
SHA1("d596953474d4ab1fd2ab02a8d550769a406f997f", "plugins\libmkv_plugin.dll")
SHA1("079596191e9532e51a826c71bc0dbf773e59b4c2", "plugins\libmod_plugin.dll")
SHA1("ce73c4d7cbce5bcf7e37be7936915c70f04780f4", "plugins\libmosaic_plugin.dll")
SHA1("8d3b92e89a554709e04bc609a3c5889a3080775a", "plugins\libmotionblur_plugin.dll")
SHA1("41adec7ff5066740f39e905024d90ed9fbec2eb7", "plugins\libmotiondetect_plugin.dll")
SHA1("7c03d45e983a99503b0c9910564b1046a7529cc0", "plugins\libmp4_plugin.dll")
SHA1("c94ab133169383a00545fdef7381518efc847787", "plugins\libmpc_plugin.dll")
SHA1("8e5cbfca73b81f283897e75c23907280ccd9a5fe", "plugins\libmpeg_audio_plugin.dll")
SHA1("42554ff7994e63b892fcbc32585d925b877269e6", "plugins\libmpgatofixed32_plugin.dll")
SHA1("a7e5d65f7695c6a21de7b1bbf1ea82368a96d82f", "plugins\libmpga_plugin.dll")
SHA1("4a6e5d67086b4a3d013a3b1620749f27213658ac", "plugins\libmpgv_plugin.dll")
SHA1("e8ad8af1bb00ac0a2b655c75f73ad12a56b3e592", "plugins\libmsn_plugin.dll")
SHA1("83fb2a9c2aaf8203fd7121e4e3e6e3cf0947c895", "plugins\libmux_asf_plugin.dll")
SHA1("df9c91949b7306938eaee77581878304c9fcd05a", "plugins\libmux_avi_plugin.dll")
SHA1("38b59e05123b2f3b7a732e1bb8e81990731a75cc", "plugins\libmux_dummy_plugin.dll")
SHA1("62e30ee894ad1a3318efa7d3d47d9abd4ee2132f", "plugins\libmux_mp4_plugin.dll")
SHA1("9165e6d03ae83bf90fd465eff27b76e6f435b6cb", "plugins\libmux_mpjpeg_plugin.dll")
SHA1("85b5221219807361e747c11057e282a518fd87a8", "plugins\libmux_ogg_plugin.dll")
SHA1("981feff76d4c6783eeb4707b0cd8b9af00b37450", "plugins\libmux_ps_plugin.dll")
SHA1("c2d84fff3107139fb910380e6cebae6de1af0e9a", "plugins\libmux_wav_plugin.dll")
SHA1("a83dc498aef4f70619fab152100d5f4e65d61264", "plugins\libnetsync_plugin.dll")
SHA1("25e1163c5f4e16581e53160cf27bfa80255b570c", "plugins\libnormvol_plugin.dll")
SHA1("54530dc17d7c7a222420e0933d34e7d38d2fa970", "plugins\libnsc_plugin.dll")
SHA1("f48007ef759c7aefc54306587b26c0927d0b589d", "plugins\libnsv_plugin.dll")
SHA1("e91c9692095b6ffcdd24703dc1c0a8467413b6f2", "plugins\libntservice_plugin.dll")
SHA1("553b16bd9329ad561e49cc4cd40978a52f9fd068", "plugins\libnuv_plugin.dll")
SHA1("044c9cece072168be67cc32a2b850ada11084f7c", "plugins\libogg_plugin.dll")
SHA1("2e18860124f56fa85c7fa60d02b36fe30d17bca2", "plugins\libopengl_plugin.dll")
SHA1("e2fd80f50e65acc062d494879867e176a43c2cb4", "plugins\libosdmenu_plugin.dll")
SHA1("39ddac3019f701a39c30fa0511c5db732bac6a7b", "plugins\libpacketizer_copy_plugin.dll")
SHA1("61aae6a9fd5100deaeffd21a16a52519a841d1d5", "plugins\libpacketizer_h264_plugin.dll")
SHA1("8e7ce6296bda882bff39423dc3e6cb523f2d1141", "plugins\libpacketizer_mpeg4audio_plugin.dll")
SHA1("8441c6442507ceb0282f9989a934d4a8aac097b9", "plugins\libpacketizer_mpeg4video_plugin.dll")
SHA1("63812ec7cd384e9e31e6493f0f71cc7c7ecf3afb", "plugins\libpacketizer_mpegvideo_plugin.dll")
SHA1("c86d4e4681d84ebbf1e1c94616a6306311cc6910", "plugins\libparam_eq_plugin.dll")
SHA1("4bbf5d86819c55f642da23eb07f49dda96c6fe42", "plugins\libplaylist_plugin.dll")
SHA1("a4153673752d2851ca0f51ca643e46e70e6e0991", "plugins\libpng_plugin.dll")
SHA1("a28f5c95018e8445159d62ab4ba48e12214ab93f", "plugins\libpodcast_plugin.dll")
SHA1("225a64a81bbab45ebc8be7ddb6fac900571fa517", "plugins\libportaudio_plugin.dll")
SHA1("479e225b46112d8b7bad64244e45c3635ef11b2e", "plugins\libps_plugin.dll")
SHA1("228b22dc6704c23d680eac311dff8cd3c69b3848", "plugins\libpva_plugin.dll")
SHA1("5a9a13a0776232af2766af3648dffc2f190145b8", "plugins\librawdv_plugin.dll")
SHA1("c66dfa223a07ea9dd2325768275dae7e28b3f1ea", "plugins\librawvideo_plugin.dll")
SHA1("1f130640928f7e5c2fbeb2e1438095f7e3b7960a", "plugins\librc_plugin.dll")
SHA1("89cb8aa11d18feffc5b055c9646c17122ef05735", "plugins\librealaudio_plugin.dll")
SHA1("bcbce0689ac9749ade60e8d1a2ec917cfab9e178", "plugins\libreal_plugin.dll")
SHA1("f3742504810b518ded813182b578b0016cd97599", "plugins\librss_plugin.dll")
SHA1("f2d1cf28bbf722467386be871fccdf148ff45acb", "plugins\librv32_plugin.dll")
SHA1("de4babe19f48d80288a15b9435e89d8b809e55ea", "plugins\libs16tofixed32_plugin.dll")
SHA1("2dbc9806a33834131ba781e5f6330cab9eccc469", "plugins\libs16tofloat32swab_plugin.dll")
SHA1("b0f7f320786cc0de3e3e90aedfef31edc88842ca", "plugins\libs16tofloat32_plugin.dll")
SHA1("dae0c0f91a780ce70a42468d796530b9eb55ac98", "plugins\libs8tofloat32_plugin.dll")
SHA1("be02c151d98195232c597151343fea6ae5efc1b5", "plugins\libsap_plugin.dll")
SHA1("e985281456da52553aad3f1f1922bbd33a642a4e", "plugins\libscale_plugin.dll")
SHA1("a5514f121c91ec6d1ef7658625ed4643ab835209", "plugins\libscreen_plugin.dll")
SHA1("faec427407e272996e4aada36144fdeb697b49bf", "plugins\libsdl_image_plugin.dll")
SHA1("23db7f37fdd614a94ff1e2f1931569fbba7cbce9", "plugins\libsgimb_plugin.dll")
SHA1("b53e6c4bc224d542b068f3626d37dcfad1123c51", "plugins\libshout_plugin.dll")
SHA1("1be12c0c40def0ff3c70a9e59049fc4797295e9c", "plugins\libshowintf_plugin.dll")
SHA1("e619f04d985d5cd7c394430cf1b1829c7370d046", "plugins\libsimple_channel_mixer_plugin.dll")
SHA1("ae6bb9b9876619dd26a1d6d4871881c58acefefd", "plugins\libskins2_plugin.dll")
SHA1("e8f8f2587b04e251bb4aec114454a3a493310459", "plugins\libspdif_mixer_plugin.dll")
SHA1("b03a5274c526507fdb69eefd6028006d5f8013a8", "plugins\libspeex_plugin.dll")
SHA1("3981f0210e05c1cb1d3e4692eb9eb6138662a638", "plugins\libspudec_plugin.dll")
SHA1("541ec4c5249d044e1e8ac94263e6b9cfaf017603", "plugins\libstream_out_bridge_plugin.dll")
SHA1("e105321c2fa6bbbd919da1bd164c8e72e8ea26cf", "plugins\libstream_out_description_plugin.dll")
SHA1("d5159ec77045a0918e95bebab90514739b450b5a", "plugins\libstream_out_display_plugin.dll")
SHA1("44ef41c829df267c28d95c54fceb226a140b75ca", "plugins\libstream_out_dummy_plugin.dll")
SHA1("20d07d73ffb5e6a80fe2857357b87d63276c6cf8", "plugins\libstream_out_duplicate_plugin.dll")
SHA1("c478612f881c036d3af285e7e4f17cff377f03d0", "plugins\libstream_out_es_plugin.dll")
SHA1("ca0385569f6a635ed09702d9e01a7c1e12bcd4f8", "plugins\libstream_out_gather_plugin.dll")
SHA1("9fb00178270be7c828c0366bfc79a456974e9185", "plugins\libstream_out_mosaic_bridge_plugin.dll")
SHA1("c571eee79481f6467ecb262785a5a5b166acb731", "plugins\libstream_out_rtp_plugin.dll")
SHA1("2256b6b3185ec7b308b60aab39191d324636d5a9", "plugins\libstream_out_standard_plugin.dll")
SHA1("b037832e6cd72f9ae02bc7dfb35a1893375b1f86", "plugins\libstream_out_transcode_plugin.dll")
SHA1("36a1053e4d2cefaefa562a2a5ec42a3b7dacbf35", "plugins\libsubsdec_plugin.dll")
SHA1("6de75c165a539ed32cc54ee0a525e9c60a6dfe62", "plugins\libsubtitle_plugin.dll")
SHA1("662b694421c9161fd19e9054f3edac3d290fa964", "plugins\libsvcdsub_plugin.dll")
SHA1("a2deef7bb248a196b79ab3bf363ff51dbd03ad21", "plugins\libtelnet_plugin.dll")
SHA1("884d7e842d37e070bc0ecb407b38d37c04e2ef9c", "plugins\libtelx_plugin.dll")
SHA1("960d9b2f7add5b3c2c024bfa019c5949569e4ecd", "plugins\libtheora_plugin.dll")
SHA1("bd51f06260b3d3b8b760ae8bd20cc7c8bc214fc9", "plugins\libtime_plugin.dll")
SHA1("6e32a5847a2ac8a39c194face98f44f452bd7cd0", "plugins\libtransform_plugin.dll")
SHA1("e72ecfb18fdff475b85d2678a26044c7ca94bebf", "plugins\libtrivial_channel_mixer_plugin.dll")
SHA1("d1e4c5ed7cf85e7fb9e4c3b0bff418b865ddcc71", "plugins\libtrivial_mixer_plugin.dll")
SHA1("e8d4c86ebf681fa1194be0ce392ef9ee76b7ce87", "plugins\libtrivial_resampler_plugin.dll")
SHA1("6e3b9ef201814b0a3d5ae964bfb71340e0119281", "plugins\libts_plugin.dll")
SHA1("3047dbb499b37e75d5fa07702a6d40fec41b5c55", "plugins\libtta_plugin.dll")
SHA1("45cbf2b927203abad409a69e08d7276f54581d48", "plugins\libtwolame_plugin.dll")
SHA1("87773cad3a7ada38a71cc2a5040ae2422fbf51bc", "plugins\libty_plugin.dll")
SHA1("db34f22d83f8d0bf7b8aaeeaf47f17043f58c837", "plugins\libu8tofixed32_plugin.dll")
SHA1("835c0b02cb07a4872fcd5fbdc803e6c4147c0c6a", "plugins\libu8tofloat32_plugin.dll")
SHA1("80a0158daf3aff3f5f58edf1aaa7904f986150e2", "plugins\libugly_resampler_plugin.dll")
SHA1("07e9010975a74b16037ada185b26530e9caf527c", "plugins\libvcd_plugin.dll")
SHA1("4d01329ef541374ee180a3aa7cdc17a54e920050", "plugins\libvisual_plugin.dll")
SHA1("14d8d1b449a626aefc307d6cbd238e3c1f6d3ded", "plugins\libvobsub_plugin.dll")
SHA1("bcb46b596fd8ab02f504eb9b1165349a81b957bf", "plugins\libvoc_plugin.dll")
SHA1("dfef0d8620ed6673003ae0445e2e3ad93e435547", "plugins\libvod_rtsp_plugin.dll")
SHA1("78f080bf501951d682c2913ec065a2794373fd08", "plugins\libvorbis_plugin.dll")
SHA1("3ac60bb053f0176021a593d5d6370e9dccc6b887", "plugins\libvout_directx_plugin.dll")
SHA1("70c42e644dfaaa280b111a251f84f6a71d2552aa", "plugins\libwall_plugin.dll")
SHA1("7578a5788f7cad4e15fa55af1e38674e1d4c3c0b", "plugins\libwaveout_plugin.dll")
SHA1("f95c3f60e0198d1cdac9ff1d221d967964835573", "plugins\libwav_plugin.dll")
SHA1("345df08d393d796a7368b5c8a8fce49df02db2e5", "plugins\libwingdi_plugin.dll")
SHA1("f2ab378fc39b89a3db3a38feb601834953994e2e", "plugins\libwxwidgets_plugin.dll")
SHA1("f870fa5558bd80e4500b9b978ca94d381a663f83", "plugins\libx264_plugin.dll")
SHA1("3ed6292294a7e212f41c0f07f2cf39fa625dba11", "plugins\libxa_plugin.dll")
SHA1("c0cd808f04dd66425bdc17ddd4edbbcafd79bb68", "plugins\libxml_plugin.dll")
SHA1("c95a3cbbf6cd316fb8fc96549cd716859164e95a", "plugins\libxtag_plugin.dll")
SHA1("9963f214073ec860caa2d4bed70f669048bd61a7", "osdmenu\default.cfg")
SHA1("08b36e03ea71ce6d48b6f47807c037bbdb2a6565", "osdmenu\dvd.cfg")
SHA1("9c8fe1c34c6f11fe8cdf4dc30450888ee7fdc35f", "osdmenu\dvd\volume\volume00.png")
SHA1("6e2d16ade87e5a42237bf0a6ed361613b7d6b057", "osdmenu\dvd\volume\volume01.png")
SHA1("d98fadfb0fe057adc5c36414bc5445a6bfb2146d", "osdmenu\dvd\volume\volume02.png")
SHA1("c463fd4f4b4aa908e4ab39d86946bbd2f2078f7b", "osdmenu\dvd\volume\volume03.png")
SHA1("cee8c836272a22da654d9032f570543b2e5024fc", "osdmenu\dvd\volume\volume04.png")
SHA1("8adfc9b42ac21da0e32eaa34d0f5ac9d264508fc", "osdmenu\dvd\volume\volume05.png")
SHA1("0bfceb1f45974bd9ebeaab2dbd2436a886ddaa24", "osdmenu\dvd\unselect\barroff.png")
SHA1("a3d89ac4d2c1739dbaeff25e3e75b71fe1312189", "osdmenu\dvd\selection\bw.png")
SHA1("0ec3816d57517abd3599e4dbc5b8224de4d59ec0", "osdmenu\dvd\selection\esc.png")
SHA1("3cdd4df9228b277cd8d39af5e747650839d934af", "osdmenu\dvd\selection\fw.png")
SHA1("c2e12958ce46cbaa238b7e64121c891ea80cdfbf", "osdmenu\dvd\selection\mute.png")
SHA1("85842d804a7d2452d08dcb94a8c345a5c95f91fb", "osdmenu\dvd\selection\next.png")
SHA1("4dc7877893843a54a82f5f339fce5581ae72237f", "osdmenu\dvd\selection\pause.png")
SHA1("b7a6521e154244c17fd1028f7438970b639ad490", "osdmenu\dvd\selection\play.png")
SHA1("62a33c859f6437aea12bad3d39816c709c18da58", "osdmenu\dvd\selection\previous.png")
SHA1("ae143baa8ad9517b71a8aee89934dd7e82525e4d", "osdmenu\dvd\selection\slow.png")
SHA1("1e22f1c2b82e21b87fc82cb518de0ee0ba24313f", "osdmenu\dvd\selection\stop.png")
SHA1("60326242499a71c4da2c99274b17422ee7c10745", "osdmenu\dvd\selected\bw.png")
SHA1("1ad457f7dcccbd2ac8d29e9b0641ff83ddde5e04", "osdmenu\dvd\selected\esc.png")
SHA1("5c6ba3d47d14396f29b8f26b2adaed8c9b41d718", "osdmenu\dvd\selected\fw.png")
SHA1("1aa84c8891dc82244f0d599d613bec39c44bf51d", "osdmenu\dvd\selected\mute.png")
SHA1("8192da6313808283c7911be05ba91a3e3c8ea2f7", "osdmenu\dvd\selected\next.png")
SHA1("38b1a380bee568b90a963e17aa17ed6340d6eb63", "osdmenu\dvd\selected\pause.png")
SHA1("de4e6015a9bcfe15d78b49308268f4dc56f27e66", "osdmenu\dvd\selected\play.png")
SHA1("344b9f225b9498ad7501855f11493237b724c44f", "osdmenu\dvd\selected\previous.png")
SHA1("d0ed6b6e80bffaab719fc4e70e70224a6849db5f", "osdmenu\dvd\selected\slow.png")
SHA1("454e10b520c93d088ffc46e9cef3ab0ba5ac5c6d", "osdmenu\dvd\selected\stop.png")
SHA1("1aa84c8891dc82244f0d599d613bec39c44bf51d", "osdmenu\dvd\selected\volume.png")
SHA1("d80af6882a96cb5c120cb27f2e1608f128ed77db", "osdmenu\default\unselected.png")
SHA1("559b1200818d5204e0c1827668706ff21e99b13a", "osdmenu\default\volume\volume_00.png")
SHA1("061cc612c908f20bb71a536d5a8084c7370380d5", "osdmenu\default\volume\volume_01.png")
SHA1("705243502a4e5628a48c0390a4f0868aff7b031c", "osdmenu\default\volume\volume_02.png")
SHA1("097a5e21126b13dfdbb110ef8bdd023b7bf0d294", "osdmenu\default\volume\volume_03.png")
SHA1("9ae88d811255ff537f21e4ef54da415f34f2ed8f", "osdmenu\default\volume\volume_04.png")
SHA1("b34e132a4d49da6aff805827af9764cf72fd133e", "osdmenu\default\volume\volume_05.png")
SHA1("6936758e3c8cca1ec5463837eb6a95c86b53cd75", "osdmenu\default\volume\volume_06.png")
SHA1("31070996e13043da91b5986e09f7bc38ab4df8cb", "osdmenu\default\volume\volume_07.png")
SHA1("83e88493ddc79f417ddf8503a61704edcbe09635", "osdmenu\default\volume\volume_08.png")
SHA1("7c1594256860ad98f52b9a11e2d15ce8ad2d13ac", "osdmenu\default\volume\volume_09.png")
SHA1("f4cc65bb696a2bf2a5bc7a54d8f7ef44b6066a63", "osdmenu\default\volume\volume_10.png")
SHA1("4844d17fb48a1f5f2d2b1035edc1d21827479bae", "osdmenu\default\selection\bw.png")
SHA1("2422618c0e249dee328447733c797f5150d5fbb9", "osdmenu\default\selection\esc.png")
SHA1("952e6d735f9f267f497a020716e23b621a279761", "osdmenu\default\selection\fw.png")
SHA1("ccf7f8ef5b61395239cea17b186a9887eeb10e55", "osdmenu\default\selection\next.png")
SHA1("e69ed0a3fd008b2f01121ed76441b8d86e858602", "osdmenu\default\selection\play_pause.png")
SHA1("eaad01d862ceb9257c5020847a650b5991d9c9e6", "osdmenu\default\selection\previous.png")
SHA1("cefdf5433552fe75e34aaba269a2f10786f0f8b0", "osdmenu\default\selection\stop.png")
SHA1("f72ac9cce8ec02ecc7a6509ef3a4ea478d1e9ffe", "osdmenu\default\selection\volume.png")
SHA1("0138a8e53bde0c2aabd44e2728f34b55ce853315", "osdmenu\default\selected\bw.png")
SHA1("ed92de3da14ffbed9407fb80490e09806824f0fa", "osdmenu\default\selected\esc.png")
SHA1("c118cdf528354663ebbd7ebd166d17d0e78e2670", "osdmenu\default\selected\fw.png")
SHA1("e70466a327ddd260d15ebb74edab4180ba5d830e", "osdmenu\default\selected\next.png")
SHA1("75390c045b1011197c32fd7d6fc351d2f98e127e", "osdmenu\default\selected\play_pause.png")
SHA1("40131a369ab9cd7123de21cdd14d707c3871a5d5", "osdmenu\default\selected\previous.png")
SHA1("a5bc95e90dd566a4d3eb34bdae29bbe60f34618c", "osdmenu\default\selected\stop.png")
SHA1("cd4b89eeec4adbb9f36e2bb2296833f6fa324a0b", "osdmenu\default\selected\volume.png")
SHA1("fb4145d0291659e614a8b92e4e9827bcef333e0b", "locale\zh_TW\LC_MESSAGES\vlc.mo")
SHA1("7707833a2497b890b22ab6311dbb2f99702c7be5", "locale\zh_CN\LC_MESSAGES\vlc.mo")
SHA1("a8945c5488ab153929b89413ea36a01bac5d6a7d", "locale\tr\LC_MESSAGES\vlc.mo")
SHA1("9c38d23b11a0659ff2a6cfba1d01dbb60a53d161", "locale\th\LC_MESSAGES\vlc.mo")
SHA1("1239c5c697665339c4687f4845a85a48fcab7434", "locale\sv\LC_MESSAGES\vlc.mo")
SHA1("54f907ccad21d3dcd52d38cf09188b3068606030", "locale\sq\LC_MESSAGES\vlc.mo")
SHA1("29295a4ad67037cdf74ba63885f52ee8a397da84", "locale\sl\LC_MESSAGES\vlc.mo")
SHA1("161f5d1565ce1ded2a77f66d4900aea817c6c283", "locale\sk\LC_MESSAGES\vlc.mo")
SHA1("018ec23ba611121e91cf82bba621a146676b7160", "locale\ru\LC_MESSAGES\vlc.mo")
SHA1("2a2559d3ff9421f31589d97f878684faf6e843d1", "locale\ro\LC_MESSAGES\vlc.mo")
SHA1("6748f67b49a12b10faf3989fb6a808a7520f82b4", "locale\pt_BR\LC_MESSAGES\vlc.mo")
SHA1("ed9096d71007752524484a46d711a0c36608be72", "locale\pl\LC_MESSAGES\vlc.mo")
SHA1("f10b99e66a903adfe2ae374474f65af5e61d1d08", "locale\pa\LC_MESSAGES\vlc.mo")
SHA1("660f8ac8e6319e12dc7059e9e125decc80791666", "locale\oc\LC_MESSAGES\vlc.mo")
SHA1("1aa3c1e01d624e5c38379fe4bb7c8b9d545f7804", "locale\nn\LC_MESSAGES\vlc.mo")
SHA1("4659d794d9970c1dd90b50799c2fbb3a98888f00", "locale\nl\LC_MESSAGES\vlc.mo")
SHA1("08d5555337261485e0f54a1ebd56f900bc68307a", "locale\ne\LC_MESSAGES\vlc.mo")
SHA1("f7a28375db7d54021f2241a4df142f6d8f9ce9f9", "locale\nb\LC_MESSAGES\vlc.mo")
SHA1("04cfba88b3b5c91c0475793a77e28a098e5f8210", "locale\ms\LC_MESSAGES\vlc.mo")
SHA1("c7fcf0cad082eb0ca9e8250540170f8351766dff", "locale\lv\LC_MESSAGES\vlc.mo")
SHA1("13750ba1ac7d555b891fd4261fa862f95985d2c2", "locale\lt\LC_MESSAGES\vlc.mo")
SHA1("81df9b3ac90fb2cb60a9f622b7bf83d8204101a1", "locale\ko\LC_MESSAGES\vlc.mo")
SHA1("dc2b03b75b0a2a11c576fec97a87caf0f2a8cf9b", "locale\ka\LC_MESSAGES\vlc.mo")
SHA1("43d82829053a77c9d53703da07238c4df4197d2a", "locale\ja\LC_MESSAGES\vlc.mo")
SHA1("612855a675cc2b0ad96bac78cca4a9a7e2dbd0d0", "locale\it\LC_MESSAGES\vlc.mo")
SHA1("3c200acf21890c5383b92b6a4d1f08e20f576e02", "locale\hu\LC_MESSAGES\vlc.mo")
SHA1("f459d81c83b0ab177fa01fb82b4f42cfac2b0115", "locale\hi\LC_MESSAGES\vlc.mo")
SHA1("285732ce8423969d628cdf238b13e67235733c52", "locale\he\LC_MESSAGES\vlc.mo")
SHA1("13f712c49155f2094a9fcda23b6bf96001c3fe95", "locale\gl\LC_MESSAGES\vlc.mo")
SHA1("431f3c84e70365791c3c74ac7618979178b6f599", "locale\fur\LC_MESSAGES\vlc.mo")
SHA1("366eb6b3a0ad7614b8c220e208a6f4a6a26c0a68", "locale\fr\LC_MESSAGES\vlc.mo")
SHA1("da02a84262e740ee0f8ee8b4286556c7076674c2", "locale\fa\LC_MESSAGES\vlc.mo")
SHA1("128d7f21954f54a97005805aa402428750fed87f", "locale\eu\LC_MESSAGES\vlc.mo")
SHA1("51d5bee029a953a50d53e08586402ada0bc83add", "locale\es\LC_MESSAGES\vlc.mo")
SHA1("7e8afb3110194cd97e1bea844794eeb1a8b2636c", "locale\en_GB\LC_MESSAGES\vlc.mo")
SHA1("ac13cd5c41314fca7e2f6861f6551299bec82f84", "locale\de\LC_MESSAGES\vlc.mo")
SHA1("e74b7d4accb88611841c2ca9bebeedb59172ec54", "locale\da\LC_MESSAGES\vlc.mo")
SHA1("d57ca2c86ab86323c66e9d93648eac991c950817", "locale\cs\LC_MESSAGES\vlc.mo")
SHA1("a78d3a9de0e2f7c8f1c41cdf60bfc375c354d0e6", "locale\co\LC_MESSAGES\vlc.mo")
SHA1("fab29fac634b1cf1071a50c76e1a2fcecd41777b", "locale\ca\LC_MESSAGES\vlc.mo")
SHA1("352ccc8703a9d18c93aa90aed340f6110b3955a5", "locale\ar\LC_MESSAGES\vlc.mo")
SHA1("3295d911b489b1c1551f4f3b8cb72a907b05cb64", "locale\af\LC_MESSAGES\vlc.mo")
SHA1("2353afb5c229987df63696fb48bdf840aa208791", "http\favicon.ico")
SHA1("1fce30b072f05b138fc61ed8e50f5bbd753f8ea1", "http\iehacks.css")
SHA1("6ff96319f5f74aaeb7076aa18796d02ffb1a3bee", "http\index.html")
SHA1("56659ebe9bbd43da8c228e7bb6223afc7f1342dd", "http\mosaic.html")
SHA1("4335cf9799fae8295247658dc2bd2e95423e5947", "http\style.css")
SHA1("9d17200cd429ef73054b5bbedc64c1bac5b64117", "http\vlm.html")
SHA1("98477e964bf7312899ba73a0a17537bd8d65f6e1", "http\vlm_export.html")
SHA1("3b1e306ffb8c8f0d4764d74d2f69955713043797", "http\requests\browse.xml")
SHA1("2fd983460705143970c9ab7390c170ac1e372655", "http\requests\playlist.xml")
SHA1("6f32da526e207a2fe69f0355473466269ce07ec5", "http\requests\readme.txt")
SHA1("81113d2da81c42a584261499eedc0a571cedf1ce", "http\requests\status.xml")
SHA1("e7915fe2f59f987da16daca14c06c97853a30466", "http\requests\vlm.xml")
SHA1("a2fee7d1289c615751a8d2850a06c3a1a1d0d1d9", "http\requests\vlm_cmd.xml")
SHA1("df6ef77a9840133e73cc5169250f7ccc734beaab", "http\old\cone_minus.png")
SHA1("85cd7d85cc3574894b7d49eb38d1b7cba99b12b7", "http\old\cone_plus.png")
SHA1("e1e184857c9ad04556c4990639d738e1dfd22360", "http\old\index.html")
SHA1("acc2b9b4bd421775a715503a6d8a9c383c4e1bbf", "http\old\info.html")
SHA1("b621bd115eeb11299c1459eb205fca4b402bab9d", "http\old\style.css")
SHA1("8b0d88dd566d247a1c81ef24e8ec4f6e9648a635", "http\old\webcam.html")
SHA1("181fcde5d35d9c665760b24519aa7aa67eb60fc4", "http\old\vlm\edit.html")
SHA1("c75d8a925ef2ab07e5decc3f625e01cf690694d6", "http\old\vlm\index.html")
SHA1("083c529ecf1ca0070863f0b9cd210588b3b6099b", "http\old\vlm\new.html")
SHA1("be92c63c8a1a7c109c5856b4282f52b59ba5253a", "http\old\vlm\show.html")
SHA1("106e87fdc29cbca3395193562fd5be07062087c7", "http\old\admin\browse.html")
SHA1("e56ef6be3ae696efb16dd3f43d5f45cdedddcfe2", "http\old\admin\dboxfiles.html")
SHA1("9c8e90ab1078db534e13f04e418643601727c93e", "http\old\admin\index.html")
SHA1("9f8fbe2f26bec8cc2e6ce6550c88e9c816b552a8", "http\js\functions.js")
SHA1("71c938e3da0d471eb6bf3c58c9097792e09cd7d6", "http\js\mosaic.js")
SHA1("da6bf2ea09cfc00f09da5f4b7044590406fcdc1e", "http\js\vlm.js")
SHA1("3d65ae9bc2720eafc09f9d95fa3d1a1363463ea6", "http\images\delete.png")
SHA1("bbb813c069d44e4ff4b50ede2860d1cd7b5610d8", "http\images\delete_small.png")
SHA1("6b5011d5f58056649b1bb178b09c45d2ca6dfb10", "http\images\eject.png")
SHA1("b17ffdf422103827a9382ff36b380f222907619d", "http\images\empty.png")
SHA1("84f0516fb561e19e88c658a49e7dc1f5e147205b", "http\images\fullscreen.png")
SHA1("d1f21cfdba1e0d38608455499ef3cb92852984e8", "http\images\help.png")
SHA1("eea97122ba8134fbb349f397463bec56a2685602", "http\images\info.png")
SHA1("04aada2901ea32308efa1629af6fdcacf95f8044", "http\images\loop.png")
SHA1("dd12d7841ad37c27f3a6296bde4c4102a40a8d46", "http\images\minus.png")
SHA1("00304c5ba0d007e9518dff80263773054c0143df", "http\images\next.png")
SHA1("01745f92f5d8b78f8046211ea2ac34f07aa6e408", "http\images\pause.png")
SHA1("6b3cbef761cae800932f1830f85883b126c03fed", "http\images\play.png")
SHA1("9b0fd609be09041663f12afcd8b9f8d46d035bd7", "http\images\playlist.png")
SHA1("85a1af2fb99477a04c0dda69aced988096b73e77", "http\images\playlist_small.png")
SHA1("71676217d1561b5e604059a54f455f8ea5f50e4e", "http\images\plus.png")
SHA1("727e855ffe7b7028b2a81918ddabce0c1712a573", "http\images\prev.png")
SHA1("20eb1ab62ebdbfb3207ccf14991898892d0af914", "http\images\refresh.png")
SHA1("8f4a48a1759cafe7a68cbaec5f828f42093f5419", "http\images\repeat.png")
SHA1("d9b502d84ad9695aea2e72fef62d2fac0ba59117", "http\images\sd.png")
SHA1("82e190b12d02511249d74a968678e82f5cbfcac8", "http\images\shuffle.png")
SHA1("0dd683daeabe4c3ddcea2958f1eb37c99cd86fd7", "http\images\slider_bar.png")
SHA1("534b0a8892bd5286c665013fdebf1ed00e8a2052", "http\images\slider_left.png")
SHA1("8fec7741cec2cf05ff5d97b8a590030100723e77", "http\images\slider_point.png")
SHA1("1d3c4e9e3f1bc70657a7e257914f4c65cc265b8b", "http\images\slider_right.png")
SHA1("15a357542e2e7d64b461a286e45f32ce7be45795", "http\images\slow.png")
SHA1("649eb7b5e98aa2a225fd169c9a7cfa5b589939f5", "http\images\snapshot.png")
SHA1("79e131912b7b7e6148402fa64dabaddb8b916054", "http\images\sort.png")
SHA1("6323c65d4e2441a38c10a5a296d4e8766ea9ef4d", "http\images\sout.png")
SHA1("a11dea56b1f198640b6b093148aa29d05d8d6df4", "http\images\speaker.png")
SHA1("33439eaa89eb8d0f1801354a0805401e517788a8", "http\images\speaker_mute.png")
SHA1("f51068c50c51b838072379c4f190f90dac755e12", "http\images\stop.png")
SHA1("3e1294a0913921075aafcce6bb63cd4bbbd91d25", "http\images\vlc16x16.png")
SHA1("5fbab55edc9d7767da004b00ebc36755579dbc6b", "http\images\volume_down.png")
SHA1("cf7e3d432dbe3b0e93b6c40afc044c8bbf42ab90", "http\images\volume_up.png")
SHA1("2e8cebb96487428319a9e228021d6636384eb12c", "http\images\white.png")
SHA1("64ca244f6a2bbfcb21e39d691a62c7aaf209eb03", "http\images\white_cross_small.png")
SHA1("72975a61c620a2721aab473c1fe8155f609acdac", "http\dialogs\browse")
SHA1("2eb1cb5f490b4b3ad23ea777c050de7460f5c99e", "http\dialogs\footer")
SHA1("31bf2aef57af27e6648b88aeb47d489d42a192c9", "http\dialogs\input")
SHA1("945e2892c85f9a5af308fa34c66ffc28defe2a86", "http\dialogs\main")
SHA1("c95f833c2c968053bd148736fb390722f43ebcf0", "http\dialogs\mosaic")
SHA1("506ad01c06833ec23d2dbb342c96faf29688aa21", "http\dialogs\playlist")
SHA1("4893fad56106f0a5746dca438e7c18a62c1e88c1", "http\dialogs\sout")
SHA1("73284625b01adbd2c47654b547ec53781e1b9a73", "http\dialogs\vlm")

Run, vlc.exe
ERROR_TEST("Running VLC failed.", "Running VLC went okay.")

WINDOW_WAIT("VLC media player")
ERROR_TEST("VLC media player reported an error.", "VLC media player ran fine.")

; Prevent race condition
Sleep 500

FORCE_CLOSE(VLC media player)
ERROR_TEST("Exiting VLC gave an error.", "VLC claimed to exit fine.")

; Prevent race condition
Sleep 500

WIN_EXIST_TEST("VLC media player")

FileAppend, TEST COMPLETE.`n, %OUTPUT%

exit 0
