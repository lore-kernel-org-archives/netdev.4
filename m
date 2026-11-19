Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.187.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132679;
	b=aCyGlJutQaAvl/ZcH4Ukpif75LaTAmIRqj8ihSvTO9lh7aGSI+tJ+GCevcTNp0uPRS/Q
	 fbYCJLzLnXTnCKOrF+MyvFsjfyTjF2Y8vX1Fi5quzwRFBbSgXMIETv/qPOmmaTB+viCAF
	 la5V2bhXcbLn9cYrKh/bIROITyedfyvvxbzbJkQvRGZDSOlUp/fko/XUfaG9t6iwneUUv
	 gSzHOUmsPMKNcmEZC/PfSsy4tqV1b+UoIwyqzKIt5D2MR1pKPeaTRglsLD5d9d5Dr3yYj
	 uc1jeAIp6c9phgEril+cNdws7ZaRX4BpdL3sCSEEQQ1kTQEfe7/YuPtEwLLw4onWxCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132679;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding:References:X-Mailer;
	bh=fuli+aAHfL21kbauyrx1ZelK9R7iMSU5OqqGpHlUue8=;
	b=5GmZLvzXYgVaY11lfhYMpMfYCAV5wpfoamzMu38CV4uaZPAKH1qDfkIoS2U/LZKtM1+J
	 A6t1XoDwHErwkG4BFW0/owc8DkXf58eE6ObaW9Sk6Izyqd04oaErAexFmmlPgVbdsq8yY
	 +ojlIvv8IH+1UNU3yw7Ly0KitjfYZBFV4mgZOhJkjhKSNeKm/cGQNID2OCd3vj2vESrre
	 K3RourYivjquh7VNmLKLv6JIW6iWK8foyCnAegiqE8kYSc2NyaH6YhE+RwUpxRc4qtsBR
	 BJBtIALyJQB7RTJkN36Vov1lOILuJmaIj+qfCwXZZ9S1mVqFwU8oChvzGehKI6reXTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=SQQSfEy2;
	arc=none smtp.remote-ip=66.163.187.147
Received: from sonic316-21.consmr.mail.ne1.yahoo.com (sonic316-21.consmr.mail.ne1.yahoo.com [66.163.187.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D5B606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D5B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=SQQSfEy2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795132676; bh=fuli+aAHfL21kbauyrx1ZelK9R7iMSU5OqqGpHlUue8=; h=Date:To:From:Subject:Content-Type:References:From:Subject:Reply-To:Content-Type; b=SQQSfEy2znQycZjNPrSQMQpMdkGKE34DyRXzBzz7rijX7WVKt//PvyjP156leET/vCK5+j4BwggHn2H/69fRmpyF2ibpBj5yjFiJVsKcSpS51QYmrYEe+DoODFDCULEJmSfUWE/LAVykb2hoacO6uS0Cu6q77z1Ss2fy9/HR6Hb3JvLTIhgC8wfD27Usxj5KR+ArkRFmg3DuVZjxn2xD3tP5OGNxZYAgSNezpEufCvTAcY61MptK8SJHGtX4W6d8BDWpNgKtyzek9Yd9UPVtn6oLJX7eZ1sJqX7Mpf4ehEAXB5kzf/xXYVk4eUvKPw5zcVon9B5ZPIqPXpV8dipJyg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795132676; bh=quAMboDhUzWdkdUN7+5P7IKJk2VgBp9Tlpw5Sx1MCGW=; h=X-Sonic-MF:Date:To:From:Subject:From:Subject; b=OsAd22tudQzn12YXdAYpruk5pHUxDsXYSKyGBlMxH/1us4jy6S4CMCv7SxdclIM6EPp/nbXohDXhRXcD7gqAE5SwrhCDQ0VyF3vE0ZT9OTR8Hw7Q+tf+k3XJoy6OHIALVbDHa9mlHDYRtAV1/K6QLfp00oQ08Si3AP2/WGxy/fmm/a4jEbAtJfwKTnZ8FtarSzlLwZ+Zht6cbrsicxrpYIJ7HnbdH/uMsLP42EOIbzlP8m6/NqViYHsDuvfRR5XlHPz3Yb+VrXgH2T+9GSJaUAsrbBSqi3S4jAYnVc4Q+1SCLNifLDn/0cRGQXMwy5MKWkpKYrBMgj+Er6VEsfyoKw==
X-YMail-OSG: pj8tZXwVM1luIbCOdR9crRgDApx2Mo1IOmAf_Fun5lRXnTfcUaPhaxAwslEV.8u
 5QUoAwM049fZs0rR_sCMHtycZ67WaGj4Fic3Dfw7j0YyKM6pfVD_mZXoEjT4funrmJDkcFTRIVWq
 jjxTNzB2v7M8xY3RfzWhohbPh_Ge9Oph2yvfeaj81_OGyJIiWmlPVOwMb4YaXRRMOYSQ5u8MKC95
 99RfZOBKJm1Tk0ToYMzn.fJQmus4x6aIdUvrIgW7gX9a1pBeAMCD1_HtWp_qWPPK8yWYhT5PfAXn
 dOI_vZbmauQXSDTgTFD5Vk_3At57ILSy3cV1ORa5JRHR6gpeSbAkhtgTaXIAuyCLz8KFKsufUiTb
 h4C6NXTLFdnum7WHOrNBaIxShF9KA8WMcDEpcyA1PDh7YusLKoeKcI.VuXv8y546If13_79co7bL
 QYqPsmnSiyWmSaV.JwCZS_egenDhsV5qw4g7fWl_WtdSDTfDY07qn4oNjuhrlPDgsnmQ0nPBx3im
 HVyLMKrqiJ1gF82gRnkDon3aECLRrNlI6KIW_tIKX1RA9iuo7wS8XtcBMQ6e15xo1vyNk1hIP.hz
 wJHCQDg9gTSeKj5sPXJQxlOPvinGXF.DB4L25nZytqrC1iJVUChCwjWKwUl87QZuU_DLSXSWQtVR
 KA.wnTvawdgjyFHK8UQOvOJXUJROO.6JSXFG9tl6icfYawa.pKRKvSGpVHJjk6b_IvajRcH6.WtE
 Rr7fecNNuU8B7Ya9JoHYwV2rq3FovmTvloMkstPzLSWbDAWJKMPlldS_gpAx9p5SxnQTcutuAQCb
 hE4DvuZqVNP9HiKJtpF8iPddhL.R6wR98o.u7EDZl6HU9O1ZvRU_QqCCoELjrOeunQJp3FjaiOkW
 i_jVk7zIz4ETWuEtDW7UT6ajWOqoUXaV7uWdqEZLDjXTyUyg6X3U4WsO.qNO_ASD.uJVZZ6Cd.cS
 I0.k0tjpHy87q2wl_1EuebI8.C.hEgrffec1g5MNBuJpsawXweppihI1jRFIhmlbyFir4nCjOwuG
 r6qvSB1Wm3YbXPfWtdm7NtTpRakIOdA3oI7RE73E59IwnieLshp8fKhEMzK5HX.5tJ_UCPlW8y2m
 UY_hzazDthJnnz4moK0csEPTuMYHckQ4vFcdtHlDhxefb97JbJKJSu3D8S87mmlEzVGcJsrbQ9.H
 0PfPjuiJuZQqHlB62BEmqLQr6rHOAwi7Ii4zSw.TBQvXIBfgd8BGSbAOudLX.QfABl5rKYhqHRUE
 7PffgfyOQ.S1BZJjDVZTcY2qNe5vHEZWV.arimqeiOoKgRt0Z_3ZqILbtqkw1fEstKPB5kb9Db5L
 iYwi2ym9QJsrw3ZAWgtg2zeEQ3_1uyN6OU4KTSX_ErYWar0C1MVyWHUo0mqTTYZR6Ov57iAk8wxl
 2E6dMPsZney9MBTZVTxmvGby3WImSlN4dBfz45eHryCZ1_SqT4mgrmL2aM4_pS4PvxC6YqXfOPda
 Kn0iKVPdRCES_mb99haQ_g8DwEKzq851pkWUUBj.VDdfImM0kDEzzWJXB9_5L4EpGqW..8t40__K
 dR0DsOptE2z.5u.mGRJ9XMC8GARoeKUgwvi0jfYnoI.JE0GyI93n9HlbegZ2r8.qWFfpYsqOdp.h
 BFBagZCF8hTHUp7.tLeqK8OIfv80R8.m8FbTWbxS2haFEMhmBGSrIYz3_4PbkUSZ1g3mUFTwV5bd
 2fnigL_bGGV.NZJ2EXM8uZqnvAm5jgzGQZcn8T9yIukKW440zWfZqeYq9N4TybiD5nl2m4bCvKAM
 zOGVI2Gpi7pCDxnBJx8keD.b9sPEEnoHnMuhngaA6_IRt8e_tKrutMEk5xzOSQKt.X0iPuSl90_p
 q.q41_ghwJ60.Ds79GFA1oM6FH3i6bChHCFIfM5xKWEnsjj.q.bHzoMpH3THZz3tuV8mOLni2D9T
 4sNQlN7uecgLnUVSSIjy67cWfUrEkoiqrbLU3SSYmhuthcyUVd7koEl8ED7NhJe23rndeCTVMxkG
 KCCDrWGB9cZfZaukfWfKHCy3cAJIeRcus57LEP_k_dGHSLsfyYn64Z31NsU_Gm9oLZcUhGpKaNRj
 bz5dpwr3N7qqh0jxEpNxQAeumc.JHi_nEBxs1mowSLA0SRsx3h5JRlb4iDdpxVgkSTaPV4v1YlUE
 woZQCmd0fzxUITRBv1Bo0SOff7mOcRddhMAlBoNgIrFNJBTJ4_jAAY8rnFq1eAU.WDf21D.H1IML
 kZYF8wzQMOdE11KHbhrHD1lx42cISSdrXVBpwQyoE0EMU6ZMVgtbbNL4OB5Cc6d6ZUAOiO6ScHem
 GAvdsmd59.M3atqLq5KRkGM.kwET4ZVrrPucmIA--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: c6b65c47-6f5a-4672-919e-0fffd66226e5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Thu, 19 Nov 2026 23:57:56 +0000
Received: by hermes--production-bf1-8768df57c-fhgrb (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 46488d8321935bdbf1f5e556c62842ac;
          Thu, 19 Nov 2026 23:57:54 +0000 (UTC)
Message-ID: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
Date: Fri, 20 Nov 2026 00:57:48 +0100
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
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Subject: [PATCH net-next v12 00/13] net: dsa: realtek: rtl8365mb: add support
 for RTL8367S-VB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce.ref@yahoo.com>
X-Mailer: WebService/1.1.27079 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

This series adds support for the RTL8367S-VB (chip ID 0x6642) to the
rtl8365mb driver. The chip belongs to a new "family D" that differs from
the existing family C in its VLAN and L2 table layouts, speed/RGMII
configuration and SerDes (SDS13) handling.

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
and where a VLAN-unaware bridge (VID 0) is handled with an SVL key.
Patch 13 adds the RTL8367S-VB chip table entry. It comes last, so that
no intermediate commit exposes a family D chip with incomplete
handling and the series stays bisectable.

Family C's functional behaviour is unchanged. The L2 table access and
FDB/MDB code is shared; the family D handling is selected at runtime
through the family info and rtl8365mb_is_d() (patch 12). The RTL8367S-VB
has 8 ports, described by port_mask in its chip info (patch 13). On
family D, FDB/MDB offload is available, but there is no per-bridge FDB
isolation (no EFID), so only one bridge is offloaded
(max_num_bridges = 1). Further bridges are forwarded in software and
isolated by the port isolation masks only (patch 12). Standalone ports,
software-bridged ports and the offloaded VLAN-unaware bridge share FID 0
in the LUT.

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

Not covered: RGMII and real Wi-Fi stations.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
v12:
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

Mieczyslaw Nalewaj (13):
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
  net: dsa: realtek: rtl8365mb: add support for RTL8367S-VB

 .../devicetree/bindings/net/dsa/realtek.yaml  |   2 +-
 drivers/net/dsa/realtek/Kconfig               |   3 +-
 drivers/net/dsa/realtek/realtek.h             |  11 +-
 drivers/net/dsa/realtek/rtl8365mb.h           |  51 ++
 drivers/net/dsa/realtek/rtl8365mb_l2.c        | 251 +++++--
 drivers/net/dsa/realtek/rtl8365mb_l2.h        |  18 +
 drivers/net/dsa/realtek/rtl8365mb_main.c      | 676 +++++++++++++++---
 drivers/net/dsa/realtek/rtl8365mb_table.c     |  44 +-
 drivers/net/dsa/realtek/rtl8365mb_vlan.c      | 488 ++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_vlan.h      |  26 +
 drivers/net/dsa/realtek/rtl83xx.c             |   5 +-
 11 files changed, 1370 insertions(+), 205 deletions(-)
 create mode 100644 drivers/net/dsa/realtek/rtl8365mb.h

-- 
2.53.0

