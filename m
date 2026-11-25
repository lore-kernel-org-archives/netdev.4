Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.189.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565189;
	b=2TrwUJtam3EHIRTw0QlqTXeL3Jrl2e84wzHxzaIrUEvfvVCcHQJCn0iQsRd/6pW7K9A+
	 JfCsHfhEffVI0jCdcuS+KP/WWh/unw1CHNb1EMMN6cqToSMh4BhDbXmMVmB8ALtDhY6Ef
	 5hGNBfWq0bYQNyQanAS+ebvOUfpaf1FJIQDuC3OaUz90z9ti+eSlC2xpmHKVpZWBzFSFY
	 c32RW2zOaXXErpz4eL1eQn5vQZ2xOJLbtR6Mg9hLeN/sHRILbaQO+NjubKs/WxWsMcscZ
	 as1HhnDVRrfw7SF8Cbg7zy5uVzCQyQmqeQQnR+cqOzC5XDhgSsxVxnofOQiEeFQAPOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565189;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=lyFEA2pPtcSN+NFgMEM25R2o7ZLj2D0vspuZ/yOPX0M=;
	b=WT8tgHN8ZQZLx9ugK30NV+0Ek+STa4KWbvLfAaOR0jxoMBBexcwQPxLYUVUnIiRC1TE1
	 MzylJJVbrb1qdvRzsf0i1CDDqP+QT+GbBepoiaD6NoroWfI6KVMIfFVCUJb0AdfEjt3vz
	 c0uB/6Rn58oKXNNMDMossqe75YiZJ0LPvEcZ/kJY7K7mRJArwqUmWda57Sa78cwehk/QD
	 SSooOpOPnIhJgJxI8OXSthG+0GR9pLn45q9riM73BazITgOawqf77uDqAF1lLqNbMNFH8
	 5scRrJsAWFRaHyVY3LJaNvpteuuhzJ1yltnOuJ7rc+9ZLJOcG2Liz+C2WyC5rJoRedA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b="I3RL/zgO";
	arc=none smtp.remote-ip=66.163.189.147
Received: from sonic314-21.consmr.mail.ne1.yahoo.com (sonic314-21.consmr.mail.ne1.yahoo.com [66.163.189.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8409606A32C
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8409606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=I3RL/zgO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565188; bh=lyFEA2pPtcSN+NFgMEM25R2o7ZLj2D0vspuZ/yOPX0M=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=I3RL/zgOnvBwBQkRMgR434v6fDd+Ky2fqvqBEeuOma7ROFI+VMTZtw30iRLHr8jmNM0uOT4yEt+stuwxyr/k5HJJKm8QgAM9YVxgzllzYXHIPts9TdAMGcbUoEq0VC0FkCIcG5ttMvW4327uT5QgJ2HJYB83/gZwSwcyKjdoRVIcHjrp1iaU4cY73rncmfnpQPEpVZIF894HYZ1I1xWQ4CSxlXZnntXxU9NH1/eHOseiZakKEz1qEXj1TtpIZv/JZaGDXLphCp6pJVUdLdvywR1EQwrLWx7ICHM8zXCl+FEYfx4pt9T5ssmm+9RRTW6PJDExmzU3e4w7si4zpb7DdA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565188; bh=/FGSuO/ecgErCUPJk4t+Hrb6bn0QOWk2DdG2pUyVo/2=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=qMNzHxJDgv2hJKUEV6arVpcQwNvmf52aBkAkj5I30FW1pQfXuBdXUf02lhn7nwkVvz17BErY07gGPjpe4F4xR447KmALJTKZw4orfUcydN3BC4Ju1b2dqzC0pmsX8nyKY4hDt5ZM7llP/WDfWLhv7J+89RrrM4L2UEOotJbDwtZ6Ed32By2xsaG1ajWcy+52S0qqATWJFap89v4b4XT6L7BltQFVPNVvhyEyMfEUTLQf+i6f9QXU/j/26x05Qd6e0idUiglnPs12uJoO/qV1noNqp5OGYpMWtPGUffILutbFy0ZWBZXq9MJrJPrYha8E1j5E7FUlUpJXLA3rsP/y2Q==
X-YMail-OSG: LS75rvIVM1nUEIkFXsW_JycgiLNn0T5V9WehPqIRND.VS598aBYm5nZOodtG8Vn
 tJCT12arp6gK5rnEyQa8rn8WJGASJOebnnqlxWYJgm.KKsROG2.K.7mqaCT0yf_CTgg1BJ9dUpmk
 gec151Eik2lFt3s0bHuXtHAB2EwAtGmuZQ4ZM7hTGnT65VCVyHmED2aWZx1dsHXU46AbJ4Kg2cio
 _qBgUzjG2b2pv9W_h_MJz.D3julbcpp2_rBNkLV5g3vfF2RL.ZOh_pZPJfiItvvKO3SmtfSxW1vw
 R2so5SXu7rp6GokFBEtr9_v8.ekTRpIV3gG6d8KUsEaCd4DAwfy38fNxBO8R33wuAxSSAVKaUgG3
 QG8f1MaU1aDYZNqUjokR2Y0mHNSxbj0brtdDTiNFktZhPvBNbEwcmQj5nsvVxDvUVSR_6kGrYkgo
 IDyaZl7tvrO7T0yJlEOYe0P8EpwE5Gsh1zh1zAIyZUIIa4mahrFfD3oLWKTJbNEKGLTq.oOudYH.
 mN9pyR3moplhF4jw3NjASfDSZAEFOft7HcLhCHVKRjJUqwG7izXpGTA4WjY1ecjv.sbn5gAFhAqJ
 1iKNkE5CYZ2g05kYiHlIKAySYDTkZT5JZA7VliFoHF9hl2In4j6qwX8H8Mq7wv4sJMd70XmAASxC
 kgHDB_dab4byMwgkn2FhZzm2TQ_63xhUn15wBMW30f3GFhwdqb7fx3NhqsOzSY5NE6017GSvGx9K
 ugJfRZO0PwVgo3NF3yc0DwZO6zh.cjRQv4sAO5KAPmijeqODcB9cDlFamNjJAk4YcwbdH1Nj5kM_
 DX3AcVe2tpX9aTrME_S40gzF1lMCrjVYMqru3QYOmCsUTMH.UnwMoAJi50mlU6bSKVZOM3VOhadH
 LGUAQMxOOe38VspFDW1ca6jdib6RydA3N2mym.83wX9WVPltN52hJVKsBGthZam8ZxZIlDCLYTIu
 0hmPVgBwKVXl79KyaUf4tmkeiJF8i_6SDSE4sfr6D55E8wlv_awRJN7K7wnWLmvPjG6evG0BQiNy
 QGb5e55TWeqLyvPJ1F8H0NgL4sPDO.57ibuEf2uQtRRcLsaZfQ.1CP4jIGhtQV9JG36olmUzVMX5
 gfABdRZJf4L5A182_p0vUTtamlhcnoxIQbCk5g5nan2bBG9mbUtTNh8esIlDenDXGb9uqfbyjKJ2
 8_L.P70Ztd.xEEWm05AMUmEEnfkh2A0nbkQo04Lve28hythsSGXy5DhnWEsq0bxgErNKzufZb93V
 V6eOyOPS9jdRWquOBTRQXZs6k77CuJZe.4FmbiJqRsVUbPuzAIm1KmDGNwe7xgq5ph_.dKY1a22j
 UaLD5jLC6hdSUfiNdD4IHlKJ3slzLL.cAoOkqwrt.gk_9fHPhPsxG4AoIutLLapB.6tZlcE2x6TU
 uKwg4TcqUw7VTazrdAR4nczz0tKp99X3t802uxrDo.zptu2a1ecvOU8q9SB9VF_twPj7q3O1bhDX
 LQbWf9JitQ9dTcmdTD4SHUkOn19LuVcqkXA3EhDZYjP0muoKsu5ATFcseH8R9_NdRU7bpv6TJtVS
 I5.QRlOvDJo.nUA3d3qEXNsg3YtmQB2T9uRVigXrYtBEnJBApKOvRjx8bD7qqtC8qlsy9L5tMUNq
 HzM5wO9FQehXFIdKhL60EYRME2rRbTQJ6oXuJ1od9T5cFrhBnTBnlk.VXxvbpObo61RNI5upyWqi
 Yjy09t9ANaIhHwKJQvB35.BQzSWv5Jqco0xp0qDwfiL1phx3DkG3tYJuDIhdCJ7SRBdCkFfASoqP
 3XkmGJTiMWmjHf59r9O0ovcNFHkO7tcbUtDYAfxJ_IjXnXYiHJlBT_nsPGUjwuBvNFTklNBRRYy9
 PHFBJs1NMqZSBQYRdb5kITXD4NO3XFPTqkSnBnAukARmTiWg_mSgHvljX.Ve1Gu_pEasPfbG0UtA
 U83FFIhBwXOxEBWFg0tW9EUrB5jxyTjZbjjjkTvM3agJP6paqYFjpo0XgOvHw4jvFgL7vCcWlWyN
 lhxwci_0dckKvzUz3z5Zv9PdDX.CAW.59E0mmdJ8H8S86c_AGobbUbBuVXR5bAK_Phf3gMYw2bRp
 i1oAOt4ugUZ0a_bMlRYXYQfmY02DoCZR5qGi9c_H5vi2LyJtd9yW.2qTB3pYl2gNs1zSrcGAR6j1
 Z4tox.0PaZAidKiE6aKHdtJR77ERe4SKUdK0.eyCg1NYDBoab5CtHQundYOwKXMDA.l3eTxvy6J7
 3myLeD3PuANO1IOKIBHrcqdIjma1gePMumJKbq8.fGk_tKmjsk.MRbrLa4WA2cT3QfdG8RIq3Nwg
 gTTQUrjCGmVgnVWLejLI1doSln7tsXJ10S5Mh6KbdUqtlyQ--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 7afdb8a3-9d43-4115-9d36-914853ea115d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Nov 2026 00:06:28 +0000
Received: by hermes--production-ir2-7c4859dc89-4mhg8 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID da7ed46c6e1c7aa25c86f1affa717893;
          Wed, 25 Nov 2026 00:06:22 +0000 (UTC)
Message-ID: <fe49b828-ee40-4cef-b969-536cc251f811@yahoo.com>
Date: Wed, 25 Nov 2026 01:06:19 +0100
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
Subject: [PATCH net-next v14 07/15] net: dsa: realtek: rtl8365mb: set and get
 vlan 4k for family D
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev,
 o.rempel@pengutronix.de
References: <874b29a3-f47f-4bf2-a0f6-2f9fea712f4c@yahoo.com>
Content-Language: pl
In-Reply-To: <874b29a3-f47f-4bf2-a0f6-2f9fea712f4c@yahoo.com>
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
 drivers/net/dsa/realtek/realtek.h        |   8 +
 drivers/net/dsa/realtek/rtl8365mb_main.c |  13 ++
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 185 ++++++++++++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |   9 ++
 4 files changed, 213 insertions(+), 2 deletions(-)

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
index 687939d..24635fe 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -2303,8 +2303,21 @@ static int rtl8365mb_port_vlan_filtering(struct dsa_switch *ds, int port,
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
index 566c6bc..ff6f2ba 100644
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
@@ -277,6 +324,125 @@ int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,
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
@@ -314,7 +480,15 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
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
@@ -322,6 +496,13 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
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

