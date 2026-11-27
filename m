Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800032;
	b=kjoxte3ubS/lFM6i1jC8tLItIqBl08ZCLE6brJ+GcvjIicMFQPJPnHf6Wj1WtfnRhtR/
	 9YcsNQv72VqLNXJdN4VEC7JOIvr9gbC4ghHZ6cn94DEzFATaWGMCpHJssL189N3H/ttVZ
	 fnBHVHN8wI5f+ILc7JnEGIwWnBt9SwFszaN1FcJzsbyB45y2bWiwMuBHMtWHqXfq7jlNv
	 zFKz3PoI0cpYZXAC8+n1diKkjWFrxAR5MGt2fAOCBHWfhQ20DUejsaTUA+mD6MfOxzRRl
	 fHgEwtuvXg8dkNoBJlu7eYkjq1KmpsXi1kZf9Mz4nr0GdYe0vAPrDpnFyPkPw6n1L2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800032;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Queue-Id:
	 X-Rspamd-Pre-Result:X-Rspamd-Action:X-Rspamd-Server:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=GsDB2uwXz9vvqCrtgXsgIf2Mu0sK8o6YEPEk+AhcB74=;
	b=qht3lsgKWfRogKaLiQfo69Icvsl8iyeiUEL12gO6OFCW+5bI66raq0dIsOb+mTuiKuKy
	 MIngNh8KcIw71H3xL1UjvH3iMnnKPft6sfRGvotcPpGPeG23wwD4FImfcHa5DqPq980RM
	 MIFddnmPA+AdljO8Bw9NblzIdKz05TMCGXwQDsDlIQo2qLH6WamDZ5MeFAR/eIWkk34nN
	 lq0+dnbIDtXf72Z3i9rKm+DXM1ksYh6ckNsmcR2A9dr/tv4RXUhHfOJppE4MkEJJKcbL4
	 PQH5j4B8reUZnk2yO0y1rcipC9LGuL0FKhzB4uWmOjys9s3VEScVE/bb/23w6GNs2xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61DD606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 17:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A61DD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DBCD322063;
	Fri, 27 Nov 2026 17:20:29 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 02AB413432;
	Fri, 27 Nov 2026 17:20:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /Yb1MH67CWuMAwAAD6G6ig:T12
	(envelope-from <fmancera@suse.de>); Fri, 27 Nov 2026 17:20:28 +0000
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Willem de Bruijn <willemb@google.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
	Joel Granados <joel.granados@kernel.org>,
	Yung Chih Su <yuuchihsu@gmail.com>,
	Yingjie Wang <1075151112@qq.com>,
	Wyatt Feng <bronzed_45_vested@icloud.com>
Subject: [PATCH net-next v4 11/16] ipv4: disable IPv4-only sysctls when CONFIG_IPV4=n
Date: Fri, 27 Nov 2026 18:17:56 +0100
Message-ID: <20261127171824.27362-12-fmancera@suse.de>
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
X-Rspamd-Queue-Id: DBCD322063
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

To avoid noise and unexpected problems, let's hide all the sysctls that
are related to IPv4 only when the kernel is compiled without IPv4
support.

Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
---
 net/ipv4/sysctl_net_ipv4.c | 409 +++++++++++++++++++------------------
 1 file changed, 207 insertions(+), 202 deletions(-)

diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
index 936fd19783dc..8ab5afd2f862 100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -32,8 +32,8 @@ static int tcp_min_snd_mss_max = 65535;
 static int tcp_rto_max_max = TCP_RTO_MAX_SEC * MSEC_PER_SEC;
 static int ip_privileged_port_min;
 static int ip_privileged_port_max = 65535;
-static int ip_ttl_min = 1;
-static int ip_ttl_max = 255;
+static int ip_ttl_min __maybe_unused = 1;
+static int ip_ttl_max __maybe_unused = 255;
 static int tcp_syn_retries_min = 1;
 static int tcp_syn_retries_max = MAX_TCP_SYNCNT;
 static int tcp_syn_linear_timeouts_max = MAX_TCP_SYNCNT;
@@ -49,7 +49,7 @@ static int tcp_plb_max_rounds = 31;
 static int tcp_plb_max_cong_thresh = 256;
 static unsigned int tcp_tw_reuse_delay_max = TCP_PAWS_MSL * MSEC_PER_SEC;
 static int tcp_ecn_mode_max = 5;
-static u32 icmp_errors_extension_mask_all =
+static u32 icmp_errors_extension_mask_all __maybe_unused =
 	GENMASK_U8(ICMP_ERR_EXT_COUNT - 1, 0);
 
 static int tcp_min_rcvbuf = 4096;
@@ -202,8 +202,9 @@ static int ipv4_ping_group_range(const struct ctl_table *table, int write,
 	return ret;
 }
 
-static int ipv4_fwd_update_priority(const struct ctl_table *table, int write,
-				    void *buffer, size_t *lenp, loff_t *ppos)
+static int __maybe_unused
+ipv4_fwd_update_priority(const struct ctl_table *table, int write,
+			 void *buffer, size_t *lenp, loff_t *ppos)
 {
 	struct net *net;
 	int ret;
@@ -442,9 +443,9 @@ static int proc_udp_hash_entries(const struct ctl_table *table, int write,
 }
 
 #ifdef CONFIG_IP_ROUTE_MULTIPATH
-static int proc_fib_multipath_hash_policy(const struct ctl_table *table, int write,
-					  void *buffer, size_t *lenp,
-					  loff_t *ppos)
+static int __maybe_unused
+proc_fib_multipath_hash_policy(const struct ctl_table *table, int write,
+			       void *buffer, size_t *lenp, loff_t *ppos)
 {
 	struct net *net = container_of(table->data, struct net,
 	    ipv4.sysctl_fib_multipath_hash_policy);
@@ -457,9 +458,9 @@ static int proc_fib_multipath_hash_policy(const struct ctl_table *table, int wri
 	return ret;
 }
 
-static int proc_fib_multipath_hash_fields(const struct ctl_table *table, int write,
-					  void *buffer, size_t *lenp,
-					  loff_t *ppos)
+static int __maybe_unused
+proc_fib_multipath_hash_fields(const struct ctl_table *table, int write,
+			       void *buffer, size_t *lenp, loff_t *ppos)
 {
 	struct net *net;
 	int ret;
@@ -493,9 +494,9 @@ static void proc_fib_multipath_hash_set_seed(struct net *net, u32 user_seed)
 	WRITE_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed.mp_seed, new.mp_seed);
 }
 
-static int proc_fib_multipath_hash_seed(const struct ctl_table *table, int write,
-					void *buffer, size_t *lenp,
-					loff_t *ppos)
+static int
+proc_fib_multipath_hash_seed(const struct ctl_table *table, int write,
+			     void *buffer, size_t *lenp, loff_t *ppos)
 {
 	struct sysctl_fib_multipath_hash_seed *mphs;
 	struct net *net = table->data;
@@ -637,15 +638,6 @@ static const struct ctl_table ipv4_net_table[] = {
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec
 	},
-	{
-		.procname	= "icmp_echo_ignore_all",
-		.data		= &init_net.ipv4.sysctl_icmp_echo_ignore_all,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE
-	},
 	{
 		.procname	= "icmp_echo_enable_probe",
 		.data		= &init_net.ipv4.sysctl_icmp_echo_enable_probe,
@@ -655,56 +647,6 @@ static const struct ctl_table ipv4_net_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE
 	},
-	{
-		.procname	= "icmp_echo_ignore_broadcasts",
-		.data		= &init_net.ipv4.sysctl_icmp_echo_ignore_broadcasts,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE
-	},
-	{
-		.procname	= "icmp_ignore_bogus_error_responses",
-		.data		= &init_net.ipv4.sysctl_icmp_ignore_bogus_error_responses,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE
-	},
-	{
-		.procname	= "icmp_errors_use_inbound_ifaddr",
-		.data		= &init_net.ipv4.sysctl_icmp_errors_use_inbound_ifaddr,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE
-	},
-	{
-		.procname	= "icmp_errors_extension_mask",
-		.data		= &init_net.ipv4.sysctl_icmp_errors_extension_mask,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= &icmp_errors_extension_mask_all,
-	},
-	{
-		.procname	= "icmp_ratelimit",
-		.data		= &init_net.ipv4.sysctl_icmp_ratelimit,
-		.maxlen		= sizeof(int),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec_ms_jiffies,
-	},
-	{
-		.procname	= "icmp_ratemask",
-		.data		= &init_net.ipv4.sysctl_icmp_ratemask,
-		.maxlen		= sizeof(int),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec
-	},
 	{
 		.procname	= "icmp_msgs_per_sec",
 		.data		= &init_net.ipv4.sysctl_icmp_msgs_per_sec,
@@ -775,13 +717,6 @@ static const struct ctl_table ipv4_net_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
 	},
-	{
-		.procname	= "ip_dynaddr",
-		.data		= &init_net.ipv4.sysctl_ip_dynaddr,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-	},
 	{
 		.procname	= "ip_early_demux",
 		.data		= &init_net.ipv4.sysctl_ip_early_demux,
@@ -812,15 +747,6 @@ static const struct ctl_table ipv4_net_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
 	},
-	{
-		.procname	= "ip_default_ttl",
-		.data		= &init_net.ipv4.sysctl_ip_default_ttl,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-		.extra1		= &ip_ttl_min,
-		.extra2		= &ip_ttl_max,
-	},
 	{
 		.procname	= "ip_local_port_range",
 		.maxlen		= 0,
@@ -842,36 +768,6 @@ static const struct ctl_table ipv4_net_table[] = {
 		.mode		= 0644,
 		.proc_handler	= proc_do_large_bitmap,
 	},
-	{
-		.procname	= "ip_no_pmtu_disc",
-		.data		= &init_net.ipv4.sysctl_ip_no_pmtu_disc,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-	},
-	{
-		.procname	= "ip_forward_use_pmtu",
-		.data		= &init_net.ipv4.sysctl_ip_fwd_use_pmtu,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-	},
-	{
-		.procname	= "ip_forward_update_priority",
-		.data		= &init_net.ipv4.sysctl_ip_fwd_update_priority,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler   = ipv4_fwd_update_priority,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE,
-	},
-	{
-		.procname	= "ip_nonlocal_bind",
-		.data		= &init_net.ipv4.sysctl_ip_nonlocal_bind,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-	},
 	{
 		.procname	= "ip_autobind_reuse",
 		.data		= &init_net.ipv4.sysctl_ip_autobind_reuse,
@@ -881,13 +777,6 @@ static const struct ctl_table ipv4_net_table[] = {
 		.extra1         = SYSCTL_ZERO,
 		.extra2         = SYSCTL_ONE,
 	},
-	{
-		.procname	= "fwmark_reflect",
-		.data		= &init_net.ipv4.sysctl_fwmark_reflect,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-	},
 	{
 		.procname	= "tcp_fwmark_accept",
 		.data		= &init_net.ipv4.sysctl_tcp_fwmark_accept,
@@ -953,37 +842,6 @@ static const struct ctl_table ipv4_net_table[] = {
 		.proc_handler	= proc_douintvec_minmax,
 		.extra2		= &u32_max_div_HZ,
 	},
-	{
-		.procname	= "igmp_link_local_mcast_reports",
-		.data		= &init_net.ipv4.sysctl_igmp_llm_reports,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-	},
-	{
-		.procname	= "igmp_max_memberships",
-		.data		= &init_net.ipv4.sysctl_igmp_max_memberships,
-		.maxlen		= sizeof(int),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec
-	},
-	{
-		.procname	= "igmp_max_msf",
-		.data		= &init_net.ipv4.sysctl_igmp_max_msf,
-		.maxlen		= sizeof(int),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec
-	},
-#ifdef CONFIG_IP_MULTICAST
-	{
-		.procname	= "igmp_qrv",
-		.data		= &init_net.ipv4.sysctl_igmp_qrv,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-		.extra1		= SYSCTL_ONE
-	},
-#endif
 	{
 		.procname	= "tcp_congestion_control",
 		.data		= &init_net.ipv4.tcp_congestion_control,
@@ -1155,42 +1013,6 @@ static const struct ctl_table ipv4_net_table[] = {
 		.proc_handler	= proc_tfo_blackhole_detect_timeout,
 		.extra1		= SYSCTL_ZERO,
 	},
-#ifdef CONFIG_IP_ROUTE_MULTIPATH
-	{
-		.procname	= "fib_multipath_use_neigh",
-		.data		= &init_net.ipv4.sysctl_fib_multipath_use_neigh,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE,
-	},
-	{
-		.procname	= "fib_multipath_hash_policy",
-		.data		= &init_net.ipv4.sysctl_fib_multipath_hash_policy,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_fib_multipath_hash_policy,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_THREE,
-	},
-	{
-		.procname	= "fib_multipath_hash_fields",
-		.data		= &init_net.ipv4.sysctl_fib_multipath_hash_fields,
-		.maxlen		= sizeof(u32),
-		.mode		= 0644,
-		.proc_handler	= proc_fib_multipath_hash_fields,
-		.extra1		= SYSCTL_ONE,
-		.extra2		= &fib_multipath_hash_fields_all_mask,
-	},
-	{
-		.procname	= "fib_multipath_hash_seed",
-		.data		= &init_net,
-		.maxlen		= sizeof(u32),
-		.mode		= 0644,
-		.proc_handler	= proc_fib_multipath_hash_seed,
-	},
-#endif
 	{
 		.procname	= "ip_unprivileged_port_start",
 		.maxlen		= sizeof(int),
@@ -1565,15 +1387,6 @@ static const struct ctl_table ipv4_net_table[] = {
 		.proc_handler	= proc_dointvec_minmax,
 		.extra1		= SYSCTL_ONE
 	},
-	{
-		.procname	= "fib_notify_on_flag_change",
-		.data		= &init_net.ipv4.sysctl_fib_notify_on_flag_change,
-		.maxlen		= sizeof(u8),
-		.mode		= 0644,
-		.proc_handler	= proc_dou8vec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_TWO,
-	},
 	{
 		.procname       = "tcp_plb_enabled",
 		.data           = &init_net.ipv4.sysctl_tcp_plb_enabled,
@@ -1658,6 +1471,198 @@ static const struct ctl_table ipv4_net_table[] = {
 		.extra1		= SYSCTL_ONE_THOUSAND,
 		.extra2		= &tcp_rto_max_max,
 	},
+#ifdef CONFIG_IP_ROUTE_MULTIPATH
+	{
+		.procname	= "fib_multipath_hash_seed",
+		.data		= &init_net,
+		.maxlen		= sizeof(u32),
+		.mode		= 0644,
+		.proc_handler	= proc_fib_multipath_hash_seed,
+	},
+#endif
+#if IS_ENABLED(CONFIG_IPV4)
+	{
+		.procname	= "icmp_echo_ignore_all",
+		.data		= &init_net.ipv4.sysctl_icmp_echo_ignore_all,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE
+	},
+	{
+		.procname	= "icmp_echo_ignore_broadcasts",
+		.data		= &init_net.ipv4.sysctl_icmp_echo_ignore_broadcasts,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE
+	},
+	{
+		.procname	= "icmp_ignore_bogus_error_responses",
+		.data		= &init_net.ipv4.sysctl_icmp_ignore_bogus_error_responses,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE
+	},
+	{
+		.procname	= "icmp_errors_use_inbound_ifaddr",
+		.data		= &init_net.ipv4.sysctl_icmp_errors_use_inbound_ifaddr,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE
+	},
+	{
+		.procname	= "icmp_errors_extension_mask",
+		.data		= &init_net.ipv4.sysctl_icmp_errors_extension_mask,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= &icmp_errors_extension_mask_all,
+	},
+	{
+		.procname	= "icmp_ratelimit",
+		.data		= &init_net.ipv4.sysctl_icmp_ratelimit,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_ms_jiffies,
+	},
+	{
+		.procname	= "icmp_ratemask",
+		.data		= &init_net.ipv4.sysctl_icmp_ratemask,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec
+	},
+	{
+		.procname	= "ip_dynaddr",
+		.data		= &init_net.ipv4.sysctl_ip_dynaddr,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+	},
+	{
+		.procname	= "ip_default_ttl",
+		.data		= &init_net.ipv4.sysctl_ip_default_ttl,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+		.extra1		= &ip_ttl_min,
+		.extra2		= &ip_ttl_max,
+	},
+	{
+		.procname	= "ip_no_pmtu_disc",
+		.data		= &init_net.ipv4.sysctl_ip_no_pmtu_disc,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+	},
+	{
+		.procname	= "ip_forward_use_pmtu",
+		.data		= &init_net.ipv4.sysctl_ip_fwd_use_pmtu,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+	},
+	{
+		.procname	= "ip_forward_update_priority",
+		.data		= &init_net.ipv4.sysctl_ip_fwd_update_priority,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler   = ipv4_fwd_update_priority,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+	{
+		.procname	= "ip_nonlocal_bind",
+		.data		= &init_net.ipv4.sysctl_ip_nonlocal_bind,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+	},
+	{
+		.procname	= "fwmark_reflect",
+		.data		= &init_net.ipv4.sysctl_fwmark_reflect,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+	},
+	{
+		.procname	= "igmp_link_local_mcast_reports",
+		.data		= &init_net.ipv4.sysctl_igmp_llm_reports,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+	},
+	{
+		.procname	= "igmp_max_memberships",
+		.data		= &init_net.ipv4.sysctl_igmp_max_memberships,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec
+	},
+	{
+		.procname	= "igmp_max_msf",
+		.data		= &init_net.ipv4.sysctl_igmp_max_msf,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec
+	},
+#ifdef CONFIG_IP_MULTICAST
+	{
+		.procname	= "igmp_qrv",
+		.data		= &init_net.ipv4.sysctl_igmp_qrv,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+		.extra1		= SYSCTL_ONE
+	},
+#endif
+#ifdef CONFIG_IP_ROUTE_MULTIPATH
+	{
+		.procname	= "fib_multipath_use_neigh",
+		.data		= &init_net.ipv4.sysctl_fib_multipath_use_neigh,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+	{
+		.procname	= "fib_multipath_hash_policy",
+		.data		= &init_net.ipv4.sysctl_fib_multipath_hash_policy,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_fib_multipath_hash_policy,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_THREE,
+	},
+	{
+		.procname	= "fib_multipath_hash_fields",
+		.data		= &init_net.ipv4.sysctl_fib_multipath_hash_fields,
+		.maxlen		= sizeof(u32),
+		.mode		= 0644,
+		.proc_handler	= proc_fib_multipath_hash_fields,
+		.extra1		= SYSCTL_ONE,
+		.extra2		= &fib_multipath_hash_fields_all_mask,
+	},
+#endif
+	{
+		.procname	= "fib_notify_on_flag_change",
+		.data		= &init_net.ipv4.sysctl_fib_notify_on_flag_change,
+		.maxlen		= sizeof(u8),
+		.mode		= 0644,
+		.proc_handler	= proc_dou8vec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_TWO,
+	},
+#endif
 };
 
 static const struct ctl_table *ipv4_net_table_dup(struct net *net)
-- 
2.56.1

