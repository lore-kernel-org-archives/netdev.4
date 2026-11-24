Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795564800;
	b=IPEvtxwRYgB6V1USQHEc/pHrCIpONfs3sIay/Kjj9C2yXBzOwubvWTTW5LQUDt3CCb3C
	 PwJz7zzgRr5izM9zV8mYpGM2IjlBPzii+xBejUkiWQCIDJ/PUBaFk/9BJaFC81Bh27dpd
	 rjkPHqJyrVNXvuRown7o8UEgVDS0Ab0L+1uLNBaemZY7JL4sc63zNXuZ51Pd5V0ePgyOt
	 upUiCHpV51qaerNYxEku5FfnK9MDDJfsGFzSZhMIxOTE0hQwZ8lb9iRn7efCY5ps2gZ50
	 I4Q3swv3qLksdp5JmM2jADIFCMx9QEg4O14pUM0dpHxqGb6x4sRug2q3L39CUEsrMEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564800;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding:References:X-Mailer;
	bh=erB4Qe3z8ocZhwV/Y5Qg5O/HQBILSjj0JpU3ZgPpR8I=;
	b=zuu7Nzbv3medS3Pmdbwq3fxHuCsiasemKKTmSLsevzR7HQVAn2WQX94x9ur2D7PjwxMy
	 n4Q6Iutf2DRdOEZB7BfsUMJvxHFVtk67aES0VvrgqcHDdloLe5rH0B7y4r/4ybxTKqJ2G
	 RbGacPGdNHmRYAlnlm5KptyxHXEwWIZ1rQ+FhaW+uR2RPq520PueQuQE+oo5AB07GXfX6
	 fuCwKzUZoF22hizJN/gCHgXXb1tSgYEUSG7+Elumhg6HhigEZbHJKHuZ8SH4FYJk+9rjW
	 H9TK3TomrwgeXxIwB3HMDVb/jgT+0Jfq+YEBFsGJg9bHI3WU7RKJmicnQDNvkZAVVgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=IJcj3cUo;
	arc=none smtp.remote-ip=66.163.184.147
Received: from sonic309-21.consmr.mail.ne1.yahoo.com (sonic309-21.consmr.mail.ne1.yahoo.com [66.163.184.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B39606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B39606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=IJcj3cUo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795564798; bh=erB4Qe3z8ocZhwV/Y5Qg5O/HQBILSjj0JpU3ZgPpR8I=; h=Date:To:From:Subject:Content-Type:References:From:Subject:Reply-To:Content-Type; b=IJcj3cUoGFbAUKcu5p/wF/UymXizbpQgkUw+ElqQ1C25tgJzY4Q+ORvtf26+1s/+wh7SUNADAAWsdTRmOUszF8rbd+WAVdSzY78hmsK+bPUKGUUGjqgffnHQEPTvXNgxkeZDV3cd9P02xJs4k332dmUuQd6owjUTIgrNir/s/AMj6J5iyCi3XqjLHctN+d3WMKsj4aJEwDlg7HLw4sGVsBvWYtZWTWk/hA9uIhgAy5e4wW5x2yFzP3/iG0xWpHHWLqMp+90alx8PNGKe6oNGJq3JulsRaTNOyOZS4bOReCFPKX0LWVT5PpYNIWWdwB1YjPeMcfaYIOMxhft2tdU7lA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795564798; bh=OVabeTH1IPukZ1VMH/gV1wC9IW8NdyqtHTnXqFFayE0=; h=X-Sonic-MF:Date:To:From:Subject:From:Subject; b=AjxXgguH1AFgHcnIEbewMHZtmbO9KZ95zKeCpudftPY7zbl/CHmRV2neZuQMcqwmBG+VZLoMtL7LCbPuQ6wfpECnKrJWhvaSe+nkY2aczA3ic8miE2X3D2ZctxqRtF8NnXCKtx+VrQllppFJEFmy/6WE82KqkFtjz8OWsXiS7gffiovhMyC+KdhqxktMcM182sqgry+BHVd/+urVhVQnDuOzrJl/V5kXeu77OQ75iN7o+Q6fwUGtEzWzu5MgiPgdHXkayiiGJq43Y6u6whSOitTag0eHsb7XgpIVcXaqdZqAGNuSORmqXbox9WuTBN6ESYLa5oy0e0Hw25XTpXpy5Q==
X-YMail-OSG: Jplckj4VM1n14azd95yuZpZAep.zITZFFcIJXfKD5CVX0LE44LrcWfOQ2HI0vKe
 g0lKhWncqCCMZ.X03tzuKjsm8JlLBIPf5zX3tGRwNJaHfXGrSKJYiVOyak9xazrxxQI9dBPv5lFg
 avll0VZzcC9RnvME3l6wxMW0Ioca6ZnBSptZlpa569b2DWhg7QN7FQKUZH.VNouwAWHwrpongpgN
 t5K3Zis6QhYcptm7X.UkmIUaIJ13_p5K_1CnFWOPPjPZ56bEm2ogKeXWr8vDWrJdCr_9o6bexFef
 ayoT1Z_sXTT2OiTEFEdWaHuVpZAWffP.JIrw5BJYtBqalE7Cg_3locAO_Ri_KUVdCTCpLp7bXONA
 nlo5YVjarOl7F95U2FhfWLZ_U_Iaj9YqxGxeQDL5_19r3JNDm4XCk0affO8zV1mIkw95paqLw.56
 3LbMyBvHMOFiRKHPCrvUTT3saEmCvwglCunx2gNiu8xvICgYHQcxCXZBx2y_0_hA.Y7psniVw7hd
 KqOs4jfY3o43efB_7o_jRSVsYYAZzdpIDbaAJmS_uCu0jjKK3vgZf2FHeG37lLHXmbZ5gJ6fgCBF
 HaxMm20zbHuJZnVBY7AEj1anNB1_sojdf7yvK5jUc1kxgL_u1xufTFV0mcNsgAnlYhHSi_wslu7B
 TXcUBMXqwx.4yzrMcv6uWVYBZ_YG4LquWSxipqLx3qETKIzGp0_Oi1kQSbHWmgLl2FYIQOXIw6.c
 Qv5Z5tA7UGLf2O3UnACuZElq4OFKHDlQfvkxAdohdpG6k6gum7TMuJCqE4Ju1.GMBPR9051zscGe
 ni1Y98gl8IM3PY5MR1jPGu8rHryDjGa3crXMADYTTaGP9IaAhyvxchJ8B3NbN5KlroQify2cqfV_
 6JJf4g_haw2WyywueFB1wPnauKTg58Sh353e4OfnlPPS2Ecg.0uZaQDW0PF5LtN2BmArgzT2a.B6
 2.jKu8xEdl.A_Z0eis.aCYZKmlnlPBb2AyWMQzWkerQFsIuvSWEkB_4F4NuDs2hk3.KW6VbObvoI
 KMg_cSlF5glnBOAqHBD_2hWT75BF5qOAH.gh75kx5byRi_I2OHztwBmap.3H5GIjbJ5KQ1eTgxx.
 17Y9MCBeK7lA5AatXA599w6hnWMPUzBcMffO9DV6AoadlBHVpN9l0OfSThnfUbVjbdS3yPeZHdT.
 m8dDzzTehphvkWVrQ0d11sTuUaPGaZOn1i0N4pN2KKFNNLPVr9ZdbksT6G_FJcI8vMmtQanLUErV
 JaLw9ZGxNVo5hz0oLROpfyHpQTaEzU47gzh0jHB91zbCODWHFLVURgbIR3Dmen_sd9_HO4w9uGZ0
 GCtqTzU0AkmWeikKUAtwdQstEE7Jk1vWEUyXChuDqA7Wn0QF5R7mk_IOSyjLdMVv9VO_nbSw_pn3
 NT39lx1JYiUFJM2DK5Epq5.YyaslGpAu3rHue05orNqKFz1FPmhuy7TDdoam5hxsZoW7QTeQwE24
 mk6fG31adyzlZY6p3Lode1tyi_tXj40.a1.GYnIdGVFlpwwvIE1wZ2ziepe504TRT2PZjYydvwHF
 aXl28in9PT7UCPwUJUne7RFrP9fbyUrXvskjojJzEZgwNbmTjXPGdyCu2vCRQOq6f3BmNXZPKnWD
 IIaw7gh1TW6FLFVptD0wAx.sqwImaN8pVoN0VUkz65L0g6BryBfCpjCL6ghosQkkz7TFNBM0RMf7
 kNG_sOkfsacXu3GQWG2Axs8g0OJFGRbZJ7rLNzANru.uOf3d_NA.aJXHYMqm4eQK_wFYijkenjwq
 d8jIU71UhSJ6xYHiTKFKyq3q1WIcML0H60g6C1rnKRZ74tA5rsft8NAuIFDyUWWecLs_oaqIYO_9
 Kdb786gk3IH7OnZW_E_Ped0I3P1W5k7BEE5pgzVMl3RFM3.QbNo.4DGPkaDJFSxdNXL6UWYfxYdM
 c2EK_n0t35TMxWnBwKUEHLKwvr6p0p.w_lfDhUQ2hP3T6fVxwvMR6jAOe._EH8lzh48DmDV289sM
 m69hbz2bV5D6LC9eWG76BFCfrNfaDPdPh3t58ILLuzCnzC5eO.SZ_NhJXxbestzWsOOsjbjAw2Vl
 aPrej7olm6_pqby3l2fnmyAaBcn8fvFj5B0teMmpkhdi8aV674AxLlj9hyuGQJ3ssr23sPrEvkG1
 5Nuirv2Jx920fMLrJQ2nJDgymRxmQL_kB9a7xcDaJywe7Js5lWBFXkpicjy0y1E1LR1ZsmhEQ3a2
 9KPyEf_t6gZ3eNlXCDBygYQiq1LoMiQxxI0.iOujoHwbiK21Kv0sEcA8bWNm9d6HTqH1A03PUvHp
 A59mhjRbOeGgTMKpXDItZjSUGp3Sdqw7bfw--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 17fae1fc-e3fe-4a9a-b6c0-ddbce98e8d7f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Tue, 24 Nov 2026 23:59:58 +0000
Received: by hermes--production-ir2-7c4859dc89-vw2vb (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c0893539c9897d5b20d7ea2778c91513;
          Tue, 24 Nov 2026 23:59:56 +0000 (UTC)
Message-ID: <874b29a3-f47f-4bf2-a0f6-2f9fea712f4c@yahoo.com>
Date: Wed, 25 Nov 2026 00:59:52 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: pl
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev,
 o.rempel@pengutronix.de
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Subject: [PATCH net-next v14 00/15] net: dsa: realtek: rtl8365mb: add support
 for RTL8367S-VB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <874b29a3-f47f-4bf2-a0f6-2f9fea712f4c.ref@yahoo.com>
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

This series adds support for the RTL8367S-VB (chip ID 0x6642) to the
rtl8365mb driver. The chip belongs to a new "family D" that differs from
the existing family C in its VLAN and L2 table layouts, speed/RGMII
configuration, SerDes (SDS13) and untagged PCP handling.

Patch 1 documents the chip in the devicetree binding.
Patch 2 adds the chip family infrastructure, with the per-family data
(init jam table) in struct rtl8365mb_family_info (no functional
change).
Patch 3 moves the external interface force-mode configuration behind
the family info (no functional change).
Patches 4-5 add the port speed and RGMII mode configuration for family D.
Patch 6 moves the VLAN 4k table accessors behind the family info (no
functional change).
Patch 7 adds the VLAN 4k table access (dynamically selecting the IVL
learning mode from the filtering state of the user ports for family D
only).
Patch 8 refactors the PVID handling behind the family info (no functional
change).
Patch 9 adds the raw-VID PVID handling for family D.
Patch 10 adds SDS13 PCS support.
Patch 11 refactors the family C L2 MAC handling by introducing shared
pack/unpack helpers and reaching the family C serializers through
function pointers in the family info (no functional change).
Patch 12 makes the L2 (FDB/MDB) table access work on family D, which
has a 5-word entry layout, narrower table access fields and no EFID,
where a VLAN-unaware bridge (VID 0) is isolated in FID 1 using
port-based FID, and where LUT hits outside the ingress isolation mask
fall back to flooding within the isolation mask (0x0A10 bit 0) with
each port included in its own mask.
Patch 13 refactors the QoS priority handling: the conversion between
the traffic types of the shared QoS layer and the chip's priorities, and
the programming of the PCP of untagged frames, move behind hooks in the
family info (no functional change).
Patch 14 numbers the internal priorities like PCP values on family D, as
the vendor API does, so that untagged frames keep PCP 0 and the PCP,
DSCP and port priority tables stay consistent with the traffic type
numbering of the shared QoS layer. Family D has no separate
untagged-PCP register (0x0851-0x0852).
Patch 15 adds the RTL8367S-VB chip table entry. It comes last, so that
no intermediate commit exposes a family D chip with incomplete
handling and the series stays bisectable.

Family C's functional behaviour is unchanged. The L2 table access and
FDB/MDB code is shared; the family D handling is selected at runtime
through the family info and rtl8365mb_is_d() (patch 12), and the QoS
handling through family info hooks only (patches 13 and 14). The RTL8367S-VB
has 8 ports, described by port_mask in its chip info (patch 15). On
family D, FDB/MDB offload is available, but there is no per-bridge EFID.
Instead, port-based FID (FID 1) isolates the offloaded VLAN-unaware
bridge from standalone and software-bridged ports in FID 0, 0x0A10 bit 0
(with self-bits in the port isolation masks) ensures tagged frames on
standalone ports matching an IVL bridge VLAN flood to the CPU instead of
dropping, and only one bridge is offloaded (max_num_bridges = 1).
Further bridges are forwarded in software and isolated by the port
isolation masks only (patch 12).

Tested on a TP-Link Archer AX55 v1 (RTL8367S-VB, CPU port 6 over
HSGMII (2500base-x) to an IPQ5018, with the UNIPHY mode sequence run
at GMAC probe) with bridge VLAN filtering and per-port PVIDs, and in
a reboot loop (16 boots, none broken, with traffic through the CPU
port and no FCS or symbol errors), by Oleg Gavrilov.

Tested on family D by Gustavo Foletto Mora on a TP-Link EX511 v2
(RTL8367S-VB, CPU port 6 over 1G SGMII to an IPQ5018) on a live network,
with a VLAN-aware bridge (tagged trunk with VIDs 10-40, access ports on
VIDs 10 and 20) and a VLAN-unaware one: VLAN table and PVIDs, tagged and
untagged traffic through the CPU port, VLAN isolation, FDB and MDB
entries, VLAN add/delete churn, moving a port to a second bridge,
traffic in the switch and through the CPU port, a conduit down/up and
reboots, with no FCS, symbol, drop, fragment or jabber errors on the
checked ports.

Gustavo Foletto Mora tested the L2/LUT handling with port-based FID
isolation (register readback across live vlan_filtering toggles and
bridge leave, unicast between standalone ports through a VLAN-unaware
bridge) and the lookup-hit isolation fallback (0x0A10) with self-port
isolation masks.

Tested on family D by tutzulyk on a TP-Link Archer AX53 v1 (RTL8367S-VB,
CPU port 6 over HSGMII to an IPQ5018) with a bridge (br-lan, with a
VLAN 99 interface on top) over LAN ports 1 and 4, with several gigabytes
of traffic through the CPU port and no RX/TX errors on the checked ports.

Regression-tested on family C by Stanislaw Pal on a TP-Link Archer AX55
v1 (RTL8367S, CPU port 6 over a 2500base-x fixed link to an IPQ5018),
on a tree that also carries an 802.1Q-based tagger for this switch:
three boots (after sysupgrade, a reboot and a cold start), a further run
of 23 boots (20 reboots, 3 power cycles, none broken, with the UNIPHY
mode sequence run at GMAC probe), and traffic between a LAN client and
an 802.11s mesh in both directions, with no FCS errors, drops or driver
warnings. Family D paths are not exercised on that chip.

Not covered: RGMII, real Wi-Fi stations, flow control on the family D
SerDes port and DCB priority trust on family D. The QoS refactor in
13/15 changes no register values, but has not been retested on
hardware yet.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
v14:
  - 4/15: drop the unused extint variable in
    rtl8365mb_d_ext_config_forcemode(); no functional change, tags kept
  - 7/15: restore the entry whose write failed too when rolling back the
    IVL_EN rewrite in rtl8365mb_d_vlan_4k_set_ivl(), as the write may
    have reached the chip before the error was reported; correct the
    comment on vlan_4k_used (rtl8365mb family D only) (Sashiko)
  - 10/15: say in the commit message that the port 6 rate limiter
    registers were not compared with the vendor RTL8367D API and that
    flow control on the family D SerDes port was not tested (Sashiko)
  - 12/15: in rtl8365mb_port_vlan_filtering(), write PBFIDEN before PBFID
    when VLAN filtering is enabled on a bridged port (PBFID first
    otherwise), as rtl8365mb_port_set_efid() does, so that a port is not
    left learning in FID 0 with port-based FID enabled (Sashiko); note
    that bridges already assigned a number from another switch share
    FID 1; drop the else after return in rtl8365mb_port_set_efid() and
    note in the comments of the family D L2 serializers that an entry
    with IVL=0 and FID 0 is written back with FID 1 (no functional
    change)
  - 13/15 (new): refactor the QoS priority handling behind
    rtl8365mb_family_info hooks (qos_iprio_to_hw, qos_hw_to_iprio,
    qos_set_untag_pcp) instead of rtl8365mb_is_d() checks in
    rtl8365mb_qos.c, like VLAN, PVID and L2; no functional change
    (Oleksij Rempel)
  - 14/15: add the family D implementations of the QoS hooks; say in the
    commit message that DCB priority trust with a non-zero default
    priority was not tested on family D (Sashiko)
  - 15/15: say in the commit message that the common init jam table is
    also applied to family D without comparison with the vendor RTL8367D
    initialization (Sashiko); wire up the family D QoS hooks in
    rtl8365mb_family_d

v13: https://lore.kernel.org/netdev/3f1826f8-3096-40dd-a278-c70fce4852c8@yahoo.com/
  - 7/14: write IVL_EN cleared when a 4K entry loses its last member, so
    that an emptied entry is not left in IVL (Sashiko); move the IVL_EN
    rewrite into rtl8365mb_d_vlan_4k_set_ivl(), which 12/14 also uses on
    its error path; Tested-by from Gustavo Foletto Mora kept after
    retesting the changed scan and empty-entry paths
  - 12/14: comment on the shared vid/fid storage in
    rtl8365mb_d_l2_data_to_mc(); unlike the v12 attempt that took FID 1
    from VLAN 4K entries (which failed for bridges without a PVID),
    isolate the offloaded VLAN-unaware bridge from standalone ports using
    family D's per-port PBFID registers (0x07AC / 0x07AD + port, assigning
    FID 1 to VLAN-unaware bridge ports and serializing VID 0 entries with
    FID 1), keeping standalone ports in FID 0; set 0x0A10 bit 0 and
    include each port in its own isolation mask on family D so tagged
    frames on standalone ports matching an IVL bridge VLAN reach the CPU
    instead of dropping; if programming the port-based FID fails in
    rtl8365mb_port_vlan_filtering(), restore IVL_EN through
    rtl8365mb_d_vlan_4k_set_ivl(); drop the Tested-by tags of Stanislaw
    Pal and Oleg Gavrilov on 12/14 as the L2/bridge FID path changed;
    Tested-by from Gustavo Foletto Mora kept after retesting
  - 13/14 (new): number family D internal priorities like PCP values, as
    the vendor API does, converting from traffic types at the register
    boundary, so untagged frames keep PCP 0 (reported and tested by
    Gustavo Foletto Mora)
  - 14/14: patch text is unchanged, but chip behavior changed through
    12/14 and 13/14; Gustavo reconfirmed his tag on the full series;
    Linus, Oleg, please reconfirm yours

v12: https://lore.kernel.org/netdev/bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com/
  - rebased on the current net-next, which describes the available ports
    with port_mask in struct rtl8365mb_chip_info
  - 2/13, 3/13: drop num_ports from struct rtl8365mb_family_info and
    the num_ports use in rtl8365mb_detect(), as the ports are now
    described by port_mask; reword the commit message
  - 7/13: track the active 4K VLAN entries in a vlan_4k_used bitmap, so
    rtl8365mb_d_vlan_4k_refresh_ivl() visits only the entries in use
    instead of all 4094 VIDs (about 5 s per vlan_filtering toggle before,
    20-30 ms with the bitmap, measured by Gustavo Foletto Mora); if
    rewriting IVL_EN fails midway, restore the entries already rewritten
    (best effort); the Reviewed-by and Tested-by tags stay dropped, as
    the update code changed; entries that were already in the table
    before the driver loaded are not visited
  - 8/13: reword the comment on the family C PVID reset: family C is left
    as it was before family D support, its PVID registers are not
    touched at setup
  - 9/13: add the missing kernel-doc markers and parameter descriptions
    to rtl8365mb_d_vlan_port_get_pvid(), rtl8365mb_d_vlan_pvid_port_set()
    and rtl8365mb_d_vlan_pvid_port_clear(); reword the comment in
    rtl8365mb_vlan_setup(), as the PVID is only reset where the chip
    needs it
  - 10/13: clarify the comment on RTL8365MB_BYPASS_LINE_RATE_REG for
    family D (port 5 is not an external port on the RTL8367S-VB), and
    state in the commit message that the register layout is the same as
    in the vendor RTL8367D API
  - 12/13: fix the max_num_bridges comment and commit message (a bridge
    that already has a number from another switch can still be offloaded
    here), mention static multicast entries in the FID 0 paragraph, and
    explain why a per-bridge FID from the VLAN 4K entries does not help.
    Giving the offloaded bridge its own FID (FID 1) was tried and
    dropped: it only works for bridges whose ports have a PVID, i.e. a
    VLAN 4K entry carrying the FID. A bridge without VLANs (the default
    br-lan) is classified into FID 0, so the static entries written with
    FID 1 no longer match what it learns, and with fdb_isolation the
    standalone ports' host entries in FID 0 shadow its traffic. FID 0
    stays shared as described in the commit message, which is a known
    limitation of the chip without EFID
  - 13/13: describe the ports of the RTL8367S-VB with .port_mask instead
    of a family D port count and set .num_tx_queues, as required after
    the rebase; reword the commit message, which now says that the init
    jam table is the RTL8367C one and has not been compared with the
    vendor RTL8367D initialization; num_tx_queues is 8 as for the other
    chips and has not been checked against the family D vendor code

v11: https://lore.kernel.org/netdev/cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com/
  - 7/13: add rtl8365mb_d_vlan_4k_refresh_ivl() to update IVL_EN across
    active 4K VLAN entries when a vlan_filtering change flips the
    switch-wide filtering state; drop Reviewed-by and Tested-by tags as
    this adds a new scan path
  - 8/13 (new): move the PVID get/reset/set/clear helpers behind struct
    rtl8365mb_family_info, the existing code becoming the family C
    implementation; no functional change (Luiz)
  - 9/13: add the family D PVID get/reset/set/clear implementations and
    call vlan_port_reset_pvid() through struct rtl8365mb_family_info
    instead of using an rtl8365mb_is_d() check; drop Reviewed-by and
    Tested-by tags as the PVID path was reworked
  - 10/13: note in a comment that the DW8051 reset/enable bits in
    CHIP_RESET and MISC_CFG0 are identical on family D in the vendor SDK
  - 12/13: clarify in the comment on max_num_bridges = 1 that DSA
    allocates bridge numbers system-wide
  - 13/13: wire up the family D PVID callbacks in rtl8365mb_family_d,
    make rtl8365mb_d_ext_config_forcemode() static and drop its
    declaration from rtl8365mb.h
  - Added a test report from tutzulyk on family D (RTL8367S-VB); no
    Tested-by tag, as no real name and e-mail were provided
  - Added a new family C regression run from Stanislaw Pal (Archer AX55
    v1, RTL8367S): 23 boots, none broken
  - Added Tested-by from Oleg Gavrilov on 2-4, 6 and 10-13 (family D,
    Archer AX55 v1, RTL8367S-VB, 2500base-x): 16 of 16 good boots
  - Dropped Tested-by from Stanislaw Pal on 3 and 6, as these patches
    were added after his test

v10: https://lore.kernel.org/netdev/d9da17af-f49e-4878-a8dd-59a8919e6930@yahoo.com/
  - 8/11 of v9 (SerDes re-latch): dropped. Johan Alvarado traced the
    symptom to the SoC side: the bootloader hands the UNIPHY over in SGMII
    and the out-of-tree qca-uniphy PCS programs SGMII+ only from
    pcs_config() at the first open of the conduit, about two seconds after
    the switch brought its SerDes up in HSGMII at DSA setup, so the switch
    receiver trains against the wrong line rate. Running the UNIPHY mode
    sequence at GMAC probe, before the switch probes, fixes it with no
    change in rtl8365mb (0 of 32 broken boots, versus 18 of 51). As neither
    dwmac-ipq5018 nor pcs-qca-uniphy is in mainline, the workqueue, the
    extra locks and the reboot notifier are not needed in this driver
    (Johan, Alvin)
  - 2/12: say "family-specific" in the comment on the init jam table
  - 3/12 (new): move ext_config_forcemode() behind struct
    rtl8365mb_family_info, the existing code becoming the family C
    implementation; no functional change (Alvin)
  - 4/12: only add the family D force-mode implementation, instead of
    is_d() branches in the shared code; no functional change; say in the
    commit message why the function is not static until the last patch
  - 5/12: log an error instead of a warning when RGMII is not available
    on port 7, and say in the commit message that port 7 then has no
    supported interface
  - 6/12 (new): move the VLAN 4k table accessors behind struct
    rtl8365mb_family_info, the existing code becoming the family C
    implementation; no functional change (Alvin)
  - 7/12: only add the family D VLAN 4k accessors, instead of is_d()
    branches in the shared code; on family D enable IVL while any user
    port has VLAN filtering enabled, independent of the port being
    configured (so the CPU port cannot reset it); document that IVL_EN
    (bit 3, versus bit 14 on family C) is refreshed on the next
    port_vlan_add/del of the VID, not on a vlan_filtering change; say in
    the commit message why the accessors are not static until the last
    patch
  - 9/12: do not advertise 10 and 100 Mbit/s on the family D SerDes port,
    as no SerDes rate is programmed for them
  - 11/12: do not delete a dynamic unicast entry on family D; correct the
    commit message about standalone ports (DSA programs no entries for
    them without fdb_isolation) and describe that FID 0 is shared; name
    the vendor function that writes the LUT aging value
    (dal_rtl8367d_l2_init); say in the commit message why the family D
    functions are not static until the last patch
  - 2/12 and 12/12: restored Reviewed-by from Linus, reconfirmed on the
    list after v9

v9: https://lore.kernel.org/netdev/9b73858d-fc09-4988-8bab-fd7b88db9412@yahoo.com/
  - 2/11: add struct rtl8365mb_family_info holding per-family data
    (port count, init jam table); use num_ports from it in
    rtl8365mb_detect(); rename the port count constant to
    RTL8365MB_C_MAX_NUM_PORTS (Alvin)
  - 3/11: drop the FORCE_SPEED_WIDTH macro and add a mask for the most
    significant speed bit (Alvin)
  - 5/11: restructure the family D checks when unpacking the untag
    field; no functional change
  - 7/11: update the kernel-doc of sds_supported and the commit message
    for family D always setting it; note in a comment that the register
    and field names follow the vendor API
  - 8/11:
    - use explicit mutex_lock()/mutex_unlock() instead of
      guard(mutex); no functional change
    - arm the re-latch only for 2500base-x on a CPU port, and say
      so in the commit message; ignore conduit state changes of other
      switches in the tree
  - 9/11: reach the family C L2 serialisers and entry size through
    function pointers in the family info (Alvin)
  - 10/11:
    - add the family D L2 serialisers to the family info, drop
      RTL8365MB_D_L2_MAX_PORT and the port checks, as the core never
      passes a port above num_ports - 1 (Alvin)
    - use an SVL key (IVL=0, FID=0) for VID 0, so static unicast
      and multicast entries match the learned ones in a VLAN-unaware
      bridge; they were written with IVL set and never replaced the
      learned entries (reported and tested by Gustavo Foletto Mora)
    - offload only one bridge on family D (max_num_bridges = 1),
      as the LUT cannot tell bridges apart without EFID; further bridges
      fall back to software forwarding
    - do not delete a unicast entry on family D if the entry
      found belongs to another port; update the l2_lock and EFID
      comments; note that the LUT aging value is undocumented
  - 11/11: describe the 8 ports of the RTL8367S-VB in its family info
    instead of a family check in rtl8365mb_detect(); mention the L2/LUT
    and table access differences in the family D overview comment
  - Dropped the Reviewed-by tags of Linus and Luiz from 2/11 and the
    one of Linus from 11/11, as these patches changed substantially.
    Linus, Luiz, could you please take another look? Tags on the other
    patches are unchanged.
  - Added Tested-by tags: Gustavo Foletto Mora on 2, 3, 5, 6, 7, 9, 10,
    11 and Stanislaw Pal on 2, 3, 7, 8, 9, 10

v8: https://lore.kernel.org/netdev/08611959-c555-46d9-8e7e-20b85d0c4056@yahoo.com/
  - 2/11: declare the rtl8365mb_is_d() helper as a global inline function
    in the new header
  - 9/10: split into two patches to improve structure and address reviewer
    comments:
    - 9/11 (new): introduce shared MAC pack/unpack helpers and refactor
      family C serializers without functional changes
    - 10/11: drop the confusing _any() suffixes in favor of clean
      symmetric dispatchers, switch to the global rtl8365mb_is_d() helper,
      and fix the memset size in family D serializers

v7: https://lore.kernel.org/netdev/3bf4dd70-9771-497b-8c27-e925e0ef81eb@yahoo.com/
  - 3/10, 6/10: note that the family D path is unreachable until the last
    patch
  - 4/10: program EXT_TXC_DLY, the pin mux and the SerDes 1 disable
    before selecting RGMII; warn when RGMII is disabled because MAC4 owns
    EXT1
  - 8/10: act only on the conduit of the CPU port that carries the
    SerDes; queue the work with schedule_delayed_work() and rename the
    devres action to rtl8365mb_sds_relatch_disable()
  - 9/10: new, make L2/LUT access work on family D (5-word entries,
    narrower table access fields, LUT init, no FDB isolation)
  - 10/10: update the NET_DSA_REALTEK_RTL8365MB help text

v6: https://lore.kernel.org/netdev/5a4715dd-89e0-4868-9ffb-c8fb73b18d04@yahoo.com/
  - 4/9: do not advertise RGMII for port 7 when MAC4 owns EXT1, instead
    of returning -EBUSY from mac_config(), which phylink ignores
  - 5/9: take IVL_EN from vlan4k->ivl_en and leave SVLAN_CHK_IVL_SVL at
    0, as the vendor API does
  - 7/9: pcs_get_state(): keep phylink's speed and duplex for SGMII and
    never report the link up with an unknown speed
  - 8/9: start the re-latch work when the conduit comes up and stop it
    when it goes down (.conduit_state_change); serialize it against
    pcs_config() with sds_cfg_lock; disable it for good on shutdown and
    unbind

v5: https://lore.kernel.org/netdev/aa5fa12c-e43e-4e5e-9f77-c6eaf477abc4@yahoo.com/
  - 1/9: fix the subject
  - 4/9: refuse RGMII on EXT1 with -EBUSY when it is owned by MAC4,
    before touching any EXT1 register
  - 5/9: drop the unverified rationale for forcing SVLAN_CHK_IVL_SVL, say
    that the vendor API leaves it at 0, and note that the family D paths
    are not reachable until the last patch
  - 6/9: init prev_accepted_frame to avoid a maybe-uninitialized warning
  - 7/9: comment the write of the whole RX disable field, as in the vendor
    sequence; fix two comments that still credit pcs_link_up() on family D
  - 8/9: cancel the re-latch work from a reboot notifier instead of
    checking the driver data; fix the RESTORE_TRIES comment and do not
    sleep after the last failed restore attempt
  - 9/9: fix the description of the external interface indices. The v4
    changelog said that only HSGMII is exposed; that was wrong, SGMII is
    still exposed

v4: https://lore.kernel.org/netdev/38872e6f-1264-4a93-9f81-8212173e909d@yahoo.com/
  - 1/9: reword the commit message (support is added by the series)
  - 3/9: document the per-port force enable register
  - 5/9: document both forced IVL bits, update stale comments
  - 6/9: clear the family D PVID registers at setup
  - 7/9: do not override the forced SGMII speed in pcs_get_state(),
    update stale comments, note that the patch is preparatory
  - 8/9: remember a failed restore and retry it first; stop the work
    after shutdown (driver data cleared)
  - 9/9: expose HSGMII only on the SerDes port, update the SerDes
    interface comment

v3: https://lore.kernel.org/netdev/e84d76ee-03df-49b0-8c9a-b289dfae8728@yahoo.com/
  - add a dt-bindings patch (1/9): RTL8367S-VB listed under
    realtek,rtl8365mb
  - add chip family infrastructure as its own patch (2/9), no
    functional change
  - squash the family D PVID getter and the PVID set/clear patches
    into one (6/9), so the read and write paths use the same register
    layout at every point of the series
  - add the RTL8367S-VB chip table entry last (9/9), after the family
    D speed, RGMII, VLAN and PCS support, so no intermediate commit
    can reach the chip with incomplete handling (reported by the
    automated review)
  - 6/9: fix the commit message (port p's write lands in port p >> 1)
    and update the stale kernel-doc and file comments
  - 8/9: start the re-latch work only for 2500base-x, cancel it from
    .pcs_disable, from pcs_config() and via a devres action; retry the
    SDS_MISC restore and come back soon if it fails; rewrite the
    commit message to match the code (reported by the automated
    review)
  - 9/9: document family D in the file header comment and in the
    learn limit comment (limit confirmed against the Realtek vendor
    API)

v2: https://lore.kernel.org/netdev/28382f3f-03c1-4606-9b11-86f118abeafe@yahoo.com/
  - 2/8: mask r_speed to the width of the FORCE_SPEED field before passing
    it to FIELD_PREP(), so that the family D 2500M value (5) cannot trip
    the compile-time range check; bit 2 still goes to FORCE_SPEED2
    (reported by the automated review).
  - 4/8: the commit message now explains why EXT_TXC_DLY[5:3] is cleared
    for RGMII on EXT1: the vendor RGMII setup does it, and the init jam
    table leaves the field at 2, which would add an extra TX delay on top
    of tx-internal-delay-ps. Add a comment describing the EXT_TXC_DLY
    layout (Andrew Lunn's review).
  - 8/8: document the new struct rtl8365mb members in the kernel-doc
    comment (sds_lock, sds_relatch, sds_relatch_count,
    sds_misc_target_val), which fixes the kernel-doc warnings.
  - 1/8, 3/8, 5/8, 6/8, 7/8: no changes.

v1: https://lore.kernel.org/netdev/84fc7483-b22d-45ea-a3b8-3285dc357265@yahoo.com/

Mieczyslaw Nalewaj (15):
  dt-bindings: net: dsa: realtek: add RTL8367S-VB
  net: dsa: realtek: rtl8365mb: add chip family infrastructure
  net: dsa: realtek: rtl8365mb: refactor forcemode handling
  net: dsa: realtek: rtl8365mb: set speed for family D
  net: dsa: realtek: rtl8365mb: set RGMII mode for family D
  net: dsa: realtek: rtl8365mb: refactor VLAN 4k handling
  net: dsa: realtek: rtl8365mb: set and get vlan 4k for family D
  net: dsa: realtek: rtl8365mb: refactor PVID handling
  net: dsa: realtek: rtl8365mb: use raw VID for PVID on family D
  net: dsa: realtek: rtl8365mb: add family D SDS13 PCS support
  net: dsa: realtek: rtl8365mb: refactor L2 MAC handling
  net: dsa: realtek: rtl8365mb: make L2/LUT access work on family D
  net: dsa: realtek: rtl8365mb: refactor QoS priority handling
  net: dsa: realtek: rtl8365mb: use PCP numbering on family D
  net: dsa: realtek: rtl8365mb: add support for RTL8367S-VB

 .../devicetree/bindings/net/dsa/realtek.yaml  |   2 +-
 drivers/net/dsa/realtek/Kconfig               |   3 +-
 drivers/net/dsa/realtek/realtek.h             |  12 +-
 drivers/net/dsa/realtek/rtl8365mb.h           |  55 ++
 drivers/net/dsa/realtek/rtl8365mb_l2.c        | 269 ++++--
 drivers/net/dsa/realtek/rtl8365mb_l2.h        |  21 +
 drivers/net/dsa/realtek/rtl8365mb_main.c      | 821 +++++++++++++++---
 drivers/net/dsa/realtek/rtl8365mb_qos.c       | 134 ++-
 drivers/net/dsa/realtek/rtl8365mb_qos.h       |  10 +
 drivers/net/dsa/realtek/rtl8365mb_table.c     |  44 +-
 drivers/net/dsa/realtek/rtl8365mb_vlan.c      | 508 ++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_vlan.h      |  28 +
 drivers/net/dsa/realtek/rtl83xx.c             |   5 +-
 13 files changed, 1683 insertions(+), 229 deletions(-)
 create mode 100644 drivers/net/dsa/realtek/rtl8365mb.h

-- 
2.53.0

