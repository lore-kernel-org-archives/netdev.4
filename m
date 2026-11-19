Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123279;
	b=UIx7AEKqDYys0aj52FePn9E762gKQ5VM+aNjfy/tax3bb6YzhgEuDmrK1Oa4ukGaq7Bi
	 tYjLnYtmzwcnW7yxRJRNpuVjP41/WzOgrPY/ZH50TuNEhzigVfC6VO8czm4fuzgsVMaIM
	 x3ZYZP3mOIfUe3fi4Wq/YnDP+f7DD9Fhg6LxgxKbXB8/31JoaZvdvdtlEDqItoEu4uW/W
	 cazmmDNJiTl0z6xc5etpXi9A2zzy0Q66scUKW29AmVk2wV2TV6UfYHla55XJDEO8nxsXu
	 EtPUrvpVfeQR11auwk6w0fiHVxsXhhyLZPGjUn1bgaRDXx8h7ZSq/zz0q6UF+o/1F5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IxbcqXDp+7lwlw2Bt8v10C2qLAMvpra0R3wselVisNo=;
	b=gGZg5O02dMDQsY6KEE2IPxThFxtthKzQYkpzGkectMiGtVR2o2M/gGpZEBciIDoW95uU
	 xPiP064jZ2cBRjmUuKPhnFzqX1dDvPINQH8H4/uV/zj7+I4PGqrtwKGAHlGxEJ08EEBwJ
	 P0wRnPpeBvA2Jxu6yMZjujoGz5EHxyfsGQd60hCy/k7XxfV4bCmUOIsaO+zi9TliXKp6V
	 7WCtUCmw2EpZofyFhceDOzgipF8MmDqEdPu4wEZ0Zsy33aw1/nY3i8DOUmshtGDQMhsEd
	 kdu0VehytP4SvehabfLGxv2GzoTB1Rfz+gOrdwJEvo51ccQdnlKW8YzElaopNo4PV9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Wva/SJ8d";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22B6606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E22B6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wva/SJ8d
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38190551625so230356eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123278; x=1795728078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IxbcqXDp+7lwlw2Bt8v10C2qLAMvpra0R3wselVisNo=;
        b=Wva/SJ8djy1iTCcj15UXKpg9PB4aURFnuU7ZuBMi9SHy9YLxgpL5lr0oJHWudRyKz+
         6ul/vp6ZdCSzfJFV9ELpGaKuGQZ+c8zE9Xf5bI31ibB8DeKRuB7YycvfOpyOd60FAgaG
         2bpsA8FmEZbSjOS58Jl/h2elSABGlyH8la6yOZ+lhjSwSPPrwDQ2sdsT912eRvqtrlll
         w2B0n7sgPK6g9KkHsBbD56fe+mozRMlOWAurX1IosvfWg8VgGaGlAjwmu6Y9ux0Fi2KN
         aZ8MnUp16cuUbN1WydmsbpGYSLbSm2Bvy7ZtPsfzJPcV5TR7GzEqbx8Wta8XhkhvTwWV
         spIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123278; x=1795728078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxbcqXDp+7lwlw2Bt8v10C2qLAMvpra0R3wselVisNo=;
        b=X+NM0t4QPlmZTwhcqUHb3GHEuUj7zpOHonqbgUarHWD1q/fwl9+4PnkGdMYNoIgZiv
         V7HmlbVs0A72+LGPynbIbaiNzG1WtmVo6syxKtvQMRzbged3otNP4/S2C3ZWE8pgziyC
         QbhxCyK4SkA2RjhxCh2WDunRG4q4t5gBOa7sIXL2PzPm0BYyin2N5sUDM215NTcfx29n
         mWZ/PY7bMdGHyY3BD8ZUZPDSOAGJvgiKjWlExHM7pdI6i2vO1jYO7W/tHQnSU/3Ekcec
         RGRzVDmGRGO9fbkxWlQJFBl+j8K44sQlRgQ4dX3mRSpdxX9IByRKv+5FC2Lfb+whsAoM
         khlA==
X-Forwarded-Encrypted: i=1; AL+hErFUV/ZNnYFeTMWR8G14UpPgbxZLY7R0P2W2GnhEytTzSqTW+9HutE09+MwhxBSC1fRhrOk9vuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GXEuyARKcH+4X7Ap4CxGt8+5tPPZ1mzxrOAINBjvG8cElmu//
	bpe59QelqyeUjvTv9fdYcZ0tS387gBGWhNMadg7vB82JZhqdRC9CmX7c
X-Gm-Gg: AZFdTZeBtMqD3xRaACiH7cIFCzkXmPASa8rxCMir6RYT/G5L6humf0zYuWNH7a++T+P
	MR1YpYVLZKqMeDAfBrLgsZXWQ9BeaWPY7S012TMXrbqjldY8lXkIi6KNn05R4BkJGbzfZbjSDjG
	KOqAflzWi21w/7CIiMLuG7R+U0Xb+Oxe+FYUKWBI3Wad8LB7LFjttkdjE7uysBtJVvgJB3g3hhq
	GR5c9whKnAR8nCP4xheFjruFJn4kfCzoAxcVGYGgop/CxDoizMn6qoTbXdFHYI/DDUgj77KIVAn
	hvcBpNK/zlZTtwK3l9H0HTyO5GmvcLxr2hSVSZmHe9VuZBmM0N/VHmcEK0HVplbjgKOUXgVBP3E
	LZNMw386eyr8M9FSUFG6DueZUZpR4TNICMItE8hoVPGgO/8Rwgi8C1PAqwrO1Ig8L5RqgiQeKW2
	hsNwVKgX489J6MzppktRrZbp8NZyMzXPEbFRKE0Kkw9UyeSDEck43gfmZI3r6wpH6wYVY2XDAh2
	ifdOfg7A6YNj8QBgiKLEsIobZiLp00JNe51QWr4e6jrjVn6EnZoSeX+KxtTSs9Exkz/92rHHSpx
	99DHh0X+JNRM3TmbMnd591gr7bPkv/Ga7fOjwTFARbyx2jBlevt+WloG9QrD
X-Received: by 2002:a05:7300:824c:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-385702602famr579637eec.27.1795123277901;
        Thu, 19 Nov 2026 13:21:17 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm1174588eec.9.2026.11.19.13.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:21:17 -0800 (PST)
From: Zhengchuan Liang <zcliangcn@gmail.com>
To: Aaron Conole <aconole@redhat.com>
Cc: Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pravin B Shelar <pshelar@nicira.com>,
	Jesse Gross <jesse@nicira.com>,
	netdev@vger.kernel.org,
	dev@openvswitch.org,
	linux-kernel@vger.kernel.org,
	Zhengchuan Liang <zcliangcn@gmail.com>
Subject: [PATCH net-next v2] net: openvswitch: avoid hashing the network namespace pointer
Date: Thu, 19 Nov 2026 13:20:46 -0800
Message-Id: <b2853b9410d049e08b3e2ae2491e775506b4f0e8.1795122681.git.zcliangcn@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The Open vSwitch vport name table uses the network namespace pointer as
the Jenkins hash seed. When an Open vSwitch vport already exists in the
attacker's network namespace, unprivileged OVS_VPORT_CMD_GET requests can
look up attacker-chosen missing names and time whether those lookups
traverse an occupied bucket. Ranking the resulting collision pattern
across possible KASLR slides recovers the init_net pointer and thus the
kernel text base.

Use the namespace cookie instead. It is a stable, unique, non-address
identifier that is deliberately exposed to userspace. setup_net() assigns
it before per-net initializers run, and it remains unchanged for the
namespace lifetime. Hash the cookie down to a 32-bit seed so vports in
different namespaces retain namespace-dependent bucket placement.

Found by AI-assisted code review and reproduced on an unmodified kernel
without fault injection. After privileged setup created the resident
vport, the timing measurements ran as an unprivileged user with no
effective capabilities. With this change, the pointer-derived prediction
fails. Existing and missing vport lookups behave as expected. Identically
named vports in separate network namespaces remain independent.

Fixes: 46df7b814548 ("openvswitch: Add support for network namespaces.")
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>

---
Changes in v2:
- Use hash_64() rather than jhash_2words() to derive the 32-bit seed.
- Use u32 for the local hash value.
- Drop Cc: stable because this net-next change is not a stable candidate.
- Drop the deprecated Assisted-by trailer.

v1: https://lore.kernel.org/netdev/4e124b37fc972925a825881c50f95eb6b3c2e231.1794989369.git.zcliangcn@gmail.com/
---
 net/openvswitch/vport.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
index 083f7a8d9d4e..04e4df103b26 100644
--- a/net/openvswitch/vport.c
+++ b/net/openvswitch/vport.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/etherdevice.h>
+#include <linux/hash.h>
 #include <linux/if.h>
 #include <linux/if_vlan.h>
 #include <linux/jhash.h>
@@ -53,7 +54,8 @@ void ovs_vport_exit(void)
 
 static struct hlist_head *hash_bucket(const struct net *net, const char *name)
 {
-	unsigned int hash = jhash(name, strlen(name), (unsigned long) net);
+	u32 hash = jhash(name, strlen(name), hash_64(net->net_cookie, 32));
+
 	return &dev_table[hash & (VPORT_HASH_BUCKETS - 1)];
 }
 
-- 
2.34.1

