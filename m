Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060925;
	b=UaJpRXdfy4fh2tUJChKGbpH8Q/ztV0rU0B9O6B0zKQypjM949Jkxv95XoqSHdDjkrBLb
	 Rwq/D7IotGM8lcyOn62BCcK9Ax0lsRxsHaNrs6WhiIK6mEJBgOv1XOEgL+RjOTZFyhIna
	 JnmP3oeoBWWN8xNgMrk3EM7DixvbPKKPuEs3gL9e95lTWt+K3IzyhpNlX5g12neKHhZ3x
	 gHgbSiWeuz48H1nGizYjYLRQxkl9t6RSWodncgT9N5QmL51duM0w7Ua23mvNf0A+L1ix1
	 dgMegm08X9ieyXh/gEjud5sDkQj0HyA/5flbRq2oxC1EuRdt+7cGEOYngArK/kNdlDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ki+hym5xBnLUsLIUPy9cHW9nYAaIrxILlRLJC6d61Q4=;
	b=DdozOCr9r03xQGaW6OA+ueXO/mCvqMMw2E7+wkPscHkrKp6cPy12EAqYZaFBbesUlPtf
	 9j2MqWnC5DS/mjQs7qxgfQD5kxVqeAgstbFvZYLcK3195fIpo7jgSLLVZb50ARYi0A3hN
	 CWKASqD1doq3HEkgD0WIbYoTzg70ZV8gxLc99ozgK/BOlDTR4wuHOuxT/M/atgJJrOgfG
	 3GsLaA+H+y4YJbcltNyZpaXiml7G2UTYbYJ0Tuw2hRjnbepp+m58jx/YT68K512qb4J4K
	 2OKqWOXNkpL4sPUZgvnJSNTMMRdRmTCUC+l7lFZm5kD78Z/fPXFYhn7D84lD+KvOsOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhBGpxNL;
	arc=none smtp.remote-ip=74.125.231.128
Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2A4606A332
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE2A4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhBGpxNL
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-71b1c6cb11fso339863eaf.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795060924; x=1795665724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ki+hym5xBnLUsLIUPy9cHW9nYAaIrxILlRLJC6d61Q4=;
        b=YhBGpxNLOS65RBwZNOx35XebtNQustjfOo9inRNweNvTqgNnl7g1XXs2Gic+Z+ZZJa
         BPzBkbQintn+wN81KAlk1T/Gkv7oYnoav65I0tImgcgL/Ed4nW0ptb502FMzsOtKCdb8
         g+qgRBISkIFyNkZu3MtVjmArSPJQ0DmEZZL+CbPTgFYO3/CLXQX5Kt9rK5LEN5jdeTyj
         mK5Hta1lq78vTSLehnS5Lj3rqmxGbzQNZpKkbgs8wPgqouv9ie0RlFnQX56L0ikhVLu4
         zMTgo2vr2I53eabkOhPc2DUXOGkJDS9Y05lgQPahHwUSNCBIAnNek94k9iJcdPmILs5/
         xX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060924; x=1795665724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ki+hym5xBnLUsLIUPy9cHW9nYAaIrxILlRLJC6d61Q4=;
        b=PN4bk/jYy9MdnEg83EM/XT3aHpwh/XDkdcxmV+9xTCmFYjv65D7Nneb2HaWaG9mBUz
         bc4L21Yj1Dx2eSDqoMFQ7n36rD3rSRYBi35Gd/eaqtOFb+rcvYXJEyOiFirMxtOHe+xJ
         4HyVbHz6oxX7QWni/zI3kEJyO419yXl8/dPS8fPZ8nFgQqq2kN/1cSYF/oQKUzvKnutb
         1ytPGMGmbV9Kv9dHlKx7Ik17G7c3aM7meTmpb3JQdAT0alNDFMpvmTTbIfGc2SEOW60S
         dC7ymi74v3N/v1JKvegeP3lZKzK+H56woX8DCOh0vWFzDA+9nrUvj6ZeWW5RYk67MB+0
         TVbA==
X-Gm-Message-State: APuU4Z/Zprimj+/dKAlA8N6urxE1Y1M9D4nJJPtNhwDOnY95CoXqIRRs
	spqGMbcseIhBOMYXvzBNFPVxlPlYxEy2IiFg380YRYLi6TeksUfT+XOh
X-Gm-Gg: AYBFou2CQr48D+/8P7e4C0SYhoFZaHD9U1M9Nk9S2008NaZlbhWqm1Se7pzX37cQqmU
	iEkhGh7sqMdj9Q0M8emJ/Ui8ZyKpu1A5l+08v3b+hl0ePiCjWNf6jyP7cTFgqMiQNjDNje0sE/G
	ugNauYSh6hQjvFHcqx6J6Ah3OvBcRC1HITfQbDFKM8nnoBxhruH+CbsubFsIodYqoE3tgTDuSc7
	DM42yA4gdJyhachAOJK185LIRAazwrgOb49uX6l4FV4E++iJ5IWMuqu3vHP+MKffF/mn+bDNPfZ
	h43tiTh3cPxUFmPKovSYHlE16A5HMLGqAtj7+wsXIxGpqtwLJJKjLafgj3Cl80z32ldrtcAvZ2a
	iTBYiyZzfrkfrlUI7lPlvf3cKvAsHKdFmg6TX7PpeGocW2+0755c/fFt2YSlphdihMJRw7JQ2Ct
	1ZsbtvdALzWbAfaNU+XAP0/HxomdJq4kp1Tp7iEpiiKyDcdRYadbhE1yH3xzicKQG0NE2gqEdwl
	ZRffAT1hpYzZ0O1A/33YKwAF2C36QDaCmFHgYOSq2NyRPklUDTaQm7H8pgrSVr2O1WF61odh4AZ
	nEQCT+x69HThKGFKgOl/kUqOsAfVUqAwVxd4F6JCb6C6xH0cD/OpLJeC5iwBLToUizHLdb/Mjk/
	CKiCeYMTiqzMR
X-Received: by 2002:a05:6820:338e:20b0:71b:188a:319d with SMTP id 006d021491bc7-71b188a3436mr2906072eaf.53.1795060923744;
        Wed, 18 Nov 2026 20:02:03 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.162])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b744126dfdsm4163497fac.10.2026.11.18.20.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:02:02 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Yuyang Huang <sigefriedhyy@gmail.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org,
	Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net v2] net: zero the tail of ha->addr when allocating address list entries
Date: Thu, 19 Nov 2026 12:01:52 +0800
Message-ID: <20261119040153.158372-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

__hw_addr_create() allocates entries with kmalloc() and initializes only
addr_len bytes of ha->addr.  The dump paths emit each entry using the
current dev->addr_len, so an entry that was created with a smaller
addr_len is dumped with uninitialized tail bytes.

dev->addr_len can grow after the entry was created: tun's TUNSETLINK
changes a device from ARPHRD_NONE (addr_len 0) to ARPHRD_IP6GRE
(addr_len 16).  On v7.4-rc3, with 64 entries armed on a down tun device
and the link type then set to ARPHRD_IP6GRE, RTM_GETMULTICAST returned
16 bytes per entry of which 37 were non-zero and 21 started with a
kernel heap pointer (e.g. 0xffff8188_04857ee0); /proc/net/dev_mcast
exposed the same bytes.  This discloses stale heap contents to readers
of those interfaces.

Allocate with kzalloc(), so the tail is always zeroed and a dump can
only emit bytes that were written or zeroed at creation.  This also
makes the explicit ha->sync_cnt = 0 initialization redundant.

Cc: stable@vger.kernel.org
Fixes: a748ee242681 ("net: move address list functions to a separate file")
Link: https://lists.openwall.net/linux-kernel/2026/09/10/320
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
v1 -> v2:
 - allocate with kzalloc() and drop the manual ha->sync_cnt = 0, as
   suggested by Eric Dumazet and Daniel Machon
 - add the runtime observation to the changelog

 net/core/dev_addr_lists.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
index d827cc21867b..9613c8a9ed7f 100644
--- a/net/core/dev_addr_lists.c
+++ b/net/core/dev_addr_lists.c
@@ -96,7 +96,7 @@ __hw_addr_create(const unsigned char *addr, int addr_len,
 	alloc_size = sizeof(*ha);
 	if (alloc_size < L1_CACHE_BYTES)
 		alloc_size = L1_CACHE_BYTES;
-	ha = kmalloc(alloc_size, GFP_ATOMIC);
+	ha = kzalloc(alloc_size, GFP_ATOMIC);
 	if (!ha)
 		return NULL;
 	memcpy(ha->addr, addr, addr_len);
@@ -104,7 +104,6 @@ __hw_addr_create(const unsigned char *addr, int addr_len,
 	ha->refcount = 1;
 	ha->global_use = global;
 	ha->synced = sync ? 1 : 0;
-	ha->sync_cnt = 0;
 
 	return ha;
 }
-- 
2.43.7

