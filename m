Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116115;
	b=qCu6aeSTP8CtpIovpW3LncrwDGLMEnO+FrbDPqOKdwk8K1bwzySbAPJ/sRDMuZDoGJMi
	 DmUWoxa0ZqqTLMSTYBzcTyqwEZixfIakoIxoDx93m/XtwG9q7jLXPtYu2DC6PWJEOaZuW
	 6JBLCF1s7uW1dZDtZ/PiELx03+WgeSxuaHpoLAg0Afvo7R6IEpR4hW5BN/omsT+2IrNZL
	 oSqmmGfEFdb7TWHlyfk67NAK0nom/xbdEXybTcz7dpDxpnEPDMh5hFH1oWthBpB2Cu54Y
	 asbTCwQbj0wL0QndbTHt5AC/4fNnXDuuw4CLBZkRTYk5vtuXt8QG8OpqmfggdgT4EMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=EZxKuaQ3gr1F8JRDyLliq4Asg6s39aWAxeOoWBrwBGg=;
	b=YGUHpWzazqaj4dvoRJ3tjodKAVt/hUKMcFZq1wxXeabejLmLYnZzbbHkHoWOF/s4wyIh
	 QGd/zUj28pl9NqphYPiZyoQ35SiUvC6FTPMX0DplQSwWSvqrbI6RA+JosPR7koyN4jvol
	 9cgyS4lcumm4n52eUbThA88jQJrm74yBn0ogVhb3nowRxPAINP/IYwZ0EDGDWvx9n99kR
	 Pn1nab1tb8n0SxZA+y+Cup5F/BbIcTpmSh/iGx8myBFb+oYC3V7dXMcF5dmTDfpQESLEV
	 4pZAt3rKyVJpfKJ1f8Qhti+aVHtp4MvPjiZ8jHhLlkS4RQfe6KcjutZS+yQeDrZGmgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OjS6lF37;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3DE606A336
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B3DE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OjS6lF37
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4ba078f26f4so262105e9.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116113; x=1795720913; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZxKuaQ3gr1F8JRDyLliq4Asg6s39aWAxeOoWBrwBGg=;
        b=OjS6lF37LpZTHrPgx/QI39m7UFh8BFJe4Ovvg5zWoDsq8g687XsQVwvqN4pTExpWNb
         MqPeL++J687CoOA0iTUx3QuJFT/NsnSf7I0sJPCWF7I+yBMozCjuBPkAr3jau8o2rNfJ
         b2IsJYiQ/CX6PwlF8eumPESM9z/eOvGsEg/Y0XQdLx8+LSMXqtjJ4chDMEmxk6mHc/1C
         mZDYqh5YtvZpf9rgm2WUreJsZbac5/QJOVNkymmUt7Vy4RrqlilRlJhne0YugDryNipa
         9gulmFR7jYMnCkI90k39TGhDFfS5QISB9L0jeQI3SaP7OLChQ+CLgwy2N+vQBvrafWr4
         ELJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116113; x=1795720913;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZxKuaQ3gr1F8JRDyLliq4Asg6s39aWAxeOoWBrwBGg=;
        b=B327VY+mibNe7whoAM6Kvipnuq+WyIE0PR2pIFelz77/8UZV8WlRZzHlw5h7rODSoh
         sQt8caEPwu6H5OoZVF7OEQY0i2iY+hiP8yHFv5YXMtKXBJOVi8RURbQOeeKFb2+/KAWS
         rNIMg3Im15ihV2F3mqJjY7J+zatRIut4/xF1lATYWKyn+sZZSlIX/4cmXa4gaEEba965
         ELH7MimSQa7XigwMOLG4aziefmdOWXyMGyrCmgvC4bSysjbKuQCgcaQ3imOHJC+crfa2
         KTofJtgaumDR0bixLW+77/Hd42+M7s8iVjK5DmsBrEIlzeRx0ART2n/X3wPN1eVYz2Bq
         VI1w==
X-Forwarded-Encrypted: i=1; AL+hErEUOyvuWTwEmVw3WPHJE8QZXsal7EIE16u2UhfMv3XpSFiP789sz7tpxLjvUprRBq7zIqjtvHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1D4f/d3VisJQ+irAnQpToi8P6ChxfFAU3SoQfUlZNX5HFrr1B
	G3H+8nzyt/fjOtSDskxZZ1e+sgVmSJuGzLV8YfYDoJuZnfiy9OpeVbNdjiwRyR8gZLSrK41u5A=
	=
X-Received: from wmpf29.prod.google.com ([2002:a05:600c:491d:b0:4a1:ae53:2fe9])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c11:b0:4a1:e57b:667c
 with SMTP id 5b1f17b1804b1-4bb8881c357mr11184885e9.26.1795116113324; Thu, 19
 Nov 2026 11:21:53 -0800 (PST)
Date: Thu, 19 Nov 2026 20:21:52 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119192152.2643304-1-dmnk@google.com>
Subject: [PATCH net] inet: reject multicast and broadcast bind addresses on SOCK_STREAM
From: Dominik Maier <dmnk@google.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Simon Horman <horms@kernel.org>, Joanne Koong <joannelkoong@gmail.com>, netdev@vger.kernel.org, 
	dmnk+artist@google.com, Dominik Maier <dmnk@google.com>
Content-Type: text/plain; charset="UTF-8"

__inet6_bind() already rejects native IPv6 multicast addresses on
SOCK_STREAM sockets with -EINVAL. However, __inet_bind() and the
IPV6_ADDR_MAPPED branch of __inet6_bind() allow binding SOCK_STREAM
sockets to IPv4 multicast and broadcast addresses.

When binding a non-INADDR_ANY RTN_MULTICAST or RTN_BROADCAST address,
__inet_bind() stores the non-unicast address in inet->inet_rcv_saddr
while clearing inet->inet_saddr to 0. Because bind conflict checks
compare receive addresses, binding 224.0.0.1:PORT does not conflict with
another user's exclusive unicast 127.0.0.1:PORT socket. On a subsequent
active tcp_v4_connect(), seeing !inet->inet_saddr causes the kernel to
call inet_bhash2_update_saddr(), relocating the active-open socket into
the unicast (port, saddr) bhash2 bucket alongside the exclusive socket
without re-evaluating inet_csk_bind_conflict() (note that this affects
active-open bhash2 rebinding and port occupancy rather than passive
lhash2 SYN delivery).

Reject non-INADDR_ANY RTN_MULTICAST and RTN_BROADCAST addresses on
SOCK_STREAM sockets with -EINVAL in __inet_bind() and in the
IPV6_ADDR_MAPPED path of __inet6_bind(), matching native IPv6 stream
socket validation while preserving INADDR_ANY (0.0.0.0) wildcard binds.

This issue was discovered with an AI-assisted code review tool (ARTIST)
and reproduced in QEMU/KVM on an unmodified v7.4-rc3 kernel without
kernel modifications or error injection; a standalone reproducer is
available upon maintainers' request. The fix was compile-tested with
-Werror and checked with checkpatch.pl --strict; an equivalent fix was
verified against the reproducer in QEMU/KVM.

Fixes: 28044fc1d495 ("net: Add a bhash2 table hashed by port and address")
Cc: stable@vger.kernel.org
Signed-off-by: Dominik Maier <dmnk@google.com>
---
 net/ipv4/af_inet.c  | 6 ++++++
 net/ipv6/af_inet6.c | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index 8822bae..b1ea554 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -500,6 +500,12 @@ int __inet_bind(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len,
 	tb_id = l3mdev_fib_table_by_index(net, sk->sk_bound_dev_if) ? : tb_id;
 	chk_addr_ret = inet_addr_type_table(net, addr->sin_addr.s_addr, tb_id);
 
+	err = -EINVAL;
+	if (sk->sk_type == SOCK_STREAM &&
+	    addr->sin_addr.s_addr != htonl(INADDR_ANY) &&
+	    (chk_addr_ret == RTN_MULTICAST || chk_addr_ret == RTN_BROADCAST))
+		goto out;
+
 	/* Not specified by any standard per-se, however it breaks too
 	 * many applications when removed.  It is unfortunate since
 	 * allowing applications to make a non-local bind solves
diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
index a9b8b4b..ab7da0c 100644
--- a/net/ipv6/af_inet6.c
+++ b/net/ipv6/af_inet6.c
@@ -324,6 +324,14 @@ int __inet6_bind(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len,
 		chk_addr_ret = inet_addr_type_dev_table(net, dev, v4addr);
 		rcu_read_unlock();
 
+		if (sk->sk_type == SOCK_STREAM &&
+		    v4addr != htonl(INADDR_ANY) &&
+		    (chk_addr_ret == RTN_MULTICAST ||
+		     chk_addr_ret == RTN_BROADCAST)) {
+			err = -EINVAL;
+			goto out;
+		}
+
 		if (!inet_addr_valid_or_nonlocal(net, inet, v4addr,
 						 chk_addr_ret)) {
 			err = -EADDRNOTAVAIL;
-- 
2.56.1.750.gf70dc682cf-goog

