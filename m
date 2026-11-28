Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795864463;
	b=AiRy9H3jYs20cBFrnt/7gYm/fAor5nYPWtCbaSz3t2AfHZEirzQkDTcQmrM9TV8LSdqi
	 uyPsmDAzhKyUYEVBb4NT8GElbnULn2jM9+CSy/3EPR4tD3Wb07doCOToEyWxmOF0J/Nar
	 5GgoQYW1VlpYiG7N0dL0T9DukpkYiEDSomjCRIIHDwXTWPCoDtGxYcJjq6Set58J3cZur
	 +/XfCi6UvOceXkjpxt042CNE9YlngGd3xZI1yQm0IaaXslJJC5IIQB/tPJgZxWBEBENwO
	 rQn5GwvJEvEfE8iYKL7BfGyt5hiYY3WuPCSlG6mOJGuXG+5HH9x3Ud5mKIVg0FqP7rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795864463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=WLFznbBsCf+Ohaj/eYLW/BFxVjrxtoJhvpBPo1wlj3o=;
	b=x9cBdy3gHfVBD5KLF1yF3vJqrrJw7uiSCRGsGXT/Y0Vs+rNz3azHQCtbmpNq+ojvHwlG
	 JIA8Nun7MceWMNry9pPxNDwvz2/jChQNu0SbRc30r/U/sxjKcjLclmsozqZHwYx6L6sUH
	 xSmvf7Isz6UeatlIAtGQaKq+xKH5WPrPijezwYioXxRn5N7TCW9qbJOyVZYMTQe5jrzGy
	 eAtzQ3KzIJFbLOFOXnDQyF2iDptFi/N6Ihj5JsaemaC124gurgBnVJbhHO8H9GWWs2Af/
	 zTF9P3OoftYbk8iRgL4xQNY2B4fZlHQqp+iF+ZErkn8d8LWzv81DN6n9zxFQa2f/LqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=reYsfbOc;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF48A606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 11:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF48A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=reYsfbOc
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b2f59de176so6389318b3a.2
        for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 03:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795864462; x=1796469262; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WLFznbBsCf+Ohaj/eYLW/BFxVjrxtoJhvpBPo1wlj3o=;
        b=reYsfbOcevyEPcTyOPXCcG2U8sPe0la73CEHLrRAEiJLWhsvGWTlkWR4GFslXT7vKb
         kZYvRP0Qv1N+mRThAN82Ya4eAE1FrWSefjhu5iL0DWT7WBSztCSjACc8HLIFaBBZS75X
         NXmX5mgS1ib0zVNhIqoqxsoUFvbfsN3fq5HJn01rmJDkIp0JcDCddVe2zgr/0aXv4UpR
         LDQkzlb6/7lNBsDLfP9tCJwcsRmGD/QC7KukP4eRd/lkwZFdvsIbN9co8ouYkCz5fSod
         CGus3H8XHYkQwdRv5SnDX6yZ48aXKmGnN4b0rJDwDSp657DN20OUClpkeTOxWoPf056c
         QvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795864462; x=1796469262;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WLFznbBsCf+Ohaj/eYLW/BFxVjrxtoJhvpBPo1wlj3o=;
        b=oK7Ewfh7WfoQotR0uU6cOXqiVz04zDdRKGbi0by5X/qOujUDFT6pcOSVQs92tQvQPD
         vfQ7XKwnuFBITWc5F0PB+iDOdP6JrdN/QVW2CezkFup+fEuH47WrssM32bYL0h0dZFG9
         9jx0QGnQRrowwmoRYeUldYKrvc7z/rW4iR6eNh5CIHTVzEWRw62QFdMwVPrhraiJmxRl
         ZkbtcwOE499d3xbI5NUpHslyvAe9mYshH4Saeuo5+5K6vU2lk0jkDSdEiUZCizouNBf5
         kla7Kvh6Bq5CVqRjHsyhOqL/iIpm7vzdR5V2yoJrsjzogANd05S9E6eAiY/lNgUXO8DD
         oARw==
X-Forwarded-Encrypted: i=1; AL+hErH+zrL/9nQUm6XNWfWzFkQxRpPGcUWIP1d+VJb5qgXmYes1eYVXS6zoiBtbr2ClePrclAh8IAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qiezR53RkTK37tTdTHLvPrkRuK9LYY6q61bEWNtvI24DVsExH
	r0GhEm9dTWSsyTQwu5gJ2DsExjNMWGkkrFWCAAD/GumLQHxhtOmogpvk
X-Gm-Gg: AZFdTZegkgVcyBtLORq2ivalwlncNKa/JF3e3uKalTsVcFEVk0lLDhE0T7R4RIvFm4x
	dAVjIr2YyKp+tcR4Ph4q1B/yjOY+YhfpjlVFNdcWuG1R/q+QkQx4WV2M2yRWrJIWxynr6Hv2M//
	kkKXUvC3+4PG/Z4gNc6GgQgF95RaZYB0NUOaKjQ1eJIjrZuq+1FJQLvmOXC5h9NNAhBnVzjrzwa
	LrEGHJp+VHRLBMBAmWogDGqV7XQ8qPvemDbgG3D8antLnJJ80MCsWEJ+7ZYw8/omdWEfYGzqo3a
	6MLKuLWu1IobSmDXZUzEorHhR/dVM8Qg4XyAjLvlVa86uLyYzxg7MGX07erkAq49unFxOXwH15m
	O7Z6Z8sYS5/Vcr4YwvrFhSEfRTjIgeHe3a0+xMcVR+NdsCVqrZOAptbn9ea3eqbUESNTrxNPF4q
	ciUVySebMDDF1wbjtOq13p1q+ah4WpWGM97CRjDiirjjOZhcpNaHvVuKTCf+FrwwAs02CTV48jn
	v2Za563rtsKYt4Tg55vmx3MlfZhJ2qLXIAdmXYNf+8ReyEuqnOzGTmnjqp7FFPaF19wiHy8H7B8
	w2MTAn3vnrEk8GtUYuGChPtWUTIIupPVsGPpicNzbkOFTiQVeU22XEd9XxvfOdAS3mlEbiZrZ6C
	T8IvPwbPvUBQ7yeXMLjRCt24nB+Gpgh/OPJDeuuUmSxZcwAcI0vtx85u7
X-Received: by 2002:a05:6a00:1253:b0:8b5:7fc8:8679 with SMTP id d2e1a72fcca58-8c87bcb7868mr27155835b3a.21.1795864461901;
        Sat, 28 Nov 2026 03:14:21 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm14098236b3a.3.2026.11.28.03.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:14:21 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Sat, 28 Nov 2026 20:14:15 +0900
Subject: [PATCH] e100: fix use-after-free of the CB list in
 e100_clean_cbs()
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
Message-Id: <20261128-e100-cbs-uaf-v1-1-efda575f56e5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIa3CmsC/yXMMQ6DMAxA0asgz1iKIwKiV6kYkuBQd4AqLggJc
 XfSMr7h/wOUs7DCozog8yYqy1xAdQXx5eeJUcZisMa2RLZDJmMwBsXVJzRu7KzrY9sEgpJ8Mif
 Z/7vncFvX8Ob4/T3gPC9V9Df1cAAAAA==
X-Change-ID: 20261127-e100-cbs-uaf-05d7259c64b1
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
 SeungJong Ha <engineer.jjhama@gmail.com>
X-Mailer: b4 0.15.2

ndo_set_rx_mode() can run without RTNL. An unprivileged IPv6 multicast
join reaches it that way since commit 1767bb2d47b7 ("ipv6: mcast: Don't
hold RTNL for IPV6_ADD_MEMBERSHIP and MCAST_JOIN_GROUP."):

  setsockopt(IPV6_JOIN_GROUP)
    __ipv6_sock_mc_join()
      dev_mc_add()
        e100_set_multicast_list()
          e100_exec_cb()

e100_exec_cb() queues a CB under cb_lock if cbs_avail is non-zero.
e100_clean_cbs() frees the CB list without cb_lock and zeroes cbs_avail
only afterwards, so a concurrent e100_exec_cb() writes to freed CBs.
This hits every e100_down(), not only ndo_stop.

Looping IPV6_JOIN_GROUP/IPV6_LEAVE_GROUP as an unprivileged user while
toggling the link down and up crashes within seconds (QEMU -device
i82557b, SLUB_DEBUG_ON):

  Oops: general protection fault, ... address 0xf4f4f0f4f4f4f53a
  KASAN: maybe wild-memory-access in range [0xa7a7a7a7a7a7a9d0-...]
  RIP: 0010:e100_exec_cb+0x219/0x410
  Call Trace:
   e100_set_multicast_list+0xf1/0x2b0
   dev_mc_add+0xb3/0x100
   igmp6_group_added+0x145/0x5e0
   __ipv6_dev_mc_inc+0x60e/0x8a0
   __ipv6_sock_mc_join+0x3da/0x620
   do_ipv6_setsockopt+0x16cf/0x1f80

Clear cbs_avail under cb_lock before freeing the list, so a later
e100_exec_cb() fails with -ENOMEM, and publish a new list in
e100_alloc_cbs() under cb_lock as well, so cbs_avail is never seen
before the list pointers.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
Fixes points at the initial import: dev_mc_add() was called without
RTNL before 1767bb2d47b7 too (rxe, DSA, and IPv6 itself before v3.17).

I found this with a prototype static analysis tool I am developing. It
flags drivers whose ndo_set_rx_mode() and ndo_stop() share no lock
while ndo_stop() frees state.

The analysis, the reproducer and the fix were written with Claude Code
(Claude Opus 5.5). I reviewed every line of the patch and the commit
message, and re-ran the reproducer myself.

The tool flags more legacy ndo_set_rx_mode() drivers with the same
pattern; tulip is also confirmed in QEMU. Would a core change that keeps
ndo_set_rx_mode() from running concurrently with ndo_stop() be preferred
over fixing drivers one by one? This patch is needed either way, since
e100 also frees the list in its other e100_down() paths.

Tested in QEMU (-device i82557b) only. Before: 5/5 runs crash within
seconds. After: 0/5 in 5 x 120 s (12,809 down/up cycles). No real
8255x hardware was tested.
---
 drivers/net/ethernet/intel/e100.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/intel/e100.c b/drivers/net/ethernet/intel/e100.c
index 29960762e64a..7923239a2b35 100644
--- a/drivers/net/ethernet/intel/e100.c
+++ b/drivers/net/ethernet/intel/e100.c
@@ -1849,8 +1849,16 @@ static int e100_tx_clean(struct nic *nic)
 
 static void e100_clean_cbs(struct nic *nic)
 {
+	unsigned int avail;
+	unsigned long flags;
+
+	spin_lock_irqsave(&nic->cb_lock, flags);
+	avail = nic->cbs_avail;
+	nic->cbs_avail = 0;
+	spin_unlock_irqrestore(&nic->cb_lock, flags);
+
 	if (nic->cbs) {
-		while (nic->cbs_avail != nic->params.cbs.count) {
+		while (avail != nic->params.cbs.count) {
 			struct cb *cb = nic->cb_to_clean;
 			if (cb->skb) {
 				dma_unmap_single(&nic->pdev->dev,
@@ -1860,11 +1868,10 @@ static void e100_clean_cbs(struct nic *nic)
 				dev_kfree_skb(cb->skb);
 			}
 			nic->cb_to_clean = nic->cb_to_clean->next;
-			nic->cbs_avail++;
+			avail++;
 		}
 		dma_pool_free(nic->cbs_pool, nic->cbs, nic->cbs_dma_addr);
 		nic->cbs = NULL;
-		nic->cbs_avail = 0;
 	}
 	nic->cuc_cmd = cuc_start;
 	nic->cb_to_use = nic->cb_to_send = nic->cb_to_clean =
@@ -1875,6 +1882,7 @@ static int e100_alloc_cbs(struct nic *nic)
 {
 	struct cb *cb;
 	unsigned int i, count = nic->params.cbs.count;
+	unsigned long flags;
 
 	nic->cuc_cmd = cuc_start;
 	nic->cb_to_use = nic->cb_to_send = nic->cb_to_clean = NULL;
@@ -1894,8 +1902,10 @@ static int e100_alloc_cbs(struct nic *nic)
 			((i+1) % count) * sizeof(struct cb));
 	}
 
+	spin_lock_irqsave(&nic->cb_lock, flags);
 	nic->cb_to_use = nic->cb_to_send = nic->cb_to_clean = nic->cbs;
 	nic->cbs_avail = count;
+	spin_unlock_irqrestore(&nic->cb_lock, flags);
 
 	return 0;
 }

---
base-commit: d4a07bc573c33e72a69445741f53b9105579328a
change-id: 20261127-e100-cbs-uaf-05d7259c64b1

Best regards,
--  
SeungJong Ha <engineer.jjhama@gmail.com>

