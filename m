Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592789;
	b=GG3v30XJPR9TTq+jxOLl7EU6QOfhF43xdyLeY3B0sYMEJ/TB6nSWyiigrQN4Esm8n6Ji
	 2ZLpQSY4oAIqPcc+46IKP8TJzvOj8zyZ7txB49G2UElP/cAvMnMlQo6VzWOSP16ZmIQlg
	 hwy5ZiECPVpbvcrTLmHDgiBIX5MuXz13DgT+IeMpA1oC4K+o9cU3tGPXyY6Sat54cwx0v
	 GMOqzr4tpyPifYkMyK/TyvI0IKTYgg0NUw+hLTtgtJbYrJHhAaQMzt/i4AbOUIBdtuqJq
	 7QiBN0E6SPlUk4ww1KZ1IniIJGIXVM5O38Z/CWSSHT2rPpNmJapSRjD1eDu3L15RQ7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mPUVHCKsis7yk6TWYroZKPBNx3lL8fJQOoHY6BkH8A8=;
	b=kVAVkhGHW+U4+xxYGfJgOO57EyXiQymeUnBjsZOEfsHEPkeyxwZ8FmGfT95LxvPWcrJR
	 AQjUdBnjqWx/2S1ABPZ53NtqaAhkLrfGxZfGOdeoz9EGDxIu06RakZAJotHbIc0E/Oky1
	 o6x4KP6Y0av70SVlX9CpPEhnqRCQ3nEmzWGJk1TULO9pTKIYiqz7vbq/vwgxT9sciqIly
	 x63FXK5iuRKE+iY9d6qkn7dAV6gIHBLey+mL8sdqKLA+MhSjd7QnA3XJcalfoH91hyUv0
	 GBT2Xvo+n3SsRYvwsb66FLhLVpyTZiCXH+s01QG/wjGvpvq/24KUOfyh2c+D9xyZSNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOTXZSs9;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF7B606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF7B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOTXZSs9
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3b4be95e0afso1125023a91.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795592788; x=1796197588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mPUVHCKsis7yk6TWYroZKPBNx3lL8fJQOoHY6BkH8A8=;
        b=JOTXZSs977jZ2hjYo4g+E4jfbHTxF/nwtH4MiHhLO+dwJvIk3V9hZaMvL/qF1xRw0C
         Bm8wd9p091qfBAtwwY+7OeITpA78Ind3goh0+JD/lH2tqvY0TVAD7WgaGHdlBmc7i65Q
         AcbI+WStmp/C7WnKf78SSY4tYDP7fQ13EqaSS8l6qCmgycwaabTdqvorrGnWeRH63CDC
         h6WUAj9cDingPl97IlnGDlCkcEVNx8qk7xSkTX2stG2zdkPmOgp3Lqw7Dao3nKnqq11r
         wiTwBJdb0QKbwf2tq+C0aZnkpLyJCpz+Fz/2v4sBwLmH6KhChf6FY5GSs7xj8LiwKMld
         GATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795592788; x=1796197588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mPUVHCKsis7yk6TWYroZKPBNx3lL8fJQOoHY6BkH8A8=;
        b=M5h490ugwYzS09amT5Di2hq2GyxrfioKoT+Oqri4h3gNcSpNOFp+OJvgP2NcEgatFD
         iZXYELFPBoalSk6Xa5hGKIjgzSn3SzeKKQxshob3MLqVpCqVtT9DxCN4seYKy3TWLCi5
         TfVL15tmZKuAOmcgDJTE5QeB/i8NwjJ0qCuID1/LTfDE8GyFRLdCjaOShyE3As9exFRB
         Jz6a0iD1Y8ZA/05yrtaGa0KzRQdpoIaYGEZ3EUczJWaf4huNfn2z4CAO2lmgNLF81AXS
         f7HQ5qDWB5Y0B8ljN2z2MiG0nRZCn8m3d0JT6gsKXjszR81xa6I7dCBT63AvjuD3nC2i
         4y7Q==
X-Gm-Message-State: APuU4Z8kvaYce7VBrWfP521vWjVlwGav1n11kwDXG97nJzZtXJAS36sn
	IYuRKdWx225a6XEsWgkzuhUiUeSNgPEkJsS9PlD0p+BhhrW2LFPuM3k3
X-Gm-Gg: AZFdTZcoHBAxKFLI9wP4qbtfS679ZRMPtovSMABqKSg2n8qC8sRzl6cFiR0hDuOlq+I
	EZKQ6eQOPWZJPa7BGmGFb1a2OzpNYfqQqZzcJVKHQfzS3mD/HrQlNjJc9xrQltg/dUhaTdGHqRP
	gS8nMKyucxhV3CLdxKA+TiGbLNvsNN2zXu+suW9v5g3sSqezLrA+pbx4xN8WzEK27UgPQs9UGiD
	88d5gXeu9U7+szqQftox0UnRMYqc0fK9Lgq2MviXES9H5YePnOmurFGcBpb1N9BDs8YRXOJJoIK
	Qh9I8bVBl8nhkn0wnv7UVe8l1STedKbWfF3825ccKA11HEbwmQujNo8srf+oPwiVNfm2gLZfvA9
	DhW/sK6zQa9Jn+T3EXGAd1zlupo9SFcMi+5iqls3o3x3x2W4vJQnql/PkhI8ItadxIWOHvevV7u
	RDmEBU6/EOb1QTfxoQP9PZ2y4fldO2LqCRKi6wjZNtF9NiP0R5Hk9BAbqmuV7DA2Xq5/Ap9f3dl
	5fArsCBe5/15g0Y3kUii6vbLxoBNy+SUWbT2b7a9fdARfrOxMe8qWWakm4Il8nEKPzQ4UzsItDO
	Xvx1p5FdjpTTlN/IJDJ9T1o9YuaGvOdtN+oFrOE33lLiBp++gwhPxT14ANglOVl5LBYvH99Y2Py
	v
X-Received: by 2002:a17:90b:560f:b0:3b4:60aa:9b74 with SMTP id 98e67ed59e1d1-3b460aaa7efmr10606579a91.65.1795592787857;
        Tue, 24 Nov 2026 23:46:27 -0800 (PST)
Received: from BSDHENRYMA-PC1.localdomain ([43.132.141.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfec090sm8662460a12.14.2026.11.24.23.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:46:26 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	yanhaishuang@cmss.chinamobile.com
Cc: netdev@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v3] ip_gre: fix stale header length after erspan version change
Date: Wed, 25 Nov 2026 15:46:17 +0800
Message-ID: <20261125074617.629026-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

erspan_changelink() can switch an existing tunnel between erspan
versions, but the GRE header length is only computed once in
erspan_tunnel_init().  After a downgrade to version 0, tun_hlen stays
8 while the version 0 transmit path clears the SEQ and KEY flags, so
the upper 4 bytes of every pushed header are uninitialized skb
headroom sent to the tunnel peer.  An upgrade leaves tun_hlen at 4,
so the version 1 transmit path writes the GRE sequence field over the
GRE base header, and the ERSPAN header grows without growing
needed_headroom.

Triggered with a version 1 tunnel switched to version 0: the four
bytes above the GRE base header carried the heap marker sprayed into
skb headroom instead of the GRE sequence number.

Recompute the header lengths in erspan_changelink() on every change,
mirroring the IPv6 side in ip6erspan_tnl_change().  Sample the old
length before ipgre_newlink_encap_setup() resets t->hlen, and run the
recompute right after erspan_netlink_parms(), before checking its
error: ip_tunnel_changelink() -> ip_tunnel_bind_dev() consumes
t->hlen, and a failed changelink must not leave the reset value for
the next call to sample.

Verified on v7.4-rc4: alternating erspan_hwid 0xff (-EINVAL) and 7 on
a version 2 tunnel keeps the MTU at 1446 (v2: 1446, 1434, 1422, ...),
and changing the link of a version 1 tunnel yields MTU 1450 (v2:
1458).

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: f989d546a2d5 ("erspan: Add type I version 0 support.")
Link: https://lore.kernel.org/netdev/20261123062752.27920-1-yanhaishuang@cmss.chinamobile.com/
Link: https://lore.kernel.org/netdev/20261124014646.7954-1-yanhaishuang@cmss.chinamobile.com/
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
v2 -> v3: move the recompute block right after erspan_netlink_parms()
          and run it before checking its error, so a failed changelink
          leaves t->hlen consistent and ip_tunnel_bind_dev() no longer
          sees the reset value (both reported by Haishuang Yan on v2).
          Fix the changelog wording: the sequence number overwrites the
          GRE base header, not the ERSPAN base header.  Add the v2/v3
          A/B numbers.
v1 -> v2: sample hlen before ipgre_newlink_encap_setup() and recompute it
          on every changelink. v1 sampled it after the encap setup had
          already reset t->hlen, so the delta was always the new ERSPAN
          header length and every "ip link set" on a version 1 device
          shrank the MTU by 8 and grew needed_headroom by 8 (reported by
          Haishuang Yan). Add the runtime trigger observations.
---
 net/ipv4/ip_gre.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index 5485586fa0e62..f2103819788a9 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -1351,7 +1351,7 @@ static const struct net_device_ops gre_tap_netdev_ops = {
 	.ndo_fill_metadata_dst	= gre_fill_metadata_dst,
 };
 
-static int erspan_tunnel_init(struct net_device *dev)
+static void erspan_calc_hlen(struct net_device *dev)
 {
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 
@@ -1360,9 +1360,16 @@ static int erspan_tunnel_init(struct net_device *dev)
 	else
 		tunnel->tun_hlen = 8; /* 8-byte GRE hdr. */
 
-	tunnel->parms.iph.protocol = IPPROTO_GRE;
 	tunnel->hlen = tunnel->tun_hlen + tunnel->encap_hlen +
 		       erspan_hdr_len(tunnel->erspan_ver);
+}
+
+static int erspan_tunnel_init(struct net_device *dev)
+{
+	struct ip_tunnel *tunnel = netdev_priv(dev);
+
+	erspan_calc_hlen(dev);
+	tunnel->parms.iph.protocol = IPPROTO_GRE;
 
 	dev->features		|= GRE_FEATURES;
 	dev->hw_features	|= GRE_FEATURES;
@@ -1499,6 +1506,7 @@ static int erspan_changelink(struct net_device *dev, struct nlattr *tb[],
 	struct ip_tunnel_parm_kern p;
 	__u32 fwmark = t->fwmark;
 	int err;
+	int hlen;
 
 	if (!rtnl_dev_link_net_capable(dev, t->net))
 		return -EPERM;
@@ -1509,11 +1517,28 @@ static int erspan_changelink(struct net_device *dev, struct nlattr *tb[],
 		return -EOPNOTSUPP;
 	}
 
+	hlen = t->hlen;
+
 	err = ipgre_newlink_encap_setup(dev, data);
 	if (err)
 		return err;
 
 	err = erspan_netlink_parms(dev, data, tb, &p, &fwmark);
+
+	/*
+	 * ipgre_newlink_encap_setup() reset t->hlen without the ERSPAN
+	 * part; restore it before ip_tunnel_changelink() (and its
+	 * ip_tunnel_bind_dev()) consumes it, and even when the parms
+	 * above failed, so a failed changelink leaves no stale value
+	 * for the next one to sample.
+	 */
+	erspan_calc_hlen(dev);
+	hlen = t->hlen - hlen;
+	if (hlen) {
+		dev->needed_headroom += hlen;
+		if (!tb[IFLA_MTU])
+			WRITE_ONCE(dev->mtu, max_t(int, dev->mtu - hlen, 68));
+	}
 	if (err < 0)
 		return err;
 
-- 
2.53.0

