Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446683;
	b=a8r09CBKd9umAuMVAEj/4LkcO+Tan1Sa6LMG175QI8+nWtSGlhITJE8J7LyfGtoS/GgQ
	 vnw6g+1wqRd4IBhsi1BsbPElVWoeXS8moROua68INZaaVDmgEnIsztWxcTYl5/o8O6HRY
	 MMcQWMhRJhC9VZwT53Qiv/wIFQfQm94xjZc08rsMg3D2XLacQcFbC6lmSxYNwOuQs7k/u
	 XzLkslbIxdE62ElBHzXL840+x34gsYwrUugrZzS+Zo8mm3f5JPF8pT0KO1uwTM5yOnESq
	 C/gajrD9ck1kwlJzwicLBR5wNqmMdnNzta6aSleOT3cvoSgfttSSKtw8Q1dY2GDEM0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446683;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=4g+57NcIYL3QlojIx2fxjF8f/AubFeNsYW9DPqlJVLM=;
	b=RAVQ3uXhcxqMO469fm4xldm/lIkPGmveRyeTo/WH1LrAgYa4k+O0mGg2lKe7RCTk28f2
	 BrRqUG1wVZPcGn7sviCedbn4Z1usBlkeU0NHu5kT6ycuqUQ5BEysT/BEni3MaNJSsxRun
	 IQGLsQrhdx49VmM3/xQxDAbaPV/ItVBMXMhCsq/uv4X3zfZwKr8poBlfrGSl+2ncDuNdq
	 GtfwRZRV2LBC2SJbL5yby7uo/xRWG+3SCweH2ZxWn9Xk3mRSKcRryIW81Funf7Leqy4LT
	 fahxMD21b0FXE5XBL3R6OxQwx1LISL4yTJXevdl42OJkCmh4NzqMEX5NuRhYhgxKxjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748C2606A31E;
	Mon, 23 Nov 2026 15:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 748C2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 240B8433F8;
	Mon, 23 Nov 2026 16:11:20 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
Date: Mon, 23 Nov 2026 16:10:06 +0100
Subject: [PATCH net-next v2] vxlan: always report local address
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-vxlan_preserve_local-v2-1-72d89179a98d@proxmox.com>
X-B4-Tracking: v=1; b=H4sIAF1XBGsC/32OQQ6CMBREr0L+2hp+AU1deQ9DSKkfqcGWtLWpI
 dzdgnuXk5k3Mwt4cpo8XIoFHEXttTVZ8EMBapTmQUzfswZe8hNiWbOYJmm62VEGI3WTVXJiqhq
 kaASJMzaQ0WwPOu21NzAUmKEUoP05/t0/SYWtdcuO2gfrPvuDiDvxfywiQ0aib3DgWPG+vs7Op
 pdNR2Vf0K7r+gXNksEM1gAAAA==
X-Change-ID: 20261104-vxlan_preserve_local-c3fa959e9715
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Ido Schimmel <idosch@nvidia.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabriel Goller <g.goller@proxmox.com>
X-Mailer: b4 0.17-dev
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1795446678922

When a VXLAN device has no local address, link dumps and notifications
contain neither IFLA_VXLAN_LOCAL nor IFLA_VXLAN_LOCAL6. If the device
also has no remote or group address, userspace can't tell whether it is
an IPv4 or IPv6 device, even though the kernel stores the family. FRR
runs into this when it finds existing VXLAN devices after a restart.

Report the local address even when it is unset, as IFLA_VXLAN_LOCAL
0.0.0.0 or IFLA_VXLAN_LOCAL6 ::, so the attribute type shows the
family.

Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
---
Changes in v2:
- rebase
- Link to v1: https://lore.kernel.org/20261104-vxlan_preserve_local-v1-1-e9b51f2132b4@proxmox.com
---
 drivers/net/vxlan/vxlan_core.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index d11028b37472..b7ad60cb5d12 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -4765,18 +4765,17 @@ static int vxlan_fill_info(struct sk_buff *skb, const struct net_device *dev)
 	if (cfg->remote_ifindex && nla_put_u32(skb, IFLA_VXLAN_LINK, cfg->remote_ifindex))
 		goto nla_put_failure;
 
-	if (!vxlan_addr_any(&cfg->saddr)) {
-		if (cfg->saddr.sa.sa_family == AF_INET) {
-			if (nla_put_in_addr(skb, IFLA_VXLAN_LOCAL,
-					    cfg->saddr.sin.sin_addr.s_addr))
-				goto nla_put_failure;
+	/* Report the address family even when the local address is unspecified. */
+	if (cfg->saddr.sa.sa_family == AF_INET) {
+		if (nla_put_in_addr(skb, IFLA_VXLAN_LOCAL,
+				    cfg->saddr.sin.sin_addr.s_addr))
+			goto nla_put_failure;
 #if IS_ENABLED(CONFIG_IPV6)
-		} else {
-			if (nla_put_in6_addr(skb, IFLA_VXLAN_LOCAL6,
-					     &cfg->saddr.sin6.sin6_addr))
-				goto nla_put_failure;
+	} else {
+		if (nla_put_in6_addr(skb, IFLA_VXLAN_LOCAL6,
+				     &cfg->saddr.sin6.sin6_addr))
+			goto nla_put_failure;
 #endif
-		}
 	}
 
 	if (nla_put_u8(skb, IFLA_VXLAN_TTL, cfg->ttl) ||

---
base-commit: 2388bb763e323442f4dd8189238ac0c5f334c4a0
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
change-id: 20261104-vxlan_preserve_local-c3fa959e9715

Best regards,
--  
Gabriel Goller <g.goller@proxmox.com>


