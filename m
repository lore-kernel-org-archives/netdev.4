Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794671528;
	b=eUVL5NVVuYIjKy3vmn3bbBMsYZBC4jrkaDOwLZZjQBgEclwuyDRA+FcTlXp05VMrDkIW
	 ul8rfnu2YKyNkSumnJR228EkcG2BbZANpmaUpZTXTOK4Bv35ALcxbthgcHiaTJjW83SZj
	 eXRmEyVTt0l7W2msc52DARF1PQN81O/8LaQG8yhaLNzKSDA5JEAes+h/zt0nkqjpbrcdV
	 xmwfmyAFNt6rE6rdoiJ1l7g/LvF0uWBeG8JEW6op/N89cSuWrs0IvF8kWSbW33YmFwco8
	 E5WavNZANuBXjN6hjhTEVlihExNI8bt44+nAONyIhVaXjuRXKBRLgrbG3QdG1PPbLjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794671528;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7PNIQ+brtkDt0ui73M8xH/zEUWghktDU3iUddsWS5k8=;
	b=Ez0Ja6PdTNM0TeTrVBNBcmkmv+DlwSb5Mht4C2eyJP0jAEjrT1SE45V5VenTwG88yn1t
	 Ej/LltP9v1sGqCew6bdGElpDJ6jOLNCeIIRgCDJe+ZWk6FtWaOUJ1okOv/IUO8UaMHfFp
	 MMI6RL+eeISSnV6vRZpfa/tdIN8i9muvqD0MIc3roJuLtT5B4wUAkRGcEHLSylOck69/I
	 TsrRHHvrG9766SB/aHMibkTznReZc/wcRqVN5HqhBwrvAWw6IWFug/uj+evxQvTxGWste
	 7IucjD+2NRMb36ybjDUQVpoAOY3J0W/H0m438qiWwMPFe2VqVcRRuxnaSNhNX09uOKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A7rzbSsQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66491606A33E
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A7rzbSsQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251981F000CD;
	Sat, 14 Nov 2026 15:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794671527;
	bh=7PNIQ+brtkDt0ui73M8xH/zEUWghktDU3iUddsWS5k8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A7rzbSsQ+UgbXtUK5x6Pwqub6j7356jO3faNxCaZ8d0TRzoupVdTHnjw5Mf/nvP0v
	 nxYbzzm+bQAqs/rNIDJKSgJxpO40BK/demmCuiXqUI6jBlzk+Yxi2R9d6HXl5QB8xT
	 joz3rFMmI//D1CIM+BF2HdbfvrPkdGL3neCibSRrakyjr9PTxkyNQ7+/fc/i8IUkFh
	 sS5Um5U2QmOFbUNE/ny5Yv7WMj/QKVk5XEU6RdApDyf6YeNhixF+7RWsLokzrl8IY3
	 je9Unm3b0fC49s1mrTgfHCw4oVZ2bUzCri+xMdq9eSW+g3EKE2Mp6pg/mjUx9AcKUx
	 BBitv8iHoCCsg==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Neal Cardwell <ncardwell@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next 4/5] net: add SKB_DROP_REASON_MEMCG
Date: Sat, 14 Nov 2026 16:51:49 +0100
Message-ID: <20261114155150.235743-5-edumazet@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114155150.235743-1-edumazet@kernel.org>
References: <20261114155150.235743-1-edumazet@kernel.org>
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

__sk_mem_raise_allocated() fails either because the memory cgroup charge
failed, or because protocol memory limits are reached, but callers can
not tell the difference, and TCP reports SKB_DROP_REASON_PROTO_MEM
in both cases.

Add __sk_mem_raise_allocated_reason(), __sk_mem_schedule_reason() and
sk_rmem_schedule_reason() returning SKB_NOT_DROPPED_YET on success,
SKB_DROP_REASON_MEMCG when the memcg charge failed, or
SKB_DROP_REASON_PROTO_MEM otherwise. Existing helpers become wrappers,
other callers are unchanged.

Use sk_rmem_schedule_reason() in tcp_try_rmem_schedule().

Note that memcg charges done from softirq use GFP_ATOMIC and are
forced over the limit, so on the receive path this reason is only seen
for packets processed in process context, like the socket backlog.

Tested with a receiver in a memory cgroup doing small reads while a
peer sends at full speed: kfree_skb tracepoint reports MEMCG drops.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 include/net/dropreason-core.h |  6 ++++
 include/net/sock.h            | 33 ++++++++++++++++---
 net/core/sock.c               | 62 ++++++++++++++++++++++++-----------
 net/ipv4/tcp_input.c          | 15 +++++----
 4 files changed, 85 insertions(+), 31 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index fa2fe8990557..27bc63cbc020 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -82,6 +82,7 @@
 	FN(DEV_READY)			\
 	FN(FULL_RING)			\
 	FN(NOMEM)			\
+	FN(MEMCG)			\
 	FN(TAP_FILTER)			\
 	FN(TAP_TXFILTER)		\
 	FN(ICMP_CSUM)			\
@@ -426,6 +427,11 @@ enum skb_drop_reason {
 	SKB_DROP_REASON_FULL_RING,
 	/** @SKB_DROP_REASON_NOMEM: error due to OOM */
 	SKB_DROP_REASON_NOMEM,
+	/**
+	 * @SKB_DROP_REASON_MEMCG: socket memory could not be charged
+	 * to its memory cgroup.
+	 */
+	SKB_DROP_REASON_MEMCG,
 	/**
 	 * @SKB_DROP_REASON_TAP_FILTER: dropped by (ebpf) filter directly attached
 	 * to tun/tap, e.g., via TUNSETFILTEREBPF
diff --git a/include/net/sock.h b/include/net/sock.h
index d58d38db732d..005addcc4dc4 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -1557,7 +1557,11 @@ static inline struct inode *SOCK_INODE(struct socket *socket)
 /*
  * Functions for memory accounting
  */
+enum skb_drop_reason __sk_mem_raise_allocated_reason(struct sock *sk, int size,
+						     int amt, int kind);
 int __sk_mem_raise_allocated(struct sock *sk, int size, int amt, int kind);
+enum skb_drop_reason __sk_mem_schedule_reason(struct sock *sk, int size,
+					      int kind);
 int __sk_mem_schedule(struct sock *sk, int size, int kind);
 void __sk_mem_reduce_allocated(struct sock *sk, int amount);
 void __sk_mem_reclaim(struct sock *sk, int amount);
@@ -1592,16 +1596,35 @@ static inline bool sk_wmem_schedule(struct sock *sk, int size)
 	return delta <= 0 || __sk_mem_schedule(sk, delta, SK_MEM_SEND);
 }
 
-static inline bool
-__sk_rmem_schedule(struct sock *sk, int size, bool pfmemalloc)
+/* Return SKB_NOT_DROPPED_YET on success, or the drop reason. */
+static inline enum skb_drop_reason
+__sk_rmem_schedule_reason(struct sock *sk, int size, bool pfmemalloc)
 {
+	enum skb_drop_reason reason;
 	int delta;
 
 	if (!sk_has_account(sk))
-		return true;
+		return SKB_NOT_DROPPED_YET;
 	delta = size - sk->sk_forward_alloc;
-	return delta <= 0 || __sk_mem_schedule(sk, delta, SK_MEM_RECV) ||
-	       pfmemalloc;
+	if (delta <= 0)
+		return SKB_NOT_DROPPED_YET;
+	reason = __sk_mem_schedule_reason(sk, delta, SK_MEM_RECV);
+	if (reason && pfmemalloc)
+		return SKB_NOT_DROPPED_YET;
+	return reason;
+}
+
+static inline bool
+__sk_rmem_schedule(struct sock *sk, int size, bool pfmemalloc)
+{
+	return __sk_rmem_schedule_reason(sk, size, pfmemalloc) ==
+	       SKB_NOT_DROPPED_YET;
+}
+
+static inline enum skb_drop_reason
+sk_rmem_schedule_reason(struct sock *sk, const struct sk_buff *skb, int size)
+{
+	return __sk_rmem_schedule_reason(sk, size, skb_pfmemalloc(skb));
 }
 
 static inline bool
diff --git a/net/core/sock.c b/net/core/sock.c
index e529ffeaedb9..226a587c5fa5 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -3409,13 +3409,17 @@ int sk_wait_data(struct sock *sk, long *timeo, const struct sk_buff *skb)
 EXPORT_SYMBOL(sk_wait_data);
 
 /**
- *	__sk_mem_raise_allocated - increase memory_allocated
+ *	__sk_mem_raise_allocated_reason - increase memory_allocated
  *	@sk: socket
  *	@size: memory size to allocate
  *	@amt: pages to allocate
  *	@kind: allocation type
  *
- *	Similar to __sk_mem_schedule(), but does not update sk_forward_alloc.
+ *	Similar to __sk_mem_schedule_reason(), but does not update
+ *	sk_forward_alloc.
+ *
+ *	Return: SKB_NOT_DROPPED_YET on success, SKB_DROP_REASON_MEMCG if the
+ *	memcg charge failed, SKB_DROP_REASON_PROTO_MEM otherwise.
  *
  *	Unlike the globally shared limits among the sockets under same protocol,
  *	consuming the budget of a memcg won't have direct effect on other ones.
@@ -3423,8 +3427,10 @@ EXPORT_SYMBOL(sk_wait_data);
  *	whether or not to raise allocated through sk_under_memory_pressure() or
  *	its variants.
  */
-int __sk_mem_raise_allocated(struct sock *sk, int size, int amt, int kind)
+enum skb_drop_reason __sk_mem_raise_allocated_reason(struct sock *sk, int size,
+						     int amt, int kind)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_PROTO_MEM;
 	bool memcg_enabled = false, charged = false;
 	struct proto *prot = sk->sk_prot;
 	long allocated = 0;
@@ -3437,17 +3443,19 @@ int __sk_mem_raise_allocated(struct sock *sk, int size, int amt, int kind)
 	if (mem_cgroup_sk_enabled(sk)) {
 		memcg_enabled = true;
 		charged = mem_cgroup_sk_charge(sk, amt, gfp_memcg_charge());
-		if (!charged)
+		if (!charged) {
+			reason = SKB_DROP_REASON_MEMCG;
 			goto suppress_allocation;
+		}
 	}
 
 	if (sk->sk_bypass_prot_mem)
-		return 1;
+		return SKB_NOT_DROPPED_YET;
 
 	/* Under limit. */
 	if (allocated <= sk_prot_mem_limits(sk, 0)) {
 		sk_leave_memory_pressure(sk);
-		return 1;
+		return SKB_NOT_DROPPED_YET;
 	}
 
 	/* Under pressure. */
@@ -3468,16 +3476,16 @@ int __sk_mem_raise_allocated(struct sock *sk, int size, int amt, int kind)
 	 */
 	if (kind == SK_MEM_RECV) {
 		if (atomic_read(&sk->sk_rmem_alloc) < sk_get_rmem0(sk, prot))
-			return 1;
+			return SKB_NOT_DROPPED_YET;
 
 	} else { /* SK_MEM_SEND */
 		int wmem0 = sk_get_wmem0(sk, prot);
 
 		if (sk->sk_type == SOCK_STREAM) {
 			if (sk->sk_wmem_queued < wmem0)
-				return 1;
+				return SKB_NOT_DROPPED_YET;
 		} else if (refcount_read(&sk->sk_wmem_alloc) < wmem0) {
-				return 1;
+			return SKB_NOT_DROPPED_YET;
 		}
 	}
 
@@ -3489,7 +3497,7 @@ int __sk_mem_raise_allocated(struct sock *sk, int size, int amt, int kind)
 		 * sense for global memory pressure.
 		 */
 		if (!sk_under_global_memory_pressure(sk))
-			return 1;
+			return SKB_NOT_DROPPED_YET;
 
 		/* Try to be fair among all the sockets under global
 		 * pressure by allowing the ones that below average
@@ -3500,7 +3508,7 @@ int __sk_mem_raise_allocated(struct sock *sk, int size, int amt, int kind)
 		    sk_mem_pages(sk->sk_wmem_queued +
 				 atomic_read(&sk->sk_rmem_alloc) +
 				 sk->sk_forward_alloc))
-			return 1;
+			return SKB_NOT_DROPPED_YET;
 	}
 
 suppress_allocation:
@@ -3516,7 +3524,7 @@ int __sk_mem_raise_allocated(struct sock *sk, int size, int amt, int kind)
 			if (memcg_enabled && !charged)
 				mem_cgroup_sk_charge(sk, amt,
 						     gfp_memcg_charge() | __GFP_NOFAIL);
-			return 1;
+			return SKB_NOT_DROPPED_YET;
 		}
 	}
 
@@ -3528,11 +3536,17 @@ int __sk_mem_raise_allocated(struct sock *sk, int size, int amt, int kind)
 	if (charged)
 		mem_cgroup_sk_uncharge(sk, amt);
 
-	return 0;
+	return reason;
+}
+
+int __sk_mem_raise_allocated(struct sock *sk, int size, int amt, int kind)
+{
+	return __sk_mem_raise_allocated_reason(sk, size, amt, kind) ==
+	       SKB_NOT_DROPPED_YET;
 }
 
 /**
- *	__sk_mem_schedule - increase sk_forward_alloc and memory_allocated
+ *	__sk_mem_schedule_reason - increase sk_forward_alloc and memory_allocated
  *	@sk: socket
  *	@size: memory size to allocate
  *	@kind: allocation type
@@ -3540,16 +3554,26 @@ int __sk_mem_raise_allocated(struct sock *sk, int size, int amt, int kind)
  *	If kind is SK_MEM_SEND, it means wmem allocation. Otherwise it means
  *	rmem allocation. This function assumes that protocols which have
  *	memory_pressure use sk_wmem_queued as write buffer accounting.
+ *
+ *	Return: SKB_NOT_DROPPED_YET on success, or the drop reason.
  */
-int __sk_mem_schedule(struct sock *sk, int size, int kind)
+enum skb_drop_reason __sk_mem_schedule_reason(struct sock *sk, int size,
+					      int kind)
 {
-	int ret, amt = sk_mem_pages(size);
+	int amt = sk_mem_pages(size);
+	enum skb_drop_reason reason;
 
 	sk_forward_alloc_add(sk, amt << PAGE_SHIFT);
-	ret = __sk_mem_raise_allocated(sk, size, amt, kind);
-	if (!ret)
+	reason = __sk_mem_raise_allocated_reason(sk, size, amt, kind);
+	if (reason)
 		sk_forward_alloc_add(sk, -(amt << PAGE_SHIFT));
-	return ret;
+	return reason;
+}
+EXPORT_SYMBOL(__sk_mem_schedule_reason);
+
+int __sk_mem_schedule(struct sock *sk, int size, int kind)
+{
+	return __sk_mem_schedule_reason(sk, size, kind) == SKB_NOT_DROPPED_YET;
 }
 EXPORT_SYMBOL(__sk_mem_schedule);
 
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 2d8f224f9bf0..ede6fa9105d5 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5407,19 +5407,20 @@ tcp_try_rmem_schedule(struct sock *sk, const struct sk_buff *skb,
 {
 	enum skb_drop_reason reason;
 
-	if (!tcp_can_ingest(sk, skb))
+	if (!tcp_can_ingest(sk, skb)) {
 		reason = SKB_DROP_REASON_SOCKET_RCVBUFF;
-	else if (!sk_rmem_schedule(sk, skb, size))
-		reason = SKB_DROP_REASON_PROTO_MEM;
-	else
-		return SKB_NOT_DROPPED_YET;
+	} else {
+		reason = sk_rmem_schedule_reason(sk, skb, size);
+		if (!reason)
+			return SKB_NOT_DROPPED_YET;
+	}
 
 	if (tcp_prune_queue(sk, skb) < 0)
 		return reason;
 
-	while (!sk_rmem_schedule(sk, skb, size)) {
+	while ((reason = sk_rmem_schedule_reason(sk, skb, size))) {
 		if (!tcp_prune_ofo_queue(sk, skb))
-			return SKB_DROP_REASON_PROTO_MEM;
+			return reason;
 	}
 	return SKB_NOT_DROPPED_YET;
 }
-- 
2.53.0

