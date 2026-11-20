Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.187.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133064;
	b=zFXVCLZ1GIR5GcVf6RGvDHEKmZgfi0JABrfgzerZ4qTj0zWOpqXvJHFGSccylALR4oV5
	 K8ROcLogPs2ntHMU6RWTYhJU9TAXafC83P4XpT7ln/yK4j1QmJSQSePuQwf8vMa7Np+lU
	 xy8LKmDQ2Ukwn/hU6t83vNXffa5oLqzuHDwhGQJZUiCpAWWALioY3/yJUFEzdN92xUr9q
	 i/72NSdU8to+JchcqkILHgf1ymqynLt7KjUnT8WMMnEMEWNJ+21iQvyRxbR+IbOsSbCwg
	 UR8v6EMmr3n3oddjKhPv9Jw4yzIkurClqlJh82oSCjPU+XwB0ig+2xERMK88WRMgE5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133064;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=EX5b73H8FGDtb2+Ny7ofwQBJ3R3ujOrNClrjO+RZYxc=;
	b=5fEJ1IoL0hkUnyj7tIOl46Cc9ZGg3nuPDeAhHockC+PCpwrwNEx4I7zJPS4HRsG5rz+4
	 MIqYQXuc/HvuHlG7VfEaA+3+LmI/u0wJGiCUaWwS+Es7Hc8tsrjagWyaQVLNyHs+aCX6c
	 CCY6Fr0o0N1sw1ba9Vm1i/yFZJl4x6WqXoxzS9UH2Zz4t7d25Ll3PuKk9/HrJZ7PY1rmc
	 tw6gnPqu5BV3/eldTz5SSJ36iSevAFtMubt88+/hBY8Ivi5YQ6kAtoewvQvhqTE4EkbxQ
	 i7c8qs6PSciKbfy/rQZo6+tMS5SohJzbDNa3z4dx8nyTIYkusOiGvqjGAMOKQWTAlJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=SHZ+qzW0;
	arc=none smtp.remote-ip=66.163.187.147
Received: from sonic316-21.consmr.mail.ne1.yahoo.com (sonic316-21.consmr.mail.ne1.yahoo.com [66.163.187.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B5260A2607
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B5260A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=SHZ+qzW0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795133062; bh=EX5b73H8FGDtb2+Ny7ofwQBJ3R3ujOrNClrjO+RZYxc=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=SHZ+qzW06zB2SUXxVz8OYKoMoHIQ1ZZJS5eIHgIFzIIAIU+AtyTM1O6bmEIzkTMbjY1JPYrqyLEMXPmvkyqaO8csIHYBvnCkqHNYAy2R2/NttHTdQFWARZo1t/Hw+MV6sdBDIB2PD88Gy/4GfD0C3Ymp2E4CGWnjU9csU+ljRF3fGKrSjS/q+WVp9ZZcg8lveeaVm+KnzPOIQ8tecNB9n6CT6ba5CJ/A3QqULavfOvQveaOr7vx+SM5wtDGvUczzQH5SoXxo3h5JyjwDv+MjcvXUWqMpWWFxKiK48pZaBxnyY0ggkPDB56l8ZECWU88TbSzh1gAXDSchX+5S2mQBow==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795133062; bh=lx3T7pZznw68g+UxES6FqVzSBNsj2pwPStiQK3jNScM=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=gHTT1sVKdOQOToOT4Pp3YfildMsgshgRjsgfRrwFXhUirttPD+JOabY7MT5XftjAwDtdbLtPpn2y95gSZtiNKmi9YgcmK7czVXPp9MsZWlFTNZ7r1gY7R7oHrU6pxfwEcyLC3OxL5JM676z2Z3cibKGK8odCeE8ME2WT+qLh9FRQJPtmWW/fhIxdun5e+brs1g3Cmjeq/0nd/oLcnNejR6oCIBIK7QKEbrNRXibPcD0+2SjSzjLB9aYnEwLD8pSc+go9s91LDc+dDmuU6QjhJg76IgxxP1hxTgE1lso1tkD9t04UOU18/Yk/eUW0DyrZtOndFMBRz309GmY7oBg4iA==
X-YMail-OSG: ZlNOEt0VM1moL.u5Skkk2vg0wOCeHwKK17Uv70o.1aCi8_YfvV1kHs.BUlV3eJa
 uzqDTQCVRsUNGD1S4dr8gPXe6VmpHBcy.XYBEZYsMmVfsvG2KQynsYLv.YpRxHVWkCQiRxAIEAJL
 q2skhi.7TQdHwoqkY.C6wwKG2PyMBkp5Xteanb.ReF8JhPlSevLPDfoTTs7tEwjCvOOZDTVkgau.
 mq5WAEytooFagxPYjny9ZBT0SXjXb9MLotDQeYvbq4TuNwSPWDuqdlozCUEzSyJuP8vt6Y0TJG1A
 WTEP9PUZAmqXDppURzKIlN06ZkEdaI5OWn6uAnKgiXvFfsb7nVnJ86fzZFZqwYzD6F8.1vymiEj6
 mtolTwKzVjbB9uVK24SQVYp32SmbPFc7uJuwJY6.QBYsxOsoZmpYWy1LzvQu3yrEQvB6IhU6KNkl
 wSuvO.vZWWlxd7zpJsT0nLp9bvr5wC5UfeXmDQHxq9CEeBSMhBPe6kmzGcx8J9_qQGxe6kzfXt99
 HPHDZnVaN5ONbUNM6OCeBbiP6Ys0Z3dis5DLGoZSE5KVuQgfBIAgKC53PJ5MGbirU54ytSags74F
 1q42muLcImT8zOxxvd_pJINZEojg5lLY97Ih6FBK0rCBrUkxvY1TMyG_a8kZE4vKY0pRpHbxnUBd
 v6JEYh0rjHLt3aBe0b5iIjMS96ollCxlsLPfJTbZpgvAd95NRI4HnzLTPYg6Nn3X2yOxzi7ZLHGJ
 EJZitE4UlBBx75lc.8LS_9KRJxDGmXN8.4zkM5cc8YLFQSucjxukUgf3ZE6dnSno0iqb4_8MjHHq
 kQGUjdbTbF6VKous_YDXVI4x_Cd2xT1Go7hySRTHJPtSyRJrJ6G_UhPSR1EuNhZzHSr.X9EA04QT
 6FTeQBcmz6x2j0PIpDJacctYGN52vQVmJUMTMrtaUNJk_ikaCA5W1dby8usI6SGYMhNpXi3cOtKo
 0OFdftEQ7ltrzaqu1AnunCtzlRBLnGyM0b5o1dQ8xKWKduUrNOlm8XNIpBJal8byNETLf8g2mqwh
 dEczCULDirFBOA0XsnPwqolAjQ7.n3WeLeXHDwZO1vveqvYPbvrCBufkpUnf0OcQ20NNofkHkIjG
 ow3mnpE.vkcFIXzTYkDN4K7qLCHvRB3Yjte9a4JA44h_Ek_CifvpER3NXm_2EF.nduqBKjxSWsxZ
 E.gtsAmCTxudiGZpFJGn5XvWoMsvoedimG840xZHQxgFULB03HZNwTCELZ0IW0nzidumomIAZSKm
 eoXJA8pp_weiGfv82vi0Ff5sGkk17i.ttih0mIK6yzjMjfYC5YTuPU1N_KHqEnRPll8tP.BEIgbz
 1wbxhJRaFro1ggn8Q1lswdoVmT24FR_xLZDuIATYmyhcP7XOS8rqSkwaYsxg4y2.aIIt1eiI95Jg
 WPMh7ew4Z6a2_zgGOqSmwoXiS6WQ95ShijDP6UwwiEAKr7mKR8dcAFrejuhgpQVSk_yMUeZwgSca
 eFyrtXZSOCsXhzpCizdnUeXxwkINmRiyqUMyhRU13C3oqsf0dM3Ekz4kLQWUFhFfdWUu9CY0RAor
 p34z0jyToDJEgWrFuxDQqqmp4iTPbyQWCmTlqjD4el5z.VnJVC4j7TiAQHScuqTy9s93CBLRRQTh
 fkucT6SSeK.bWDPt7hqDyD9GRqo1wBaG6a_FwBrf7XlOyabb6mnySxK3CiDnK5QzVzt.VwnwLqmt
 t97CegF1gMWl6SC7gtsKvRT4.qp5ZyGXtqJ5xUBUQJjOe5aFY7BkSwONhXFU7rTsY6rT6_a5AXix
 DEogphSDd_h1nsvKqcmUmagHLs5YDBcxJ5R2.whm0hobpQ_xDrQal1PGAFOLobMC4262ecJOxNie
 kFjKwN0t3Lo907GgYv2eBzy8ZJdWDEWJ_pdm.riDx6X8zr0QpFyDGyzEPW1314mPLxv9pc2VMH9Z
 5TvwKCmjHvgJd6XIaUFHli21_aAKsMBWtu4N.V9bbv51E22_3cTTkGeTFxCJFFcK24xF8fWjvPy0
 Qv6DWC4W8qRXrTnXyPq2acVcWkBFdYu.Ht3Nqd7Zc_oV8hKd8HqhIAz9UpRwpg.4_teyfwh5Z2EZ
 o9d_othZ91D0Ld3RbtSkF.09CbtxZ2mf7lWmE.svKTehcW1Vl692FtmqCn_FZJ2FfXaW8qaoSvkR
 G0Y6k0yTNQ.IeD.P86SONYMlLGNhTOKJiOqeoG3ncFaWcTYzLe7xPXsjTvUx3nDY3nI71M0FQDBn
 v_ihylrJAoC9T1GXJvOUk0.oGgHKIrsdF03oRzo3BVejabWFl8GbrliBE2zfNkgofpPQZvfHV__t
 3OdqnsKz9bu5xJtZm7j.HvE6to4xPqQWlCm7c8g_SXl900w0-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 5be42d7a-e023-4a90-bd57-0fe095e29f2a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Fri, 20 Nov 2026 00:04:22 +0000
Received: by hermes--production-ir2-7c4859dc89-4b5bc (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 8743c4ec77bb2ae3d29817ecdd61e5c8;
          Fri, 20 Nov 2026 00:04:17 +0000 (UTC)
Message-ID: <2cc3faa1-c9a6-43d2-a3c2-7dccb12f0273@yahoo.com>
Date: Fri, 20 Nov 2026 01:04:14 +0100
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
Subject: [PATCH net-next v12 07/13] net: dsa: realtek: rtl8365mb: set and get
 vlan 4k for family D
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
Content-Language: pl
In-Reply-To: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27079 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

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
visited.

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

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/realtek.h        |   7 +
 drivers/net/dsa/realtek/rtl8365mb_main.c |  13 ++
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 165 ++++++++++++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |   7 +
 4 files changed, 190 insertions(+), 2 deletions(-)

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
index 566c6bc..858cf10 100644
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
@@ -66,6 +70,9 @@
 #define RTL8365MB_CVLAN_ENTRY_D1_METERIDX_MASK		GENMASK(13, 9)
 #define   RTL8365MB_CVLAN_METERIDX_LO_MASK		GENMASK(4, 0)
 #define RTL8365MB_CVLAN_ENTRY_D1_IVL_SVL_MASK		GENMASK(14, 14)
+/* Family D CVLAN entry, word 1 (family D has no word 2) */
+#define RTL8365MB_D_CVLAN_ENTRY_D1_IVL_EN_MASK		GENMASK(3, 3)
+#define RTL8365MB_D_CVLAN_ENTRY_D1_FID_MASK		GENMASK(1, 0)
 /* extends RTL8365MB_CVLAN_ENTRY_D0_MBR_MASK */
 #define RTL8365MB_CVLAN_ENTRY_D2_MBR_EXT_MASK		GENMASK(2, 0)
 #define   RTL8365MB_CVLAN_MBR_HI_MASK			GENMASK(10, 8)
@@ -231,6 +238,45 @@ int rtl8365mb_c_vlan_4k_read(struct realtek_priv *priv, u16 vid,
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
@@ -277,6 +323,110 @@ int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,
 				     data, ARRAY_SIZE(data));
 }
 
+int rtl8365mb_d_vlan_4k_write(struct realtek_priv *priv,
+			      const struct rtl8365mb_vlan4k *vlan4k)
+{
+	/* Unknown bits of word 1 are written as zero, same as the vendor
+	 * API does for this chip family.
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
+/* Family D has no EFID, so a VLAN-unaware bridge must learn in SVL (IVL=0,
+ * FID=0) to match static FDB/MDB entries programmed with VID 0. Use IVL only
+ * while at least one user port is VLAN-filtering. @port/@filtering override
+ * the state of the port currently being changed, as DSA updates
+ * dp->vlan_filtering only after the driver callback returns.
+ */
+static bool rtl8365mb_d_want_ivl(struct dsa_switch *ds, int port,
+				 bool filtering)
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
+/* Must be called with &priv->vlan_lock held. */
+int rtl8365mb_d_vlan_4k_refresh_ivl(struct dsa_switch *ds, int port,
+				    bool filtering)
+{
+	const struct rtl8365mb_family_info *fi;
+	struct realtek_priv *priv = ds->priv;
+	struct rtl8365mb_vlan4k vlan4k;
+	unsigned int failed;
+	unsigned int vid;
+	bool want_ivl;
+	int ret;
+
+	lockdep_assert_held(&priv->vlan_lock);
+
+	want_ivl = rtl8365mb_d_want_ivl(ds, port, filtering);
+	/* The scan below visits every entry in use, so do it only if this
+	 * change flips the switch-wide state, not for each port of a bridge.
+	 */
+	if (want_ivl == rtl8365mb_d_want_ivl(ds, -1, false))
+		return 0;
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
+	/* Best effort: restore the entries rewritten so far */
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
 static int
 rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 			   const struct switchdev_obj_port_vlan *vlan,
@@ -314,7 +464,11 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 		vlan4k.untag |= BIT(port);
 	else
 		vlan4k.untag &= ~BIT(port);
-	vlan4k.ivl_en = true; /* always use Independent VLAN Learning */
+
+	if (!rtl8365mb_is_d(priv))
+		vlan4k.ivl_en = true;
+	else
+		vlan4k.ivl_en = rtl8365mb_d_want_ivl(ds, -1, false);
 
 	ret = fi->vlan_4k_write(priv, &vlan4k);
 	if (ret) {
@@ -322,6 +476,13 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
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
index 009b127..625d4c1 100644
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
@@ -43,4 +47,7 @@ int rtl8365mb_vlan_4k_port_del(struct dsa_switch *ds, int port,
 int rtl8365mb_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
 				 struct netlink_ext_ack *extack);
 int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid);
+
+int rtl8365mb_d_vlan_4k_refresh_ivl(struct dsa_switch *ds, int port,
+				    bool filtering);
 #endif /* _REALTEK_RTL8365MB_VLAN_H */
-- 
2.53.0

