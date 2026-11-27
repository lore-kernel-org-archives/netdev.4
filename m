Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799980;
	b=HC6jwNFr0CjZ8Jh8MtNlVX5a+c1s5UWK/rHhVcScUpPzp+0OWFfB+W+CvIUozj8J+64i
	 h9Viy03Wd1+UB3G70/NJFPP77tde5Ltxpf13lK52IzFbMnyAaE6d0n6PUB1PP8TchVMFo
	 D0cTb//emTZTqf6kzioSduVHK7U5rh8uw99zqK/I7XrUc825kL+SlmvkXTA/lP0F3+O2D
	 ReAH++2WCEuxhVDfPsovd3H2iscTZd+zF45BcaRhDEGBvOeTLtWgu2g/jve7gAnPg+Dxc
	 TzC2NABRACmg64vi312S7QafBqp///SMDQ83hV8qwaDBAUXCsq/3eKWcx/YTcqplXyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799980;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Queue-Id:
	 X-Rspamd-Pre-Result:X-Rspamd-Action:X-Rspamd-Server:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=sCjjY57m5wFJ/ZUfrw53dAtYz5hz9wOBe51O945XPU0=;
	b=moNFgxMfF9K8leZM8FwH/MkFxQrbKpVz/ThXIzEgxey5nXyaeaqZAf4YHslrbx+RJzzN
	 yhD9XGzVqLBQk/j8iPccK7N4AwC/ENFULAmAQYmButWJJsrYZf1G2H3p1nvMLBYZZSp48
	 wzJfRytoBVwIHyCoPQajhJnoTHbkDLRYyvzyaLeo2I5XTxRSAMjJ9vFBckDBNgNocAVPD
	 VJXIOkFoVTH10OQiPre1obzBnumpUANseOV9969B/Ya0NdfZ/mmoYJBJ1InIy0qb5e2Nk
	 93EBkfRIDnsIlea367pPUOM8NmxX4hfbFpPN3YAEeRgZzYw9/YQBsjU52q5iDK/DdXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9323606A326
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 17:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9323606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 62038229B4;
	Fri, 27 Nov 2026 17:19:37 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 52E1F13432;
	Fri, 27 Nov 2026 17:19:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /Yb1MH67CWuMAwAAD6G6ig:T4
	(envelope-from <fmancera@suse.de>); Fri, 27 Nov 2026 17:19:36 +0000
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Willem de Bruijn <willemb@google.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Felix Fietkau <nbd@nbd.name>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Zihan Xi <zihanx@nebusec.ai>,
	Qi Tang <tpluszz77@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Xia Yan <yanxia@cmss.chinamobile.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH net-next v4 03/16] net: inet: relocate ip_generic_getfrag and guard IPv4 socket logic
Date: Fri, 27 Nov 2026 18:17:48 +0100
Message-ID: <20261127171824.27362-4-fmancera@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127171824.27362-1-fmancera@suse.de>
References: <20261127171824.27362-1-fmancera@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 62038229B4
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00

To enable compiling the INET subsystem without IPv4, shared generic
utilities must be relocated and IPv4 socket logic must be guarded for
CONFIG_IPV4.

Move ip_generic_getfrag() and ip_send_check() from ip_output.c to
af_inet.c, as they are needed without IPv4. Add CONFIG_IPV4 guards in
af_inet.c to reject IPv4-specific ioctls, protocol registrations and
bind requests, and to skip ip_mc_drop_socket() and the saddr
reselection. The same guard is added to reject IPv4-mapped IPv6.

Split inet_init() into inet4_init() and inet4_late_init(), which are
skipped without IPv4. inet_initpeers() and ip_misc_proc_init() are not
IPv4-specific, so call them from inet_init() directly. As a result,
ip_mr_init() now runs after the pernet ops registration.

Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
---
 net/ipv4/af_inet.c   | 129 +++++++++++++++++++++++++++++++++----------
 net/ipv4/ip_output.c |  27 ---------
 net/ipv6/af_inet6.c  |   5 ++
 net/ipv6/datagram.c  |   4 +-
 4 files changed, 106 insertions(+), 59 deletions(-)

diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index 5d03a9149b40..2545091e5b7f 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -129,6 +129,36 @@
 int disable_ipv6_mod;
 EXPORT_SYMBOL(disable_ipv6_mod);
 
+/* Keep the function here for now as it is generic, it should be moved
+ * to a common L3 place
+ */
+int
+ip_generic_getfrag(void *from, char *to, int offset, int len, int odd, struct sk_buff *skb)
+{
+	struct msghdr *msg = from;
+
+	if (skb->ip_summed == CHECKSUM_PARTIAL) {
+		if (!copy_from_iter_full(to, len, &msg->msg_iter))
+			return -EFAULT;
+	} else {
+		__wsum csum = 0;
+
+		if (!csum_and_copy_from_iter_full(to, len, &csum, &msg->msg_iter))
+			return -EFAULT;
+		skb->csum = csum_block_add(skb->csum, csum, odd);
+	}
+	return 0;
+}
+EXPORT_SYMBOL(ip_generic_getfrag);
+
+/* Generate a checksum for an outgoing IP datagram. */
+void ip_send_check(struct iphdr *iph)
+{
+	iph->check = 0;
+	iph->check = ip_fast_csum((unsigned char *)iph, iph->ihl);
+}
+EXPORT_SYMBOL(ip_send_check);
+
 /* The inetsw table contains everything that inet_create needs to
  * build a new socket.
  */
@@ -427,7 +457,8 @@ int inet_release(struct socket *sock)
 			BPF_CGROUP_RUN_PROG_INET_SOCK_RELEASE(sk);
 
 		/* Applications forget to leave groups before exiting */
-		ip_mc_drop_socket(sk);
+		if (IS_ENABLED(CONFIG_IPV4))
+			ip_mc_drop_socket(sk);
 
 		/* If linger is set, we don't return until the close
 		 * is complete.  Otherwise we return immediately. The
@@ -487,6 +518,9 @@ int __inet_bind(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len,
 	u32 tb_id = RT_TABLE_LOCAL;
 	int err;
 
+	if (!IS_ENABLED(CONFIG_IPV4))
+		return -EAFNOSUPPORT;
+
 	if (addr->sin_family != AF_INET) {
 		/* Compatibility games : accept AF_UNSPEC (mapped to AF_INET)
 		 * only if s_addr is INADDR_ANY.
@@ -971,6 +1005,9 @@ int inet_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 	struct ifreq ifr;
 	struct rtentry rt;
 
+	if (!IS_ENABLED(CONFIG_IPV4))
+		return -EOPNOTSUPP;
+
 	switch (cmd) {
 	case SIOCADDRT:
 	case SIOCDELRT:
@@ -1026,6 +1063,9 @@ static int inet_compat_routing_ioctl(struct sock *sk, unsigned int cmd,
 	compat_uptr_t rtdev;
 	struct rtentry rt;
 
+	if (!IS_ENABLED(CONFIG_IPV4))
+		return -EOPNOTSUPP;
+
 	if (copy_from_user(&rt.rt_dst, &ur->rt_dst,
 			3 * sizeof(struct sockaddr)) ||
 	    get_user(rt.rt_flags, &ur->rt_flags) ||
@@ -1204,6 +1244,9 @@ void inet_register_protosw(struct inet_protosw *p)
 	int protocol = p->protocol;
 	struct list_head *last_perm;
 
+	if (!IS_ENABLED(CONFIG_IPV4))
+		return;
+
 	spin_lock_bh(&inetsw_lock);
 
 	if (p->type >= SOCK_MAX)
@@ -1246,6 +1289,9 @@ EXPORT_SYMBOL(inet_register_protosw);
 
 void inet_unregister_protosw(struct inet_protosw *p)
 {
+	if (!IS_ENABLED(CONFIG_IPV4))
+		return;
+
 	if (INET_PROTOSW_PERMANENT & p->flags) {
 		pr_err("Attempt to unregister permanent protocol %d\n",
 		       p->protocol);
@@ -1270,6 +1316,9 @@ static int inet_sk_reselect_saddr(struct sock *sk)
 	struct ip_options_rcu *inet_opt;
 	int err;
 
+	if (!IS_ENABLED(CONFIG_IPV4))
+		return -EAFNOSUPPORT;
+
 	inet_opt = rcu_dereference_protected(inet->inet_opt,
 					     lockdep_sock_is_held(sk));
 	if (inet_opt && inet_opt->opt.srr)
@@ -1882,14 +1931,12 @@ static struct packet_type ip_packet_type __read_mostly = {
 	.list_func = ip_list_rcv,
 };
 
-static int __init inet_init(void)
+static int __init inet4_init(void)
 {
 	struct inet_protosw *q;
 	struct list_head *r;
 	int rc;
 
-	sock_skb_cb_check_size(sizeof(struct inet_skb_parm));
-
 	raw_hashinfo_init(&raw_v4_hashinfo);
 
 	rc = proto_register(&tcp_prot, 1);
@@ -1965,6 +2012,47 @@ static int __init inet_init(void)
 
 	ip_init();
 
+	return 0;
+out_unregister_raw_proto:
+	proto_unregister(&raw_prot);
+out_unregister_udp_proto:
+	proto_unregister(&udp_prot);
+out_unregister_tcp_proto:
+	proto_unregister(&tcp_prot);
+out:
+	return rc;
+}
+
+static void __init inet4_late_init(void)
+{
+	/*
+	 *	Initialise the multicast router
+	 */
+#if defined(CONFIG_IP_MROUTE)
+	if (ip_mr_init())
+		pr_crit("%s: Cannot init ipv4 mroute\n", __func__);
+#endif
+	ipv4_proc_init();
+
+	ipfrag_init();
+
+	dev_add_pack(&ip_packet_type);
+}
+
+static int __init inet_init(void)
+{
+	int rc;
+
+	sock_skb_cb_check_size(sizeof(struct inet_skb_parm));
+
+	if (IS_ENABLED(CONFIG_IPV4)) {
+		rc = inet4_init();
+		if (rc)
+			return rc;
+	}
+
+	inet_initpeers();
+
 	/* Initialise per-cpu ipv4 mibs */
 	if (init_ipv4_mibs())
 		panic("%s: Cannot init ipv4 mibs\n", __func__);
@@ -1986,35 +2074,20 @@ static int __init inet_init(void)
 	if (icmp_init() < 0)
 		panic("Failed to create the ICMP control socket.\n");
 
-	/*
-	 *	Initialise the multicast router
-	 */
-#if defined(CONFIG_IP_MROUTE)
-	if (ip_mr_init())
-		pr_crit("%s: Cannot init ipv4 mroute\n", __func__);
-#endif
-
 	if (init_inet_pernet_ops())
 		pr_crit("%s: Cannot init ipv4 inet pernet ops\n", __func__);
 
-	ipv4_proc_init();
-
-	ipfrag_init();
+#ifdef CONFIG_PROC_FS
+	if (ip_misc_proc_init())
+		pr_crit("%s: Cannot init ipv4 misc proc\n", __func__);
+#endif
 
-	dev_add_pack(&ip_packet_type);
+	if (IS_ENABLED(CONFIG_IPV4))
+		inet4_late_init();
 
 	ip_tunnel_core_init();
 
-	rc = 0;
-out:
-	return rc;
-out_unregister_raw_proto:
-	proto_unregister(&raw_prot);
-out_unregister_udp_proto:
-	proto_unregister(&udp_prot);
-out_unregister_tcp_proto:
-	proto_unregister(&tcp_prot);
-	goto out;
+	return 0;
 }
 
 fs_initcall(inet_init);
@@ -2034,12 +2107,8 @@ static int __init ipv4_proc_init(void)
 		goto out_udp;
 	if (ping_proc_init())
 		goto out_ping;
-	if (ip_misc_proc_init())
-		goto out_misc;
 out:
 	return rc;
-out_misc:
-	ping_proc_exit();
 out_ping:
 	udp4_proc_exit();
 out_udp:
diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index 5d6f5f5fc0ed..fd70160ce569 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -91,14 +91,6 @@ ip_fragment(struct net *net, struct sock *sk, struct sk_buff *skb,
 	    unsigned int mtu,
 	    int (*output)(struct net *, struct sock *, struct sk_buff *));
 
-/* Generate a checksum for an outgoing IP datagram. */
-void ip_send_check(struct iphdr *iph)
-{
-	iph->check = 0;
-	iph->check = ip_fast_csum((unsigned char *)iph, iph->ihl);
-}
-EXPORT_SYMBOL(ip_send_check);
-
 int __ip_local_out(struct net *net, struct sock *sk, struct sk_buff *skb)
 {
 	struct iphdr *iph = ip_hdr(skb);
@@ -936,24 +928,6 @@ int ip_do_fragment(struct net *net, struct sock *sk, struct sk_buff *skb,
 }
 EXPORT_SYMBOL(ip_do_fragment);
 
-int
-ip_generic_getfrag(void *from, char *to, int offset, int len, int odd, struct sk_buff *skb)
-{
-	struct msghdr *msg = from;
-
-	if (skb->ip_summed == CHECKSUM_PARTIAL) {
-		if (!copy_from_iter_full(to, len, &msg->msg_iter))
-			return -EFAULT;
-	} else {
-		__wsum csum = 0;
-		if (!csum_and_copy_from_iter_full(to, len, &csum, &msg->msg_iter))
-			return -EFAULT;
-		skb->csum = csum_block_add(skb->csum, csum, odd);
-	}
-	return 0;
-}
-EXPORT_SYMBOL(ip_generic_getfrag);
-
 static int __ip_append_data(struct sock *sk,
 			    struct flowi4 *fl4,
 			    struct sk_buff_head *queue,
@@ -1709,7 +1683,6 @@ void ip_send_unicast_reply(struct sock *sk, const struct sock *orig_sk,
 void __init ip_init(void)
 {
 	ip_rt_init();
-	inet_initpeers();
 
 #if defined(CONFIG_IP_MULTICAST)
 	igmp_mc_init();
diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
index b85125c3f14b..82f71a72a284 100644
--- a/net/ipv6/af_inet6.c
+++ b/net/ipv6/af_inet6.c
@@ -302,6 +302,11 @@ int __inet6_bind(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len,
 		struct net_device *dev = NULL;
 		int chk_addr_ret;
 
+		if (!IS_ENABLED(CONFIG_IPV4)) {
+			err = -EADDRNOTAVAIL;
+			goto out;
+		}
+
 		/* Binding to v4-mapped address on a v6-only socket
 		 * makes no sense
 		 */
diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
index ff7a7ffbf983..5a1fecae4a93 100644
--- a/net/ipv6/datagram.c
+++ b/net/ipv6/datagram.c
@@ -154,7 +154,7 @@ int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 	int			err;
 
 	if (usin->sin6_family == AF_INET) {
-		if (ipv6_only_sock(sk))
+		if (!IS_ENABLED(CONFIG_IPV4) || ipv6_only_sock(sk))
 			return -EAFNOSUPPORT;
 		err = __ip4_datagram_connect(sk, uaddr, addr_len);
 		goto ipv4_connected;
@@ -187,7 +187,7 @@ int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 	if (addr_type & IPV6_ADDR_MAPPED) {
 		struct sockaddr_in sin;
 
-		if (ipv6_only_sock(sk)) {
+		if (!IS_ENABLED(CONFIG_IPV4) || ipv6_only_sock(sk)) {
 			err = -ENETUNREACH;
 			goto out;
 		}
-- 
2.56.1

