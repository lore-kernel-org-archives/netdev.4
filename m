Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794671518;
	b=sdgLkr9XstsN9rnLmpVudwDigim0qpFHSiFv5533YZsWhR6kLLrsgWTpWV0pe/06rQCW
	 5oh5vOJEypLWNggNpDtY8rSac64R1yVovb7zKAruHoy/ph4ndecugIpaPJtTBUhIADb5V
	 syC06DDUOSjjK0O26qIxiggl9avMlDpyrkCgbgKqXnGYrjMtBMl9DggVlTRhTSEyC4qyO
	 uEk4D6B2oFroo6DYFsu2g6ng3kayGYN/a75M/GzOW5JVxSOeL14ghJnqVvUBJo8Z01EEs
	 9YFbfq0XvpIkCGOjokHil7wOTEWsJEBgD0T7a6V9rLrFteBsqqFZdW72vXQx4yyimsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794671518;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=E4HQMaLrw04KRiwZOD32ldkyWFbtfNd2ZmVJqGVaBjc=;
	b=shdi8bb7qWba7CHUt7TWF66cRRwYPncJljcoBTAbEeFi3IeZucn7Cb9ERa3fB2OH5S4A
	 JZcms5xHITh7KAlqNdze0rkUTH6utQFEtIBPdmtr0NyuS3USTaIxp+gqb5vME+OO1PxZD
	 8Dbam9gs/7FQipyMk0noPjLJvV4XZwa4z6KHJbcQEpmpfb1qieL9kiwwLb5xJxOmGPpfU
	 leGqnm8BO4tqXRetcQjScg7ca8+nMASsO5OSTIr2A66BTGRE9vfDcARe1TQQItDiPRpdc
	 EPkyK9G2Np3r1JaWFrwj5tJtzAG32Mvtq1LR3dlq3gmyrfL7QA0/mK+rou+XOzuXZ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpM25IwG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF58606A332
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpM25IwG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0D71F000C6;
	Sat, 14 Nov 2026 15:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794671518;
	bh=E4HQMaLrw04KRiwZOD32ldkyWFbtfNd2ZmVJqGVaBjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SpM25IwGgsjw8zBhLca+ztVIYBUaLNWejRuzCzZHcu+8jFbB2o53Jkp1Ct5I2JdbT
	 lSNWQ1MufOtJF6NqsbtAllCcSLmizdj86ewTs47kiWZrnn3UJXwXymizi54WQIlRww
	 g7rgR8Ye/92RMiqBhavtoLMm9q0Mezub9uK/NWB78VqCu+CtjXpeo7V+aq1WGpAGlh
	 gc65q96B8QSDFY4Fbn65bIECT5Z6pM54s2m2BEPOnKMD9f7aM35fGNBcy89vKA5ckV
	 hQ3h5OGu3BsnjTTjbfcb4GGV49hxB924GFL1Zfrl1bifvXztvPLJsA9xuFCTM9Rj1H
	 OJ8cXo3KsChGQ==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Neal Cardwell <ncardwell@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next 1/5] tcp: add TCPRcvCollapseSkipped counter
Date: Sat, 14 Nov 2026 16:51:46 +0100
Message-ID: <20261114155150.235743-2-edumazet@kernel.org>
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

Commit c2213d9b61c1 ("tcp: rate limit receive queue collapsing") rate
limits collapsing in tcp_prune_queue(): it is only attempted when at
least 1/8 of sk_rcvbuf of new memory was queued in the receive queues
since the previous collapse.

Add a TcpExtTCPRcvCollapseSkipped counter, incremented when a collapse
is skipped for this reason. A high rate can indicate a peer repeatedly
sending segments that can not be queued.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 Documentation/networking/snmp_counter.rst | 7 +++++++
 include/uapi/linux/snmp.h                 | 1 +
 net/ipv4/proc.c                           | 1 +
 net/ipv4/tcp_input.c                      | 2 ++
 4 files changed, 11 insertions(+)

diff --git a/Documentation/networking/snmp_counter.rst b/Documentation/networking/snmp_counter.rst
index ff1e6a8ffe21..c8f62bae632f 100644
--- a/Documentation/networking/snmp_counter.rst
+++ b/Documentation/networking/snmp_counter.rst
@@ -1024,6 +1024,13 @@ this counter will be updated. It means the 'prune' fails.
 
 This counter indicates how many skbs are freed during 'collapse'.
 
+* TcpExtTCPRcvCollapseSkipped
+
+'Collapse' was skipped, because less than 1/8 of the receive buffer of
+new memory was queued since the previous 'collapse'.
+A high rate can indicate a peer repeatedly sending segments that can
+not be queued.
+
 examples
 ========
 
diff --git a/include/uapi/linux/snmp.h b/include/uapi/linux/snmp.h
index 49f5640092a0..ee2900e0d90d 100644
--- a/include/uapi/linux/snmp.h
+++ b/include/uapi/linux/snmp.h
@@ -306,6 +306,7 @@ enum
 	LINUX_MIB_TCPAOKEYNOTFOUND,		/* TCPAOKeyNotFound */
 	LINUX_MIB_TCPAOGOOD,			/* TCPAOGood */
 	LINUX_MIB_TCPAODROPPEDICMPS,		/* TCPAODroppedIcmps */
+	LINUX_MIB_TCPRCVCOLLAPSESKIPPED,	/* TCPRcvCollapseSkipped */
 	__LINUX_MIB_MAX
 };
 
diff --git a/net/ipv4/proc.c b/net/ipv4/proc.c
index bfc06d1713ec..a4c53a78efc8 100644
--- a/net/ipv4/proc.c
+++ b/net/ipv4/proc.c
@@ -302,6 +302,7 @@ static const struct snmp_mib snmp4_net_list[] = {
 	SNMP_MIB_ITEM("TCPAOKeyNotFound", LINUX_MIB_TCPAOKEYNOTFOUND),
 	SNMP_MIB_ITEM("TCPAOGood", LINUX_MIB_TCPAOGOOD),
 	SNMP_MIB_ITEM("TCPAODroppedIcmps", LINUX_MIB_TCPAODROPPEDICMPS),
+	SNMP_MIB_ITEM("TCPRcvCollapseSkipped", LINUX_MIB_TCPRCVCOLLAPSESKIPPED),
 };
 
 static void icmpmsg_put_line(struct seq_file *seq, unsigned long *vals,
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index a2074a1af422..80f8f262bc44 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -6100,6 +6100,8 @@ static int tcp_prune_queue(struct sock *sk, const struct sk_buff *in_skb)
 
 		if (tcp_can_ingest(sk, in_skb))
 			return 0;
+	} else {
+		NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPRCVCOLLAPSESKIPPED);
 	}
 
 	/* Collapsing did not help (or was not allowed),
-- 
2.53.0

