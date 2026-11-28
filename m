Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.187.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824252;
	b=exRfLEog/Msool9DntHwrCfwhmNoFu8lYGiYMizOOZ8VsNqvSBIxdcCBwZihvg73+I8z
	 Z6N1kEs4loRVTA0/qSllQInNPBWbvxkyYcBd2B8ZBLQpZi4ZTb2YJZTts9/S3M7EPz8x0
	 /RaVihOcPZXcpu8paobfaSt/HovlbQGPDSjIPLkG7QcDluyZ87DZfqjeRukfeqL6XeriG
	 qaoXmDQvoFtIG9Sq9QT/MMbzAnOrbRTBaiY0tyouZ7hWtGwDTpqIIzVolBs27GCEoHO8b
	 6XP6wbfZSByKoKEB9DzALtpOsbgmUkqA+AXsG4XLJafcPmUyFsOG6K1GNbwcRSk+TjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824252;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=WXw3Kgt7+hGhNJDsJciWoM+ued/rR2Xbn+ZlW/jUcik=;
	b=GdV+3wbB1pg1eV5BcsokLmDlWWRG+CTfRjkHzko0h35V3L74cbQaD936UCiXZCQy+wlh
	 EfxjWzj/UBe5ip8EBkVJGN3e0PqvY0oMDYD/h09PDE+E5v7wNgLEG0d9Jk2A5WGcZye7H
	 j34/AhTm8dSscq1+Hejb7i2AbgMaqqBedZrYIqOegUv9UgszRLL+gR1AoxKsMGecSAjI4
	 qr+rFMOXz6MFuQO4eCt4e27dbkmltxfQn072QPni/jhkYXAFtOk4hV1gvtpFln6jBg/Sd
	 fcZJy+adEvefOmBzVaH3GnsRifrlwRv5y8fbcKO4SP5+WF7Cu6V11WgE54SYgI5CDEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ST7RutYo;
	arc=none smtp.remote-ip=66.163.187.33
Received: from sonic308-10.consmr.mail.ne1.yahoo.com (sonic308-10.consmr.mail.ne1.yahoo.com [66.163.187.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC763606A31E
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC763606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ST7RutYo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824251; bh=WXw3Kgt7+hGhNJDsJciWoM+ued/rR2Xbn+ZlW/jUcik=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=ST7RutYooe5fZDmjD6GxzzvO8er+dNUVnQ49od1jkDizy4LQ3T1fkFD7znf1AdS2U+eSsAxfZgA9MDiL5NUd3ts/xBJClEFx6zPZUBbNXDlmf5hGajgE/PoTZYHcBcp/Gu81pgNAo/aX3Zic06/43878J8/tP+aOryOthu8kLBgjMaoNhQGL7s5DTvOudVxg1eq+d+GtBUoQjbxPM+1G0KWdCheeQuXpH8JqLJGX0JzTFGc0O5EkR7WL5CtRolA8w7T1365+mTc/9+/mOrJZKm9mzLIGrUh3BEpuQmNlTdg24d8WFhcnpYvYaLI883qUj2HKP7/yUBf4hhNMA0VkHA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824251; bh=hupMRhlU9idyyyY8w9Tgn+lamT5/9Vj+d2A/TsOxw5e=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=bG5QBBbSY9fZKuh6aZoNgXbQsoz54HNAq2CQuS2SQei40cn1IG/xCNfc1k2tI8tY5fEJvsWenn6ltzqiAVYzucRyBvBx/qzb+WO/lws8cD/Ff7zngCXbuabS0gmx0suZA7cga0Vff6Y/8Q3n5joyncbvmjihzzXS1K0QKmWfIa+jx6N05dOefIGXbc0v+fUpxHt/kNtq6PoMPtOBAOESTB7zFMspkzMT41dCc2y0CZqUboR9oP7Riti/anaFj+TwQq6+igP7j3Nm36Wdnkl9h6srfyI9bqRkYaRNUxDMIrg2bgBYBo1GJm8/om0SmsB77r4mTzEB28cipd2p5P/eFA==
X-YMail-OSG: 4jzOkb0VM1kOijYAdPty0A0LTGTz9S1vrhsGveROtfDeuo9NFy5SbCli34Ittg7
 2ROSRAYMnnWFAQdCOgj75S7vpS78vY_s4IRsd0h3ejw18ERmZEAuJ5.WuGmzFBFG0a4TxrPt03Uj
 Acl25BKn7ewvWi.w3LuYHC4X8m2ebHzQslmX2ZiS3AfJ_gt9SeWv73fMq5HJi13i7_xazF_XEhxx
 EFEiqiX0LC7f_LvqQ.6Wf98v79OpelXoF5a10SIfYAFC92VYs719wqD3NVV0qisI2Csf0GDT.WTL
 5UpsDkDip7Ek26R7RerNodn6tR6iBUyPe7udGqfpXrTO9djD2b.gdFFq64ZW_aI3RSY6NkclAvfz
 cGeM7m.lxsYzcxI7e7O6XHY8GVwIenzI5JKorx25.rGj_IQO1KUEnT694d6.aWKp_LQ87YMPcQwU
 2fQkGjQU2TbFhCfwVLkIov4UJ5Bq9mCVSJqGzoztRqGUp6xbkmnFoGyqliS1MMIqT2thODMSsElp
 DnAWbIbAl1oQr.DW.3lre5eu2NPQ4jCAY2Pf3jFk7w3Y6D_EuRhQpT8wnxiPvv215I_EBq7976st
 tTMKr4G3zI5kniSQhDsyXMaugkTinL5sMbMKV0EXGqIFxP8NZAszosVKWtkGSYOM79xf7zWl3svp
 X_q3HP.hhh5bJX0QhEGj18dvtd51j99OXNjxuI_tT_4.YOPmyOkQkiaD00pHJbr.I8rsnwlBvZSH
 b91P.DFKhUTEM6QmAgbWliafBtbpc2n4Qs_Kc.ZMVh5tDbKy8hYfhBQA759XZGDHcFGEbvceg7WH
 xZA4upHw6xEMNjvMAmWrLAqk.Bh_Lo5dT1OJ7QeqDpmZrTP8WBeFpDbOK56WQoAJ1hzNspyMKYM1
 Zxk9wSDjJ8sv4YkMVDgbGQbtVIQc4dY0aidXcO0p3xTegpaUPKweEWI6c_hFRnVH8MYKq4ucLA.G
 eeHup_npGnHmmOevxHpCbghtG5Nek4d.fUAM9fcRoxgkF8uoJkO1EzKRFDlcuSaHqnxto2j9OwO_
 0KHUW0g0TrxzfqPxhRRdUp5YvblRENZOpHXJHjKuXpbQxBvQzy7odylt3rhpmtVEY9ErzfwYKn7D
 ZY1FSag1MufBUJDyKm6PWBHXjcJNkWK3h0BWaw__KxKzJ2QkuX.CH2s8kqXnKq_7cg6ArHYaxK2x
 5Kkf.H1z1ZDbb8ZY4qqVIsAw9RDqUZW._ce05P5gvw72yRh5OnpvQHILmx1MIdyBaAJ9dFGaQCa0
 1xjv9w38hynOswM4SWOuMkjCYhdkh1aFVD2eimjeq.r2WxKcei.0pHkSH9o2l9YcRd2xtlH4EDvQ
 9oTwq9UVkHTQdLJre053_mUwXfUnC.MJ3c1fzbBuqf5E0YpJi9tL0ncbmP2HeqyPSyKyJnx55IwI
 SxBIP68KZnwvKrNQCtsaGe1EbUdvVoOE1uHQV50YmQvZEKEw0RPE3XaNsdwICx8qZ9nMeJd0UICd
 033jUtrHSNms2hDQRVVhLcdR.sFJXr7cGMSHqYxIQkPFf7zSDERZEKS2VTjtzL1KWLUmtVxtwVdt
 7S1GBt3Pmlgo_tyJ5PxIthnsCVPIrHXq5yzaP2_YT8I0VODDiz6xTrvOhxprTawA3MYyjB7PSZGm
 dwFBlXVD1vVoJD98KBt_SFhZzcrZq.UNDoe0hTTtbRonApqaLHUfNA7T.eIQoHexGKAvvLKxQEZG
 HEY_KU5iSoYOjVwI.xin5PDsdZTOnkwu7o3RCyv863UeFOBtoE2rRLX1pR86mu.XdiV6KuAD_Ayq
 rsm9MyST8UmDRiZ4Oms1BbMASIb0.2JMh7wTFQRj1q18Ukzvc8YIUpyZjb4LxsxvycwlQtRsyq.r
 VTSLb81YInGcHl32qc1zlHoTn.J6UZ5CmsODQH8C.e94MeaznC2crupp.4yi46zFTyLptTwYiydu
 mYXXbioCrnmlZz2.KWa0F9WHoYSe2AnU3HK.yhegGwmx3m.hQWKo1AO9mMJvFljE7n6ZiAyITBQ.
 f_jkoBFUYbs7JOYWp14g5.g59u3OWfNC7xbd2DdJ8Cq_INPzH5Cl4lwlOPT6GSoGq.hmhPOUFV_h
 VSoR9_5ZWnv58caOwMlqXPB2aVCQ6VDvdE8FjVscWkufOVl.br55DLSC7z6IMowHbWI7hHKi7Rpv
 6W2Hu7TU4x71FOhPgzQSX1iaRG4Ir81K9mknNTa9gng16Z0wNRgjUZAvb75FvPRJQNLKEshSD.g3
 UxHAFmBwRRysTlZXvFgI2o7b9R8T5gH7wt3CPoOeWN7wvcayhjHWKLensH3Uerqci6E3FcN8Xlv2
 JSmgYRnjVUZO4BoTlOdm1cRTp5Fj2F7og4RGkOOl6rgc-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: b1fd3183-eab2-46c5-8eb1-b6f613b70951
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 00:04:11 +0000
Received: by hermes--production-ir2-7c4859dc89-lptdq (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 8e1e213e19bc193912e7c01dd97c5fbf;
          Sat, 28 Nov 2026 00:04:09 +0000 (UTC)
Message-ID: <6cdb40bb-c1fa-4059-9cb1-fde43d27983c@yahoo.com>
Date: Sat, 28 Nov 2026 01:04:07 +0100
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
Subject: [PATCH net-next v15 07/15] net: dsa: realtek: rtl8365mb: set and get
 VLAN 4k for family D
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev,
 o.rempel@pengutronix.de
References: <790b9ea4-09d9-4a57-a393-cf10d58ed8cf@yahoo.com>
Content-Language: pl
In-Reply-To: <790b9ea4-09d9-4a57-a393-cf10d58ed8cf@yahoo.com>
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

After a successful switch-wide IVL_EN change, flush the dynamically
learned L2 entries on every user port. Entries learned with the previous
SVL/IVL key must not occupy LUT slots or become visible again after a
later toggle.

Do not advertise vlan_filtering_is_global: ingress and egress VLAN
filtering remain per-port. Only the learning key used by active VLAN
entries follows a switch-wide policy. VLAN-unaware traffic keeps using
the SVL key with VID 0 and port-based FID 1.

The IVL policy is switch-wide, so if a VLAN-aware and a VLAN-unaware
bridge share the switch, the VLANs of both use IVL and the learned
entries of the VLAN-unaware one no longer match its static VID 0 (SVL)
entries. The L2 patch limits the switch to one new bridge number, but a
bridge numbered by another switch can still be offloaded here. This is a
known limitation.

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
 drivers/net/dsa/realtek/realtek.h        |   8 +
 drivers/net/dsa/realtek/rtl8365mb_main.c |  13 ++
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 194 ++++++++++++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |   9 ++
 4 files changed, 222 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/realtek/realtek.h b/drivers/net/dsa/realtek/realtek.h
index dacb780..fda385e 100644
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
@@ -65,6 +67,12 @@ struct realtek_priv {
 	 * deleting port VLAN memberships and PVID configurations.
 	 */
 	struct mutex		vlan_lock;
+	/* VIDs with a non-empty 4K VLAN entry written by rtl8365mb on family
+	 * D (left empty by other chips and drivers), protected by vlan_lock.
+	 * Lets a switch-wide update visit only the entries in use instead of
+	 * reading all 4094 over the slow management bus.
+	 */
+	DECLARE_BITMAP(vlan_4k_used, VLAN_N_VID);
 	/* l2_lock is used to prevent concurrent modifications of L2 table
 	 * entries while another function is reading it. l2_(add,del)_mc
 	 * is an example that first read current table entry and then
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 919bcec..7b6ed1a 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -2332,8 +2332,21 @@ static int rtl8365mb_port_vlan_filtering(struct dsa_switch *ds, int port,
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
index 566c6bc..e923c7f 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -47,14 +47,19 @@
  */
 
 #include "rtl8365mb_vlan.h"
+#include "rtl83xx.h"
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
@@ -66,6 +71,10 @@
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
@@ -231,6 +240,45 @@ int rtl8365mb_c_vlan_4k_read(struct realtek_priv *priv, u16 vid,
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
+	 * ports; family D represents ports 0-7 in the first word and has
+	 * no third table word, so data[2] must not be read.
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
@@ -277,6 +325,131 @@ int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,
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
+/* Family D has no EFID. Use IVL while at least one user port is VLAN
+ * filtering and SVL otherwise. The family D L2 helpers added later in the
+ * series use the matching key for static FDB/MDB entries. @port/@filtering
+ * override the state of the port currently being changed, as DSA updates
+ * dp->vlan_filtering only after the driver callback returns. The result is
+ * switch-wide: a VLAN-unaware bridge that shares the switch with a
+ * VLAN-aware one also gets IVL (known limitation).
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
+	struct dsa_port *dp;
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
+	dsa_switch_for_each_user_port(dp, ds)
+		rtl83xx_port_fast_age(ds, dp->index);
+
+	return 0;
+
+rollback:
+	/* Best effort: restore the entries rewritten so far. IVL_EN is
+	 * switch-wide, so before the scan every entry in use had the old
+	 * value (!want_ivl) and every entry below @failed that now has
+	 * want_ivl was rewritten above. The entry that failed is included:
+	 * its write may have reached the chip before the error was reported.
+	 */
+	failed = vid + 1;
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
@@ -314,7 +487,21 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
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
+
+	/* The write may reach the chip even if an error is reported, so mark
+	 * a populated entry as used before writing it.
+	 */
+	if (rtl8365mb_is_d(priv) && vlan4k.member)
+		set_bit(vlan->vid, priv->vlan_4k_used);
 
 	ret = fi->vlan_4k_write(priv, &vlan4k);
 	if (ret) {
@@ -322,6 +509,9 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 		return ret;
 	}
 
+	if (rtl8365mb_is_d(priv) && !vlan4k.member)
+		clear_bit(vlan->vid, priv->vlan_4k_used);
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

