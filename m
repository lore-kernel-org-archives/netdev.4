Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772838;
	b=5pSN+VVdBiTF9JDgYQlhsQzJ7DF8dmMpbS1pMiQiha1KhC6SdFo18EyK3C0clDT94YP+
	 YYkyBG06l6+9teG7UFxRmbR3Ik99fAzgG9q2Q2d+Wqoweqc6BIllUqXgh3yompzAbtUAr
	 O2U27erouNF2qMbXygmfPSa8LX8JedJ161ekn1pqkdo0IEA3prF12sZFt4cY/rQYYiXIs
	 9q056tWhMyRe2IWOS9QORnyBwSlp6ojUire0C4DcWsA44GbW0Z43PE3JK+9RGheLIcApQ
	 uWQ2AwdOPkOag3YTdtIpb+BuDPzcU18EfC9rNFahrnonk5V9mACGqumZmS52AEo6mdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ERPoF9AE59h/mhHC3wm9YzsbJsPqwKz283ZpiLJXs94=;
	b=IUEeaotudgjGA7DosK13N43W08a80voZ59jPwserqa135n14Pp3dJHiEo3uQZfkZK2/0
	 4vwBRR8E6kTUZKRypRoJwGjUrtooY1gfA+LbZuQ683v7bahdKBOxpmVDyrIPm5mmOIP7E
	 xs1AZEn+xPOiOKtlqJ6qumPnKpdmTwRuS3i22AeLu6GMbiR8zrnoEYmvOmZgyEy1JOtj3
	 nA4oazc72EQPUUHDzZ7eozn7ormav5E9UNwyK/SifdyX/4Tsyxb7HZfvqosqRMCc09OeV
	 amYrba8bmcvoWT8PaWOgxeUxg5I4IHoBwLIZGuKwSZqSyEbtVo90dUs13CCPejQsK8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=YBgas6Ug;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5204760A261F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5204760A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=YBgas6Ug
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-385d8a00598so11736939eec.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772837; x=1796377637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ERPoF9AE59h/mhHC3wm9YzsbJsPqwKz283ZpiLJXs94=;
        b=YBgas6Ug76VRLXKqDbshk1HEhFnj1GzM2HxxopuJfGUUkAhHarJg/0kfS5lKxB8B3I
         OS1YklOAFOseS0DU0BwnlksLGQSrfnGpTNxGeSnQJAxNlg791PebtxBrxzfZUBDuypwM
         G4Oa9FCHB7hxcsZslHDLBITe66ojBzfIIXikCAGpu6xDq4ifxfxjNuYx66OvxwHGWwD2
         +cwh5UKTMUovw57vzO3frAmMg2EDoLPst9mbpDJxeQZJk29eOIo+/1LJSehDVis9XwZc
         UU+Nb5kT7DfkRkSINq3FicF/GARL1ZOFJO/O4MlVMOPOpn5ZmU41zAvFJN+KwqDc3k8Z
         A4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772837; x=1796377637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ERPoF9AE59h/mhHC3wm9YzsbJsPqwKz283ZpiLJXs94=;
        b=ZghWzM/fmKgpATsmA18Y9U45kvEJoSVFRtnfMxCnTRB9dYaVkWCE5C9btX7QWL14YY
         ITNB/973wiWmift0BvqmJXQoUpHrsRL76A25OfWdilzK9tyMb8aTkTymYtNgxZDSaIC0
         gt4CSzt5BheQRifFoxYqXlXuYm6RWPYJdutyCXpJd6hwL2VL/9YHW3OMwNPt4U/s6q5z
         QwPBWJgDc2EIw4z7rtAwV8ivEdyd6vd/9imRjzNSdRDtaIla/GZLJsz1j3kNpO0Jyaxw
         KIa5GqyLFdM/uDH7T31Y2vHDA0SFj1PZlz1jQnxkM4vJdLYhbdYBDmJzeRzAJFLeL+zL
         Dh8w==
X-Forwarded-Encrypted: i=1; AL+hErEFMrrHvnNzT3SL8vQLgzr+Bveioxs4ZLJcdRagL8PZcUPQ1j3nN8Q3f5Ho/z8hnqK9fSy/6no=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7jFOXeNCS/8zrN7dlyl+0B11wzns0OGi0NsBGUQcGk3I8yinl
	obxd8DChimAdHrTPGcTgCWFzttWCb2VY6xjXcQzMVJ3UIYSGhW5pdEfoj7suTQH/3i4=
X-Gm-Gg: AZFdTZeFJJI8PqT50f/bzK5f8RPy6pOUIb19VWB++QiOEOzPeUL8+10muKMdNXFhI6J
	pQLEKs+S6wLOaqLBUsddrLT/iQwhousDgaAgOmhLfY/R7MqEPnBNvlpa+sukr6fRkdlEUATNEQD
	rUiGlMCWX4w3vU0GVrnLPDtXNWHOF11OvBwkmuXX3KUurvbxDRLOJiDK7H8S9/PXPEAgZsH4HgN
	3xL39w8nsFze8wfMxUpp6zS3u96o/t/0ksbrCu4scAm7nO27DtO2MwrFy4Dl+Kp1XOovKEWZlvp
	2FVS+/yWowqVPuR0yypuaanxW11qFVhs1pebRL/TDjb/GSzOrp6kNWrevLZDzdX00Z/b2Mucphh
	oitoAL4x17UqbEjmLsYhU+cSTFbPh4t/RDYoOGun3EtJeMZpqiPoTeQ7a8//uGo6G/32LtHGYM9
	xqfOrgTR8ZE+IPDb+FdbfE4XGdnjITw0HoCef6vz5o1IFroyfVTe0GcMS+lIVfEJGvvvsPfeLxx
	eZ6ruzsrh9VFBioXD/Hbvp9loFVvYT4/oR5Kfp8kwfKkVsxNF3HWeV2emVCoH6v1f279dWg6H9I
	dKecwW8oNomGfBt9wN2RhGxurJWnxQtuurrLcF5olRNzWSSCfab5PGZEHCVcAeYFl9rsuC+XjTn
	5bAQ5V7zkyJcesyNoVjgKdxnNfZk=
X-Received: by 2002:a05:7022:f513:b0:1b3:b53e:b4cd with SMTP id a92af1059eb24-1b5568a951cmr22122554c88.21.1795772837417;
        Fri, 27 Nov 2026 01:47:17 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:16 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v3 07/12] amt: send the AMT gateway control plane over IPv6
Date: Fri, 27 Nov 2026 09:46:58 +0000
Message-ID: <20261127094703.3025517-8-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094703.3025517-1-omar@blockcast.net>
References: <20261127094703.3025517-1-omar@blockcast.net>
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

A gateway sends three control messages: the Relay Discovery to its
discovery address, then the Request and the Membership Updates to the
relay it learned. All three are built for an IPv4 outer header only, so
a gateway on an IPv6-only access network cannot reach any relay.

Send the Discovery and the Request of a gateway with an IPv6 local
address from amt_send_discovery_v6() and amt_send_request_v6(). Both
messages are a few bytes with no payload, so they are built on the stack
and sent with amt_send_ctrl_v6(), the helper that already sends the
relay's IPv6 Advertisement, rather than with a copy of the IPv4 skb
construction. The Membership Update carries the gateway's IGMP or MLD
report, so amt_send_membership_update() keeps building on that skb: it
sizes the headroom for the outer family and sends through
amt_udp_xmit(), like the relay's Membership Query and Multicast Data,
which avoids an IPv6 copy of the function.

struct amt_dev gains the gateway's IPv6 discovery address and the IPv6
relay address it learns and sends to. Nothing writes the latter until
the next patch, which also adds its synchronisation.

amt_send_ctrl_v6() now holds rcu_read_lock_bh() instead of
rcu_read_lock(). The gateway sends the Discovery and the Request from
its event worker in process context, and udp_tunnel6_xmit_skb() reaches
ip6tunnel_xmit(), which increments and later decrements the per-CPU xmit
recursion counter with __this_cpu_inc() and __this_cpu_dec(). With
preemption enabled the task could migrate in between and leave both
counters wrong. The IPv4 Discovery and Request go through ip_local_out()
and never touch the counter, and the relay's Advertisement is sent from
softirq, so neither is affected.

Nothing can set a local IPv6 address until the netlink attributes
arrive, so none of the IPv6 sender code added here runs yet, and the
conversion of amt_send_membership_update() to amt_ip_hlen() and
amt_udp_xmit() changes no IPv4 behaviour.

The P bit of the Request and the inner protocol of the Update still
follow the inner family, so an IPv6 gateway requests and reports both
IGMP and MLD, as an IPv4 one does.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 84 ++++++++++++++++++++++++++++++-----------------
 include/net/amt.h |  8 +++++
 2 files changed, 62 insertions(+), 30 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index ecc30823d..42de266f3 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -808,8 +808,11 @@ static int amt_send_ctrl_v6(struct amt_dev *amt, const struct in6_addr *saddr,
 	struct sock *sk;
 	int hlen, err;
 
-	rcu_read_lock();
-	sk = rcu_dereference(amt->sk);
+	/* The gateway sends from its event worker, but ip6tunnel_xmit()
+	 * counts xmit recursion per CPU, which needs BH disabled.
+	 */
+	rcu_read_lock_bh();
+	sk = rcu_dereference_bh(amt->sk);
 	if (!sk || !netif_running(amt->stream_dev) ||
 	    !netif_running(amt->dev)) {
 		err = -ENETDOWN;
@@ -841,10 +844,39 @@ static int amt_send_ctrl_v6(struct amt_dev *amt, const struct in6_addr *saddr,
 			     ip6_dst_hoplimit(dst), 0, sport, dport, false, 0);
 	err = 0;
 out:
-	rcu_read_unlock();
+	rcu_read_unlock_bh();
 	return err;
 }
 
+/* IPv6-outer variant of amt_send_discovery(). */
+static void amt_send_discovery_v6(struct amt_dev *amt)
+{
+	struct amt_header_discovery amtd = {
+		.type	= AMT_MSG_DISCOVERY,
+		.nonce	= amt->nonce,
+	};
+
+	if (!amt_send_ctrl_v6(amt, &amt->local_ipv6, &amt->discovery_ipv6,
+			      amt->gw_port, amt->relay_port,
+			      &amtd, sizeof(amtd)))
+		amt_update_gw_status(amt, AMT_STATUS_SENT_DISCOVERY, true);
+}
+
+/* IPv6-outer variant of amt_send_request(). The inner-family @v6 sets the
+ * P bit (IGMP vs MLD) independently of the outer transport.
+ */
+static void amt_send_request_v6(struct amt_dev *amt, bool v6)
+{
+	struct amt_header_request amtrh = {
+		.type	= AMT_MSG_REQUEST,
+		.p	= v6,
+		.nonce	= amt->nonce,
+	};
+
+	amt_send_ctrl_v6(amt, &amt->local_ipv6, &amt->remote_ipv6,
+			 amt->gw_port, amt->relay_port, &amtrh, sizeof(amtrh));
+}
+
 static void amt_send_discovery(struct amt_dev *amt)
 {
 	struct amt_header_discovery *amtd;
@@ -858,6 +890,11 @@ static void amt_send_discovery(struct amt_dev *amt)
 	u32 len;
 	int err;
 
+	if (amt_v6(amt)) {
+		amt_send_discovery_v6(amt);
+		return;
+	}
+
 	rcu_read_lock();
 	sk = rcu_dereference(amt->sk);
 	if (!sk)
@@ -948,6 +985,11 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 	u32 len;
 	int err;
 
+	if (amt_v6(amt)) {
+		amt_send_request_v6(amt, v6);
+		return;
+	}
+
 	rcu_read_lock();
 	remote_ip = READ_ONCE(amt->remote_ip);
 	sk = rcu_dereference(amt->sk);
@@ -1356,9 +1398,7 @@ static bool amt_send_membership_update(struct amt_dev *amt,
 {
 	__be32 remote_ip = READ_ONCE(amt->remote_ip);
 	struct amt_header_membership_update *amtmu;
-	struct iphdr *iph;
-	struct flowi4 fl4;
-	struct rtable *rt;
+	union amt_addr remote = {};
 	struct sock *sk;
 	int err;
 
@@ -1367,23 +1407,11 @@ static bool amt_send_membership_update(struct amt_dev *amt,
 		return true;
 
 	err = skb_cow_head(skb, LL_RESERVED_SPACE(amt->dev) + sizeof(*amtmu) +
-			   sizeof(*iph) + sizeof(struct udphdr));
+			   amt_ip_hlen(amt) + sizeof(struct udphdr));
 	if (err)
 		return true;
 
 	skb_reset_inner_headers(skb);
-	memset(&fl4, 0, sizeof(struct flowi4));
-	fl4.flowi4_oif         = amt->stream_dev->ifindex;
-	fl4.daddr              = remote_ip;
-	fl4.saddr              = amt->local_ip;
-	fl4.flowi4_dscp        = inet_dsfield_to_dscp(AMT_TOS);
-	fl4.flowi4_proto       = IPPROTO_UDP;
-	rt = ip_route_output_key(amt->net, &fl4);
-	if (IS_ERR(rt)) {
-		netdev_dbg(amt->dev, "no route to %pI4\n", &remote_ip);
-		return true;
-	}
-
 	amtmu			= skb_push(skb, sizeof(*amtmu));
 	amtmu->version		= 0;
 	amtmu->type		= AMT_MSG_MEMBERSHIP_UPDATE;
@@ -1395,17 +1423,13 @@ static bool amt_send_membership_update(struct amt_dev *amt,
 		skb_set_inner_protocol(skb, htons(ETH_P_IP));
 	else
 		skb_set_inner_protocol(skb, htons(ETH_P_IPV6));
-	udp_tunnel_xmit_skb(rt, sk, skb,
-			    fl4.saddr,
-			    fl4.daddr,
-			    AMT_TOS,
-			    ip4_dst_hoplimit(&rt->dst),
-			    0,
-			    amt->gw_port,
-			    amt->relay_port,
-			    false,
-			    false,
-			    0);
+	if (amt_v6(amt))
+		remote.ip6 = amt->remote_ipv6;
+	else
+		remote.ip4 = remote_ip;
+	if (amt_udp_xmit(amt, sk, skb, &remote, amt->gw_port,
+			 amt->relay_port, inet_dsfield_to_dscp(AMT_TOS), NULL))
+		return true;
 	amt_update_gw_status(amt, AMT_STATUS_SENT_UPDATE, true);
 	return false;
 }
diff --git a/include/net/amt.h b/include/net/amt.h
index eabe6fa7a..be564c710 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -390,8 +390,16 @@ struct amt_dev {
 	struct in6_addr		local_ipv6;
 	/* Outer remote ip */
 	__be32			remote_ip;
+	/* Outer remote ipv6 (learned from the v6 Relay Advertisement;
+	 * in6addr_any in v4 mode, mutually exclusive with remote_ip)
+	 */
+	struct in6_addr		remote_ipv6;
 	/* Outer discovery ip */
 	__be32			discovery_ip;
+	/* Outer discovery ipv6 (v6 gateway only; in6addr_any in v4 mode,
+	 * mutually exclusive with discovery_ip)
+	 */
+	struct in6_addr		discovery_ipv6;
 	/* Only used in gateway mode */
 	__be32			nonce;
 	/* Gateway sent request and received query */
