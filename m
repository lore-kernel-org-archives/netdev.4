Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155104;
	b=dC6cc0UX+/QeiuwItO8uJoahWULy7bzPxVWoeFGCz/o6LJdgvylEjH+VnBgZ/zEybpev
	 jwMVvhAc1qxElcouZm3E2vkc6Fqb+JtKLTDgYbIzuWVtrgGyY8JlGhFNwCwMHxD7eIz8m
	 gNU5SrHMx3tvd5o8IhLnJ1f4aGhrbfNserMTz1fWkNgG+lFrCWETXW+7vZANTopSCjpOW
	 VGN0tI2Vp3yFSsEUvs5aHOZdLxZcctLrl1gOqPOFr6bJuUz7NONeR/a/YwKFsZN7DDYx5
	 bRh8q2JFjpmhF1gxQbbxJUFGJj3mMKtWoV0JVoUNMD9JvYGQ0Cl6VNVRGRCfgwzpLDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155104;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FYeBjzzajzIMomxeTo2zsisJ34xurhqTEFFHes8PBtA=;
	b=dNZBgUIPvVKJgXYt4zyLNAjYX5ZRn87E+IZR/TueReysJepcD4APfzL1x21a+pfOmKha
	 fkw/nU7qJhLPjObePY1T1VoJ8Tm0xnnUl6dFeKH6rn18/PVvKvhzSGj9dBwjtoULTmaG4
	 WvoO/C6PAUiajxsSYxuxZumF7NP1oMGJr23GJT24BW1sAZh7NG/hhR9m7dqWlKUBErieM
	 4kPzJbaU32zDLh4D/vE/zpwgxbn4slAc2Pqm3v3NXM/3hSFUhxi93O/Eqr6jUH9OjYmcs
	 TV4tT9GruqhgLSisxYci2ajjdV+11iV8HolAxnaOpWCPx3zwG7nW0tkTfT4Tlh2BUDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ergzg1M5;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE130606A504;
	Fri, 20 Nov 2026 06:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE130606A504
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ergzg1M5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795155101; x=1826691101;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ET3hYaVt3likaMaWJfcVbGlw5rGCcaMf5Eo/QWP0lnU=;
  b=Ergzg1M5rt/AOYxfnELPnGWf4qFz4Ae/PNjigCLtz9V//NplP4jvlG6u
   NDqZCDiefM+jbrlzlzSVJbbNLNrHa7Kku3D7xdqir9APy7ySNuQlO+Ya0
   TS0wCCSG4+iO52uiAUrp+eX1jTtjB4nDbdlchXIPKMr1cjJvqSBCGOlby
   REwxp78ibvktEe4CczKWKKN1lQiZf9W+Kzf66Dpl5ibJcaFddruun0Ie0
   K18hOWEOSbko13Vc6nYcXJk06G6Lx/4DLOaWNixdYkw1sHVbuv3tpiWe4
   IoKLW6CFL3NJdw+I6Cl05VKen85J8+f7z3H4CdQ1ARnmzpOTw5vpjzLUQ
   g==;
X-CSE-ConnectionGUID: WCzFodySSPmyGsbscBuV2g==
X-CSE-MsgGUID: GQ/pXGfPR9+tC30XvBquLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4020142"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4020142"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 22:11:40 -0800
X-CSE-ConnectionGUID: ECHAyj5YRRmtLSXED1Ykkw==
X-CSE-MsgGUID: 8xwWHaGuRJeLmtqHDFLhnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10620274"
Received: from linux-pnp-gnr-1.sh.intel.com ([10.239.83.186])
  by orviesa006.jf.intel.com with ESMTP; 19 Nov 2026 22:11:38 -0800
From: Jiebin Sun <jiebin.sun@intel.com>
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	tim.c.chen@linux.intel.com,
	tianyou.li@intel.com,
	wangyang.guo@intel.com
Subject: [PATCH net-next v2] net: dst: avoid false sharing between tclassid and __rcuref
Date: Fri, 20 Nov 2026 14:16:04 +0800
Message-ID: <20261120061604.3676605-1-jiebin.sun@intel.com>
X-Mailer: git-send-email 2.52.0
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

On x86-64 with CONFIG_IP_ROUTE_CLASSID=y, ip_rcv_finish_core() reads
dst_entry::tclassid from the cache line containing __rcuref. Concurrent
reference updates cause false sharing with this load.

Swap expires with {error, __pad, tclassid} to move tclassid and error
into the first cache line without growing dst_entry. The structures
that embed it, including rtable, rt6_info, and metadata_dst, keep
their sizes.

pahole on x86-64 (sizes and offsets in bytes)

  +----------------------+--------+-------+
  | Struct or field      | Before | After |
  +----------------------+--------+-------+
  | sizeof(dst_entry)    |    136 |   136 |
  | dst_entry.expires    |     24 |    96 |
  | dst_entry.__rcuref   |     64 |    64 |
  | dst_entry.tclassid   |    100 |    28 |
  +----------------------+--------+-------+

The IPv4 loopback paths are shown below.

  TX: __dev_queue_xmit() -> skb_dst_force() -> dst_hold_safe()
      -> rcuref_get()
  RX: ip_rcv_finish_core() -> skb_dst(skb)->tclassid

At the tclassid load, separate 30-second perf c2c runs recorded:

  +----------+------------+-------------+
  | Kernel   | Local HITM | Remote HITM |
  +----------+------------+-------------+
  | Baseline |       2624 |        2611 |
  | Swap     |          1 |           0 |
  +----------+------------+-------------+

Memcached over IPv4 loopback (64 threads each, 5 x 60s,
20s warmup, mean ops/s)
Baseline: commit 6628e7d4c6b2 ("Linux 7.4-rc1")

  +-----------+-----------------+
  | Memcached | Improvement (%) |
  +-----------+-----------------+
  | default   |          +32.55 |
  | hit       |          +45.79 |
  | balanced  |           -0.12 |
  | large     |          +45.62 |
  +-----------+-----------------+

Default client

  memtier_benchmark -s 127.0.0.1 -p 11221 -P memcache_text
    -t 64 -c 1 --pipeline=16 --test-time=60 --ratio=1:100
    --data-size=32 --key-maximum=10000000

Server

  memcached -c 4096 -t 64 -u pnp -p 11221 -l 127.0.0.1

Client variants

  hit:      --key-maximum=1000
  balanced: --key-maximum=1000 --ratio=1:1
  large:    --key-maximum=1000 --data-size=1024

Suggested-by: Eric Dumazet <edumazet@kernel.org>
Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
Reviewed-by: Tianyou Li <tianyou.li@intel.com>
Reviewed-by: Wangyang Guo <wangyang.guo@intel.com>
Signed-off-by: Jiebin Sun <jiebin.sun@intel.com>
---
Changes in v2:
- Swap expires with error/__pad/tclassid and show the pahole results.
- Clarify the loopback path and keep the memcached and c2c tables.

 include/net/dst.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/net/dst.h b/include/net/dst.h
index dbedfe72e1fd..a692fe85f4bc 100644
--- a/include/net/dst.h
+++ b/include/net/dst.h
@@ -30,7 +30,9 @@ struct dst_entry {
 	};
 	struct  dst_ops	        *ops;
 	unsigned long		_metrics;
-	unsigned long           expires;
+	short			error;
+	short			__pad;
+	__u32			tclassid;
 #ifdef CONFIG_XFRM
 	struct xfrm_state	*xfrm;
 #else
@@ -74,9 +76,7 @@ struct dst_entry {
 	int			__use;
 	unsigned long		lastuse;
 	struct rcu_head		rcu_head;
-	short			error;
-	short			__pad;
-	__u32			tclassid;
+	unsigned long		expires;
 #ifndef CONFIG_64BIT
 	struct lwtunnel_state   *lwtstate;
 	rcuref_t		__rcuref;	/* 32-bit offset 64 */

base-commit: 66726ba54a01a2951688a56f5eb4d13d063acbea
-- 
2.52.0

