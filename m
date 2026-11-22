Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.191.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340619;
	b=h49PSRz/GXC6BZJEG2TvmMofRFhtudqbESeNDl3KiMd3B7DKoDs+ww+oU8FE/l1n2lqX
	 uGAYFdkXl+SoEgf77FYt3Cr3zz3tEscx+DEnHoHk4xIW1pxtyXR33caBgKVc88k5Edeej
	 F5Qw6Q/1OSz9SBOYOGlUr+on8iQ97We+rHHaJUYkfwtdVlQfquqEMUEnkmkWlfEBpHiZW
	 vbqVSiqxmXBhCO1RqxdcDU4ZnCbui9iUf6YW4FVzdawqJCRXvb6U3brbGmh8gNkdxbfyY
	 YBdPm5YPdFGyXfb2j+4dKZY78dOO5eKosTBY6TFd14PH6os0CU1rYOK0Yw8z+p+Tw1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340619;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=Y4UMlhJ2lWiRHizIFDajaPW2KlFutETR9ObznFogBUw=;
	b=YZXQi2UOyzHBzfJF9Doyw1SO2Y04DsX9EN0MH8CtjAMOXb2Ffe5pxdbLnAc3hpPaGwpw
	 dFq5YzmjKWlW5ihMxvhChjchBoZ7JpSWjGsg5/0Lb9C5Lc5/gYsGDwDkStG8ZT77EV7pj
	 8chMTPpXLgCelG2H3OzKk0JTZagXWxOgUDhEoznDX7G4lo3QpxS/cB1mBgm0AmngyN7Wq
	 msuqJDn21jajt7Esg4kV1ETk/5Uwes8B5d3AUHRMmAKo33efG8Gj7wf6vBZcLxnEOZ60I
	 9le7CkOf4/RBG7wKIZbR94IEb4jFiTVYI43+LIcUuV28TINwEL30NEDGzS7PPqFjeaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=VqCtsJ7T;
	arc=none smtp.remote-ip=66.163.191.204
Received: from sonic312-23.consmr.mail.ne1.yahoo.com (sonic312-23.consmr.mail.ne1.yahoo.com [66.163.191.204])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29433606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29433606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=VqCtsJ7T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340618; bh=Y4UMlhJ2lWiRHizIFDajaPW2KlFutETR9ObznFogBUw=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=VqCtsJ7T13a2gnu5hgNcNji83O9oG9bp0MR7IrtuGUGe/AS+eW4zp3Dp0pLYfWFsVaa2P8aXsD6pMyOXS1cgxMKuxvhxAFLFsG7NDlClIsuXTCJiTDJ2TccF7TXtIi64tcvRwha2eBMfhm/NONrlBZC5PvF02Qb1kDuHJrWMr0mP3tUjwY+iSzT5Sl2pOJdj1e8TX8QzS3ZjBdfJioKR8QLOqooCxwQJr9imCDyTbZzLeTd7QAs/96TkQfTzabbGHpWjtdRGtu4az97HqDoSc9j64vsJmmHVw0sH26ODQyq6tIcQJAjgFnn/yVRshPBc0ZWG7tAEJ2mF3yjPy+gr3g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340618; bh=/00I2AgU/BN1EYQYHB5LlbNsAndQ6oH4lj7Tkg89KkI=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=eRfFXZ8UcjU8VRPm7jYdunzqTtk+k2tjNFi3adHMrzIrqwUCAAXz+tFqtrwlrYllsj6nYZSekGd5YVxMQkH4eKbNrRuiWLmHNuefvop8CvP6qUBk6+uzhMilI+oAU+cV0N4JQ+ylIwxMQsBJCRfLCAqwiiijA0oZ/Bl+WsnIlrnZySMt2zvDQ+/yroKe6sa32Z73WeQe49eliTCG+9ziM+Mxq6a/UR0HRNfxv7FgRDMknJGi6pnuw+EYZe7KUGjFudvB0MFPprdwCZwedC6pY1hyqY7Ov1fo3pfoPTh9LXgShy01XsdwHYsXCZCKEenYABsRBW/UDVLmbzY+DBwXmA==
X-YMail-OSG: 7q1CTzEVM1ncwH7Np3oqTFap6PbrBXh_L5L3PaknI82mxIrvSSXw3ce0wc8SvAk
 54DrQluJyEYHN0Sf3Icg48KgnFzRaK5EM_Khg9KO61RyZAiIvuodtwUbjd2soAFOWxdURwfmfQRs
 KyD0sGRNOx0tOI5VsJVE2.gSAVnEVIV8_jAbfm310atYw0jKEJVAZOm3ZH.o_U3Ow65F.YbrVecR
 A7yJVsMAcDniEOHT2XmQwZkaSrCtUgay4EqhswR125Su9u1tAmweX2wC1JzUhr1YuSub.VFiXMm8
 _oMWnDE_scWH9je4SEW71AVwrj6xPhV2VljS6GWQPnSTNJ_OjQ4P2dUFnB7PkLV2rtUC8dmj8.Lw
 1mqaqWOOcuS7Q_sYfF.PYwUy_goSXFpGAJ8ptKrP1dxPRHnUedFwXkonRq.Ie8LWjrkEY5KdVwSO
 HumIBOY90a6A0jOApnVbjMVPYPxMVFXwiv3JH15TfX5HA4oK3kqVeqrenPXF.Mt.jcdPSZHHKVKL
 O0fsaimn2fCISAALbjOsym5SGnFXqfYhhzNOtMEvoHm.RmtovvS4ddgVvBA_Xf1BlHjanbZyQ1ju
 Rocibw1PlzNIsWjHSVttCM4qn8uq37rxV103LY20a3gfVxM1MIosuAhglCCqYVv.uIk.hUVmSii8
 IzfC4kwDK2h7jSsm1MONf90ewjDBQDGzgrDUAWPgedOSD1.GWQFZAa4Zw6bF0RkTgj3yXiCVkqJC
 eHfqnldUDrjI_w3Rkm_tpxl.Ep_18iZRIQhj6YYARGQnGyE8ptktbKeXJcuOS7ntKNOMQy5p7Hvr
 Bop2ASMjSFwbAsGjydTSjfjgXfRbog_rzn8m08TL9ZdcuvjgJ3qLOJ1jmpuOoafCYNJ6xaOYhhgl
 OWE91Xfip6IZm7UABo1t7NzgxLIsUnb1J9hUz7O.1ESX_NqJmnJtF1jNvQfeDgCWWKh02gf7lyVM
 1d4OWrPNyC3iL0pX0BzbYRcm0MKWpZbnFMjUvOOuIj6wFhxvz3YTxOLJEwDCshOIGyJAOR0cXscI
 SNFGn_34b2TjqGpFctLx8Rn1ECNEkYPmZE.Qmb5St92_s56pEBt0xKQQ58hDCoa17_uQ3_znlRUp
 C3tXstV22pjGdXagLVURmf_wDg3yH3k0IDMoXyszthi5V0V.7bEVcVt6uGl_zTZSC0CaTxSfXQg3
 gIXDaNeygp6N7i68_xgQhVr0vPwT33ybWrLVwla2JVbMPCPMrfhPz7kzNiELdWiaXbA4WK3bJ7ic
 ossQm7SLyPPpu0.szzrPWXQ6oZ6DFZHcyW5Bkx7URLglbxRx.Ma8E_at1QgjrhmEscEGocxibtc.
 Zf8mdpEl8X7cTUU6r6F301tLVLzO1iSCBPgnbB5iemStxgf_BPip16ZIVEpfy3RRjITvsU4uRGMP
 JtZHaa391E0nGMaJQ2hLxAISf_nomO3fM3YW1W8DCq4be6MpzlgHd_2s6NozbZ4HSFn0pge7Efos
 yh7k1bkxCKTCXsfOsQXVCCpPxEclJQktu8GJXC7j8IACVkhsOMk5JeiZxZcEE04JirdtTwj2H_rq
 sw8mxH7zustXuYH5Dk62jlwvMWqgQF75aMsThpDqKs8q_kDg3zwk01CiDoNGL_FYRuOAAD1gY9xS
 ObZkWNQq4AuNpansdFcwYRL.tkENCG3BxXL9TxfePUB3bLfd2_hTM2di4U_rcpTdsfPI5YARcYrk
 oPGGpXSot4xCaz21LFpR8XsnzNOMa8NXpZCR5zybtuSRsU84CBN6XMSPKhtOp3EQfWFppidQGz75
 ley3uLtMXiY8Gu5PCKe.PvWlXbF38g9jfi7Hso5fYg85uz3IvLUvyLKsnlQNYQGp4f.jbf.sGIwI
 aI_ucJWWdeyyiS5ggx16hAzy.mZojlWXvGO2QMO9OqL5twe0Nkgj6KSJYkRlEXS4qF0X5rjst0ko
 CzN6lkrTKYyfvkCCBDLxiBF3mmMV1UbW.i8huWcAW_2YeZtHdiaqfKVUq0WSz_3u1L1zNonl6vee
 XiIx1dQrouLPDhbqNVix8dL5oCCCM.NQLZeBIsYAIKdOWjtghosx0jeWz9.bIF_Ka3wXzU5B_e7M
 R0v4JATeP3TgLu0d31RGFHDMEWQwlD_B.G9qiIYMh1EcETzowLDBRDIaO0jWUAXyj426kNAwpEiB
 l6L0Z30JDOgzC3XrBlgmMIUygiDEpf0RsiPPEars6_7o5MnCqjDvppKAOUkSQEUEODMMIYeqTAfP
 spUhw4pj60mXIWpnTwg8hFzGgOcOWNRO0dZ1MYP19VU6eFMwBAOqXWsRX6UBYbOZ1W4rN8xjBykw
 nVvuBMcoj3rvLVt866FFKaQxe1cHqd8LDCx18MhuKRuU-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 657953f7-8fa7-4a11-9497-7cccf09d286c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Sun, 22 Nov 2026 09:43:38 +0000
Received: by hermes--production-bf1-8768df57c-vfdxk (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 9f0cee565cdd43f0e5c5af2959b0f666;
          Sun, 22 Nov 2026 09:43:33 +0000 (UTC)
Message-ID: <0552fff4-ac3d-4e2b-8d66-610d0e661e11@yahoo.com>
Date: Sun, 22 Nov 2026 10:43:28 +0100
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
Subject: [PATCH net-next v13 07/14] net: dsa: realtek: rtl8365mb: set and get
 vlan 4k for family D
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
References: <3f1826f8-3096-40dd-a278-c70fce4852c8@yahoo.com>
Content-Language: pl
In-Reply-To: <3f1826f8-3096-40dd-a278-c70fce4852c8@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

The hardware structure of 4K VLAN table entries has changed between
silicon families. Family D's CVLAN entry is two 16-bit words rather
than three: there is no third word extending member/untag past bit 7,
and no priority/meter fields at all. The FID field is restricted to a
narrower 2-bit width. The chip itself supports both IVL and SVL.

IVL_EN (bit 3, versus bit 14 on family C) follows vlan4k->ivl_en. On
family D, rtl8365mb_vlan_4k_port_set() enables it while any user port
has VLAN filtering enabled (dsa_port_is_vlan_filtering()), so that
static and learned FDB/MDB entries use the same key. Family C keeps IVL
always enabled, as before.

When a vlan_filtering change flips this switch-wide state,
rtl8365mb_d_vlan_4k_refresh_ivl() updates IVL_EN across the active 4K
entries, so existing VLANs, including those programmed before filtering
was enabled, switch between SVL and IVL immediately. Changes that leave
the state as it is do not touch the table.

The update visits only the VIDs in use, tracked in the vlan_4k_used
bitmap in struct realtek_priv. rtl8365mb_vlan_4k_port_set() keeps it up
to date under vlan_lock, so a toggle does not read all 4094 entries over
the slow management bus (about 5 s per toggle on an RTL8367S-VB; 20-30 ms
with the bitmap). The bitmap covers the entries written by this driver:
an entry that was already in the table before the driver loaded is not
visited. An entry that loses its last member is written back with IVL_EN
cleared, as in its reset state, so that it is not left in IVL after it
drops out of the bitmap. The rewrite itself is a separate function,
rtl8365mb_d_vlan_4k_set_ivl(), so that an error path can restore the
previous state.

Reusing the three-word family C layout on family D would read a third
word that does not exist as a distinct table word on family D's die.
Whatever data happens to be in that register would be folded into
member/untag bits [10:8] on read, and written back on every
read-modify-write cycle in rtl8365mb_vlan_4k_port_set(). Give family D
its own two-word pack/unpack instead: add rtl8365mb_d_vlan_4k_read() and
rtl8365mb_d_vlan_4k_write(). The shared code reaches them through the
vlan_4k_read and vlan_4k_write pointers in struct rtl8365mb_family_info,
so the pack/unpack code needs no is_d() check.

The two-word layout matches the vendor switch API for this chip
family, which writes only 0x0510/0x0511 for a CVLAN entry.

Nothing points to them until the family D info is added together with
the chip table entry in the last patch. Until then they are not static
and are declared in rtl8365mb_vlan.h, so that the build does not warn
about unused functions.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/realtek.h        |   7 +
 drivers/net/dsa/realtek/rtl8365mb_main.c |  13 ++
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 184 ++++++++++++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |   9 ++
 4 files changed, 211 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/realtek/realtek.h b/drivers/net/dsa/realtek/realtek.h
index dacb780..c166719 100644
--- a/drivers/net/dsa/realtek/realtek.h
+++ b/drivers/net/dsa/realtek/realtek.h
@@ -8,6 +8,8 @@
 #ifndef _REALTEK_H
 #define _REALTEK_H
 
+#include <linux/bitmap.h>
+#include <linux/if_vlan.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
 #include <linux/gpio/consumer.h>
@@ -65,6 +67,11 @@ struct realtek_priv {
 	 * deleting port VLAN memberships and PVID configurations.
 	 */
 	struct mutex		vlan_lock;
+	/* VIDs with a non-empty 4K VLAN entry, protected by vlan_lock. Lets
+	 * a switch-wide update visit only the entries in use instead of
+	 * reading all 4094 over the slow management bus.
+	 */
+	DECLARE_BITMAP(vlan_4k_used, VLAN_N_VID);
 	/* l2_lock is used to prevent concurrent modifications of L2 table
 	 * entries while another function is reading it. l2_(add,del)_mc
 	 * is an example that first read current table entry and then
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index ed7078e..2269ac9 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -2305,8 +2305,21 @@ static int rtl8365mb_port_vlan_filtering(struct dsa_switch *ds, int port,
 	if (ret)
 		goto undo_set_framefilter;
 
+	if (rtl8365mb_is_d(priv)) {
+		mutex_lock(&priv->vlan_lock);
+		ret = rtl8365mb_d_vlan_4k_refresh_ivl(ds, port, vlan_filtering);
+		mutex_unlock(&priv->vlan_lock);
+		if (ret)
+			goto undo_egress_mode;
+	}
+
 	return ret;
 
+undo_egress_mode:
+	/* The previous state was the opposite of the new one, see below */
+	(void)rtl8365mb_port_set_vlan_egress_mode(priv, port,
+		vlan_filtering ? RTL8365MB_VLAN_EGRESS_MODE_REAL_KEEP :
+				 RTL8365MB_VLAN_EGRESS_MODE_ORIGINAL);
 undo_set_framefilter:
 	if (prev_accepted_frame != accepted_frame)
 		rtl8365mb_vlan_port_set_framefilter(priv, port,
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
index 566c6bc..b807835 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -50,11 +50,15 @@
 #include "rtl8365mb_table.h"
 #include "rtl8365mb.h"
 #include <linux/if_bridge.h>
+#include <linux/if_vlan.h>
 #include <linux/lockdep.h>
 #include <linux/regmap.h>
 
-/* CVLAN (i.e. VLAN4k) table entry layout, u16[3] */
+/* CVLAN (i.e. VLAN4k) table entry layout: u16[3] on family C, u16[2] on
+ * family D
+ */
 #define RTL8365MB_C_CVLAN_ENTRY_SIZE			3 /* 48-bits */
+#define RTL8365MB_D_CVLAN_ENTRY_SIZE			2 /* 32-bits */
 #define RTL8365MB_CVLAN_ENTRY_D0_MBR_MASK		GENMASK(7, 0)
 #define   RTL8365MB_CVLAN_MBR_LO_MASK			GENMASK(7, 0)
 #define RTL8365MB_CVLAN_ENTRY_D0_UNTAG_MASK		GENMASK(15, 8)
@@ -66,6 +70,10 @@
 #define RTL8365MB_CVLAN_ENTRY_D1_METERIDX_MASK		GENMASK(13, 9)
 #define   RTL8365MB_CVLAN_METERIDX_LO_MASK		GENMASK(4, 0)
 #define RTL8365MB_CVLAN_ENTRY_D1_IVL_SVL_MASK		GENMASK(14, 14)
+/* Family D CVLAN entry, word 1 (family D has no word 2) */
+#define RTL8365MB_D_CVLAN_ENTRY_D1_IVL_EN_MASK		GENMASK(3, 3)
+/* FID_MSTI in the vendor API: the same bits hold the FID or the MSTI */
+#define RTL8365MB_D_CVLAN_ENTRY_D1_FID_MASK		GENMASK(1, 0)
 /* extends RTL8365MB_CVLAN_ENTRY_D0_MBR_MASK */
 #define RTL8365MB_CVLAN_ENTRY_D2_MBR_EXT_MASK		GENMASK(2, 0)
 #define   RTL8365MB_CVLAN_MBR_HI_MASK			GENMASK(10, 8)
@@ -231,6 +239,45 @@ int rtl8365mb_c_vlan_4k_read(struct realtek_priv *priv, u16 vid,
 	return 0;
 }
 
+int rtl8365mb_d_vlan_4k_read(struct realtek_priv *priv, u16 vid,
+			     struct rtl8365mb_vlan4k *vlan4k)
+{
+	u16 data[RTL8365MB_D_CVLAN_ENTRY_SIZE];
+	int val;
+	int ret;
+
+	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_CVLAN,
+				    RTL8365MB_TABLE_OP_READ, &vid, 0, 0,
+				    data, RTL8365MB_D_CVLAN_ENTRY_SIZE);
+	if (ret)
+		return ret;
+
+	/* Unpack table entry */
+	memset(vlan4k, 0, sizeof(*vlan4k));
+	vlan4k->vid = vid;
+
+	/* member/untag: d0[7:0]/d0[15:8] on both families. Family C
+	 * extends these into data[2] bits [2:0]/[5:3] for its 9th-11th
+	 * ports; family D's die has only 8 ports and no third table
+	 * word, so data[2] does not exist there and must not be read.
+	 */
+	val = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D0_MBR_MASK, data[0]);
+	vlan4k->member = FIELD_PREP(RTL8365MB_CVLAN_MBR_LO_MASK, val);
+
+	val = FIELD_GET(RTL8365MB_CVLAN_ENTRY_D0_UNTAG_MASK, data[0]);
+	vlan4k->untag = FIELD_PREP(RTL8365MB_CVLAN_UNTAG_LO_MASK, val);
+
+	vlan4k->fid = FIELD_GET(RTL8365MB_D_CVLAN_ENTRY_D1_FID_MASK,
+				data[1]);
+	/* Family D has no priority/meter fields in this entry -
+	 * left zeroed by the memset() above.
+	 */
+	vlan4k->ivl_en = FIELD_GET(RTL8365MB_D_CVLAN_ENTRY_D1_IVL_EN_MASK,
+				   data[1]);
+
+	return 0;
+}
+
 int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,
 			      const struct rtl8365mb_vlan4k *vlan4k)
 {
@@ -277,6 +324,124 @@ int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,
 				     data, ARRAY_SIZE(data));
 }
 
+int rtl8365mb_d_vlan_4k_write(struct realtek_priv *priv,
+			      const struct rtl8365mb_vlan4k *vlan4k)
+{
+	/* Bit 2 of word 1 is SVLAN_CHK_IVL_SVL in the vendor API; like
+	 * the other bits not described above, it is written as zero, as
+	 * the vendor API does for this chip family.
+	 */
+	u16 data[RTL8365MB_D_CVLAN_ENTRY_SIZE] = { 0 };
+	u16 vid;
+	int val;
+
+	/* Pack table entry value */
+	val = FIELD_GET(RTL8365MB_CVLAN_MBR_LO_MASK, vlan4k->member);
+	data[0] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D0_MBR_MASK, val);
+
+	val = FIELD_GET(RTL8365MB_CVLAN_UNTAG_LO_MASK, vlan4k->untag);
+	data[0] |= FIELD_PREP(RTL8365MB_CVLAN_ENTRY_D0_UNTAG_MASK, val);
+
+	data[1] |= FIELD_PREP(RTL8365MB_D_CVLAN_ENTRY_D1_IVL_EN_MASK,
+			      vlan4k->ivl_en);
+	data[1] |= FIELD_PREP(RTL8365MB_D_CVLAN_ENTRY_D1_FID_MASK,
+			      vlan4k->fid);
+	/* No priority/meter/member-untag-extension fields exist in
+	 * family D's 2-word entry - data[1] and data[0] above are
+	 * the whole entry, and data[2] is not part of it at all.
+	 */
+
+	vid = vlan4k->vid;
+	return rtl8365mb_table_query(priv, RTL8365MB_TABLE_CVLAN,
+				     RTL8365MB_TABLE_OP_WRITE, &vid, 0, 0,
+				     data, RTL8365MB_D_CVLAN_ENTRY_SIZE);
+}
+
+/* Family D has no EFID, so a VLAN-unaware bridge must learn in SVL (IVL=0)
+ * to match static FDB/MDB entries programmed with VID 0. Use IVL only while
+ * at least one user port is VLAN-filtering. @port/@filtering override
+ * the state of the port currently being changed, as DSA updates
+ * dp->vlan_filtering only after the driver callback returns.
+ */
+bool rtl8365mb_d_want_ivl(struct dsa_switch *ds, int port, bool filtering)
+{
+	struct dsa_port *dp;
+
+	dsa_switch_for_each_user_port(dp, ds) {
+		if (dp->index == port ? filtering :
+					dsa_port_is_vlan_filtering(dp))
+			return true;
+	}
+
+	return false;
+}
+
+/* Set IVL_EN of every 4K entry in use to @want_ivl. Callers must use it only
+ * for a change of the switch-wide state (see
+ * rtl8365mb_d_vlan_4k_refresh_ivl()), so that every entry in use holds
+ * !@want_ivl on entry. Must be called with &priv->vlan_lock held.
+ */
+int rtl8365mb_d_vlan_4k_set_ivl(struct dsa_switch *ds, bool want_ivl)
+{
+	const struct rtl8365mb_family_info *fi;
+	struct realtek_priv *priv = ds->priv;
+	struct rtl8365mb_vlan4k vlan4k;
+	unsigned int failed;
+	unsigned int vid;
+	int ret;
+
+	lockdep_assert_held(&priv->vlan_lock);
+
+	fi = rtl8365mb_get_family_info(priv);
+
+	for_each_set_bit(vid, priv->vlan_4k_used, VLAN_N_VID) {
+		ret = fi->vlan_4k_read(priv, vid, &vlan4k);
+		if (ret)
+			goto rollback;
+		if (!vlan4k.member || vlan4k.ivl_en == want_ivl)
+			continue;
+
+		vlan4k.ivl_en = want_ivl;
+		ret = fi->vlan_4k_write(priv, &vlan4k);
+		if (ret)
+			goto rollback;
+	}
+
+	return 0;
+
+rollback:
+	/* Best effort: restore the entries rewritten so far. IVL_EN is
+	 * switch-wide, so before the scan every entry in use had the old
+	 * value (!want_ivl) and every entry below @failed that now has
+	 * want_ivl was rewritten above.
+	 */
+	failed = vid;
+	for_each_set_bit(vid, priv->vlan_4k_used, failed) {
+		if (fi->vlan_4k_read(priv, vid, &vlan4k))
+			continue;
+		if (!vlan4k.member || vlan4k.ivl_en != want_ivl)
+			continue;
+		vlan4k.ivl_en = !want_ivl;
+		fi->vlan_4k_write(priv, &vlan4k);
+	}
+	return ret;
+}
+
+/* Must be called with &priv->vlan_lock held. */
+int rtl8365mb_d_vlan_4k_refresh_ivl(struct dsa_switch *ds, int port,
+				    bool filtering)
+{
+	bool want_ivl = rtl8365mb_d_want_ivl(ds, port, filtering);
+
+	/* The scan visits every entry in use, so do it only if this
+	 * change flips the switch-wide state, not for each port of a bridge.
+	 */
+	if (want_ivl == rtl8365mb_d_want_ivl(ds, -1, false))
+		return 0;
+
+	return rtl8365mb_d_vlan_4k_set_ivl(ds, want_ivl);
+}
+
 static int
 rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 			   const struct switchdev_obj_port_vlan *vlan,
@@ -314,7 +479,15 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 		vlan4k.untag |= BIT(port);
 	else
 		vlan4k.untag &= ~BIT(port);
-	vlan4k.ivl_en = true; /* always use Independent VLAN Learning */
+
+	if (!rtl8365mb_is_d(priv))
+		vlan4k.ivl_en = true;
+	else
+		/* An emptied entry goes back to its reset state, so that
+		 * it is not left in IVL after it leaves vlan_4k_used.
+		 */
+		vlan4k.ivl_en = vlan4k.member &&
+				rtl8365mb_d_want_ivl(ds, -1, false);
 
 	ret = fi->vlan_4k_write(priv, &vlan4k);
 	if (ret) {
@@ -322,6 +495,13 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 		return ret;
 	}
 
+	if (rtl8365mb_is_d(priv)) {
+		if (vlan4k.member)
+			set_bit(vlan->vid, priv->vlan_4k_used);
+		else
+			clear_bit(vlan->vid, priv->vlan_4k_used);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.h b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
index 009b127..f6230eb 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
@@ -24,6 +24,10 @@ int rtl8365mb_c_vlan_4k_read(struct realtek_priv *priv, u16 vid,
 			     struct rtl8365mb_vlan4k *vlan4k);
 int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,
 			      const struct rtl8365mb_vlan4k *vlan4k);
+int rtl8365mb_d_vlan_4k_read(struct realtek_priv *priv, u16 vid,
+			     struct rtl8365mb_vlan4k *vlan4k);
+int rtl8365mb_d_vlan_4k_write(struct realtek_priv *priv,
+			      const struct rtl8365mb_vlan4k *vlan4k);
 
 int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port,
 				 u16 *pvid);
@@ -43,4 +47,9 @@ int rtl8365mb_vlan_4k_port_del(struct dsa_switch *ds, int port,
 int rtl8365mb_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
 				 struct netlink_ext_ack *extack);
 int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid);
+
+bool rtl8365mb_d_want_ivl(struct dsa_switch *ds, int port, bool filtering);
+int rtl8365mb_d_vlan_4k_set_ivl(struct dsa_switch *ds, bool want_ivl);
+int rtl8365mb_d_vlan_4k_refresh_ivl(struct dsa_switch *ds, int port,
+				    bool filtering);
 #endif /* _REALTEK_RTL8365MB_VLAN_H */
-- 
2.53.0

