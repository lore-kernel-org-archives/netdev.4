Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786195;
	b=nHndAme6Bz5EsowA/EOmYadKInTVTuWL/jO+54W2tJViItXJbf8WYM/XAt7xv634qD8w
	 NEXirrppEGFq4ZKjo62GXt9tsOw9DE6iamHFnU7MfMGTNkf2EIi4ka6GaySDIPSl3c5QP
	 nDx8WJP6sq6eCfW6wSO6im+iGYUTV8F52epbjkOL/M5V3k0FApQUKKOSJIXEUIBaHYSTg
	 nkhIyv6J60ZT7k5ukrYBshcMW9cuag8Hc5uL3bytaHDzM1Wy+NYFzZbd7rJCB4S+KN6OS
	 tfT4b9Sjmy9DJ/O4NgYE5KwkmxAu4cFm18iwf8NUTLcwk5Mwf9ZWGCRRJNtWA+dq+Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786195;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:CMS-TYPE:X-CPGSPASS:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=+e0EnoojV4Ojk5HHoz5ipTGnR/a7RUdVjidQuApwaUY=;
	b=fr0XCbI7Ay7Fdd8hgRTk8PUo9lfSbocRgjazp0C62wctrfqOpV3FKub5KYDKIj9331Ms
	 UEc/jJQE1EmxeDxksbPUzT3garL9gwxh+wC9yzuMRYuvHm9suzHTrMm6Je3LMG6MEQs2I
	 t4/3hrxKU06+xoqYQ4HTJbpbA6V+J5zljH6JnBfanMW1FiDbLXLx7nJjT+miz9Hn05ygu
	 pWwkzRPyTBjiIRekkJ6B8sZlSTAo8JQ+FYE1IvFcYeGcXmbmG+nuoS1xg8/b6hF8UqJr6
	 mhY3U+2LT8lTyQcKGsaA0fh718wle3u8tk/DAy1etXxoRewiiP2eIlNKVBb48sKg1sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=ZPB9N6X8;
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B99606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B99606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=ZPB9N6X8
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261127132951epoutp0198d56b85f979448fde09d9b4bfca5599~r6gbGjt9F1502415024epoutp01_
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:29:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261127132951epoutp0198d56b85f979448fde09d9b4bfca5599~r6gbGjt9F1502415024epoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795786191;
	bh=+e0EnoojV4Ojk5HHoz5ipTGnR/a7RUdVjidQuApwaUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZPB9N6X8ltU7XV/OpPle23jlzArhwfXF/etE2+DHSHKz4OeFCIePspzU9iK7l+KbP
	 rl5iNFPlXxp2FpdkBGVlKhOJUhrcOe+Q0EkItn0AjeMkmbIoDz7NGIt2TS1g7Jijr/
	 VSj4l4VTEJk7XOKQP1xaqNX+33c9WBgImRAN1qKY=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261127132950epcas5p1d554aa812d54077b060f3366c8b5db63~r6gZ-Ahc30558605586epcas5p1f;
	Fri, 27 Nov 2026 13:29:50 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jbZ5n2NGZz2SSKX; Fri, 27 Nov
	2026 13:29:49 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261127132948epcas5p424c1b991bbb4b77880d85cbabba12428~r6gYoc29C2027720277epcas5p4I;
	Fri, 27 Nov 2026 13:29:48 +0000 (GMT)
Received: from ws2030076956.sa.corp.samsungelectronics.net (unknown
	[107.99.235.31]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261127132944epsmtip20b32668b4bfed0de5e5833ad3e015229~r6gVGtgwy1701617016epsmtip2n;
	Fri, 27 Nov 2026 13:29:44 +0000 (GMT)
From: Irlanki Sandeep <irlanki.s@samsung.com>
To: kuniyu@google.com
Cc: alexei.starovoitov@gmail.com, ameryhung@gmail.com, andrii@kernel.org,
	ast@kernel.org, bpf@vger.kernel.org, corbet@lwn.net, cpgs@samsung.com,
	daeil2.hwang@samsung.com, daniel@iogearbox.net, davem@davemloft.net,
	edumazet@google.com, g.pokhra@samsung.com, irlanki.s@samsung.com,
	kuba@kernel.org, linux-kernel@vger.kernel.org, lorenzo@google.com,
	madhan.raj@samsung.com, maze@google.com, motomuman@google.com,
	ncardwell@google.com, netdev@vger.kernel.org, pabeni@redhat.com,
	r.kumawat@samsung.com, raj.kumars@samsung.com, ramyashree.s@samsung.com,
	sharmasagarika@google.com, sporeba@google.com, srihari.k@samsung.com,
	ts413.lee@samsung.com
Subject: [PATCH bpf-next v10 1/2] bpf: tcp: add ecn_init callback to
 bpf_tcp_ops for per-connection ECN
Date: Fri, 27 Nov 2026 19:00:50 +0530
Message-Id: <20261127133051.2540069-1-irlanki.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127132411.2523201-1-irlanki.s@samsung.com>
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
X-CMS-MailID: 20261127132948epcas5p424c1b991bbb4b77880d85cbabba12428
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-065,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261127132948epcas5p424c1b991bbb4b77880d85cbabba12428
References: <20261127132411.2523201-1-irlanki.s@samsung.com>
	<CGME20261127132948epcas5p424c1b991bbb4b77880d85cbabba12428@epcas5p4.samsung.com>

TCP ECN and Accurate ECN (AccECN) negotiation are currently decided
globally by the net.ipv4.tcp_ecn sysctl; the per-route knob
(RTAX_FEATURE_ECN) can only force-enable classic ECN on a path. This
lacks the granularity required for per-application and per-connection
ECN policies in multi-application runtimes such as Android.

ECN/L4S selection is an application-level property, not only a path
property: on the exact same route, latency-sensitive applications
(real-time gaming, interactive video/VoIP, low-latency messaging)
benefit from negotiating AccECN for low-queuing-delay L4S treatment,
while bulk background transfers or legacy applications in other
cgroups prefer classic RFC3168 ECN, or no ECN at all where middlebox
traversal is a concern. On the passive side, a server may further
want to decide the ECN mode per peer at handshake time. RTAX_FEATURE_ECN
cannot select AccECN, and it cannot distinguish applications that share
one route.

To support this without adding per-socket state to struct tcp_sock or
resorting to the legacy sock_ops interface, add an 'ecn_init' callback
to struct bpf_tcp_ops, following the existing timeout_init()/
rwnd_init() pattern. The ECN mode is only consulted once per handshake,
so the kernel queries the BPF program via tcp_ecn_init_bpf() when the
sysctl value is read: before the SYN is built on active open, and on
passive open only when the incoming SYN requests ECN (AccECN or
ECE+CWR), where the program sees the listener and the request_sock and
can thus decide per peer. The sysctl value is passed to the program as
the default via bpf_get_retval(); an out-of-range return keeps it. With
syncookies no request_sock is created, so the program is not invoked and
the sysctl and route decide as before. No negotiated-mode state is
stored; the decision taken at handshake time stands for the connection.
The struct_ops program is attached per-cgroup, giving the per-application
policy point (containers, Android app sandboxes).

Document the sysctl precedence in ip-sysctl.rst.

Signed-off-by: Irlanki Sandeep <irlanki.s@samsung.com>
---
v9 -> v10:
 - Skip the ecn_init BPF call in tcp_ecn_create_request() for SYNs
   that neither request AccECN nor carry ECE+CWR (Kuniyuki Iwashima).
 - Sort variable declarations in reverse xmas tree order inside
   tcp_ecn_send_syn() and tcp_ecn_create_request() (Kuniyuki Iwashima).

 Documentation/networking/ip-sysctl.rst |  8 ++++++++
 include/net/tcp.h                      |  6 ++++++
 include/net/tcp_ecn.h                  | 16 ++++++++++++++--
 net/ipv4/bpf_tcp_ops.c                 | 21 ++++++++++++++++-----
 net/ipv4/tcp_input.c                   | 11 ++++++++---
 5 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index f7af0286341c..265746e72942 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -484,6 +484,14 @@ tcp_ecn - INTEGER
 	5     AccECN               No ECN
 	===== ==================== ====================
 
+	Note that a BPF program implementing the bpf_tcp_ops 'ecn_init'
+	struct_ops callback, attached to a cgroup, can override this value
+	per connection for the sockets of that cgroup. The callback sees
+	this sysctl value as the default via bpf_get_retval(), and any
+	return value outside the table above falls back to it. Connections
+	established via syncookies are not seen by the callback and use the
+	sysctl and route settings instead.
+
 	Default: 2
 
 tcp_ecn_option - INTEGER
diff --git a/include/net/tcp.h b/include/net/tcp.h
index f7624ab9b420..19fd7652b1c1 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -2971,6 +2971,12 @@ struct bpf_tcp_ops {
 	 */
 	int (*rwnd_init)(struct sock *sk, struct request_sock *req);
 
+	/* Should return the ECN variant to negotiate in this handshake:
+	 * one of net.ipv4.tcp_ecn values. bpf_get_retval() has the sysctl.
+	 * @req as in timeout_init().
+	 */
+	int (*ecn_init)(struct sock *sk, struct request_sock *req);
+
 	/* Called when an active connection becomes established.
 	 * @skb is the SYNACK that completed the 3WHS, or NULL for a
 	 * TCP_REPAIR socket (tcp_finish_connect() with no skb).
diff --git a/include/net/tcp_ecn.h b/include/net/tcp_ecn.h
index 865d5c5a7718..4d57b4c75846 100644
--- a/include/net/tcp_ecn.h
+++ b/include/net/tcp_ecn.h
@@ -32,6 +32,18 @@ enum tcp_accecn_option {
 	TCP_ACCECN_OPTION_PERSIST = 3,
 };
 
+/* Resolve the effective ECN mode: BPF callback or sysctl fallback */
+static inline u8 tcp_ecn_init_bpf(struct sock *sk)
+{
+	u8 tcp_ecn = READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_ecn);
+	int ret;
+
+	ret = bpf_tcp_ops_call_int(ecn_init, tcp_ecn, sk);
+	if (ret < 0 || ret > TCP_ECN_IN_ACCECN_OUT_NOECN)
+		return tcp_ecn;
+	return ret;
+}
+
 /* Apply either ECT(0) or ECT(1) based on TCP_CONG_ECT_1_NEGOTIATION flag */
 static inline void INET_ECN_xmit_ect_1_negotiation(struct sock *sk)
 {
@@ -596,10 +608,10 @@ static inline void tcp_ecn_send_synack(struct sock *sk, struct sk_buff *skb)
 /* Packet ECN state for a SYN.  */
 static inline void tcp_ecn_send_syn(struct sock *sk, struct sk_buff *skb)
 {
-	struct tcp_sock *tp = tcp_sk(sk);
 	bool bpf_needs_ecn = tcp_bpf_ca_needs_ecn(sk);
+	u8 tcp_ecn = tcp_ecn_init_bpf(sk);
+	struct tcp_sock *tp = tcp_sk(sk);
 	bool use_ecn, use_accecn;
-	u8 tcp_ecn = READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_ecn);
 
 	use_accecn = tcp_ecn == TCP_ECN_IN_ACCECN_OUT_ACCECN ||
 		     tcp_ca_needs_accecn(sk);
diff --git a/net/ipv4/bpf_tcp_ops.c b/net/ipv4/bpf_tcp_ops.c
index 2ba73dd6c52c..785517364f0b 100644
--- a/net/ipv4/bpf_tcp_ops.c
+++ b/net/ipv4/bpf_tcp_ops.c
@@ -24,6 +24,14 @@ static int rwnd_init_stub(struct sock *sk, struct request_sock *req__nullable)
 	return ctx->retval;
 }
 
+static int ecn_init_stub(struct sock *sk, struct request_sock *req__nullable)
+{
+	struct bpf_tramp_run_ctx *ctx =
+		container_of(current->bpf_ctx, struct bpf_tramp_run_ctx, run_ctx);
+
+	return ctx->retval;
+}
+
 static void active_established_stub(struct sock *sk, struct sk_buff *skb__nullable)
 {
 }
@@ -87,6 +95,7 @@ static void dequeue_rcvq_stub(struct sock *sk)
 static struct bpf_tcp_ops __bpf_tcp_ops = {
 	.timeout_init = timeout_init_stub,
 	.rwnd_init = rwnd_init_stub,
+	.ecn_init = ecn_init_stub,
 	.active_established = active_established_stub,
 	.passive_established = passive_established_stub,
 	.rto = rto_stub,
@@ -202,10 +211,11 @@ BPF_CALL_0(bpf_tcp_ops_get_retval)
 	struct bpf_tramp_run_ctx *ctx =
 		container_of(current->bpf_ctx, struct bpf_tramp_run_ctx, run_ctx);
 
-	/* bpf_get_retval() is only exposed to timeout_init/rwnd_init, which
-	 * always run via bpf_tcp_ops_call_int(). Its run_ctx carries the int
-	 * return value chained across the bpf_tcp_ops attached to the cgroup
-	 * and is this program's saved_run_ctx.
+	/* bpf_get_retval() is only exposed to timeout_init, rwnd_init and
+	 * ecn_init, which always run via bpf_tcp_ops_call_int(). Its
+	 * run_ctx carries the int return value chained across the
+	 * bpf_tcp_ops attached to the cgroup and is this program's
+	 * saved_run_ctx.
 	 */
 	if (WARN_ON_ONCE(!ctx->saved_run_ctx))
 		return 0;
@@ -258,7 +268,8 @@ get_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
 		return NULL;
 	case BPF_FUNC_get_retval:
 		if (moff == offsetof(struct bpf_tcp_ops, timeout_init) ||
-		    moff == offsetof(struct bpf_tcp_ops, rwnd_init))
+		    moff == offsetof(struct bpf_tcp_ops, rwnd_init) ||
+		    moff == offsetof(struct bpf_tcp_ops, ecn_init))
 			return &bpf_tcp_ops_get_retval_proto;
 		return NULL;
 	case BPF_FUNC_reserve_hdr_opt:
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 46f5c4fafa8d..4554429f5bde 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -7500,13 +7500,18 @@ static void tcp_ecn_create_request(struct request_sock *req,
 				   const struct dst_entry *dst)
 {
 	const struct tcphdr *th = tcp_hdr(skb);
-	const struct net *net = sock_net(listen_sk);
 	bool th_ecn = th->ece && th->cwr;
 	bool ect, ecn_ok;
 	u32 ecn_ok_dst;
+	u8 tcp_ecn;
+
+	if (!tcp_accecn_syn_requested(th) && !th_ecn)
+		return;
+
+	tcp_ecn = tcp_ecn_init_bpf((struct sock *)req);
 
 	if (tcp_accecn_syn_requested(th) &&
-	    (READ_ONCE(net->ipv4.sysctl_tcp_ecn) >= 3 ||
+	    (tcp_ecn >= 3 ||
 	     tcp_ca_needs_accecn(listen_sk))) {
 		inet_rsk(req)->ecn_ok = 1;
 		tcp_rsk(req)->accecn_ok = 1;
@@ -7520,7 +7525,7 @@ static void tcp_ecn_create_request(struct request_sock *req,
 
 	ect = !INET_ECN_is_not_ect(TCP_SKB_CB(skb)->ip_dsfield);
 	ecn_ok_dst = dst_feature(dst, DST_FEATURE_ECN_MASK);
-	ecn_ok = READ_ONCE(net->ipv4.sysctl_tcp_ecn) || ecn_ok_dst;
+	ecn_ok = tcp_ecn || ecn_ok_dst;
 
 	if (((!ect || th->res1 || th->ae) && ecn_ok) ||
 	    tcp_ca_needs_ecn(listen_sk) ||
-- 
2.34.1

